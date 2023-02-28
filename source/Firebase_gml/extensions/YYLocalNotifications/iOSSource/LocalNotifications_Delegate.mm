#import "LocalNotifications.h"
#import "LocalNotifications_Delegate.h"

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

// On the GML side we are inside a push notification event and we have already identified the
// type as being "Notification_Local" so no prefix should be needed at this point it just makes
// the GML code more verbose.
const char*  YYNotification_id = "id";
const char*  YYNotification_title = "title";
const char*  YYNotification_message = "message";
const char*  YYNotification_data = "data";

@implementation LocalNotifications_Delegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions
{
    if([UNUserNotificationCenter class] != nil)// iOS 10 or later
        [[UNUserNotificationCenter currentNotificationCenter] setDelegate:self];
    
    // Check if any superclasses implement this method and call it
    if([[iPad_RunnerAppDelegate class] instancesRespondToSelector:@selector(application:willFinishLaunchingWithOptions:)])
    {
        [super application:application willFinishLaunchingWithOptions:launchOptions];
    }
    
    return TRUE;
}
    
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions
{
    //This is the equivalent of OnNewIntent of android
    //All keys here:
    //https://developer.apple.com/documentation/uikit/uiapplicationlaunchoptionskey
    //dsMapAddString(dsMapIndex,"key",(char*)[key UTF8String]);//for testing propuses
    
//    if(launchOptions != nil)
//    for(NSString *key in launchOptions )//This code can be really usefull in other extensions, so i will just comment it..... :D
    {
        /* !!!!!!!!!DEPRECATE FROM iOS 10!!!!!!! :D
        if([key isEqualToString:@"UIApplicationLaunchOptionsLocalNotificationKey"])
        {
            int dsMapIndex = dsMapCreate();
            dsMapAddString(dsMapIndex,"type","Notification_Local");
            
            UILocalNotification *mUILocalNotification = (UILocalNotification*) [launchOptions objectForKey:key];
            
            NSString *title = mUILocalNotification.userInfo[@"ID_key"];
            dsMapAddString(dsMapIndex,(char*)YYNotification_id,(char*)[title UTF8String]);
            dsMapAddString(dsMapIndex,(char*)YYNotification_message,(char*)[mUILocalNotification.alertBody UTF8String]);
            dsMapAddString(dsMapIndex,(char*)YYNotification_title,(char*)[mUILocalNotification.alertTitle UTF8String]);

            NSString *data = mUILocalNotification.userInfo[@"data_key"];
            dsMapAddString(dsMapIndex,(char*)YYNotification_data, (char*)[data UTF8String]);
            CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_NOTIFICATION);
        }
         */
        
        /*
        if([key isEqualToString:@"UIApplicationLaunchOptionsRemoteNotificationKey"])
        {
            int dsMapIndex = dsMapCreate();
            dsMapAddString(dsMapIndex,"type","Notification_Remote");

            NSDictionary *mDic = (NSDictionary*) [launchOptions objectForKey:key];
            
            dsMapAddString(dsMapIndex,"value",(char*)[[LocalNotifications_Delegate toJSON:mDic] UTF8String]);
            
            CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_NOTIFICATION);
        }
         */
    }
    
    // Check if any superclasses implement this method and call it
    if([[iPad_RunnerAppDelegate class] instancesRespondToSelector:@selector(application:didFinishLaunchingWithOptions:)])
    {
        [super application:application didFinishLaunchingWithOptions:launchOptions];
    }
    return TRUE;
}


-(void) userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler
{
    //app background and pressing the notification
    NSLog(@"LocalNotification: didReceiveNotificationResponse");
    UNNotification *notification = response.notification;
    [LocalNotifications_Delegate handleLocalNotification:notification];
}

-(void) userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
    //app running
    NSLog(@"LocalNotification willPresentNotification");
    [LocalNotifications_Delegate handleLocalNotification:notification];
}

+(NSString*) toJSON:(id) obj
{
    if(obj == nil)
        return @"{}";
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj
                                                           options:0//NSJSONWritingPrettyPrinted
                                                             error:&error];
    if(error == nil)
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    else
        return @"{}";
}


+(void) handleLocalNotification:(UNNotification*) notification
{
    NSLog(@"handleLocalNotification");
    
	int dsMapIndex = dsMapCreate();
    NSString *identifier = notification.request.identifier;
	if([identifier hasPrefix:[LocalNotifications prefix]])
	{
        NSLog(@"is Local");
		NSString *title = notification.request.content.title;
		NSString *body = notification.request.content.body;
		NSString *data = notification.request.content.userInfo[@"data_key"];
		identifier = [identifier substringFromIndex: [[LocalNotifications prefix]length]];
		dsMapAddString(dsMapIndex,(char*)"type",(char*)"Notification_Local");
		dsMapAddString(dsMapIndex,(char*)YYNotification_id, (char*)[identifier UTF8String]);
		dsMapAddString(dsMapIndex,(char*)YYNotification_title, (char*)[title UTF8String]);
		dsMapAddString(dsMapIndex,(char*)YYNotification_message, (char*)[body UTF8String]);
		dsMapAddString(dsMapIndex,(char*)YYNotification_data, (char*)[data UTF8String]);
	}
	else
	{
        NSLog(@"is Remote");
		dsMapAddString(dsMapIndex, (char*)"type",(char*)"Notification_Remote");
		NSDictionary *data = notification.request.content.userInfo;
		for(id key in data)
		{
			NSString *value = [LocalNotifications_Delegate JSONorString:[data objectForKey:key]];
            if(![value isEqualToString: @"ignore me"])
                dsMapAddString(dsMapIndex, (char*) [key UTF8String], (char*)[value UTF8String]);
		}
	}
	CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_NOTIFICATION);
}

+(NSString*) JSONorString:(id) obj
{
    if([obj isKindOfClass:[NSString class]])
        return (NSString *) obj;
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj
                                                           options:0//NSJSONWritingPrettyPrinted
                                                             error:&error];
    if(error == nil)
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    else
        return @"ignore me";
}

@end
