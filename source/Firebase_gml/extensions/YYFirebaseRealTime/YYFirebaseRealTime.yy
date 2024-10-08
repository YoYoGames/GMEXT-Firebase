{
  "$GMExtension":"",
  "%Name":"YYFirebaseRealTime",
  "androidactivityinject":"",
  "androidclassname":"YYFirebaseRealTime",
  "androidcodeinjection":"\r\n<YYAndroidGradleDependencies>\r\n        implementation 'com.google.firebase:firebase-database'\r\n</YYAndroidGradleDependencies>\r\n\r\n",
  "androidinject":"",
  "androidmanifestinject":"",
  "androidPermissions":[],
  "androidProps":true,
  "androidsourcedir":"",
  "author":"",
  "classname":"YYFirebaseRealTime",
  "copyToTargets":9007199254741036,
  "description":"",
  "exportToGame":true,
  "extensionVersion":"2.3.0",
  "files":[
    {"$GMExtensionFile":"","%Name":"FirebaseRealTime.ext","constants":[],"copyToTargets":44,"filename":"FirebaseRealTime.ext","final":"","functions":[
        {"$GMExtensionFunction":"","%Name":"FirebaseRealTime_SDK","argCount":0,"args":[1,],"documentation":"","externalName":"FirebaseRealTime_SDK","help":"FirebaseRealTime_SDK(json)","hidden":false,"kind":4,"name":"FirebaseRealTime_SDK","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
      ],"init":"","kind":4,"name":"FirebaseRealTime.ext","order":[
        {"name":"FirebaseRealTime_SDK","path":"extensions/YYFirebaseRealTime/YYFirebaseRealTime.yy",},
      ],"origname":"","ProxyFiles":[
        {"$GMProxyFile":"","%Name":"FirebaseRealTime.js","name":"FirebaseRealTime.js","resourceType":"GMProxyFile","resourceVersion":"2.0","TargetMask":5,},
      ],"resourceType":"GMExtensionFile","resourceVersion":"2.0","uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject":"\r\n        implementation 'com.google.firebase:firebase-database'\r\n",
  "hasConvertedCodeInjection":true,
  "helpfile":"",
  "HTML5CodeInjection":"\r\n<GM_HTML5_PostBody>\r\n<script type=\"module\">\r\n    // Import the entire module only after Firebase is initialized\r\n    import * as FirebaseRealTimeModule from 'https://www.gstatic.com/firebasejs/10.13.2/firebase-database.js';\r\n\r\n    try {\r\n        // Initialize or merge module into the global namespace\r\n        window.FirebaseRealTimeExt = Object.assign(window.FirebaseRealTimeExt || {}, {\r\n            module: FirebaseRealTimeModule\r\n        });\r\n        console.log(\"Firebase Realtime Database initialized successfully\");\r\n    } catch (error) {\r\n        console.error(\"Failed to initialize Firebase Realtime Database. Ensure Firebase is initialized before loading Firebase Realtime Database.\", error.message);\r\n    }\r\n</script>\r\n</GM_HTML5_PostBody>",
  "html5Props":true,
  "IncludedResources":[],
  "installdir":"",
  "iosCocoaPodDependencies":"",
  "iosCocoaPods":"\r\npod 'FirebaseDatabase'\r\n",
  "ioscodeinjection":"\r\n<YYIosCocoaPods>\r\npod 'FirebaseDatabase'\r\n</YYIosCocoaPods>\r\n\r\n",
  "iosdelegatename":"",
  "iosplistinject":"",
  "iosProps":true,
  "iosSystemFrameworkEntries":[],
  "iosThirdPartyFrameworkEntries":[],
  "license":"",
  "maccompilerflags":"-fobjc-arc",
  "maclinkerflags":"-ObjC",
  "macsourcedir":"",
  "name":"YYFirebaseRealTime",
  "options":[
    {"$GMExtensionOption":"","%Name":"DatabaseURL","defaultValue":"","description":"Get this from your Firebase project's dashboard.","displayName":"Database URL","exportToINI":false,"extensionId":null,"guid":"13d5c484-3fd0-4686-b12a-8a55c146343e","hidden":false,"listItems":[],"name":"DatabaseURL","optType":2,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"Config","defaultValue":"SDKs_When_Available","description":"The SDK is limited to some platforms (check the manual)","displayName":"Mode (SDK or REST)","exportToINI":false,"extensionId":null,"guid":"46eaed75-d17c-40ba-8878-4d9319d09378","hidden":false,"listItems":[
        "SDKs_Only",
        "SDKs_When_Available",
        "REST_API_Only",
      ],"name":"Config","optType":6,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
  ],
  "optionsFile":"options.json",
  "packageId":"",
  "parent":{
    "name":"Extensions",
    "path":"folders/Firebase RealTime/Extensions.yy",
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