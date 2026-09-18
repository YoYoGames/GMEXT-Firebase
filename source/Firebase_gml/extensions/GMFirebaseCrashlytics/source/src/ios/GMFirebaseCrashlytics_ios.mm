#import <Foundation/Foundation.h>

#include <cstdint>
#include <string_view>

#import <FirebaseCore/FirebaseCore.h>
#import <FirebaseCrashlytics/FirebaseCrashlytics.h>

#import "GMFirebaseCrashlytics_ios.h"


namespace
{
    using GMFunction = gm::wire::GMFunction;

    // The SDK answers checkForUnsentReports once per execution; a second call
    // is resolved false with an SDK error log, indistinguishable from "no
    // reports" unless tracked here.
    static bool gCheckedForUnsentReports = false;


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


    // [FIRCrashlytics crashlytics] resolves through the default FIRApp's
    // component container and is nil until firebase_app_initialize() has
    // configured the app; every message to it would then be a silent no-op.
    static FIRCrashlytics *crashlytics()
    {
        if ([FIRApp defaultApp] == nil)
        {
            NSLog(
                @"GMFirebaseCrashlytics: Firebase default app not configured; call firebase_app_initialize first"
            );
            return nil;
        }

        return [FIRCrashlytics crashlytics];
    }
}


@implementation GMFirebaseCrashlytics


- (void)firebase_crashlytics_set_collection_enabled:
    (bool)enabled
{
    [crashlytics() setCrashlyticsCollectionEnabled:enabled ? YES : NO];
}


- (bool)firebase_crashlytics_is_collection_enabled
{
    return [crashlytics() isCrashlyticsCollectionEnabled] ? true : false;
}


- (bool)firebase_crashlytics_did_crash_on_previous_execution
{
    return [crashlytics() didCrashDuringPreviousExecution] ? true : false;
}


- (void)firebase_crashlytics_log:
    (std::string_view)message
{
    [crashlytics() log:toNSString(message)];
}


- (void)firebase_crashlytics_set_user_id:
    (std::string_view)user_id
{
    [crashlytics() setUserID:toNSString(user_id)];
}


- (void)firebase_crashlytics_set_custom_key_string:
    (std::string_view)key
    value:
    (std::string_view)value
{
    [crashlytics() setCustomValue:toNSString(value) forKey:toNSString(key)];
}


- (void)firebase_crashlytics_set_custom_key_real:
    (std::string_view)key
    value:
    (double)value
{
    [crashlytics() setCustomValue:@(value) forKey:toNSString(key)];
}


- (void)firebase_crashlytics_set_custom_key_bool:
    (std::string_view)key
    value:
    (bool)value
{
    // Crashlytics stores [value description], so an NSNumber would reach the
    // console as 1/0 where Android writes true/false for the same GML call.
    [crashlytics() setCustomValue:(value ? @"true" : @"false") forKey:toNSString(key)];
}


- (void)firebase_crashlytics_record_error:
    (std::string_view)domain
    code:
    (std::int32_t)code
    message:
    (std::string_view)message
{
    FIRCrashlytics *instance = crashlytics();

    if (instance == nil)
        return;

    NSString *errorDomain =
        domain.empty()
            ? @"GMFirebaseCrashlytics"
            : toNSString(domain);

    NSError *error =
        [NSError
            errorWithDomain:errorDomain
            code:code
            userInfo:@{ NSLocalizedDescriptionKey : toNSString(message) }];

    [instance recordError:error];
}


- (void)firebase_crashlytics_check_for_unsent_reports:
    (GMFunction)callback
{
    FIRCrashlytics *instance = crashlytics();

    if (instance == nil)
    {
        callback.call(
            false,
            false,
            std::string_view{"Firebase default app not configured; call firebase_app_initialize first"}
        );
        return;
    }

    if (gCheckedForUnsentReports)
    {
        callback.call(
            false,
            false,
            std::string_view{"checkForUnsentReports can only be called once per execution on iOS"}
        );
        return;
    }

    gCheckedForUnsentReports = true;

    [instance checkForUnsentReportsWithCompletion:^(BOOL hasUnsentReports)
    {
        callback.call(
            true,
            hasUnsentReports ? true : false,
            std::string_view{""}
        );
    }];
}


- (void)firebase_crashlytics_send_unsent_reports
{
    [crashlytics() sendUnsentReports];
}


- (void)firebase_crashlytics_delete_unsent_reports
{
    [crashlytics() deleteUnsentReports];
}


- (void)firebase_crashlytics_test_crash
{
    // Deferred one run-loop turn so the exception never unwinds through the
    // bridge's C++ frames; the ObjC equivalent of the Android runOnUiThread.
    dispatch_async(
        dispatch_get_main_queue(),
        ^{
            [NSException
                raise:@"GMFirebaseCrashlyticsTestCrash"
                format:@"GMFirebase Crashlytics test crash"];
        }
    );
}


@end
