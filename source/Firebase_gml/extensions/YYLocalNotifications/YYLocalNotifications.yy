{
  "resourceType": "GMExtension",
  "resourceVersion": "1.2",
  "name": "YYLocalNotifications",
  "androidactivityinject": "\r\n<intent-filter>\r\n    <action android:name=\"OPEN_NOTIFICATION_ACTIVITY\"></action>\r\n    <category android:name=\"android.intent.category.DEFAULT\"></category>\r\n</intent-filter>\r\n",
  "androidclassname": "LocalNotifications",
  "androidcodeinjection": "\r\n\r\n<YYAndroidManifestActivityInject>\r\n<intent-filter>\r\n    <action android:name=\"OPEN_NOTIFICATION_ACTIVITY\" />\r\n    <category android:name=\"android.intent.category.DEFAULT\" />\r\n</intent-filter>\r\n</YYAndroidManifestActivityInject>\r\n\r\n<YYAndroidManifestApplicationInject>\r\n<receiver android:name=\".LocalNotifications_BroadcastReceiver\" android:exported=\"true\">\r\n<intent-filter>\r\n<action android:name=\".LocalNotifications_BroadcastReceiver\" />\r\n</intent-filter>\r\n</receiver> \r\n\r\n<meta-data\r\n        android:name=\"com.google.firebase.messaging.default_notification_icon\"\r\n        android:resource=\"@drawable/notification_icon\" />\r\n\r\n<meta-data\r\n    android:name=\"com.google.firebase.messaging.default_notification_color\"\r\n    android:resource=\"@color/notification_color\" />\r\n</YYAndroidManifestApplicationInject>\r\n\r\n",
  "androidinject": "\r\n<receiver android:name=\".LocalNotifications_BroadcastReceiver\" android:exported=\"true\">\r\n<intent-filter>\r\n<action android:name=\".LocalNotifications_BroadcastReceiver\"></action>\r\n</intent-filter>\r\n</receiver> \r\n\r\n<meta-data android:name=\"com.google.firebase.messaging.default_notification_icon\" android:resource=\"@drawable/notification_icon\"></meta-data>\r\n\r\n<meta-data android:name=\"com.google.firebase.messaging.default_notification_color\" android:resource=\"@color/notification_color\"></meta-data>\r\n",
  "androidmanifestinject": "",
  "androidPermissions": [
    "com.google.android.c2dm.permission.RECEIVE",
    "android.permission.WAKE_LOCK",
    "android.permission.POST_NOTIFICATIONS",
  ],
  "androidProps": true,
  "androidsourcedir": "",
  "author": "",
  "classname": "LocalNotifications",
  "copyToTargets": 9007199254741004,
  "date": "2021-07-13T15:03:51.430796-07:00",
  "description": "",
  "exportToGame": true,
  "extensionVersion": "1.0.1",
  "files": [
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","constants":[
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"LocalPushNotification_iOS_Permission_Status_Authorized","hidden":false,"value":"\"Authorized\"",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"LocalPushNotification_iOS_Permission_Status_Denied","hidden":false,"value":"\"Denied\"",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"LocalPushNotification_iOS_Permission_Status_NotDetermined","hidden":false,"value":"\"NotDetermined\"",},
      ],"copyToTargets":-1,"filename":"LocalNotifications.ext","final":"","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"LocalPushNotification_Create","argCount":0,"args":[
            1,
            2,
            1,
            1,
            1,
          ],"documentation":"","externalName":"LocalPushNotification_Create","help":"LocalPushNotification_Create(ID,seconds,title,message,data)","hidden":false,"kind":4,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"LocalPushNotification_Cancel","argCount":0,"args":[
            1,
          ],"documentation":"","externalName":"LocalPushNotification_Cancel","help":"LocalPushNotification_Cancel(ID)","hidden":false,"kind":4,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"LocalPushNotification_iOS_Permission_Request","argCount":0,"args":[],"documentation":"","externalName":"LocalPushNotification_iOS_Permission_Request","help":"LocalPushNotification_iOS_Permission_Request()","hidden":false,"kind":4,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"LocalPushNotification_iOS_Permission_Status","argCount":0,"args":[],"documentation":"","externalName":"LocalPushNotification_iOS_Permission_Status","help":"LocalPushNotification_iOS_Permission_Status()","hidden":false,"kind":4,"returnType":1,},
      ],"init":"","kind":4,"order":[],"origname":"","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject": "",
  "hasConvertedCodeInjection": true,
  "helpfile": "",
  "IncludedResources": [],
  "installdir": "",
  "iosCocoaPodDependencies": "",
  "iosCocoaPods": "",
  "ioscodeinjection": "\r\n<YYIosEntitlements>\r\n<key>aps-environment</key>\r\n<string>development</string>\r\n</YYIosEntitlements>\r\n",
  "iosdelegatename": "LocalNotifications_Delegate",
  "iosplistinject": "",
  "iosProps": true,
  "iosSystemFrameworkEntries": [
    {"resourceType":"GMExtensionFrameworkEntry","resourceVersion":"1.0","name":"UserNotifications.framework","embed":0,"weakReference":false,},
  ],
  "iosThirdPartyFrameworkEntries": [],
  "license": "",
  "maccompilerflags": "",
  "maclinkerflags": "",
  "macsourcedir": "",
  "options": [],
  "optionsFile": "options.json",
  "packageId": "",
  "parent": {
    "name": "Extensions",
    "path": "folders/Local Notifications/Extensions.yy",
  },
  "productId": "",
  "sourcedir": "",
  "supportedTargets": -1,
  "tvosclassname": "LocalNotifications",
  "tvosCocoaPodDependencies": "",
  "tvosCocoaPods": "",
  "tvoscodeinjection": "<YYTvosPlist>\r\n\r\n</YYTvosPlist>\r\n\r\n",
  "tvosdelegatename": null,
  "tvosmaccompilerflags": "",
  "tvosmaclinkerflags": "",
  "tvosplistinject": "\r\n\r\n",
  "tvosProps": true,
  "tvosSystemFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
}