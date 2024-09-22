
#import "YYFirebaseCrashlytics.h"
#import <UIKit/UIKit.h>

const int EVENT_OTHER_SOCIAL = 70;

extern "C" int dsMapCreate();
extern "C" void dsMapAddDouble(int _dsMap, char* _key, double _value);
extern "C" void dsMapAddString(int _dsMap, char* _key, char* _value);

extern "C" void createSocialAsyncEventWithDSMap(int dsmapindex);

extern "C" const char* extOptGetString(char* _ext, char* _opt);

@implementation YYFirebaseCrashlytics

- (instancetype)init {
    self = [super init];
    if (self) {      
        // Configure Firebase with the default setting
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            if (![FIRApp defaultApp]) {
                [FIRApp configure];
            }
        });
    }
    return self;
}

//https://firebase.google.com/docs/reference/ios/crashlytics/api/reference/Classes/Crashlytics?hl=es#-crash


-(void)FirebaseCrashlytics_Initialize {
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
}

-(void)FirebaseCrashlytics_SetUserIdentifier:(NSString*)string {
    [[FIRCrashlytics crashlytics] setUserID:string];
}

- (void)FirebaseCrashlytics_SetCustomKey:(NSString *)key value:(id)value {
    if (key && value) {
        [[FIRCrashlytics crashlytics] setCustomValue:value forKey:key];
    } else {
        NSLog(@"YYFirebaseCrashlytics: Invalid key or value for setCustomKey.");
    }
}

- (void)FirebaseCrashlytics_SetCustomKeys:(NSString *)jsonString {
    if (!jsonString) {
        NSLog(@"YYFirebaseCrashlytics: JSON string is nil.");
        return;
    }
    
    NSError *jsonError;
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *keyValues = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&jsonError];
    
    if (jsonError) {
        NSLog(@"YYFirebaseCrashlytics: Error parsing JSON - %@", jsonError.localizedDescription);
        return;
    }
    
    for (NSString *key in keyValues) {
        id value = keyValues[key];
        if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
            [[FIRCrashlytics crashlytics] setCustomValue:value forKey:key];
        } else {
            NSLog(@"YYFirebaseCrashlytics: Unsupported value type for key: %@", key);
        }
    }
}

- (void)FirebaseCrashlytics_Log:(NSString*)message {
    [[FIRCrashlytics crashlytics] log:message];
}

- (void)FirebaseCrashlytics_Crash:(NSString *)message {
    // Log the message before crashing
    [[FIRCrashlytics crashlytics] log:message];
    
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
    } else {
        NSLog(@"YYFirebaseCrashlytics: Message is nil in RecordException.");
    }
}

- (void)FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set:(double)enabled {
    self.isAutoDataCollectionEnabled = enabled >= 0.5;

    // Store the preference
    [[NSUserDefaults standardUserDefaults] setBool:self.isAutoDataCollectionEnabled forKey:@"CrashlyticsCollectionEnabled"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    [[FIRCrashlytics crashlytics] setCrashlyticsCollectionEnabled: self.isAutoDataCollectionEnabled];
}

- (double)FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check {
    return self.isAutoDataCollectionEnabled ? YES : NO;
}

- (double)FirebaseCrashlytics_DidCrashOnPreviousExecution {
    return [[FIRCrashlytics crashlytics] didCrashDuringPreviousExecution] ? YES : NO;
}

- (void)FirebaseCrashlytics_UnsentReports_Delete {
    NSLog(@"YYFirebaseCrashlytics: Delete unsent reports is not supported in the latest SDK.");
}

- (void)FirebaseCrashlytics_UnsentReports_Send {
    NSLog(@"YYFirebaseCrashlytics: Sending unsent reports is not supported in the latest SDK.");
}

- (void)FirebaseCrashlytics_UnsentReports_Check {
    NSLog(@"YYFirebaseCrashlytics: Check for unsent reports is not supported in the latest SDK.");
}

@end

