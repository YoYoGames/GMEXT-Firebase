{
  "$GMExtension":"",
  "%Name":"YYFirebaseAnalytics",
  "androidactivityinject":"",
  "androidclassname":"YYFirebaseAnalytics",
  "androidcodeinjection":"\r\n\r\n<YYAndroidGradleDependencies>\r\n       implementation 'com.google.firebase:firebase-analytics'\r\n</YYAndroidGradleDependencies>\r\n\r\n<YYAndroidManifestApplicationInject>\r\n       <meta-data android:name=\"firebase_analytics_collection_enabled\" android:value=\"true\" />\r\n       <meta-data android:name=\"google_analytics_adid_collection_enabled\" android:value=\"true\" />\r\n       <meta-data android:name=\"google_analytics_ssaid_collection_enabled\" android:value=\"true\" />\r\n</YYAndroidManifestApplicationInject>\r\n",
  "androidinject":"\r\n       <meta-data android:name=\"firebase_analytics_collection_enabled\" android:value=\"true\"></meta-data>\r\n       <meta-data android:name=\"google_analytics_adid_collection_enabled\" android:value=\"true\"></meta-data>\r\n       <meta-data android:name=\"google_analytics_ssaid_collection_enabled\" android:value=\"true\"></meta-data>\r\n",
  "androidmanifestinject":"",
  "androidPermissions":[],
  "androidProps":true,
  "androidsourcedir":"",
  "author":"",
  "classname":"YYFirebaseAnalytics",
  "copyToTargets":9007199254741036,
  "description":"",
  "exportToGame":true,
  "extensionVersion":"2.3.0",
  "files":[
    {"$GMExtensionFile":"","%Name":"FirebaseAnalytics.ext","constants":[
        {"$GMExtensionConstant":"","%Name":"FIREBASE_ANALYTICS_SUCCESS","hidden":false,"name":"FIREBASE_ANALYTICS_SUCCESS","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"0",},
        {"$GMExtensionConstant":"","%Name":"FIREBASE_ANALYTICS_ERROR_INVALID_PARAMETERS","hidden":false,"name":"FIREBASE_ANALYTICS_ERROR_INVALID_PARAMETERS","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"-1",},
        {"$GMExtensionConstant":"","%Name":"FIREBASE_ANALYTICS_ERROR_NOT_INITIALIZED","hidden":false,"name":"FIREBASE_ANALYTICS_ERROR_NOT_INITIALIZED","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"-2",},
        {"$GMExtensionConstant":"","%Name":"FIREBASE_ANALYTICS_ERROR_UNSUPPORTED","hidden":false,"name":"FIREBASE_ANALYTICS_ERROR_UNSUPPORTED","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"-3",},
      ],"copyToTargets":9007199254741036,"filename":"FirebaseAnalytics.ext","final":"","functions":[
        {"$GMExtensionFunction":"","%Name":"FirebaseAnalytics_LogEvent","argCount":0,"args":[1,1,],"documentation":"/// @desc Logs an event to Firebase Analytics with optional parameters, this is an async operation. The parameters should be passed as a JSON-formatted string.\r\n/// Returns `FIREBASE_ANALYTICS_SUCCESS` if successful, or `FIREBASE_ANALYTICS_ERROR_INVALID_PARAMETERS` if the event name is invalid.\r\n/// @param {string} event The name of the event to log.\r\n/// @param {string} jsonValues A JSON string representing the parameters for the event.\r\n/// @return {real}","externalName":"FirebaseAnalytics_LogEvent","help":"FirebaseAnalytics_LogEvent(event,json)","hidden":false,"kind":4,"name":"FirebaseAnalytics_LogEvent","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"FirebaseAnalytics_SetAnalyticsCollectionEnabled","argCount":0,"args":[2,],"documentation":"/// @desc Enables or disables analytics data collection. A value greater than or equal to `0.5` enables data collection.\r\n/// @param {real} enabled A number representing the boolean state (>= 0.5 for `true`).\r\n","externalName":"FirebaseAnalytics_SetAnalyticsCollectionEnabled","help":"FirebaseAnalytics_SetAnalyticsCollectionEnabled(bool)","hidden":false,"kind":4,"name":"FirebaseAnalytics_SetAnalyticsCollectionEnabled","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"FirebaseAnalytics_ResetAnalyticsData","argCount":0,"args":[],"documentation":"/// @desc Clears all analytics data for the current app instance.\r\n/// @return {real}\r\n","externalName":"FirebaseAnalytics_ResetAnalyticsData","help":"FirebaseAnalytics_ResetAnalyticsData()","hidden":false,"kind":4,"name":"FirebaseAnalytics_ResetAnalyticsData","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"FirebaseAnalytics_SetDefaultEventParameters","argCount":0,"args":[1,],"documentation":"/// @desc Sets the default parameters for all logged events using a JSON-formatted string, this is an async operation. If the input is empty, it clears the default parameters.\r\n/// Returns `FIREBASE_ANALYTICS_SUCCESS` if successful.\r\n/// @param {string} jsonValues A JSON string representing the default event parameters.\r\n/// @return {real}\r\n","externalName":"FirebaseAnalytics_SetDefaultEventParameters","help":"FirebaseAnalytics_SetDefaultEventParameters(json)","hidden":false,"kind":4,"name":"FirebaseAnalytics_SetDefaultEventParameters","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"FirebaseAnalytics_SetSessionTimeoutDuration","argCount":0,"args":[2,],"documentation":"/// @desc Sets the duration of inactivity that causes a session to timeout, in milliseconds.\r\n/// @param {real} time The session timeout duration in milliseconds.\r\n/// @return {real}\r\n","externalName":"FirebaseAnalytics_SetSessionTimeoutDuration","help":"FirebaseAnalytics_SetSessionTimeoutDuration(miliseconds)","hidden":false,"kind":4,"name":"FirebaseAnalytics_SetSessionTimeoutDuration","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"FirebaseAnalytics_SetUserId","argCount":0,"args":[1,],"documentation":"/// @desc Sets the user ID for Firebase Analytics. If the input is null or empty, clears the user ID.\r\n/// @param {string} userID The unique user identifier to associate with the session.\r\n/// @return {real}\r\n","externalName":"FirebaseAnalytics_SetUserId","help":"FirebaseAnalytics_SetUserId(userID)","hidden":false,"kind":4,"name":"FirebaseAnalytics_SetUserId","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"FirebaseAnalytics_SetUserProperty","argCount":0,"args":[1,1,],"documentation":"/// @desc Sets a user property for Firebase Analytics. If the property value is empty, clears the user property.\r\n/// Returns `FIREBASE_ANALYTICS_SUCCESS` if successful, or `FIREBASE_ANALYTICS_ERROR_INVALID_PARAMETERS` if the property name is invalid.\r\n/// @param {string} name The name of the user property.\r\n/// @param {string} value The value of the user property.\r\n/// @return {real}\r\n","externalName":"FirebaseAnalytics_SetUserProperty","help":"FirebaseAnalytics_SetUserProperty(key,value)","hidden":false,"kind":4,"name":"FirebaseAnalytics_SetUserProperty","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"FirebaseAnalytics_SetConsent","argCount":0,"args":[2,2,],"documentation":"/// @desc Sets the user consent state for analytics and ad storage. A value greater than or equal to `0.5` grants consent, while a value below `0.5` denies it.\r\n/// @param {real} adsConsent Consent state for ad storage (>= 0.5 for `GRANTED`).\r\n/// @param {real} analyticsConsent Consent state for analytics storage (>= 0.5 for `GRANTED`).\r\n/// @return {real}\r\n","externalName":"FirebaseAnalytics_SetConsent","help":"FirebaseAnalytics_SetConsent()","hidden":false,"kind":4,"name":"FirebaseAnalytics_SetConsent","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
      ],"init":"","kind":4,"name":"FirebaseAnalytics.ext","order":[
        {"name":"FirebaseAnalytics_SetAnalyticsCollectionEnabled","path":"extensions/YYFirebaseAnalytics/YYFirebaseAnalytics.yy",},
        {"name":"FirebaseAnalytics_LogEvent","path":"extensions/YYFirebaseAnalytics/YYFirebaseAnalytics.yy",},
        {"name":"FirebaseAnalytics_ResetAnalyticsData","path":"extensions/YYFirebaseAnalytics/YYFirebaseAnalytics.yy",},
        {"name":"FirebaseAnalytics_SetDefaultEventParameters","path":"extensions/YYFirebaseAnalytics/YYFirebaseAnalytics.yy",},
        {"name":"FirebaseAnalytics_SetSessionTimeoutDuration","path":"extensions/YYFirebaseAnalytics/YYFirebaseAnalytics.yy",},
        {"name":"FirebaseAnalytics_SetUserId","path":"extensions/YYFirebaseAnalytics/YYFirebaseAnalytics.yy",},
        {"name":"FirebaseAnalytics_SetUserProperty","path":"extensions/YYFirebaseAnalytics/YYFirebaseAnalytics.yy",},
        {"name":"FirebaseAnalytics_SetConsent","path":"extensions/YYFirebaseAnalytics/YYFirebaseAnalytics.yy",},
      ],"origname":"","ProxyFiles":[
        {"$GMProxyFile":"","%Name":"FirebaseAnalytics.js","name":"FirebaseAnalytics.js","resourceType":"GMProxyFile","resourceVersion":"2.0","TargetMask":5,},
      ],"resourceType":"GMExtensionFile","resourceVersion":"2.0","uncompress":false,"usesRunnerInterface":true,},
  ],
  "gradleinject":"\r\n       implementation 'com.google.firebase:firebase-analytics'\r\n",
  "hasConvertedCodeInjection":true,
  "helpfile":"",
  "HTML5CodeInjection":"<GM_HTML5_PostBody>\r\n<script type=\"module\">\r\n    // Import the entire module only after Firebase is initialized\r\n    import * as FirebaseAnalyticsModule from 'https://www.gstatic.com/firebasejs/10.13.2/firebase-analytics.js';\r\n\r\n    try {\r\n        // Initialize or merge module into the global namespace\r\n        window.FirebaseAnalyticsExt = Object.assign(window.FirebaseAnalyticsExt || {}, {\r\n            analyticsModule: FirebaseAnalyticsModule,\r\n            analyticsInstance: FirebaseAnalyticsModule.getAnalytics(), // Uses the default Firebase app instance\r\n        });\r\n        console.log(\"Firebase Analytics initialized successfully\");\r\n    } catch (error) {\r\n        console.error(\"Failed to initialize Firebase Analytics. Ensure Firebase is initialized before loading Analytics.\", error.message);\r\n    }\r\n</script>\r\n</GM_HTML5_PostBody>",
  "html5Props":true,
  "IncludedResources":[],
  "installdir":"",
  "iosCocoaPodDependencies":"",
  "iosCocoaPods":"\r\n     pod 'FirebaseAnalytics', '11.3.0'\r\n",
  "ioscodeinjection":"\r\n<YYIosCocoaPods>\r\n     pod 'FirebaseAnalytics', '11.3.0'\r\n</YYIosCocoaPods>\r\n\r\n<YYIosPlist>\r\n     <key>FIREBASE_ANALYTICS_COLLECTION_ENABLED</key>\r\n     <true/>\r\n     \r\n     <key>GOOGLE_ANALYTICS_IDFV_COLLECTION_ENABLED </key>\r\n     <true/>\r\n</YYIosPlist>\r\n\r\n",
  "iosdelegatename":"",
  "iosplistinject":"\r\n     <key>FIREBASE_ANALYTICS_COLLECTION_ENABLED</key>\r\n     <true></true>\r\n     \r\n     <key>GOOGLE_ANALYTICS_IDFV_COLLECTION_ENABLED </key>\r\n     <true></true>\r\n",
  "iosProps":true,
  "iosSystemFrameworkEntries":[],
  "iosThirdPartyFrameworkEntries":[],
  "license":"",
  "maccompilerflags":"-fobjc-arc",
  "maclinkerflags":"-ObjC",
  "macsourcedir":"",
  "name":"YYFirebaseAnalytics",
  "options":[],
  "optionsFile":"options.json",
  "packageId":"",
  "parent":{
    "name":"Extensions",
    "path":"folders/Firebase Analytics/Extensions.yy",
  },
  "productId":"",
  "resourceType":"GMExtension",
  "resourceVersion":"2.0",
  "sourcedir":"",
  "supportedTargets":-1,
  "tvosclassname":null,
  "tvosCocoaPodDependencies":"",
  "tvosCocoaPods":"",
  "tvoscodeinjection":"<YYTvosPlist>\r\n\r\n</YYTvosPlist>\r\n\r\n",
  "tvosdelegatename":null,
  "tvosmaccompilerflags":"",
  "tvosmaclinkerflags":"",
  "tvosplistinject":"\r\n\r\n",
  "tvosProps":false,
  "tvosSystemFrameworkEntries":[],
  "tvosThirdPartyFrameworkEntries":[],
}