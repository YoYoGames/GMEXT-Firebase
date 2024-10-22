#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h>

@interface UNUserNotificationCenterMultiplexer : NSObject <UNUserNotificationCenterDelegate>

+ (instancetype)sharedInstance;

// Register modules that need to receive notification callbacks
- (void)registerDelegate:(id<UNUserNotificationCenterDelegate>)delegate;

@end