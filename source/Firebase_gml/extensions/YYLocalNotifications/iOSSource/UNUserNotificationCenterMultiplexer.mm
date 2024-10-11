#import "UNUserNotificationCenterMultiplexer.h"

@interface UNUserNotificationCenterMultiplexer ()

// Use a weak hash table to prevent retain cycles
@property (nonatomic, strong) NSHashTable<id<UNUserNotificationCenterDelegate>> *delegates;
@property (nonatomic, weak) id<UNUserNotificationCenterDelegate> previousDelegate;

@end

@implementation UNUserNotificationCenterMultiplexer

+ (instancetype)sharedInstance {
    static UNUserNotificationCenterMultiplexer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[UNUserNotificationCenterMultiplexer alloc] init];
        
        // Move the delegate assignment code here
        [sharedInstance setAsDelegateIfNeeded];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.delegates = [NSHashTable weakObjectsHashTable];
    }
    return self;
}

- (void)setAsDelegateIfNeeded {
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    if (center.delegate != self) {
        if (center.delegate && center.delegate != self) {
            // If there's an existing delegate that's not the multiplexer, store it
            NSLog(@"Storing previous delegate");
            self.previousDelegate = center.delegate;
        }
        NSLog(@"Setting YYLocalNotification multiplexer");
        [center setDelegate:self];
    }
}

- (void)registerDelegate:(id<UNUserNotificationCenterDelegate>)delegate {
    NSLog(@"Registering using YYLocalNotification multiplexer");
    @synchronized (self.delegates) {
        [self.delegates addObject:delegate];
    }
}

#pragma mark - UNUserNotificationCenterDelegate Methods

- (void)userNotificationCenter:(UNUserNotificationCenter *)center 
        willPresentNotification:(UNNotification *)notification 
        withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {

    __block BOOL handled = NO;
    __block UNNotificationPresentationOptions options = UNNotificationPresentationOptionNone;
    
    // Forward to all registered delegates
    for (id<UNUserNotificationCenterDelegate> delegate in self.delegates) {
        NSLog(@"Going through registered delegates");
        if ([delegate respondsToSelector:@selector(userNotificationCenter:willPresentNotification:withCompletionHandler:)]) {
            [delegate userNotificationCenter:center willPresentNotification:notification withCompletionHandler:^(UNNotificationPresentationOptions delegateOptions) {
                handled = YES;
                options |= delegateOptions;
            }];
        }
    }

    // Forward to previous delegate if not already handled
    if (self.previousDelegate && [self.previousDelegate respondsToSelector:@selector(userNotificationCenter:willPresentNotification:withCompletionHandler:)]) {
        NSLog(@"Going through previous delegate");
        [self.previousDelegate userNotificationCenter:center willPresentNotification:notification withCompletionHandler:^(UNNotificationPresentationOptions delegateOptions) {
            handled = YES;
            options |= delegateOptions;
        }];
    }

    // Call completionHandler with accumulated options
    completionHandler(options);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center 
        didReceiveNotificationResponse:(UNNotificationResponse *)response 
        withCompletionHandler:(void (^)(void))completionHandler {

    dispatch_group_t group = dispatch_group_create();
    __block BOOL handled = NO;
    
    // Forward to all registered delegates
    for (id<UNUserNotificationCenterDelegate> delegate in self.delegates) {
        NSLog(@"Going through registered delegates");
        if ([delegate respondsToSelector:@selector(userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:)]) {
            dispatch_group_enter(group);
            [delegate userNotificationCenter:center didReceiveNotificationResponse:response withCompletionHandler:^{
                handled = YES;
                dispatch_group_leave(group);
            }];
        }
    }

    // Forward to previous delegate if not already handled
    if (self.previousDelegate && [self.previousDelegate respondsToSelector:@selector(userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:)]) {
        NSLog(@"Going through previous delegate");
        dispatch_group_enter(group);
        [self.previousDelegate userNotificationCenter:center didReceiveNotificationResponse:response withCompletionHandler:^{
            handled = YES;
            dispatch_group_leave(group);
        }];
    }

    // Wait for all completion handlers to be called
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        completionHandler();
    });
}

@end
