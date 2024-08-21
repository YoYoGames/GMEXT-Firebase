/**
 * @function FirebasePerformance_isPerformanceCollectionEnabled
 * @desc This function returns whether performance monitoring is enabled or disabled. This respects the Firebase Performance specific values first, and if these aren't set, uses the Firebase wide data collection switch.
 * 
 * @returns {bool}
 * @example
 * ```gml
 * FirebasePerformance_setPerformanceCollectionEnabled(!FirebasePerformance_isPerformanceCollectionEnabled());
 * ```
 * The above code shows a code example.
 * @function_end
 */

/**
 * @func FirebasePerformance_setPerformanceCollectionEnabled
 * @desc This function enables or disables performance monitoring. This setting is persisted and applied on future invocations of your application. By default, performance monitoring is enabled.
 * 
 * To disable performance monitoring before of start the app in the extension injection change `firebase_performance_collection_enabled` to false.
 * 
 * @param {bool} enabled Should performance monitoring be enabled
 * 
 * @example
 * ```gml
 * FirebasePerformance_setPerformanceCollectionEnabled(!FirebasePerformance_isPerformanceCollectionEnabled());
 * ```
 * The above code shows a code example.
 * @function_end
 */

/**
 * @func FirebasePerformance_HttpMetric_Attribute_Get
 * @desc This function returns the value of an attribute.
 * 
 * [[Note: this function is only available in Android.]]
 * 
 * @param {string} name HttpMetric name
 * @param {string} attribute Attribute name
 * 
 * @returns {string}
 * @example
 * ```gml
 * FirebasePerformance_HttpMetric_Create(httpMetric,"gamemaker.io","GET");
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key1","value1");
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key2","value2");
 * show_debug_message(FirebasePerformance_HttpMetric_Attribute_Get(httpMetric));
 * FirebasePerformance_HttpMetric_SetRequestPayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetResponseContentType(httpMetric,"text/html")//, application/json, etc...
 * FirebasePerformance_HttpMetric_SetResponsePayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetHttpResponseCode(httpMetric,200);
 * FirebasePerformance_HttpMetric_Start(httpMetric);
 * 
 * //After some time
 * FirebasePerformance_HttpMetric_Stop(httpMetric);
 * ```
 * The above code shows a code example.
 * @function_end
 */

/**
 * @func FirebasePerformance_HttpMetric_Attribute_GetAll
 * @desc This function returns all attributes in JSON format.
 * 
 * [[Note: This function is only available in Android.]]
 * 
 * @param {string} name HttpMetric name
 * @param {string} attribute Attribute name
 * 
 * @returns {string}
 * @example
 * ```gml
 * FirebasePerformance_HttpMetric_Create(httpMetric,"gamemaker.io","GET");
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key1","value1");
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key2","value2");
 * show_debug_message(FirebasePerformance_HttpMetric_Attribute_Get(httpMetric));
 * FirebasePerformance_HttpMetric_SetRequestPayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetResponseContentType(httpMetric,"text/html");//, application/json, etc...
 * FirebasePerformance_HttpMetric_SetResponsePayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetHttpResponseCode(httpMetric,200);
 * FirebasePerformance_HttpMetric_Start(httpMetric);
 * 
 * //After some time
 * FirebasePerformance_HttpMetric_Stop(httpMetric);
 * ```
 * The above code shows a code example.
 * @function_end
 */

/**
 * @func FirebasePerformance_HttpMetric_Attribute_Put
 * @desc This function sets a String value for the specified attribute. Updates the value of the attribute if the attribute already exists.
 * 
 * [[Note: This function is only available in Android.]]
 * 
 * @param {string} name HttpMetric name
 * @param {string} attribute Attribute name
 * @param {string} value Value of the attribute
 * 
 * @example
 * ```gml
 * FirebasePerformance_HttpMetric_Create(httpMetric,"gamemaker.io","GET");
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key1","value1");
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key2","value2");
 * show_debug_message(FirebasePerformance_HttpMetric_Attribute_Get(httpMetric));
 * FirebasePerformance_HttpMetric_SetRequestPayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetResponseContentType(httpMetric,"text/html");//, application/json, etc.
 * FirebasePerformance_HttpMetric_SetResponsePayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetHttpResponseCode(httpMetric,200);
 * FirebasePerformance_HttpMetric_Start(httpMetric);
 * 
 * //After some time
 * FirebasePerformance_HttpMetric_Stop(httpMetric);
 * ```
 * The above code shows a code example.
 * @function_end
 */

