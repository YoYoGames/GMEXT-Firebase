#import <objc/runtime.h>
#import <UserNotifications/UserNotifications.h>

#import "iPad_RunnerAppDelegate.h"
#import "YYFirebaseCloudMessaging.h"
#import "FirebaseUtils.h"

#define EVENT_OTHER_NOTIFICATION 71

static const void *kOnceTokenKey = &kOnceTokenKey;

typedef void(^RunOnceCompletionHandler)(void);
typedef void(^RunOncePresentationHandler)(UNNotificationPresentationOptions options);

// Wrap a "void(void)" completion handler so it only runs once
static void(^RunOnceVoidCompletionHandler(void(^originalHandler)(void)))(void) {
    __block BOOL called = NO;
    return ^{
        if (!called) {
            called = YES;
            if (originalHandler) originalHandler();
        } else {
            // Already called, do nothing
        }
    };
}

// Wrap a "(UNNotificationPresentationOptions)" completion handler so it only runs once
static void(^RunOncePresentationCompletionHandler(void(^originalHandler)(UNNotificationPresentationOptions)))(UNNotificationPresentationOptions) {
    __block BOOL called = NO;
    return ^(UNNotificationPresentationOptions options){
        if (!called) {
            called = YES;
            if (originalHandler) originalHandler(options);
        } else {
            // Already called, do nothing
        }
    };
}

@implementation YYFirebaseCloudMessaging

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        class_addProtocol([iPad_RunnerAppDelegate class], @protocol(UNUserNotificationCenterDelegate));
        [self swizzleUserNotificationMethods];
    });
}

+ (void)swizzleUserNotificationMethods {
    Class appDelegateClass = [iPad_RunnerAppDelegate class];

    // willPresentNotification
    [self swizzleMethodInClass:appDelegateClass
              originalSelector:@selector(userNotificationCenter:willPresentNotification:withCompletionHandler:)
              swizzledSelector:@selector(yy_userNotificationCenter:willPresentNotification:withCompletionHandler:)];

    // didReceiveNotificationResponse
    [self swizzleMethodInClass:appDelegateClass
              originalSelector:@selector(userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:)
              swizzledSelector:@selector(yy_userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:)];
}

+ (void)swizzleMethodInClass:(Class)appDelegateClass
            originalSelector:(SEL)originalSelector
            swizzledSelector:(SEL)swizzledSelector {

    Method originalMethod = class_getInstanceMethod(appDelegateClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);

    BOOL didAddMethod = class_addMethod(appDelegateClass,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));

    if (didAddMethod) {
        NSLog(@"[MobileUtils_APN] Added method %@ to class %@", NSStringFromSelector(originalSelector), NSStringFromClass(appDelegateClass));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
        NSLog(@"[MobileUtils_APN] Swizzled method %@ in class %@", NSStringFromSelector(originalSelector), NSStringFromClass(appDelegateClass));
    }
}

#pragma mark - Swizzled Notification Methods

// Swizzled willPresentNotification
- (void)yy_userNotificationCenter:(UNUserNotificationCenter *)center
          willPresentNotification:(UNNotification *)notification
            withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {

    // Wrap the completionHandler with a run-once handler
    void (^onceHandler)(UNNotificationPresentationOptions) = RunOncePresentationCompletionHandler(completionHandler);

    // Call the original if available
    if ([self respondsToSelector:@selector(yy_userNotificationCenter:willPresentNotification:withCompletionHandler:)]) {
        // Here yy_ version is original due to method_exchangeImplementations logic
        [self yy_userNotificationCenter:center willPresentNotification:notification withCompletionHandler:onceHandler];
    }

    // Insert your logic here
    NSLog(@"YYFirebaseCloudMessaging: willPresentNotification");

    UNNotificationTrigger *trigger = notification.request.trigger;
    if ([trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        NSDictionary *userInfo = notification.request.content.userInfo;
        [YYFirebaseCloudMessaging handleIncomingMessage:userInfo];
    }

    onceHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionSound | UNNotificationPresentationOptionBadge);
}

// Swizzled didReceiveNotificationResponse
- (void)yy_userNotificationCenter:(UNUserNotificationCenter *)center
     didReceiveNotificationResponse:(UNNotificationResponse *)response
              withCompletionHandler:(void (^)(void))completionHandler {

    // Wrap the completionHandler with a run-once handler
    void (^onceHandler)(void) = RunOnceVoidCompletionHandler(completionHandler);

    // Call the original if available
    if ([self respondsToSelector:@selector(yy_userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:)]) {
        [self yy_userNotificationCenter:center didReceiveNotificationResponse:response withCompletionHandler:onceHandler];
    }

    // Insert your logic here
    NSLog(@"YYFirebaseCloudMessaging: didReceiveNotificationResponse");

    UNNotificationTrigger *trigger = response.notification.request.trigger;
    if ([trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        NSDictionary *userInfo = response.notification.request.content.userInfo;
        [YYFirebaseCloudMessaging handleIncomingMessage:userInfo];
    }

    onceHandler();
}

#pragma mark - Extension Init

- (instancetype)init {
    self = [super init];

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        id appDelegate = [[UIApplication sharedApplication] delegate];
        center.delegate = appDelegate;
    });
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

    // Request notification permissions
    [self FirebaseCloudMessaging_RequestPermission];

    // Handle any pending notifications using launchOptions
    if (launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey]) {
        NSDictionary *notification = launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey];
        [YYFirebaseCloudMessaging handleIncomingMessage:notification];
    }
}

#pragma mark - FIRMessagingDelegate

- (void)messaging:(FIRMessaging *)messaging didReceiveRegistrationToken:(NSString *)fcmToken {
	NSMutableDictionary *data = [NSMutableDictionary dictionary];
	data[@"value"] = fcmToken;
	[FirebaseUtils sendSocialAsyncEvent:@"FirebaseMessaging_OnNewToken" data:data];
}

#pragma mark - Helper Methods

+ (void)handleIncomingMessage:(NSDictionary *)userInfo {
	[FirebaseUtils sendAsyncEvent:EVENT_OTHER_NOTIFICATION eventType:@"Notification_Remote" data:userInfo];
}

@end