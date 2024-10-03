
// Global namespace for Firebase Performance Monitoring
window.FirebasePerformanceExt = Object.assign(window.FirebasePerformanceExt || {}, {

	traces: {}, // Store named traces
    httpMetrics: {}, // Store named HTTP metrics

	/**
	 * Helper function to check if Performance Monitoring is initialized.
	 * Logs an error if `instance` is not ready.
	 * @return {boolean} `true` if `instance` is ready, `false` otherwise.
	 */
	isPerformanceInitialized: function() {
		const context = window.FirebasePerformanceExt;
		if (!context.instance || !context.module) {
			console.warn("Firebase Performance Monitoring is not initialized. Please wait for initialization to complete.");
			return false;
		}
		return true;
	},

	/**
	 * Sends an async event with the specified type and data.
	 * This function constructs an event object and sends it using the GMS API.
	 * @param {string} eventType - The type of the event.
	 * @param {Object} data - A dictionary containing key-value pairs for the event.
	 */
	sendAsyncEvent: function(eventType, data) {
		const eventObject = { type: eventType };

		for (const key in data) {
			if (data.hasOwnProperty(key)) {
				const value = data[key];

				if (typeof value === 'string') {
					eventObject[key] = value;
				} else if (typeof value === 'number') {
					eventObject[key] = value;
				} else if (typeof value === 'boolean') {
					eventObject[key] = value ? 1 : 0;
				} else if (typeof value === 'object' && value !== null) {
					eventObject[key] = JSON.stringify(value);
				} else {
					eventObject[key] = String(value);
				}
			}
		}

		GMS_API.send_async_event_social(eventObject);
	}
});

// Firebase Performance Monitoring error codes
const FIREBASE_PERFORMANCE_SUCCESS = 0.0;
const FIREBASE_PERFORMANCE_ERROR_NOT_FOUND = -1.0;
const FIREBASE_PERFORMANCE_ERROR_INVALID_NAME = -2.0;
const FIREBASE_PERFORMANCE_ERROR_CREATION_FAILED = -3.0;
const FIREBASE_PERFORMANCE_ERROR_INVALID_PARAMETERS = -4.0;
const FIREBASE_PERFORMANCE_ERROR_INVALID_URL = -5.0;
const FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED = -6.0;

/**
 * Enables or disables Firebase Performance Monitoring data collection.
 * Returns `FIREBASE_PERFORMANCE_SUCCESS` if the operation is successful.
 * 
 * @param {Real} value - `1.0` to enable performance collection, `0.0` to disable it.
 * @returns {Real} `FIREBASE_PERFORMANCE_SUCCESS` if successful, `FIREBASE_PERFORMANCE_ERROR_NOT_INITIALIZED` if not initialized.
 */
function FirebasePerformance_setPerformanceCollectionEnabled(value) {
    const { isPerformanceInitialized, instance } = window.FirebasePerformanceExt;
    if (!isPerformanceInitialized()) return FIREBASE_PERFORMANCE_ERROR_NOT_INITIALIZED;

    instance.dataCollectionEnabled = value >= 0.5;
    return FIREBASE_PERFORMANCE_SUCCESS;
}

/**
 * Checks whether Firebase Performance Monitoring data collection is enabled.
 * 
 * @returns {Real} `1.0` if performance collection is enabled, `0.0` if disabled, or `FIREBASE_PERFORMANCE_ERROR_NOT_INITIALIZED` if not initialized.
 */
function FirebasePerformance_isPerformanceCollectionEnabled() {
    const { isPerformanceInitialized, instance } = window.FirebasePerformanceExt;
    if (!isPerformanceInitialized()) return FIREBASE_PERFORMANCE_ERROR_NOT_INITIALIZED;

    return instance.dataCollectionEnabled ? 1.0 : 0.0;
}

/**
 * Creates a new Firebase Performance Monitoring trace with a given name.
 * Returns `FIREBASE_PERFORMANCE_SUCCESS` if the trace is created successfully.
 * 
 * @param {String} name - The name of the trace to be created.
 * @returns {Real} `FIREBASE_PERFORMANCE_SUCCESS` if successful, `FIREBASE_PERFORMANCE_ERROR_NOT_INITIALIZED` if not initialized.
 */
