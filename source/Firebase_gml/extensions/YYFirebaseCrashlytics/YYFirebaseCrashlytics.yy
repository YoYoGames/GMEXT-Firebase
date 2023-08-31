{
    "resourceType": "GMExtension",
    "resourceVersion": "1.2",
    "name": "YYFirebaseCrashlytics",
    "androidactivityinject": "",
    "androidclassname": "YYFirebaseCrashlytics",
    "androidcodeinjection": "\r\n\r\n<YYAndroidManifestApplicationInject>\r\n       <meta-data android:name=\"firebase_crashlytics_collection_enabled\" android:value=\"true\" />\r\n</YYAndroidManifestApplicationInject>\r\n\r\n<YYAndroidGradleDependencies>\r\n      implementation 'com.google.firebase:firebase-crashlytics'\r\n</YYAndroidGradleDependencies>\r\n\r\n<YYAndroidTopLevelGradleBuildscriptDependencies>\r\n        classpath 'com.google.firebase:firebase-crashlytics-gradle:2.4.1'\r\n</YYAndroidTopLevelGradleBuildscriptDependencies>\r\n\r\n<YYAndroidTopLevelGradleBuildscriptRepositories>\r\n\t\tmaven {\r\n           url 'https://maven.fabric.io/public'\r\n        }\r\n</YYAndroidTopLevelGradleBuildscriptRepositories>\r\n\r\n<YYAndroidGradleEnd>\r\n       apply plugin: 'com.google.firebase.crashlytics'\r\n</YYAndroidGradleEnd>\r\n",
    "androidinject": "\r\n       <meta-data android:name=\"firebase_crashlytics_collection_enabled\" android:value=\"true\"></meta-data>\r\n",
    "androidmanifestinject": "",
    "androidPermissions": [],
    "androidProps": true,
    "androidsourcedir": "",
    "author": "",
    "classname": "YYFirebaseCrashlytics",
    "copyToTargets": 9007199254741004,
    "date": "2021-08-03T20:59:33.6450293+01:00",
    "description": "",
    "exportToGame": true,
    "extensionVersion": "2.1.1",
    "files": [
        {
            "resourceType": "GMExtensionFile",
            "resourceVersion": "1.0",
            "name": "",
            "constants": [],
            "copyToTargets": -1,
            "filename": "FirebaseCrashlytics.ext",
            "final": "",
            "functions": [
                {
                    "resourceType": "GMExtensionFunction",
                    "resourceVersion": "1.0",
                    "name": "FirebaseCrashlytics_Log",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "documentation": "",
                    "externalName": "FirebaseCrashlytics_Log",
                    "help": "FirebaseCrashlytics_Log(string)",
                    "hidden": false,
                    "kind": 4,
                    "returnType": 1
                },
                {
                    "resourceType": "GMExtensionFunction",
                    "resourceVersion": "1.0",
                    "name": "FirebaseCrashlytics_SetCustomKey",
                    "argCount": 0,
                    "args": [
                        1,
                        1
                    ],
                    "documentation": "",
                    "externalName": "FirebaseCrashlytics_SetCustomKey",
                    "help": "FirebaseCrashlytics_SetCustomKey(key,value)",
                    "hidden": false,
                    "kind": 4,
                    "returnType": 1
                },
                {
                    "resourceType": "GMExtensionFunction",
                    "resourceVersion": "1.0",
                    "name": "FirebaseCrashlytics_SetUserIdentifier",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "documentation": "",
                    "externalName": "FirebaseCrashlytics_SetUserIdentifier",
                    "help": "FirebaseCrashlytics_SetUserIdentifier(user)",
                    "hidden": false,
                    "kind": 4,
                    "returnType": 1
                },
                {
                    "resourceType": "GMExtensionFunction",
                    "resourceVersion": "1.0",
                    "name": "FirebaseCrashlytics_Crash",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "documentation": "",
                    "externalName": "FirebaseCrashlytics_Crash",
                    "help": "FirebaseCrashlytics_Crash(str)",
                    "hidden": false,
                    "kind": 4,
                    "returnType": 1
                },
                {
                    "resourceType": "GMExtensionFunction",
                    "resourceVersion": "1.0",
                    "name": "FirebaseCrashlytics_RecordException",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "documentation": "",
                    "externalName": "FirebaseCrashlytics_RecordException",
                    "help": "FirebaseCrashlytics_RecordException(log)",
                    "hidden": false,
                    "kind": 4,
                    "returnType": 1
                },
                {
                    "resourceType": "GMExtensionFunction",
                    "resourceVersion": "1.0",
                    "name": "FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set",
                    "argCount": 0,
                    "args": [
                        2
                    ],
                    "documentation": "",
                    "externalName": "FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set",
                    "help": "FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set(bool)",
                    "hidden": false,
                    "kind": 4,
                    "returnType": 2
                },
                {
                    "resourceType": "GMExtensionFunction",
                    "resourceVersion": "1.0",
                    "name": "FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check",
                    "argCount": 0,
                    "args": [],
                    "documentation": "",
                    "externalName": "FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check",
                    "help": "FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check()",
                    "hidden": false,
                    "kind": 4,
                    "returnType": 2
                },
                {
                    "resourceType": "GMExtensionFunction",
                    "resourceVersion": "1.0",
                    "name": "FirebaseCrashlytics_DidCrashOnPreviousExecution",
                    "argCount": 0,
                    "args": [],
                    "documentation": "",
                    "externalName": "FirebaseCrashlytics_DidCrashOnPreviousExecution",
                    "help": "FirebaseCrashlytics_DidCrashOnPreviousExecution()",
                    "hidden": false,
                    "kind": 4,
                    "returnType": 2
                },
                {
                    "resourceType": "GMExtensionFunction",
                    "resourceVersion": "1.0",
                    "name": "FirebaseCrashlytics_UnsentReports_Delete",
                    "argCount": 0,
                    "args": [],
                    "documentation": "",
                    "externalName": "FirebaseCrashlytics_UnsentReports_Delete",
                    "help": "FirebaseCrashlytics_UnsentReports_Delete()",
                    "hidden": false,
                    "kind": 4,
                    "returnType": 1
                },
                {
                    "resourceType": "GMExtensionFunction",
                    "resourceVersion": "1.0",
                    "name": "FirebaseCrashlytics_UnsentReports_Send",
                    "argCount": 0,
                    "args": [],
                    "documentation": "",
                    "externalName": "FirebaseCrashlytics_UnsentReports_Send",
                    "help": "FirebaseCrashlytics_UnsentReports_Send()",
                    "hidden": false,
                    "kind": 4,
                    "returnType": 1
                },
                {
                    "resourceType": "GMExtensionFunction",
                    "resourceVersion": "1.0",
                    "name": "FirebaseCrashlytics_UnsentReports_Check",
                    "argCount": 0,
                    "args": [],
                    "documentation": "",
                    "externalName": "FirebaseCrashlytics_UnsentReports_Check",
                    "help": "FirebaseCrashlytics_UnsentReports_Check()",
                    "hidden": false,
                    "kind": 4,
                    "returnType": 1
                }
            ],
            "init": "",
            "kind": 4,
            "order": [
                {
                    "name": "FirebaseCrashlytics_Log",
                    "path": "extensions/YYFirebaseCrashlytics/YYFirebaseCrashlytics.yy"
                },
                {
                    "name": "FirebaseCrashlytics_SetCustomKey",
                    "path": "extensions/YYFirebaseCrashlytics/YYFirebaseCrashlytics.yy"
                },
                {
                    "name": "FirebaseCrashlytics_SetUserIdentifier",
                    "path": "extensions/YYFirebaseCrashlytics/YYFirebaseCrashlytics.yy"
                },
                {
                    "name": "FirebaseCrashlytics_Crash",
                    "path": "extensions/YYFirebaseCrashlytics/YYFirebaseCrashlytics.yy"
                },
                {
                    "name": "FirebaseCrashlytics_RecordException",
                    "path": "extensions/YYFirebaseCrashlytics/YYFirebaseCrashlytics.yy"
                },
                {
                    "name": "FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set",
                    "path": "extensions/YYFirebaseCrashlytics/YYFirebaseCrashlytics.yy"
                },
                {
                    "name": "FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check",
                    "path": "extensions/YYFirebaseCrashlytics/YYFirebaseCrashlytics.yy"
                },
                {
                    "name": "FirebaseCrashlytics_DidCrashOnPreviousExecution",
                    "path": "extensions/YYFirebaseCrashlytics/YYFirebaseCrashlytics.yy"
                },
                {
                    "name": "FirebaseCrashlytics_UnsentReports_Delete",
                    "path": "extensions/YYFirebaseCrashlytics/YYFirebaseCrashlytics.yy"
                },
                {
                    "name": "FirebaseCrashlytics_UnsentReports_Send",
                    "path": "extensions/YYFirebaseCrashlytics/YYFirebaseCrashlytics.yy"
                },
                {
                    "name": "FirebaseCrashlytics_UnsentReports_Check",
                    "path": "extensions/YYFirebaseCrashlytics/YYFirebaseCrashlytics.yy"
                }
            ],
            "origname": "",
            "ProxyFiles": [],
            "uncompress": false,
            "usesRunnerInterface": false
        }
    ],
    "gradleinject": "\r\n      implementation 'com.google.firebase:firebase-crashlytics'\r\n",
    "hasConvertedCodeInjection": true,
    "helpfile": "",
    "HTML5CodeInjection": "",
    "html5Props": false,
    "IncludedResources": [],
    "installdir": "",
    "iosCocoaPodDependencies": "",
    "iosCocoaPods": "\r\n       pod 'Firebase/Crashlytics','8.4.0'\r\n",
    "ioscodeinjection": "\r\n<YYIosPlist>\r\n      <key>FirebaseCrashlyticsCollectionEnabled</key>\r\n      <true/>\r\n</YYIosPlist>\r\n\r\n<YYIosCocoaPods>\r\n       pod 'Firebase/Crashlytics','8.4.0'\r\n</YYIosCocoaPods>\r\n\r\n<YYIosScriptPhase>\r\n      \"${PODS_ROOT}/FirebaseCrashlytics/run\"\r\n      ${PODS_ROOT}/FirebaseCrashlytics/upload-symbols -gsp ${PROJECT_DIR}/GoogleService-Info.plist -p ios ${DWARF_DSYM_FOLDER_PATH}/${DWARF_DSYM_FILE_NAME}\r\n</YYIosScriptPhase>\r\n",
    "iosdelegatename": "",
    "iosplistinject": "\r\n      <key>FirebaseCrashlyticsCollectionEnabled</key>\r\n      <true></true>\r\n",
    "iosProps": true,
    "iosSystemFrameworkEntries": [],
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
        "path": "folders/Firebase Crashlytics/Extensions.yy"
    },
    "productId": "",
    "sourcedir": "",
    "supportedTargets": -1,
    "tvosclassname": null,
    "tvosCocoaPodDependencies": "",
    "tvosCocoaPods": "",
    "tvoscodeinjection": "",
    "tvosdelegatename": null,
    "tvosmaccompilerflags": "",
    "tvosmaclinkerflags": "",
    "tvosplistinject": "",
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [],
    "tvosThirdPartyFrameworkEntries": []
}