// ##### extgen :: Auto-generated file do not edit!! #####

// #####################################################################
// # Macros
// #####################################################################

// #####################################################################
// # Enums
// #####################################################################

enum FirebasePerformanceHttpMethod
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
}

// #####################################################################
// # Constructors
// #####################################################################

// #####################################################################
// # Codecs
// #####################################################################

// #####################################################################
// # Functions
// #####################################################################

// Skipping function firebase_performance_set_collection_enabled (no wrapper is required)


// Skipping function firebase_performance_is_collection_enabled (no wrapper is required)


// Skipping function firebase_performance_trace_start (no wrapper is required)


// Skipping function firebase_performance_trace_stop (no wrapper is required)


// Skipping function firebase_performance_trace_put_attribute (no wrapper is required)


// Skipping function firebase_performance_trace_remove_attribute (no wrapper is required)


// Skipping function firebase_performance_trace_put_metric (no wrapper is required)


// Skipping function firebase_performance_trace_increment_metric (no wrapper is required)


/**
 * @param {String} _url
 * @param {Enum.FirebasePerformanceHttpMethod} _method
 * @returns {Real}
 */
function firebase_performance_http_metric_start(_url, _method)
{
    var __available__ = __GMFirebasePerformance_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _url, type: String
    if (!is_string(_url)) show_error($"{_GMFUNCTION_} :: _url expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_url));
    buffer_write(__args_buffer__, buffer_string, _url);

    // param: _method, type: enum FirebasePerformanceHttpMethod

    if (!is_numeric(_method)) show_error($"{_GMFUNCTION_} :: _method expected number", true);
    buffer_write(__args_buffer__, buffer_s32, _method);

    var __return_value__ = __firebase_performance_http_metric_start(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

// Skipping function firebase_performance_http_metric_set_response_code (no wrapper is required)


// Skipping function firebase_performance_http_metric_set_request_payload_size (no wrapper is required)


// Skipping function firebase_performance_http_metric_set_response_payload_size (no wrapper is required)


// Skipping function firebase_performance_http_metric_set_response_content_type (no wrapper is required)


// Skipping function firebase_performance_http_metric_put_attribute (no wrapper is required)


// Skipping function firebase_performance_http_metric_remove_attribute (no wrapper is required)


// Skipping function firebase_performance_http_metric_stop (no wrapper is required)


/// @ignore
function __GMFirebasePerformance_get_decoders()
{
    static __decoders__ = [];
    return __decoders__;
}
/// @ignore
function __GMFirebasePerformance_is_available()
{
    static __available__ = extension_exists("GMFirebasePerformance");
    return __available__;
}
