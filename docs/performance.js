/**
 * @function firebase_performance_set_collection_enabled
 * @desc **Firebase SDK:** [FirebasePerformance.setPerformanceCollectionEnabled(boolean) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/perf/FirebasePerformance#setPerformanceCollectionEnabled%28boolean%29), [FIRPerformance dataCollectionEnabled (iOS)](https://firebase.google.com/docs/reference/ios/firebaseperformance/api/reference/Classes/FIRPerformance#datacollectionenabled)
 *
 * This function turns performance data collection on or off: the automatic traces, the game's
 * own traces and HTTP metrics alike. It overrides the `disableDataCollection` extension option
 * (see ${page.extension_options}) and persists across launches, so a consent screen calls it once
 * when the player agrees. While collection is off, traces can still be started and stopped; they
 * are simply not sent.
 *
 * @param {Bool} enabled `true` to collect and send performance data, `false` to stop.
 * @function_end
 */

/**
 * @function firebase_performance_is_collection_enabled
 * @desc **Firebase SDK:** [FirebasePerformance.isPerformanceCollectionEnabled() (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/perf/FirebasePerformance#isPerformanceCollectionEnabled%28%29), [FIRPerformance isDataCollectionEnabled (iOS)](https://firebase.google.com/docs/reference/ios/firebaseperformance/api/reference/Classes/FIRPerformance#datacollectionenabled)
 *
 * This function returns whether performance data is collected: the value set with
 * ${function.firebase_performance_set_collection_enabled}, or the `disableDataCollection` option's
 * when nothing has been set. On Android it returns `false` when the default Firebase App does not
 * exist.
 *
 * @returns {Bool} `true` when performance data is collected, `false` otherwise.
 * @function_end
 */

/**
 * @function firebase_performance_trace_start
 * @desc **Firebase SDK:** [FirebasePerformance.newTrace(java.lang.String) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/perf/FirebasePerformance#newTrace%28java.lang.String%29), [FIRPerformance traceWithName: (iOS)](https://firebase.google.com/docs/reference/ios/firebaseperformance/api/reference/Classes/FIRPerformance#-tracewithname:)
 *
 * This function starts a custom code trace: a timer around a part of the game whose duration
 * you want to see in the console across players and devices - loading a level, generating a
 * world, a matchmaking round trip, a save. Stop it with ${function.firebase_performance_trace_stop};
 * the duration between the two is the trace's main measurement, and the metrics and attributes
 * put on it in between go with it. Name traces for what they measure, under 100 characters, not
 * starting with `_` (the SDK's own traces do); the console shows every trace by name, so use the
 * same name for the same thing every time. A trace that is never stopped is never sent.
 *
 * It returns `0` when the name is empty, when the SDK has not initialised (on iOS, before
 * ${function.firebase_app_initialize}), and on iOS when the SDK rejects the name; on Android a
 * name the SDK rejects still gets a handle, with a warning in the log and no data sent.
 *
 * @param {String} name The trace's name.
 * @returns {Real} A trace handle, or `0` on failure.
 *
 * @example
 * ```gml
 * // Loading a level: the trace spans the load and carries what was loaded
 * trace = firebase_performance_trace_start("level_load");
 * firebase_performance_trace_put_attribute(trace, "level", level_name);
 *
 * var _count = load_level_assets(level_name);
 *
 * firebase_performance_trace_put_metric(trace, "assets_loaded", _count);
 * firebase_performance_trace_stop(trace);
 * ```
 * The above code times a level load and sends the level's name as an attribute, to break the
 * durations down by level in the console, and the number of assets loaded as a metric, to plot
 * it against them.
 * @function_end
 */

/**
 * @function firebase_performance_trace_stop
 * @desc **Firebase SDK:** [Trace.stop() (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/perf/metrics/Trace#stop%28%29), [FIRTrace stop (iOS)](https://firebase.google.com/docs/reference/ios/firebaseperformance/api/reference/Classes/FIRTrace#-stop)
 *
 * This function stops a trace and queues it for sending, and frees its handle: no attribute or
 * metric can be put on it afterwards.
 *
 * @param {Real} trace The trace handle from ${function.firebase_performance_trace_start}.
 * @returns {Bool} `true` when the trace was stopped, `false` when the handle is not valid or was already stopped.
 * @function_end
 */

