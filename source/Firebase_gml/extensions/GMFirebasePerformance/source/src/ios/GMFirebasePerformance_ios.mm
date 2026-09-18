#import <Foundation/Foundation.h>

#include <cmath>
#include <cstdint>
#include <limits>
#include <mutex>
#include <string_view>
#include <unordered_map>

#import <FirebaseCore/FirebaseCore.h>
#import <FirebasePerformance/FirebasePerformance.h>

#import "GMFirebasePerformance_ios.h"


namespace
{
    // Handles are extension-local ids, never native pointers; one counter
    // across traces and HTTP metrics, as on Android.
    static std::mutex gRegistryMutex;
    static std::uint64_t gNextHandle = 1;
    static std::unordered_map<std::uint64_t, FIRTrace *> gTraces;
    static std::unordered_map<std::uint64_t, FIRHTTPMetric *> gHttpMetrics;


    static NSString *toNSString(
        std::string_view value)
    {
        if (value.empty())
            return @"";

        NSString *result =
            [[NSString alloc]
                initWithBytes:value.data()
                length:value.size()
                encoding:NSUTF8StringEncoding];

        return result ?: @"";
    }


    // The SDK stores attribute and metric names trimmed and looks them up as
    // given, so the read-back below has to use the trimmed key, as on Android.
    static NSString *trimmedNSString(
        std::string_view value)
    {
        return
            [toNSString(value)
                stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }


    static std::uint64_t handle(
        double value)
    {
        if (std::isnan(value) || value <= 0.0)
            return 0;

        if (value > static_cast<double>(std::numeric_limits<std::int64_t>::max()))
            return 0;

        return static_cast<std::uint64_t>(value);
    }


    static std::int64_t toInt64(
        double value)
    {
        if (std::isnan(value))
            return 0;

        if (value >= static_cast<double>(std::numeric_limits<std::int64_t>::max()))
            return std::numeric_limits<std::int64_t>::max();

        if (value <= static_cast<double>(std::numeric_limits<std::int64_t>::min()))
            return std::numeric_limits<std::int64_t>::min();

        return static_cast<std::int64_t>(std::floor(value + 0.5));
    }


    static long toNonNegativeLong(
        double value)
    {
        if (std::isnan(value) || value <= 0.0)
            return 0;

        if (value >= static_cast<double>(std::numeric_limits<long>::max()))
            return std::numeric_limits<long>::max();

        return static_cast<long>(std::floor(value + 0.5));
    }


    static FIRTrace *findTrace(
        double trace)
    {
        std::lock_guard<std::mutex> lock(gRegistryMutex);

        auto it = gTraces.find(handle(trace));
        return it != gTraces.end() ? it->second : nil;
    }


    static FIRTrace *takeTrace(
        double trace)
    {
        std::lock_guard<std::mutex> lock(gRegistryMutex);

        auto it = gTraces.find(handle(trace));
        if (it == gTraces.end())
            return nil;

        FIRTrace *item = it->second;
        gTraces.erase(it);
        return item;
    }


    static FIRHTTPMetric *findHttpMetric(
        double metric)
    {
        std::lock_guard<std::mutex> lock(gRegistryMutex);

        auto it = gHttpMetrics.find(handle(metric));
        return it != gHttpMetrics.end() ? it->second : nil;
    }


    static FIRHTTPMetric *takeHttpMetric(
        double metric)
    {
        std::lock_guard<std::mutex> lock(gRegistryMutex);

        auto it = gHttpMetrics.find(handle(metric));
        if (it == gHttpMetrics.end())
            return nil;

        FIRHTTPMetric *item = it->second;
        gHttpMetrics.erase(it);
        return item;
    }


    static bool toHttpMethod(
        gm_enums::FirebasePerformanceHttpMethod method,
        FIRHTTPMethod &result)
    {
        switch (method)
        {
            case gm_enums::FirebasePerformanceHttpMethod::Get:
                result = FIRHTTPMethodGET;
                return true;

            case gm_enums::FirebasePerformanceHttpMethod::Put:
                result = FIRHTTPMethodPUT;
                return true;

            case gm_enums::FirebasePerformanceHttpMethod::Post:
                result = FIRHTTPMethodPOST;
                return true;

            case gm_enums::FirebasePerformanceHttpMethod::Delete:
                result = FIRHTTPMethodDELETE;
                return true;

            case gm_enums::FirebasePerformanceHttpMethod::Head:
                result = FIRHTTPMethodHEAD;
                return true;

            case gm_enums::FirebasePerformanceHttpMethod::Patch:
                result = FIRHTTPMethodPATCH;
                return true;

            case gm_enums::FirebasePerformanceHttpMethod::Options:
                result = FIRHTTPMethodOPTIONS;
                return true;

            case gm_enums::FirebasePerformanceHttpMethod::Trace:
                result = FIRHTTPMethodTRACE;
                return true;

            case gm_enums::FirebasePerformanceHttpMethod::Connect:
                result = FIRHTTPMethodCONNECT;
                return true;

            default:
                return false;
        }
    }
}


@implementation GMFirebasePerformance


- (void)firebase_performance_set_collection_enabled:
    (bool)enabled
{
    [FIRPerformance sharedInstance].dataCollectionEnabled =
        enabled ? YES : NO;
}


- (bool)firebase_performance_is_collection_enabled
{
    return
        [FIRPerformance sharedInstance].isDataCollectionEnabled
        ? true
        : false;
}


- (double)firebase_performance_trace_start:
    (std::string_view)name
{
    if (name.empty())
        return 0.0;

    // traceWithName: raises NSException while no default FIRApp is configured;
    // through the bridge that is an app termination, not the 0 promised here.
    if ([FIRApp defaultApp] == nil)
    {
        NSLog(
            @"GMFirebasePerformance: Firebase default app not configured; call firebase_app_initialize first"
        );
        return 0.0;
    }

    NSString *traceName = toNSString(name);
    FIRTrace *trace = nil;

    @try
    {
        trace = [[FIRPerformance sharedInstance] traceWithName:traceName];
    }
    @catch (NSException *exception)
    {
        NSLog(
            @"GMFirebasePerformance: trace %@ not created: %@",
            traceName,
            exception.reason
        );
        trace = nil;
    }

    if (trace == nil)
        return 0.0;

    [trace start];

    std::lock_guard<std::mutex> lock(gRegistryMutex);

    std::uint64_t handleValue = gNextHandle++;
    gTraces[handleValue] = trace;
    return static_cast<double>(handleValue);
}


- (bool)firebase_performance_trace_stop:
    (double)trace
{
    FIRTrace *item = takeTrace(trace);

    if (item == nil)
        return false;

    [item stop];
    return true;
}


- (bool)firebase_performance_trace_put_attribute:
    (double)trace
    key:
    (std::string_view)key
    value:
    (std::string_view)value
{
    FIRTrace *item = findTrace(trace);

    if (item == nil)
        return false;

    // The SDK validates the write itself and only logs a rejection (too many
    // attributes, a long key, a stopped trace), so the result is read back.
    NSString *attribute = trimmedNSString(key);
    NSString *expected = trimmedNSString(value);

    [item setValue:expected forAttribute:attribute];
    return [expected isEqualToString:[item valueForAttribute:attribute]];
}


- (bool)firebase_performance_trace_remove_attribute:
    (double)trace
    key:
    (std::string_view)key
{
    FIRTrace *item = findTrace(trace);

    if (item == nil)
        return false;

    NSString *attribute = trimmedNSString(key);

    [item removeAttribute:attribute];
    return [item valueForAttribute:attribute] == nil;
}


- (bool)firebase_performance_trace_put_metric:
    (double)trace
    name:
    (std::string_view)name
    value:
    (double)value
{
    FIRTrace *item = findTrace(trace);

    if (item == nil)
        return false;

    NSString *metric = trimmedNSString(name);
    std::int64_t expected = toInt64(value);

    [item setIntValue:expected forMetric:metric];
    return [item valueForIntMetric:metric] == expected;
}


- (bool)firebase_performance_trace_increment_metric:
    (double)trace
    name:
    (std::string_view)name
    increment_by:
    (double)increment_by
{
    FIRTrace *item = findTrace(trace);

    if (item == nil)
        return false;

    NSString *metric = trimmedNSString(name);
    std::int64_t by = toInt64(increment_by);
    std::int64_t before = [item valueForIntMetric:metric];

    [item incrementMetric:metric byInt:by];
    return [item valueForIntMetric:metric] == before + by;
}


- (double)firebase_performance_http_metric_start:
    (std::string_view)url
    method:
    (gm_enums::FirebasePerformanceHttpMethod)method
{
    if (url.empty())
        return 0.0;

    FIRHTTPMethod httpMethod = FIRHTTPMethodGET;

    if (!toHttpMethod(method, httpMethod))
        return 0.0;

    NSURL *requestUrl = [NSURL URLWithString:toNSString(url)];

    if (requestUrl == nil)
        return 0.0;

    FIRHTTPMetric *metric =
        [[FIRHTTPMetric alloc]
            initWithURL:requestUrl
            HTTPMethod:httpMethod];

    if (metric == nil)
        return 0.0;

    [metric start];

    std::lock_guard<std::mutex> lock(gRegistryMutex);

    std::uint64_t handleValue = gNextHandle++;
    gHttpMetrics[handleValue] = metric;
    return static_cast<double>(handleValue);
}


- (bool)firebase_performance_http_metric_set_response_code:
    (double)metric
    response_code:
    (std::int32_t)response_code
{
    FIRHTTPMetric *item = findHttpMetric(metric);

    if (item == nil)
        return false;

    item.responseCode = response_code;
    return true;
}


- (bool)firebase_performance_http_metric_set_request_payload_size:
    (double)metric
    bytes:
    (double)bytes
{
    FIRHTTPMetric *item = findHttpMetric(metric);

    if (item == nil)
        return false;

    item.requestPayloadSize = toNonNegativeLong(bytes);
    return true;
}


- (bool)firebase_performance_http_metric_set_response_payload_size:
    (double)metric
    bytes:
    (double)bytes
{
    FIRHTTPMetric *item = findHttpMetric(metric);

    if (item == nil)
        return false;

    item.responsePayloadSize = toNonNegativeLong(bytes);
    return true;
}


- (bool)firebase_performance_http_metric_set_response_content_type:
    (double)metric
    content_type:
    (std::string_view)content_type
{
    FIRHTTPMetric *item = findHttpMetric(metric);

    if (item == nil)
        return false;

    item.responseContentType = toNSString(content_type);
    return true;
}


- (bool)firebase_performance_http_metric_put_attribute:
    (double)metric
    key:
    (std::string_view)key
    value:
    (std::string_view)value
{
    FIRHTTPMetric *item = findHttpMetric(metric);

    if (item == nil)
        return false;

    NSString *attribute = trimmedNSString(key);
    NSString *expected = trimmedNSString(value);

    [item setValue:expected forAttribute:attribute];
    return [expected isEqualToString:[item valueForAttribute:attribute]];
}


- (bool)firebase_performance_http_metric_remove_attribute:
    (double)metric
    key:
    (std::string_view)key
{
    FIRHTTPMetric *item = findHttpMetric(metric);

    if (item == nil)
        return false;

    NSString *attribute = trimmedNSString(key);

    [item removeAttribute:attribute];
    return [item valueForAttribute:attribute] == nil;
}


- (bool)firebase_performance_http_metric_stop:
    (double)metric
{
    FIRHTTPMetric *item = takeHttpMetric(metric);

    if (item == nil)
        return false;

    [item stop];
    return true;
}


@end
