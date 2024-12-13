#import "YYFirebaseSetup.h"
#import "FirebaseUtils.h"

// Private interface
@interface YYFirebaseSetup ()

@end

@implementation YYFirebaseSetup

- (id)init {
	self = [super init];
	if (self) {
		[[FirebaseUtils sharedInstance] registerInitFunction:^{
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

		} withPriority: 5];
	}
	return self;
}

#pragma mark - SDK Initialization

- (void) SDKFirebaseSetup_Init {
	// This will initialize the modules following the priority schema
	[[FirebaseUtils sharedInstance] initializeAll];
}

@end