function FirebasePerformance_Trace_Create(name) {
	const { isPerformanceInitialized, traces, instance, module } = window.FirebasePerformanceExt;
        
	// Check if performance monitoring is initialized
	if (!isPerformanceInitialized()) return FIREBASE_PERFORMANCE_ERROR_NOT_INITIALIZED;

	// Create a new trace using the trace method from the module
	traces[name] = module.trace(instance, name);
	return FIREBASE_PERFORMANCE_SUCCESS;
}

/**
 * Starts a Firebase Performance Monitoring trace by its name.
 * Returns `FIREBASE_PERFORMANCE_SUCCESS` if the trace is started successfully.
 * 
 * @param {String} name - The name of the trace to be started.
 * @returns {Real} `FIREBASE_PERFORMANCE_SUCCESS` if successful, `FIREBASE_PERFORMANCE_ERROR_NOT_INITIALIZED` if not initialized, or `FIREBASE_PERFORMANCE_ERROR_NOT_FOUND` if the trace is not found.
 */
function FirebasePerformance_Trace_Start(name) {
    const { isPerformanceInitialized, traces } = window.FirebasePerformanceExt;

	if (!isPerformanceInitialized()) return FIREBASE_PERFORMANCE_ERROR_NOT_INITIALIZED;

    if (!traces[name]) {
		console.warn("FirebasePerformance_Trace_Start :: Trace not found: " + name);
		return FIREBASE_PERFORMANCE_ERROR_NOT_FOUND;
	}

    traces[name].start();
    return FIREBASE_PERFORMANCE_SUCCESS;
}

/**
 * Stops a Firebase Performance Monitoring trace by its name and removes it from the internal map.
 * Returns `FIREBASE_PERFORMANCE_SUCCESS` if the trace is stopped successfully.
 * 
 * @param {String} name - The name of the trace to be stopped.
 * @returns {Real} `FIREBASE_PERFORMANCE_SUCCESS` if successful, `FIREBASE_PERFORMANCE_ERROR_NOT_INITIALIZED` if not initialized, or `FIREBASE_PERFORMANCE_ERROR_NOT_FOUND` if the trace is not found.
 */
function FirebasePerformance_Trace_Stop(name) {
    const { isPerformanceInitialized, traces } = window.FirebasePerformanceExt;

	if (!isPerformanceInitialized()) return FIREBASE_PERFORMANCE_ERROR_NOT_INITIALIZED;

	if (!traces[name]) {
		console.warn("FirebasePerformance_Trace_Stop :: Trace not found: " + name);
		return FIREBASE_PERFORMANCE_ERROR_NOT_FOUND;
	}

    traces[name].stop();
	delete traces[name];  // Remove the stopped trace from the internal map
    return FIREBASE_PERFORMANCE_SUCCESS;
}

/**
 * Sets a custom metric value for a given trace.
 * Returns `FIREBASE_PERFORMANCE_SUCCESS` if the metric is set successfully.
 * 
 * @param {String} name - The name of the trace.
 * @param {String} metric - The name of the metric to set.
 * @param {Real} value - The value of the metric.
 * @returns {Real} `FIREBASE_PERFORMANCE_SUCCESS` if successful, `FIREBASE_PERFORMANCE_ERROR_NOT_INITIALIZED` if not initialized, or `FIREBASE_PERFORMANCE_ERROR_NOT_FOUND` if the trace is not found.
 */
function FirebasePerformance_Trace_Metric_Put(name, metric, value) {
    const { isPerformanceInitialized, traces } = window.FirebasePerformanceExt;

	if (!isPerformanceInitialized()) return FIREBASE_PERFORMANCE_ERROR_NOT_INITIALIZED;

    if (!traces[name]) {
		console.warn("FirebasePerformance_Trace_Metric_Put :: Trace not found: " + name);
		return FIREBASE_PERFORMANCE_ERROR_NOT_FOUND;
	}

    traces[name].putMetric(metric, value);
    return FIREBASE_PERFORMANCE_SUCCESS;
}

