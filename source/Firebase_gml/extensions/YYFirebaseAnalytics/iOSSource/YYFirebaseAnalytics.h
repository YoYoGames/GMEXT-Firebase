#import <Foundation/Foundation.h>
#import <FirebaseCore/FirebaseCore.h>;
#import <FirebaseAnalytics/FirebaseAnalytics.h>;

@interface YYFirebaseAnalytics : NSObject

- (double)FirebaseAnalytics_SetAnalyticsCollectionEnabled:(double)enabled;
- (double)FirebaseAnalytics_LogEvent:(NSString *)event value:(NSString *)json;
- (double)FirebaseAnalytics_ResetAnalyticsData;
- (double)FirebaseAnalytics_SetDefaultEventParameters:(NSString *)json;
- (double)FirebaseAnalytics_SetSessionTimeoutDuration:(double)time;
- (double)FirebaseAnalytics_SetUserID:(NSString *)userID;
- (double)FirebaseAnalytics_SetUserPropertyString:(NSString *)propertyName value:(NSString *)value;
- (double)FirebaseAnalytics_SetConsent:(double)ads analytics:(double)analytics;

@end