#import "YYFirebasePerformance.h"
#import <UIKit/UIKit.h>

// Class Extension for Private Methods and Properties
@interface YYFirebasePerformance ()

// Dictionaries to hold traces and HTTP metrics
@property (nonatomic, strong) NSMutableDictionary<NSString *, FIRTrace *> *traceDictionary;
@property (nonatomic, strong) NSMutableDictionary<NSString *, FIRHTTPMetric *> *httpMetricsDictionary;

// Private Helper Method
- (FIRHTTPMethod)convertStringToFIRHTTPMethod:(NSString *)method methodName:(NSString *)methodName;

@end

@implementation YYFirebasePerformance

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        // Initialize dictionaries
        self.traceDictionary = [[NSMutableDictionary alloc] init];
        self.httpMetricsDictionary = [[NSMutableDictionary alloc] init];

        // Configure Firebase if not already configured
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            if (![FIRApp defaultApp]) {
                [FIRApp configure];
                NSLog(@"%s :: Firebase initialized", __FUNCTION__);
            }
        });
    }

    return self;
}

#pragma mark - Public API Methods

- (void)FirebasePerformance_Initialize {
    // This method can be used for any additional initialization if needed
    NSLog(@"%s :: FirebasePerformance_Initialize called", __FUNCTION__);
}

- (double)FirebasePerformance_isPerformanceCollectionEnabled {
    BOOL isEnabled = [[FIRPerformance sharedInstance] isInstrumentationEnabled];
    return isEnabled ? 1.0 : 0.0;
}

- (void)FirebasePerformance_setPerformanceCollectionEnabled:(double)value {
    BOOL isEnabled = value >= 0.5;
    [[FIRPerformance sharedInstance] setInstrumentationEnabled:isEnabled];
}

#pragma mark - Trace Methods

- (void)FirebasePerformance_Trace_Create:(NSString *)name {
    if (name == nil || name.length == 0) {
        NSLog(@"%s :: Invalid trace name", __FUNCTION__);
        return;
    }
    
    FIRTrace *mTrace = [[FIRPerformance sharedInstance] traceWithName:name];
    [self.traceDictionary setObject:mTrace forKey:name];
}

- (void)FirebasePerformance_Trace_Start:(NSString *)name {
    FIRTrace *trace = [self.traceDictionary objectForKey:name];
    if (trace) {
        [trace start];
    } else {
        NSLog(@"%s :: Trace '%@' not found", __FUNCTION__, name);
    }
}

- (void)FirebasePerformance_Trace_Stop:(NSString *)name {
    FIRTrace *trace = [self.traceDictionary objectForKey:name];
    if (trace) {
        [trace stop];
        [self.traceDictionary removeObjectForKey:name];
    } else {
        NSLog(@"%s :: Trace '%@' not found", __FUNCTION__, name);
    }
}

- (void)FirebasePerformance_Trace_Attribute_Remove:(NSString *)name attribute:(NSString *)attribute {
    NSLog(@"%s :: Not Available on iOS", __FUNCTION__);
}

- (void)FirebasePerformance_Trace_Attribute_Put:(NSString *)name attribute:(NSString *)attribute value:(NSString *)value {
    NSLog(@"%s :: Not Available on iOS", __FUNCTION__);
}

- (NSString *)FirebasePerformance_Trace_Attribute_GetAll:(NSString *)name {
    NSLog(@"%s :: Not Available on iOS", __FUNCTION__);
    return @"{}";
}

- (NSString *)FirebasePerformance_Trace_Attribute_Get:(NSString *)name attribute:(NSString *)attribute {
    NSLog(@"%s :: Not Available on iOS", __FUNCTION__);
    return @"";
}

- (void)FirebasePerformance_Trace_Metric_Put:(NSString *)name metric:(NSString *)metric value:(double)value {
    FIRTrace *trace = [self.traceDictionary objectForKey:name];
    if (trace) {
        [trace setIntValue:(int)value forMetric:metric];
    } else {
        NSLog(@"%s :: Trace '%@' not found", __FUNCTION__, name);
    }
}

- (void)FirebasePerformance_Trace_Metric_Increment:(NSString *)name metric:(NSString *)metric value:(double)value {
    FIRTrace *trace = [self.traceDictionary objectForKey:name];
    if (trace) {
        [trace incrementMetric:metric byInt:(int)value];
    } else {
        NSLog(@"%s :: Trace '%@' not found", __FUNCTION__, name);
    }
}

- (double)FirebasePerformance_Trace_Metric_GetLong:(NSString *)name metric:(NSString *)metric {
    FIRTrace *trace = [self.traceDictionary objectForKey:name];
    if (trace) {
        long long metricValue = [trace valueForIntMetric:metric];
        return (double)metricValue;
    } else {
        NSLog(@"%s :: Trace '%@' not found", __FUNCTION__, name);
        return 0.0;
    }
}

#pragma mark - HTTP Metric Methods

