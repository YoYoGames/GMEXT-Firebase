
#import "YYFirebaseRemoteConfig.h"
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

@implementation YYFirebaseRemoteConfig

-(id) init
{
	if(self = [super init])
	{
		if(![FIRApp defaultApp])
			[FIRApp configure];
			
		return self;
	}
}

//https://firebase.google.com/docs/reference/ios/firebaseremoteconfig/api/reference/Classes/FIRRemoteConfig
-(void) FirebaseRemoteConfig_Initialize:(double) seconds
{
    FIRRemoteConfigSettings *remoteConfigSettings = [[FIRRemoteConfigSettings alloc] init];
    remoteConfigSettings.minimumFetchInterval = seconds;
    [FIRRemoteConfig remoteConfig].configSettings = remoteConfigSettings;
    
    //[[FIRRemoteConfig remoteConfig] setDefaultsFromPlistFileName:@"GoogleService-Info.plist"];
}
    
-(void) FirebaseRemoteConfig_FetchAndActivate
{
    [[FIRRemoteConfig remoteConfig] fetchAndActivateWithCompletionHandler:^(FIRRemoteConfigFetchAndActivateStatus status, NSError * _Nullable error)
    {
        int dsMapIndex = dsMapCreate();
        dsMapAddString(dsMapIndex, "type","FirebaseRemoteConfig_FetchAndActivate");
        
        if(status == FIRRemoteConfigFetchAndActivateStatusSuccessFetchedFromRemote)
            dsMapAddDouble(dsMapIndex, "success",1.0);
        else
        {
            dsMapAddDouble(dsMapIndex, "success",0.0);
			if(error)
				NSLog([error localizedDescription]);
        }
        
        createSocialAsyncEventWithDSMap(dsMapIndex);
    }];
}

-(void) FirebaseRemoteConfig_Reset
{
	NSLog(@"FirebaseRemoteConfig_Reset: This function is not compatible with iOS");
    // // A whole pod for only this function...... :)
    // [[FIRInstallations installations] deleteWithCompletion:^(NSError * _Nullable error)
    // {
        // int dsMapIndex = dsMapCreate();
        // dsMapAddString(dsMapIndex, "type","FirebaseRemoteConfig_Reset");
        
        // if(error == nil)
            // dsMapAddDouble(dsMapIndex, "success",1.0);
        // else
        // {
            // dsMapAddDouble(dsMapIndex, "success",0.0);
            // NSLog([error localizedDescription]);
        // }
        
        // createSocialAsyncEventWithDSMap(dsMapIndex);
    // }];
}

-(void) FirebaseRemoteConfig_SetDefaultsAsync:(NSString*) json
{
	
    NSError *jsonError;
    NSData *objectData = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonMap = [NSJSONSerialization JSONObjectWithData:objectData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&jsonError];
	
    [[FIRRemoteConfig remoteConfig] setDefaults:jsonMap];
}

-(NSString*) FirebaseRemoteConfig_GetKeys
{
    NSArray<NSString *> *remoteKeys = [[FIRRemoteConfig remoteConfig] allKeysFromSource:FIRRemoteConfigSourceRemote];
    
    NSMutableArray<NSString*> *array = [remoteKeys mutableCopy];
    
    NSArray<NSString *> *defaultKeys = [[FIRRemoteConfig remoteConfig] allKeysFromSource:FIRRemoteConfigSourceDefault];
    
    for(int a = 0 ; a < [defaultKeys count] ; a++)
    if(![array containsObject:defaultKeys[a]])
        [array addObject:defaultKeys[a]];
    
    return [YYFirebaseRemoteConfig toJSON: array];
}

-(NSString*) FirebaseRemoteConfig_GetString:(NSString*) key
{
   return [[[FIRRemoteConfig remoteConfig] configValueForKey:key] stringValue];
}

-(double) FirebaseRemoteConfig_GetDouble:(NSString*) key
{
    return [[[[FIRRemoteConfig remoteConfig] configValueForKey:key] numberValue] doubleValue];
}

+(NSString*) toJSON:(id) obj
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj
                                                           options:0//NSJSONWritingPrettyPrinted
                                                             error:&error];
    if(error == nil)
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    else
        return @"{}";
}

@end

