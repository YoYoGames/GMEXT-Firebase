#import "YYFirebaseSetup.h"

// Private interface
@interface YYFirebaseSetup ()

@end

@implementation YYFirebaseSetup

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        // Initialize Firebase if needed
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            if (![FIRApp defaultApp]) {
                [FIRApp configure];
                NSLog(@"Firebase initialized in YYFirebaseSetup");
            }
            else {
                NSLog(@"[ERROR] YYFirebaseSetup :: Firebase was already initialized");
            }
        });
    }
    return self;
}

@end