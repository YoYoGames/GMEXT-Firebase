
#import "YYFirebaseAnalytics.h"
#import <UIKit/UIKit.h>

@implementation YYFirebaseAnalytics

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
        
    -(void) FirebaseAnalytics_SetAnalyticsCollectionEnabled:(double) enabled
    {
        [FIRAnalytics setAnalyticsCollectionEnabled: enabled >= .5 ? YES : NO];

    }

    - (void)FirebaseAnalytics_LogEvent:(NSString *)event Value:(NSString *)json {
        __weak YYFirebaseAnalytics *weakSelf = self;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            YYFirebaseAnalytics *strongSelf = weakSelf;
            if (!strongSelf) return;
            NSDictionary *params = [strongSelf dictionaryFromJsonString:json methodName:@(__FUNCTION__)];
            if (params) {
                [FIRAnalytics logEventWithName:event parameters:params];
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
            YYFirebaseAnalytics *strongSelf = weakSelf;
            if (!strongSelf) return;
            NSDictionary *params = [strongSelf dictionaryFromJsonString:json methodName:@(__FUNCTION__)];
            if (params) {
                [FIRAnalytics setDefaultEventParameters:params];
            } else {
                NSLog(@"%@: Failed to parse JSON", @(__FUNCTION__));
            }
        });
    }
    
    -(void) FirebaseAnalytics_SetSessionTimeoutDuration:(double) time
    {
        [FIRAnalytics setSessionTimeoutInterval:(long)time];
    }
    
    -(void) FirebaseAnalytics_SetUserID:(NSString*) userID
    {
        [FIRAnalytics setUserID:userID];
    }
    
    - (void)FirebaseAnalytics_SetUserPropertyString:(NSString *)propertyName Value:(NSString *)value {
        [FIRAnalytics setUserPropertyString:value forName:propertyName];
    }
        
    - (void)FirebaseAnalytics_SetConsent:(double)ads analytics:(double)analytics {
        NSMutableDictionary<NSString *, NSString *> *consentSettings = [NSMutableDictionary dictionary];
        
        if (ads >= 0.5) {
            [consentSettings setObject:FIRConsentStatusGranted forKey:FIRConsentTypeAdStorage];
        } else {
            [consentSettings setObject:FIRConsentStatusDenied forKey:FIRConsentTypeAdStorage];
        }

        if (analytics >= 0.5) {
            [consentSettings setObject:FIRConsentStatusGranted forKey:FIRConsentTypeAnalyticsStorage];
        } else {
            [consentSettings setObject:FIRConsentStatusDenied forKey:FIRConsentTypeAnalyticsStorage];
        }

        [FIRAnalytics setConsent:consentSettings];
    }

    - (NSDictionary *) dictionaryFromJsonString:(NSString *)jsonString methodName:(NSString *)methodName {
        if (jsonString == nil || [jsonString length] == 0) {
            return nil;
        }
        
        NSError *error = nil;
        id jsonObject = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]
                                                        options:0
                                                        error:&error];
        if (error) {
            NSLog(@"%@: Failed to parse JSON string: %@", methodName, error.localizedDescription);
            return nil;
        }
        
        if ([jsonObject isKindOfClass:[NSDictionary class]]) {
            return [self dictionaryFromJsonObject:jsonObject methodName:methodName];
        } else {
            NSLog(@"%@: Root JSON object is not a dictionary", methodName);
            return nil;
        }
    }

    - (NSMutableDictionary *)dictionaryFromJsonObject:(NSDictionary *)jsonObject methodName:(NSString *)methodName {
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        
        for (NSString *key in jsonObject) {
            id value = jsonObject[key];
            
            if ([value isKindOfClass:[NSArray class]]) {
                NSArray *array = (NSArray *)value;
                NSArray *convertedArray = [self arrayFromJsonArray:array methodName:methodName];
                if (convertedArray) {
                    dictionary[key] = convertedArray;
                }
                else if ([value isKindOfClass:[NSDictionary class]]) {
                    NSLog(@"%@: Nested dictionaries are not supported for key: %@", methodName, key);
                    // Skip the nested dictionary
                } else {
                    [self putPrimitiveInDictionary:dictionary key:key value:value methodName:methodName];
                }
            }
        }
        
        return dictionary;
    }


    - (NSArray *)arrayFromJsonArray:(NSArray *)jsonArray methodName:(NSString *)methodName {
        NSMutableArray *dictionaryArray = [NSMutableArray arrayWithCapacity:jsonArray.count];
        
        for (id value in jsonArray) {
            if ([value isKindOfClass:[NSDictionary class]]) {
                NSDictionary *dict = [self dictionaryFromJsonObject:value methodName:methodName];
                if (dict) {
                    [dictionaryArray addObject:dict];
                }
            } else {
                NSLog(@"%@: Unsupported type inside array: %@", methodName, NSStringFromClass([value class]));
            }
        }
        
        return [dictionaryArray copy];
    }

    - (void)putPrimitiveInDictionary:(NSMutableDictionary *)dictionary key:(NSString *)key value:(id)value methodName:(NSString *)methodName {
        if ([value isKindOfClass:[NSString class]]) {
            NSLog(@"%@: Added value %@ for key: %@", methodName, value, key);
            dictionary[key] = value;
        } else if ([value isKindOfClass:[NSNumber class]]) {
            // Convert all numbers to double
            NSNumber *numberValue = (NSNumber *)value;
            dictionary[key] = @([numberValue doubleValue]);
        } else {
            NSLog(@"%@: Unsupported type %@ for key: %@", methodName, NSStringFromClass([value class]), key);
        }
    }

@end