- (void)FirebasePerformance_HttpMetric_Create:(NSString *)name url:(NSString *)url method:(NSString *)method {
    if (name == nil || name.length == 0 || url == nil || url.length == 0 || method == nil || method.length == 0) {
        NSLog(@"%s :: Invalid parameters", __FUNCTION__);
        return;
    }
    
    FIRHTTPMethod firMethod = [self convertStringToFIRHTTPMethod:method methodName:[NSString stringWithUTF8String:__FUNCTION__]];
    
    NSURL *urlObject = [NSURL URLWithString:url];
    if (urlObject == nil) {
        NSLog(@"%s :: Invalid URL '%@'", __FUNCTION__, url);
        return;
    }
    
    FIRHTTPMetric *metric = [[FIRHTTPMetric alloc] initWithURL:urlObject HTTPMethod:firMethod];
    NSLog(@"%s :: HTTP Metric '%@' created for URL '%@' with method '%@'", __FUNCTION__, name, url, method);
}

- (void)FirebasePerformance_HttpMetric_Start:(NSString *)name {
    FIRHTTPMetric *metric = [self.httpMetricsDictionary objectForKey:name];
    if (metric) {
        [metric start];
    } else {
        NSLog(@"%s :: HTTP Metric '%@' not found", __FUNCTION__, name);
    }
}

- (void)FirebasePerformance_HttpMetric_Stop:(NSString *)name {
    FIRHTTPMetric *metric = [self.httpMetricsDictionary objectForKey:name];
    if (metric) {
        [metric stop];
        [self.httpMetricsDictionary removeObjectForKey:name];
    } else {
        NSLog(@"%s :: HTTP Metric '%@' not found", __FUNCTION__, name);
    }
}

- (NSString *)FirebasePerformance_HttpMetric_Attribute_Get:(NSString *)name attribute:(NSString *)attribute {
    NSLog(@"%s :: Not Available on iOS", __FUNCTION__);
    return @"";
}

- (NSString *)FirebasePerformance_HttpMetric_Attribute_GetAll:(NSString *)name {
    NSLog(@"%s :: Not Available on iOS", __FUNCTION__);
    return @"{}";
}

- (void)FirebasePerformance_HttpMetric_Attribute_Put:(NSString *)name attribute:(NSString *)attribute value:(double)value {
    NSLog(@"%s :: Not Available on iOS", __FUNCTION__);
}

- (void)FirebasePerformance_HttpMetric_Attribute_Remove:(NSString *)name attribute:(NSString *)attribute {
    NSLog(@"%s :: Not Available on iOS", __FUNCTION__);
}

- (void)FirebasePerformance_HttpMetric_SetHttpResponseCode:(NSString *)name responseCode:(double)responseCode {
    FIRHTTPMetric *metric = [self.httpMetricsDictionary objectForKey:name];
    if (metric) {
        [metric setResponseCode:(NSInteger)responseCode];
    } else {
        NSLog(@"%s :: HTTP Metric '%@' not found", __FUNCTION__, name);
    }
}

- (void)FirebasePerformance_HttpMetric_SetRequestPayloadSize:(NSString *)name bytes:(double)bytes {
    FIRHTTPMetric *metric = [self.httpMetricsDictionary objectForKey:name];
    if (metric) {
        [metric setRequestPayloadSize:(long)bytes];
    } else {
        NSLog(@"%s :: HTTP Metric '%@' not found", __FUNCTION__, name);
    }
}

- (void)FirebasePerformance_HttpMetric_SetResponseContentType:(NSString *)name contentType:(NSString *)contentType {
    FIRHTTPMetric *metric = [self.httpMetricsDictionary objectForKey:name];
    if (metric) {
        [metric setResponseContentType:contentType];
    } else {
        NSLog(@"%s :: HTTP Metric '%@' not found", __FUNCTION__, name);
    }
}

- (void)FirebasePerformance_HttpMetric_SetResponsePayloadSize:(NSString *)name bytes:(double)bytes {
    FIRHTTPMetric *metric = [self.httpMetricsDictionary objectForKey:name];
    if (metric) {
        [metric setResponsePayloadSize:(long)bytes];
    } else {
        NSLog(@"%s :: HTTP Metric '%@' not found", __FUNCTION__, name);
    }
}

#pragma mark - Helper Methods

// Converts HTTP method string to FIRHTTPMethod enum
- (FIRHTTPMethod)convertStringToFIRHTTPMethod:(NSString *)method methodName:(NSString *)methodName {
    NSDictionary<NSString *, NSNumber *> *methodMapping = @{
        @"GET": @(FIRHTTPMethodGET),
        @"PUT": @(FIRHTTPMethodPUT),
        @"POST": @(FIRHTTPMethodPOST),
        @"DELETE": @(FIRHTTPMethodDELETE),
        @"HEAD": @(FIRHTTPMethodHEAD),
        @"PATCH": @(FIRHTTPMethodPATCH),
        @"OPTIONS": @(FIRHTTPMethodOPTIONS),
        @"TRACE": @(FIRHTTPMethodTRACE),
        @"CONNECT": @(FIRHTTPMethodCONNECT)
    };
    
    NSNumber *methodNumber = methodMapping[method.uppercaseString];
    if (methodNumber != nil) {
        return (FIRHTTPMethod)[methodNumber integerValue];
    } else {
        NSLog(@"%s :: Unknown HTTP method '%@', defaulting to GET",
                    [methodName UTF8String], method);
        return FIRHTTPMethodGET;
    }
}

@end