/**
 * Increments a custom metric for a given trace.
 * Returns `FIREBASE_PERFORMANCE_SUCCESS` if the metric is incremented successfully.
 * 
 * @param {String} name - The name of the trace.
 * @param {String} metric - The name of the metric to increment.
 * @param {Real} value - The value by which to increment the metric.
 * @returns {Real} `FIREBASE_PERFORMANCE_SUCCESS` if successful, `FIREBASE_PERFORMANCE_ERROR_NOT_INITIALIZED` if not initialized, or `FIREBASE_PERFORMANCE_ERROR_NOT_FOUND` if the trace is not found.
 */
function FirebasePerformance_Trace_Metric_Increment(name, metric, value) {
    const { isPerformanceInitialized, traces } = window.FirebasePerformanceExt;

	if (!isPerformanceInitialized()) return FIREBASE_PERFORMANCE_ERROR_NOT_INITIALIZED;

    if (!traces[name]) {
		console.warn("FirebasePerformance_Trace_Metric_Increment :: Trace not found: " + name);
		return FIREBASE_PERFORMANCE_ERROR_NOT_FOUND;
	}

    traces[name].incrementMetric(metric, value);
    return FIREBASE_PERFORMANCE_SUCCESS;
}

/**
 * Retrieves the value of a custom metric for a given trace.
 * 
 * @param {String} name - The name of the trace.
 * @param {String} metric - The name of the metric to retrieve.
 * @returns {Real} The value of the metric, `FIREBASE_PERFORMANCE_ERROR_NOT_INITIALIZED` if not initialized, or `FIREBASE_PERFORMANCE_ERROR_NOT_FOUND` if the trace is not found.
 */
function FirebasePerformance_Trace_Metric_GetLong(name, metric) {
	const { isPerformanceInitialized, traces } = window.FirebasePerformanceExt;

	if (!isPerformanceInitialized()) return FIREBASE_PERFORMANCE_ERROR_NOT_INITIALIZED;

    if (!traces[name]) {
		console.warn("FirebasePerformance_Trace_Metric_GetLong :: Trace not found: " + name);
		return FIREBASE_PERFORMANCE_ERROR_NOT_FOUND;
	}

	return traces[name].getMetric(metric);
}

/**
 * Adds a custom attribute to a given trace.
 * Returns `FIREBASE_PERFORMANCE_SUCCESS` if the attribute is set successfully.
 * 
 * @param {String} name - The name of the trace.
 * @param {String} attribute - The attribute name to set.
 * @param {String} value - The value of the attribute.
 * @returns {Real} `FIREBASE_PERFORMANCE_SUCCESS` if successful, `FIREBASE_PERFORMANCE_ERROR_NOT_INITIALIZED` if not initialized, or `FIREBASE_PERFORMANCE_ERROR_NOT_FOUND` if the trace is not found.
 */
function FirebasePerformance_Trace_Attribute_Put(name, attribute, value) {
	const { isPerformanceInitialized, traces } = window.FirebasePerformanceExt;

	if (!isPerformanceInitialized()) return FIREBASE_PERFORMANCE_ERROR_NOT_INITIALIZED;

    if (!traces[name]) {
		console.warn("FirebasePerformance_Trace_Attribute_Put :: Trace not found: " + name);
		return FIREBASE_PERFORMANCE_ERROR_NOT_FOUND;
	}

	traces[name].putAttribute(attribute, value);
	return FIREBASE_PERFORMANCE_SUCCESS;
}

/**
 * Removes a custom attribute from a given trace.
 * Returns `FIREBASE_PERFORMANCE_SUCCESS` if the attribute is removed successfully.
 * 
 * @param {String} name - The name of the trace.
 * @param {String} attribute - The attribute name to remove.
 * @returns {Real} `FIREBASE_PERFORMANCE_SUCCESS` if successful, `FIREBASE_PERFORMANCE_ERROR_NOT_INITIALIZED` if not initialized, or `FIREBASE_PERFORMANCE_ERROR_NOT_FOUND` if the trace is not found.
 */
