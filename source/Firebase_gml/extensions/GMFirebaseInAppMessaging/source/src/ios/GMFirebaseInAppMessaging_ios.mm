#import <Foundation/Foundation.h>

#include <memory>
#include <mutex>
#include <optional>
#include <string>
#include <string_view>
#include <type_traits>
#include <utility>

#import <FirebaseCore/FirebaseCore.h>
#import <FirebaseInAppMessaging/FirebaseInAppMessaging.h>

#import "GMFirebaseInAppMessaging_ios.h"


namespace
{
    using GMFunction = gm::wire::GMFunction;


    static NSString *toNSString(
        std::string_view value)
    {
        if (value.empty())
            return @"";

        NSString *result =
            [[NSString alloc]
                initWithBytes:value.data()
                length:value.size()
                encoding:NSUTF8StringEncoding];

        return result != nil ? result : @"";
    }


    static std::string toString(
        NSString *value)
    {
        if (value == nil)
            return {};

        const char *utf8 =
            value.UTF8String;

        return utf8 != nullptr
            ? std::string(utf8)
            : std::string();
    }


    static std::string messageTypeString(
        FIRInAppMessagingDisplayMessageType type)
    {
        switch (type)
        {
            case FIRInAppMessagingDisplayMessageTypeModal:
                return "modal";

            case FIRInAppMessagingDisplayMessageTypeBanner:
                return "banner";

            case FIRInAppMessagingDisplayMessageTypeImageOnly:
                return "image_only";

            case FIRInAppMessagingDisplayMessageTypeCard:
                return "card";

            default:
                return "unknown";
        }
    }


    struct MessageInfo
    {
        std::string messageId;
        std::string campaignName;
        bool isTestMessage = false;
        std::string messageType;
        std::string dataJson;
    };


    struct ClickInfo
    {
        MessageInfo message;
        std::string actionUrl;
        std::string actionText;
    };


    struct DisplayErrorInfo
    {
        MessageInfo message;
        std::string errorMessage;
    };


    // Callback and pending-event state: written by the GML-facing setters,
    // read by the FIAM delegate. One lock over all of it, as on Android.
    static std::mutex gStateMutex;

    static std::shared_ptr<GMFunction> gImpressionCallback;
    static std::shared_ptr<GMFunction> gClickCallback;
    static std::shared_ptr<GMFunction> gDismissCallback;
    static std::shared_ptr<GMFunction> gDisplayErrorCallback;

    // clear_callbacks disables lifecycle reattachment until a callback is set again.
    static bool gBridgeEnabled = true;

    // An event arriving before its callback exists is held (latest wins) and
    // replayed once the callback is set, as the Android layer does.
    static std::optional<MessageInfo> gPendingImpression;
    static std::optional<ClickInfo> gPendingClick;
    static std::optional<MessageInfo> gPendingDismiss;
    static std::optional<DisplayErrorInfo> gPendingDisplayError;


    static std::string jsonString(
        NSDictionary *dictionary)
    {
        if (dictionary == nil || dictionary.count == 0)
            return "{}";

        if (![NSJSONSerialization
                isValidJSONObject:dictionary])
        {
            return "{}";
        }

        NSError *error = nil;

        NSData *jsonData =
            [NSJSONSerialization
                dataWithJSONObject:dictionary
                options:0
                error:&error];

        if (jsonData == nil || error != nil)
            return "{}";

        NSString *json =
            [[NSString alloc]
                initWithData:jsonData
                encoding:NSUTF8StringEncoding];

        return toString(json != nil ? json : @"{}");
    }


    static MessageInfo messageInfo(
        FIRInAppMessagingDisplayMessage *message)
    {
        MessageInfo info;

        if (message == nil)
        {
            info.messageType = "unknown";
            info.dataJson = "{}";
            return info;
        }

        FIRInAppMessagingCampaignInfo *campaign =
            message.campaignInfo;

        if (campaign != nil)
        {
            info.messageId =
                toString(campaign.messageID);

            info.campaignName =
                toString(campaign.campaignName);

            info.isTestMessage =
                campaign.renderAsTestMessage;
        }

        info.messageType =
            messageTypeString(message.type);

        info.dataJson =
            jsonString(message.appData);

        return info;
    }


