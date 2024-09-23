#import "YYFirebaseAnalytics.h"
#import <UIKit/UIKit.h>

@interface YYFirebaseAnalytics ()

// Private methods and properties can be declared here if needed.

#pragma mark - Helper Methods

- (NSDictionary *)parseJsonStringToDictionary:(NSString *)jsonString methodName:(NSString *)methodName;
- (NSDictionary *)processJsonObject:(id)jsonObject methodName:(NSString *)methodName;
- (NSArray *)processJsonArray:(NSArray *)jsonArray methodName:(NSString *)methodName;


@end

@implementation YYFirebaseAnalytics

#pragma mark - Initialization

- (instancetype)init {
    if (self = [super init]) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            if (![FIRApp defaultApp]) {
                [FIRApp configure];
                NSLog(@"Firebase initialized in YYFirebaseAnalytics");
            }
        });
    }
    return self;
}

#pragma mark - Public API Methods

- (void)FirebaseAnalytics_SetAnalyticsCollectionEnabled:(double)enabled {
    BOOL isEnabled = enabled >= 0.5;
    [FIRAnalytics setAnalyticsCollectionEnabled:isEnabled];
    NSLog(@"FirebaseAnalytics_SetAnalyticsCollectionEnabled: %@", isEnabled ? @"Enabled" : @"Disabled");
}

- (void)FirebaseAnalytics_LogEvent:(NSString *)event value:(NSString *)json {
    __weak YYFirebaseAnalytics *weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        __strong YYFirebaseAnalytics *strongSelf = weakSelf;
        if (!strongSelf) return;

        NSDictionary *params = [strongSelf parseJsonStringToDictionary:json methodName:@"FirebaseAnalytics_LogEvent"];
        if (params) {
            [FIRAnalytics logEventWithName:event parameters:params];
            NSLog(@"FirebaseAnalytics_LogEvent: Event '%@' logged with parameters: %@", event, params);
        } else {
            NSLog(@"FirebaseAnalytics_LogEvent: Failed to parse JSON for event %@", event);
        }
    });
}

- (void)FirebaseAnalytics_ResetAnalyticsData {
    [FIRAnalytics resetAnalyticsData];
    NSLog(@"FirebaseAnalytics_ResetAnalyticsData called");
}

- (void)FirebaseAnalytics_SetDefaultEventParameters:(NSString *)json {
    __weak YYFirebaseAnalytics *weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        __strong YYFirebaseAnalytics *strongSelf = weakSelf;
        if (!strongSelf) return;

        NSDictionary *params = [strongSelf parseJsonStringToDictionary:json methodName:@"FirebaseAnalytics_SetDefaultEventParameters"];
        if (params) {
            [FIRAnalytics setDefaultEventParameters:params];
            NSLog(@"FirebaseAnalytics_SetDefaultEventParameters: Parameters set: %@", params);
        } else {
            NSLog(@"FirebaseAnalytics_SetDefaultEventParameters: Failed to parse JSON");
        }
    });
}

- (void)FirebaseAnalytics_SetSessionTimeoutDuration:(double)time {
    [FIRAnalytics setSessionTimeoutInterval:time];
    NSLog(@"FirebaseAnalytics_SetSessionTimeoutDuration: Timeout interval set to %f seconds", time);
}

- (void)FirebaseAnalytics_SetUserID:(NSString *)userID {
    [FIRAnalytics setUserID:userID];
    NSLog(@"FirebaseAnalytics_SetUserID: UserID set to %@", userID);
}

- (void)FirebaseAnalytics_SetUserPropertyString:(NSString *)propertyName value:(NSString *)value {
    [FIRAnalytics setUserPropertyString:value forName:propertyName];
    NSLog(@"FirebaseAnalytics_SetUserPropertyString: Property '%@' set to '%@'", propertyName, value);
}

- (void)FirebaseAnalytics_SetConsent:(double)ads analytics:(double)analytics {
    NSMutableDictionary<NSString *, NSString *> *consentSettings = [NSMutableDictionary dictionary];

    consentSettings[FIRConsentTypeAdStorage] = (ads >= 0.5) ? FIRConsentStatusGranted : FIRConsentStatusDenied;
    consentSettings[FIRConsentTypeAnalyticsStorage] = (analytics >= 0.5) ? FIRConsentStatusGranted : FIRConsentStatusDenied;

    [FIRAnalytics setConsent:consentSettings];

    NSLog(@"FirebaseAnalytics_SetConsent: AdStorage=%@, AnalyticsStorage=%@",
          consentSettings[FIRConsentTypeAdStorage],
          consentSettings[FIRConsentTypeAnalyticsStorage]);
}

#pragma mark - Helper Methods

- (NSDictionary *)parseJsonStringToDictionary:(NSString *)jsonString methodName:(NSString *)methodName {
    if (jsonString == nil || jsonString.length == 0) {
        NSLog(@"%@: JSON string is nil or empty", methodName);
        return nil;
    }

    NSError *error = nil;
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];

    if (error) {
        NSLog(@"%@: Failed to parse JSON string: %@", methodName, error.localizedDescription);
        return nil;
    }

    NSDictionary *resultDict = [self processJsonObject:jsonObject methodName:methodName];

    if (!resultDict) {
        NSLog(@"%@: Failed to process JSON object", methodName);
    }

    return resultDict;
}

- (NSDictionary *)processJsonObject:(id)jsonObject methodName:(NSString *)methodName {
    if ([jsonObject isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *resultDict = [NSMutableDictionary dictionary];
        NSDictionary *jsonDict = (NSDictionary *)jsonObject;

        for (NSString *key in jsonDict) {
            id value = jsonDict[key];

            if ([value isKindOfClass:[NSDictionary class]]) {
                NSLog(@"%@: Nested dictionaries are not supported for key: %@", methodName, key);
                // Skip nested dictionaries
            } else if ([value isKindOfClass:[NSArray class]]) {
                NSArray *arrayValue = [self processJsonArray:value methodName:methodName];
                if (arrayValue) {
                    resultDict[key] = arrayValue;
                } else {
                    NSLog(@"%@: Failed to process array for key: %@", methodName, key);
                }
            } else if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
                resultDict[key] = value;
            } else {
                NSLog(@"%@: Unsupported type %@ for key: %@", methodName, NSStringFromClass([value class]), key);
            }
        }

        return [resultDict copy];
    } else {
        NSLog(@"%@: Expected a dictionary but received %@", methodName, NSStringFromClass([jsonObject class]));
        return nil;
    }
}

- (NSArray *)processJsonArray:(NSArray *)jsonArray methodName:(NSString *)methodName {
    NSMutableArray *resultArray = [NSMutableArray arrayWithCapacity:jsonArray.count];

    for (id value in jsonArray) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            NSLog(@"%@: Nested dictionaries inside arrays are not supported", methodName);
            // Skip nested dictionaries inside arrays
        } else if ([value isKindOfClass:[NSArray class]]) {
            NSLog(@"%@: Nested arrays are not supported", methodName);
            // Skip nested arrays
        } else if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
            [resultArray addObject:value];
        } else {
            NSLog(@"%@: Unsupported type %@ in array", methodName, NSStringFromClass([value class]));
        }
    }

    return [resultArray copy];
}

@end
