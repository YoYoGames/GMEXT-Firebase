#import "YYFirebasePerformance.h"

// Error Codes
static const double kFirebasePerformanceSuccess = 0.0;
static const double kFirebasePerformanceErrorNotFound = -1.0;
static const double kFirebasePerformanceErrorInvalidName = -2.0;
static const double kFirebasePerformanceErrorCreationFailed = -3.0;
static const double kFirebasePerformanceErrorInvalidParameters = -4.0;
static const double kFirebasePerformanceErrorInvalidURL = -5.0;
static const double kFirebasePerformanceErrorUnsupported = -6.0;

// Private interface
@interface YYFirebasePerformance ()

// Dictionaries to hold traces and HTTP metrics
@property (nonatomic, strong) NSMutableDictionary<NSString *, FIRTrace *> *traceDictionary;
@property (nonatomic, strong) NSMutableDictionary<NSString *, FIRHTTPMetric *> *httpMetricsDictionary;

// Private helper methods
- (FIRHTTPMethod)convertStringToFIRHTTPMethod:(NSString *)method;

@end

@implementation YYFirebasePerformance

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        // Initialize dictionaries
        self.traceDictionary = [[NSMutableDictionary alloc] init];
        self.httpMetricsDictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

#pragma mark - Performance Collection Methods

- (double)FirebasePerformance_isPerformanceCollectionEnabled {
    BOOL isEnabled = [[FIRPerformance sharedInstance] isInstrumentationEnabled];
    return isEnabled ? 1.0 : 0.0;
}

- (void)FirebasePerformance_setPerformanceCollectionEnabled:(double)value {
    BOOL isEnabled = value >= 0.5;
    [[FIRPerformance sharedInstance] setInstrumentationEnabled:isEnabled];
}

#pragma mark - Trace Methods

- (double)FirebasePerformance_Trace_Create:(NSString *)name {
    if (name == nil || name.length == 0) {
        NSLog(@"[FirebasePerformance] Error: Invalid trace name.");
        return kFirebasePerformanceErrorInvalidName;
    }
    FIRTrace *trace = [[FIRPerformance sharedInstance] traceWithName:name];
    if (trace) {
        [self.traceDictionary setObject:trace forKey:name];
        // Successfully created trace
        return kFirebasePerformanceSuccess;
    } else {
        NSLog(@"[FirebasePerformance] Error: Failed to create trace with name: %@", name);
        return kFirebasePerformanceErrorCreationFailed;
    }
}

- (double)FirebasePerformance_Trace_Start:(NSString *)name {
    FIRTrace *trace = [self.traceDictionary objectForKey:name];
    if (trace) {
        [trace start];
        return kFirebasePerformanceSuccess;
    } else {
        NSLog(@"[FirebasePerformance] Error: Trace not found: %@", name);
        return kFirebasePerformanceErrorNotFound;
    }
}

- (double)FirebasePerformance_Trace_Stop:(NSString *)name {
    FIRTrace *trace = [self.traceDictionary objectForKey:name];
    if (trace) {
        [trace stop];
        [self.traceDictionary removeObjectForKey:name];
        // Successfully stopped and removed trace
        return kFirebasePerformanceSuccess;
    } else {
        NSLog(@"[FirebasePerformance] Error: Trace not found: %@", name);
        return kFirebasePerformanceErrorNotFound;
    }
}

- (double)FirebasePerformance_Trace_Metric_Put:(NSString *)name metric:(NSString *)metric value:(double)value {
    FIRTrace *trace = [self.traceDictionary objectForKey:name];
    if (trace) {
        [trace setIntValue:(int64_t)value forMetric:metric];
        // Successfully set metric
        return kFirebasePerformanceSuccess;
    } else {
        NSLog(@"[FirebasePerformance] Error: Trace not found: %@", name);
        return kFirebasePerformanceErrorNotFound;
    }
}

- (double)FirebasePerformance_Trace_Metric_Increment:(NSString *)name metric:(NSString *)metric value:(double)value {
    FIRTrace *trace = [self.traceDictionary objectForKey:name];
    if (trace) {
        [trace incrementMetric:metric byInt:(int64_t)value];
        // Successfully incremented metric
        return kFirebasePerformanceSuccess;
    } else {
        NSLog(@"[FirebasePerformance] Error: Trace not found: %@", name);
        return kFirebasePerformanceErrorNotFound;
    }
}

