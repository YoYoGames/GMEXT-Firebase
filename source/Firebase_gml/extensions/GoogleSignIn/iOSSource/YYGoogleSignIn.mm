
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

@implementation YYGoogleSignIn

-(void) GoogleSignIn_Show:(NSString*) clientID
{
    GIDConfiguration *signInConfig = [[GIDConfiguration alloc] initWithClientID:clientID];
    
    [GIDSignIn.sharedInstance signInWithConfiguration:signInConfig presentingViewController:g_controller callback:^(GIDGoogleUser * _Nullable user,NSError * _Nullable error) 
	{
		if (error) 
		{
			int dsMapIndex = dsMapCreate();
			dsMapAddString(dsMapIndex, "type","GoogleSignIn_Show");
			dsMapAddDouble(dsMapIndex, "success",0.0);
			createSocialAsyncEventWithDSMap(dsMapIndex);
			return;
		}

		int dsMapIndex = dsMapCreate();

		dsMapAddString(dsMapIndex, "type","GoogleSignIn_Show");
		dsMapAddDouble(dsMapIndex, "success",1.0);

		if(user.authentication.idToken != nil)
			dsMapAddString(dsMapIndex,"idToken",(char*)[user.authentication.idToken UTF8String]);
		if(user.profile.name != nil)
			dsMapAddString(dsMapIndex,"displayName",(char*)[user.profile.name UTF8String]);
		if(user.profile.familyName != nil)
			dsMapAddString(dsMapIndex,"familyName",(char*)[user.profile.familyName UTF8String]);
		if(user.profile.givenName != nil)
			dsMapAddString(dsMapIndex,"givenName",(char*)[user.profile.givenName UTF8String]);
		if(user.profile.familyName != nil)
			dsMapAddString(dsMapIndex,"familyName",(char*)[user.profile.familyName UTF8String]);
		if(user.profile.email != nil)
			dsMapAddString(dsMapIndex,"email",(char*)[user.profile.email UTF8String]);
		if(user.userID != nil)
			dsMapAddString(dsMapIndex,"userId",(char*)[user.userID UTF8String]);

		createSocialAsyncEventWithDSMap(dsMapIndex);
	}];
}

-(void) GoogleSignIn_SignOut
{
    [GIDSignIn.sharedInstance disconnectWithCallback:^(NSError * _Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex, "type","GoogleSignIn_SignOut");
        if(error == nil)
            dsMapAddDouble(dsMapIndex, "success",1.0);
        else
            dsMapAddDouble(dsMapIndex, "success",0.0);
        createSocialAsyncEventWithDSMap(dsMapIndex);
    }];
}
@end

