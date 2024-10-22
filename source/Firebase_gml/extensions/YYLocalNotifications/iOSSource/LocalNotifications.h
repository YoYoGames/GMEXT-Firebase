#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>

@interface LocalNotifications:NSObject <UNUserNotificationCenterDelegate>

// Class method to get the notification prefix
+ (NSString *)prefix;

// Instance methods for managing local notifications

/**
 Schedules a local notification with the specified parameters.

 @param ID A unique identifier for the notification.
 @param fire_time The time interval after which the notification will be delivered (in seconds).
 @param title The title of the notification.
 @param message The body message of the notification.
 @param data Custom data to be passed with the notification.
 */
- (void)LocalPushNotification_Create:(NSString *)ID
                          fire_time:(double)fire_time
                              title:(NSString *)title
                            message:(NSString *)message
                               data:(NSString *)data;

/**
 Cancels a scheduled local notification with the specified identifier.

 @param ID The unique identifier of the notification to cancel.
 */
- (void)LocalPushNotification_Cancel:(NSString *)ID;

/**
 Requests notification permissions from the user.
 */
- (void)LocalPushNotification_iOS_Permission_Request;

/**
 Checks the current notification permission status and returns it via an asynchronous event.
 */
- (void)LocalPushNotification_iOS_Permission_Status;

/**
 Should be called during the extension's launch to set up notification handling.

 @param launchOptions The launch options dictionary provided by the system.
 */
- (void)onLaunch:(NSDictionary *)launchOptions;

@end