- (double)FirebasePerformance_Trace_Metric_GetLong:(NSString *)name metric:(NSString *)metric {
    FIRTrace *trace = [self.traceDictionary objectForKey:name];
    if (trace) {
        int64_t metricValue = [trace valueForIntMetric:metric];
        return (double)metricValue;
    } else {
        NSLog(@"[FirebasePerformance] Error: Trace not found: %@", name);
        return 0.0;
    }
}

- (double)FirebasePerformance_Trace_Attribute_Put:(NSString *)name attribute:(NSString *)attribute value:(NSString *)value {
    NSLog(@"[FirebasePerformance] Warning: Attribute methods are not available on iOS.");
    return kFirebasePerformanceErrorUnsupported;
}

- (double)FirebasePerformance_Trace_Attribute_Remove:(NSString *)name attribute:(NSString *)attribute {
    NSLog(@"[FirebasePerformance] Warning: Attribute methods are not available on iOS.");
    return kFirebasePerformanceErrorUnsupported;
}

- (NSString *)FirebasePerformance_Trace_Attribute_Get:(NSString *)name attribute:(NSString *)attribute {
    NSLog(@"[FirebasePerformance] Warning: Attribute methods are not available on iOS.");
    return @"";
}

- (NSString *)FirebasePerformance_Trace_Attribute_GetAll:(NSString *)name {
    NSLog(@"[FirebasePerformance] Warning: Attribute methods are not available on iOS.");
    return @"{}";
}

#pragma mark - HTTP Metric Methods

- (double)FirebasePerformance_HttpMetric_Create:(NSString *)name url:(NSString *)url method:(NSString *)method {
    if (name == nil || name.length == 0 || url == nil || url.length == 0 || method == nil || method.length == 0) {
        NSLog(@"[FirebasePerformance] Error: Invalid parameters for HTTP Metric creation.");
        return kFirebasePerformanceErrorInvalidParameters;
    }

    NSURL *urlObj = [NSURL URLWithString:url];
    if (!urlObj) {
        NSLog(@"[FirebasePerformance] Error: Invalid URL: %@", url);
        return kFirebasePerformanceErrorInvalidURL;
    }

    FIRHTTPMethod firMethod = [self convertStringToFIRHTTPMethod:method];

    FIRHTTPMetric *metric = [[FIRHTTPMetric alloc] initWithURL:urlObj HTTPMethod:firMethod];
    if (metric) {
        [self.httpMetricsDictionary setObject:metric forKey:name];
        // Successfully created HTTP metric
        return kFirebasePerformanceSuccess;
    } else {
        NSLog(@"[FirebasePerformance] Error: Failed to create HTTP Metric with name: %@", name);
        return kFirebasePerformanceErrorCreationFailed;
    }
}

- (double)FirebasePerformance_HttpMetric_Start:(NSString *)name {
    FIRHTTPMetric *metric = [self.httpMetricsDictionary objectForKey:name];
    if (metric) {
        [metric start];
        // Successfully started HTTP metric
        return kFirebasePerformanceSuccess;
    } else {
        NSLog(@"[FirebasePerformance] Error: HTTP Metric not found: %@", name);
        return kFirebasePerformanceErrorNotFound;
    }
}

- (double)FirebasePerformance_HttpMetric_Stop:(NSString *)name {
    FIRHTTPMetric *metric = [self.httpMetricsDictionary objectForKey:name];
    if (metric) {
        [metric stop];
        [self.httpMetricsDictionary removeObjectForKey:name];
        // Successfully stopped and removed HTTP metric
        return kFirebasePerformanceSuccess;
    } else {
        NSLog(@"[FirebasePerformance] Error: HTTP Metric not found: %@", name);
        return kFirebasePerformanceErrorNotFound;
    }
}

- (double)FirebasePerformance_HttpMetric_SetHttpResponseCode:(NSString *)name responseCode:(double)responseCode {
    FIRHTTPMetric *metric = [self.httpMetricsDictionary objectForKey:name];
    if (metric) {
        [metric setResponseCode:(NSInteger)responseCode];
        // Successfully set HTTP response code
        return kFirebasePerformanceSuccess;
    } else {
        NSLog(@"[FirebasePerformance] Error: HTTP Metric not found: %@", name);
        return kFirebasePerformanceErrorNotFound;
    }
}