/**
 * @function firebase_performance_trace_put_attribute
 * @desc **Firebase SDK:** [Trace.putAttribute(java.lang.String,java.lang.String) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/perf/metrics/Trace#putAttribute%28java.lang.String,java.lang.String%29), [FIRPerformanceAttributable setValue:forAttribute: (iOS)](https://firebase.google.com/docs/reference/ios/firebaseperformance/api/reference/Protocols/FIRPerformanceAttributable#-setvalue:forattribute:)
 *
 * This function sets an attribute on a running trace, replacing its value when it already
 * exists. An attribute is a name-value pair that the console filters and breaks down
 * by; each trace and metric holds up to five, with names up to 40 characters and values up to 100,
 * neither starting with `firebase_`, `google_` or `ga_`. Both are trimmed of surrounding spaces. The SDK checks the rules itself and only logs a violation, so the
 * extension reads the attribute back and returns whether it was stored.
 *
 * @param {Real} trace The trace handle from ${function.firebase_performance_trace_start}.
 * @param {String} key The attribute's name.
 * @param {String} value The attribute's value.
 * @returns {Bool} `true` when the SDK stored the value, `false` when the handle is not valid or the SDK rejected the attribute.
 * @function_end
 */

/**
 * @function firebase_performance_trace_remove_attribute
 * @desc **Firebase SDK:** [Trace.removeAttribute(java.lang.String) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/perf/metrics/Trace#removeAttribute%28java.lang.String%29), [FIRPerformanceAttributable removeAttribute: (iOS)](https://firebase.google.com/docs/reference/ios/firebaseperformance/api/reference/Protocols/FIRPerformanceAttributable#-removeattribute:)
 *
 * This function removes an attribute from a running trace.
 *
 * @param {Real} trace The trace handle from ${function.firebase_performance_trace_start}.
 * @param {String} key The attribute's name.
 * @returns {Bool} `true` when the attribute is gone (or was never set), `false` when the handle is not valid or the SDK kept it.
 * @function_end
 */

/**
 * @function firebase_performance_trace_put_metric
 * @desc **Firebase SDK:** [Trace.putMetric(java.lang.String,long) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/perf/metrics/Trace#putMetric%28java.lang.String,long%29), [FIRTrace setIntValue:forMetric: (iOS)](https://firebase.google.com/docs/reference/ios/firebaseperformance/api/reference/Classes/FIRTrace#-setintvalue:formetric:)
 *
 * This function sets a metric on a running trace: a named integer count the console aggregates
 * alongside the trace's duration - assets loaded, entities spawned, bytes read, cache hits. The
 * value is rounded to the nearest integer; a metric set again is replaced. A trace holds up to
 * 32 metrics, named like traces (under 100 characters, not starting with `_`). The extension
 * reads the value back and returns whether the SDK stored it.
 *
 * @param {Real} trace The trace handle from ${function.firebase_performance_trace_start}.
 * @param {String} name The metric's name.
 * @param {Real} value The value; rounded to an integer.
 * @returns {Bool} `true` when the SDK stored the value, `false` when the handle is not valid or the SDK rejected the metric.
 * @function_end
 */

/**
 * @function firebase_performance_trace_increment_metric
 * @desc **Firebase SDK:** [Trace.incrementMetric(java.lang.String,long) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/perf/metrics/Trace#incrementMetric%28java.lang.String,long%29), [FIRTrace incrementMetric:byInt: (iOS)](https://firebase.google.com/docs/reference/ios/firebaseperformance/api/reference/Classes/FIRTrace#-incrementmetric:byint:)
 *
 * This function adds to a metric on a running trace, creating it at `0` first when it does not
 * exist yet - the natural shape for counting as you go, one call per item. The increment is
 * rounded to the nearest integer and may be negative.
 *
 * @param {Real} trace The trace handle from ${function.firebase_performance_trace_start}.
 * @param {String} name The metric's name.
 * @param {Real} increment_by The amount to add; rounded to an integer.
 * @returns {Bool} `true` when the SDK applied the increment, `false` when the handle is not valid or the SDK rejected the metric.
 *
 * @example
 * ```gml
 * // Create Event of the loader
 * trace = firebase_performance_trace_start("world_generation");
 *
 * // Each step of the generator, as chunks complete
 * firebase_performance_trace_increment_metric(trace, "chunks", 1);
 *
 * // When the generator is done
 * firebase_performance_trace_stop(trace);
 * ```
 * The above code counts generated chunks into a metric one at a time while the trace runs, so
 * the console can relate the generation time to how much was generated.
 * @function_end
 */