function FirebasePerformance_Trace_Attribute_Remove(name, attribute) {
	const { isPerformanceInitialized, traces } = window.FirebasePerformanceExt;

	if (!isPerformanceInitialized()) return FIREBASE_PERFORMANCE_ERROR_NOT_INITIALIZED;

    if (!traces[name]) {
		console.warn("FirebasePerformance_Trace_Attribute_Remove :: Trace not found: " + name);
		return FIREBASE_PERFORMANCE_ERROR_NOT_FOUND;
	}

	traces[name].removeAttribute(attribute);
	return FIREBASE_PERFORMANCE_SUCCESS;
}

/**
 * Retrieves the value of a custom attribute for a given trace.
 * 
 * @param {String} name - The name of the trace.
 * @param {String} attribute - The attribute name to retrieve.
 * @returns {String} The value of the attribute, or an empty string if not found.
 */
function FirebasePerformance_Trace_Attribute_Get(name, attribute) {
	const { isPerformanceInitialized, traces } = window.FirebasePerformanceExt;

	if (!isPerformanceInitialized()) {
		console.warn("FirebasePerformance_Trace_Attribute_Get :: Module not initialized");
		return "";
	}

    if (!traces[name]) {
		console.warn("FirebasePerformance_Trace_Attribute_Get :: Trace not found: " + name);
		return "";
	}

	return traces[name].getAttribute(attribute);
}

/**
 * Retrieves all custom attributes for a given trace in JSON format.
 * 
 * @param {String} name - The name of the trace.
 * @returns {String} A JSON string containing all attributes, or an empty JSON object if not found.
 */
function FirebasePerformance_Trace_Attribute_GetAll(name) {
	const { isPerformanceInitialized, traces } = window.FirebasePerformanceExt;

	if (!isPerformanceInitialized()) {
		console.warn("FirebasePerformance_Trace_Attribute_GetAll :: Module not initialized");
		return "{}";
	}

    if (!traces[name]) {
		console.warn("FirebasePerformance_Trace_Attribute_GetAll :: Trace not found: " + name);
		return "{}";
	}

	return JSON.stringify(traces[name].getAttributes());
}

/**
 * Creates an HTTP metric. Currently not supported in the Firebase web SDK.
 * 
 * @param {String} name - The name of the HTTP metric.
 * @param {String} url - The URL being monitored.
 * @param {String} method - The HTTP method used for the request.
 * @returns {Real} `FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED` as HTTP metrics are not supported.
 */
function FirebasePerformance_HttpMetric_Create(name, url, method) {
    console.warn("FirebasePerformance_HttpMetric_Create :: HTTP metrics are not supported in the Firebase web SDK.");
    return FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED;
}

/**
 * Starts an HTTP metric. Currently not supported in the Firebase web SDK.
 * 
 * @param {String} name - The name of the HTTP metric to start.
 * @returns {Real} `FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED` as HTTP metrics are not supported.
 */
function FirebasePerformance_HttpMetric_Start(name) {
    console.warn("FirebasePerformance_HttpMetric_Start :: HTTP metrics are not supported in the Firebase web SDK.");
    return FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED;
}

/**
 * Stops an HTTP metric. Currently not supported in the Firebase web SDK.
 * 
 * @param {String} name - The name of the HTTP metric to stop.
 * @returns {Real} `FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED` as HTTP metrics are not supported.
 */
function FirebasePerformance_HttpMetric_Stop(name) {
    console.warn("FirebasePerformance_HttpMetric_Stop :: HTTP metrics are not supported in the Firebase web SDK.");
    return FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED;
}

/**
 * Sets the HTTP response code for a given metric. Currently not supported in the Firebase web SDK.
 * 
 * @param {String} name - The name of the HTTP metric.
 * @param {Real} responseCode - The HTTP response code.
 * @returns {Real} `FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED` as HTTP metrics are not supported.
 */
