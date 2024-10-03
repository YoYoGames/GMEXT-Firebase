#import "YYFirebaseCrashlytics.h"
#import <UIKit/UIKit.h>

const int EVENT_OTHER_SOCIAL = 70;

extern "C" int dsMapCreate();
extern "C" void dsMapAddInt(int _dsMap, char *_key, int _value);
extern "C" void dsMapAddDouble(int _dsMap, char *_key, double _value);
extern "C" void dsMapAddString(int _dsMap, char *_key, char *_value);
extern "C" void createSocialAsyncEventWithDSMap(int dsmapindex);

// Error Codes
static const double kFirebaseCrashlyticsSuccess = 0.0;
static const double kFirebaseCrashlyticsErrorInvalidParameters = -1.0;

@interface YYFirebaseCrashlytics ()

// Private methods and properties can be declared here if needed.

#pragma mark - Helper Methods

- (void)sendAsyncEventWithType:(NSString *)eventType data:(NSDictionary *)data;
- (BOOL)isStringNullOrEmpty:(NSString *)string;

@end

@implementation YYFirebaseCrashlytics

- (instancetype)init {
    self = [super init];
    if (self) {      
        // Configure Firebase with the default settings
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            if (![FIRApp defaultApp]) {
                [FIRApp configure];
            }
        });

        __weak YYFirebaseCrashlytics *weakSelf = self;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
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
        });
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
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
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
            [strongSelf sendAsyncEventWithType:@"FirebaseCrashlytics_SetCustomKeys" data:data];
            return;
        }

        [[FIRCrashlytics crashlytics] setCustomKeysAndValues:keyValues];

        // Send event back indicating success
        NSMutableDictionary *data = [NSMutableDictionary dictionary];
        [data setObject:@(1) forKey:@"success"];
        [strongSelf sendAsyncEventWithType:@"FirebaseCrashlytics_SetCustomKeys" data:data];
    });

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
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        __strong YYFirebaseCrashlytics *strongSelf = weakSelf;
        if (!strongSelf) return;

        // Store the preference
        [[NSUserDefaults standardUserDefaults] setBool:strongSelf.isAutoDataCollectionEnabled forKey:@"CrashlyticsCollectionEnabled"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    });

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
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[FIRCrashlytics crashlytics] deleteUnsentReports];
    });
    return kFirebaseCrashlyticsSuccess;
}

- (double)FirebaseCrashlytics_UnsentReports_Send {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[FIRCrashlytics crashlytics] sendUnsentReports];
    });
    return kFirebaseCrashlyticsSuccess;
}

- (double)FirebaseCrashlytics_UnsentReports_Check {
    __weak YYFirebaseCrashlytics *weakSelf = self;
    [[FIRCrashlytics crashlytics] checkAndUpdateUnsentReportsWithCompletion:^(FIRCrashlyticsReport * _Nullable report) {
        __strong YYFirebaseCrashlytics *strongSelf = weakSelf;
        if (!strongSelf) return;

        NSMutableDictionary *data = [NSMutableDictionary dictionary];
		[data setObject:@(report == nil ? 0 : 1) forKey:@"value"];
        [strongSelf sendAsyncEventWithType:@"FirebaseCrashlytics_UnsentReports_Check" data:data];
    }];
    return kFirebaseCrashlyticsSuccess;
}

#pragma mark - Helper Methods

- (void)sendAsyncEventWithType:(NSString *)eventType data:(NSDictionary *)data {
    dispatch_async(dispatch_get_main_queue(), ^{
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex, (char *)"type", (char *)[eventType UTF8String]);

        for (NSString *key in data) {
            id value = data[key];
            const char *cKey = [key UTF8String];

            if ([value isKindOfClass:[NSString class]]) {
                dsMapAddString(dsMapIndex, (char *)cKey, (char *)[value UTF8String]);
            } else if ([value isKindOfClass:[NSNumber class]]) {
                NSNumber *numberValue = (NSNumber *)value;
                const char *type = [numberValue objCType];

                // Handle BOOL
                if (strcmp(type, @encode(BOOL)) == 0 || strcmp(type, @encode(bool)) == 0 || strcmp(type, @encode(char)) == 0) {
                    int boolValue = [numberValue boolValue] ? 1 : 0;
                    dsMapAddInt(dsMapIndex, (char *)cKey, boolValue);
                }
                // Handle integer types within int range
                else if (strcmp(type, @encode(int)) == 0 ||
                         strcmp(type, @encode(short)) == 0 ||
                         strcmp(type, @encode(unsigned int)) == 0 ||
                         strcmp(type, @encode(unsigned short)) == 0) {

                    int intValue = [numberValue intValue];
                    dsMapAddInt(dsMapIndex, (char *)cKey, intValue);
                }
                // Handle floating-point numbers
                else if (strcmp(type, @encode(float)) == 0 ||
                         strcmp(type, @encode(double)) == 0) {

                    double doubleValue = [numberValue doubleValue];
                    dsMapAddDouble(dsMapIndex, (char *)cKey, doubleValue);
                }
                // Handle larger integer types
                else if (strcmp(type, @encode(long)) == 0 ||
                         strcmp(type, @encode(long long)) == 0 ||
                         strcmp(type, @encode(unsigned long)) == 0 ||
                         strcmp(type, @encode(unsigned long long)) == 0) {

                    // Check if the value fits into an int
                    long long longValue = [numberValue longLongValue];
                    if (longValue >= INT_MIN && longValue <= INT_MAX) {
                        dsMapAddInt(dsMapIndex, (char *)cKey, (int)longValue);
                    } else {
                        // Represent as string to avoid overflow
                        NSString *stringValue = [numberValue stringValue];
                        dsMapAddString(dsMapIndex, (char *)cKey, (char *)[stringValue UTF8String]);
                    }
                } else {
                    // For other numeric types, default to adding as double
                    double doubleValue = [numberValue doubleValue];
                    dsMapAddDouble(dsMapIndex, (char *)cKey, doubleValue);
                }
            } else {
                // For other types, convert to string
                NSString *stringValue = [value description];
                dsMapAddString(dsMapIndex, (char *)cKey, (char *)[stringValue UTF8String]);
            }
        }

        createSocialAsyncEventWithDSMap(dsMapIndex);
    });
}

- (BOOL)isStringNullOrEmpty:(NSString *)string {
    return string == nil || [string length] == 0;
}

@end