- (double)FirebasePerformance_HttpMetric_SetRequestPayloadSize:(NSString *)name bytes:(double)bytes {
    FIRHTTPMetric *metric = [self.httpMetricsDictionary objectForKey:name];
    if (metric) {
        [metric setRequestPayloadSize:(int64_t)bytes];
        // Successfully set request payload size
        return kFirebasePerformanceSuccess;
    } else {
        NSLog(@"[FirebasePerformance] Error: HTTP Metric not found: %@", name);
        return kFirebasePerformanceErrorNotFound;
    }
}

- (double)FirebasePerformance_HttpMetric_SetResponseContentType:(NSString *)name contentType:(NSString *)contentType {
    FIRHTTPMetric *metric = [self.httpMetricsDictionary objectForKey:name];
    if (metric) {
        [metric setResponseContentType:contentType];
        // Successfully set response content type
        return kFirebasePerformanceSuccess;
    } else {
        NSLog(@"[FirebasePerformance] Error: HTTP Metric not found: %@", name);
        return kFirebasePerformanceErrorNotFound;
    }
}

- (double)FirebasePerformance_HttpMetric_SetResponsePayloadSize:(NSString *)name bytes:(double)bytes {
    FIRHTTPMetric *metric = [self.httpMetricsDictionary objectForKey:name];
    if (metric) {
        [metric setResponsePayloadSize:(int64_t)bytes];
        // Successfully set response payload size
        return kFirebasePerformanceSuccess;
    } else {
        NSLog(@"[FirebasePerformance] Error: HTTP Metric not found: %@", name);
        return kFirebasePerformanceErrorNotFound;
    }
}

- (double)FirebasePerformance_HttpMetric_Attribute_Put:(NSString *)name attribute:(NSString *)attribute value:(double)value {
    NSLog(@"[FirebasePerformance] Warning: Attribute methods are not available on iOS.");
    return kFirebasePerformanceErrorUnsupported;
}

- (double)FirebasePerformance_HttpMetric_Attribute_Remove:(NSString *)name attribute:(NSString *)attribute {
    NSLog(@"[FirebasePerformance] Warning: Attribute methods are not available on iOS.");
    return kFirebasePerformanceErrorUnsupported;
}

- (NSString *)FirebasePerformance_HttpMetric_Attribute_Get:(NSString *)name attribute:(NSString *)attribute {
    NSLog(@"[FirebasePerformance] Warning: Attribute methods are not available on iOS.");
    return @"";
}

- (NSString *)FirebasePerformance_HttpMetric_Attribute_GetAll:(NSString *)name {
    NSLog(@"[FirebasePerformance] Warning: Attribute methods are not available on iOS.");
    return @"{}";
}

#pragma mark - Helper Methods

- (FIRHTTPMethod)convertStringToFIRHTTPMethod:(NSString *)method {
    if ([method isEqualToString:@"GET"]) {
        return FIRHTTPMethodGET;
    } else if ([method isEqualToString:@"PUT"]) {
        return FIRHTTPMethodPUT;
    } else if ([method isEqualToString:@"POST"]) {
        return FIRHTTPMethodPOST;
    } else if ([method isEqualToString:@"DELETE"]) {
        return FIRHTTPMethodDELETE;
    } else if ([method isEqualToString:@"HEAD"]) {
        return FIRHTTPMethodHEAD;
    } else if ([method isEqualToString:@"PATCH"]) {
        return FIRHTTPMethodPATCH;
    } else if ([method isEqualToString:@"OPTIONS"]) {
        return FIRHTTPMethodOPTIONS;
    } else if ([method isEqualToString:@"TRACE"]) {
        return FIRHTTPMethodTRACE;
    } else if ([method isEqualToString:@"CONNECT"]) {
        return FIRHTTPMethodCONNECT;
    } else {
        NSLog(@"[FirebasePerformance] Warning: Unknown HTTP method: %@, defaulting to GET", method);
        return FIRHTTPMethodGET;
    }
}

@end
