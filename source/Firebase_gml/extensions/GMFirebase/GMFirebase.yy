{
  "$GMExtension": "v1",
  "%Name": "GMFirebase",
  "androidactivityinject": null,
  "androidclassname": "GMFirebase",
  "androidcodeinjection": "\u003CYYAndroidGradleDependencies\u003E\r\n\r\n    implementation platform(\u0027com.google.firebase:firebase-bom:34.19.0\u0027)\r\n\r\n\r\n    // Firebase modules\r\n    implementation \u0027com.google.firebase:firebase-analytics\u0027\r\n\r\n    implementation \u0027com.google.firebase:firebase-appcheck\u0027\r\n    implementation \u0027com.google.firebase:firebase-appcheck-debug\u0027\r\n    implementation \u0027com.google.firebase:firebase-appcheck-playintegrity\u0027\r\n\r\n    implementation \u0027com.google.firebase:firebase-auth\u0027\r\n    implementation \u0027com.google.firebase:firebase-database\u0027\r\n    implementation \u0027com.google.firebase:firebase-firestore\u0027\r\n    implementation \u0027com.google.firebase:firebase-functions\u0027\r\n    implementation \u0027com.google.firebase:firebase-installations\u0027\r\n    implementation \u0027com.google.firebase:firebase-messaging\u0027\r\n    implementation \u0027com.google.firebase:firebase-config\u0027\r\n    implementation \u0027com.google.firebase:firebase-storage\u0027\r\n\r\n\r\n    // Firebase C\u002B\u002B Messaging Java bridge.\r\n    // The pre-build script places the AAR in libs-aar/.\r\n    implementation files(\u0027libs-aar/firebase_messaging_cpp.aar\u0027)\r\n\r\n\r\n    // Firebase C\u002B\u002B 13.13 dependency.\r\n    implementation \u0027com.google.flatbuffers:flatbuffers-java:25.2.10\u0027\r\n\r\n\r\n    // GameMaker / AGP compatibility.\r\n    implementation \u0027androidx.core:core:1.16.0\u0027\r\n\r\n\r\n    // UMP / Google Play Services\r\n    // GMEXT-AdMob pins the same user-messaging-platform artifact. Keep the two pins\r\n    // equal: Gradle takes the higher one and the other extension never sees its own.\r\n    implementation \u0027com.google.android.ump:user-messaging-platform:4.0.0\u0027\r\n    implementation \u0027com.google.android.gms:play-services-base:18.10.0\u0027\r\n\r\n\u003C/YYAndroidGradleDependencies\u003E\r\n\r\n\r\n\r\n\u003CYYAndroidTopLevelGradleBuildscriptDependencies\u003E\r\n\r\n    classpath \u0027com.google.gms:google-services:4.5.0\u0027\r\n\r\n\u003C/YYAndroidTopLevelGradleBuildscriptDependencies\u003E\r\n\r\n\r\n\r\n\u003CYYAndroidGradleEnd\u003E\r\n\r\n    apply plugin: \u0027com.google.gms.google-services\u0027\r\n\r\n\r\n    configurations.all\r\n    {\r\n        resolutionStrategy\r\n        {\r\n            force \u0027androidx.core:core:1.16.0\u0027\r\n            force \u0027androidx.core:core-ktx:1.16.0\u0027\r\n        }\r\n    }\r\n\r\n\r\n    // Firebase C\u002B\u002B SDK root.\r\n    def firebaseCppSdkPath =\r\n        $/${YYEXTOPT_GMFirebase_firebaseCppSdkPath}/$\r\n\r\n\r\n    def firebaseCppProguardDir =\r\n        new File(firebaseCppSdkPath, \u0022libs/android\u0022)\r\n\r\n\r\n    android.buildTypes.release.proguardFile(\r\n        new File(firebaseCppProguardDir, \u0022app.pro\u0022))\r\n\r\n    android.buildTypes.release.proguardFile(\r\n        new File(firebaseCppProguardDir, \u0022analytics.pro\u0022))\r\n\r\n    android.buildTypes.release.proguardFile(\r\n        new File(firebaseCppProguardDir, \u0022app_check.pro\u0022))\r\n\r\n    android.buildTypes.release.proguardFile(\r\n        new File(firebaseCppProguardDir, \u0022auth.pro\u0022))\r\n\r\n    android.buildTypes.release.proguardFile(\r\n        new File(firebaseCppProguardDir, \u0022database.pro\u0022))\r\n\r\n    android.buildTypes.release.proguardFile(\r\n        new File(firebaseCppProguardDir, \u0022firestore.pro\u0022))\r\n\r\n    android.buildTypes.release.proguardFile(\r\n        new File(firebaseCppProguardDir, \u0022functions.pro\u0022))\r\n\r\n    android.buildTypes.release.proguardFile(\r\n        new File(firebaseCppProguardDir, \u0022installations.pro\u0022))\r\n\r\n    android.buildTypes.release.proguardFile(\r\n        new File(firebaseCppProguardDir, \u0022messaging.pro\u0022))\r\n\r\n    android.buildTypes.release.proguardFile(\r\n        new File(firebaseCppProguardDir, \u0022remote_config.pro\u0022))\r\n\r\n    android.buildTypes.release.proguardFile(\r\n        new File(firebaseCppProguardDir, \u0022storage.pro\u0022))\r\n\r\n    android.buildTypes.release.proguardFile(\r\n        new File(firebaseCppProguardDir, \u0022ump.pro\u0022))\r\n\r\n\u003C/YYAndroidGradleEnd\u003E\r\n\r\n\r\n\r\n\u003CYYAndroidManifestApplicationInject\u003E\r\n\r\n    \u003CtoExpand condition=\u0027${YYEXTOPT_GMFirebase_disableDataCollection}\u0027\u003E\r\n        \u003Cmeta-data\r\n            android:name=\u0022firebase_analytics_collection_enabled\u0022\r\n            android:value=\u0022false\u0022 /\u003E\r\n        \u003Cmeta-data\r\n            android:name=\u0022firebase_messaging_auto_init_enabled\u0022\r\n            android:value=\u0022false\u0022 /\u003E\r\n    \u003C/toExpand\u003E\r\n\r\n\u003C/YYAndroidManifestApplicationInject\u003E",
  "androidinject": null,
  "androidmanifestinject": null,
  "androidPermissions": [
    "android.permission.POST_NOTIFICATIONS"
  ],
  "androidProps": true,
  "androidsourcedir": "",
  "author": "",
  "classname": "GMFirebase",
  "copyToTargets": -1,
  "description": "",
  "exportToGame": true,
  "extensionVersion": "3.1.0",
  "files": [
    {
      "$GMExtensionFile": "v1",
      "%Name": "",
      "constants": [],
      "copyToTargets": -1,
      "filename": "GMFirebase.ext",
      "final": "",
      "functions": [
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_app_initialize",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_app_initialize",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_app_initialize",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_app_is_initialized",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_app_is_initialized",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_app_is_initialized",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_app_get_name",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_app_get_name",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_app_get_name",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_last_error_code",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_last_error_code",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_last_error_code",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_last_error_message",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_last_error_message",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_last_error_message",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_analytics_initialize",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_initialize",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_analytics_initialize",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_analytics_terminate",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_terminate",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_analytics_terminate",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_analytics_set_analytics_collection_enabled",
          "argCount": 1,
          "args": [
            2
          ],
          "documentation": "@param {Real} enabled\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_set_analytics_collection_enabled",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_analytics_set_analytics_collection_enabled",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_analytics_set_consent",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_set_consent",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_analytics_set_consent",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_analytics_log_event",
          "argCount": 1,
          "args": [
            1
          ],
          "documentation": "@param {String} name\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_log_event",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_analytics_log_event",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_analytics_log_event_string",
          "argCount": 3,
          "args": [
            1,
            1,
            1
          ],
          "documentation": "@param {String} name\r\n@param {String} parameter_name\r\n@param {String} parameter_value\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_log_event_string",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_analytics_log_event_string",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_analytics_log_event_number",
          "argCount": 3,
          "args": [
            1,
            1,
            2
          ],
          "documentation": "@param {String} name\r\n@param {String} parameter_name\r\n@param {Real} parameter_value\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_log_event_number",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_analytics_log_event_number",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_analytics_log_event_params",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_log_event_params",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_analytics_log_event_params",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_analytics_set_default_event_parameters",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_set_default_event_parameters",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_analytics_set_default_event_parameters",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_analytics_log_apple_transaction",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_log_apple_transaction",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_analytics_log_apple_transaction",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_analytics_set_user_property",
          "argCount": 2,
          "args": [
            1,
            1
          ],
          "documentation": "@param {String} name\r\n@param {String} value\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_set_user_property",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_analytics_set_user_property",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_analytics_set_user_id",
          "argCount": 1,
          "args": [
            1
          ],
          "documentation": "@param {String} user_id\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_set_user_id",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_analytics_set_user_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_analytics_set_session_timeout_duration",
          "argCount": 1,
          "args": [
            2
          ],
          "documentation": "@param {Real} milliseconds\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_set_session_timeout_duration",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_analytics_set_session_timeout_duration",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_analytics_reset_analytics_data",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_reset_analytics_data",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_analytics_reset_analytics_data",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_analytics_get_analytics_instance_id",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_get_analytics_instance_id",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_analytics_get_analytics_instance_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_analytics_get_session_id",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_get_session_id",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_analytics_get_session_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_analytics_notify_app_lifecycle_termination",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_notify_app_lifecycle_termination",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_analytics_notify_app_lifecycle_termination",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_analytics_is_desktop_initialized",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_is_desktop_initialized",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_analytics_is_desktop_initialized",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_analytics_set_desktop_debug_mode",
          "argCount": 1,
          "args": [
            2
          ],
          "documentation": "@param {Real} enabled\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_set_desktop_debug_mode",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_analytics_set_desktop_debug_mode",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_analytics_set_log_callback",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_set_log_callback",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_analytics_set_log_callback",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_analytics_initiate_on_device_conversion_measurement_email",
          "argCount": 1,
          "args": [
            1
          ],
          "documentation": "@param {String} email_address\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_email",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_analytics_initiate_on_device_conversion_measurement_email",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_analytics_initiate_on_device_conversion_measurement_phone",
          "argCount": 1,
          "args": [
            1
          ],
          "documentation": "@param {String} phone_number\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_phone",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_analytics_initiate_on_device_conversion_measurement_phone",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_app_check_set_provider_factory",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_app_check_set_provider_factory",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_app_check_set_provider_factory",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_app_check_debug_provider_set_debug_token",
          "argCount": 1,
          "args": [
            1
          ],
          "documentation": "@param {String} token\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_app_check_debug_provider_set_debug_token",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_app_check_debug_provider_set_debug_token",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_app_check_get_instance",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_app_check_get_instance",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_app_check_get_instance",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_app_check_get_instance_for_app",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_app_check_get_instance_for_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_app_check_get_instance_for_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_app_check_get_app",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_app_check_get_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_app_check_get_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_app_check_set_token_auto_refresh_enabled",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_app_check_set_token_auto_refresh_enabled",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_app_check_set_token_auto_refresh_enabled",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_app_check_get_token",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_app_check_get_token",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_app_check_get_token",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_app_check_get_limited_use_token",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_app_check_get_limited_use_token",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_app_check_get_limited_use_token",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_app_check_add_listener",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_app_check_add_listener",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_app_check_add_listener",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_app_check_remove_listener",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_app_check_remove_listener",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_app_check_remove_listener",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_installations_get_instance",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_installations_get_instance",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_installations_get_instance",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_installations_get_instance_for_app",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_installations_get_instance_for_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_installations_get_instance_for_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_installations_get_app",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_installations_get_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_installations_get_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_installations_get_id",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_installations_get_id",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_installations_get_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_installations_get_token",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_installations_get_token",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_installations_get_token",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_installations_delete",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_installations_delete",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_installations_delete",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_get_auth",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_get_auth",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_get_auth",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_language_code",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_language_code",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_language_code",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_set_language_code",
          "argCount": 1,
          "args": [
            1
          ],
          "documentation": "@param {String} language_code\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_set_language_code",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_set_language_code",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_use_app_language",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_use_app_language",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_use_app_language",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_use_emulator",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {String} host\r\n@param {Real} port\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_use_emulator",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_use_emulator",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_current_user",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_current_user",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_current_user",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_sign_out",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_sign_out",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_sign_out",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_fetch_providers_for_email",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_fetch_providers_for_email",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_fetch_providers_for_email",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_sign_in_with_custom_token",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_sign_in_with_custom_token",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_sign_in_with_custom_token",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_sign_in_with_credential",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_sign_in_with_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_sign_in_with_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_sign_in_and_retrieve_data_with_credential",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_sign_in_and_retrieve_data_with_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_sign_in_and_retrieve_data_with_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_sign_in_anonymously",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_sign_in_anonymously",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_sign_in_anonymously",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_sign_in_with_email_and_password",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_sign_in_with_email_and_password",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_sign_in_with_email_and_password",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_create_user_with_email_and_password",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_create_user_with_email_and_password",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_create_user_with_email_and_password",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_send_password_reset_email",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_send_password_reset_email",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_send_password_reset_email",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_add_state_listener",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_add_state_listener",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_add_state_listener",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_remove_state_listener",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_remove_state_listener",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_remove_state_listener",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_add_id_token_listener",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_add_id_token_listener",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_add_id_token_listener",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_remove_id_token_listener",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_remove_id_token_listener",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_remove_id_token_listener",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_credential_provider",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_credential_provider",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_credential_provider",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_credential_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_credential_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_credential_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_credential_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_credential_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_credential_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_email_auth_provider_get_credential",
          "argCount": 4,
          "args": [
            1,
            1,
            1,
            2
          ],
          "documentation": "@param {String} email\r\n@param {String} password\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_email_auth_provider_get_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_email_auth_provider_get_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_facebook_auth_provider_get_credential",
          "argCount": 3,
          "args": [
            1,
            1,
            2
          ],
          "documentation": "@param {String} access_token\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_facebook_auth_provider_get_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_facebook_auth_provider_get_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_game_center_auth_provider_get_credential",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_game_center_auth_provider_get_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_game_center_auth_provider_get_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_game_center_auth_provider_is_player_authenticated",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_game_center_auth_provider_is_player_authenticated",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_game_center_auth_provider_is_player_authenticated",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_github_auth_provider_get_credential",
          "argCount": 3,
          "args": [
            1,
            1,
            2
          ],
          "documentation": "@param {String} token\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_github_auth_provider_get_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_github_auth_provider_get_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_google_auth_provider_get_credential",
          "argCount": 4,
          "args": [
            1,
            1,
            1,
            2
          ],
          "documentation": "@param {String} id_token\r\n@param {String} access_token\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_google_auth_provider_get_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_google_auth_provider_get_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_oauth_provider_get_credential",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_oauth_provider_get_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_oauth_provider_get_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_oauth_provider_get_credential_with_nonce",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_oauth_provider_get_credential_with_nonce",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_oauth_provider_get_credential_with_nonce",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_play_games_auth_provider_get_credential",
          "argCount": 3,
          "args": [
            1,
            1,
            2
          ],
          "documentation": "@param {String} server_auth_code\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_play_games_auth_provider_get_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_play_games_auth_provider_get_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_twitter_auth_provider_get_credential",
          "argCount": 4,
          "args": [
            1,
            1,
            1,
            2
          ],
          "documentation": "@param {String} token\r\n@param {String} secret\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_twitter_auth_provider_get_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_twitter_auth_provider_get_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_phone_verify_phone_number",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_phone_verify_phone_number",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_phone_verify_phone_number",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_phone_get_credential",
          "argCount": 4,
          "args": [
            1,
            1,
            1,
            2
          ],
          "documentation": "@param {String} verification_id\r\n@param {String} verification_code\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_phone_get_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_phone_get_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_phone_credential_sms_code",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_phone_credential_sms_code",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_phone_credential_sms_code",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_phone_resending_token_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_phone_resending_token_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_phone_resending_token_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_phone_listener_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_phone_listener_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_phone_listener_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_get_info",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_get_info",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_get_info",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_get_token",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_get_token",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_get_token",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_update_password",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_update_password",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_update_password",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_update_profile",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_update_profile",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_update_profile",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_send_email_verification",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_send_email_verification",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_send_email_verification",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_send_email_verification_before_updating_email",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_send_email_verification_before_updating_email",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_send_email_verification_before_updating_email",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_reauthenticate",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_reauthenticate",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_reauthenticate",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_reauthenticate_and_retrieve_data",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_reauthenticate_and_retrieve_data",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_reauthenticate_and_retrieve_data",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_link_with_credential",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_link_with_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_link_with_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_unlink",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_unlink",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_unlink",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_reload",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_reload",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_reload",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_delete",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_delete",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_delete",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_get_instance",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_get_instance",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_get_instance",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_get_instance_for_url",
          "argCount": 3,
          "args": [
            1,
            1,
            2
          ],
          "documentation": "@param {String} url\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_get_instance_for_url",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_get_instance_for_url",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_get_url",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_database_get_url",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_get_url",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_get_reference",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_get_reference",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_get_reference",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_get_reference_at_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_get_reference_at_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_get_reference_at_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_get_reference_from_url",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_get_reference_from_url",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_get_reference_from_url",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_go_offline",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_go_offline",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_go_offline",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_go_online",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_go_online",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_go_online",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_purge_outstanding_writes",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_purge_outstanding_writes",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_purge_outstanding_writes",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_set_persistence_enabled",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_set_persistence_enabled",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_set_persistence_enabled",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_set_log_level",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_set_log_level",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_set_log_level",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_get_log_level",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_get_log_level",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_get_log_level",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_order_by_child",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_order_by_child",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_order_by_child",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_order_by_key",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_order_by_key",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_order_by_key",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_order_by_value",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_order_by_value",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_order_by_value",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_order_by_priority",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_order_by_priority",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_order_by_priority",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_start_at",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_start_at",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_start_at",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_start_at_key",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_start_at_key",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_start_at_key",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_end_at",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_end_at",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_end_at",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_end_at_key",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_end_at_key",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_end_at_key",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_equal_to",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_equal_to",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_equal_to",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_equal_to_key",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_equal_to_key",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_equal_to_key",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_limit_to_first",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_limit_to_first",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_limit_to_first",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_limit_to_last",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_limit_to_last",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_limit_to_last",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_get_reference",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_get_reference",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_get_reference",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_set_keep_synchronized",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_set_keep_synchronized",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_set_keep_synchronized",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_get_value",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_get_value",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_get_value",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_add_value_listener",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_add_value_listener",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_add_value_listener",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_remove_value_listener",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_remove_value_listener",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_remove_value_listener",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_remove_all_value_listeners",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_remove_all_value_listeners",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_remove_all_value_listeners",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_add_child_listener",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_add_child_listener",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_add_child_listener",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_remove_child_listener",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_remove_child_listener",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_remove_child_listener",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_remove_all_child_listeners",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_remove_all_child_listeners",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_remove_all_child_listeners",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_query_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_query_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_query_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_ref_get",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_ref_get",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_ref_get",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_ref_child",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_ref_child",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_ref_child",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_ref_push",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_ref_push",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_ref_push",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_ref_go_online",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_ref_go_online",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_ref_go_online",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_ref_go_offline",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_ref_go_offline",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_ref_go_offline",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_ref_set_value",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_ref_set_value",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_ref_set_value",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_ref_set_priority",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_ref_set_priority",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_ref_set_priority",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_ref_set_value_and_priority",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_ref_set_value_and_priority",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_ref_set_value_and_priority",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_ref_update_children",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_ref_update_children",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_ref_update_children",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_ref_remove_value",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_ref_remove_value",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_ref_remove_value",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_ref_run_transaction",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_ref_run_transaction",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_ref_run_transaction",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_ref_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_ref_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_ref_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_snapshot_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_snapshot_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_snapshot_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_snapshot_child",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_snapshot_child",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_snapshot_child",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_snapshot_has_child",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_snapshot_has_child",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_snapshot_has_child",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_snapshot_get_children",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_snapshot_get_children",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_snapshot_get_children",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_snapshot_get_reference",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_snapshot_get_reference",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_snapshot_get_reference",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_snapshot_get_info",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_snapshot_get_info",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_snapshot_get_info",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_snapshot_get_value",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_snapshot_get_value",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_snapshot_get_value",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_snapshot_get_priority",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_snapshot_get_priority",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_snapshot_get_priority",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_snapshot_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_snapshot_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_snapshot_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_mutable_data_get_info",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_mutable_data_get_info",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_mutable_data_get_info",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_mutable_data_child",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_mutable_data_child",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_mutable_data_child",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_mutable_data_has_child",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_mutable_data_has_child",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_mutable_data_has_child",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_mutable_data_get_children",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_mutable_data_get_children",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_mutable_data_get_children",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_mutable_data_get_value",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_mutable_data_get_value",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_mutable_data_get_value",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_mutable_data_get_priority",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_mutable_data_get_priority",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_mutable_data_get_priority",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_mutable_data_set_value",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_mutable_data_set_value",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_mutable_data_set_value",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_mutable_data_set_priority",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_mutable_data_set_priority",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_mutable_data_set_priority",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_transaction_commit",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_transaction_commit",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_transaction_commit",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_transaction_abort",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_transaction_abort",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_transaction_abort",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_get_instance",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_get_instance",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_get_instance",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_get_instance_for_database",
          "argCount": 3,
          "args": [
            1,
            1,
            2
          ],
          "documentation": "@param {String} database_name\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_get_instance_for_database",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_get_instance_for_database",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_settings_get_host",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_firestore_settings_get_host",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_settings_get_host",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_settings_set_host",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_settings_set_host",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_settings_set_host",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_settings_get_ssl_enabled",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_settings_get_ssl_enabled",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_settings_get_ssl_enabled",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_settings_set_ssl_enabled",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_settings_set_ssl_enabled",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_settings_set_ssl_enabled",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_settings_get_persistence_enabled",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_settings_get_persistence_enabled",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_settings_get_persistence_enabled",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_settings_set_persistence_enabled",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_settings_set_persistence_enabled",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_settings_set_persistence_enabled",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_settings_get_cache_size_bytes",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_settings_get_cache_size_bytes",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_settings_get_cache_size_bytes",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_settings_set_cache_size_bytes",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_settings_set_cache_size_bytes",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_settings_set_cache_size_bytes",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_collection",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_collection",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_collection",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_collection_group",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_collection_group",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_collection_group",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_batch",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_batch",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_batch",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_set_log_level",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_set_log_level",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_set_log_level",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_enable_network",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_enable_network",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_enable_network",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_disable_network",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_disable_network",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_disable_network",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_terminate",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_terminate",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_terminate",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_clear_persistence",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_clear_persistence",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_clear_persistence",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_wait_for_pending_writes",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_wait_for_pending_writes",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_wait_for_pending_writes",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_run_transaction",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_run_transaction",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_run_transaction",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_transaction_get",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_transaction_get",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_transaction_get",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_transaction_set",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_transaction_set",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_transaction_set",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_transaction_set_merge",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_transaction_set_merge",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_transaction_set_merge",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_transaction_set_merge_fields",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_transaction_set_merge_fields",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_transaction_set_merge_fields",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_transaction_set_merge_field_paths",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_transaction_set_merge_field_paths",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_transaction_set_merge_field_paths",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_transaction_update",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_transaction_update",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_transaction_update",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_transaction_update_field_paths",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_transaction_update_field_paths",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_transaction_update_field_paths",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_transaction_delete",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_transaction_delete",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_transaction_delete",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_transaction_commit",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_transaction_commit",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_transaction_commit",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_transaction_abort",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_transaction_abort",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_transaction_abort",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_collection_ref_id",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_firestore_collection_ref_id",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_collection_ref_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_collection_ref_path",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_firestore_collection_ref_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_collection_ref_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_collection_ref_parent",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_collection_ref_parent",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_collection_ref_parent",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_collection_ref_document",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_collection_ref_document",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_collection_ref_document",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_collection_ref_document_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_collection_ref_document_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_collection_ref_document_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_collection_ref_add",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_collection_ref_add",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_collection_ref_add",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_collection_ref_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_collection_ref_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_collection_ref_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_collection_ref_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_collection_ref_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_collection_ref_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_ref_id",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_ref_id",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_ref_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_ref_path",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_ref_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_ref_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_ref_parent",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_ref_parent",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_ref_parent",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_ref_collection",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_ref_collection",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_ref_collection",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_ref_get",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_ref_get",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_ref_get",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_ref_set",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_ref_set",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_ref_set",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_ref_set_merge",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_ref_set_merge",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_ref_set_merge",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_ref_set_merge_fields",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_ref_set_merge_fields",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_ref_set_merge_fields",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_ref_update",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_ref_update",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_ref_update",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_ref_delete",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_ref_delete",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_ref_delete",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_ref_add_snapshot_listener",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_ref_add_snapshot_listener",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_ref_add_snapshot_listener",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_ref_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_ref_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_ref_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_ref_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_ref_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_ref_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_where_equal_to",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_where_equal_to",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_where_equal_to",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_where_not_equal_to",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_where_not_equal_to",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_where_not_equal_to",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_where_less_than",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_where_less_than",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_where_less_than",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_where_less_than_or_equal_to",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_where_less_than_or_equal_to",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_where_less_than_or_equal_to",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_where_greater_than",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_where_greater_than",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_where_greater_than",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_where_greater_than_or_equal_to",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_where_greater_than_or_equal_to",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_where_greater_than_or_equal_to",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_where_array_contains",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_where_array_contains",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_where_array_contains",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_where_array_contains_any",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_where_array_contains_any",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_where_array_contains_any",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_where_in",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_where_in",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_where_in",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_where_not_in",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_where_not_in",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_where_not_in",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_order_by",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_order_by",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_order_by",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_limit",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_limit",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_limit",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_limit_to_last",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_limit_to_last",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_limit_to_last",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_start_at_snapshot",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_start_at_snapshot",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_start_at_snapshot",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_start_at_values",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_start_at_values",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_start_at_values",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_start_after_snapshot",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_start_after_snapshot",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_start_after_snapshot",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_start_after_values",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_start_after_values",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_start_after_values",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_end_before_snapshot",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_end_before_snapshot",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_end_before_snapshot",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_end_before_values",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_end_before_values",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_end_before_values",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_end_at_snapshot",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_end_at_snapshot",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_end_at_snapshot",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_end_at_values",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_end_at_values",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_end_at_values",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_get",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_get",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_get",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_add_snapshot_listener",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_add_snapshot_listener",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_add_snapshot_listener",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_write_batch_set",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_write_batch_set",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_write_batch_set",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_write_batch_set_merge",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_write_batch_set_merge",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_write_batch_set_merge",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_write_batch_set_merge_fields",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_write_batch_set_merge_fields",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_write_batch_set_merge_fields",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_write_batch_update",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_write_batch_update",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_write_batch_update",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_write_batch_delete",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_write_batch_delete",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_write_batch_delete",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_write_batch_commit",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_write_batch_commit",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_write_batch_commit",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_write_batch_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_write_batch_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_write_batch_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_delete",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_delete",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_delete",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_server_timestamp",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_server_timestamp",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_server_timestamp",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_array_union",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_array_union",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_array_union",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_array_remove",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_array_remove",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_array_remove",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_increment_integer",
          "argCount": 3,
          "args": [
            2,
            1,
            2
          ],
          "documentation": "@param {Real} value\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_increment_integer",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_increment_integer",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_increment_double",
          "argCount": 3,
          "args": [
            2,
            1,
            2
          ],
          "documentation": "@param {Real} value\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_increment_double",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_increment_double",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_integer",
          "argCount": 3,
          "args": [
            2,
            1,
            2
          ],
          "documentation": "@param {Real} value\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_integer",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_integer",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_double",
          "argCount": 3,
          "args": [
            2,
            1,
            2
          ],
          "documentation": "@param {Real} value\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_double",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_double",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_timestamp",
          "argCount": 4,
          "args": [
            2,
            2,
            1,
            2
          ],
          "documentation": "@param {Real} seconds\r\n@param {Real} nanoseconds\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_timestamp",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_timestamp",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_geo_point",
          "argCount": 4,
          "args": [
            2,
            2,
            1,
            2
          ],
          "documentation": "@param {Real} latitude\r\n@param {Real} longitude\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_geo_point",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_geo_point",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_reference",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_reference",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_reference",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_blob",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_blob",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_blob",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_null",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_null",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_null",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_snapshot_get_info",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_snapshot_get_info",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_snapshot_get_info",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_snapshot_get",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_snapshot_get",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_snapshot_get",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_snapshot_get_data",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_snapshot_get_data",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_snapshot_get_data",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_snapshot_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_snapshot_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_snapshot_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_snapshot_get_info",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_snapshot_get_info",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_snapshot_get_info",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_snapshot_documents",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_snapshot_documents",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_snapshot_documents",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_snapshot_document_changes",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_snapshot_document_changes",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_snapshot_document_changes",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_snapshot_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_snapshot_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_snapshot_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_listener_registration_remove",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_listener_registration_remove",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_listener_registration_remove",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_get_instance",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_get_instance",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_get_instance",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_get_instance_with_url",
          "argCount": 3,
          "args": [
            1,
            1,
            2
          ],
          "documentation": "@param {String} url\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_get_instance_with_url",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_get_instance_with_url",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_url",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_storage_url",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_url",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_get_reference",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_get_reference",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_get_reference",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_get_reference_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_get_reference_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_get_reference_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_get_reference_from_url",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_get_reference_from_url",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_get_reference_from_url",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_max_download_retry_time",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_max_download_retry_time",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_max_download_retry_time",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_set_max_download_retry_time",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_set_max_download_retry_time",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_set_max_download_retry_time",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_max_upload_retry_time",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_max_upload_retry_time",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_max_upload_retry_time",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_set_max_upload_retry_time",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_set_max_upload_retry_time",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_set_max_upload_retry_time",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_max_operation_retry_time",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_max_operation_retry_time",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_max_operation_retry_time",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_set_max_operation_retry_time",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_set_max_operation_retry_time",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_set_max_operation_retry_time",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_use_emulator",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_use_emulator",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_use_emulator",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_ref_child",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_ref_child",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_ref_child",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_ref_get_parent",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_ref_get_parent",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_ref_get_parent",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_ref_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_ref_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_ref_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_ref_bucket",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_storage_ref_bucket",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_ref_bucket",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_ref_full_path",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_storage_ref_full_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_ref_full_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_ref_name",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_storage_ref_name",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_ref_name",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_ref_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_ref_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_ref_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_ref_storage",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_ref_storage",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_ref_storage",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_ref_delete",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_ref_delete",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_ref_delete",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_ref_get_download_url",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_ref_get_download_url",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_ref_get_download_url",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_ref_get_metadata",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_ref_get_metadata",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_ref_get_metadata",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_ref_update_metadata",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_ref_update_metadata",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_ref_update_metadata",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_ref_put_bytes",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_ref_put_bytes",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_ref_put_bytes",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_ref_put_file",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_ref_put_file",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_ref_put_file",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_ref_get_bytes",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_ref_get_bytes",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_ref_get_bytes",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_download_copy",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_download_copy",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_download_copy",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_download_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_download_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_download_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_ref_get_file",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_ref_get_file",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_ref_get_file",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_ref_list",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_ref_list",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_ref_list",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_create",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_create",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_create",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_bucket",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_bucket",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_bucket",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_cache_control",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_cache_control",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_cache_control",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_set_cache_control",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_set_cache_control",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_set_cache_control",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_content_disposition",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_content_disposition",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_content_disposition",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_set_content_disposition",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_set_content_disposition",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_set_content_disposition",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_content_encoding",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_content_encoding",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_content_encoding",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_set_content_encoding",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_set_content_encoding",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_set_content_encoding",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_content_language",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_content_language",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_content_language",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_set_content_language",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_set_content_language",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_set_content_language",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_content_type",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_content_type",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_content_type",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_set_content_type",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_set_content_type",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_set_content_type",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_creation_time",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_creation_time",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_creation_time",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_generation",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_generation",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_generation",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_metadata_generation",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_metadata_generation",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_metadata_generation",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_name",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_name",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_name",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_path",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_get_reference",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_get_reference",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_get_reference",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_size_bytes",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_size_bytes",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_size_bytes",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_updated_time",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_updated_time",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_updated_time",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_custom_metadata_count",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_custom_metadata_count",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_custom_metadata_count",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_custom_metadata_key_at",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_custom_metadata_key_at",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_custom_metadata_key_at",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_get_custom_metadata",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_get_custom_metadata",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_get_custom_metadata",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_set_custom_metadata",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_set_custom_metadata",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_set_custom_metadata",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_controller_create",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_controller_create",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_controller_create",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_controller_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_controller_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_controller_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_controller_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_controller_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_controller_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_controller_pause",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_controller_pause",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_controller_pause",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_controller_resume",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_controller_resume",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_controller_resume",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_controller_cancel",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_controller_cancel",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_controller_cancel",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_controller_is_paused",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_controller_is_paused",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_controller_is_paused",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_controller_bytes_transferred",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_controller_bytes_transferred",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_controller_bytes_transferred",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_controller_total_byte_count",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_controller_total_byte_count",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_controller_total_byte_count",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_controller_get_reference",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_controller_get_reference",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_controller_get_reference",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_list_result_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_list_result_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_list_result_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_list_result_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_list_result_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_list_result_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_list_result_item_count",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_list_result_item_count",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_list_result_item_count",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_list_result_item_at",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_list_result_item_at",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_list_result_item_at",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_list_result_prefix_count",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_list_result_prefix_count",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_list_result_prefix_count",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_list_result_prefix_at",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_list_result_prefix_at",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_list_result_prefix_at",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_list_result_next_page_token",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_storage_list_result_next_page_token",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_list_result_next_page_token",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_functions_get_instance",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_functions_get_instance",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_functions_get_instance",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_functions_get_instance_with_region",
          "argCount": 3,
          "args": [
            1,
            1,
            2
          ],
          "documentation": "@param {String} region\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_functions_get_instance_with_region",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_functions_get_instance_with_region",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_functions_use_functions_emulator",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_functions_use_functions_emulator",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_functions_use_functions_emulator",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_functions_get_https_callable",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_functions_get_https_callable",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_functions_get_https_callable",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_functions_get_https_callable_from_url",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_functions_get_https_callable_from_url",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_functions_get_https_callable_from_url",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_functions_callable_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_functions_callable_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_functions_callable_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_functions_callable_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_functions_callable_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_functions_callable_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_functions_callable_call",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_functions_callable_call",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_functions_callable_call",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_functions_callable_call_with_data",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_functions_callable_call_with_data",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_functions_callable_call_with_data",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_get_instance",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_get_instance",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_get_instance",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_ensure_initialized",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_ensure_initialized",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_ensure_initialized",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_set_config_settings",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_set_config_settings",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_set_config_settings",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_get_config_settings_fetch_timeout",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_get_config_settings_fetch_timeout",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_get_config_settings_fetch_timeout",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_get_config_settings_minimum_fetch_interval",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_get_config_settings_minimum_fetch_interval",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_get_config_settings_minimum_fetch_interval",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_fetch",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_fetch",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_fetch",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_fetch_with_expiration",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_fetch_with_expiration",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_fetch_with_expiration",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_fetch_and_activate",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_fetch_and_activate",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_fetch_and_activate",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_activate",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_activate",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_activate",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_get_boolean",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_get_boolean",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_get_boolean",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_get_long",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_get_long",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_get_long",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_get_double",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_get_double",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_get_double",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_get_string",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_get_string",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_get_string",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_get_data_size",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_get_data_size",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_get_data_size",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_get_data",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_get_data",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_get_data",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_get_keys_by_prefix",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_get_keys_by_prefix",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_get_keys_by_prefix",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_get_keys",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_get_keys",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_get_keys",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_get_all",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_get_all",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_get_all",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_set_defaults",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_set_defaults",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_set_defaults",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_set_custom_signals",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_set_custom_signals",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_set_custom_signals",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_get_info",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_get_info",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_get_info",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_add_config_update_listener",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_add_config_update_listener",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_add_config_update_listener",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_remove_config_update_listener",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_remove_config_update_listener",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_remove_config_update_listener",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_messaging_initialize",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_initialize",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_messaging_initialize",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_messaging_terminate",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_terminate",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_messaging_terminate",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_messaging_set_registration_on_init_enabled",
          "argCount": 1,
          "args": [
            2
          ],
          "documentation": "@param {Real} enabled\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_set_registration_on_init_enabled",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_messaging_set_registration_on_init_enabled",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_messaging_is_registration_on_init_enabled",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_is_registration_on_init_enabled",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_messaging_is_registration_on_init_enabled",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_messaging_set_token_registration_on_init_enabled",
          "argCount": 1,
          "args": [
            2
          ],
          "documentation": "@param {Real} enabled\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_set_token_registration_on_init_enabled",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_messaging_set_token_registration_on_init_enabled",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_messaging_is_token_registration_on_init_enabled",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_is_token_registration_on_init_enabled",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_messaging_is_token_registration_on_init_enabled",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_messaging_delivery_metrics_export_to_big_query_enabled",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_delivery_metrics_export_to_big_query_enabled",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_messaging_delivery_metrics_export_to_big_query_enabled",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_messaging_set_delivery_metrics_export_to_big_query",
          "argCount": 1,
          "args": [
            2
          ],
          "documentation": "@param {Real} enabled\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_set_delivery_metrics_export_to_big_query",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_messaging_set_delivery_metrics_export_to_big_query",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_messaging_request_permission",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_request_permission",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_messaging_request_permission",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_messaging_register",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_register",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_messaging_register",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_messaging_unregister",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_unregister",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_messaging_unregister",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_messaging_get_token",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_get_token",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_messaging_get_token",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_messaging_delete_token",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_delete_token",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_messaging_delete_token",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_messaging_subscribe",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_subscribe",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_messaging_subscribe",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_messaging_unsubscribe",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_unsubscribe",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_messaging_unsubscribe",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_messaging_set_message_callback",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_set_message_callback",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_messaging_set_message_callback",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_messaging_set_registration_callback",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_set_registration_callback",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_messaging_set_registration_callback",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_messaging_set_unregistration_callback",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_set_unregistration_callback",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_messaging_set_unregistration_callback",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_messaging_raw_data_copy",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_raw_data_copy",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_messaging_raw_data_copy",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_messaging_raw_data_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_raw_data_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_messaging_raw_data_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_ump_get_instance",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_ump_get_instance",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_ump_get_instance",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_ump_get_consent_status",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_ump_get_consent_status",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_ump_get_consent_status",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_ump_get_consent_form_status",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_ump_get_consent_form_status",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_ump_get_consent_form_status",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_ump_get_privacy_options_requirement_status",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_ump_get_privacy_options_requirement_status",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_ump_get_privacy_options_requirement_status",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_ump_can_request_ads",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_ump_can_request_ads",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_ump_can_request_ads",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_ump_reset",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_ump_reset",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_ump_reset",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_ump_request_consent_info_update",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_ump_request_consent_info_update",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_ump_request_consent_info_update",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_ump_load_consent_form",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_ump_load_consent_form",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_ump_load_consent_form",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_ump_show_consent_form",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_ump_show_consent_form",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_ump_show_consent_form",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_ump_load_and_show_consent_form_if_required",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_ump_load_and_show_consent_form_if_required",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_ump_load_and_show_consent_form_if_required",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_ump_show_privacy_options_form",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_ump_show_privacy_options_form",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_ump_show_privacy_options_form",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_analytics_notify_app_lifecycle_change",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_notify_app_lifecycle_change",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_analytics_notify_app_lifecycle_change",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_analytics_initiate_on_device_conversion_measurement_hashed_email",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_hashed_email",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_analytics_initiate_on_device_conversion_measurement_hashed_email",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_federated_oauth_provider_create",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_federated_oauth_provider_create",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_federated_oauth_provider_create",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_federated_oauth_provider_set_data",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_federated_oauth_provider_set_data",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_federated_oauth_provider_set_data",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_federated_oauth_provider_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_federated_oauth_provider_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_federated_oauth_provider_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_sign_in_with_provider",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_sign_in_with_provider",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_sign_in_with_provider",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_provider_data",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_provider_data",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_provider_data",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_reauthenticate_with_provider",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_reauthenticate_with_provider",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_reauthenticate_with_provider",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_link_with_provider",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_link_with_provider",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_link_with_provider",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_update_phone_number_credential",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_update_phone_number_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_update_phone_number_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_ref_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_ref_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_ref_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_ref_get_parent",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_ref_get_parent",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_ref_get_parent",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_ref_get_root",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_ref_get_root",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_ref_get_root",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_ref_get_database",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_ref_get_database",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_ref_get_database",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_server_timestamp",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_server_timestamp",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_server_timestamp",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_ref_on_disconnect",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_ref_on_disconnect",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_ref_on_disconnect",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_on_disconnect_cancel",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_on_disconnect_cancel",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_on_disconnect_cancel",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_on_disconnect_remove_value",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_on_disconnect_remove_value",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_on_disconnect_remove_value",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_on_disconnect_set_value",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_on_disconnect_set_value",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_on_disconnect_set_value",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_on_disconnect_set_value_and_priority",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_on_disconnect_set_value_and_priority",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_on_disconnect_set_value_and_priority",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_on_disconnect_update_children",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_on_disconnect_update_children",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_on_disconnect_update_children",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_on_disconnect_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_on_disconnect_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_on_disconnect_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_path_create",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_path_create",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_path_create",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_path_document_id",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_path_document_id",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_path_document_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_path_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_path_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_path_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_path_to_string",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_path_to_string",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_path_to_string",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_path_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_path_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_path_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_equal_to",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_equal_to",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_equal_to",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_not_equal_to",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_not_equal_to",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_not_equal_to",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_less_than",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_less_than",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_less_than",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_less_than_or_equal_to",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_less_than_or_equal_to",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_less_than_or_equal_to",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_greater_than",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_greater_than",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_greater_than",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_greater_than_or_equal_to",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_greater_than_or_equal_to",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_greater_than_or_equal_to",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_array_contains",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_array_contains",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_array_contains",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_array_contains_any",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_array_contains_any",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_array_contains_any",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_in",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_in",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_in",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_not_in",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_not_in",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_not_in",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_equal_to_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_equal_to_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_equal_to_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_not_equal_to_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_not_equal_to_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_not_equal_to_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_less_than_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_less_than_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_less_than_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_less_than_or_equal_to_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_less_than_or_equal_to_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_less_than_or_equal_to_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_greater_than_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_greater_than_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_greater_than_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_greater_than_or_equal_to_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_greater_than_or_equal_to_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_greater_than_or_equal_to_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_array_contains_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_array_contains_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_array_contains_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_array_contains_any_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_array_contains_any_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_array_contains_any_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_in_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_in_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_in_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_not_in_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_not_in_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_not_in_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_and",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_and",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_and",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_or",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_or",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_or",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_filter_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_filter_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_filter_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_where_filter",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_where_filter",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_where_filter",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_where_equal_to_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_where_equal_to_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_where_equal_to_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_where_not_equal_to_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_where_not_equal_to_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_where_not_equal_to_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_where_less_than_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_where_less_than_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_where_less_than_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_where_less_than_or_equal_to_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_where_less_than_or_equal_to_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_where_less_than_or_equal_to_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_where_greater_than_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_where_greater_than_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_where_greater_than_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_where_greater_than_or_equal_to_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_where_greater_than_or_equal_to_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_where_greater_than_or_equal_to_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_where_array_contains_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_where_array_contains_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_where_array_contains_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_where_array_contains_any_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_where_array_contains_any_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_where_array_contains_any_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_where_in_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_where_in_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_where_in_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_where_not_in_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_where_not_in_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_where_not_in_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_order_by_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_order_by_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_order_by_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_count",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_count",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_count",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_aggregate_query_get_query",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_aggregate_query_get_query",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_aggregate_query_get_query",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_aggregate_query_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_aggregate_query_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_aggregate_query_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_aggregate_query_get",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_aggregate_query_get",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_aggregate_query_get",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_aggregate_query_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_aggregate_query_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_aggregate_query_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_aggregate_snapshot_count",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_aggregate_snapshot_count",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_aggregate_snapshot_count",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_aggregate_snapshot_get_query",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_aggregate_snapshot_get_query",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_aggregate_snapshot_get_query",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_aggregate_snapshot_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_aggregate_snapshot_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_aggregate_snapshot_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_aggregate_snapshot_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_aggregate_snapshot_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_aggregate_snapshot_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_add_snapshots_in_sync_listener",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_add_snapshots_in_sync_listener",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_add_snapshots_in_sync_listener",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_load_bundle",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_load_bundle",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_load_bundle",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_named_query",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_named_query",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_named_query",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_ref_set_merge_field_paths",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_ref_set_merge_field_paths",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_ref_set_merge_field_paths",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_write_batch_set_merge_field_paths",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_write_batch_set_merge_field_paths",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_write_batch_set_merge_field_paths",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_metadata_md5_hash",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_storage_metadata_md5_hash",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_metadata_md5_hash",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_ensure_initialized_info",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_ensure_initialized_info",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_ensure_initialized_info",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_get_boolean_with_info",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_get_boolean_with_info",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_get_boolean_with_info",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_get_long_with_info",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_get_long_with_info",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_get_long_with_info",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_get_double_with_info",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_get_double_with_info",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_get_double_with_info",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_get_string_with_info",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_get_string_with_info",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_get_string_with_info",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_get_data_with_info",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_get_data_with_info",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_get_data_with_info",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_messaging_initialize_with_options",
          "argCount": 1,
          "args": [
            2
          ],
          "documentation": "@param {Real} suppress_notification_permission_prompt\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_initialize_with_options",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_messaging_initialize_with_options",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_type",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_type",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_type",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_is_null",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_is_null",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_is_null",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_is_boolean",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_is_boolean",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_is_boolean",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_is_integer",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_is_integer",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_is_integer",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_is_double",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_is_double",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_is_double",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_is_timestamp",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_is_timestamp",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_is_timestamp",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_is_string",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_is_string",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_is_string",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_is_blob",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_is_blob",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_is_blob",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_is_reference",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_is_reference",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_is_reference",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_is_geo_point",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_is_geo_point",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_is_geo_point",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_is_array",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_is_array",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_is_array",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_is_map",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_is_map",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_is_map",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_boolean_value",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_boolean_value",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_boolean_value",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_integer_value",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_integer_value",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_integer_value",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_double_value",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_double_value",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_double_value",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_string_value",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_string_value",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_string_value",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_blob_size",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_blob_size",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_blob_size",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_blob_copy",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_blob_copy",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_blob_copy",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_reference_value",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_reference_value",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_reference_value",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_timestamp_value",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_timestamp_value",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_timestamp_value",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_geo_point_value",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_geo_point_value",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_geo_point_value",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_array_value",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_array_value",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_array_value",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_map_value",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_map_value",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_map_value",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_to_string",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_to_string",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_to_string",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_get_firestore",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_get_firestore",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_get_firestore",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_ref_get_firestore",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_ref_get_firestore",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_ref_get_firestore",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_ref_to_string",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_ref_to_string",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_ref_to_string",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_ref_update_field_paths",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_ref_update_field_paths",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_ref_update_field_paths",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_write_batch_update_field_paths",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_write_batch_update_field_paths",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_write_batch_update_field_paths",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_write_batch_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_write_batch_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_write_batch_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_settings_to_string",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_firestore_settings_to_string",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_settings_to_string",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_snapshot_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_snapshot_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_snapshot_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_snapshot_to_string",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_snapshot_to_string",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_snapshot_to_string",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_snapshot_get_field_path",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_snapshot_get_field_path",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_snapshot_get_field_path",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_snapshot_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_snapshot_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_snapshot_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_snapshot_get_query",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_snapshot_get_query",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_snapshot_get_query",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_listener_registration_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_listener_registration_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_listener_registration_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_app_get_default_handle",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_app_get_default_handle",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_app_get_default_handle",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_app_get_instance",
          "argCount": 3,
          "args": [
            1,
            1,
            2
          ],
          "documentation": "@param {String} name\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_app_get_instance",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_app_get_instance",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_app_get_apps",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_app_get_apps",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_app_get_apps",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_app_initialize_with_options",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_app_initialize_with_options",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_app_initialize_with_options",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_app_initialize_from_json",
          "argCount": 4,
          "args": [
            1,
            1,
            1,
            2
          ],
          "documentation": "@param {String} json_config\r\n@param {String} name\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_app_initialize_from_json",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_app_initialize_from_json",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_app_handle_get_name",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_app_handle_get_name",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_app_handle_get_name",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_app_handle_get_options",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_app_handle_get_options",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_app_handle_get_options",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_app_get_default_options",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_app_get_default_options",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_app_get_default_options",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_app_release_handle",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_app_release_handle",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_app_release_handle",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_set_log_level",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_set_log_level",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_set_log_level",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_get_log_level",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_get_log_level",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_get_log_level",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_get_app",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_get_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_get_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_get_app",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_get_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_get_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_get_instance_for_app",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_get_instance_for_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_get_instance_for_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_database_get_instance_for_app_url",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_database_get_instance_for_app_url",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_database_get_instance_for_app_url",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_get_app",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_get_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_get_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_get_instance_for_app",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_get_instance_for_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_get_instance_for_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_get_instance_for_app_database",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_get_instance_for_app_database",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_get_instance_for_app_database",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_get_app",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_get_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_get_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_get_instance_for_app",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_get_instance_for_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_get_instance_for_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_storage_get_instance_for_app_url",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_storage_get_instance_for_app_url",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_storage_get_instance_for_app_url",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_functions_get_app",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_functions_get_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_functions_get_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_functions_callable_get_functions",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_functions_callable_get_functions",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_functions_callable_get_functions",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_functions_get_instance_for_app",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_functions_get_instance_for_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_functions_get_instance_for_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_functions_get_instance_for_app_region",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_functions_get_instance_for_app_region",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_functions_get_instance_for_app_region",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_get_app",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_get_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_get_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_boolean",
          "argCount": 3,
          "args": [
            2,
            1,
            2
          ],
          "documentation": "@param {Real} value\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_boolean",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_boolean",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_string",
          "argCount": 3,
          "args": [
            1,
            1,
            2
          ],
          "documentation": "@param {String} value\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_string",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_string",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_array",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_array",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_array",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_field_value_map",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_field_value_map",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_field_value_map",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_remote_config_get_instance_for_app",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_remote_config_get_instance_for_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_remote_config_get_instance_for_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_analytics_initialize_for_app",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_analytics_initialize_for_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_analytics_initialize_for_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_messaging_initialize_for_app",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_initialize_for_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_messaging_initialize_for_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_messaging_initialize_for_app_with_options",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_messaging_initialize_for_app_with_options",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_messaging_initialize_for_app_with_options",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_ump_get_instance_for_app",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_ump_get_instance_for_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_ump_get_instance_for_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_get_current_instance_handle",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_get_current_instance_handle",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_get_current_instance_handle",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_get_instance_for_app",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_get_instance_for_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_get_instance_for_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_use_instance",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_use_instance",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_use_instance",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_instance_get_app",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_instance_get_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_instance_get_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_snapshot_metadata_to_string",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_snapshot_metadata_to_string",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_snapshot_metadata_to_string",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_query_snapshot_metadata_to_string",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_firestore_query_snapshot_metadata_to_string",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_query_snapshot_metadata_to_string",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_get_sdk_version",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_get_sdk_version",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_get_sdk_version",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_firestore_document_snapshot_reference",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_firestore_document_snapshot_reference",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_firestore_document_snapshot_reference",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_email_auth_provider_id",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_email_auth_provider_id",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_email_auth_provider_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_facebook_auth_provider_id",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_facebook_auth_provider_id",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_facebook_auth_provider_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_game_center_auth_provider_id",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_game_center_auth_provider_id",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_game_center_auth_provider_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_github_auth_provider_id",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_github_auth_provider_id",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_github_auth_provider_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_google_auth_provider_id",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_google_auth_provider_id",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_google_auth_provider_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_microsoft_auth_provider_id",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_microsoft_auth_provider_id",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_microsoft_auth_provider_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_play_games_auth_provider_id",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_play_games_auth_provider_id",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_play_games_auth_provider_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_twitter_auth_provider_id",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_twitter_auth_provider_id",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_twitter_auth_provider_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_yahoo_auth_provider_id",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_yahoo_auth_provider_id",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_yahoo_auth_provider_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_game_center_auth_provider_get_credential_last_result",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_game_center_auth_provider_get_credential_last_result",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_game_center_auth_provider_get_credential_last_result",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__GMFirebase_invocation_handler",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _buffer_ptr\r\n@param {Real} _buffer_size",
          "externalName": "__EXT_NATIVE__GMFirebase_invocation_handler",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__GMFirebase_invocation_handler",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__GMFirebase_queue_buffer",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _buffer_ptr\r\n@param {Real} _buffer_size",
          "externalName": "__EXT_NATIVE__GMFirebase_queue_buffer",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__GMFirebase_queue_buffer",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        }
      ],
      "init": "",
      "kind": 4,
      "name": "",
      "origname": "",
      "ProxyFiles": [
        {
          "$GMProxyFile": "",
          "%Name": "GMFirebase.dll",
          "name": "GMFirebase.dll",
          "resourceType": "GMProxyFile",
          "resourceVersion": "2.0",
          "TargetMask": 6
        },
        {
          "$GMProxyFile": "",
          "%Name": "libGMFirebase.so",
          "name": "libGMFirebase.so",
          "resourceType": "GMProxyFile",
          "resourceVersion": "2.0",
          "TargetMask": 7
        },
        {
          "$GMProxyFile": "",
          "%Name": "libGMFirebase.dylib",
          "name": "libGMFirebase.dylib",
          "resourceType": "GMProxyFile",
          "resourceVersion": "2.0",
          "TargetMask": 1
        }
      ],
      "resourceType": "GMExtensionFile",
      "resourceVersion": "2.0",
      "uncompress": false,
      "usesRunnerInterface": false
    }
  ],
  "gradleinject": null,
  "hasConvertedCodeInjection": true,
  "helpfile": "",
  "HTML5CodeInjection": "",
  "html5Props": false,
  "IncludedResources": [],
  "installdir": "",
  "iosCocoaPodDependencies": "",
  "iosCocoaPods": "",
  "ioscodeinjection": "\u003CYYIosCocoaPods\u003E\npod \u0027FirebaseCore\u0027, \u002712.19.0\u0027\n\npod \u0027FirebaseAnalytics\u0027, \u002712.19.0\u0027\npod \u0027FirebaseAppCheck\u0027, \u002712.19.0\u0027\npod \u0027FirebaseAuth\u0027, \u002712.19.0\u0027\npod \u0027FirebaseDatabase\u0027, \u002712.19.0\u0027\npod \u0027FirebaseFirestore\u0027, \u002712.19.0\u0027\npod \u0027FirebaseFunctions\u0027, \u002712.19.0\u0027\npod \u0027FirebaseInstallations\u0027, \u002712.19.0\u0027\npod \u0027FirebaseMessaging\u0027, \u002712.19.0\u0027\npod \u0027FirebaseRemoteConfig\u0027, \u002712.19.0\u0027\npod \u0027FirebaseStorage\u0027, \u002712.19.0\u0027\n\npod \u0027GoogleUserMessagingPlatform\u0027, \u00272.3.0\u0027\n\u003C/YYIosCocoaPods\u003E\n\n\n\u003CYYIosPlist\u003E\n\n    \u003CtoExpand condition=\u0027${YYEXTOPT_GMFirebase_disableDataCollection}\u0027\u003E\n        \u003Ckey\u003EFIREBASE_ANALYTICS_COLLECTION_ENABLED\u003C/key\u003E\n        \u003Cfalse/\u003E\n        \u003Ckey\u003EFirebaseMessagingAutoInitEnabled\u003C/key\u003E\n        \u003Cfalse/\u003E\n    \u003C/toExpand\u003E\n\n\u003C/YYIosPlist\u003E",
  "iosdelegatename": "",
  "iosplistinject": null,
  "iosProps": true,
  "iosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [
    {
      "$GMExtensionFrameworkEntry": "",
      "%Name": "GMFirebase.xcframework",
      "embed": 0,
      "name": "GMFirebase.xcframework",
      "resourceType": "GMExtensionFrameworkEntry",
      "resourceVersion": "2.0",
      "weakReference": false
    },
    {
      "$GMExtensionFrameworkEntry": "",
      "%Name": "firebase.xcframework",
      "embed": 0,
      "name": "firebase.xcframework",
      "resourceType": "GMExtensionFrameworkEntry",
      "resourceVersion": "2.0",
      "weakReference": false
    },
    {
      "$GMExtensionFrameworkEntry": "",
      "%Name": "firebase_analytics.xcframework",
      "embed": 0,
      "name": "firebase_analytics.xcframework",
      "resourceType": "GMExtensionFrameworkEntry",
      "resourceVersion": "2.0",
      "weakReference": false
    },
    {
      "$GMExtensionFrameworkEntry": "",
      "%Name": "firebase_app_check.xcframework",
      "embed": 0,
      "name": "firebase_app_check.xcframework",
      "resourceType": "GMExtensionFrameworkEntry",
      "resourceVersion": "2.0",
      "weakReference": false
    },
    {
      "$GMExtensionFrameworkEntry": "",
      "%Name": "firebase_auth.xcframework",
      "embed": 0,
      "name": "firebase_auth.xcframework",
      "resourceType": "GMExtensionFrameworkEntry",
      "resourceVersion": "2.0",
      "weakReference": false
    },
    {
      "$GMExtensionFrameworkEntry": "",
      "%Name": "firebase_database.xcframework",
      "embed": 0,
      "name": "firebase_database.xcframework",
      "resourceType": "GMExtensionFrameworkEntry",
      "resourceVersion": "2.0",
      "weakReference": false
    },
    {
      "$GMExtensionFrameworkEntry": "",
      "%Name": "firebase_firestore.xcframework",
      "embed": 0,
      "name": "firebase_firestore.xcframework",
      "resourceType": "GMExtensionFrameworkEntry",
      "resourceVersion": "2.0",
      "weakReference": false
    },
    {
      "$GMExtensionFrameworkEntry": "",
      "%Name": "firebase_functions.xcframework",
      "embed": 0,
      "name": "firebase_functions.xcframework",
      "resourceType": "GMExtensionFrameworkEntry",
      "resourceVersion": "2.0",
      "weakReference": false
    },
    {
      "$GMExtensionFrameworkEntry": "",
      "%Name": "firebase_installations.xcframework",
      "embed": 0,
      "name": "firebase_installations.xcframework",
      "resourceType": "GMExtensionFrameworkEntry",
      "resourceVersion": "2.0",
      "weakReference": false
    },
    {
      "$GMExtensionFrameworkEntry": "",
      "%Name": "firebase_messaging.xcframework",
      "embed": 0,
      "name": "firebase_messaging.xcframework",
      "resourceType": "GMExtensionFrameworkEntry",
      "resourceVersion": "2.0",
      "weakReference": false
    },
    {
      "$GMExtensionFrameworkEntry": "",
      "%Name": "firebase_remote_config.xcframework",
      "embed": 0,
      "name": "firebase_remote_config.xcframework",
      "resourceType": "GMExtensionFrameworkEntry",
      "resourceVersion": "2.0",
      "weakReference": false
    },
    {
      "$GMExtensionFrameworkEntry": "",
      "%Name": "firebase_storage.xcframework",
      "embed": 0,
      "name": "firebase_storage.xcframework",
      "resourceType": "GMExtensionFrameworkEntry",
      "resourceVersion": "2.0",
      "weakReference": false
    },
    {
      "$GMExtensionFrameworkEntry": "",
      "%Name": "firebase_ump.xcframework",
      "embed": 0,
      "name": "firebase_ump.xcframework",
      "resourceType": "GMExtensionFrameworkEntry",
      "resourceVersion": "2.0",
      "weakReference": false
    }
  ],
  "license": "",
  "maccodeinjection": "",
  "maccompilerflags": "",
  "maclinkerflags": "-ObjC",
  "macProps": false,
  "macsourcedir": "",
  "name": "GMFirebase",
  "options": [
    {
      "$GMExtensionOption": "",
      "%Name": "__extOptLabel",
      "defaultValue": "ANDROID OPTIONS:",
      "description": "",
      "displayName": "",
      "exportToINI": false,
      "extensionId": null,
      "guid": "af7e8666-54d3-4cbd-b2a3-9ea5847d1e21",
      "hidden": false,
      "listItems": [],
      "name": "__extOptLabel",
      "optType": 5,
      "resourceType": "GMExtensionOption",
      "resourceVersion": "2.0"
    },
    {
      "$GMExtensionOption": "",
      "%Name": "jsonFile",
      "defaultValue": "../Firebase_private/google-services.json",
      "description": "Can be aquired from Firebase dashboard.",
      "displayName": "google-services (json)",
      "exportToINI": true,
      "extensionId": null,
      "guid": "d898ff5d-783b-4206-bf9f-9fdcb8e7bf07",
      "hidden": false,
      "listItems": [],
      "name": "jsonFile",
      "optType": 3,
      "resourceType": "GMExtensionOption",
      "resourceVersion": "2.0"
    },
    {
      "$GMExtensionOption": "",
      "%Name": "__extOptLabel1",
      "defaultValue": "iOS OPTIONS:",
      "description": "",
      "displayName": "",
      "exportToINI": false,
      "extensionId": null,
      "guid": "75639da0-a6d6-48e7-88d8-c81aa1f7ffff",
      "hidden": false,
      "listItems": [],
      "name": "__extOptLabel1",
      "optType": 5,
      "resourceType": "GMExtensionOption",
      "resourceVersion": "2.0"
    },
    {
      "$GMExtensionOption": "",
      "%Name": "plistFile",
      "defaultValue": "../Firebase_private/GoogleService-Info.plist",
      "description": "Can be aquired from Firebase dashboard.",
      "displayName": "GoogleService-Info (plist)",
      "exportToINI": true,
      "extensionId": null,
      "guid": "f1646d22-9b39-40c6-95b7-0288f97d546f",
      "hidden": false,
      "listItems": [],
      "name": "plistFile",
      "optType": 3,
      "resourceType": "GMExtensionOption",
      "resourceVersion": "2.0"
    },
    {
      "$GMExtensionOption": "",
      "%Name": "__extOptLabel2",
      "defaultValue": "EXTRA OPTIONS:",
      "description": "",
      "displayName": "",
      "exportToINI": false,
      "extensionId": null,
      "guid": "156128a7-a27e-4aee-9fb0-162d2496a1cb",
      "hidden": false,
      "listItems": [],
      "name": "__extOptLabel2",
      "optType": 5,
      "resourceType": "GMExtensionOption",
      "resourceVersion": "2.0"
    },
    {
      "$GMExtensionOption": "",
      "%Name": "logLevel",
      "defaultValue": "1",
      "description": "",
      "displayName": "Log Level",
      "exportToINI": false,
      "extensionId": null,
      "guid": "1094a489-64c1-410f-98e0-74b96b74b9fc",
      "hidden": false,
      "listItems": [
        "0",
        "1",
        "2"
      ],
      "name": "logLevel",
      "optType": 6,
      "resourceType": "GMExtensionOption",
      "resourceVersion": "2.0"
    },
    {
      "$GMExtensionOption": "",
      "%Name": "disableDataCollection",
      "defaultValue": "False",
      "description": "Ship with Analytics collection and Messaging auto-init off until firebase_analytics_set_analytics_collection_enabled(true) and firebase_messaging_set_registration_on_init_enabled(true) are called (consent flows).",
      "displayName": "",
      "exportToINI": false,
      "extensionId": null,
      "guid": "abaa4f42-7605-456a-a543-e86481b328c3",
      "hidden": false,
      "listItems": [],
      "name": "disableDataCollection",
      "optType": 0,
      "resourceType": "GMExtensionOption",
      "resourceVersion": "2.0"
    },
    {
      "$GMExtensionOption": "",
      "%Name": "versionStable",
      "defaultValue": "2022.9.0.0",
      "description": "",
      "displayName": "",
      "exportToINI": false,
      "extensionId": null,
      "guid": "17d697a8-6d84-4c47-ac42-0cd0dad2866f",
      "hidden": true,
      "listItems": [],
      "name": "versionStable",
      "optType": 2,
      "resourceType": "GMExtensionOption",
      "resourceVersion": "2.0"
    },
    {
      "$GMExtensionOption": "",
      "%Name": "versionBeta",
      "defaultValue": "2022.900.0.0",
      "description": "",
      "displayName": "",
      "exportToINI": false,
      "extensionId": null,
      "guid": "4c6c74fb-e223-4e29-aaa3-155abf35e14f",
      "hidden": true,
      "listItems": [],
      "name": "versionBeta",
      "optType": 2,
      "resourceType": "GMExtensionOption",
      "resourceVersion": "2.0"
    },
    {
      "$GMExtensionOption": "",
      "%Name": "versionDev",
      "defaultValue": "9.1.1.0",
      "description": "",
      "displayName": "",
      "exportToINI": false,
      "extensionId": null,
      "guid": "ea14e0c8-8004-4d4e-aaca-b07869416335",
      "hidden": true,
      "listItems": [],
      "name": "versionDev",
      "optType": 2,
      "resourceType": "GMExtensionOption",
      "resourceVersion": "2.0"
    },
    {
      "$GMExtensionOption": "",
      "%Name": "versionLTS",
      "defaultValue": "2022.0.1.24",
      "description": "",
      "displayName": "",
      "exportToINI": false,
      "extensionId": null,
      "guid": "7ccb0b44-2b38-4a6f-a85e-68de8fc6ec5e",
      "hidden": true,
      "listItems": [],
      "name": "versionLTS",
      "optType": 2,
      "resourceType": "GMExtensionOption",
      "resourceVersion": "2.0"
    },
    {
      "$GMExtensionOption": "",
      "%Name": "__extOptLabel4",
      "defaultValue": "CPP SDK",
      "description": "",
      "displayName": "",
      "exportToINI": false,
      "extensionId": null,
      "guid": "1d9a4bd4-8a5a-483a-b443-69867c3093f7",
      "hidden": false,
      "listItems": [],
      "name": "__extOptLabel4",
      "optType": 5,
      "resourceType": "GMExtensionOption",
      "resourceVersion": "2.0"
    },
    {
      "$GMExtensionOption": "",
      "%Name": "firebaseCppSdkPath",
      "defaultValue": "../Firebase_sdk",
      "description": "Root of the unpacked Firebase C\u002B\u002B SDK 13.13.0 (firebase_cpp_sdk_13.13.0.zip from https://dl.google.com/firebase/sdk/cpp/). Android reads its proguard files and the messaging AAR from libs/android; iOS stages xcframeworks/ from here; Windows copies libs/windows/google_analytics.dll from here beside the executable when it is present (Analytics is the SDK\u0027s stub without it - see the README).",
      "displayName": "Firebase C\u002B\u002B SDK path",
      "exportToINI": false,
      "extensionId": null,
      "guid": "bda89a5d-1ea8-4b1f-a37a-ded6c747885e",
      "hidden": false,
      "listItems": [],
      "name": "firebaseCppSdkPath",
      "optType": 4,
      "resourceType": "GMExtensionOption",
      "resourceVersion": "2.0"
    },
    {
      "$GMExtensionOption": "",
      "%Name": "desktopJsonFile",
      "defaultValue": "../Firebase_private/google-services.json",
      "description": "Firebase config JSON copied beside the Windows/macOS/Linux executable at build time.",
      "displayName": "google-services (desktop json)",
      "exportToINI": false,
      "extensionId": null,
      "guid": "25430eb8-0bdf-47f6-a8d4-3296905ba4a2",
      "hidden": false,
      "listItems": [],
      "name": "desktopJsonFile",
      "optType": 3,
      "resourceType": "GMExtensionOption",
      "resourceVersion": "2.0"
    }
  ],
  "optionsFile": "options.json",
  "packageId": "",
  "parent": {
    "name": "Firebase",
    "path": "folders/Firebase.yy"
  },
  "productId": "",
  "resourceType": "GMExtension",
  "resourceVersion": "2.0",
  "sourcedir": "",
  "supportedTargets": -1,
  "tvosclassname": null,
  "tvosCocoaPodDependencies": "",
  "tvosCocoaPods": "",
  "tvoscodeinjection": "",
  "tvosdelegatename": null,
  "tvosmaccompilerflags": "",
  "tvosmaclinkerflags": "",
  "tvosplistinject": null,
  "tvosProps": false,
  "tvosSystemFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": []
}