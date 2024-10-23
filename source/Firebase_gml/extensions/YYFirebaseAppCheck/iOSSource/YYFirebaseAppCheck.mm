
#import "YYFirebaseAppCheck.h"
#import "FirebaseUtils.h"

@implementation YYFirebaseAppCheck

- (id)init {
	self = [super init];
	if (self) {
		[[FirebaseUtils sharedInstance] registerInitFunction:^{
			[FIRAppCheck setAppCheckProviderFactory:self];
		} withPriority:1];
	}
	return self;
}

- (nullable id<FIRAppCheckProvider>)createProviderWithApp:(nonnull FIRApp *)app {
	if (@available(iOS 14.0, *)) {
		return [[FIRAppAttestProvider alloc] initWithApp:app];
	} else {
		return [[FIRDeviceCheckProvider alloc] initWithApp:app];
	}
}


@end

