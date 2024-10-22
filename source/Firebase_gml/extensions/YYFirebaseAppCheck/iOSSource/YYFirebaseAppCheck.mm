
#import "YYFirebaseAppCheck.h"
#import <UIKit/UIKit.h>

const int EVENT_OTHER_SOCIAL = 70;
extern int CreateDsMap( int _num, ... );
extern void CreateAsynEventWithDSMap(int dsmapindex, int event_index);
extern UIViewController *g_controller;
extern UIView *g_glView;
extern int g_DeviceWidth;
extern int g_DeviceHeight;

extern "C" void dsMapClear(int _dsMap );
extern "C" int dsMapCreate();
extern "C" void dsMapAddInt(int _dsMap, char* _key, int _value);
extern "C" void dsMapAddDouble(int _dsMap, char* _key, double _value);
extern "C" void dsMapAddString(int _dsMap, char* _key, char* _value);

extern "C" int dsListCreate();
extern "C" void dsListAddInt(int _dsList, int _value);
extern "C" void dsListAddString(int _dsList, char* _value);
extern "C" const char* dsListGetValueString(int _dsList, int _listIdx);
extern "C" double dsListGetValueDouble(int _dsList, int _listIdx);
extern "C" int dsListGetSize(int _dsList);

extern "C" void createSocialAsyncEventWithDSMap(int dsmapindex);

extern "C" const char* extGetVersion(char* _ext);
extern "C" const char* extOptGetString(char* _ext, char* _opt);


//https://firebase.google.com/docs/app-check/ios/app-attest-provider

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

-(id) init
{
    if (self = [super init]) {
    }
    return self; // Always return self at the end.
}


- (nullable id<FIRAppCheckProvider>)createProviderWithApp:(nonnull FIRApp *)app 
{
  if (@available(iOS 14.0, *)) {
    return [[FIRAppAttestProvider alloc] initWithApp:app];
  } else {
    return [[FIRDeviceCheckProvider alloc] initWithApp:app];
  }
}

-(void) FirebaseAppCheck_Init_Extension
{
	if (strcmp(extGetVersion("YYFirebaseAppCheck"), "null") != 0)
	{
		YourAppCheckProviderFactory *providerFactory = [[YourAppCheckProviderFactory alloc] init];
		[FIRAppCheck setAppCheckProviderFactory:providerFactory];
		
		if (![FIRApp defaultApp]) {
			[FIRApp configure];
		}
	}
}

@end

