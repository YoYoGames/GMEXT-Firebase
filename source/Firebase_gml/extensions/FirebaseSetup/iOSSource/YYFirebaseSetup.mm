#import "YYFirebaseSetup.h"

extern "C" const char* extGetVersion(char* _ext);
extern "C" const char* extOptGetString(char* _ext, char* _opt);

// Private interface
@interface YYFirebaseSetup ()

@end

@implementation YYFirebaseSetup

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

-(void) FirebaseSetup_Init
{
    if (strcmp(extGetVersion((char*)"YYFirebaseAppCheck"), "undefined") != 0)
		return;
		
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

@end
