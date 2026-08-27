
#import <Foundation/Foundation.h>

#include <memory>
#include <string>
#include <string_view>
#include <type_traits>
#include <utility>

@import FirebaseInAppMessaging;

#import "GMFirebaseInAppMessaging_ios.h"


namespace
{
    using GMFunction = gm::wire::GMFunction;

    static std::shared_ptr<GMFunction> gImpressionCallback;
    static std::shared_ptr<GMFunction> gClickCallback;
    static std::shared_ptr<GMFunction> gDismissCallback;
    static std::shared_ptr<GMFunction> gDisplayErrorCallback;


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

        return result ?: @"";
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

        return toString(json ?: @"{}");
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
}


@interface GMFirebaseInAppMessaging ()
    <FIRInAppMessagingDisplayDelegate>
@end


@implementation GMFirebaseInAppMessaging


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
    gImpressionCallback =
        std::make_shared<GMFunction>(
            std::move(callback));

    [FIRInAppMessaging inAppMessaging].delegate =
        self;
}


- (void)firebase_in_app_messaging_set_click_callback:
    (GMFunction)callback
{
    gClickCallback =
        std::make_shared<GMFunction>(
            std::move(callback));

    [FIRInAppMessaging inAppMessaging].delegate =
        self;
}


- (void)firebase_in_app_messaging_set_dismiss_callback:
    (GMFunction)callback
{
    gDismissCallback =
        std::make_shared<GMFunction>(
            std::move(callback));

    [FIRInAppMessaging inAppMessaging].delegate =
        self;
}


- (void)firebase_in_app_messaging_set_display_error_callback:
    (GMFunction)callback
{
    gDisplayErrorCallback =
        std::make_shared<GMFunction>(
            std::move(callback));

    [FIRInAppMessaging inAppMessaging].delegate =
        self;
}


- (void)firebase_in_app_messaging_clear_callbacks
{
    [FIRInAppMessaging inAppMessaging].delegate =
        nil;

    gImpressionCallback.reset();
    gClickCallback.reset();
    gDismissCallback.reset();
    gDisplayErrorCallback.reset();
}


// -----------------------------------------------------------------------------
// FIRInAppMessagingDisplayDelegate
// -----------------------------------------------------------------------------

- (void)impressionDetectedForMessage:
    (FIRInAppMessagingDisplayMessage *)inAppMessage
{
    auto callback =
        gImpressionCallback;

    if (!callback)
        return;

    MessageInfo info =
        messageInfo(inAppMessage);

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


- (void)messageClicked:
    (FIRInAppMessagingDisplayMessage *)inAppMessage
    withAction:
    (FIRInAppMessagingAction *)action
{
    auto callback =
        gClickCallback;

    if (!callback)
        return;

    MessageInfo info =
        messageInfo(inAppMessage);

    std::string actionUrl;

    if (action.actionURL != nil)
    {
        actionUrl =
            toString(
                action.actionURL.absoluteString);
    }

    std::string actionText =
        toString(action.actionText);

    runOnMain(
        [
            callback,
            info,
            actionUrl,
            actionText
        ]()
        {
            callback->call(
                std::string_view{info.messageId},
                std::string_view{info.campaignName},
                info.isTestMessage,
                std::string_view{info.messageType},
                std::string_view{actionUrl},
                std::string_view{actionText},
                std::string_view{info.dataJson}
            );
        }
    );
}


- (void)messageDismissed:
    (FIRInAppMessagingDisplayMessage *)inAppMessage
    dismissType:
    (FIRInAppMessagingDismissType)dismissType
{
    (void)dismissType;

    auto callback =
        gDismissCallback;

    if (!callback)
        return;

    MessageInfo info =
        messageInfo(inAppMessage);

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


- (void)displayErrorForMessage:
    (FIRInAppMessagingDisplayMessage *)inAppMessage
    error:
    (NSError *)error
{
    auto callback =
        gDisplayErrorCallback;

    if (!callback)
        return;

    MessageInfo info =
        messageInfo(inAppMessage);

    std::string errorMessage =
        error != nil
            ? toString(error.localizedDescription)
            : std::string("Unknown FIAM display error");

    runOnMain(
        [
            callback,
            info,
            errorMessage
        ]()
        {
            callback->call(
                std::string_view{info.messageId},
                std::string_view{info.campaignName},
                info.isTestMessage,
                std::string_view{info.messageType},
                std::string_view{errorMessage},
                std::string_view{info.dataJson}
            );
        }
    );
}


@end
