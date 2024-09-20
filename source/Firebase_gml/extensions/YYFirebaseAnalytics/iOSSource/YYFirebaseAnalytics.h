#import <Foundation/Foundation.h>
#import <FirebaseCore/FirebaseCore.h>
#import <FirebaseAnalytics/FirebaseAnalytics.h>
#import <FirebaseAnalytics/FIRAnalytics+Consent.h>

@interface YYFirebaseAnalytics : NSObject

// Public method declarations

/**
 * Sets whether analytics collection is enabled.
 *
 * @param enabled A double where values >= 0.5 enable analytics collection, and < 0.5 disable it.
 */
- (void)FirebaseAnalytics_SetAnalyticsCollectionEnabled:(double)enabled;

/**
 * Logs an event with a JSON-formatted string of parameters.
 *
 * @param event The name of the event to log.
 * @param json The JSON-formatted string representing event parameters.
 */
- (void)FirebaseAnalytics_LogEvent:(NSString *)event Value:(NSString *)json;

/**
 * Resets all analytics data.
 */
- (void)FirebaseAnalytics_ResetAnalyticsData;

/**
 * Sets default event parameters with a JSON-formatted string.
 *
 * @param json The JSON-formatted string representing default event parameters.
 */
- (void)FirebaseAnalytics_SetDefaultEventParameters:(NSString *)json;

/**
 * Sets the session timeout duration.
 *
 * @param timeInSeconds The session timeout duration in seconds.
 */
- (void)FirebaseAnalytics_SetSessionTimeoutDuration:(double)timeInSeconds;

/**
 * Sets the user ID.
 *
 * @param userID The user ID to set.
 */
- (void)FirebaseAnalytics_SetUserID:(NSString *)userID;

/**
 * Sets a user property with a string value.
 *
 * @param propertyName The name of the user property.
 * @param value The string value to set for the user property.
 */
- (void)FirebaseAnalytics_SetUserPropertyString:(NSString *)propertyName Value:(NSString *)value;

/**
 * Sets consent preferences for ads and analytics storage.
 *
 * @param ads A double where values >= 0.5 grant ad storage consent, and < 0.5 deny it.
 * @param analytics A double where values >= 0.5 grant analytics storage consent, and < 0.5 deny it.
 */
- (void)FirebaseAnalytics_SetConsent:(double)ads analytics:(double)analytics;

@end