function FirebasePerformance_HttpMetric_SetHttpResponseCode(name, responseCode) {
    console.warn("FirebasePerformance_HttpMetric_SetHttpResponseCode :: HTTP metrics are not supported in the Firebase web SDK.");
    return FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED;
}

/**
 * Sets the request payload size for a given metric. Currently not supported in the Firebase web SDK.
 * 
 * @param {String} name - The name of the HTTP metric.
 * @param {Real} bytes - The request payload size in bytes.
 * @returns {Real} `FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED` as HTTP metrics are not supported.
 */
function FirebasePerformance_HttpMetric_SetRequestPayloadSize(name, bytes) {
    console.warn("FirebasePerformance_HttpMetric_SetRequestPayloadSize :: HTTP metrics are not supported in the Firebase web SDK.");
    return FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED;
}

/**
 * Sets the response content type for a given metric. Currently not supported in the Firebase web SDK.
 * 
 * @param {String} name - The name of the HTTP metric.
 * @param {String} contentType - The response content type.
 * @returns {Real} `FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED` as HTTP metrics are not supported.
 */
function FirebasePerformance_HttpMetric_SetResponseContentType(name, contentType) {
    console.warn("FirebasePerformance_HttpMetric_SetResponseContentType :: HTTP metrics are not supported in the Firebase web SDK.");
    return FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED;
}

/**
 * Sets the response payload size for a given metric. Currently not supported in the Firebase web SDK.
 * 
 * @param {String} name - The name of the HTTP metric.
 * @param {Real} bytes - The response payload size in bytes.
 * @returns {Real} `FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED` as HTTP metrics are not supported.
 */
function FirebasePerformance_HttpMetric_SetResponsePayloadSize(name, bytes) {
    console.warn("FirebasePerformance_HttpMetric_SetResponsePayloadSize :: HTTP metrics are not supported in the Firebase web SDK.");
    return FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED;
}

/**
 * Adds a custom attribute to an HTTP metric. Currently not supported in the Firebase web SDK.
 * 
 * @param {String} name - The name of the HTTP metric.
 * @param {String} attribute - The attribute name to set.
 * @param {String} value - The value of the attribute.
 * @returns {Real} `FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED` as HTTP metrics are not supported.
 */
function FirebasePerformance_HttpMetric_Attribute_Put(name, attribute, value) {
    console.warn("FirebasePerformance_HttpMetric_Attribute_Put :: HTTP metrics are not supported in the Firebase web SDK.");
    return FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED;
}

/**
 * Removes a custom attribute from an HTTP metric. Currently not supported in the Firebase web SDK.
 * 
 * @param {String} name - The name of the HTTP metric.
 * @param {String} attribute - The attribute name to remove.
 * @returns {Real} `FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED` as HTTP metrics are not supported.
 */
function FirebasePerformance_HttpMetric_Attribute_Remove(name, attribute) {
    console.warn("FirebasePerformance_HttpMetric_Attribute_Remove :: HTTP metrics are not supported in the Firebase web SDK.");
    return FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED;
}

/**
 * Retrieves the value of a custom attribute from an HTTP metric. Currently not supported in the Firebase web SDK.
 * 
 * @param {String} name - The name of the HTTP metric.
 * @param {String} attribute - The attribute name to retrieve.
 * @returns {Real} `FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED` as HTTP metrics are not supported.
 */
function FirebasePerformance_HttpMetric_Attribute_Get(name, attribute) {
    console.warn("FirebasePerformance_HttpMetric_Attribute_Get :: HTTP metrics are not supported in the Firebase web SDK.");
    return FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED;
}

/**
 * Retrieves all custom attributes from an HTTP metric. Currently not supported in the Firebase web SDK.
 * 
 * @param {String} name - The name of the HTTP metric.
 * @returns {Real} `FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED` as HTTP metrics are not supported.
 */
function FirebasePerformance_HttpMetric_Attribute_GetAll(name) {
    console.warn("FirebasePerformance_HttpMetric_Attribute_GetAll :: HTTP metrics are not supported in the Firebase web SDK.");
    return FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED;
}