/**
 * @func FirebasePerformance_HttpMetric_Attribute_Remove
 * @desc This function removes an already added attribute from the HttpMetric.
 * 
 * [[Note: This function is only available in Android.]]
 * 
 * @param {string} name HttpMetric name
 * @param {string} attribute Attribute name
 * 
 * @example
 * ```gml
 * FirebasePerformance_HttpMetric_Create(httpMetric,"gamemaker.io","GET");
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key1","value1");
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key2","value2");
 * show_debug_message(FirebasePerformance_HttpMetric_Attribute_Get(httpMetric));
 * FirebasePerformance_HttpMetric_SetRequestPayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetResponseContentType(httpMetric,"text/html");//, application/json, etc.
 * FirebasePerformance_HttpMetric_SetResponsePayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetHttpResponseCode(httpMetric,200);
 * FirebasePerformance_HttpMetric_Start(httpMetric);
 * 
 * //After some time
 * FirebasePerformance_HttpMetric_Stop(httpMetric);
 * ```
 * The above code shows a code example.
 * @function_end
 */

/**
 * @func FirebasePerformance_HttpMetric_Create
 * @desc This function creates a HttpMetric object for collecting network performance data for one request/response.
 * 
 * @param {string} name HttpMetric name
 * @param {string} url a valid url String, cannot be empty
 * @param {string} method One of the values GET, PUT, POST, DELETE, HEAD, PATCH, OPTIONS, TRACE, or CONNECT
 * 
 * @example
 * ```gml
 * FirebasePerformance_HttpMetric_Create(httpMetric,"gamemaker.io","GET");
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key1","value1");
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key2","value2");
 * show_debug_message(FirebasePerformance_HttpMetric_Attribute_Get(httpMetric));
 * FirebasePerformance_HttpMetric_SetRequestPayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetResponseContentType(httpMetric,"text/html");//, application/json, etc.
 * FirebasePerformance_HttpMetric_SetResponsePayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetHttpResponseCode(httpMetric,200);
 * FirebasePerformance_HttpMetric_Start(httpMetric);
 * 
 * //After some time
 * FirebasePerformance_HttpMetric_Stop(httpMetric);
 * ```
 * The above code shows a code example.
 * @function_end
 */

/**
 * @func FirebasePerformance_HttpMetric_SetHttpResponseCode
 * @desc This function sets the HTTP response code of the request.
 * 
 * @param {string} name HttpMetric name
 * @param {real} responseCode valid values are greater than 0
 * 
 * @example
 * ```gml
 * FirebasePerformance_HttpMetric_Create(httpMetric,"gamemaker.io","GET");
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key1","value1");
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key2","value2");
 * show_debug_message(FirebasePerformance_HttpMetric_Attribute_Get(httpMetric));
 * FirebasePerformance_HttpMetric_SetRequestPayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetResponseContentType(httpMetric,"text/html");//, application/json, etc.
 * FirebasePerformance_HttpMetric_SetResponsePayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetHttpResponseCode(httpMetric,200);
 * FirebasePerformance_HttpMetric_Start(httpMetric);
 * 
 * //After some time
 * FirebasePerformance_HttpMetric_Stop(httpMetric);
 * ```
 * The above code shows a code example.
 * @function_end
 */

