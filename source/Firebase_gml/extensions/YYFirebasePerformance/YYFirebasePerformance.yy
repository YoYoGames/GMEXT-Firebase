{
  "$GMExtension":"",
  "%Name":"YYFirebasePerformance",
  "androidactivityinject":"",
  "androidclassname":"YYFirebasePerformance",
  "androidcodeinjection":"\r\n<YYAndroidManifestApplicationInject>\r\n      <meta-data android:name='firebase_performance_collection_enabled' android:value='true' />\r\n</YYAndroidManifestApplicationInject>\r\n\r\n<YYAndroidGradleDependencies>\r\n        implementation 'com.google.firebase:firebase-perf'\r\n</YYAndroidGradleDependencies>\r\n\r\n<YYAndroidTopLevelGradleBuildscriptDependencies>\r\n        classpath 'com.google.firebase:perf-plugin:1.4.2'\r\n</YYAndroidTopLevelGradleBuildscriptDependencies>\r\n\r\n<YYAndroidGradleEnd>\r\n       apply plugin: 'com.google.firebase.firebase-perf'\r\n</YYAndroidGradleEnd>\r\n\r\n\r\n\r\n",
  "androidinject":"\r\n      <meta-data android:name='firebase_performance_collection_enabled' android:value='true'></meta-data>\r\n",
  "androidmanifestinject":"",
  "androidPermissions":[],
  "androidProps":true,
  "androidsourcedir":"",
  "author":"",
  "classname":"YYFirebasePerformance",
  "copyToTargets":44,
  "description":"",
  "exportToGame":true,
  "extensionVersion":"2.0.0",
  "files":[
    {"$GMExtensionFile":"","%Name":"FirebasePerformanceMonitoring.ext","constants":[
        {"$GMExtensionConstant":"","%Name":"FIREBASE_PERFORMANCE_SUCCESS","hidden":false,"name":"FIREBASE_PERFORMANCE_SUCCESS","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"0",},
        {"$GMExtensionConstant":"","%Name":"FIREBASE_PERFORMANCE_ERROR_NOT_FOUND","hidden":false,"name":"FIREBASE_PERFORMANCE_ERROR_NOT_FOUND","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"-1",},
        {"$GMExtensionConstant":"","%Name":"FIREBASE_PERFORMANCE_ERROR_INVALID_NAME","hidden":false,"name":"FIREBASE_PERFORMANCE_ERROR_INVALID_NAME","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"-2",},
        {"$GMExtensionConstant":"","%Name":"FIREBASE_PERFORMANCE_ERROR_CREATION_FAILED","hidden":false,"name":"FIREBASE_PERFORMANCE_ERROR_CREATION_FAILED","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"-3",},
        {"$GMExtensionConstant":"","%Name":"FIREBASE_PERFORMANCE_ERROR_INVALID_PARAMETERS","hidden":false,"name":"FIREBASE_PERFORMANCE_ERROR_INVALID_PARAMETERS","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"-4",},
        {"$GMExtensionConstant":"","%Name":"FIREBASE_PERFORMANCE_ERROR_INVALID_URL","hidden":false,"name":"FIREBASE_PERFORMANCE_ERROR_INVALID_URL","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"-5",},
        {"$GMExtensionConstant":"","%Name":"FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED","hidden":false,"name":"FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"-6",},
      ],"copyToTargets":44,"filename":"FirebasePerformance.ext","final":"","functions":[
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_setPerformanceCollectionEnabled","argCount":0,"args":[2,],"documentation":"/// @desc Enables or disables Firebase Performance Monitoring data collection. No return value.\r\n/// @param {Real} value `1.0` to enable performance collection, `0.0` to disable it.\r\n/// @returns {void}","externalName":"FirebasePerformance_setPerformanceCollectionEnabled","help":"FirebasePerformance_setPerformanceCollectionEnabled(bool)","hidden":false,"kind":4,"name":"FirebasePerformance_setPerformanceCollectionEnabled","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_isPerformanceCollectionEnabled","argCount":0,"args":[],"documentation":"/// @desc Checks whether Firebase Performance Monitoring data collection is enabled. Returns `1.0` if enabled, `0.0` if disabled.\r\n/// @returns {Real}","externalName":"FirebasePerformance_isPerformanceCollectionEnabled","help":"FirebasePerformance_isPerformanceCollectionEnabled()","hidden":false,"kind":4,"name":"FirebasePerformance_isPerformanceCollectionEnabled","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_Trace_Create","argCount":0,"args":[1,],"documentation":"/// @desc Creates a new Firebase Performance Monitoring trace with a given name. Returns `FIREBASE_PERFORMANCE_SUCCESS` if the trace is created successfully, or an error code if the trace creation fails.\r\n/// @param {String} name The name of the trace to be created.\r\n/// @returns {Real}","externalName":"FirebasePerformance_Trace_Create","help":"FirebasePerformance_Trace_Create(name)","hidden":false,"kind":4,"name":"FirebasePerformance_Trace_Create","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_Trace_Start","argCount":0,"args":[1,],"documentation":"/// @desc Starts a Firebase Performance Monitoring trace by its name. Returns `FIREBASE_PERFORMANCE_SUCCESS` if the trace is started successfully, or an error code if the trace is not found.\r\n/// @param {String} name The name of the trace to be started.\r\n/// @returns {Real}","externalName":"FirebasePerformance_Trace_Start","help":"FirebasePerformance_Trace_Start(name)","hidden":false,"kind":4,"name":"FirebasePerformance_Trace_Start","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_Trace_Stop","argCount":0,"args":[1,],"documentation":"/// @desc Stops a Firebase Performance Monitoring trace by its name and removes it from the internal map. Returns `FIREBASE_PERFORMANCE_SUCCESS` if the trace is stopped successfully, or an error code if the trace is not found.\r\n/// @param {String} name The name of the trace to be stopped.\r\n/// @returns {Real}","externalName":"FirebasePerformance_Trace_Stop","help":"FirebasePerformance_Trace_Stop(name)","hidden":false,"kind":4,"name":"FirebasePerformance_Trace_Stop","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_Trace_Attribute_Remove","argCount":0,"args":[1,1,],"documentation":"/// @desc Removes a custom attribute from a given trace. Returns `FIREBASE_PERFORMANCE_SUCCESS` if the attribute is removed successfully, or an error code if the trace is not found.\r\n/// @param {String} name The name of the trace.\r\n/// @param {String} attribute The attribute name to remove.\r\n/// @returns {Real}","externalName":"FirebasePerformance_Trace_Attribute_Remove","help":"FirebasePerformance_Trace_Attribute_Remove(name,attribute)","hidden":false,"kind":4,"name":"FirebasePerformance_Trace_Attribute_Remove","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_Trace_Attribute_Put","argCount":0,"args":[1,1,1,],"documentation":"/// @desc Adds a custom attribute to a given trace. Returns `FIREBASE_PERFORMANCE_SUCCESS` if the attribute is set successfully, or an error code if the trace is not found.\r\n/// @param {String} name The name of the trace.\r\n/// @param {String} attribute The attribute name to set.\r\n/// @param {String} value The value of the attribute.\r\n/// @returns {Real}","externalName":"FirebasePerformance_Trace_Attribute_Put","help":"FirebasePerformance_Trace_Attribute_Put(name,attribute,value)","hidden":false,"kind":4,"name":"FirebasePerformance_Trace_Attribute_Put","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_Trace_Attribute_Get","argCount":0,"args":[1,1,],"documentation":"/// @desc Retrieves the value of a custom attribute for a given trace. Returns the attribute value, or an empty string if the trace or attribute is not found.\r\n/// @param {String} name The name of the trace.\r\n/// @param {String} attribute The attribute name to retrieve.\r\n/// @returns {String}","externalName":"FirebasePerformance_Trace_Attribute_Get","help":"FirebasePerformance_Trace_Attribute_Get(name,attribute)","hidden":false,"kind":4,"name":"FirebasePerformance_Trace_Attribute_Get","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_Trace_Metric_Put","argCount":0,"args":[1,1,2,],"documentation":"/// @desc Sets a custom metric value for a given trace. Returns `FIREBASE_PERFORMANCE_SUCCESS` if the metric is set successfully, or an error code if the trace is not found.\r\n/// @param {String} name The name of the trace.\r\n/// @param {String} metric The name of the metric to set.\r\n/// @param {Real} value The value of the metric.\r\n/// @returns {Real}","externalName":"FirebasePerformance_Trace_Metric_Put","help":"FirebasePerformance_Trace_Metric_Put(name,metric,value)","hidden":false,"kind":4,"name":"FirebasePerformance_Trace_Metric_Put","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_Trace_Metric_Increment","argCount":0,"args":[1,1,2,],"documentation":"/// @desc Increments a custom metric for a given trace. Returns `FIREBASE_PERFORMANCE_SUCCESS` if the metric is incremented successfully, or an error code if the trace is not found.\r\n/// @param {String} name The name of the trace.\r\n/// @param {String} metric The name of the metric to increment.\r\n/// @param {Real} value The value by which to increment the metric.\r\n/// @returns {Real}","externalName":"FirebasePerformance_Trace_Metric_Increment","help":"FirebasePerformance_Trace_Metric_Increment(name,metric,value)","hidden":false,"kind":4,"name":"FirebasePerformance_Trace_Metric_Increment","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_HttpMetric_Create","argCount":0,"args":[1,1,1,],"documentation":"/// @desc Creates a new HTTP Metric for monitoring performance. Returns `FIREBASE_PERFORMANCE_SUCCESS` if created successfully, or an error code if creation fails.\r\n/// @param {String} name The name of the HTTP Metric.\r\n/// @param {String} url The URL to be monitored.\r\n/// @param {String} method The HTTP method (e.g., GET, POST).\r\n/// @returns {Real}","externalName":"FirebasePerformance_HttpMetric_Create","help":"FirebasePerformance_HttpMetric_Create(name,url,method)","hidden":false,"kind":4,"name":"FirebasePerformance_HttpMetric_Create","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_HttpMetric_Start","argCount":0,"args":[1,],"documentation":"/// @desc Starts an HTTP Metric by its name. Returns `FIREBASE_PERFORMANCE_SUCCESS` if started successfully, or an error code if the metric is not found.\r\n/// @param {String} name The name of the HTTP Metric to start.\r\n/// @returns {Real}","externalName":"FirebasePerformance_HttpMetric_Start","help":"FirebasePerformance_HttpMetric_Start(name)","hidden":false,"kind":4,"name":"FirebasePerformance_HttpMetric_Start","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_HttpMetric_Stop","argCount":0,"args":[1,],"documentation":"/// @desc Stops an HTTP Metric by its name and removes it from the internal map. Returns `FIREBASE_PERFORMANCE_SUCCESS` if stopped successfully, or an error code if the metric is not found.\r\n/// @param {String} name The name of the HTTP Metric to stop.\r\n/// @returns {Real}","externalName":"FirebasePerformance_HttpMetric_Stop","help":"FirebasePerformance_HttpMetric_Stop(name)","hidden":false,"kind":4,"name":"FirebasePerformance_HttpMetric_Stop","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_HttpMetric_Attribute_Get","argCount":0,"args":[1,1,],"documentation":"/// @desc Retrieves the value of a custom attribute for an HTTP Metric. Returns the attribute value, or an empty string if the metric or attribute is not found.\r\n/// @param {String} name The name of the HTTP Metric.\r\n/// @param {String} attribute The attribute name to retrieve.\r\n/// @returns {String}","externalName":"FirebasePerformance_HttpMetric_Attribute_Get","help":"FirebasePerformance_HttpMetric_Attribute_Get(name,attribute)","hidden":false,"kind":4,"name":"FirebasePerformance_HttpMetric_Attribute_Get","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_HttpMetric_Attribute_Put","argCount":0,"args":[1,1,2,],"documentation":"/// @desc Adds a custom attribute to an HTTP Metric. Returns `FIREBASE_PERFORMANCE_SUCCESS` if set successfully, or an error code if the metric is not found.\r\n/// @param {String} name The name of the HTTP Metric.\r\n/// @param {String} attribute The attribute name to set.\r\n/// @param {String} value The value of the attribute.\r\n/// @returns {Real}","externalName":"FirebasePerformance_HttpMetric_Attribute_Put","help":"FirebasePerformance_HttpMetric_Attribute_Put(name,attribute,vale)","hidden":false,"kind":4,"name":"FirebasePerformance_HttpMetric_Attribute_Put","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_HttpMetric_Attribute_Remove","argCount":0,"args":[1,1,],"documentation":"/// @desc Removes a custom attribute from an HTTP Metric. Returns `FIREBASE_PERFORMANCE_SUCCESS` if removed successfully, or an error code if the metric is not found.\r\n/// @param {String} name The name of the HTTP Metric.\r\n/// @param {String} attribute The attribute name to remove.\r\n/// @returns {Real}","externalName":"FirebasePerformance_HttpMetric_Attribute_Remove","help":"FirebasePerformance_HttpMetric_Attribute_Remove(name,attribute)","hidden":false,"kind":4,"name":"FirebasePerformance_HttpMetric_Attribute_Remove","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_HttpMetric_SetHttpResponseCode","argCount":0,"args":[1,2,],"documentation":"/// @desc Sets the HTTP response code for a given HTTP Metric. Returns `FIREBASE_PERFORMANCE_SUCCESS` if set successfully, or an error code if the metric is not found.\r\n/// @param {String} name The name of the HTTP Metric.\r\n/// @param {Real} responseCode The HTTP response code.\r\n/// @returns {Real}","externalName":"FirebasePerformance_HttpMetric_SetHttpResponseCode","help":"FirebasePerformance_HttpMetric_SetHttpResponseCode(name,responceCode)","hidden":false,"kind":4,"name":"FirebasePerformance_HttpMetric_SetHttpResponseCode","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_HttpMetric_SetRequestPayloadSize","argCount":0,"args":[1,2,],"documentation":"/// @desc Sets the request payload size for a given HTTP Metric. Returns `FIREBASE_PERFORMANCE_SUCCESS` if set successfully, or an error code if the metric is not found.\r\n/// @param {String} name The name of the HTTP Metric.\r\n/// @param {Real} bytes The request payload size in bytes.\r\n/// @returns {Real}","externalName":"FirebasePerformance_HttpMetric_SetRequestPayloadSize","help":"FirebasePerformance_HttpMetric_SetRequestPayloadSize(name,bytes)","hidden":false,"kind":4,"name":"FirebasePerformance_HttpMetric_SetRequestPayloadSize","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_HttpMetric_SetResponseContentType","argCount":0,"args":[1,1,],"documentation":"/// @desc Sets the response content type for a given HTTP Metric. Returns `FIREBASE_PERFORMANCE_SUCCESS` if set successfully, or an error code if the metric is not found.\r\n/// @param {String} name The name of the HTTP Metric.\r\n/// @param {String} contentType The response content type.\r\n/// @returns {Real}","externalName":"FirebasePerformance_HttpMetric_SetResponseContentType","help":"FirebasePerformance_HttpMetric_SetResponseContentType(name,contentType)","hidden":false,"kind":4,"name":"FirebasePerformance_HttpMetric_SetResponseContentType","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_HttpMetric_SetResponsePayloadSize","argCount":0,"args":[1,2,],"documentation":"/// @desc Sets the response payload size for a given HTTP Metric. Returns `FIREBASE_PERFORMANCE_SUCCESS` if set successfully, or an error code if the metric is not found.\r\n/// @param {String} name The name of the HTTP Metric.\r\n/// @param {Real} bytes The response payload size in bytes.\r\n/// @returns {Real}","externalName":"FirebasePerformance_HttpMetric_SetResponsePayloadSize","help":"FirebasePerformance_HttpMetric_SetResponsePayloadSize(name,bytes)","hidden":false,"kind":4,"name":"FirebasePerformance_HttpMetric_SetResponsePayloadSize","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_Trace_Attribute_GetAll","argCount":0,"args":[1,],"documentation":"/// @desc Retrieves all custom attributes for a given trace in JSON format. Returns a JSON string containing all attributes, or an empty JSON object if the trace is not found.\r\n/// @param {String} name The name of the trace.\r\n/// @returns {String}","externalName":"FirebasePerformance_Trace_Attribute_GetAll","help":"FirebasePerformance_Trace_Attribute_GetAll(name)","hidden":false,"kind":4,"name":"FirebasePerformance_Trace_Attribute_GetAll","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_Trace_Metric_GetLong","argCount":0,"args":[1,1,],"documentation":"/// @desc Retrieves the value of a custom metric for a given trace. Returns the metric value, or `0.0` if the trace is not found.\r\n/// @param {String} name The name of the trace.\r\n/// @param {String} metric The name of the metric to retrieve.\r\n/// @returns {Real}","externalName":"FirebasePerformance_Trace_Metric_GetLong","help":"FirebasePerformance_Trace_Metric_GetLong(name,metric)","hidden":false,"kind":4,"name":"FirebasePerformance_Trace_Metric_GetLong","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"FirebasePerformance_HttpMetric_Attribute_GetAll","argCount":0,"args":[1,],"documentation":"/// @desc Retrieves all custom attributes for an HTTP Metric in JSON format. Returns a JSON string containing all attributes, or an empty JSON object if the metric is not found.\r\n/// @param {String} name The name of the HTTP Metric.\r\n/// @returns {String}","externalName":"FirebasePerformance_HttpMetric_Attribute_GetAll","help":"FirebasePerformance_HttpMetric_Attribute_GetAll(name)","hidden":false,"kind":4,"name":"FirebasePerformance_HttpMetric_Attribute_GetAll","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
      ],"init":"","kind":4,"name":"FirebasePerformanceMonitoring.ext","order":[
        {"name":"FirebasePerformance_setPerformanceCollectionEnabled","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
        {"name":"FirebasePerformance_isPerformanceCollectionEnabled","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
        {"name":"FirebasePerformance_Trace_Create","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
        {"name":"FirebasePerformance_Trace_Start","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
        {"name":"FirebasePerformance_Trace_Stop","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
        {"name":"FirebasePerformance_Trace_Metric_Put","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
        {"name":"FirebasePerformance_Trace_Metric_Increment","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
        {"name":"FirebasePerformance_Trace_Metric_GetLong","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
        {"name":"FirebasePerformance_Trace_Attribute_Put","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
        {"name":"FirebasePerformance_Trace_Attribute_Remove","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
        {"name":"FirebasePerformance_Trace_Attribute_Get","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
        {"name":"FirebasePerformance_Trace_Attribute_GetAll","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
        {"name":"FirebasePerformance_HttpMetric_Create","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
        {"name":"FirebasePerformance_HttpMetric_Start","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
        {"name":"FirebasePerformance_HttpMetric_Stop","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
        {"name":"FirebasePerformance_HttpMetric_SetHttpResponseCode","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
        {"name":"FirebasePerformance_HttpMetric_SetRequestPayloadSize","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
        {"name":"FirebasePerformance_HttpMetric_SetResponseContentType","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
        {"name":"FirebasePerformance_HttpMetric_SetResponsePayloadSize","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
        {"name":"FirebasePerformance_HttpMetric_Attribute_Put","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
        {"name":"FirebasePerformance_HttpMetric_Attribute_Remove","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
        {"name":"FirebasePerformance_HttpMetric_Attribute_Get","path":"extensions/YYFirebasePerformance/YYFirebasePerformance.yy",},
      ],"origname":"","ProxyFiles":[
        {"$GMProxyFile":"","%Name":"FirebasePerformance.js","name":"FirebasePerformance.js","resourceType":"GMProxyFile","resourceVersion":"2.0","TargetMask":5,},
      ],"resourceType":"GMExtensionFile","resourceVersion":"2.0","uncompress":false,"usesRunnerInterface":true,},
  ],
  "gradleinject":"\r\n        implementation 'com.google.firebase:firebase-perf'\r\n",
  "hasConvertedCodeInjection":true,
  "helpfile":"",
  "HTML5CodeInjection":"<GM_HTML5_PostBody>\r\n<script type=\"module\">\r\n    // Import the entire module only after Firebase is initialized\r\n    import * as FirebasePerformanceModule from 'https://www.gstatic.com/firebasejs/10.13.2/firebase-performance.js';\r\n\r\n    try {\r\n        // Initialize or merge module into the global namespace\r\n        window.FirebasePerformanceExt = Object.assign(window.FirebasePerformanceExt || {}, {\r\n            module: FirebasePerformanceModule,\r\n            instance: FirebasePerformanceModule.getPerformance(), // Uses the default Firebase app instance\r\n        });\r\n        console.log(\"Firebase Performance initialized successfully\");\r\n    } catch (error) {\r\n        console.error(\"Failed to initialize Firebase Performance. Ensure Firebase is initialized before loading Analytics.\", error.message);\r\n    }\r\n</script>\r\n</GM_HTML5_PostBody>",
  "html5Props":true,
  "IncludedResources":[],
  "installdir":"",
  "iosCocoaPodDependencies":"",
  "iosCocoaPods":"\r\npod 'FirebasePerformance', '11.3.0'\r\n",
  "ioscodeinjection":"\r\n<YYIosPlist>\r\n      <key>firebase_performance_collection_enabled</key>\r\n      <true/>\r\n</YYIosPlist>\r\n\r\n<YYIosCocoaPods>\r\npod 'FirebasePerformance', '11.3.0'\r\n</YYIosCocoaPods>\r\n\r\n",
  "iosdelegatename":"",
  "iosplistinject":"\r\n      <key>firebase_performance_collection_enabled</key>\r\n      <true></true>\r\n",
  "iosProps":true,
  "iosSystemFrameworkEntries":[],
  "iosThirdPartyFrameworkEntries":[],
  "license":"",
  "maccompilerflags":"-fobjc-arc",
  "maclinkerflags":"-ObjC",
  "macsourcedir":"",
  "name":"YYFirebasePerformance",
  "options":[],
  "optionsFile":"options.json",
  "packageId":"",
  "parent":{
    "name":"Extensions",
    "path":"folders/Firebase/Firebase Performance/Extensions.yy",
  },
  "productId":"",
  "resourceType":"GMExtension",
  "resourceVersion":"2.0",
  "sourcedir":"",
  "supportedTargets":-1,
  "tvosclassname":null,
  "tvosCocoaPodDependencies":"",
  "tvosCocoaPods":"",
  "tvoscodeinjection":"",
  "tvosdelegatename":null,
  "tvosmaccompilerflags":"",
  "tvosmaclinkerflags":"",
  "tvosplistinject":"",
  "tvosProps":false,
  "tvosSystemFrameworkEntries":[],
  "tvosThirdPartyFrameworkEntries":[],
}