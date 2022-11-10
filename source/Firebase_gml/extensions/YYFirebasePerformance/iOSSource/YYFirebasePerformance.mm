
#import "YYFirebasePerformance.h"
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

@implementation YYFirebasePerformance

	-(id) init
	{
		if(self = [super init])
		{
			if(![FIRApp defaultApp])
				[FIRApp configure];
				
			return self;
		}
	}

    -(void) Init
    {
	   Map_Trace = [[NSMutableDictionary alloc]init];
	   Map_HttpMetric = [[NSMutableDictionary alloc]init];
    }

-(double) FirebasePerformance_isPerformanceCollectionEnabled
{
    return [[FIRPerformance sharedInstance] isInstrumentationEnabled]?1.0:0.0;
}

-(void) FirebasePerformance_setPerformanceCollectionEnabled:(double) value
{
    [[FIRPerformance sharedInstance] setInstrumentationEnabled: value>=0.5];
}

	////////////////TRACE////////////////
	
	
	-(void) FirebasePerformance_Trace_Create:(NSString*) name
	{
		FIRTrace *mTrace = [[FIRPerformance sharedInstance] traceWithName:name];
		[Map_Trace setValue:mTrace forKey:name];
	}
	
	-(void) FirebasePerformance_Trace_Start:(NSString*) name
	{
		[[Map_Trace valueForKey:name] start];
	}

	-(void) FirebasePerformance_Trace_Stop:(NSString*) name
	{
		[[Map_Trace valueForKey:name] stop];
		[Map_Trace removeObjectForKey: name];
	}

	-(void) FirebasePerformance_Trace_Attribute_Remove:(NSString*) name attribute:(NSString*) attribute
	{
		NSLog(@"Not Availbale on iOS");
	}

	-(void) FirebasePerformance_Trace_Attribute_Put:(NSString*) name attribute:(NSString*) attribute value:(NSString*) value
	{
		NSLog(@"Not Availbale on iOS");
	}

	-(NSString*) FirebasePerformance_Trace_Attribute_GetAll:(NSString*) name
	{
		NSLog(@"Not Availbale on iOS");
        return @"{}";
	}

	-(NSString*) FirebasePerformance_Trace_Attribute_Get:(NSString*) name attribute:(NSString*) attribute
	{
		NSLog(@"Not Availbale on iOS");
        return @"";
	}
	
	-(void) FirebasePerformance_Trace_Metric_Put:(NSString*) name metric:(NSString*) metric value:(double) value
	{
		[[Map_Trace valueForKey:name] setIntValue:value forMetric: metric];
	}
	
	-(void) FirebasePerformance_Trace_Metric_Increment:(NSString*) name metric:(NSString*) metric value:(double) value
	{
		[[Map_Trace valueForKey:name] incrementMetric:metric byInt: value];
	}

	-(double) FirebasePerformance_Trace_Metric_GetLong:(NSString*) name metric:(NSString*) metric
	{
		return (double) [[Map_Trace valueForKey:name] valueForIntMetric:metric];
	}
	
	
	/////////////// HTTP METRIC
	
	
	-(void) FirebasePerformance_HttpMetric_Create:(NSString*) name url:(NSString*) url method:(NSString*) method
	{
		FIRHTTPMethod firmethod = FIRHTTPMethodGET;
		
		if([method isEqualToString:@"GET"])
			firmethod = FIRHTTPMethodGET ;
		if([method isEqualToString:@"PUT"])
			firmethod = FIRHTTPMethodPUT ;
		if([method isEqualToString:@"POST"])
			firmethod = FIRHTTPMethodPOST ;
		if([method isEqualToString:@"DELETE"])
			firmethod = FIRHTTPMethodDELETE ;
		if([method isEqualToString:@"HEAD"])
			firmethod = FIRHTTPMethodHEAD ;
		if([method isEqualToString:@"PATCH"])
			firmethod = FIRHTTPMethodPATCH ;
		if([method isEqualToString:@"OPTIONS"])
			firmethod = FIRHTTPMethodOPTIONS ;
		if([method isEqualToString:@"TRACE"])
			firmethod = FIRHTTPMethodTRACE ;
		if([method isEqualToString:@"CONNECT"])
			firmethod = FIRHTTPMethodCONNECT ;
			
		FIRHTTPMetric *metric = [[FIRHTTPMetric alloc] initWithURL: [NSURL URLWithString: url] HTTPMethod: firmethod];
		[Map_HttpMetric setValue:metric forKey:name];
	}
	
	-(void) FirebasePerformance_HttpMetric_Start:(NSString*) name
	{
		[[Map_HttpMetric valueForKey:name] start];
	}

	-(void) FirebasePerformance_HttpMetric_Stop:(NSString*) name
	{
		[[Map_HttpMetric valueForKey:name] stop];
		[Map_HttpMetric removeObjectForKey: name];
	}
	
	-(NSString*) FirebasePerformance_HttpMetric_Attribute_Get:(NSString*) name attribute:(NSString*) attribute
	{
		NSLog(@"Not Availbale on iOS");
        return @"";
	}
	
	-(NSString*) FirebasePerformance_HttpMetric_Attribute_GetAll:(NSString*) name
	{
		NSLog(@"Not Availbale on iOS");
        return @"";
	}

	-(void) FirebasePerformance_HttpMetric_Attribute_Put:(NSString*) name attribute:(NSString*) attribute value:(double) value
	{
		NSLog(@"Not Availbale on iOS");
	}

	-(void) FirebasePerformance_HttpMetric_Attribute_Remove:(NSString*) name attribute:(NSString*) attribute
	{
		NSLog(@"Not Availbale on iOS");
	}

	-(void) FirebasePerformance_HttpMetric_SetHttpResponseCode:(NSString*) name responseCode:(double) responseCode
	{
        [[Map_HttpMetric valueForKey:name] setResponseCode:responseCode];
	}

	-(void) FirebasePerformance_HttpMetric_SetRequestPayloadSize:(NSString*) name bytes:(double) bytes
	{
        [[Map_HttpMetric valueForKey:name] setRequestPayloadSize:bytes];
	}

	-(void) FirebasePerformance_HttpMetric_SetResponseContentType:(NSString*) name contentType:(NSString*) contentType
	{
        [[Map_HttpMetric valueForKey:name] setResponseContentType:contentType];
	}

	-(void) FirebasePerformance_HttpMetric_SetResponsePayloadSize:(NSString*) name bytes: (double) bytes
	{
        [[Map_HttpMetric valueForKey:name] setResponsePayloadSize:bytes];
	}


@end

