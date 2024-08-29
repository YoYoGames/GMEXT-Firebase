
#import "LocalNotifications.h"
#import "LocalNotifications_Delegate.h"
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

@implementation LocalNotifications

+ (NSString*) prefix
{
    return @"YYLocalNotification"; 
}

-(void) LocalPushNotification_Create:(NSString*) ID fire_time: (double) fire_time title: (NSString*) title message:(NSString*) message data:(NSString*) data
{
	NSString *ID_withPrefix = [[LocalNotifications prefix] stringByAppendingString:ID];
	
    UNMutableNotificationContent *content = [UNMutableNotificationContent new];
    content.title = title;
    content.body = message;
    content.sound = [UNNotificationSound defaultSound];
    content.userInfo = @{@"data_key" : data};//, @"ID_key":ID};//ID_Key used for deprecated function from ios 10......

    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:fire_time repeats:NO];

    NSArray *array = [NSArray arrayWithObjects:ID_withPrefix, nil];
    [[UNUserNotificationCenter currentNotificationCenter] removePendingNotificationRequestsWithIdentifiers:array];

    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:ID_withPrefix content:content trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error)
    {
        if (error)
            NSLog(@"Local Notification failed");
    }];
}

-(void) LocalPushNotification_Create_Ext:(NSString*) ID fire_time: (double) fire_time title: (NSString*) title message:(NSString*) message data:(NSString*) data imagePath:(NSString*) imagePath
{
	NSLog(@"LocalPushNotification_Create_Ext :: not compatible with iOS");
}

-(void) LocalPushNotification_Cancel:(NSString*) ID
{
	ID = [[LocalNotifications prefix] stringByAppendingString:ID];
    UNUserNotificationCenter *center_cancel = [UNUserNotificationCenter currentNotificationCenter];
    NSArray *array = [NSArray arrayWithObjects:ID, nil];
    [center_cancel removePendingNotificationRequestsWithIdentifiers:array];
}

-(void) LocalPushNotification_iOS_Permission_Request
{
	if([UNUserNotificationCenter class] != nil)
	{
		// iOS 10 or later
		// For iOS 10 display notification (sent via APNS)
		UNAuthorizationOptions authOptions = UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge;
		[[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:authOptions completionHandler:^(BOOL granted, NSError * _Nullable error)
		 {
            
			int dsMapIndex = dsMapCreate();
			dsMapAddString(dsMapIndex, (char*)"type",(char*)"LocalPushNotification_iOS_Permission_Request");
			
			if(error == nil)
				dsMapAddDouble(dsMapIndex,(char*)"success",1.0);
			else
				dsMapAddDouble(dsMapIndex,(char*)"success",0.0);
			
            if(granted)
            {
                [[UNUserNotificationCenter currentNotificationCenter] setDelegate:(LocalNotifications_Delegate*)[UIApplication sharedApplication].delegate];
                dsMapAddDouble(dsMapIndex,(char*)"value",1.0);
            }
            else
                dsMapAddDouble(dsMapIndex,(char*)"value",0.0);
            
			CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
		 }];
	}
	else
	{
		// iOS 10 notifications aren't available; fall back to iOS 8-9 notifications.
		UIUserNotificationType allNotificationTypes = (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge);
		UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:allNotificationTypes categories:nil];
		[[UIApplication sharedApplication] registerUserNotificationSettings:settings];
		
			int dsMapIndex = dsMapCreate();//iOS < 10? go ahead
			dsMapAddString(dsMapIndex, (char*)"type",(char*)"LocalPushNotification_iOS_Permission_Request");
			dsMapAddDouble(dsMapIndex,(char*)"success",1.0);
			dsMapAddDouble(dsMapIndex,(char*)"value",1.0);
			CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
	}
    [[UIApplication sharedApplication] registerForRemoteNotifications];
}

-(void) LocalPushNotification_iOS_Permission_Status
{
	UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
	[center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings *settings)
	{
		int dsMapIndex = dsMapCreate();
		dsMapAddString(dsMapIndex, (char*)"type",(char*)"LocalPushNotification_iOS_Permission_Status");
		
		switch (settings.authorizationStatus) 
		{
			case UNAuthorizationStatusAuthorized:
				dsMapAddString(dsMapIndex, (char*)"value",(char*)"Authorized");
			break;
			
			case UNAuthorizationStatusDenied:
				dsMapAddString(dsMapIndex,(char*) "value",(char*)"Denied");
			break;
			
			case UNAuthorizationStatusNotDetermined:
				dsMapAddString(dsMapIndex, (char*)"value",(char*)"NotDetermined");
			break;
		}
		CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
	}];
}

-(void) userNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification
{
    NSLog(@"LocalNotification openSettingsForNotification");
}

@end
