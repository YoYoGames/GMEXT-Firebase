#import "YYFirebaseAnalytics.h"
#import <UIKit/UIKit.h>

extern "C" int dsMapCreate();
extern "C" void dsMapAddInt(int _dsMap, char *_key, int _value);
extern "C" void dsMapAddDouble(int _dsMap, char *_key, double _value);
extern "C" void dsMapAddString(int _dsMap, char *_key, char *_value);
extern "C" void createSocialAsyncEventWithDSMap(int dsmapindex);

@interface YYFirebaseAnalytics ()

// Private methods and properties can be declared here if needed.

#pragma mark - Helper Methods

- (void)sendAsyncEventWithType:(NSString *)eventType data:(NSDictionary *)data;
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
}

- (void)FirebaseAnalytics_SetUserID:(NSString *)userID {
    [FIRAnalytics setUserID:userID];
}

- (void)FirebaseAnalytics_SetUserPropertyString:(NSString *)propertyName value:(NSString *)value {
    [FIRAnalytics setUserPropertyString:value forName:propertyName];
}

- (void)FirebaseAnalytics_SetConsent:(double)ads analytics:(double)analytics {
    NSMutableDictionary<NSString *, NSString *> *consentSettings = [NSMutableDictionary dictionary];

    consentSettings[FIRConsentTypeAdStorage] = (ads >= 0.5) ? FIRConsentStatusGranted : FIRConsentStatusDenied;
    consentSettings[FIRConsentTypeAnalyticsStorage] = (analytics >= 0.5) ? FIRConsentStatusGranted : FIRConsentStatusDenied;

    [FIRAnalytics setConsent:consentSettings];
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
