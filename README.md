# GMEXT-Firebase
Repository for GameMaker's Firebase Extension

This repository was created with the intent of presenting users with the latest version available of the extension (even previous to marketplace updates) and also provide a way for the community to contribute with bug fixes and feature implementation.

The Firebase API works on Android/iOS/Web through SDK, and all platforms using the REST API (this may not be true for all modules, check documentation).

* Firebase Analytics
  * ANDROID SOURCE: `source/Firebase_gml/extensions/YYFirebaseAnalytics/AndroidSource/Java`
  * IOS SOURCE: `source/Firebase_gml/extensions/YYFirebaseAnalytics/iOSSource`
  * HTML5: `source/Firebase_gml/extensions/YYFirebaseAnalytics/FirebaseAnalytics.js`

* Firebase App Check
  * ANDROID SOURCE: `source/Firebase_gml/extensions/YYFirebaseAppCheck/AndroidSource/Java`
  * IOS SOURCE: `source/Firebase_gml/extensions/YYFirebaseAppCheck/iOSSource`

* Firebase Authentication
  * ANDROID SOURCE: `source/Firebase_gml/extensions/YYFirebaseAuthentication/AndroidSource/Java`
  * IOS SOURCE: `source/Firebase_gml/extensions/YYFirebaseAuthentication/iOSSource`
  * HTML5: `source/Firebase_gml/extensions/YYFirebaseAuthentication/FirebaseAuthentication.js`
  * REST API: inside GM project, asset browser: `Firebase Authentication --> Extensions --> Firebase REST API Library`

* Firebase Cloud Functions
  * ANDROID SOURCE: `source/Firebase_gml/extensions/YYFirebaseCloudFunctions/AndroidSource/Java`
  * IOS SOURCE: `source/Firebase_gml/extensions/YYFirebaseCloudFunctions/iOSSource`
  * HTML5: `source/Firebase_gml/extensions/YYFirebaseCloudFunctions/YYFirebaseCloudFunctions.js`

* Firebase Cloud Messaging
  * ANDROID SOURCE: `source/Firebase_gml/extensions/YYFirebaseCloudMessaging/AndroidSource/Java`
  * IOS SOURCE: `source/Firebase_gml/extensions/YYFirebaseCloudMessaging/iOSSource`

* Firebase Crashlytics
  * ANDROID SOURCE: `source/Firebase_gml/extensions/YYFirebaseCrashlytics/AndroidSource/Java`
  * IOS SOURCE: `source/Firebase_gml/extensions/YYFirebaseCrashlytics/iOSSource`
  
* Firebase Firestore
  * ANDROID SOURCE: `source/Firebase_gml/extensions/YYFirebaseFirestore/AndroidSource/Java`
  * IOS SOURCE: `source/Firebase_gml/extensions/YYFirebaseFirestore/iOSSource`
  * HTML5: `source/Firebase_gml/extensions/YYFirebaseFirestore/FirebaseFirestore.js`
  * REST API: inside GM project, asset browser: `Firebase Firestore --> Extensions --> Firebase REST API Library`

* Firebase Performance
  * ANDROID SOURCE: `source/Firebase_gml/extensions/YYFirebasePerformance/AndroidSource/Java`
  * IOS SOURCE: `source/Firebase_gml/extensions/YYFirebasePerformance/iOSSource`
  
* Firebase Realtime Database
  * ANDROID SOURCE: `source/Firebase_gml/extensions/YYFirebaseRealTime/AndroidSource/Java`
  * IOS SOURCE: `source/Firebase_gml/extensions/YYFirebaseRealTime/iOSSource`
  * HTML5: `source/Firebase_gml/extensions/YYFirebaseRealTime/FirebaseRealTime.js`
  * REST API: inside GM project, asset browser: `Firebase RealTime --> Extensions --> Firebase REST API Library`
  
* Firebase Remote Config
  * ANDROID SOURCE: `source/Firebase_gml/extensions/YYFirebaseRemoteConfig/AndroidSource/Java`
  * IOS SOURCE: `source/Firebase_gml/extensions/YYFirebaseRemoteConfig/iOSSource`
  * HTML5: `source/Firebase_gml/extensions/YYFirebaseRemoteConfig/FirebaseRemoteConfig.js`