    // Android reports InAppMessagingErrorReason.name(); map the iOS NSError
    // onto the same four names so GML sees one vocabulary on both platforms.
    static std::string displayErrorReason(
        NSError *error)
    {
        if (error == nil)
            return "UNSPECIFIED_RENDER_ERROR";

        if ([error.domain isEqualToString:NSURLErrorDomain])
            return "IMAGE_FETCH_ERROR";

        if ([error.domain isEqualToString:FIRInAppMessagingErrorDomain])
        {
            // Code 1 is the SDK's NonImageMimetypeFromImageURL; the other codes
            // on this domain are fetch failures.
            return error.code == 1
                ? "IMAGE_UNSUPPORTED_FORMAT"
                : "IMAGE_FETCH_ERROR";
        }

        if ([error.domain isEqualToString:@"com.firebase.inappmessaging.display"])
        {
            return error.code == FIAMDisplayRenderErrorTypeImageDataInvalid
                ? "IMAGE_DISPLAY_ERROR"
                : "UNSPECIFIED_RENDER_ERROR";
        }

        return "UNSPECIFIED_RENDER_ERROR";
    }


    template <typename F>
    static void runOnMain(F &&function)
    {
        using FunctionType =
            typename std::decay<F>::type;

        if ([NSThread isMainThread])
        {
            function();
            return;
        }

        auto work =
            std::make_shared<FunctionType>(
                std::forward<F>(function));

        dispatch_async(
            dispatch_get_main_queue(),
            ^{
                (*work)();
            }
        );
    }


    // Impression and dismiss carry the same arguments.
    static void invokeMessageEvent(
        std::shared_ptr<GMFunction> callback,
        MessageInfo info)
    {
        runOnMain(
            [callback, info]()
            {
                callback->call(
                    std::string_view{info.messageId},
                    std::string_view{info.campaignName},
                    info.isTestMessage,
                    std::string_view{info.messageType},
                    std::string_view{info.dataJson}
                );
            }
        );
    }


    static void invokeClick(
        std::shared_ptr<GMFunction> callback,
        ClickInfo info)
    {
        runOnMain(
            [callback, info]()
            {
                callback->call(
                    std::string_view{info.message.messageId},
                    std::string_view{info.message.campaignName},
                    info.message.isTestMessage,
                    std::string_view{info.message.messageType},
                    std::string_view{info.actionUrl},
                    std::string_view{info.actionText},
                    std::string_view{info.message.dataJson}
                );
            }
        );
    }


    static void invokeDisplayError(
        std::shared_ptr<GMFunction> callback,
        DisplayErrorInfo info)
    {
        runOnMain(
            [callback, info]()
            {
                callback->call(
                    std::string_view{info.message.messageId},
                    std::string_view{info.message.campaignName},
                    info.message.isTestMessage,
                    std::string_view{info.message.messageType},
                    std::string_view{info.errorMessage},
                    std::string_view{info.message.dataJson}
                );
            }
        );
    }
}


@interface GMFirebaseInAppMessaging ()
    <FIRInAppMessagingDisplayDelegate>
{
    id appReadyObserver;
}

- (void)installFiamDelegate:(NSString *)reason;

@end


@implementation GMFirebaseInAppMessaging


// -----------------------------------------------------------------------------
// GameMaker / iOS lifecycle
// -----------------------------------------------------------------------------

- (instancetype)init
{
    self = [super init];

    if (self)
    {
        // FirebaseCore posts this at the end of every configure, so the
        // delegate attaches as soon as firebase_app_initialize() has run,
        // whichever order the GML events come in. The name is FIRApp.m's
        // kFIRAppReadyToConfigureSDKNotification: internal, and marked there
        // for eventual removal. If it goes, the setter and onResume retries
        // below still attach, only later.
        __weak GMFirebaseInAppMessaging *weakSelf = self;

        appReadyObserver =
            [[NSNotificationCenter defaultCenter]
                addObserverForName:@"FIRAppReadyToConfigureSDKNotification"
                object:nil
                queue:[NSOperationQueue mainQueue]
                usingBlock:^(NSNotification *notification)
                {
                    (void)notification;
                    [weakSelf installFiamDelegate:@"app_ready"];
                }];
    }

    return self;
}


- (void)dealloc
{
    if (appReadyObserver != nil)
    {
        [[NSNotificationCenter defaultCenter]
            removeObserver:appReadyObserver];
    }
}


- (void)onResume
{
    [self installFiamDelegate:@"onResume"];
}


