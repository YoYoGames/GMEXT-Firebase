{
  "$GMExtension":"",
  "%Name":"YYFirebaseCloudMessaging",
  "androidactivityinject":"",
  "androidclassname":"YYFirebaseCloudMessaging",
  "androidcodeinjection":"\r\n<YYAndroidGradleDependencies>\r\n     implementation 'com.google.firebase:firebase-messaging'\r\n</YYAndroidGradleDependencies>\r\n\r\n<YYAndroidManifestApplicationInject>\r\n\r\n     <service android:name=\".YYFirebaseMessagingService\"  android:exported=\"false\">\r\n         <intent-filter>\r\n             <action android:name=\"com.google.firebase.MESSAGING_EVENT\" />\r\n         </intent-filter>\r\n     </service>\r\n\r\n     <meta-data android:name=\"firebase_messaging_auto_init_enabled\" android:value=\"true\" />\r\n\r\n</YYAndroidManifestApplicationInject>\r\n",
  "androidinject":"\r\n\r\n     <service android:name=\".YYFirebaseMessagingService\" android:exported=\"false\">\r\n         <intent-filter>\r\n             <action android:name=\"com.google.firebase.MESSAGING_EVENT\"></action>\r\n         </intent-filter>\r\n     </service>\r\n\r\n     <meta-data android:name=\"firebase_messaging_auto_init_enabled\" android:value=\"true\"></meta-data>\r\n\r\n",
  "androidmanifestinject":"",
  "androidPermissions":[],
  "androidProps":true,
  "androidsourcedir":"",
  "author":"",
  "classname":"YYFirebaseCloudMessaging",
  "copyToTargets":9007199254741004,
  "description":"",
  "exportToGame":true,
  "extensionVersion":"2.2.0",
  "files":[
    {"$GMExtensionFile":"","%Name":"FirebaseCloudMessaging.ext","constants":[],"copyToTargets":-1,"filename":"FirebaseCloudMessaging.ext","final":"","functions":[
        {"$GMExtensionFunction":"","%Name":"FirebaseCloudMessaging_GetToken","argCount":0,"args":[],"documentation":"","externalName":"FirebaseCloudMessaging_GetToken","help":"FirebaseCloudMessaging_GetToken()","hidden":false,"kind":4,"name":"FirebaseCloudMessaging_GetToken","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebaseCloudMessaging_SubscribeToTopic","argCount":0,"args":[1,],"documentation":"","externalName":"FirebaseCloudMessaging_SubscribeToTopic","help":"FirebaseCloudMessaging_SubscribeToTopic(topic)","hidden":false,"kind":4,"name":"FirebaseCloudMessaging_SubscribeToTopic","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebaseCloudMessaging_UnsubscribeFromTopic","argCount":0,"args":[1,],"documentation":"","externalName":"FirebaseCloudMessaging_UnsubscribeFromTopic","help":"FirebaseCloudMessaging_UnsubscribeFromTopic(topic)","hidden":false,"kind":4,"name":"FirebaseCloudMessaging_UnsubscribeFromTopic","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebaseCloudMessaging_IsAutoInitEnabled","argCount":0,"args":[],"documentation":"","externalName":"FirebaseCloudMessaging_IsAutoInitEnabled","help":"FirebaseCloudMessaging_IsAutoInitEnabled()","hidden":false,"kind":4,"name":"FirebaseCloudMessaging_IsAutoInitEnabled","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"FirebaseCloudMessaging_SetAutoInitEnabled","argCount":0,"args":[2,],"documentation":"","externalName":"FirebaseCloudMessaging_SetAutoInitEnabled","help":"FirebaseCloudMessaging_SetAutoInitEnabled(bool)","hidden":false,"kind":4,"name":"FirebaseCloudMessaging_SetAutoInitEnabled","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebaseCloudMessaging_DeleteToken","argCount":0,"args":[],"documentation":"","externalName":"FirebaseCloudMessaging_DeleteToken","help":"FirebaseCloudMessaging_DeleteToken()","hidden":false,"kind":4,"name":"FirebaseCloudMessaging_DeleteToken","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"FirebaseCloudMessaging_DeliveryMetricsExportToBigQueryEnabled","argCount":0,"args":[],"documentation":"","externalName":"FirebaseCloudMessaging_DeliveryMetricsExportToBigQueryEnabled","help":"FirebaseCloudMessaging_DeliveryMetricsExportToBigQueryEnabled()","hidden":false,"kind":4,"name":"FirebaseCloudMessaging_DeliveryMetricsExportToBigQueryEnabled","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"FirebaseCloudMessaging_SetDeliveryMetricsExportToBigQuery","argCount":0,"args":[2,],"documentation":"","externalName":"FirebaseCloudMessaging_SetDeliveryMetricsExportToBigQuery","help":"FirebaseCloudMessaging_SetDeliveryMetricsExportToBigQuery(bool)","hidden":false,"kind":4,"name":"FirebaseCloudMessaging_SetDeliveryMetricsExportToBigQuery","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
      ],"init":"","kind":4,"name":"FirebaseCloudMessaging.ext","order":[
        {"name":"FirebaseCloudMessaging_GetToken","path":"extensions/YYFirebaseCloudMessaging/YYFirebaseCloudMessaging.yy",},
        {"name":"FirebaseCloudMessaging_SubscribeToTopic","path":"extensions/YYFirebaseCloudMessaging/YYFirebaseCloudMessaging.yy",},
        {"name":"FirebaseCloudMessaging_UnsubscribeFromTopic","path":"extensions/YYFirebaseCloudMessaging/YYFirebaseCloudMessaging.yy",},
        {"name":"FirebaseCloudMessaging_IsAutoInitEnabled","path":"extensions/YYFirebaseCloudMessaging/YYFirebaseCloudMessaging.yy",},
        {"name":"FirebaseCloudMessaging_SetAutoInitEnabled","path":"extensions/YYFirebaseCloudMessaging/YYFirebaseCloudMessaging.yy",},
        {"name":"FirebaseCloudMessaging_DeleteToken","path":"extensions/YYFirebaseCloudMessaging/YYFirebaseCloudMessaging.yy",},
        {"name":"FirebaseCloudMessaging_DeliveryMetricsExportToBigQueryEnabled","path":"extensions/YYFirebaseCloudMessaging/YYFirebaseCloudMessaging.yy",},
        {"name":"FirebaseCloudMessaging_SetDeliveryMetricsExportToBigQuery","path":"extensions/YYFirebaseCloudMessaging/YYFirebaseCloudMessaging.yy",},
      ],"origname":"","ProxyFiles":[],"resourceType":"GMExtensionFile","resourceVersion":"2.0","uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject":"\r\n     implementation 'com.google.firebase:firebase-messaging'\r\n",
  "hasConvertedCodeInjection":true,
  "helpfile":"",
  "HTML5CodeInjection":"",
  "html5Props":false,
  "IncludedResources":[],
  "installdir":"",
  "iosCocoaPodDependencies":"",
  "iosCocoaPods":"\r\n        pod 'FirebaseMessaging'\r\n",
  "ioscodeinjection":"\r\n<YYIosCocoaPods>\r\n        pod 'FirebaseMessaging'\r\n</YYIosCocoaPods>\r\n\r\n",
  "iosdelegatename":"",
  "iosplistinject":"",
  "iosProps":true,
  "iosSystemFrameworkEntries":[],
  "iosThirdPartyFrameworkEntries":[],
  "license":"",
  "maccompilerflags":"-fobjc-arc",
  "maclinkerflags":"-ObjC",
  "macsourcedir":"",
  "name":"YYFirebaseCloudMessaging",
  "options":[],
  "optionsFile":"options.json",
  "packageId":"",
  "parent":{
    "name":"Extensions",
    "path":"folders/Firebase Cloud Messaging/Extensions.yy",
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