/**
 * @function firebase_performance_http_metric_start
 * @desc **Firebase SDK:** [FirebasePerformance.newHttpMetric(java.lang.String,java.lang.String) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/perf/FirebasePerformance#newHttpMetric%28java.lang.String,java.lang.String%29), [FIRHTTPMetric initWithURL:HTTPMethod: (iOS)](https://firebase.google.com/docs/reference/ios/firebaseperformance/api/reference/Classes/FIRHTTPMetric#-initwithurl:httpmethod:)
 *
 * This function starts an HTTP metric: a timer around one request the game makes itself, so
 * that its latency, success rate and payload sizes show in the console's network view alongside
 * the requests the SDK measures on its own. Start it when the request is sent and stop it with
 * ${function.firebase_performance_http_metric_stop} when the reply is in, setting the response
 * code and sizes in between; the console groups requests by URL pattern, with the query string
 * dropped. Made for the `http_*` functions, whose requests the SDK's automatic network
 * monitoring may not see, since they go through the runner's own client.
 *
 * It returns `0` when the URL is empty (on iOS, also when it is not a URL) or, on Android, when
 * the default Firebase App does not exist.
 *
 * @param {String} url The request's URL.
 * @param {Enum.FirebasePerformanceHttpMethod} method The request's HTTP method.
 * @returns {Real} A metric handle, or `0` on failure.
 *
 * @example
 * ```gml
 * // Sending the request
 * metric = firebase_performance_http_metric_start(url, FirebasePerformanceHttpMethod.Post);
 * request = http_post_string(url, body);
 * firebase_performance_http_metric_set_request_payload_size(metric, string_byte_length(body));
 *
 * // Async HTTP Event
 * if (async_load[? "id"] == request)
 * {
 *     if (async_load[? "status"] == 1) exit;   // still downloading
 *     if (async_load[? "status"] == 0)
 *     {
 *         firebase_performance_http_metric_set_response_code(metric, async_load[? "http_status"]);
 *         firebase_performance_http_metric_set_response_payload_size(metric, string_byte_length(async_load[? "result"]));
 *     }
 *     firebase_performance_http_metric_stop(metric);
 * }
 * ```
 * The above code measures one `http_post_string` request from send to reply, recording the
 * request's size, the status code and the reply's size, and stops the metric on failure too, so
 * that the console can show how the game's own backend performs for players.
 * @function_end
 */