/**
 * @func FirebasePerformance_HttpMetric_SetRequestPayloadSize
 * @desc This function sets the size of the request payload.
 * 
 * @param {real} arg The argument to be passed in
 * 
 * @example
 * ```gml
 * FirebasePerformance_HttpMetric_Create(httpMetric,"gamemaker.io","GET");
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key1","value1");
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key2","value2");
 * show_debug_message(FirebasePerformance_HttpMetric_Attribute_Get(httpMetric));
 * FirebasePerformance_HttpMetric_SetRequestPayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetResponseContentType(httpMetric,"text/html");//, application/json, etc.
 * FirebasePerformance_HttpMetric_SetResponsePayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetHttpResponseCode(httpMetric,200);
 * FirebasePerformance_HttpMetric_Start(httpMetric);
 * 
 * //After some time
 * FirebasePerformance_HttpMetric_Stop(httpMetric);
 * ```
 * The above code shows a code example.
 * @function_end
 */

/**
 * @func FirebasePerformance_HttpMetric_SetResponseContentType
 * @desc This function sets the content type of the response such as text/html, application/json, etc.
 * 
 * @param {string} name HttpMetric Name
 * @param {string} contentType valid string of MIME type. Invalid usage will be logged.
 * 
 * @example
 * ```gml
 * FirebasePerformance_HttpMetric_Create(httpMetric,"gamemaker.io","GET");
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key1","value1");
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key2","value2");
 * show_debug_message(FirebasePerformance_HttpMetric_Attribute_Get(httpMetric));
 * FirebasePerformance_HttpMetric_SetRequestPayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetResponseContentType(httpMetric,"text/html");//, application/json, etc.
 * FirebasePerformance_HttpMetric_SetResponsePayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetHttpResponseCode(httpMetric,200);
 * FirebasePerformance_HttpMetric_Start(httpMetric);
 * 
 * //After some time
 * FirebasePerformance_HttpMetric_Stop(httpMetric);
 * ```
 * The above code shows a code example.
 * @function_end
 */

/**
 * @func FirebasePerformance_HttpMetric_SetResponsePayloadSize
 * @desc This function sets the size of the response payload.
 * 
 * @param {string} name HttpMetric name
 * @param {string} bytes Valid values are greater than or equal to 0. Invalid usage will be logged.
 * 
 * @example
 * ```gml
 * FirebasePerformance_HttpMetric_Create(httpMetric,"gamemaker.io","GET");
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key1","value1");
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key2","value2");
 * show_debug_message(FirebasePerformance_HttpMetric_Attribute_Get(httpMetric));
 * FirebasePerformance_HttpMetric_SetRequestPayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetResponseContentType(httpMetric,"text/html");//, application/json, etc.
 * FirebasePerformance_HttpMetric_SetResponsePayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetHttpResponseCode(httpMetric,200);
 * FirebasePerformance_HttpMetric_Start(httpMetric);
 * 
 * //After some time
 * FirebasePerformance_HttpMetric_Stop(httpMetric);
 * ```
 * The above code shows a code example.
 * @function_end
 */

/**
 * @func FirebasePerformance_HttpMetric_Start
 * @desc This function marks the start time of the request.
 * 
 * @param {string} name HttpMetric name
 * 
 * @example
 * ```gml
 * FirebasePerformance_HttpMetric_Create(httpMetric,"gamemaker.io","GET")
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key1","value1");
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key2","value2");
 * show_debug_message(FirebasePerformance_HttpMetric_Attribute_Get(httpMetric));
 * FirebasePerformance_HttpMetric_SetRequestPayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetResponseContentType(httpMetric,"text/html");//, application/json, etc.
 * FirebasePerformance_HttpMetric_SetResponsePayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetHttpResponseCode(httpMetric,200);
 * FirebasePerformance_HttpMetric_Start(httpMetric);
 * 
 * //After some time
 * FirebasePerformance_HttpMetric_Stop(httpMetric);
 * 
 * ```
 * The above code shows a code example.
 * @function_end
 */

