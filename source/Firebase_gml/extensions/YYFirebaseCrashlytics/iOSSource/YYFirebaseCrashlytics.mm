#import "YYFirebaseCrashlytics.h"
#import <UIKit/UIKit.h>

const int EVENT_OTHER_SOCIAL = 70;

extern "C" int dsMapCreate();
extern "C" void dsMapAddInt(int _dsMap, char *_key, int _value);
extern "C" void dsMapAddDouble(int _dsMap, char *_key, double _value);
extern "C" void dsMapAddString(int _dsMap, char *_key, char *_value);
extern "C" void createSocialAsyncEventWithDSMap(int dsmapindex);

@interface YYFirebaseCrashlytics ()

// Private methods and properties can be declared here if needed.

#pragma mark - Helper Methods

- (void)sendAsyncEventWithType:(NSString *)eventType data:(NSDictionary *)data;

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
    }
    return self;
}

#pragma mark - Initialization

- (void)FirebaseCrashlytics_Initialize {
    // Read the user's preference from NSUserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL isCrashlyticsEnabled;
    
    if ([defaults objectForKey:@"CrashlyticsCollectionEnabled"] != nil) {
        isCrashlyticsEnabled = [defaults boolForKey:@"CrashlyticsCollectionEnabled"];
        NSLog(@"CrashlyticsCollectionEnabled from NSUserDefaults: %d", isCrashlyticsEnabled);
    } else {
        // If the user hasn't set a preference, read from Info.plist
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSNumber *crashlyticsEnabled = infoDictionary[@"FirebaseCrashlyticsCollectionEnabled"];
        if (crashlyticsEnabled != nil) {
            isCrashlyticsEnabled = [crashlyticsEnabled boolValue];
            NSLog(@"CrashlyticsCollectionEnabled from Info.plist: %d", isCrashlyticsEnabled);
        } else {
            // Default to YES if not set in Info.plist
            isCrashlyticsEnabled = YES;
            NSLog(@"CrashlyticsCollectionEnabled not set in Info.plist, defaulting to YES");
        }
    }

    self.isAutoDataCollectionEnabled = isCrashlyticsEnabled;

    // Optionally, send an event back to the game engine indicating initialization is complete
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setObject:@(isCrashlyticsEnabled) forKey:@"isEnabled"];
    [self sendAsyncEventWithType:@"FirebaseCrashlytics_Initialize" data:data];
}

#pragma mark - User Identification and Custom Keys

- (void)FirebaseCrashlytics_SetUserIdentifier:(NSString *)string {
    [[FIRCrashlytics crashlytics] setUserID:string];
    NSLog(@"FirebaseCrashlytics_SetUserIdentifier: %@", string);
}

- (void)FirebaseCrashlytics_SetCustomKey:(NSString *)key value:(id)value {
    if (key && value) {
        [[FIRCrashlytics crashlytics] setCustomValue:value forKey:key];
        NSLog(@"FirebaseCrashlytics_SetCustomKey: %@ = %@", key, value);
    } else {
        NSLog(@"FirebaseCrashlytics_SetCustomKey: Invalid key or value.");
    }
}

- (void)FirebaseCrashlytics_SetCustomKeys:(NSString *)jsonString {
    if (!jsonString) {
        NSLog(@"FirebaseCrashlytics_SetCustomKeys: JSON string is nil.");
        return;
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

        for (NSString *key in keyValues) {
            id value = keyValues[key];
            if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
                [[FIRCrashlytics crashlytics] setCustomValue:value forKey:key];
                NSLog(@"FirebaseCrashlytics_SetCustomKeys: %@ = %@", key, value);
            } else {
                NSLog(@"FirebaseCrashlytics_SetCustomKeys: Unsupported value type for key: %@", key);
            }
        }

        // Send event back indicating success
        NSMutableDictionary *data = [NSMutableDictionary dictionary];
        [data setObject:@(1) forKey:@"success"];
        [strongSelf sendAsyncEventWithType:@"FirebaseCrashlytics_SetCustomKeys" data:data];
    });
}

#pragma mark - Logging and Exception Handling

- (void)FirebaseCrashlytics_Log:(NSString *)message {
    [[FIRCrashlytics crashlytics] log:message];
    NSLog(@"FirebaseCrashlytics_Log: %@", message);
}

