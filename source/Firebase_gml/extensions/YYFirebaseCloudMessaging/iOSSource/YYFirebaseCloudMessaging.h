#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <FirebaseCore/FirebaseCore.h>
#import <FirebaseMessaging/FirebaseMessaging.h>
#import <UserNotifications/UserNotifications.h>

@interface YYFirebaseCloudMessaging : NSObject <FIRMessagingDelegate, UNUserNotificationCenterDelegate>

- (void)FirebaseCloudMessaging_GetToken;
- (void)FirebaseCloudMessaging_SubscribeToTopic:(NSString *)topic;
- (void)FirebaseCloudMessaging_UnsubscribeFromTopic:(NSString *)topic;
- (double)FirebaseCloudMessaging_IsAutoInitEnabled;
- (void)FirebaseCloudMessaging_SetAutoInitEnabled:(double)enable;
- (void)FirebaseCloudMessaging_DeleteToken;
- (void)FirebaseCloudMessaging_RequestPermission;

@end