/**
 * @func FirebasePerformance_HttpMetric_Stop
 * @desc This function marks the end time of the response and queues the network request metric on the device for transmission. Check logcat for transmission info.
 * 
 * @param {string} name HttpMetric name
 * 
 * @example
 * ```gml
 * FirebasePerformance_HttpMetric_Create(httpMetric,"gamemaker.io","GET");
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key1","value1");
 * FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key2","value2");
 * show_debug_message(FirebasePerformance_HttpMetric_Attribute_Get(httpMetric));
 * FirebasePerformance_HttpMetric_SetRequestPayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetResponseContentType(httpMetric,"text/html");//, application/json, etc.
 * FirebasePerformance_HttpMetric_SetResponsePayloadSize(httpMetric,100);
 * FirebasePerformance_HttpMetric_SetHttpResponseCode(httpMetric,200);
 * FirebasePerformance_HttpMetric_Start(httpMetric);
 * 
 * //After some time
 * FirebasePerformance_HttpMetric_Stop(httpMetric);
 * ```
 The above code shows a code example.
 * @function_end
 */

/**
 * @func FirebasePerformance_Trace_Attribute_GetAll
 * @desc This function returns the map of all the attributes added to this trace.
 * 
 * [[Note: This function is only available in Android.]]
 * 
 * @param {string} name Trace name
 * 
 * @returns {string}
 * 
 * @example
 * ```gml
 * FirebasePerformance_Trace_Create(TraceName);
 * FirebasePerformance_Trace_Attribute_Put(TraceName,"key1","value1");
 * FirebasePerformance_Trace_Attribute_Put(TraceName,"key2","value2");
 * show_debug_message(FirebasePerformance_Trace_Attribute_Get(TraceName,"key1"));
 * show_debug_message(FirebasePerformance_Trace_Attribute_GetAll(TraceName));
 * FirebasePerformance_Trace_Metric_Put(TraceName,"key3",10);
 * FirebasePerformance_Trace_Metric_Increment(TraceName,"key3",1);
 * show_debug_message(FirebasePerformance_Trace_Metric_GetLong(TraceName,"key3"));
 * FirebasePerformance_Trace_Start(TraceName);
 * 
 * //After some time...
 * FirebasePerformance_Trace_Stop(TraceName);
 * ```
 * The above code shows a code example.
 * @function_end
 */

/**
 * @func FirebasePerformance_Trace_Attribute_Put
 * @desc This function sets a String value for the specified attribute.
 * 
 * [[Note: This function is only available in Android.]]
 * 
 * @param {string } name Trace name
 * @param {string } attribute Attribute name
 * @param {string } value Value of the attribute
 * 
 * @example
 * ```gml
 * FirebasePerformance_Trace_Create(TraceName);
 * FirebasePerformance_Trace_Attribute_Put(TraceName,"key1","value1");
 * FirebasePerformance_Trace_Attribute_Put(TraceName,"key2","value2");
 * show_debug_message(FirebasePerformance_Trace_Attribute_Get(TraceName,"key1"));
 * show_debug_message(FirebasePerformance_Trace_Attribute_GetAll(TraceName));
 * FirebasePerformance_Trace_Metric_Put(TraceName,"key3",10);
 * FirebasePerformance_Trace_Metric_Increment(TraceName,"key3",1);
 * show_debug_message(FirebasePerformance_Trace_Metric_GetLong(TraceName,"key3"));
 * FirebasePerformance_Trace_Start(TraceName);
 * 
 * //After some time...
 * FirebasePerformance_Trace_Stop(TraceName);
 * ```
 * The above code shows a code example.
 * @function_end
 */

/**
 * @func FirebasePerformance_Trace_Attribute_Remove
 * @desc This function removes an already added attribute from the Traces. If the trace has been stopped, this method returns without removing the attribute.
 * 
 * [[Note: This function is only available in Android.]]
 * 
 * @param {string} name Trace name
 * @param {string} attribute Name of the attribute to be removed from the running Traces.
 * 
 * @example
 * ```gml
 * FirebasePerformance_Trace_Create(TraceName);
 * FirebasePerformance_Trace_Attribute_Put(TraceName,"key1","value1");
 * FirebasePerformance_Trace_Attribute_Put(TraceName,"key2","value2");
 * show_debug_message(FirebasePerformance_Trace_Attribute_Get(TraceName,"key1"));
 * show_debug_message(FirebasePerformance_Trace_Attribute_GetAll(TraceName));
 * FirebasePerformance_Trace_Metric_Put(TraceName,"key3",10);
 * FirebasePerformance_Trace_Metric_Increment(TraceName,"key3",1);
 * show_debug_message(FirebasePerformance_Trace_Metric_GetLong(TraceName,"key3"));
 * FirebasePerformance_Trace_Start(TraceName);
 * 
 * //After some time...
 * FirebasePerformance_Trace_Stop(TraceName);
 * ```
 * The above code shows a code example.
 * @function_end
 */

