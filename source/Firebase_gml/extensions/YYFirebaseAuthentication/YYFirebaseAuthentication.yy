{
  "$GMExtension":"",
  "%Name":"YYFirebaseAuthentication",
  "androidactivityinject":"",
  "androidclassname":"YYFirebaseAuthentication",
  "androidcodeinjection":"\r\n<YYAndroidGradleDependencies>\r\n<toExpand condition='${YYEXTOPT_YYFirebaseAuthentication_mode}' match='SDKs When Available'>\r\nimplementation 'com.google.firebase:firebase-auth'\r\n</toExpand>\r\n\r\n<toExpand condition='${YYEXTOPT_YYFirebaseAuthentication_mode}' match='SDKs Only'>\r\nimplementation 'com.google.firebase:firebase-auth'\r\n</toExpand>\r\n</YYAndroidGradleDependencies>\r\n\r\n\r\n<YYAndroidGradleAndroid>\r\n<toExpand condition='${YYEXTOPT_YYFirebaseAuthentication_mode}' match='REST API Only'>\r\nsourceSets {\r\n        main {\r\n            java {\r\n                exclude '**/YYFirebaseAuthentication.java' // this file won't be compiled\r\n            }\r\n        }\r\n    }\r\n</toExpand>\r\n</YYAndroidGradleAndroid>",
  "androidinject":"",
  "androidmanifestinject":"",
  "androidPermissions":[],
  "androidProps":true,
  "androidsourcedir":"",
  "author":"",
  "classname":"YYFirebaseAuthentication",
  "copyToTargets":108,
  "description":"",
  "exportToGame":true,
  "extensionVersion":"2.2.0",
  "files":[
    {"$GMExtensionFile":"","%Name":"FirebaseAuthentication.ext","constants":[],"copyToTargets":44,"filename":"FirebaseAuthentication.ext","final":"","functions":[
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_SignInWithCustomToken","argCount":0,"args":[1,],"documentation":"","externalName":"SDKFirebaseAuthentication_SignInWithCustomToken","help":"SDKFirebaseAuthentication_SignInWithCustomToken(token)","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_SignInWithCustomToken","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_SignIn_Email","argCount":0,"args":[1,1,],"documentation":"","externalName":"SDKFirebaseAuthentication_SignIn_Email","help":"SDKFirebaseAuthentication_SignIn_Email(email,password)","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_SignIn_Email","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_SignUp_Email","argCount":0,"args":[1,1,],"documentation":"","externalName":"SDKFirebaseAuthentication_SignUp_Email","help":"SDKFirebaseAuthentication_SignUp_Email(email,password)","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_SignUp_Email","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_SignIn_Anonymously","argCount":0,"args":[],"documentation":"","externalName":"SDKFirebaseAuthentication_SignIn_Anonymously","help":"SDKFirebaseAuthentication_SignIn_Anonymously()","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_SignIn_Anonymously","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_SendPasswordResetEmail","argCount":0,"args":[1,],"documentation":"","externalName":"SDKFirebaseAuthentication_SendPasswordResetEmail","help":"SDKFirebaseAuthentication_SendPasswordResetEmail(email)","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_SendPasswordResetEmail","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_ChangeEmail","argCount":0,"args":[1,],"documentation":"","externalName":"SDKFirebaseAuthentication_ChangeEmail","help":"SDKFirebaseAuthentication_ChangeEmail(email)","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_ChangeEmail","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_ChangePassword","argCount":0,"args":[1,],"documentation":"","externalName":"SDKFirebaseAuthentication_ChangePassword","help":"SDKFirebaseAuthentication_ChangePassword(password)","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_ChangePassword","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_UpdateProfile","argCount":0,"args":[],"documentation":"","externalName":"SDKFirebaseAuthentication_UpdateProfile","help":"SDKFirebaseAuthentication_UpdateProfile(TODO...l","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_UpdateProfile","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_SendEmailVerification","argCount":0,"args":[],"documentation":"","externalName":"SDKFirebaseAuthentication_SendEmailVerification","help":"SDKFirebaseAuthentication_SendEmailVerification()","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_SendEmailVerification","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_DeleteAccount","argCount":0,"args":[],"documentation":"","externalName":"SDKFirebaseAuthentication_DeleteAccount","help":"SDKFirebaseAuthentication_DeleteAccount()","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_DeleteAccount","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_SignOut","argCount":0,"args":[],"documentation":"","externalName":"SDKFirebaseAuthentication_SignOut","help":"SDKFirebaseAuthentication_SignOut()","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_SignOut","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_GetUserData","argCount":0,"args":[],"documentation":"","externalName":"SDKFirebaseAuthentication_GetUserData","help":"SDKFirebaseAuthentication_GetUserData()","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_GetUserData","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_LinkWithOAuthCredential","argCount":0,"args":[1,1,1,1,],"documentation":"","externalName":"SDKFirebaseAuthentication_LinkWithOAuthCredential","help":"SDKFirebaseAuthentication_LinkWithOAuthCredential(token,token_kind,provider,requestUri)","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_LinkWithOAuthCredential","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_UnlinkProvider","argCount":0,"args":[],"documentation":"","externalName":"SDKFirebaseAuthentication_UnlinkProvider","help":"SDKFirebaseAuthentication_UnlinkProvider(provider)","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_UnlinkProvider","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_RefreshUserData","argCount":0,"args":[],"documentation":"","externalName":"SDKFirebaseAuthentication_RefreshUserData","help":"SDKFirebaseAuthentication_RefreshUserData()","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_RefreshUserData","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_GetIdToken","argCount":0,"args":[],"documentation":"","externalName":"SDKFirebaseAuthentication_GetIdToken","help":"SDKFirebaseAuthentication_GetIdToken()","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_GetIdToken","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_LinkWithEmailPassword","argCount":0,"args":[1,1,],"documentation":"","externalName":"SDKFirebaseAuthentication_LinkWithEmailPassword","help":"SDKFirebaseAuthentication_LinkWithEmailPassword(email,password)","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_LinkWithEmailPassword","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_ChangeDisplayName","argCount":0,"args":[1,],"documentation":"","externalName":"SDKFirebaseAuthentication_ChangeDisplayName","help":"SDKFirebaseAuthentication_ChangeDisplayName(name)","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_ChangeDisplayName","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_ChangePhotoURL","argCount":0,"args":[1,],"documentation":"","externalName":"SDKFirebaseAuthentication_ChangePhotoURL","help":"SDKFirebaseAuthentication_ChangePhotoURL(photoURL)","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_ChangePhotoURL","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_SignIn_OAuth","argCount":0,"args":[1,1,1,1,],"documentation":"","externalName":"SDKFirebaseAuthentication_SignIn_OAuth","help":"SDKFirebaseAuthentication_SignIn_OAuth(token,token_kind,provider,requestUri)","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_SignIn_OAuth","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_SignIn_GameCenter","argCount":0,"args":[],"documentation":"","externalName":"SDKFirebaseAuthentication_SignIn_GameCenter","help":"SDKFirebaseAuthentication_SignIn_GameCenter()","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_SignIn_GameCenter","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_LinkWithGameCenter","argCount":0,"args":[],"documentation":"","externalName":"SDKFirebaseAuthentication_LinkWithGameCenter","help":"SDKFirebaseAuthentication_LinkWithGameCenter()","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_LinkWithGameCenter","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_SignInWithPhoneNumber","argCount":0,"args":[1,1,1,],"documentation":"","externalName":"SDKFirebaseAuthentication_SignInWithPhoneNumber","help":"SDKFirebaseAuthentication_SignInWithPhoneNumber(phone,code,sessioninfo)","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_SignInWithPhoneNumber","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_LinkWithPhoneNumber","argCount":0,"args":[1,1,1,],"documentation":"","externalName":"SDKFirebaseAuthentication_LinkWithPhoneNumber","help":"SDKFirebaseAuthentication_LinkWithPhoneNumber(phoneNumber,code,sessionInfo)","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_LinkWithPhoneNumber","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_ReauthenticateWithOAuth","argCount":0,"args":[1,1,1,1,],"documentation":"","externalName":"SDKFirebaseAuthentication_ReauthenticateWithOAuth","help":"SDKFirebaseAuthentication_ReauthenticateWithOAuth(token,token_kind,provider,requestUri)","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_ReauthenticateWithOAuth","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_ReauthenticateWithEmail","argCount":0,"args":[1,1,],"documentation":"","externalName":"SDKFirebaseAuthentication_ReauthenticateWithEmail","help":"SDKFirebaseAuthentication_ReauthenticateWithEmail(email,password)","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_ReauthenticateWithEmail","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_ReauthenticateWithPhoneNumber","argCount":0,"args":[1,1,1,],"documentation":"","externalName":"SDKFirebaseAuthentication_ReauthenticateWithPhoneNumber","help":"SDKFirebaseAuthentication_ReauthenticateWithPhoneNumber(phoneNumber,code,sessionInfo)","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_ReauthenticateWithPhoneNumber","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_SignInWithProvider","argCount":0,"args":[1,1,],"documentation":"","externalName":"SDKFirebaseAuthentication_SignInWithProvider","help":"SDKFirebaseAuthentication_SignInWithProvider(provider,jsonArray_scopes)","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_SignInWithProvider","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_LinkWithProvider","argCount":0,"args":[1,1,],"documentation":"","externalName":"SDKFirebaseAuthentication_LinkWithProvider","help":"SDKFirebaseAuthentication_LinkWithProvider(provider,jsonArray_scopes)","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_LinkWithProvider","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_ReauthenticateWithProvider","argCount":0,"args":[1,1,],"documentation":"","externalName":"SDKFirebaseAuthentication_ReauthenticateWithProvider","help":"SDKFirebaseAuthentication_ReauthenticateWithProvider(provider,jsonArray_scopes)","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_ReauthenticateWithProvider","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":1,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_ReauthenticateWithGameCenter","argCount":0,"args":[],"documentation":"","externalName":"SDKFirebaseAuthentication_ReauthenticateWithGameCenter","help":"SDKFirebaseAuthentication_ReauthenticateWithGameCenter()","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_ReauthenticateWithGameCenter","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_IdTokenListener","argCount":0,"args":[],"documentation":"","externalName":"SDKFirebaseAuthentication_IdTokenListener","help":"SDKFirebaseAuthentication_IdTokenListener()","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_IdTokenListener","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
        {"$GMExtensionFunction":"","%Name":"SDKFirebaseAuthentication_IdTokenListener_Remove","argCount":0,"args":[],"documentation":"","externalName":"SDKFirebaseAuthentication_IdTokenListener_Remove","help":"SDKFirebaseAuthentication_IdTokenListener_Remove()","hidden":false,"kind":4,"name":"SDKFirebaseAuthentication_IdTokenListener_Remove","resourceType":"GMExtensionFunction","resourceVersion":"2.0","returnType":2,},
      ],"init":"","kind":4,"name":"FirebaseAuthentication.ext","order":[
        {"name":"SDKFirebaseAuthentication_GetUserData","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_SignInWithCustomToken","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_SignIn_Email","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_SignUp_Email","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_SignIn_Anonymously","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_SendPasswordResetEmail","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_ChangeEmail","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_ChangePassword","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_UpdateProfile","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_SendEmailVerification","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_DeleteAccount","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_SignOut","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_UnlinkProvider","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_RefreshUserData","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_GetIdToken","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_ChangeDisplayName","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_ChangePhotoURL","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_LinkWithEmailPassword","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_LinkWithOAuthCredential","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_SignIn_OAuth","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_SignIn_GameCenter","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_LinkWithGameCenter","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_ReauthenticateWithGameCenter","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_SignInWithPhoneNumber","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_LinkWithPhoneNumber","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_ReauthenticateWithPhoneNumber","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_ReauthenticateWithOAuth","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_ReauthenticateWithEmail","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_SignInWithProvider","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_LinkWithProvider","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_ReauthenticateWithProvider","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_IdTokenListener","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
        {"name":"SDKFirebaseAuthentication_IdTokenListener_Remove","path":"extensions/YYFirebaseAuthentication/YYFirebaseAuthentication.yy",},
      ],"origname":"","ProxyFiles":[
        {"$GMProxyFile":"","%Name":"FirebaseAuthentication.js","name":"FirebaseAuthentication.js","resourceType":"GMProxyFile","resourceVersion":"2.0","TargetMask":5,},
      ],"resourceType":"GMExtensionFile","resourceVersion":"2.0","uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject":"\r\n\r\nimplementation 'com.google.firebase:firebase-auth'\r\n\r\n\r\n\r\nimplementation 'com.google.firebase:firebase-auth'\r\n\r\n",
  "hasConvertedCodeInjection":true,
  "helpfile":"",
  "HTML5CodeInjection":"\r\n<GM_HTML5_PostBody>\r\n<script type=\"module\">\r\n    // Define a function to conditionally initialize Firebase Authentication\r\n    async function initializeFirebaseAuthentication() {\r\n        try {\r\n            // Check if Firebase has been initialized\r\n            if (window.FirebaseSetupExt) {\r\n                const FirebaseAuthenticationModule = await import('https://www.gstatic.com/firebasejs/10.13.2/firebase-auth.js');\r\n                \r\n                // Initialize or merge module into the global namespace\r\n                window.FirebaseAuthenticationExt = Object.assign(window.FirebaseAuthenticationExt || {}, {\r\n                    module: FirebaseAuthenticationModule,\r\n                    instance: FirebaseAuthenticationModule.getAuth()\r\n                });\r\n                console.log(\"Firebase Authentication initialized successfully\");\r\n            } else {\r\n                console.warn(\"Firebase is not initialized. Skipping Firebase Authentication initialization.\");\r\n            }\r\n        } catch (error) {\r\n            console.error(\"Failed to initialize Firebase Authentication. Ensure Firebase is initialized before loading Firebase Authentication.\", error.message);\r\n        }\r\n    }\r\n\r\n    var mode = \"${YYEXTOPT_YYFirebaseAuthentication_mode}\";\r\n    if (mode === \"SDKs Only\" || mode === \"SDKs When Available\") {\r\n        // Call the function to conditionally initialize Firebase Authentication\r\n        initializeFirebaseAuthentication();\r\n    } else {\r\n        console.log(\"Firebase Authentication initialized successfully\");\r\n    }\r\n</script>\r\n</GM_HTML5_PostBody>\r\n",
  "html5Props":true,
  "IncludedResources":[],
  "installdir":"",
  "iosCocoaPodDependencies":"",
  "iosCocoaPods":"\r\n\r\n\r\npod 'FirebaseAuth', '11.3.0'\r\npod 'FirebaseAuthInterop', '11.3.0'\r\n\r\n\r\n\r\npod 'FirebaseAuth', '11.3.0'\r\npod 'FirebaseAuthInterop', '11.3.0'\r\n\r\n\r\n",
  "ioscodeinjection":"\r\n<YYIosCocoaPods>\r\n\r\n<toExpand condition='${YYEXTOPT_YYFirebaseAuthentication_mode}' match='SDKs When Available'>\r\npod 'FirebaseAuth', '11.3.0'\r\npod 'FirebaseAuthInterop', '11.3.0'\r\n</toExpand>\r\n\r\n<toExpand condition='${YYEXTOPT_YYFirebaseAuthentication_mode}' match='SDKs Only'>\r\npod 'FirebaseAuth', '11.3.0'\r\npod 'FirebaseAuthInterop', '11.3.0'\r\n</toExpand>\r\n\r\n</YYIosCocoaPods>\r\n\r\n<YYIos_FirebaseAuthentication_Skip_Start>\r\n<toExpand condition='${YYEXTOPT_YYFirebaseAuthentication_mode}' match='REST API Only'>\r\n#define __SKIP_COMPILATION__\r\n#ifndef __SKIP_COMPILATION__\r\n</toExpand>\r\n</YYIos_FirebaseAuthentication_Skip_Start>\r\n\r\n<YYIos_FirebaseAuthentication_Skip_End>\r\n<toExpand condition='${YYEXTOPT_YYFirebaseAuthentication_mode}' match='REST API Only'>\r\n#endif\r\n</toExpand>\r\n</YYIos_FirebaseAuthentication_Skip_End>",
  "iosdelegatename":"",
  "iosplistinject":"",
  "iosProps":true,
  "iosSystemFrameworkEntries":[],
  "iosThirdPartyFrameworkEntries":[],
  "license":"",
  "maccompilerflags":"-fobjc-arc",
  "maclinkerflags":"-ObjC",
  "macsourcedir":"",
  "name":"YYFirebaseAuthentication",
  "options":[
    {"$GMExtensionOption":"","%Name":"appId","defaultValue":"","description":"","displayName":"","exportToINI":false,"extensionId":null,"guid":"6302af9d-839b-45ed-8392-870257ce79b5","hidden":false,"listItems":[],"name":"appId","optType":2,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"WebAPIKey","defaultValue":"","description":"Get this from your Firebase project's dashboard.","displayName":"WebAPI Key","exportToINI":false,"extensionId":null,"guid":"2df2e529-85ff-4387-bb93-5f6df9f9f215","hidden":false,"listItems":[],"name":"WebAPIKey","optType":2,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
    {"$GMExtensionOption":"","%Name":"mode","defaultValue":"SDKs When Available","description":"The SDK is limited to some platforms (check the manual)","displayName":"Mode (SDK or REST)","exportToINI":false,"extensionId":null,"guid":"04e841fc-69d6-4b67-9520-26032dc733fb","hidden":false,"listItems":[
        "SDKs Only",
        "SDKs When Available",
        "Only REST API",
      ],"name":"mode","optType":6,"resourceType":"GMExtensionOption","resourceVersion":"2.0",},
  ],
  "optionsFile":"options.json",
  "packageId":"",
  "parent":{
    "name":"Extensions",
    "path":"folders/Firebase/Firebase Authentication/Extensions.yy",
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