
#import "YYFirebaseAppCheck.h"
#import "FirebaseUtils.h"

${YYIos_AppCheck_Provider}

@interface AutoAppCheckProviderFactory : NSObject <FIRAppCheckProviderFactory>
@end

@implementation AutoAppCheckProviderFactory

- (nullable id<FIRAppCheckProvider>)createProviderWithApp:(nonnull FIRApp *)app {
if (@available(iOS 14.0, *)) {
		return [[FIRAppAttestProvider alloc] initWithApp:app];
	} else {
		// iOS 13 and earlier
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
		return [[FIRDeviceCheckProvider alloc] initWithApp:app];
#pragma clang diagnostic pop
	}
}

@end

@implementation YYFirebaseAppCheck

- (id)init {
	self = [super init];
	if (self) {
		
		[[FirebaseUtils sharedInstance] registerInitFunction:^{

#ifdef __FIREBASE_APPCHECK_DEBUG_PROVIDER__
			id<FIRAppCheckProviderFactory> providerFactory = [[FIRAppCheckDebugProviderFactory alloc] init];
#else
			id<FIRAppCheckProviderFactory> providerFactory = [[AutoAppCheckProviderFactory alloc] init];
#endif
			[FIRAppCheck setAppCheckProviderFactory:providerFactory];
			
		} withPriority:1];
	}
	return self;
}

-(void) FirebaseAppCheck_GetToken:(double)_force_refresh
{
    [[FIRAppCheck appCheck] tokenForcingRefresh:_force_refresh>0.5 completion:^(FIRAppCheckToken * _Nullable token, NSError * _Nullable error) {
        
        NSMutableDictionary *data = [NSMutableDictionary dictionary];
        
		if(error)
		{
			data[@"success"] = @(0.0);
			//data[@"error"] = [error message];
		}
		else
		{
			data[@"token"] = [token token];
			data[@"success"] = @(1.0);
		}
        
        [FirebaseUtils sendSocialAsyncEvent:@"FirebaseAppCheck_GetToken" data:data];
    }];
}

-(void) FirebaseAppCheck_LimitedUseToken
{
	[[FIRAppCheck appCheck] limitedUseTokenWithCompletion:^(FIRAppCheckToken * _Nullable token, NSError * _Nullable error) {
        
        NSMutableDictionary *data = [NSMutableDictionary dictionary];
        
		if(error)
		{
			data[@"success"] = @(0.0);
			//data[@"error"] = [error message];
		}
		else
		{
			data[@"token"] = [token token];
			data[@"success"] = @(1.0);
		}
        
        [FirebaseUtils sendSocialAsyncEvent:@"FirebaseAppCheck_LimitedUseToken" data:data];
    }];
}

@end

