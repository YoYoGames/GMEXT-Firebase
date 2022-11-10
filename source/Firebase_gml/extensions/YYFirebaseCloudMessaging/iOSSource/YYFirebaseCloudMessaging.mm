
#import "YYFirebaseCloudMessaging.h"
#import <UIKit/UIKit.h>

const int EVENT_OTHER_SOCIAL = 70;
const int EVENT_OTHER_NOTIFICATION = 71;
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

@implementation YYFirebaseCloudMessaging
   
	-(id) init
	{
		if(self = [super init])
		{
			if(![FIRApp defaultApp])
				[FIRApp configure];
			
			[FIRMessaging messaging].delegate = self;
			
			return self;
		}
	}
	
	- (void)messaging:(FIRMessaging *)messaging didReceiveRegistrationToken:(NSString *)fcmToken
	{
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex, "type","FirebaseMessaging_OnNewToken");
		if(fcmToken != nil)
			dsMapAddString(dsMapIndex, "value",(char*)[fcmToken UTF8String]);
		createSocialAsyncEventWithDSMap(dsMapIndex);
	}
	
	-(void) FirebaseCloudMessaging_GetToken
	{
		[[FIRMessaging messaging] tokenWithCompletion:^(NSString * _Nullable token, NSError * _Nullable error) 
		{
			int dsMapIndex = dsMapCreate();
			dsMapAddString(dsMapIndex, "type","FirebaseCloudMessaging_GetToken");
			if(error == nil)
			{
				dsMapAddDouble(dsMapIndex, "success",1.0);
				dsMapAddString(dsMapIndex, "value",(char*)[token UTF8String]);
			}
			else
				dsMapAddDouble(dsMapIndex, "success",0.0);
			createSocialAsyncEventWithDSMap(dsMapIndex);
		}];
	}
		
	-(void) FirebaseCloudMessaging_SubscribeToTopic:(NSString*) Topic
	{
		[[FIRMessaging messaging] subscribeToTopic:Topic completion:^(NSError * _Nullable error)
		{
			int dsMapIndex = dsMapCreate();
			dsMapAddString(dsMapIndex, "type","FirebaseCloudMessaging_SubscribeToTopic");
            dsMapAddString(dsMapIndex, "topic",(char*)[Topic UTF8String]);

			if(error == nil)
				dsMapAddDouble(dsMapIndex, "success",1.0);
			else
				dsMapAddDouble(dsMapIndex, "success",0.0);
			createSocialAsyncEventWithDSMap(dsMapIndex);
		}];		
	}
	
	-(void) FirebaseCloudMessaging_UnsubscribeFromTopic:(NSString*) Topic
	{
		[[FIRMessaging messaging] unsubscribeFromTopic: Topic completion:^(NSError * _Nullable error) 
		{
			int dsMapIndex = dsMapCreate();
			dsMapAddString(dsMapIndex, "type","FirebaseCloudMessaging_UnsubscribeFromTopic");
            dsMapAddString(dsMapIndex, "topic",(char*)[Topic UTF8String]);

			if(error == nil)
				dsMapAddDouble(dsMapIndex, "success",1.0);
			else
				dsMapAddDouble(dsMapIndex, "success",0.0);
			createSocialAsyncEventWithDSMap(dsMapIndex);
		}];
	}

	-(double) FirebaseCloudMessaging_IsAutoInitEnabled
	{
		if([FIRMessaging messaging].autoInitEnabled)
			return 1.0;
		else
			return 0.0;
	}
	
	-(void) FirebaseCloudMessaging_SetAutoInitEnabled:(double) eneable
	{
		[FIRMessaging messaging].autoInitEnabled = eneable >= 0.5;
	}
	
	-(void) FirebaseCloudMessaging_DeleteToken
	{
		[[FIRMessaging messaging] deleteTokenWithCompletion:^(NSError * _Nullable error) 
		{
			int dsMapIndex = dsMapCreate();
			dsMapAddString(dsMapIndex, "type","FirebaseCloudMessaging_DeleteToken");
			if(error == nil)
				dsMapAddDouble(dsMapIndex, "success",1.0);
			else
				dsMapAddDouble(dsMapIndex, "success",0.0);
			createSocialAsyncEventWithDSMap(dsMapIndex);
		}];
	}
	
@end

