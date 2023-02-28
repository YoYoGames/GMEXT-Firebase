
#import "YYFirebaseCrashlytics.h"
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

@implementation YYFirebaseCrashlytics

-(id) init
{
	if(self = [super init])
	{
		if(![FIRApp defaultApp])
			[FIRApp configure];
			
		return self;
	}
}

//https://firebase.google.com/docs/reference/ios/crashlytics/api/reference/Classes/Crashlytics?hl=es#-crash

-(void) FirebaseCrashlytics_SetUserIdentifier:(NSString*) string
{
    [[FIRCrashlytics crashlytics] setUserID:string];
}

-(void) FirebaseCrashlytics_SetCustomKey:(NSString*)key value:(id) value
{
    [[FIRCrashlytics crashlytics] setCustomValue:value forKey:key];
}

// -(void) FirebaseCrashlytics_SetCustomKeys:(NSString*)json;
// {
    // NSError *jsonError;
    // NSData *objectData = [JSON_value dataUsingEncoding:NSUTF8StringEncoding];
    // NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:objectData options:NSJSONReadingMutableContainers error:&jsonError];
    // [[FIRCrashlytics crashlytics] setCustomKeysAndValues:dic];
// }

-(void) FirebaseCrashlytics_Log: (NSString*) message
{
    [[FIRCrashlytics crashlytics] log: message];
}

-(void) FirebaseCrashlytics_Crash: (NSString*) message
{
    @throw [NSException exceptionWithName:@"RuntimeException" reason:message userInfo:nil];
}

-(void) FirebaseCrashlytics_RecordException: (NSString*) message
{
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    NSError *error = [NSError errorWithDomain:bundleIdentifier code:-4 userInfo:@{NSLocalizedDescriptionKey:message}];

	[[FIRCrashlytics crashlytics] recordError: error];
}

-(void) FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set:(double) bool_
{	
	[[FIRCrashlytics crashlytics] setCrashlyticsCollectionEnabled:bool_ >= 0.5];
}

-(double) FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check
{	
	if([[FIRCrashlytics crashlytics] isCrashlyticsCollectionEnabled])
        return 1.0;
    else
        return 0.0;
}

-(double) FirebaseCrashlytics_DidCrashOnPreviousExecution
{	
	if([[FIRCrashlytics crashlytics] didCrashDuringPreviousExecution])
        return 1.0;
    else
        return 0.0;
}

-(void) FirebaseCrashlytics_UnsentReports_Delete
{	
	[[FIRCrashlytics crashlytics] deleteUnsentReports];
}

-(void) FirebaseCrashlytics_UnsentReports_Send
{	
	[[FIRCrashlytics crashlytics] sendUnsentReports];
}

-(void) FirebaseCrashlytics_UnsentReports_Check
{
    [[FIRCrashlytics crashlytics] checkAndUpdateUnsentReportsWithCompletion:^(FIRCrashlyticsReport * _Nullable report) {
        
		int dsMapIndex = dsMapCreate();
		dsMapAddString(dsMapIndex, (char*)"type",(char*)"FirebaseCrashlytics_UnsentReports_Check");
		
		if(report == nil)
			dsMapAddDouble(dsMapIndex,(char*) "value",0);
		else
			dsMapAddDouble(dsMapIndex, (char*)"value",1);
		
		createSocialAsyncEventWithDSMap(dsMapIndex);
    }];
}

@end