/**
 * @func FirebasePerformance_Trace_Create
 * @desc This function creates a Trace object with given name.
 * 
 * @param {string} name Trace name
 * 
 * @example
 * ```gml
 * FirebasePerformance_Trace_Create(TraceName);
 * FirebasePerformance_Trace_Attribute_Put(TraceName,"key1","value1");
 * FirebasePerformance_Trace_Attribute_Put(TraceName,"key2","value2");
 * show_debug_message(FirebasePerformance_Trace_Attribute_Get(TraceName,"key1"));
 * show_debug_message(FirebasePerformance_Trace_Attribute_GetAll(TraceName));
 * FirebasePerformance_Trace_Metric_Put(TraceName,"key3",10);
 * FirebasePerformance_Trace_Metric_Increment(TraceName,"key3",1);
 * show_debug_message(FirebasePerformance_Trace_Metric_GetLong(TraceName,"key3"));
 * FirebasePerformance_Trace_Start(TraceName);
 * 
 * //After some time...
 * FirebasePerformance_Trace_Stop(TraceName);
 * ```
 * The above code shows a code example.
 * @function_end
 */

/**
 * @func FirebasePerformance_Trace_Metric_GetLong
 * @desc This function gets the value of the metric with the given name in the current trace. If a metric with the given name doesn't exist, it is NOT created and a 0 is returned. This method is atomic.
 * 
 * @param {string} name Trace name
 * @param {string} metric Metric name
 * 
 * @returns {real}
 * @example
 * ```gml
 * FirebasePerformance_Trace_Create(TraceName);
 * FirebasePerformance_Trace_Attribute_Put(TraceName,"key1","value1");
 * FirebasePerformance_Trace_Attribute_Put(TraceName,"key2","value2");
 * show_debug_message(FirebasePerformance_Trace_Attribute_Get(TraceName,"key1"));
 * show_debug_message(FirebasePerformance_Trace_Attribute_GetAll(TraceName));
 * FirebasePerformance_Trace_Metric_Put(TraceName,"key3",10);
 * FirebasePerformance_Trace_Metric_Increment(TraceName,"key3",1);
 * show_debug_message(FirebasePerformance_Trace_Metric_GetLong(TraceName,"key3"));
 * FirebasePerformance_Trace_Start(TraceName);
 * 
 * //After some time...
 * FirebasePerformance_Trace_Stop(TraceName);
 * ```
 * The above code shows a code example.
 * @function_end
 */

/**
 * @func FirebasePerformance_Trace_Metric_Increment
 * @desc This function atomically increments the metric with the given name in this trace by the incrementBy value. If the metric does not exist, a new one will be created. If the trace has not been started or has already been stopped, returns immediately without taking action.
 * 
 * @param {string} name Trace name
 * @param {string} metric Metric name
 * @param {string} value Amount by which the metric has to be incremented.
 * 
 * @example
 * ```gml
 * FirebasePerformance_Trace_Create(TraceName);
 * FirebasePerformance_Trace_Attribute_Put(TraceName,"key1","value1");
 * FirebasePerformance_Trace_Attribute_Put(TraceName,"key2","value2");
 * show_debug_message(FirebasePerformance_Trace_Attribute_Get(TraceName,"key1"));
 * show_debug_message(FirebasePerformance_Trace_Attribute_GetAll(TraceName));
 * FirebasePerformance_Trace_Metric_Put(TraceName,"key3",10);
 * FirebasePerformance_Trace_Metric_Increment(TraceName,"key3",1);
 * show_debug_message(FirebasePerformance_Trace_Metric_GetLong(TraceName,"key3"));
 * FirebasePerformance_Trace_Start(TraceName);
 * 
 * //After some time...
 * FirebasePerformance_Trace_Stop(TraceName);
 * ```
 * The above code shows a code example.
 * @function_end
 */

