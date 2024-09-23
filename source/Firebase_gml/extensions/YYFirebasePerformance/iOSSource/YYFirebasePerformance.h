#import <Foundation/Foundation.h>
#import <FirebaseCore/FirebaseCore.h>
#import <FirebasePerformance/FirebasePerformance.h>

@interface YYFirebasePerformance : NSObject

// Initialization Methods
- (void)FirebasePerformance_Initialize;

// Performance Collection
- (double)FirebasePerformance_isPerformanceCollectionEnabled;
- (void)FirebasePerformance_setPerformanceCollectionEnabled:(double)value;

// Trace Methods
- (void)FirebasePerformance_Trace_Create:(NSString *)name;
- (void)FirebasePerformance_Trace_Start:(NSString *)name;
- (void)FirebasePerformance_Trace_Stop:(NSString *)name;
- (void)FirebasePerformance_Trace_Attribute_Remove:(NSString *)name attribute:(NSString *)attribute;
- (void)FirebasePerformance_Trace_Attribute_Put:(NSString *)name attribute:(NSString *)attribute value:(NSString *)value;
- (NSString *)FirebasePerformance_Trace_Attribute_GetAll:(NSString *)name;
- (NSString *)FirebasePerformance_Trace_Attribute_Get:(NSString *)name attribute:(NSString *)attribute;
- (void)FirebasePerformance_Trace_Metric_Put:(NSString *)name metric:(NSString *)metric value:(double)value;
- (void)FirebasePerformance_Trace_Metric_Increment:(NSString *)name metric:(NSString *)metric value:(double)value;
- (double)FirebasePerformance_Trace_Metric_GetLong:(NSString *)name metric:(NSString *)metric;

// HTTP Metric Methods
- (void)FirebasePerformance_HttpMetric_Create:(NSString *)name url:(NSString *)url method:(NSString *)method;
- (void)FirebasePerformance_HttpMetric_Start:(NSString *)name;
- (void)FirebasePerformance_HttpMetric_Stop:(NSString *)name;
- (NSString *)FirebasePerformance_HttpMetric_Attribute_Get:(NSString *)name attribute:(NSString *)attribute;
- (NSString *)FirebasePerformance_HttpMetric_Attribute_GetAll:(NSString *)name;
- (void)FirebasePerformance_HttpMetric_Attribute_Put:(NSString *)name attribute:(NSString *)attribute value:(double)value;
- (void)FirebasePerformance_HttpMetric_Attribute_Remove:(NSString *)name attribute:(NSString *)attribute;
- (void)FirebasePerformance_HttpMetric_SetHttpResponseCode:(NSString *)name responseCode:(double)responseCode;
- (void)FirebasePerformance_HttpMetric_SetRequestPayloadSize:(NSString *)name bytes:(double)bytes;
- (void)FirebasePerformance_HttpMetric_SetResponseContentType:(NSString *)name contentType:(NSString *)contentType;
- (void)FirebasePerformance_HttpMetric_SetResponsePayloadSize:(NSString *)name bytes:(double)bytes;

@end
