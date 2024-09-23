#import <Foundation/Foundation.h>
#import <FirebaseCore/FirebaseCore.h>
#import <FirebaseAnalytics/FirebaseAnalytics.h>

@interface YYFirebaseAnalytics : NSObject

- (void)FirebaseAnalytics_SetAnalyticsCollectionEnabled:(double)enabled;
- (void)FirebaseAnalytics_LogEvent:(NSString *)event value:(NSString *)json;
- (void)FirebaseAnalytics_ResetAnalyticsData;
- (void)FirebaseAnalytics_SetDefaultEventParameters:(NSString *)json;
- (void)FirebaseAnalytics_SetSessionTimeoutDuration:(double)time;
- (void)FirebaseAnalytics_SetUserID:(NSString *)userID;
- (void)FirebaseAnalytics_SetUserPropertyString:(NSString *)propertyName value:(NSString *)value;
- (void)FirebaseAnalytics_SetConsent:(double)ads analytics:(double)analytics;

@end