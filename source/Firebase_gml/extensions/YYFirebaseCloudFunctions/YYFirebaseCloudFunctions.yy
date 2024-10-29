{
  "$GMExtension":"",
  "%Name":"YYFirebaseCloudFunctions",
  "androidactivityinject":"",
  "androidclassname":"YYFirebaseCloudFunctions",
  "androidcodeinjection":"<YYAndroidGradleDependencies>\r\n        implementation 'com.google.firebase:firebase-functions'\r\n</YYAndroidGradleDependencies>",
  "androidinject":"",
  "androidmanifestinject":"",
  "androidPermissions":[],
  "androidProps":true,
  "androidsourcedir":"",
  "author":"",
  "classname":"YYFirebaseCloudFunctions",
  "copyToTargets":9007199254741100,
  "description":"",
  "exportToGame":true,
  "extensionVersion":"1.1.0",
  "files":[
    {"$GMExtensionFile":"","%Name":"","constants":[],"copyToTargets":9007199254741036,"filename":"FirebaseCloudFunctions.ext","final":"","functions":[
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseCloudFunctions_Call","argCount":0,"args":[1,1,2,],"documentation":"","externalName":"SDKFirebaseCloudFunctions_Call","help":"SDKFirebaseCloudFunctions_Call(name, args, timeout)","hidden":false,"kind":4,"name":"SDKFirebaseCloudFunctions_Call","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
      ],"init":"","kind":4,"name":"","order":[],"origname":"","ProxyFiles":[
        {"$GMProxyFile":"","%Name":"YYFirebaseCloudFunctions.js","name":"YYFirebaseCloudFunctions.js","resourceType":"GMProxyFile","resourceVersion":"2.0","TargetMask":5,},
      ],"resourceType":"GMExtensionFile","resourceVersion":"2.0","uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject":"\r\n        implementation 'com.google.firebase:firebase-functions'\r\n",
  "hasConvertedCodeInjection":true,
  "helpfile":"",
  "HTML5CodeInjection":"\r\n\r\n<GM_HTML5_PostBody>\r\n<script type=\"module\">\r\n    // Import the entire module only after Firebase is initialized\r\n    import * as FirebaseFunctionsModule from 'https://www.gstatic.com/firebasejs/10.13.2/firebase-functions.js';\r\n\r\n    try {\r\n        // Initialize or merge module into the global namespace\r\n        window.FirebaseFunctionsExt = Object.assign(window.FirebaseFunctionsExt || {}, {\r\n            module: FirebaseFunctionsModule,\r\n            instance: FirebaseFunctionsModule.getFunctions()\r\n        });\r\n        console.log(\"Firebase Functions initialized successfully\");\r\n    } catch (error) {\r\n        console.error(\"Failed to initialize Firebase Functions. Ensure Firebase is initialized before loading Firebase Functions.\", error.message);\r\n    }\r\n</script>\r\n</GM_HTML5_PostBody>\r\n",
  "html5Props":true,
  "IncludedResources":[],
  "installdir":"",
  "iosCocoaPodDependencies":"",
  "iosCocoaPods":"\r\npod 'FirebaseFunctions', '11.3.0'\r\n",
  "ioscodeinjection":"\r\n<YYIosCocoaPods>\r\npod 'FirebaseFunctions', '11.3.0'\r\n</YYIosCocoaPods>",
  "iosdelegatename":"",
  "iosplistinject":"",
  "iosProps":true,
  "iosSystemFrameworkEntries":[],
  "iosThirdPartyFrameworkEntries":[],
  "license":"",
  "maccompilerflags":"-fobjc-arc",
  "maclinkerflags":"-ObjC",
  "macsourcedir":"",
  "name":"YYFirebaseCloudFunctions",
  "options":[
    {"$GMExtensionOption":"","%Name":"useEmulator","defaultValue":"False","description":"Modifies this FirebaseFunctions instance to communicate with the Cloud Functions emulator.","displayName":"Use Emulator","exportToINI":false,"extensionId":null,"guid":"7a3af432-a1d9-4b8a-9f1f-a140f9de33e6","hidden":false,"listItems":[],"name":"useEmulator","optType":0,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"emulatorHost","defaultValue":"127.0.0.1","description":"","displayName":"Host Address","exportToINI":false,"extensionId":null,"guid":"fe4d1a44-01e7-4c0d-ab14-a16a09701b26","hidden":false,"listItems":[],"name":"emulatorHost","optType":2,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"emulatorPort","defaultValue":"8080","description":"","displayName":"Port","exportToINI":false,"extensionId":null,"guid":"383434e2-12a6-4526-8e56-9457ed0288ce","hidden":false,"listItems":[],"name":"emulatorPort","optType":2,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"mode","defaultValue":"SDKs When Available","description":"The SDK is limited to some platforms (check the manual)","displayName":"Mode (SDK or REST)","exportToINI":false,"extensionId":null,"guid":"2819c54b-73ac-4b8c-8a88-4ac475cc7275","hidden":false,"listItems":[
        "SDKs Only",
        "SDKs When Available",
        "REST API Only",
      ],"name":"mode","optType":6,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
  ],
  "optionsFile":"options.json",
  "packageId":"",
  "parent":{
    "name":"Extensions",
    "path":"folders/Firebase/Firebase Cloud Functions/Extensions.yy",
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