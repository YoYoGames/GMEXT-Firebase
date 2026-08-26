// ##### extgen :: Auto-generated file do not edit!! #####

#pragma once
#import <Foundation/Foundation.h>

#include <cstdint>
#include <string_view>
#include <vector>
#include <array>
#include <optional>
#include "core/GMExtWire.h"

namespace gm_consts
{
}


namespace gm_enums
{
    enum class FirebasePerformanceHttpMethod : std::int32_t
    {
        Get = 0,
        Put = 1,
        Post = 2,
        Delete = 3,
        Head = 4,
        Patch = 5,
        Options = 6,
        Trace = 7,
        Connect = 8
    };

}


namespace gm_structs
{

}

namespace gm::wire::codec
{
}

namespace gm::wire::details
{
}

@protocol GMFirebasePerformanceInterface <NSObject>
- (void)firebase_performance_set_collection_enabled:(bool)enabled;
- (bool)firebase_performance_is_collection_enabled;
- (double)firebase_performance_trace_start:(std::string_view)name;
- (bool)firebase_performance_trace_stop:(double)trace;
- (bool)firebase_performance_trace_put_attribute:(double)trace key:(std::string_view)key value:(std::string_view)value;
- (bool)firebase_performance_trace_remove_attribute:(double)trace key:(std::string_view)key;
- (bool)firebase_performance_trace_put_metric:(double)trace name:(std::string_view)name value:(double)value;
- (bool)firebase_performance_trace_increment_metric:(double)trace name:(std::string_view)name increment_by:(double)increment_by;
- (double)firebase_performance_http_metric_start:(std::string_view)url method:(gm_enums::FirebasePerformanceHttpMethod)method;
- (bool)firebase_performance_http_metric_set_response_code:(double)metric response_code:(std::int32_t)response_code;
- (bool)firebase_performance_http_metric_set_request_payload_size:(double)metric bytes:(double)bytes;
- (bool)firebase_performance_http_metric_set_response_payload_size:(double)metric bytes:(double)bytes;
- (bool)firebase_performance_http_metric_set_response_content_type:(double)metric content_type:(std::string_view)content_type;
- (bool)firebase_performance_http_metric_put_attribute:(double)metric key:(std::string_view)key value:(std::string_view)value;
- (bool)firebase_performance_http_metric_remove_attribute:(double)metric key:(std::string_view)key;
- (bool)firebase_performance_http_metric_stop:(double)metric;
@end


@interface GMFirebasePerformanceInternal : NSObject
- (double)__EXT_NATIVE__firebase_performance_set_collection_enabled:(double)enabled;
- (double)__EXT_NATIVE__firebase_performance_is_collection_enabled;
- (double)__EXT_NATIVE__firebase_performance_trace_start:(char*)name;
- (double)__EXT_NATIVE__firebase_performance_trace_stop:(double)trace;
- (double)__EXT_NATIVE__firebase_performance_trace_put_attribute:(double)trace arg1:(char*)key arg2:(char*)value;
- (double)__EXT_NATIVE__firebase_performance_trace_remove_attribute:(double)trace arg1:(char*)key;
- (double)__EXT_NATIVE__firebase_performance_trace_put_metric:(double)trace arg1:(char*)name arg2:(double)value;
- (double)__EXT_NATIVE__firebase_performance_trace_increment_metric:(double)trace arg1:(char*)name arg2:(double)increment_by;
- (double)__EXT_NATIVE__firebase_performance_http_metric_start:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_performance_http_metric_set_response_code:(double)metric arg1:(double)response_code;
- (double)__EXT_NATIVE__firebase_performance_http_metric_set_request_payload_size:(double)metric arg1:(double)bytes;
- (double)__EXT_NATIVE__firebase_performance_http_metric_set_response_payload_size:(double)metric arg1:(double)bytes;
- (double)__EXT_NATIVE__firebase_performance_http_metric_set_response_content_type:(double)metric arg1:(char*)content_type;
- (double)__EXT_NATIVE__firebase_performance_http_metric_put_attribute:(double)metric arg1:(char*)key arg2:(char*)value;
- (double)__EXT_NATIVE__firebase_performance_http_metric_remove_attribute:(double)metric arg1:(char*)key;
- (double)__EXT_NATIVE__firebase_performance_http_metric_stop:(double)metric;
@end


