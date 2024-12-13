#import "YYFirebaseCrashlytics.h"
#import "FirebaseUtils.h"

// Error Codes
static const double kFirebaseCrashlyticsSuccess = 0.0;
static const double kFirebaseCrashlyticsErrorInvalidParameters = -1.0;

@interface YYFirebaseCrashlytics ()

// Private methods and properties can be declared here if needed.

#pragma mark - Helper Methods

- (BOOL)isStringNullOrEmpty:(NSString *)string;

@end

@implementation YYFirebaseCrashlytics

- (instancetype)init {
    self = [super init];
    if (self) {      
        __weak YYFirebaseCrashlytics *weakSelf = self;
        [[FirebaseUtils sharedInstance] submitAsyncTask:^{
            __strong YYFirebaseCrashlytics *strongSelf = weakSelf;
            if (!strongSelf) return;

            // Read the user's preference from NSUserDefaults
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            BOOL isCrashlyticsEnabled;
            
            if ([defaults objectForKey:@"CrashlyticsCollectionEnabled"] != nil) {
                isCrashlyticsEnabled = [defaults boolForKey:@"CrashlyticsCollectionEnabled"];
            } else {
                // If the user hasn't set a preference, read from Info.plist
                NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
                NSNumber *crashlyticsEnabled = infoDictionary[@"FirebaseCrashlyticsCollectionEnabled"];
                if (crashlyticsEnabled != nil) {
                    isCrashlyticsEnabled = [crashlyticsEnabled boolValue];
                } else {
                    // Default to YES if not set in Info.plist
                    isCrashlyticsEnabled = YES;
                }
            }

            strongSelf.isAutoDataCollectionEnabled = isCrashlyticsEnabled;
        }];
    }
    return self;
}

#pragma mark - User Identification and Custom Keys

- (double)FirebaseCrashlytics_SetUserIdentifier:(NSString *)userId {
    [[FIRCrashlytics crashlytics] setUserID:userId];
    return kFirebaseCrashlyticsSuccess;
}

- (double)FirebaseCrashlytics_SetCustomKey:(NSString *)key value:(NSString *)value {
    if (key && value) {
        [[FIRCrashlytics crashlytics] setCustomValue:value forKey:key];
        return kFirebaseCrashlyticsSuccess;
    } else {
        return kFirebaseCrashlyticsErrorInvalidParameters;
    }
}

- (double)FirebaseCrashlytics_SetCustomKeys:(NSString *)jsonString {
    if (!jsonString) {
        NSLog(@"FirebaseCrashlytics_SetCustomKeys: JSON string is nil.");
        return kFirebaseCrashlyticsErrorInvalidParameters;
    }

    __weak YYFirebaseCrashlytics *weakSelf = self;
    [[FirebaseUtils sharedInstance] submitAsyncTask:^{
        __strong YYFirebaseCrashlytics *strongSelf = weakSelf;
        if (!strongSelf) return;

        NSError *jsonError;
        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *keyValues = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&jsonError];

        if (jsonError) {
            NSLog(@"FirebaseCrashlytics_SetCustomKeys: Error parsing JSON - %@", jsonError.localizedDescription);
            // Send event back to game engine indicating error
            NSMutableDictionary *data = [NSMutableDictionary dictionary];
            [data setObject:@(0) forKey:@"success"];
            [data setObject:jsonError.localizedDescription forKey:@"error"];
            [FirebaseUtils sendSocialAsyncEvent:@"FirebaseCrashlytics_SetCustomKeys" data:data];
            return;
        }

        [[FIRCrashlytics crashlytics] setCustomKeysAndValues:keyValues];

        // Send event back indicating success
        NSMutableDictionary *data = [NSMutableDictionary dictionary];
        [data setObject:@(1) forKey:@"success"];
        [FirebaseUtils sendSocialAsyncEvent:@"FirebaseCrashlytics_SetCustomKeys" data:data];
    }];

    return kFirebaseCrashlyticsSuccess;
}

#pragma mark - Logging and Exception Handling

- (double)FirebaseCrashlytics_Log:(NSString *)message {
    if (message) {
        [[FIRCrashlytics crashlytics] log:message];
        return kFirebaseCrashlyticsSuccess;
    }
    return kFirebaseCrashlyticsErrorInvalidParameters;
}

- (void)FirebaseCrashlytics_Crash:(NSString *)message {
    NSException *exception = [NSException exceptionWithName:@"FirebaseCrashlytics_Crash" reason:message userInfo:nil];
    @throw exception;
}

- (double)FirebaseCrashlytics_RecordException:(NSString *)message {
    FIRExceptionModel *exceptionModel = [FIRExceptionModel exceptionModelWithName:@"FirebaseCrashlytics_RecordException" reason:message];
    [[FIRCrashlytics crashlytics] recordExceptionModel:exceptionModel];
    return kFirebaseCrashlyticsSuccess;
}

#pragma mark - Crashlytics Collection Control

- (double)FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set:(double)enabled {
    self.isAutoDataCollectionEnabled = enabled >= 0.5;
    [[FIRCrashlytics crashlytics] setCrashlyticsCollectionEnabled:self.isAutoDataCollectionEnabled];

    __weak YYFirebaseCrashlytics *weakSelf = self;
    [[FirebaseUtils sharedInstance] submitAsyncTask:^{
        __strong YYFirebaseCrashlytics *strongSelf = weakSelf;
        if (!strongSelf) return;

        // Store the preference
        [[NSUserDefaults standardUserDefaults] setBool:strongSelf.isAutoDataCollectionEnabled forKey:@"CrashlyticsCollectionEnabled"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }];

    return kFirebaseCrashlyticsSuccess;
}

- (double)FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check {
    return self.isAutoDataCollectionEnabled ? 1.0 : 0.0;
}

- (double)FirebaseCrashlytics_DidCrashOnPreviousExecution {
    BOOL didCrash = [[FIRCrashlytics crashlytics] didCrashDuringPreviousExecution];
    return didCrash ? 1.0 : 0.0;
}

#pragma mark - Unsent Reports Management

- (double)FirebaseCrashlytics_UnsentReports_Delete {
    [[FirebaseUtils sharedInstance] submitAsyncTask:^{
        [[FIRCrashlytics crashlytics] deleteUnsentReports];
    }];
    return kFirebaseCrashlyticsSuccess;
}

- (double)FirebaseCrashlytics_UnsentReports_Send {
    [[FirebaseUtils sharedInstance] submitAsyncTask:^{
        [[FIRCrashlytics crashlytics] sendUnsentReports];
    }];
    return kFirebaseCrashlyticsSuccess;
}

- (double)FirebaseCrashlytics_UnsentReports_Check {
    __weak YYFirebaseCrashlytics *weakSelf = self;
    [[FIRCrashlytics crashlytics] checkAndUpdateUnsentReportsWithCompletion:^(FIRCrashlyticsReport * _Nullable report) {
        __strong YYFirebaseCrashlytics *strongSelf = weakSelf;
        if (!strongSelf) return;

        NSMutableDictionary *data = [NSMutableDictionary dictionary];
		[data setObject:@(report == nil ? 0 : 1) forKey:@"value"];
        [FirebaseUtils sendSocialAsyncEvent:@"FirebaseCrashlytics_UnsentReports_Check" data:data];
    }];
    return kFirebaseCrashlyticsSuccess;
}

#pragma mark - Helper Methods

- (BOOL)isStringNullOrEmpty:(NSString *)string {
    return string == nil || [string length] == 0;
}

@end
