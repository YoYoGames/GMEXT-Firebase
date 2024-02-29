
#import "YYFirebaseAnalytics.h"
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

@implementation YYFirebaseAnalytics

    -(id) init
    {
        if(self = [super init])
        {
			if(![FIRApp defaultApp])
				[FIRApp configure];
				
            return self;
        }
    }
        
    -(void) FirebaseAnalytics_SetAnalyticsCollectionEnabled:(double) enabled
    {
        if(enabled >= .5)
            [FIRAnalytics setAnalyticsCollectionEnabled:YES];
        else
            [FIRAnalytics setAnalyticsCollectionEnabled:NO];
    }

    -(void) FirebaseAnalytics_LogEvent:(NSString*) event Value:(NSString*) json
    {
        [FIRAnalytics logEventWithName:event parameters:[YYFirebaseAnalytics jsonStringToMutableDictionary: json]];
    }
    
    -(void) FirebaseAnalytics_ResetAnalyticsData:(NSString*) event Value:(NSString*) JSON_value
    {
        [FIRAnalytics resetAnalyticsData];
    }
    
    -(void) FirebaseAnalytics_SetDefaultEventParameters:(NSString*) json
    {
        [FIRAnalytics setDefaultEventParameters:[YYFirebaseAnalytics jsonStringToMutableDictionary: json]];
    }
    
    -(void) FirebaseAnalytics_SetSessionTimeoutInterval:(double) time
    {
        [FIRAnalytics setSessionTimeoutInterval:(long)time];
    }
    
    -(void) FirebaseAnalytics_SetUserID:(NSString*) userID
    {
        [FIRAnalytics setUserID:userID];
    }
    
    -(void) FirebaseAnalytics_SetUserPropertyString:(NSString*) event Value:(NSString*) value
    {
        [FIRAnalytics setUserPropertyString:value forName:event];
    }
    
    -(void) FirebaseAnalytics_SetConsent:(double) ads analytics:(double) analytics
    {
        /* Xcode not found constants... https://firebase.google.com/docs/reference/ios/firebaseanalytics/api/reference/Type-Definitions
        
        NSMutableDictionary *dic = [NSMutableDictionary new];
        
        if(ads >= 0.5)
            [dic setObject: ConsentStatus.granted forKey: ConsentType.adStorage];
        else
            [dic setObject: ConsentStatus.denied forKey: ConsentType.adStorage];
            
        if(analytics >= 0.5)
            [dic setObject: ConsentStatus.granted forKey:ConsentType.analyticsStorage];
        else
            [dic setObject: ConsentStatus.denied forKey:ConsentType.analyticsStorage];
            
        [FIRAnalytics setConsent:dic];
        */
    }
    
    + (NSMutableDictionary *)jsonStringToMutableDictionary:(NSString *)jsonString {
        NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        
        id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        
        if (error) {
            NSLog(@"Failed to convert JSON string to NSMutableDictionary: %@", [error localizedDescription]);
            return [NSMutableDictionary dictionary];
        }
        
        if ([jsonObject isKindOfClass:[NSMutableDictionary class]]) {
            return (NSMutableDictionary *)jsonObject;
        } else {
            NSLog(@"JSON string did not produce a dictionary as expected.");
            return [NSMutableDictionary dictionary];
        }
    }

@end
