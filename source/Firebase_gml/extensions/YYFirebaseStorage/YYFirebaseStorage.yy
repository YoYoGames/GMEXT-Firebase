{
  "$GMExtension":"",
  "%Name":"YYFirebaseStorage",
  "androidactivityinject":"",
  "androidclassname":"YYFirebaseStorage",
  "androidcodeinjection":"\r\n<YYAndroidGradleDependencies>\r\n        implementation 'com.google.firebase:firebase-storage'\r\n</YYAndroidGradleDependencies>\r\n\r\n",
  "androidinject":"",
  "androidmanifestinject":"",
  "androidPermissions":[],
  "androidProps":true,
  "androidsourcedir":"",
  "author":"",
  "classname":"YYFirebaseStorage",
  "copyToTargets":9007199254741036,
  "description":"",
  "exportToGame":true,
  "extensionVersion":"2.2.0",
  "files":[
    {"$GMExtensionFile":"","%Name":"YYFirebaseStorage.ext","constants":[],"copyToTargets":9007199254741036,"filename":"YYFirebaseStorage.ext","final":"","functions":[
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseStorage_Cancel","argCount":0,"args":[1,],"documentation":"","externalName":"SDKFirebaseStorage_Cancel","help":"SDKFirebaseStorage_Cancel(listener)","hidden":false,"kind":4,"name":"SDKFirebaseStorage_Cancel","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseStorage_Download","argCount":0,"args":[1,1,1,],"documentation":"","externalName":"SDKFirebaseStorage_Download","help":"SDKFirebaseStorage_Download(localPath,storagePath,bucket)","hidden":false,"kind":4,"name":"SDKFirebaseStorage_Download","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseStorage_Upload","argCount":0,"args":[1,1,1,],"documentation":"","externalName":"SDKFirebaseStorage_Upload","help":"SDKFirebaseStorage_Upload(localPath,storagePath,bucket)","hidden":false,"kind":4,"name":"SDKFirebaseStorage_Upload","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseStorage_Delete","argCount":0,"args":[1,1,],"documentation":"","externalName":"SDKFirebaseStorage_Delete","help":"SDKFirebaseStorage_Delete(storagePath,bucket)","hidden":false,"kind":4,"name":"SDKFirebaseStorage_Delete","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseStorage_GetURL","argCount":0,"args":[1,1,],"documentation":"","externalName":"SDKFirebaseStorage_GetURL","help":"SDKFirebaseStorage_GetURL(storagePath,bucket)","hidden":false,"kind":4,"name":"SDKFirebaseStorage_GetURL","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseStorage_List","argCount":0,"args":[1,2,1,1,],"documentation":"","externalName":"SDKFirebaseStorage_List","help":"SDKFirebaseStorage_List(firebasePath,maxResults,pageToken,bucket)","hidden":false,"kind":4,"name":"SDKFirebaseStorage_List","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseStorage_ListAll","argCount":0,"args":[1,1,],"documentation":"","externalName":"SDKFirebaseStorage_ListAll","help":"SDKFirebaseStorage_ListAll(firebasePath,bucket)","hidden":false,"kind":4,"name":"SDKFirebaseStorage_ListAll","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
      ],"init":"","kind":4,"name":"YYFirebaseStorage.ext","order":[
        {"name":"SDKFirebaseStorage_Cancel","path":"extensions/YYFirebaseStorage/YYFirebaseStorage.yy",},
        {"name":"SDKFirebaseStorage_Download","path":"extensions/YYFirebaseStorage/YYFirebaseStorage.yy",},
        {"name":"SDKFirebaseStorage_Upload","path":"extensions/YYFirebaseStorage/YYFirebaseStorage.yy",},
        {"name":"SDKFirebaseStorage_Delete","path":"extensions/YYFirebaseStorage/YYFirebaseStorage.yy",},
        {"name":"SDKFirebaseStorage_GetURL","path":"extensions/YYFirebaseStorage/YYFirebaseStorage.yy",},
        {"name":"SDKFirebaseStorage_List","path":"extensions/YYFirebaseStorage/YYFirebaseStorage.yy",},
        {"name":"SDKFirebaseStorage_ListAll","path":"extensions/YYFirebaseStorage/YYFirebaseStorage.yy",},
      ],"origname":"","ProxyFiles":[
        {"$GMProxyFile":"","%Name":"YYFirebaseStorage.js","name":"YYFirebaseStorage.js","resourceType":"GMProxyFile","resourceVersion":"2.0","TargetMask":5,},
      ],"resourceType":"GMExtensionFile","resourceVersion":"2.0","uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject":"\r\n        implementation 'com.google.firebase:firebase-storage'\r\n",
  "hasConvertedCodeInjection":true,
  "helpfile":"",
  "HTML5CodeInjection":"\r\n<GM_HTML5_PostBody>\r\n<script type=\"module\">\r\n    // Import the entire module only after Firebase is initialized\r\n    import * as FirebaseStorageModule from 'https://www.gstatic.com/firebasejs/10.13.2/firebase-storage.js';\r\n\r\n    try {\r\n        // Initialize or merge module into the global namespace\r\n        window.FirebaseStorageExt = Object.assign(window.FirebaseStorageExt || {}, {\r\n            module: FirebaseStorageModule\r\n        });\r\n        console.log(\"Firebase Storage initialized successfully\");\r\n    } catch (error) {\r\n        console.error(\"Failed to initialize Firebase Storage. Ensure Firebase is initialized before loading Firebase Storage.\", error.message);\r\n    }\r\n</script>\r\n</GM_HTML5_PostBody>",
  "html5Props":true,
  "IncludedResources":[],
  "installdir":"",
  "iosCocoaPodDependencies":"",
  "iosCocoaPods":"\r\npod 'FirebaseStorage'\r\n",
  "ioscodeinjection":"<YYIosCocoaPods>\r\npod 'FirebaseStorage'\r\n</YYIosCocoaPods>",
  "iosdelegatename":"",
  "iosplistinject":"",
  "iosProps":true,
  "iosSystemFrameworkEntries":[],
  "iosThirdPartyFrameworkEntries":[],
  "license":"",
  "maccompilerflags":"-fobjc-arc",
  "maclinkerflags":"-ObjC",
  "macsourcedir":"",
  "name":"YYFirebaseStorage",
  "options":[],
  "optionsFile":"options.json",
  "packageId":"",
  "parent":{
    "name":"Extensions",
    "path":"folders/Firebase Storage/Extensions.yy",
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