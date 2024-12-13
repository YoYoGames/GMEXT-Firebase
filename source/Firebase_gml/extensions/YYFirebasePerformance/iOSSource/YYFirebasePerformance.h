#import <Foundation/Foundation.h>
#import <FirebaseCore/FirebaseCore.h>
#import <FirebasePerformance/FirebasePerformance.h>

@interface YYFirebasePerformance : NSObject

// Performance Collection
- (double)FirebasePerformance_isPerformanceCollectionEnabled;
- (void)FirebasePerformance_setPerformanceCollectionEnabled:(double)value;

// Trace Methods
- (double)FirebasePerformance_Trace_Create:(NSString *)name;
- (double)FirebasePerformance_Trace_Start:(NSString *)name;
- (double)FirebasePerformance_Trace_Stop:(NSString *)name;
- (double)FirebasePerformance_Trace_Metric_Put:(NSString *)name metric:(NSString *)metric value:(double)value;
- (double)FirebasePerformance_Trace_Metric_Increment:(NSString *)name metric:(NSString *)metric value:(double)value;
- (double)FirebasePerformance_Trace_Metric_GetLong:(NSString *)name metric:(NSString *)metric;
- (double)FirebasePerformance_Trace_Attribute_Put:(NSString*)name attribute:(NSString*)attribute value:(NSString*)value;
- (double)FirebasePerformance_Trace_Attribute_Remove:(NSString*)name attribute:(NSString*)attribute;
- (NSString*)FirebasePerformance_Trace_Attribute_Get:(NSString*)name attribute:(NSString*)attribute;
- (NSString*)FirebasePerformance_Trace_Attribute_GetAll:(NSString*)name;

// HTTP Metric Methods
- (double)FirebasePerformance_HttpMetric_Create:(NSString *)name url:(NSString *)url method:(NSString *)method;
- (double)FirebasePerformance_HttpMetric_Start:(NSString *)name;
- (double)FirebasePerformance_HttpMetric_Stop:(NSString *)name;
- (double)FirebasePerformance_HttpMetric_SetHttpResponseCode:(NSString *)name responseCode:(double)responseCode;
- (double)FirebasePerformance_HttpMetric_SetRequestPayloadSize:(NSString *)name bytes:(double)bytes;
- (double)FirebasePerformance_HttpMetric_SetResponseContentType:(NSString *)name contentType:(NSString *)contentType;
- (double)FirebasePerformance_HttpMetric_SetResponsePayloadSize:(NSString *)name bytes:(double)bytes;
- (double)FirebasePerformance_HttpMetric_Attribute_Put:(NSString*)name attribute:(NSString*)attribute value:(double)value;
- (double)FirebasePerformance_HttpMetric_Attribute_Remove:(NSString*)name attribute:(NSString*)attribute;
- (NSString*)FirebasePerformance_HttpMetric_Attribute_Get:(NSString*)name attribute:(NSString*)attribute;
- (NSString*)FirebasePerformance_HttpMetric_Attribute_GetAll:(NSString*)name;

@end