/**
 * @func FirebasePerformance_Trace_Metric_Put
 * @desc This function sets the value of the metric with the given name in this trace to the value provided. If a metric with the given name doesn't exist, a new one will be created. If the trace has not been started or has already been stopped, returns immediately without taking action. This method is atomic.
 * 
 * @param {string} name Trace name
 * @param {string} metric Metric name
 * @param {string} value The value to which the metric should be set to.
 * 
 * @example
 * ```gml
 * FirebasePerformance_Trace_Create(TraceName);
 * FirebasePerformance_Trace_Attribute_Put(TraceName,"key1","value1");
 * FirebasePerformance_Trace_Attribute_Put(TraceName,"key2","value2");
 * show_debug_message(FirebasePerformance_Trace_Attribute_Get(TraceName,"key1"));
 * show_debug_message(FirebasePerformance_Trace_Attribute_GetAll(TraceName));
 * FirebasePerformance_Trace_Metric_Put(TraceName,"key3",10);
 * FirebasePerformance_Trace_Metric_Increment(TraceName,"key3",1);
 * show_debug_message(FirebasePerformance_Trace_Metric_GetLong(TraceName,"key3"));
 * FirebasePerformance_Trace_Start(TraceName);
 * 
 * //After some time...
 * FirebasePerformance_Trace_Stop(TraceName);
 * ```
 * The above code shows a code example.
 * @function_end
 */

/**
 * @func FirebasePerformance_Trace_Start
 * @desc This function starts the trace.
 * 
 * @param {string} name The trace name
 * 
 * @example
 * ```gml
 * FirebasePerformance_Trace_Create(TraceName);
 * FirebasePerformance_Trace_Attribute_Put(TraceName,"key1","value1");
 * FirebasePerformance_Trace_Attribute_Put(TraceName,"key2","value2");
 * show_debug_message(FirebasePerformance_Trace_Attribute_Get(TraceName,"key1"));
 * show_debug_message(FirebasePerformance_Trace_Attribute_GetAll(TraceName));
 * FirebasePerformance_Trace_Metric_Put(TraceName,"key3",10);
 * FirebasePerformance_Trace_Metric_Increment(TraceName,"key3",1);
 * show_debug_message(FirebasePerformance_Trace_Metric_GetLong(TraceName,"key3"));
 * FirebasePerformance_Trace_Start(TraceName);
 * 
 * //After some time...
 * FirebasePerformance_Trace_Stop(TraceName);
 * ```
 * The above code shows a code example.
 * @function_end
 */

/**
 * @func FirebasePerformance_Trace_Stop
 * @desc This function stops the trace with the given name.
 * 
 * @param {string} name Trace name
 * 
 * @example
 * ```gml
 * FirebasePerformance_Trace_Create(TraceName);
 * FirebasePerformance_Trace_Attribute_Put(TraceName,"key1","value1");
 * FirebasePerformance_Trace_Attribute_Put(TraceName,"key2","value2");
 * show_debug_message(FirebasePerformance_Trace_Attribute_Get(TraceName,"key1"));
 * show_debug_message(FirebasePerformance_Trace_Attribute_GetAll(TraceName));
 * FirebasePerformance_Trace_Metric_Put(TraceName,"key3",10);
 * FirebasePerformance_Trace_Metric_Increment(TraceName,"key3",1);
 * show_debug_message(FirebasePerformance_Trace_Metric_GetLong(TraceName,"key3"));
 * FirebasePerformance_Trace_Start(TraceName);
 * 
 * //After some time...
 * FirebasePerformance_Trace_Stop(TraceName);
 * ```
 * The above code shows a code example.
 * @function_end
 */