* Firebase Cloud Storage
  * ANDROID SOURCE: `source/Firebase_gml/extensions/YYFirebaseStorage/AndroidSource/Java`
  * IOS SOURCE: `source/Firebase_gml/extensions/YYFirebaseStorage/iOSSource`
  * HTML5: `source/Firebase_gml/extensions/YYFirebaseStorage/YYFirebaseStorage.js`


---

## Important

Do not download from the **main branch** this branch is a work in place branch and probably has features that might be broken or not working properly, please download from the releases panel (right side instead).


---

## Requirements

In order to compile the native extension you are required to download the [Firebase C++ SDK 13.11.0](https://dl.google.com/firebase/sdk/cpp/firebase_cpp_sdk_13.11.0.zip) and unpack it inside `source/Firebase_sdk/` (or point `FIREBASE_SDK_ROOT` at it when configuring). The one zip carries every platform:

* `libs/windows/VS2019/` - Windows static libraries (MD and MT)
* `libs/android/` - Android static libraries per ABI, the `*.pro` proguard files and `firebase_messaging_cpp.aar`
* `libs/darwin/universal/` - macOS fat static libraries
* `xcframeworks/` - the iOS xcframeworks the GameMaker project links

Linux builds the same tag from source instead, because the prebuilt Linux archives cannot be embedded in a shared object. A configure against any other SDK version fails on purpose: the pin is `EXT_TP_FIREBASE_VERSION` in `source/Firebase_gml/extensions/GMFirebase/source/third_party/CMakeLists.txt`, and it moves together with the Android BoM and the iOS pods in `GMFirebase.yy`.

`GMFirebaseCrashlytics`, `GMFirebasePerformance` and `GMFirebaseInAppMessaging` wrap the platform SDKs directly (there is no C++ SDK for those three products) and only work alongside `GMFirebase` in the same project. `GMFirebase` is what supplies the Firebase BoM, applies the `google-services` plugin and stages the credentials on Android, and on iOS the default Firebase app only exists once `firebase_app_initialize()` has been called. Importing one of the three on its own fails at Gradle resolution on Android and finds no configured app on iOS.

Every extension has a `disableDataCollection` option (off by default) for consent-gated builds: it ships the game with that product's automatic collection off - Crashlytics reports, Performance traces, In-App Messaging data collection, and for `GMFirebase` both Analytics collection and the Messaging auto-init token fetch - until the matching runtime call re-enables it (`firebase_crashlytics_set_collection_enabled`, `firebase_performance_set_collection_enabled`, `firebase_in_app_messaging_set_automatic_data_collection_enabled`, `firebase_analytics_set_analytics_collection_enabled` and `firebase_messaging_set_token_registration_on_init_enabled`).

At game-build time the extension option `firebaseCppSdkPath` (GMFirebase, in the IDE) must point at the same unpacked root: the Android build reads the proguard files and the messaging AAR from it, and the iOS build stages the xcframeworks from it. It defaults to `../Firebase_sdk`, relative to the project folder, which is that location for the demo project. The three credential options (`jsonFile`, `plistFile`, `desktopJsonFile`) default the same way to `../Firebase_private/google-services.json` and `../Firebase_private/GoogleService-Info.plist`; both folders are ignored by git, so put your own Firebase console files there or point the options elsewhere.

---

## Documentation

* Check [the documentation](../../wiki)

The online documentation is regularly updated to ensure it contains the most current information. For those who prefer a different format, we also offer a HTML version. This HTML is directly converted from the GitHub Wiki content, ensuring consistency, although it may follow slightly behind in updates.

We encourage users to refer primarily to the GitHub Wiki for the latest information and updates. The HTML version, included with the extension and within the demo project's data files, serves as a secondary, static reference.

Additionally, if you're contributing new features through PR (Pull Requests), we kindly ask that you also provide accompanying documentation for these features, to maintain the comprehensiveness and usefulness of our resources.


---
