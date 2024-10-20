#import "UNUserNotificationCenterMultiplexer.h"
#import "YYFirebaseCloudMessaging.h"
#import "FirebaseUtils.h"

#define EVENT_OTHER_SOCIAL 70
#define EVENT_OTHER_NOTIFICATION 71

@implementation YYFirebaseCloudMessaging

- (instancetype)init {
    self = [super init];
    if (self) {
        // Initialize Firebase if not already initialized
        if (![FIRApp defaultApp]) {
            [FIRApp configure];
        }
    }
    return self;
}

- (void)FirebaseCloudMessaging_RequestPermission {
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];

    [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
        if (settings.authorizationStatus == UNAuthorizationStatusNotDetermined) {
            // Request authorization
            [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge)
                                  completionHandler:^(BOOL granted, NSError * _Nullable error) {
                if (granted) {
                    // Register for remote notifications
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [[UIApplication sharedApplication] registerForRemoteNotifications];
                    });
                } else {
                    // Handle error or inform the user
                    NSLog(@"Notification permission not granted: %@", error.localizedDescription);
                }
            }];
        } else if (settings.authorizationStatus == UNAuthorizationStatusAuthorized) {
            // Already authorized, register for remote notifications
            dispatch_async(dispatch_get_main_queue(), ^{
                [[UIApplication sharedApplication] registerForRemoteNotifications];
            });
        } else {
            // Authorization denied, handle accordingly
            NSLog(@"Notification permission denied");
        }
    }];
}

- (void)FirebaseCloudMessaging_GetToken {
    [[FIRMessaging messaging] tokenWithCompletion:^(NSString * _Nullable token, NSError * _Nullable error) {
        NSMutableDictionary *data = [NSMutableDictionary dictionary];
		data[@"success"] = @(error == nil);
		if (error == nil) {
			data[@"value"] = token;
		}
		[FirebaseUtils sendSocialAsyncEvent:@"FirebaseCloudMessaging_GetToken" data:data];
    }];
}

- (void)FirebaseCloudMessaging_SubscribeToTopic:(NSString *)topic {
    [[FIRMessaging messaging] subscribeToTopic:topic completion:^(NSError * _Nullable error) {
        NSMutableDictionary *data = [NSMutableDictionary dictionary];
		data[@"success"] = @(error == nil);
		data[@"topic"] = topic;
		[FirebaseUtils sendSocialAsyncEvent:@"FirebaseCloudMessaging_SubscribeToTopic" data:data];
    }];
}

- (void)FirebaseCloudMessaging_UnsubscribeFromTopic:(NSString *)topic {
    [[FIRMessaging messaging] unsubscribeFromTopic:topic completion:^(NSError * _Nullable error) {
		NSMutableDictionary *data = [NSMutableDictionary dictionary];
		data[@"success"] = @(error == nil);
		data[@"topic"] = topic;
		[FirebaseUtils sendSocialAsyncEvent:@"FirebaseCloudMessaging_UnsubscribeFromTopic" data:data];
    }];
}

- (double)FirebaseCloudMessaging_IsAutoInitEnabled {
    return [FIRMessaging messaging].autoInitEnabled ? 1.0 : 0.0;
}

- (void)FirebaseCloudMessaging_SetAutoInitEnabled:(double)enable {
    [FIRMessaging messaging].autoInitEnabled = enable > 0.5 ? YES : NO;
}

- (void)FirebaseCloudMessaging_DeleteToken {
    [[FIRMessaging messaging] deleteTokenWithCompletion:^(NSError * _Nullable error) {
		NSMutableDictionary *data = [NSMutableDictionary dictionary];
		data[@"success"] = @(error == nil);
		[FirebaseUtils sendSocialAsyncEvent:@"FirebaseCloudMessaging_DeleteToken" data:data];
    }];
}

#pragma mark - Selectors

- (void)onLaunch:(NSDictionary *)launchOptions {

	NSLog(@"YYFirebaseCloudMessaging onLaunch:");

    // Set delegates
    [FIRMessaging messaging].delegate = self;

	// Register with the UNUserNotificationCenter multiplexer
	UNUserNotificationCenterMultiplexer *multiplexer = [UNUserNotificationCenterMultiplexer sharedInstance];
    [multiplexer registerDelegate:self];

    // Request notification permissions
    [self FirebaseCloudMessaging_RequestPermission];

    // Handle any pending notifications using launchOptions
    if (launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey]) {
        NSDictionary *notification = launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey];
        [self handleIncomingMessage:notification];
    }
}

#pragma mark - FIRMessagingDelegate

- (void)messaging:(FIRMessaging *)messaging didReceiveRegistrationToken:(NSString *)fcmToken {
	NSMutableDictionary *data = [NSMutableDictionary dictionary];
	data[@"value"] = fcmToken;
	[FirebaseUtils sendSocialAsyncEvent:@"FirebaseMessaging_OnNewToken" data:data];
}

#pragma mark - UNUserNotificationCenterDelegate

// Handle notifications when the app is in the foreground
- (void)userNotificationCenter:(UNUserNotificationCenter *)center 
		willPresentNotification:(UNNotification *)notification 
        withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {

    UNNotificationTrigger *trigger = notification.request.trigger;
    
	NSLog(@"YYFirebaseCloudMessaging: willPresentNotification");

    // This is NOT a remote notification? Ignore...
    if (![trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        return;
    }

    NSDictionary *userInfo = notification.request.content.userInfo;
    [self handleIncomingMessage:userInfo];

    // Decide whether to show the notification when the app is in foreground
    completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionSound | UNNotificationPresentationOptionBadge);
}

// Handle notifications when the user interacts with them (background or terminated state)
- (void)userNotificationCenter:(UNUserNotificationCenter *)center 
		didReceiveNotificationResponse:(UNNotificationResponse *)response 
        withCompletionHandler:(void (^)(void))completionHandler {

    UNNotification *notification = response.notification;
    UNNotificationTrigger *trigger = notification.request.trigger;
    
	NSLog(@"YYFirebaseCloudMessaging: didReceiveNotificationResponse");

    // This is NOT a remote notification? Ignore...
    if (![trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        return;
    }

    NSDictionary *userInfo = response.notification.request.content.userInfo;
    [self handleIncomingMessage:userInfo];

    completionHandler();
}

- (void)handleIncomingMessage:(NSDictionary *)userInfo {
	[[FirebaseUtils sharedInstance] sendAsyncEvent:EVENT_OTHER_NOTIFICATION eventType:@"Notification_Remote" data:userInfo];
}

@end