- (void)FirebaseCrashlytics_Crash:(NSString *)message {
    // Log the message before crashing
    [[FIRCrashlytics crashlytics] log:message];
    NSLog(@"FirebaseCrashlytics_Crash: %@", message);

    // Create a custom exception and record it
    NSException *exception = [NSException exceptionWithName:@"ForcedCrash" reason:message userInfo:nil];
    [[FIRCrashlytics crashlytics] recordExceptionModel:[FIRExceptionModel exceptionModelWithName:exception.name reason:exception.reason]];

    // Terminate the app
    abort();
}

- (void)FirebaseCrashlytics_RecordException:(NSString *)message {
    if (message) {
        NSException *exception = [NSException exceptionWithName:@"RecordedException" reason:message userInfo:nil];
        FIRExceptionModel *exceptionModel = [FIRExceptionModel exceptionModelWithName:exception.name reason:exception.reason];
        [[FIRCrashlytics crashlytics] recordExceptionModel:exceptionModel];
        NSLog(@"FirebaseCrashlytics_RecordException: %@", message);

        // Optionally, send event back indicating exception recorded
        NSMutableDictionary *data = [NSMutableDictionary dictionary];
        [data setObject:@(1) forKey:@"success"];
        [self sendAsyncEventWithType:@"FirebaseCrashlytics_RecordException" data:data];
    } else {
        NSLog(@"FirebaseCrashlytics_RecordException: Message is nil.");
        // Send event back indicating error
        NSMutableDictionary *data = [NSMutableDictionary dictionary];
        [data setObject:@(0) forKey:@"success"];
        [data setObject:@"Message is nil" forKey:@"error"];
        [self sendAsyncEventWithType:@"FirebaseCrashlytics_RecordException" data:data];
    }
}

#pragma mark - Crashlytics Collection Control

- (void)FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set:(double)enabled {
    self.isAutoDataCollectionEnabled = enabled >= 0.5;

    // Store the preference
    [[NSUserDefaults standardUserDefaults] setBool:self.isAutoDataCollectionEnabled forKey:@"CrashlyticsCollectionEnabled"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    [[FIRCrashlytics crashlytics] setCrashlyticsCollectionEnabled:self.isAutoDataCollectionEnabled];

    NSLog(@"FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set: %d", self.isAutoDataCollectionEnabled);

    // Send event back indicating the new state
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setObject:@(self.isAutoDataCollectionEnabled) forKey:@"isEnabled"];
    [self sendAsyncEventWithType:@"FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set" data:data];
}

- (double)FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check {
    NSLog(@"FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check: %d", self.isAutoDataCollectionEnabled);
    return self.isAutoDataCollectionEnabled ? 1.0 : 0.0;
}

- (double)FirebaseCrashlytics_DidCrashOnPreviousExecution {
    BOOL didCrash = [[FIRCrashlytics crashlytics] didCrashDuringPreviousExecution];
    NSLog(@"FirebaseCrashlytics_DidCrashOnPreviousExecution: %d", didCrash);

    // Optionally, send event back
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setObject:@(didCrash) forKey:@"didCrash"];
    [self sendAsyncEventWithType:@"FirebaseCrashlytics_DidCrashOnPreviousExecution" data:data];

    return didCrash ? 1.0 : 0.0;
}

#pragma mark - Unsent Reports Management

- (void)FirebaseCrashlytics_UnsentReports_Delete {
    NSLog(@"FirebaseCrashlytics_UnsentReports_Delete: Not supported in the latest SDK.");
    // Optionally, send event back indicating not supported
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setObject:@(0) forKey:@"success"];
    [data setObject:@"Delete unsent reports is not supported in the latest SDK" forKey:@"error"];
    [self sendAsyncEventWithType:@"FirebaseCrashlytics_UnsentReports_Delete" data:data];
}

- (void)FirebaseCrashlytics_UnsentReports_Send {
    NSLog(@"FirebaseCrashlytics_UnsentReports_Send: Not supported in the latest SDK.");
    // Optionally, send event back indicating not supported
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setObject:@(0) forKey:@"success"];
    [data setObject:@"Send unsent reports is not supported in the latest SDK" forKey:@"error"];
    [self sendAsyncEventWithType:@"FirebaseCrashlytics_UnsentReports_Send" data:data];
}

- (void)FirebaseCrashlytics_UnsentReports_Check {
    NSLog(@"FirebaseCrashlytics_UnsentReports_Check: Not supported in the latest SDK.");
    // Optionally, send event back indicating not supported
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setObject:@(0) forKey:@"success"];
    [data setObject:@"Check for unsent reports is not supported in the latest SDK" forKey:@"error"];
    [self sendAsyncEventWithType:@"FirebaseCrashlytics_UnsentReports_Check" data:data];
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

@end
