{
  "$GMExtension":"",
  "%Name":"FacebookExtension2",
  "androidactivityinject":"",
  "androidclassname":"FacebookExtension2",
  "androidcodeinjection":"<YYAndroidGradleDependencies>\r\n    implementation 'com.facebook.android:facebook-android-sdk:latest.release'\r\n</YYAndroidGradleDependencies>\r\n\r\n<YYAndroidStringValuesInjection>\r\n    <string name=\"facebook_app_id\">${YYEXTOPT_FacebookExtension2_AppId}</string> \r\n    <string name=\"fb_login_protocol_scheme\">fb${YYEXTOPT_FacebookExtension2_AppId}</string>\r\n    <string name=\"facebook_client_token\">${YYEXTOPT_FacebookExtension2_ClientToken}</string>\r\n</YYAndroidStringValuesInjection>\r\n\r\n<YYAndroidManifestApplicationInject>\r\n\r\n    <activity android:name=\"com.facebook.FacebookActivity\"\r\n        android:configChanges=\r\n                \"keyboard|keyboardHidden|screenLayout|screenSize|orientation\"\r\n        android:label=\"@string/app_name\" />\r\n    <activity\r\n        android:name=\"com.facebook.CustomTabActivity\"\r\n        android:exported=\"true\">\r\n        <intent-filter>\r\n            <action android:name=\"android.intent.action.VIEW\" />\r\n            <category android:name=\"android.intent.category.DEFAULT\" />\r\n            <category android:name=\"android.intent.category.BROWSABLE\" />\r\n            <data android:scheme=\"@string/fb_login_protocol_scheme\" />\r\n        </intent-filter>\r\n    </activity>\r\n</YYAndroidManifestApplicationInject>\r\n",
  "androidinject":"\r\n\r\n    <activity android:name=\"com.facebook.FacebookActivity\" android:configChanges=\"keyboard|keyboardHidden|screenLayout|screenSize|orientation\" android:label=\"@string/app_name\"></activity>\r\n    <activity android:name=\"com.facebook.CustomTabActivity\" android:exported=\"true\">\r\n        <intent-filter>\r\n            <action android:name=\"android.intent.action.VIEW\"></action>\r\n            <category android:name=\"android.intent.category.DEFAULT\"></category>\r\n            <category android:name=\"android.intent.category.BROWSABLE\"></category>\r\n            <data android:scheme=\"@string/fb_login_protocol_scheme\"></data>\r\n        </intent-filter>\r\n    </activity>\r\n",
  "androidmanifestinject":"",
  "androidPermissions":[],
  "androidProps":true,
  "androidsourcedir":"",
  "author":"",
  "classname":"FacebookExtension2",
  "copyToTargets":0,
  "description":"",
  "exportToGame":true,
  "extensionVersion":"2.1.0",
  "files":[
    {"$GMExtensionFile":"","%Name":"","constants":[
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_EVENT_ACHIEVED_LEVEL","hidden":false,"name":"FacebookExtension2_EVENT_ACHIEVED_LEVEL","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"101",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_EVENT_ADDED_PAYMENT_INFO","hidden":false,"name":"FacebookExtension2_EVENT_ADDED_PAYMENT_INFO","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"102",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_EVENT_ADDED_TO_CART","hidden":false,"name":"FacebookExtension2_EVENT_ADDED_TO_CART","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"103",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_EVENT_ADDED_TO_WISHLIST","hidden":false,"name":"FacebookExtension2_EVENT_ADDED_TO_WISHLIST","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"104",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_EVENT_COMPLETED_REGISTRATION","hidden":false,"name":"FacebookExtension2_EVENT_COMPLETED_REGISTRATION","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"105",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_EVENT_COMPLETED_TUTORIAL","hidden":false,"name":"FacebookExtension2_EVENT_COMPLETED_TUTORIAL","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"106",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_EVENT_INITIATED_CHECKOUT","hidden":false,"name":"FacebookExtension2_EVENT_INITIATED_CHECKOUT","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"107",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_EVENT_RATED","hidden":false,"name":"FacebookExtension2_EVENT_RATED","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"109",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_EVENT_SEARCHED","hidden":false,"name":"FacebookExtension2_EVENT_SEARCHED","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"110",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_EVENT_SPENT_CREDITS","hidden":false,"name":"FacebookExtension2_EVENT_SPENT_CREDITS","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"111",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_EVENT_UNLOCKED_ACHIEVEMENT","hidden":false,"name":"FacebookExtension2_EVENT_UNLOCKED_ACHIEVEMENT","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"112",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_EVENT_VIEWED_CONTENT","hidden":false,"name":"FacebookExtension2_EVENT_VIEWED_CONTENT","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"113",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_PARAM_CONTENT_ID","hidden":false,"name":"FacebookExtension2_PARAM_CONTENT_ID","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"1003",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_PARAM_CONTENT_TYPE","hidden":false,"name":"FacebookExtension2_PARAM_CONTENT_TYPE","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"1004",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_PARAM_CURRENCY","hidden":false,"name":"FacebookExtension2_PARAM_CURRENCY","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"1005",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_PARAM_DESCRIPTION","hidden":false,"name":"FacebookExtension2_PARAM_DESCRIPTION","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"1006",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_PARAM_LEVEL","hidden":false,"name":"FacebookExtension2_PARAM_LEVEL","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"1007",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_PARAM_MAX_RATING_VALUE","hidden":false,"name":"FacebookExtension2_PARAM_MAX_RATING_VALUE","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"1008",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_PARAM_NUM_ITEMS","hidden":false,"name":"FacebookExtension2_PARAM_NUM_ITEMS","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"1009",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_PARAM_PAYMENT_INFO_AVAILABLE","hidden":false,"name":"FacebookExtension2_PARAM_PAYMENT_INFO_AVAILABLE","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"1010",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_PARAM_REGISTRATION_METHOD","hidden":false,"name":"FacebookExtension2_PARAM_REGISTRATION_METHOD","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"1011",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_PARAM_SEARCH_STRING","hidden":false,"name":"FacebookExtension2_PARAM_SEARCH_STRING","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"1012",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_PARAM_SUCCESS","hidden":false,"name":"FacebookExtension2_PARAM_SUCCESS","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"1013",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_LOGIN_TYPE_NATIVE","hidden":false,"name":"FacebookExtension2_LOGIN_TYPE_NATIVE","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"10001",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_LOGIN_TYPE_BROWSER","hidden":false,"name":"FacebookExtension2_LOGIN_TYPE_BROWSER","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"10002",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_LOGIN_TYPE_SYSTEM_ACCOUNT","hidden":false,"name":"FacebookExtension2_LOGIN_TYPE_SYSTEM_ACCOUNT","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"10003",},
        {"$GMExtensionConstant":"","%Name":"FacebookExtension2_LOGIN_TYPE_WEB_VIEW","hidden":false,"name":"FacebookExtension2_LOGIN_TYPE_WEB_VIEW","resourceType":"GMExtensionConstant","resourceVersion":"2.0","value":"10004",},
      ],"copyToTargets":3026418953887940846,"filename":"FacebookExt2.ext","final":"","functions":[
        {"$GMExtensionFunction":"","%Name":"fb_login","argCount":0,"args":[2,2,],"documentation":"","externalName":"fb_login","help":"fb_login(permissions_list, login_type)","hidden":false,"kind":4,"name":"fb_login","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"fb_logout","argCount":0,"args":[],"documentation":"","externalName":"fb_logout","help":"fb_logout()","hidden":false,"kind":4,"name":"fb_logout","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"fb_status","argCount":0,"args":[],"documentation":"","externalName":"fb_status","help":"fb_status()","hidden":false,"kind":4,"name":"fb_status","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"fb_graph_request","argCount":0,"args":[1,1,2,],"documentation":"","externalName":"fb_graph_request","help":"fb_graph_request( graph_path, httpMethod, ds_map_params )","hidden":false,"kind":4,"name":"fb_graph_request","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"fb_dialog","argCount":0,"args":[1,],"documentation":"","externalName":"fb_dialog","help":"fb_dialog(link_url)","hidden":false,"kind":4,"name":"fb_dialog","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"fb_request_read_permissions","argCount":0,"args":[2,],"documentation":"","externalName":"fb_request_read_permissions","help":"fb_request_read_permissions( permissions_list )","hidden":false,"kind":4,"name":"fb_request_read_permissions","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"fb_check_permission","argCount":0,"args":[1,],"documentation":"","externalName":"fb_check_permission","help":"fb_check_permission( permission )","hidden":false,"kind":4,"name":"fb_check_permission","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"fb_accesstoken","argCount":0,"args":[],"documentation":"","externalName":"fb_accesstoken","help":"fb_accesstoken()","hidden":false,"kind":4,"name":"fb_accesstoken","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"fb_request_publish_permissions","argCount":0,"args":[2,],"documentation":"","externalName":"fb_request_publish_permissions","help":"fb_request_publish_permissions( permissions_list )","hidden":false,"kind":4,"name":"fb_request_publish_permissions","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"fb_user_id","argCount":0,"args":[],"documentation":"","externalName":"fb_user_id","help":"fb_user_id()","hidden":false,"kind":4,"name":"fb_user_id","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"fb_ready","argCount":0,"args":[],"documentation":"","externalName":"fb_ready","help":"fb_ready()","hidden":false,"kind":4,"name":"fb_ready","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"fb_init","argCount":0,"args":[],"documentation":"","externalName":"fb_init","help":"","hidden":false,"kind":4,"name":"fb_init","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"fb_refresh_accesstoken","argCount":0,"args":[],"documentation":"","externalName":"fb_refresh_accesstoken","help":"fb_refresh_accesstoken()","hidden":false,"kind":4,"name":"fb_refresh_accesstoken","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"fb_send_event","argCount":0,"args":[2,2,2,],"documentation":"","externalName":"fb_send_event","help":"fb_send_event( event_id, event_value_float, event_value_object )","hidden":false,"kind":4,"name":"fb_send_event","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
      ],"init":"","kind":4,"name":"","order":[
        {"name":"fb_accesstoken","path":"extensions/FacebookExtension2/FacebookExtension2.yy",},
        {"name":"fb_check_permission","path":"extensions/FacebookExtension2/FacebookExtension2.yy",},
        {"name":"fb_dialog","path":"extensions/FacebookExtension2/FacebookExtension2.yy",},
        {"name":"fb_graph_request","path":"extensions/FacebookExtension2/FacebookExtension2.yy",},
        {"name":"fb_ready","path":"extensions/FacebookExtension2/FacebookExtension2.yy",},
        {"name":"fb_login","path":"extensions/FacebookExtension2/FacebookExtension2.yy",},
        {"name":"fb_logout","path":"extensions/FacebookExtension2/FacebookExtension2.yy",},
        {"name":"fb_request_publish_permissions","path":"extensions/FacebookExtension2/FacebookExtension2.yy",},
        {"name":"fb_request_read_permissions","path":"extensions/FacebookExtension2/FacebookExtension2.yy",},
        {"name":"fb_status","path":"extensions/FacebookExtension2/FacebookExtension2.yy",},
        {"name":"fb_user_id","path":"extensions/FacebookExtension2/FacebookExtension2.yy",},
        {"name":"fb_init","path":"extensions/FacebookExtension2/FacebookExtension2.yy",},
        {"name":"fb_refresh_accesstoken","path":"extensions/FacebookExtension2/FacebookExtension2.yy",},
        {"name":"fb_send_event","path":"extensions/FacebookExtension2/FacebookExtension2.yy",},
      ],"origname":"extensions\\FacebookExt2.ext","ProxyFiles":[
        {"$GMProxyFile":"","%Name":"FacebookExtJS.js","name":"FacebookExtJS.js","resourceType":"GMProxyFile","resourceVersion":"2.0","TargetMask":5,},
      ],"resourceType":"GMExtensionFile","resourceVersion":"2.0","uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject":"\r\n    implementation 'com.facebook.android:facebook-android-sdk:latest.release'\r\n",
  "hasConvertedCodeInjection":true,
  "helpfile":"",
  "HTML5CodeInjection":"",
  "html5Props":true,
  "IncludedResources":[],
  "installdir":"",
  "iosCocoaPodDependencies":"",
  "iosCocoaPods":"\r\npod 'FBSDKCoreKit', '~> 17.3.0'\r\npod 'FBSDKShareKit', '~> 17.3.0'\r\npod 'FBSDKLoginKit', '~> 17.3.0'\r\n",
  "ioscodeinjection":"\n<YYIosBridgeHeader>\r\n#import \"FacebookExtension2.h\"\n</YYIosBridgeHeader>\n\n<YYIosPlist>\r\n\n<key>CFBundleURLTypes</key>\n<array>\n  <dict>\n  <key>CFBundleURLSchemes</key>\n  <array>\n    <string>fb${YYEXTOPT_FacebookExtension2_AppId}</string>\n  </array>\n  </dict>\n</array>\n\n     <key>FacebookAppID</key>\r\n     <string>${YYEXTOPT_FacebookExtension2_AppId}</string>\r\n     <key>FacebookClientToken</key>\r\n     <string>${YYEXTOPT_FacebookExtension2_ClientToken}</string>\r\n     <key>FacebookDisplayName</key>\r\n     <string>${YYEXTOPT_FacebookExtension2_DisplayName}</string>\r\n\r\n\r\n    <key>LSApplicationQueriesSchemes</key>\r\n    <array>\r\n      <string>fbapi</string>\r\n      <string>fb-messenger-share-api</string>\r\n    </array>\r\n\r\n</YYIosPlist>\r\n\r\n<YYIosCFBundleURLSchemesArray>\r\n     <string>fb${YYEXTOPT_FacebookExtension2_AppId}</string>\r\n</YYIosCFBundleURLSchemesArray>\r\n\r\n<YYIosCocoaPods>\r\npod 'FBSDKCoreKit', '~> 17.3.0'\r\npod 'FBSDKShareKit', '~> 17.3.0'\r\npod 'FBSDKLoginKit', '~> 17.3.0'\r\n</YYIosCocoaPods>\r\n\r\n<YYIosBuildSettingsInjection>\r\nCLANG_ENABLE_OBJC_WEAK = YES;\r\n</YYIosBuildSettingsInjection>\r\n\r\n",
  "iosdelegatename":null,
  "iosplistinject":"\r\n\n<key>CFBundleURLTypes</key>\n<array>\n  <dict>\n  <key>CFBundleURLSchemes</key>\n  <array>\n    <string>fb${YYEXTOPT_FacebookExtension2_AppId}</string>\n  </array>\n  </dict>\n</array>\n\n     <key>FacebookAppID</key>\r\n     <string>${YYEXTOPT_FacebookExtension2_AppId}</string>\r\n     <key>FacebookClientToken</key>\r\n     <string>${YYEXTOPT_FacebookExtension2_ClientToken}</string>\r\n     <key>FacebookDisplayName</key>\r\n     <string>${YYEXTOPT_FacebookExtension2_DisplayName}</string>\r\n\r\n\r\n    <key>LSApplicationQueriesSchemes</key>\r\n    <array>\r\n      <string>fbapi</string>\r\n      <string>fb-messenger-share-api</string>\r\n    </array>\r\n\r\n",
  "iosProps":true,
  "iosSystemFrameworkEntries":[
    {"$GMExtensionFrameworkEntry":"","%Name":"WebKit.framework","embed":0,"name":"WebKit.framework","resourceType":"GMExtensionFrameworkEntry","resourceVersion":"2.0","weakReference":false,},
  ],
  "iosThirdPartyFrameworkEntries":[],
  "license":"Free to use, also for commercial games.",
  "maccompilerflags":"",
  "maclinkerflags":"",
  "macsourcedir":"",
  "name":"FacebookExtension2",
  "options":[
    {"$GMExtensionOption":"","%Name":"__extOptLabel1","defaultValue":"SDK LOGIN:","description":"","displayName":"","exportToINI":false,"extensionId":null,"guid":"3a7b1651-7650-477d-ac65-0a280f426087","hidden":false,"listItems":[],"name":"__extOptLabel1","optType":5,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"AppId","defaultValue":"","description":"","displayName":"App ID","exportToINI":false,"extensionId":null,"guid":"77e85f76-c416-45a1-a39c-08332b2d9ae1","hidden":false,"listItems":[],"name":"AppId","optType":2,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"DisplayName","defaultValue":"","description":"","displayName":"Display Name","exportToINI":false,"extensionId":null,"guid":"0cf64dce-5fd3-4668-9897-5f76ff64b376","hidden":false,"listItems":[],"name":"DisplayName","optType":2,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"ClientToken","defaultValue":"","description":"You can get this token from the Facebook dashboard under Settings -> Advanced -> Client Token","displayName":"Client Token","exportToINI":false,"extensionId":null,"guid":"6fa4d3b1-44e8-4512-ad27-3c395daa526b","hidden":false,"listItems":[],"name":"ClientToken","optType":2,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"__extOptLabel","defaultValue":"OAUTH LOGIN:","description":"","displayName":"","exportToINI":false,"extensionId":null,"guid":"0bf25f3c-4a72-4ca7-bed2-f92dc888b27b","hidden":false,"listItems":[],"name":"__extOptLabel","optType":5,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"OAuth ClientID","defaultValue":"","description":"","displayName":"","exportToINI":false,"extensionId":null,"guid":"df5ce0ca-6941-46de-98ef-b6814af45706","hidden":false,"listItems":[],"name":"OAuth ClientID","optType":2,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"OAuth URL","defaultValue":"","description":"","displayName":"","exportToINI":false,"extensionId":null,"guid":"a68797c0-0fc0-40b9-ad78-aaa676a1928b","hidden":false,"listItems":[],"name":"OAuth URL","optType":2,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"OAuth Search URL","defaultValue":"","description":"","displayName":"","exportToINI":false,"extensionId":null,"guid":"6354b121-c530-4e24-ae5a-e31e562be6bf","hidden":false,"listItems":[],"name":"OAuth Search URL","optType":2,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
  ],
  "optionsFile":"options.json",
  "packageId":"com.yoyogames.facebookextension2",
  "parent":{
    "name":"FacebookAPI",
    "path":"folders/Authentication Providers/Extensions/FacebookAPI.yy",
  },
  "productId":"",
  "resourceType":"GMExtension",
  "resourceVersion":"2.0",
  "sourcedir":"",
  "supportedTargets":153720560310812910,
  "tvosclassname":"",
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