- (void)installFiamDelegate:(NSString *)reason
{
    {
        std::lock_guard<std::mutex> lock(gStateMutex);

        if (!gBridgeEnabled)
            return;
    }

    // The separate FIAM extension can be created before the main Firebase
    // extension calls FIRApp configure. Do not touch FIAM until a default
    // Firebase app exists. Callback setters retry this after GML initialization.
    if ([FIRApp defaultApp] == nil)
    {
        NSLog(
            @"GMFirebaseInAppMessaging: Firebase default app not ready; delegate not attached (%@)",
            reason
        );
        return;
    }

    [FIRInAppMessaging inAppMessaging].delegate = self;

    NSLog(
        @"GMFirebaseInAppMessaging: FIAM delegate attached: %@",
        reason
    );
}


// -----------------------------------------------------------------------------
// Runtime controls
// -----------------------------------------------------------------------------

- (void)firebase_in_app_messaging_set_automatic_data_collection_enabled:
    (bool)enabled
{
    [FIRInAppMessaging inAppMessaging]
        .automaticDataCollectionEnabled =
            enabled ? YES : NO;
}


- (bool)firebase_in_app_messaging_is_automatic_data_collection_enabled
{
    return
        [FIRInAppMessaging inAppMessaging]
            .automaticDataCollectionEnabled
        ? true
        : false;
}


- (void)firebase_in_app_messaging_set_messages_suppressed:
    (bool)suppressed
{
    [FIRInAppMessaging inAppMessaging]
        .messageDisplaySuppressed =
            suppressed ? YES : NO;
}


- (bool)firebase_in_app_messaging_are_messages_suppressed
{
    return
        [FIRInAppMessaging inAppMessaging]
            .messageDisplaySuppressed
        ? true
        : false;
}


- (void)firebase_in_app_messaging_trigger_event:
    (std::string_view)event_name
{
    if (event_name.empty())
        return;

    [[FIRInAppMessaging inAppMessaging]
        triggerEvent:toNSString(event_name)];
}


// -----------------------------------------------------------------------------
// Callback registration
// -----------------------------------------------------------------------------

- (void)firebase_in_app_messaging_set_impression_callback:
    (GMFunction)callback
{
    auto shared =
        std::make_shared<GMFunction>(
            std::move(callback));

    std::optional<MessageInfo> pending;

    {
        std::lock_guard<std::mutex> lock(gStateMutex);

        gBridgeEnabled = true;
        gImpressionCallback = shared;
        pending = std::exchange(gPendingImpression, std::nullopt);
    }

    [self installFiamDelegate:@"set_callback"];

    if (pending)
        invokeMessageEvent(shared, *pending);
}


- (void)firebase_in_app_messaging_set_click_callback:
    (GMFunction)callback
{
    auto shared =
        std::make_shared<GMFunction>(
            std::move(callback));

    std::optional<ClickInfo> pending;

    {
        std::lock_guard<std::mutex> lock(gStateMutex);

        gBridgeEnabled = true;
        gClickCallback = shared;
        pending = std::exchange(gPendingClick, std::nullopt);
    }

    [self installFiamDelegate:@"set_callback"];

    if (pending)
        invokeClick(shared, *pending);
}


- (void)firebase_in_app_messaging_set_dismiss_callback:
    (GMFunction)callback
{
    auto shared =
        std::make_shared<GMFunction>(
            std::move(callback));

    std::optional<MessageInfo> pending;

    {
        std::lock_guard<std::mutex> lock(gStateMutex);

        gBridgeEnabled = true;
        gDismissCallback = shared;
        pending = std::exchange(gPendingDismiss, std::nullopt);
    }

    [self installFiamDelegate:@"set_callback"];

    if (pending)
        invokeMessageEvent(shared, *pending);
}


- (void)firebase_in_app_messaging_set_display_error_callback:
    (GMFunction)callback
{
    auto shared =
        std::make_shared<GMFunction>(
            std::move(callback));

    std::optional<DisplayErrorInfo> pending;

    {
        std::lock_guard<std::mutex> lock(gStateMutex);

        gBridgeEnabled = true;
        gDisplayErrorCallback = shared;
        pending = std::exchange(gPendingDisplayError, std::nullopt);
    }

    [self installFiamDelegate:@"set_callback"];

    if (pending)
        invokeDisplayError(shared, *pending);
}


