/**
 * @module performance
 * @title Performance Monitoring
 * @desc
 * 
 * ![](assets/overviewPerformanceMonitoring.png)
 * 
 * Firebase Performance Monitoring is a service that helps you to gain insight into the performance characteristics of your Apple, Android, and web apps.
 * You use the Performance Monitoring SDK to collect performance data from your app, then review and analyze that data in the Firebase console. Performance Monitoring helps you to understand in real time where the performance of your app can be improved so that you can use that information to fix performance issues.
 * 
 * @section_func General Functions
 * @desc These functions are provided for general interaction with the extension:
 * @ref FirebasePerformance_isPerformanceCollectionEnabled
 * @ref FirebasePerformance_setPerformanceCollectionEnabled
 * @section_end
 * 
 * @section_func HTTP Metric Functions
 * @desc Metric is used to collect data for network requests/responses. A new object must be used for every request/response.
 * @ref FirebasePerformance_HttpMetric_Attribute_Get
 * @ref FirebasePerformance_HttpMetric_Attribute_GetAll
 * @ref FirebasePerformance_HttpMetric_Attribute_Put
 * @ref FirebasePerformance_HttpMetric_Attribute_Remove
 * @ref FirebasePerformance_HttpMetric_Create
 * @ref FirebasePerformance_HttpMetric_SetHttpResponseCode
 * @ref FirebasePerformance_HttpMetric_SetRequestPayloadSize
 * @ref FirebasePerformance_HttpMetric_SetResponseContentType
 * @ref FirebasePerformance_HttpMetric_SetResponsePayloadSize
 * @ref FirebasePerformance_HttpMetric_Start
 * @ref FirebasePerformance_HttpMetric_Stop
 * @section_end
 * 
 * @section_func Trace Functions
 * @desc Trace allows you to set beginning and end of a certain action in your app. This will allow you to measure performance of tasks.
 * @ref FirebasePerformance_Trace_Attribute_GetAll
 * @ref FirebasePerformance_Trace_Attribute_Put
 * @ref FirebasePerformance_Trace_Attribute_Remove
 * @ref FirebasePerformance_Trace_Create
 * @ref FirebasePerformance_Trace_Metric_GetLong
 * @ref FirebasePerformance_Trace_Metric_Increment
 * @ref FirebasePerformance_Trace_Metric_Put
 * @ref FirebasePerformance_Trace_Start
 * @ref FirebasePerformance_Trace_Stop
 * @section_end
 * 
 * @module_end
 */
