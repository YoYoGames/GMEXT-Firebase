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

@property (nonatomic, assign) BOOL isAutoDataCollectionEnabled;

@end

@implementation YYFirebaseCrashlytics

#pragma mark - Initialization

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

#pragma mark - Public API Methods

- (void)FirebaseCrashlytics_Initialize {
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

    self.isAutoDataCollectionEnabled = isCrashlyticsEnabled;

    // Optionally, send an event back to the game engine indicating initialization is complete
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setObject:@(isCrashlyticsEnabled) forKey:@"isEnabled"];
    [self sendAsyncEventWithType:[NSString stringWithUTF8String:__FUNCTION__] data:data];
}


- (void)FirebaseCrashlytics_SetUserIdentifier:(NSString *)string {
    [[FIRCrashlytics crashlytics] setUserID:string];
    
}

- (void)FirebaseCrashlytics_SetCustomKey:(NSString *)key value:(id)value {
    if (key && value) {
        [[FIRCrashlytics crashlytics] setCustomValue:value forKey:key];
        
    } else {
        NSLog(@"%s :: Invalid key or value.", __FUNCTION__);
    }
}

- (void)FirebaseCrashlytics_SetCustomKeys:(NSString *)jsonString {
    if (!jsonString) {
        NSLog(@"%s :: JSON string is nil.", __FUNCTION__);
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
            NSLog(@"%s :: Error parsing JSON - %@", __FUNCTION__, jsonError.localizedDescription);
            // Send event back to game engine indicating error
            NSMutableDictionary *data = [NSMutableDictionary dictionary];
            [data setObject:@(0) forKey:@"success"];
            [data setObject:jsonError.localizedDescription forKey:@"error"];
            [strongSelf sendAsyncEventWithType:[NSString stringWithUTF8String:__FUNCTION__] data:data];
            return;
        }

        for (NSString *key in keyValues) {
            id value = keyValues[key];
            if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
                [[FIRCrashlytics crashlytics] setCustomValue:value forKey:key];
                
            } else {
                NSLog(@"%s :: Unsupported value type for key: %@", __FUNCTION__, key);
            }
        }

        // Send event back indicating success
        NSMutableDictionary *data = [NSMutableDictionary dictionary];
        [data setObject:@(1) forKey:@"success"];
        [strongSelf sendAsyncEventWithType:[NSString stringWithUTF8String:__FUNCTION__] data:data];
    });
}

- (void)FirebaseCrashlytics_Log:(NSString *)message {
    [[FIRCrashlytics crashlytics] log:message];
}

- (void)FirebaseCrashlytics_Crash:(NSString *)message {
    // Log the message before crashing
    [[FIRCrashlytics crashlytics] log:message];
    
    // Create a custom exception and record it
    NSException *exception = [NSException exceptionWithName:@"ForcedCrash" reason:message userInfo:nil];
    FIRExceptionModel *exceptionModel = [FIRExceptionModel exceptionModelWithName:exception.name reason:exception.reason];
    [[FIRCrashlytics crashlytics] recordExceptionModel:exceptionModel];

    // Terminate the app
    abort();
}

- (void)FirebaseCrashlytics_RecordException:(NSString *)message {
    if (message) {
        NSException *exception = [NSException exceptionWithName:@"RecordedException" reason:message userInfo:nil];
        FIRExceptionModel *exceptionModel = [FIRExceptionModel exceptionModelWithName:exception.name reason:exception.reason];
        [[FIRCrashlytics crashlytics] recordExceptionModel:exceptionModel];
        
        // Optionally, send event back indicating exception recorded
        NSMutableDictionary *data = [NSMutableDictionary dictionary];
        [data setObject:@(1) forKey:@"success"];
        [self sendAsyncEventWithType:[NSString stringWithUTF8String:__FUNCTION__] data:data];
    } else {
        NSLog(@"%s :: Message is nil.", __FUNCTION__);
        // Send event back indicating error
        NSMutableDictionary *data = [NSMutableDictionary dictionary];
        [data setObject:@(0) forKey:@"success"];
        [data setObject:@"Message is nil" forKey:@"error"];
        [self sendAsyncEventWithType:[NSString stringWithUTF8String:__FUNCTION__] data:data];
    }
}

- (void)FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set:(double)enabled {
    self.isAutoDataCollectionEnabled = enabled >= 0.5;

    // Store the preference
    [[NSUserDefaults standardUserDefaults] setBool:self.isAutoDataCollectionEnabled forKey:@"CrashlyticsCollectionEnabled"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    [[FIRCrashlytics crashlytics] setCrashlyticsCollectionEnabled:self.isAutoDataCollectionEnabled];

    // Send event back indicating the new state
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setObject:@(self.isAutoDataCollectionEnabled) forKey:@"isEnabled"];
    [self sendAsyncEventWithType:[NSString stringWithUTF8String:__FUNCTION__] data:data];
}

- (double)FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check {
    

    // Optionally, send event back
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setObject:@(self.isAutoDataCollectionEnabled) forKey:@"isEnabled"];
    [self sendAsyncEventWithType:[NSString stringWithUTF8String:__FUNCTION__] data:data];

    return self.isAutoDataCollectionEnabled ? 1.0 : 0.0;
}

- (double)FirebaseCrashlytics_DidCrashOnPreviousExecution {
    BOOL didCrash = [[FIRCrashlytics crashlytics] didCrashDuringPreviousExecution];
    
    // Optionally, send event back
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setObject:@(didCrash) forKey:@"didCrash"];
    [self sendAsyncEventWithType:[NSString stringWithUTF8String:__FUNCTION__] data:data];

    return didCrash ? 1.0 : 0.0;
}

- (void)FirebaseCrashlytics_UnsentReports_Delete {
    NSLog(@"%s :: Not supported in the latest SDK.", __FUNCTION__);
    // Optionally, send event back indicating not supported
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setObject:@(0) forKey:@"success"];
    [data setObject:@"Delete unsent reports is not supported in the latest SDK" forKey:@"error"];
    [self sendAsyncEventWithType:[NSString stringWithUTF8String:__FUNCTION__] data:data];
}

- (void)FirebaseCrashlytics_UnsentReports_Send {
    NSLog(@"%s :: Not supported in the latest SDK.", __FUNCTION__);
    // Optionally, send event back indicating not supported
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setObject:@(0) forKey:@"success"];
    [data setObject:@"Send unsent reports is not supported in the latest SDK" forKey:@"error"];
    [self sendAsyncEventWithType:[NSString stringWithUTF8String:__FUNCTION__] data:data];
}

- (void)FirebaseCrashlytics_UnsentReports_Check {
    NSLog(@"%s :: Not supported in the latest SDK.", __FUNCTION__);
    // Optionally, send event back indicating not supported
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setObject:@(0) forKey:@"success"];
    [data setObject:@"Check for unsent reports is not supported in the latest SDK" forKey:@"error"];
    [self sendAsyncEventWithType:[NSString stringWithUTF8String:__FUNCTION__] data:data];
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
