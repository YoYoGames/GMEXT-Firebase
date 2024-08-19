/**
 * @function FirebasePerformance_isPerformanceCollectionEnabled
 * 
 * Returns whether performance monitoring is enabled or disabled. This respects the Firebase Performance specific values first, and if these aren't set, uses the Firebase wide data collection switch.
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
 * @desc Enables or disables performance monitoring. This setting is persisted and applied on future invocations of your application. By default, performance monitoring is enabled.
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
 * @desc Returns the value of an attribute.
 * 
 * [[Note: this function is only available in Android.]]
 * 
 * @param {string} name HttpMetric name
 * @param {string} attribute Attribute name
 * 
 * @returns {string}
 * @example
 * ```gml
 * FirebasePerformance_HttpMetric_Create(httpMetric,"yoyogames.com","GET");
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
 * @desc Returns all attributes in JSON format.
 * 
 * [[Note: This function is only available in Android.]]
 * 
 * 
 * @param {string} name HttpMetric name
 * @param {string} attribute Attribute name
 * 
 * @returns {string}
 * @example
 * ```gml
 * FirebasePerformance_HttpMetric_Create(httpMetric,"yoyogames.com","GET");
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
 * @desc Sets a String value for the specified attribute. Updates the value of the attribute if the attribute already exists.
 * 
 * [[Note: This function is only available in Android.]]
 * 
 * @param {string} name HttpMetric name
 * @param {string} attribute Attribute name
 * @param {string} value Value of the attribute
 * 
 * @example
 * ```gml
 * FirebasePerformance_HttpMetric_Create(httpMetric,"yoyogames.com","GET");
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
 * @desc Removes an already added attribute from the HttpMetric.
 * 
 * [[Note: This function is only available in Android.]]
 * 
 * @param {string} name HttpMetric name
 * @param {string} attribute Attribute name
 * 
 * @example
 * ```gml
 * FirebasePerformance_HttpMetric_Create(httpMetric,"yoyogames.com","GET");
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
 * @desc Creates a HttpMetric object for collecting network performance data for one request/response
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
 * @desc Sets the httpResponse code of the request
 * 
 * @param {string} name HttpMetric name
 * @param {real} responseCode valid values are greater than 0
 * 
 * @example
 * ```gml
 * FirebasePerformance_HttpMetric_Create(httpMetric,"yoyogames.com","GET");
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
 * @desc Sets the size of the request payload.
 * 
 * @param {real} arg The argument to be passed in
 * 
 * @example
 * ```gml
 * FirebasePerformance_HttpMetric_Create(httpMetric,"yoyogames.com","GET");
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
 * @desc Content type of the response such as text/html, application/json, etc.
 * 
 * @param {string} name HttpMetric Name
 * @param {string} contentType valid string of MIME type. Invalid usage will be logged.
 * 
 * @example
 * ```gml
 * FirebasePerformance_HttpMetric_Create(httpMetric,"yoyogames.com","GET");
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
 * @desc Sets the size of the response payload
 * 
 * @param {string} name HttpMetric name
 * @param {string} bytes Valid values are greater than or equal to 0. Invalid usage will be logged.
 * 
 * @example
 * ```gml
 * FirebasePerformance_HttpMetric_Create(httpMetric,"yoyogames.com","GET");
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
 * @desc Marks the start time of the request
 * 
 * @param {string} name HttpMetric name
 * 
 * @example
 * ```gml
 * FirebasePerformance_HttpMetric_Create(httpMetric,"yoyogames.com","GET")
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
 * @desc Marks the end time of the response and queues the network request metric on the device for transmission. Check logcat for transmission info.
 * 
 * @param {string} name HttpMetric name
 * 
 * @example
 * ```gml
 * FirebasePerformance_HttpMetric_Create(httpMetric,"yoyogames.com","GET");
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
 * @desc Returns the map of all the attributes added to this trace.
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
 * @desc Sets a String value for the specified attribute.
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
 * @desc Removes an already added attribute from the Traces. If the trace has been stopped, this method returns without removing the attribute.
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
 * @desc Creates a Trace object with given name.
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
 * @desc Gets the value of the metric with the given name in the current trace. If a metric with the given name doesn't exist, it is NOT created and a 0 is returned. This method is atomic.
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
 * @desc Atomically increments the metric with the given name in this trace by the incrementBy value. If the metric does not exist, a new one will be created. If the trace has not been started or has already been stopped, returns immediately without taking action.
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
 * @desc Sets the value of the metric with the given name in this trace to the value provided. If a metric with the given name doesn't exist, a new one will be created. If the trace has not been started or has already been stopped, returns immediately without taking action. This method is atomic.
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
 * @desc Starts this trace.
|name|Trace nam|


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
 * @desc Stops this trace.
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
