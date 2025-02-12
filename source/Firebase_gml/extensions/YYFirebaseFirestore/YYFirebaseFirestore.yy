{
  "$GMExtension":"",
  "%Name":"YYFirebaseFirestore",
  "androidactivityinject":"",
  "androidclassname":"YYFirebaseFirestore",
  "androidcodeinjection":"\r\n<YYAndroidGradleDependencies>\r\n<toExpand condition='${YYEXTOPT_YYFirebaseFirestore_mode}' match='SDKs When Available'>\r\nimplementation 'com.google.firebase:firebase-firestore'\r\n</toExpand>\r\n\r\n<toExpand condition='${YYEXTOPT_YYFirebaseFirestore_mode}' match='SDKs Only'>\r\nimplementation 'com.google.firebase:firebase-firestore'\r\n</toExpand>\r\n</YYAndroidGradleDependencies>\r\n\r\n\r\n<YYAndroidGradleAndroid>\r\n<toExpand condition='${YYEXTOPT_YYFirebaseFirestore_mode}' match='REST API Only'>\r\nsourceSets {\r\n        main {\r\n            java {\r\n                exclude '**/YYFirebaseFirestore.java' // this file won't be compiled\r\n            }\r\n        }\r\n    }\r\n</toExpand>\r\n</YYAndroidGradleAndroid>",
  "androidinject":"",
  "androidmanifestinject":"",
  "androidPermissions":[],
  "androidProps":true,
  "androidsourcedir":"",
  "author":"",
  "classname":"YYFirebaseFirestore",
  "copyToTargets":3035426170322551022,
  "description":"",
  "exportToGame":true,
  "extensionVersion":"3.0.1",
  "files":[
    {"$GMExtensionFile":"","%Name":"FirebaseFirestore.ext","constants":[],"copyToTargets":44,"filename":"FirebaseFirestore.ext","final":"","functions":[
        {"$GMExtensionFunction":"","%Name":"FirebaseFirestore_SDK","argCount":0,"args":[1,],"documentation":"","externalName":"FirebaseFirestore_SDK","help":"FirebaseFirestore_SDK(fluent_json)","hidden":false,"kind":4,"name":"FirebaseFirestore_SDK","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
      ],"init":"","kind":4,"name":"FirebaseFirestore.ext","order":[
        {"name":"FirebaseFirestore_SDK","path":"extensions/YYFirebaseFirestore/YYFirebaseFirestore.yy",},
      ],"origname":"","ProxyFiles":[
        {"$GMProxyFile":"","%Name":"FirebaseFirestore.js","name":"FirebaseFirestore.js","resourceType":"GMProxyFile","resourceVersion":"2.0","TargetMask":5,},
      ],"resourceType":"GMExtensionFile","resourceVersion":"2.0","uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject":"\r\n\r\nimplementation 'com.google.firebase:firebase-firestore'\r\n\r\n\r\n\r\nimplementation 'com.google.firebase:firebase-firestore'\r\n\r\n",
  "hasConvertedCodeInjection":true,
  "helpfile":"",
  "HTML5CodeInjection":"\r\n<GM_HTML5_PostBody>\r\n<script type=\"module\">\r\n    // Define a function to conditionally initialize Firebase Firestore\r\n    async function initializeFirebaseFirestore() {\r\n        try {\r\n            // Check if Firebase has been initialized\r\n            if (window.FirebaseSetupExt) {\r\n                const FirebaseFirestoreModule = await import('https://www.gstatic.com/firebasejs/10.13.2/firebase-firestore.js');\r\n                \r\n                // Initialize or merge module into the global namespace\r\n                window.FirebaseFirestoreExt = Object.assign(window.FirebaseFirestoreExt || {}, {\r\n                    module: FirebaseFirestoreModule,\r\n                    instance: FirebaseFirestoreModule.getFirestore()\r\n                });\r\n                console.log(\"Firebase Firestore initialized successfully\");\r\n            } else {\r\n                console.warn(\"Firebase is not initialized. Skipping Firebase Firestore initialization.\");\r\n            }\r\n        } catch (error) {\r\n            console.error(\"Failed to initialize Firebase Firestore. Ensure Firebase is initialized before loading Firebase Firestore.\", error.message);\r\n        }\r\n    }\r\n\r\n    var mode = \"${YYEXTOPT_YYFirebaseFirestore_mode}\";\r\n    if (mode === \"SDKs Only\" || mode === \"SDKs When Available\") {\r\n        // Call the function to conditionally initialize Firebase Firestore\r\n        initializeFirebaseFirestore();\r\n    } else {\r\n        console.log(\"Firebase Firestore initialized successfully\");\r\n    }\r\n</script>\r\n</GM_HTML5_PostBody>\r\n\r\n",
  "html5Props":true,
  "IncludedResources":[],
  "installdir":"",
  "iosCocoaPodDependencies":"",
  "iosCocoaPods":"\r\n\r\n\r\npod 'FirebaseFirestore', '11.3.0'\r\n\r\n\r\n\r\npod 'FirebaseFirestore', '11.3.0'\r\n\r\n\r\n",
  "ioscodeinjection":"\r\n<YYIosCocoaPods>\r\n\r\n<toExpand condition='${YYEXTOPT_YYFirebaseFirestore_mode}' match='SDKs When Available'>\r\npod 'FirebaseFirestore', '11.3.0'\r\n</toExpand>\r\n\r\n<toExpand condition='${YYEXTOPT_YYFirebaseFirestore_mode}' match='SDKs Only'>\r\npod 'FirebaseFirestore', '11.3.0'\r\n</toExpand>\r\n\r\n</YYIosCocoaPods>\r\n\r\n\r\n<YYIos_FirebaseFirestore_Skip_Start>\r\n<toExpand condition='${YYEXTOPT_YYFirebaseFirestore_mode}' match='REST API Only'>\r\n#define __SKIP_COMPILATION__\r\n#ifndef __SKIP_COMPILATION__\r\n</toExpand>\r\n</YYIos_FirebaseFirestore_Skip_Start>\r\n\r\n<YYIos_FirebaseFirestore_Skip_End>\r\n<toExpand condition='${YYEXTOPT_YYFirebaseFirestore_mode}' match='REST API Only'>\r\n#endif\r\n</toExpand>\r\n</YYIos_FirebaseFirestore_Skip_End>",
  "iosdelegatename":"",
  "iosplistinject":"",
  "iosProps":true,
  "iosSystemFrameworkEntries":[],
  "iosThirdPartyFrameworkEntries":[],
  "license":"",
  "maccompilerflags":"-fobjc-arc",
  "maclinkerflags":"-ObjC",
  "macsourcedir":"",
  "name":"YYFirebaseFirestore",
  "options":[
    {"$GMExtensionOption":"","%Name":"projectId","defaultValue":"","description":"Get this from your Firebase project's dashboard.","displayName":"Project ID","exportToINI":false,"extensionId":null,"guid":"58df55cc-27e3-4b18-9fac-8c00f6af6d38","hidden":false,"listItems":[],"name":"projectId","optType":2,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"mode","defaultValue":"SDKs When Available","description":"The SDK is limited to some platforms (check the manual)","displayName":"Mode (SDK or REST)","exportToINI":false,"extensionId":null,"guid":"d0bc7dea-7df6-4506-8c8a-78f04b930a4e","hidden":false,"listItems":[
        "SDKs Only",
        "SDKs When Available",
        "REST API Only",
      ],"name":"mode","optType":6,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
  ],
  "optionsFile":"options.json",
  "packageId":"",
  "parent":{
    "name":"Extensions",
    "path":"folders/Firebase/Firebase Firestore/Extensions.yy",
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