#import "YYFirebaseAnalytics.h"
#import <UIKit/UIKit.h>

const int EVENT_OTHER_SOCIAL = 70;

extern "C" int dsMapCreate();
extern "C" void dsMapAddInt(int _dsMap, char *_key, int _value);
extern "C" void dsMapAddDouble(int _dsMap, char *_key, double _value);
extern "C" void dsMapAddString(int _dsMap, char *_key, char *_value);
extern "C" void createSocialAsyncEventWithDSMap(int dsmapindex);

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
            }
        });
    }
    return self;
}

#pragma mark - Public API Methods

- (void)FirebaseAnalytics_SetAnalyticsCollectionEnabled:(double)enabled {
    BOOL isEnabled = enabled >= 0.5;
    [FIRAnalytics setAnalyticsCollectionEnabled:isEnabled];
}

- (void)FirebaseAnalytics_LogEvent:(NSString *)event value:(NSString *)json {
    __weak YYFirebaseAnalytics *weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        __strong YYFirebaseAnalytics *strongSelf = weakSelf;
        if (!strongSelf) return;

        NSDictionary *params = [strongSelf parseJsonStringToDictionary:json methodName:[NSString stringWithUTF8String:__FUNCTION__]];
        if (params) {
            [FIRAnalytics logEventWithName:event parameters:params];
        } else {
            NSLog(@"%s :: Failed to parse JSON for event %@", __FUNCTION__, event);
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

        NSDictionary *params = [strongSelf parseJsonStringToDictionary:json methodName:[NSString stringWithUTF8String:__FUNCTION__]];
        if (params) {
            [FIRAnalytics setDefaultEventParameters:params];
        } else {
            NSLog(@"%s :: Failed to parse JSON", __FUNCTION__);
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

- (NSDictionary *)parseJsonStringToDictionary:(NSString *)jsonString methodName:(NSString *)methodName {
    if (jsonString == nil || jsonString.length == 0) {
        NSLog(@"%s :: JSON string is nil or empty", [methodName UTF8String]);
        return nil;
    }

    NSError *error = nil;
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];

    if (error) {
        NSLog(@"%s :: Failed to parse JSON string: %@", [methodName UTF8String], error.localizedDescription);
        return nil;
    }

    NSDictionary *resultDict = [self processJsonObject:jsonObject methodName:methodName];

    if (!resultDict) {
        NSLog(@"%s :: Failed to process JSON object", [methodName UTF8String]);
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
                NSLog(@"%s :: Nested dictionaries are not supported for key: %@", [methodName UTF8String], key);
                // Skip nested dictionaries
            } else if ([value isKindOfClass:[NSArray class]]) {
                NSArray *arrayValue = [self processJsonArray:value methodName:methodName];
                if (arrayValue) {
                    resultDict[key] = arrayValue;
                } else {
                    NSLog(@"%s :: Failed to process array for key: %@", [methodName UTF8String], key);
                }
            } else if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
                resultDict[key] = value;
            } else {
                NSLog(@"%s :: Unsupported type %@ for key: %@", [methodName UTF8String], NSStringFromClass([value class]), key);
            }
        }

        return [resultDict copy];
    } else {
        NSLog(@"%s :: Expected a dictionary but received %@", [methodName UTF8String], NSStringFromClass([jsonObject class]));
        return nil;
    }
}

- (NSArray *)processJsonArray:(NSArray *)jsonArray methodName:(NSString *)methodName {
    NSMutableArray *resultArray = [NSMutableArray arrayWithCapacity:jsonArray.count];

    for (id value in jsonArray) {
        if ([value isKindOfClass:[NSDictionary class]]) {
            NSLog(@"%s :: Nested dictionaries inside arrays are not supported", [methodName UTF8String]);
            // Skip nested dictionaries inside arrays
        } else if ([value isKindOfClass:[NSArray class]]) {
            NSLog(@"%s :: Nested arrays are not supported", [methodName UTF8String]);
            // Skip nested arrays
        } else if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
            [resultArray addObject:value];
        } else {
            NSLog(@"%s :: Unsupported type %@ in array", [methodName UTF8String], NSStringFromClass([value class]));
        }
    }

    return [resultArray copy];
}

@end