- (void)firebase_in_app_messaging_clear_callbacks
{
    {
        std::lock_guard<std::mutex> lock(gStateMutex);

        gBridgeEnabled = false;

        gImpressionCallback.reset();
        gClickCallback.reset();
        gDismissCallback.reset();
        gDisplayErrorCallback.reset();

        gPendingImpression.reset();
        gPendingClick.reset();
        gPendingDismiss.reset();
        gPendingDisplayError.reset();
    }

    [FIRInAppMessaging inAppMessaging].delegate =
        nil;
}


// -----------------------------------------------------------------------------
// FIRInAppMessagingDisplayDelegate
// -----------------------------------------------------------------------------

- (void)impressionDetectedForMessage:
    (FIRInAppMessagingDisplayMessage *)inAppMessage
{
    MessageInfo info =
        messageInfo(inAppMessage);

    std::shared_ptr<GMFunction> callback;

    {
        std::lock_guard<std::mutex> lock(gStateMutex);

        if (!gBridgeEnabled)
            return;

        callback = gImpressionCallback;

        if (!callback)
        {
            gPendingImpression = info;

            NSLog(
                @"GMFirebaseInAppMessaging: FIAM impression buffered: %@",
                toNSString(info.campaignName)
            );
            return;
        }
    }

    NSLog(
        @"GMFirebaseInAppMessaging: FIAM impression received: %@",
        toNSString(info.campaignName)
    );

    invokeMessageEvent(callback, info);
}


- (void)messageClicked:
    (FIRInAppMessagingDisplayMessage *)inAppMessage
    withAction:
    (FIRInAppMessagingAction *)action
{
    ClickInfo info;

    info.message =
        messageInfo(inAppMessage);

    if (action.actionURL != nil)
    {
        info.actionUrl =
            toString(
                action.actionURL.absoluteString);
    }

    info.actionText =
        toString(action.actionText);

    std::shared_ptr<GMFunction> callback;

    {
        std::lock_guard<std::mutex> lock(gStateMutex);

        if (!gBridgeEnabled)
            return;

        callback = gClickCallback;

        if (!callback)
        {
            gPendingClick = info;

            NSLog(
                @"GMFirebaseInAppMessaging: FIAM click buffered: %@",
                toNSString(info.message.campaignName)
            );
            return;
        }
    }

    NSLog(
        @"GMFirebaseInAppMessaging: FIAM click received: %@",
        toNSString(info.message.campaignName)
    );

    invokeClick(callback, info);
}


- (void)messageDismissed:
    (FIRInAppMessagingDisplayMessage *)inAppMessage
    dismissType:
    (FIRInAppMessagingDismissType)dismissType
{
    (void)dismissType;

    MessageInfo info =
        messageInfo(inAppMessage);

    std::shared_ptr<GMFunction> callback;

    {
        std::lock_guard<std::mutex> lock(gStateMutex);

        if (!gBridgeEnabled)
            return;

        callback = gDismissCallback;

        if (!callback)
        {
            gPendingDismiss = info;

            NSLog(
                @"GMFirebaseInAppMessaging: FIAM dismiss buffered: %@",
                toNSString(info.campaignName)
            );
            return;
        }
    }

    NSLog(
        @"GMFirebaseInAppMessaging: FIAM dismiss received: %@",
        toNSString(info.campaignName)
    );

    invokeMessageEvent(callback, info);
}


- (void)displayErrorForMessage:
    (FIRInAppMessagingDisplayMessage *)inAppMessage
    error:
    (NSError *)error
{
    DisplayErrorInfo info;

    info.message =
        messageInfo(inAppMessage);

    info.errorMessage =
        displayErrorReason(error);

    std::shared_ptr<GMFunction> callback;

    {
        std::lock_guard<std::mutex> lock(gStateMutex);

        if (!gBridgeEnabled)
            return;

        callback = gDisplayErrorCallback;

        if (!callback)
        {
            gPendingDisplayError = info;

            NSLog(
                @"GMFirebaseInAppMessaging: FIAM display error buffered: %@ / %@ (%@)",
                toNSString(info.message.campaignName),
                toNSString(info.errorMessage),
                error
            );
            return;
        }
    }

    NSLog(
        @"GMFirebaseInAppMessaging: FIAM display error received: %@ / %@ (%@)",
        toNSString(info.message.campaignName),
        toNSString(info.errorMessage),
        error
    );

    invokeDisplayError(callback, info);
}


@end