/**
 * @function firebase_performance_http_metric_set_response_code
 * @desc **Firebase SDK:** [HttpMetric.setHttpResponseCode(int) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/perf/metrics/HttpMetric#setHttpResponseCode%28int%29), [FIRHTTPMetric responseCode (iOS)](https://firebase.google.com/docs/reference/ios/firebaseperformance/api/reference/Classes/FIRHTTPMetric#responsecode)
 *
 * This function records the HTTP status code of the reply, which the console uses for the
 * request's success rate.
 *
 * @param {Real} metric The metric handle from ${function.firebase_performance_http_metric_start}.
 * @param {Real} response_code The status code, e.g. `200`.
 * @returns {Bool} `true` when recorded, `false` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_performance_http_metric_set_request_payload_size
 * @desc **Firebase SDK:** [HttpMetric.setRequestPayloadSize(long) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/perf/metrics/HttpMetric#setRequestPayloadSize%28long%29), [FIRHTTPMetric requestPayloadSize (iOS)](https://firebase.google.com/docs/reference/ios/firebaseperformance/api/reference/Classes/FIRHTTPMetric#requestpayloadsize)
 *
 * This function records the size of the request body sent, in bytes. Negative values are
 * recorded as `0`.
 *
 * @param {Real} metric The metric handle from ${function.firebase_performance_http_metric_start}.
 * @param {Real} bytes The request body's size in bytes.
 * @returns {Bool} `true` when recorded, `false` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_performance_http_metric_set_response_payload_size
 * @desc **Firebase SDK:** [HttpMetric.setResponsePayloadSize(long) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/perf/metrics/HttpMetric#setResponsePayloadSize%28long%29), [FIRHTTPMetric responsePayloadSize (iOS)](https://firebase.google.com/docs/reference/ios/firebaseperformance/api/reference/Classes/FIRHTTPMetric#responsepayloadsize)
 *
 * This function records the size of the reply body received, in bytes. Negative values are
 * recorded as `0`.
 *
 * @param {Real} metric The metric handle from ${function.firebase_performance_http_metric_start}.
 * @param {Real} bytes The reply body's size in bytes.
 * @returns {Bool} `true` when recorded, `false` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_performance_http_metric_set_response_content_type
 * @desc **Firebase SDK:** [HttpMetric.setResponseContentType(java.lang.String) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/perf/metrics/HttpMetric#setResponseContentType%28java.lang.String%29), [FIRHTTPMetric responseContentType (iOS)](https://firebase.google.com/docs/reference/ios/firebaseperformance/api/reference/Classes/FIRHTTPMetric#responsecontenttype)
 *
 * This function records the reply's content type, as in its `Content-Type` header - e.g.
 * `application/json`.
 *
 * @param {Real} metric The metric handle from ${function.firebase_performance_http_metric_start}.
 * @param {String} content_type The reply's content type.
 * @returns {Bool} `true` when recorded, `false` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_performance_http_metric_put_attribute
 * @desc **Firebase SDK:** [HttpMetric.putAttribute(java.lang.String,java.lang.String) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/perf/metrics/HttpMetric#putAttribute%28java.lang.String,java.lang.String%29), [FIRPerformanceAttributable setValue:forAttribute: (iOS)](https://firebase.google.com/docs/reference/ios/firebaseperformance/api/reference/Protocols/FIRPerformanceAttributable#-setvalue:forattribute:)
 *
 * This function sets an attribute on a running HTTP metric, replacing its value when it already
 * exists. An attribute is a name-value pair that the console filters and breaks down
 * by; each trace and metric holds up to five, with names up to 40 characters and values up to 100,
 * neither starting with `firebase_`, `google_` or `ga_`. Both are trimmed of surrounding spaces. The extension reads the attribute back and returns whether the
 * SDK stored it.
 *
 * @param {Real} metric The metric handle from ${function.firebase_performance_http_metric_start}.
 * @param {String} key The attribute's name.
 * @param {String} value The attribute's value.
 * @returns {Bool} `true` when the SDK stored the value, `false` when the handle is not valid or the SDK rejected the attribute.
 * @function_end
 */

/**
 * @function firebase_performance_http_metric_remove_attribute
 * @desc **Firebase SDK:** [HttpMetric.removeAttribute(java.lang.String) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/perf/metrics/HttpMetric#removeAttribute%28java.lang.String%29), [FIRPerformanceAttributable removeAttribute: (iOS)](https://firebase.google.com/docs/reference/ios/firebaseperformance/api/reference/Protocols/FIRPerformanceAttributable#-removeattribute:)
 *
 * This function removes an attribute from a running HTTP metric.
 *
 * @param {Real} metric The metric handle from ${function.firebase_performance_http_metric_start}.
 * @param {String} key The attribute's name.
 * @returns {Bool} `true` when the attribute is gone (or was never set), `false` when the handle is not valid or the SDK kept it.
 * @function_end
 */

/**
 * @function firebase_performance_http_metric_stop
 * @desc **Firebase SDK:** [HttpMetric.stop() (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/perf/metrics/HttpMetric#stop%28%29), [FIRHTTPMetric stop (iOS)](https://firebase.google.com/docs/reference/ios/firebaseperformance/api/reference/Classes/FIRHTTPMetric#-stop)
 *
 * This function stops an HTTP metric and queues it for sending, and frees its handle. Stop it
 * when the reply has arrived, or when the request has failed - a metric that is never stopped is
 * never sent.
 *
 * @param {Real} metric The metric handle from ${function.firebase_performance_http_metric_start}.
 * @returns {Bool} `true` when the metric was stopped, `false` when the handle is not valid or was already stopped.
 * @function_end
 */

