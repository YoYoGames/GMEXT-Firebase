{
  "$GMExtension":"",
  "%Name":"YYFirebaseCrashlytics",
  "androidactivityinject":"",
  "androidclassname":"YYFirebaseCrashlytics",
  "androidcodeinjection":"\r\n\r\n<YYAndroidManifestApplicationInject>\r\n\r\n<toExpand condition='${YYEXTOPT_YYFirebaseCrashlytics_disableDataCollection}'>\r\n      <meta-data android:name=\"firebase_crashlytics_collection_enabled\" android:value=\"false\" />\r\n</toExpand>\r\n\r\n</YYAndroidManifestApplicationInject>\r\n\r\n<YYAndroidGradleDependencies>\r\n      implementation 'com.google.firebase:firebase-crashlytics'\r\n</YYAndroidGradleDependencies>\r\n\r\n<YYAndroidTopLevelGradleBuildscriptDependencies>\r\n        classpath 'com.google.firebase:firebase-crashlytics-gradle:2.4.1'\r\n</YYAndroidTopLevelGradleBuildscriptDependencies>\r\n\r\n<YYAndroidTopLevelGradleBuildscriptRepositories>\r\n\t\tmaven {\r\n           url 'https://maven.fabric.io/public'\r\n        }\r\n</YYAndroidTopLevelGradleBuildscriptRepositories>\r\n\r\n<YYAndroidGradleEnd>\r\n       apply plugin: 'com.google.firebase.crashlytics'\r\n</YYAndroidGradleEnd>\r\n",
  "androidinject":"\r\n\r\n<toExpand condition='${YYEXTOPT_YYFirebaseCrashlytics_disableDataCollection}'>\r\n      <meta-data android:name=\"firebase_crashlytics_collection_enabled\" android:value=\"false\"></meta-data>\r\n</toExpand>\r\n\r\n",
  "androidmanifestinject":"",
  "androidPermissions":[],
  "androidProps":true,
  "androidsourcedir":"",
  "author":"",
  "classname":"YYFirebaseCrashlytics",
  "copyToTargets":9007199254741068,
  "description":"",
  "exportToGame":true,
  "extensionVersion":"3.0.0",
  "files":[
    {"$GMExtensionFile":"","%Name":"FirebaseCrashlytics.ext","constants":[
        {"$GMExtensionConstant":"","%Name":"FIREBASE_CRASHLYTICS_SUCCESS","hidden":false,"name":"FIREBASE_CRASHLYTICS_SUCCESS","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"0",},
        {"$GMExtensionConstant":"","%Name":"FIREBASE_CRASHLYTICS_ERROR_INVALID_PARAMETERS","hidden":false,"name":"FIREBASE_CRASHLYTICS_ERROR_INVALID_PARAMETERS","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"-1",},
      ],"copyToTargets":-1,"filename":"FirebaseCrashlytics.ext","final":"","functions":[
        {"$GMExtensionFunction":"","%Name":"FirebaseCrashlytics_Log","argCount":0,"args":[1,],"documentation":"/// @desc Logs a custom message to Crashlytics. Returns `FIREBASE_CRASHLYTICS_SUCCESS` if successful.\r\n/// @param {string} message The message to log.\r\n/// @return {real}","externalName":"FirebaseCrashlytics_Log","help":"FirebaseCrashlytics_Log(string)","hidden":false,"kind":4,"name":"FirebaseCrashlytics_Log","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"FirebaseCrashlytics_SetCustomKey","argCount":0,"args":[1,1,],"documentation":"/// @desc Sets a custom key-value pair for Crashlytics. Returns `FIREBASE_CRASHLYTICS_SUCCESS` if successful.\r\n/// @param {string} key The name of the custom key.\r\n/// @param {string} value The value to associate with the custom key.\r\n/// @return {real}","externalName":"FirebaseCrashlytics_SetCustomKey","help":"FirebaseCrashlytics_SetCustomKey(key,value)","hidden":false,"kind":4,"name":"FirebaseCrashlytics_SetCustomKey","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"FirebaseCrashlytics_SetUserIdentifier","argCount":0,"args":[1,],"documentation":"/// @desc Sets the user identifier for Crashlytics. Returns `FIREBASE_CRASHLYTICS_SUCCESS` if successful.\r\n/// @param {string} userId The unique user identifier to set.\r\n/// @return {real}","externalName":"FirebaseCrashlytics_SetUserIdentifier","help":"FirebaseCrashlytics_SetUserIdentifier(user)","hidden":false,"kind":4,"name":"FirebaseCrashlytics_SetUserIdentifier","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"FirebaseCrashlytics_Crash","argCount":0,"args":[1,],"documentation":"/// @desc Triggers a crash with a given message, intended for testing purposes. Does not return a value.\r\n/// @param {string} message The message to include in the thrown exception.","externalName":"FirebaseCrashlytics_Crash","help":"FirebaseCrashlytics_Crash(str)","hidden":false,"kind":4,"name":"FirebaseCrashlytics_Crash","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebaseCrashlytics_RecordException","argCount":0,"args":[1,],"documentation":"/// @desc Records a non-fatal exception with a custom message in Crashlytics. Returns `FIREBASE_CRASHLYTICS_SUCCESS` if successful.\r\n/// @param {string} message The message to include in the exception.\r\n/// @return {real}","externalName":"FirebaseCrashlytics_RecordException","help":"FirebaseCrashlytics_RecordException(log)","hidden":false,"kind":4,"name":"FirebaseCrashlytics_RecordException","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set","argCount":0,"args":[2,],"documentation":"/// @desc Enables or disables Crashlytics data collection. Returns `FIREBASE_CRASHLYTICS_SUCCESS` if successful.\r\n/// @param {real} bool A number representing the boolean state (>= 0.5 for `true`).\r\n/// @return {real}","externalName":"FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set","help":"FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set(bool)","hidden":false,"kind":4,"name":"FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check","argCount":0,"args":[],"documentation":"/// @desc Checks if Crashlytics data collection is enabled. Returns `true` if enabled, `false` if disabled.\r\n/// @return {boolean}","externalName":"FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check","help":"FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check()","hidden":false,"kind":4,"name":"FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"FirebaseCrashlytics_DidCrashOnPreviousExecution","argCount":0,"args":[],"documentation":"/// @desc Checks if the app crashed on its previous execution. Returns `true` if a crash occurred on the previous run, `false` otherwise.\r\n/// @return {boolean}","externalName":"FirebaseCrashlytics_DidCrashOnPreviousExecution","help":"FirebaseCrashlytics_DidCrashOnPreviousExecution()","hidden":false,"kind":4,"name":"FirebaseCrashlytics_DidCrashOnPreviousExecution","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"FirebaseCrashlytics_UnsentReports_Delete","argCount":0,"args":[],"documentation":"/// @desc Deletes all unsent Crashlytics reports. Returns `FIREBASE_CRASHLYTICS_SUCCESS` if successful.\r\n/// @return {real}","externalName":"FirebaseCrashlytics_UnsentReports_Delete","help":"FirebaseCrashlytics_UnsentReports_Delete()","hidden":false,"kind":4,"name":"FirebaseCrashlytics_UnsentReports_Delete","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"FirebaseCrashlytics_UnsentReports_Send","argCount":0,"args":[],"documentation":"/// @desc Sends all unsent Crashlytics reports. Returns `FIREBASE_CRASHLYTICS_SUCCESS` if successful.\r\n/// @return {real}","externalName":"FirebaseCrashlytics_UnsentReports_Send","help":"FirebaseCrashlytics_UnsentReports_Send()","hidden":false,"kind":4,"name":"FirebaseCrashlytics_UnsentReports_Send","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"FirebaseCrashlytics_UnsentReports_Check","argCount":0,"args":[],"documentation":"/// @desc Checks if there are any unsent Crashlytics reports, this is an async operation. Returns `FIREBASE_CRASHLYTICS_SUCCESS` if successful.\r\n/// @return {real}","externalName":"FirebaseCrashlytics_UnsentReports_Check","help":"FirebaseCrashlytics_UnsentReports_Check()","hidden":false,"kind":4,"name":"FirebaseCrashlytics_UnsentReports_Check","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"FirebaseCrashlytics_SetCustomKeys","argCount":0,"args":[1,],"documentation":"/// @desc Sets multiple custom keys and values for Crashlytics using a JSON string, this is an async operation. Returns `FIREBASE_CRASHLYTICS_SUCCESS` if successful, or `FIREBASE_CRASHLYTICS_ERROR_INVALID_PARAMETERS` if the JSON string is invalid.\r\n/// @param {string} jsonString A JSON string containing key-value pairs to set.\r\n/// @return {real}","externalName":"FirebaseCrashlytics_SetCustomKeys","help":"FirebaseCrashlytics_SetCustomKeys","hidden":false,"kind":4,"name":"FirebaseCrashlytics_SetCustomKeys","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
      ],"init":"","kind":4,"name":"FirebaseCrashlytics.ext","order":[],"origname":"","ProxyFiles":[],"resourceType":"GMExtensionFile","resourceVersion":"2.0","uncompress":false,"usesRunnerInterface":true,},
  ],
  "gradleinject":"\r\n      implementation 'com.google.firebase:firebase-crashlytics'\r\n",
  "hasConvertedCodeInjection":true,
  "helpfile":"",
  "HTML5CodeInjection":"",
  "html5Props":false,
  "IncludedResources":[],
  "installdir":"",
  "iosCocoaPodDependencies":"",
  "iosCocoaPods":"\r\n       pod 'FirebaseCrashlytics', '11.3.0'\r\n",
  "ioscodeinjection":"\r\n<YYIosPlist>\r\n\r\n<toExpand condition='${YYEXTOPT_YYFirebaseCrashlytics_disableDataCollection}'>\r\n      <key>FirebaseCrashlyticsCollectionEnabled</key>\r\n      <false/>\r\n</toExpand>\r\n\r\n</YYIosPlist>\r\n\r\n<YYIosCocoaPods>\r\n       pod 'FirebaseCrashlytics', '11.3.0'\r\n</YYIosCocoaPods>\r\n\r\n<YYIosScriptPhase>\r\n      \"${PODS_ROOT}/FirebaseCrashlytics/run\"\r\n      ${PODS_ROOT}/FirebaseCrashlytics/upload-symbols -gsp ${PROJECT_DIR}/GoogleService-Info.plist -p ios ${DWARF_DSYM_FOLDER_PATH}/${DWARF_DSYM_FILE_NAME}\r\n</YYIosScriptPhase>\r\n",
  "iosdelegatename":"",
  "iosplistinject":"\r\n\r\n<toExpand condition='${YYEXTOPT_YYFirebaseCrashlytics_disableDataCollection}'>\r\n      <key>FirebaseCrashlyticsCollectionEnabled</key>\r\n      <false></false>\r\n</toExpand>\r\n\r\n",
  "iosProps":true,
  "iosSystemFrameworkEntries":[],
  "iosThirdPartyFrameworkEntries":[],
  "license":"",
  "maccompilerflags":"-fobjc-arc",
  "maclinkerflags":"-ObjC",
  "macsourcedir":"",
  "name":"YYFirebaseCrashlytics",
  "options":[
    {"$GMExtensionOption":"","%Name":"disableDataCollection","defaultValue":"False","description":"By default, Crashlytics automatically collects crash reports for all your app's users. \r\nTo give users more control over the data they send, you can enable opt-in reporting by disabling automatic reporting and only sending data to Crashlytics when you choose to in your code.","displayName":"Disable Data Collection","exportToINI":false,"extensionId":null,"guid":"05461242-be59-4ad1-92b4-4e041d39acbe","hidden":false,"listItems":[],"name":"disableDataCollection","optType":0,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
  ],
  "optionsFile":"options.json",
  "packageId":"",
  "parent":{
    "name":"Extensions",
    "path":"folders/Firebase/Firebase Crashlytics/Extensions.yy",
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