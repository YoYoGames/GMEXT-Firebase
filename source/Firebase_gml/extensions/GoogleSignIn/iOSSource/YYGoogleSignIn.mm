
#import "YYGoogleSignIn.h"

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

extern "C" const char* extOptGetString(char* _ext, char* _opt);

@implementation YYGoogleSignIn

-(void) GoogleSignIn_Show
{
	const char *clientIDCString = extOptGetString("GoogleSignIn", "iosClientID");
	NSString *clientID = [NSString stringWithCString:clientIDCString encoding:NSUTF8StringEncoding];

	// Append ".apps.googleusercontent.com" to the clientID
	NSString *fullClientID = [clientID stringByAppendingString:@".apps.googleusercontent.com"];

	GIDConfiguration *signInConfig = [[GIDConfiguration alloc] initWithClientID:fullClientID];
    
    [GIDSignIn.sharedInstance signInWithConfiguration:signInConfig presentingViewController:g_controller callback:^(GIDGoogleUser * _Nullable user,NSError * _Nullable error) 
	{
		int dsMapIndex = dsMapCreate();
		dsMapAddString(dsMapIndex, "type","GoogleSignIn_Show");

		if (error) 
		{
			dsMapAddDouble(dsMapIndex, "success", 0.0);
			createSocialAsyncEventWithDSMap(dsMapIndex);
			return;
		}
		else
		{
			dsMapAddDouble(dsMapIndex, "success",1.0);
			if(user.authentication.idToken != nil) 
			{
				dsMapAddString(dsMapIndex,"idToken",(char*)[user.authentication.idToken UTF8String]);
			}
		}
		
		createSocialAsyncEventWithDSMap(dsMapIndex);
	}];
}

-(void) GoogleSignIn_SignOut
{
    [GIDSignIn.sharedInstance disconnectWithCallback:^(NSError * _Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex, "type","GoogleSignIn_SignOut");
        dsMapAddDouble(dsMapIndex, "success", error == nil ? 1.0 : 0.0);
        createSocialAsyncEventWithDSMap(dsMapIndex);
    }];
}

@end

