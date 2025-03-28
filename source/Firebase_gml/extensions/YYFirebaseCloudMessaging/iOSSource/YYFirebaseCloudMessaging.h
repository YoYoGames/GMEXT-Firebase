#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>

#import <Foundation/Foundation.h>
#import <FirebaseCore/FirebaseCore.h>
#import <FirebaseMessaging/FirebaseMessaging.h>

@interface YYFirebaseCloudMessaging : NSObject <FIRMessagingDelegate>

- (void)FirebaseCloudMessaging_GetToken;
- (void)FirebaseCloudMessaging_SubscribeToTopic:(NSString *)topic;
- (void)FirebaseCloudMessaging_UnsubscribeFromTopic:(NSString *)topic;
- (double)FirebaseCloudMessaging_IsAutoInitEnabled;
- (void)FirebaseCloudMessaging_SetAutoInitEnabled:(double)enable;
- (void)FirebaseCloudMessaging_DeleteToken;
- (void)FirebaseCloudMessaging_RequestPermission;

@end