/**
 * @const FirebasePerformanceHttpMethod
 * @desc The HTTP method of a request measured with ${function.firebase_performance_http_metric_start}.
 *
 * @member Get `GET`.
 * @member Put `PUT`.
 * @member Post `POST`.
 * @member Delete `DELETE`.
 * @member Head `HEAD`.
 * @member Patch `PATCH`.
 * @member Options `OPTIONS`.
 * @member Trace `TRACE`.
 * @member Connect `CONNECT`.
 * @const_end
 */

/**
 * @module performance
 * @title Performance Monitoring
 * @desc This module covers Firebase Performance Monitoring for Android and iOS: how long things take
 * in the game, measured on players' devices and aggregated in the console. With the extension in
 * the project the SDK measures on its own - the time from launch to the first screen, the time
 * spent in the foreground and background, and slow and frozen frames - and the module adds the
 * game's own measurements: custom code traces around anything with a start and an end, and HTTP
 * metrics around the requests it makes itself. Nothing here has to be called for the automatic
 * measurements.
 *
 * ### Traces and metrics
 *
 * A trace is a named timer with data on it: metrics, integer counts aggregated with the
 * duration, and attributes, strings the console filters by. Start one with
 * ${function.firebase_performance_trace_start}, put what you know on it while it runs, stop it
 * with ${function.firebase_performance_trace_stop}; the handle is only valid in between. An HTTP
 * metric is the same shape for one request - URL and method, then the status code and payload
 * sizes as they become known - started with ${function.firebase_performance_http_metric_start} and
 * stopped with ${function.firebase_performance_http_metric_stop}. Data is sent in the background
 * and reaches the console's Performance dashboard after processing, hours rather than minutes.
 *
 * Handles are the extension's own ids, counted from `1`; `0` is always "failed". Each `put` and
 * `remove` reports whether the SDK took the write, because the SDK checks its limits (five
 * attributes, 32 metrics, name lengths, reserved prefixes) itself and only logs a violation.
 *
 * ### Platforms
 *
 * The module is the `GMFirebasePerformance` extension, built for Android and iOS only; in a
 * Windows, macOS or Linux build every function returns `undefined` at once. On Android the
 * extension adds `firebase-perf` and the Performance Gradle plugin, and the SDK is active from
 * process start; on iOS it adds the `FirebasePerformance` pod, and nothing is measured before
 * ${function.firebase_app_initialize} configures the default app.
 *
 * ### Consent
 *
 * Performance data counts as data collection. A game that asks first ships with the
 * `disableDataCollection` option on (see ${page.extension_options}) and calls
 * ${function.firebase_performance_set_collection_enabled} once the player agrees; the setting
 * persists.
 *
 * ### Console setup
 *
 * Nothing to enable: with the extension in a build, **Performance** under **Run** in the console
 * starts filling once the first sessions have been processed. Custom traces appear under their
 * names, HTTP metrics under their URL patterns.
 *
 * @section_func Collection
 * @desc Turning collection on and off:
 * @ref firebase_performance_set_collection_enabled
 * @ref firebase_performance_is_collection_enabled
 * @section_end
 *
 * @section_func Traces
 * @desc Custom code traces and what goes on them:
 * @ref firebase_performance_trace_start
 * @ref firebase_performance_trace_stop
 * @ref firebase_performance_trace_put_attribute
 * @ref firebase_performance_trace_remove_attribute
 * @ref firebase_performance_trace_put_metric
 * @ref firebase_performance_trace_increment_metric
 * @section_end
 *
 * @section_func HTTP metrics
 * @desc Measuring the game's own requests:
 * @ref firebase_performance_http_metric_start
 * @ref firebase_performance_http_metric_set_response_code
 * @ref firebase_performance_http_metric_set_request_payload_size
 * @ref firebase_performance_http_metric_set_response_payload_size
 * @ref firebase_performance_http_metric_set_response_content_type
 * @ref firebase_performance_http_metric_put_attribute
 * @ref firebase_performance_http_metric_remove_attribute
 * @ref firebase_performance_http_metric_stop
 * @section_end
 *
 * @section_const Constants
 * @desc The following constants are used by this module:
 * @ref FirebasePerformanceHttpMethod
 * @section_end
 *
 * @module_end
 */
