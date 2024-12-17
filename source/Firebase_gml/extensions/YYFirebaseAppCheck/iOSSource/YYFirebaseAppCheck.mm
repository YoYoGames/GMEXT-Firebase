
#import "YYFirebaseAppCheck.h"
#import "FirebaseUtils.h"



@interface YourAppCheckProviderFactory : NSObject <FIRAppCheckProviderFactory>
@end

@implementation YourAppCheckProviderFactory

- (nullable id<FIRAppCheckProvider>)createProviderWithApp:(nonnull FIRApp *)app {
  if (@available(iOS 14.0, *)) {
    return [[FIRAppAttestProvider alloc] initWithApp:app];
  } else {
    return [[FIRDeviceCheckProvider alloc] initWithApp:app];
  }
}

@end

@implementation YYFirebaseAppCheck

- (id)init {
	self = [super init];
	if (self) {
		
		[[FirebaseUtils sharedInstance] registerInitFunction:^{
			YourAppCheckProviderFactory *providerFactory = [[YourAppCheckProviderFactory alloc] init];
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

