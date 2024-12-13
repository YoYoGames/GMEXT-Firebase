# GMEXT-Firebase
Repository for GameMaker's Firebase Extension

This repository was created with the intent of presenting users with the latest version available of the extension (even previous to marketplace updates) and also provide a way for the community to contribute with bug fixes and feature implementation.

The Firebase API works on Android/iOS/Web through SDK, and all platforms using the REST API (this may not be true for all modules, check documentation).

* Firebase Analytics
  * ANDROID SOURCE: `source/Firebase_gml/extensions/YYFirebaseAnalytics/AndroidSource/Java`
  * IOS SOURCE: `source/Firebase_gml/extensions/YYFirebaseAnalytics/iOSSource`
  * HTML5: `source/Firebase_gml/extensions/YYFirebaseAnalytics/FirebaseAnalytics.js`
  
* Firebase Authentication
  * ANDROID SOURCE: `source/Firebase_gml/extensions/YYFirebaseAuthentication/AndroidSource/Java`
  * IOS SOURCE: `source/Firebase_gml/extensions/YYFirebaseAuthentication/iOSSource`
  * HTML5: `source/Firebase_gml/extensions/YYFirebaseAuthentication/FirebaseAuthentication.js`
  * REST API: inside GM project, asset browser: `Firebase Authentication --> Extensions --> Firebase REST API Library`

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
  * REST API: inside GM project, asset browser: `Firebase Storage --> Extensions --> Firebase REST API Library`

BONUS:
* Local Notifications
  * ANDROID SOURCE: `source/Firebase_gml/extensions/YYLocalNotifications/AndroidSource/Java`
  * IOS SOURCE: `source/Firebase_gml/extensions/YYLocalNotifications/iOSSource`


---

## Important

Do not download from the **main branch** this branch is a work in place branch and probably has features that might be broken or not working properly, please download from the releases panel (right side instead).


---

## Documentation

* Check [the documentation](../../wiki)

The online documentation is regularly updated to ensure it contains the most current information. For those who prefer a different format, we also offer a HTML version. This HTML is directly converted from the GitHub Wiki content, ensuring consistency, although it may follow slightly behind in updates.

We encourage users to refer primarily to the GitHub Wiki for the latest information and updates. The HTML version, included with the extension and within the demo project's data files, serves as a secondary, static reference.

Additionally, if you're contributing new features through PR (Pull Requests), we kindly ask that you also provide accompanying documentation for these features, to maintain the comprehensiveness and usefulness of our resources.


---
