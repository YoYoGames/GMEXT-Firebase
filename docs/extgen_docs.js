/**
 * @function_partial firebase_performance_set_collection_enabled
 * @param {Bool} enabled
 * @function_end
 */

/**
 * @function_partial firebase_performance_is_collection_enabled
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_performance_trace_start
 * @param {String} name
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_performance_trace_stop
 * @param {Real} trace
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_performance_trace_put_attribute
 * @param {Real} trace
 * @param {String} key
 * @param {String} value
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_performance_trace_remove_attribute
 * @param {Real} trace
 * @param {String} key
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_performance_trace_put_metric
 * @param {Real} trace
 * @param {String} name
 * @param {Real} value
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_performance_trace_increment_metric
 * @param {Real} trace
 * @param {String} name
 * @param {Real} increment_by
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_performance_http_metric_start
 * @param {String} url
 * @param {Enum.FirebasePerformanceHttpMethod} method
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_performance_http_metric_set_response_code
 * @param {Real} metric
 * @param {Real} response_code
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_performance_http_metric_set_request_payload_size
 * @param {Real} metric
 * @param {Real} bytes
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_performance_http_metric_set_response_payload_size
 * @param {Real} metric
 * @param {Real} bytes
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_performance_http_metric_set_response_content_type
 * @param {Real} metric
 * @param {String} content_type
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_performance_http_metric_put_attribute
 * @param {Real} metric
 * @param {String} key
 * @param {String} value
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_performance_http_metric_remove_attribute
 * @param {Real} metric
 * @param {String} key
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_performance_http_metric_stop
 * @param {Real} metric
 * @returns {Bool}
 * @function_end
 */

/**
 * @enum_partial FirebasePerformanceHttpMethod
 * @member Get
 * @member Put
 * @member Post
 * @member Delete
 * @member Head
 * @member Patch
 * @member Options
 * @member Trace
 * @member Connect
 * @enum_end
 */

/**
 * @const_partial macros
 * @const_end
 */

