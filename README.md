# GMEXT-Firebase
Repository for GameMaker's Firebase Extension

This repository was created with the intent of presenting users with the latest version available of the extension (even previous to marketplace updates) and also provide a way for the community to contribute with bug fixes and feature implementation.

> [!IMPORTANT]
> **Version 4.0.0 is a breaking change.** The extension has been rewritten over the Firebase C++
> SDK, with the platform bindings generated from a single GMIDL spec and every asynchronous call
> now taking a GML callback function directly, replacing the `async_load`-based Social Async
> Events and the REST layer. Every 3.x function is renamed or gone, the per-product extensions are
> now one `GMFirebase` plus three platform-SDK companions, and there is no HTML5 target, so moving
> an existing project across is a migration rather than a drop-in upgrade. Projects that need the
> old API should stay on the final 3.1.0 release. Check [the documentation](../../wiki) for the
> current API.

The package is four GameMaker extensions plus the shared `ExtensionCore`, all in the demo project under `source/Firebase_gml/extensions/`:

* `GMFirebase` - the Firebase C++ SDK wrapped for Android, iOS, Windows, macOS and Linux: Analytics, Authentication, Cloud Firestore, Realtime Database, Cloud Storage, Cloud Messaging, Remote Config, Cloud Functions, App Check, Installations and the User Messaging Platform. Every project needs it.
  * C++ SOURCE: `source/Firebase_gml/extensions/GMFirebase/source/src/native/` (one `GMFirebase_<module>.cpp` per module), generated bridge in `source/Firebase_gml/extensions/GMFirebase/source/code_gen/`
  * ANDROID SOURCE: `source/Firebase_gml/extensions/GMFirebase/AndroidSource/Java`
  * IOS SOURCE: `source/Firebase_gml/extensions/GMFirebase/source/src/ios`
  * GML WRAPPER: `source/Firebase_gml/scripts/GMFirebase_API/`
  * API SPEC: `source/Firebase_gml/extensions/GMFirebase/source/spec.gmidl`

* `GMFirebaseCrashlytics` - the Android and iOS Crashlytics SDKs (there is no C++ SDK); Android and iOS only, alongside `GMFirebase`.
  * ANDROID SOURCE: `source/Firebase_gml/extensions/GMFirebaseCrashlytics/AndroidSource/Java`
  * IOS SOURCE: `source/Firebase_gml/extensions/GMFirebaseCrashlytics/source/src/ios`

* `GMFirebasePerformance` - the Android and iOS Performance Monitoring SDKs; Android and iOS only, alongside `GMFirebase`.
  * ANDROID SOURCE: `source/Firebase_gml/extensions/GMFirebasePerformance/AndroidSource/Java`
  * IOS SOURCE: `source/Firebase_gml/extensions/GMFirebasePerformance/source/src/ios`

* `GMFirebaseInAppMessaging` - the Android and iOS In-App Messaging SDKs; Android and iOS only, alongside `GMFirebase`.
  * ANDROID SOURCE: `source/Firebase_gml/extensions/GMFirebaseInAppMessaging/AndroidSource/Java`
  * IOS SOURCE: `source/Firebase_gml/extensions/GMFirebaseInAppMessaging/source/src/ios`

* `ExtensionCore` - the shared runtime the four extensions' generated wrappers call into.

The four wrappers are generated from each extension's `spec.gmidl` by the GameMaker extension generator; the hand-written code is what the folders above hold. The HTML documentation lives in `docs/` and is rendered into `source/Firebase_gml/extensions/GMFirebase/docs/`, which the demo project's data files point at.

---

## Important

Do not download from the **main branch** this branch is a work in place branch and probably has features that might be broken or not working properly, please download from the releases panel (right side instead).


---

## Requirements

In order to compile the native extension you are required to download the [Firebase C++ SDK 13.13.0](https://dl.google.com/firebase/sdk/cpp/firebase_cpp_sdk_13.13.0.zip) and unpack it inside `source/Firebase_sdk/` (or point `FIREBASE_SDK_ROOT` at it when configuring). The one zip carries every platform:

* `libs/windows/VS2019/` - Windows static libraries (MD and MT)
* `libs/android/` - Android static libraries per ABI, the `*.pro` proguard files and `firebase_messaging_cpp.aar`
* `libs/darwin/universal/` - macOS fat static libraries
* `xcframeworks/` - the iOS xcframeworks the GameMaker project links

Linux builds the same tag from source instead, because the prebuilt Linux archives cannot be embedded in a shared object. A configure against any other SDK version fails on purpose: the pin is `EXT_TP_FIREBASE_VERSION` in `source/Firebase_gml/extensions/GMFirebase/source/third_party/CMakeLists.txt`, and it moves together with the Android BoM and the iOS pods in `GMFirebase.yy`.

Analytics on Windows needs one more file the zip does not carry: `google_analytics.dll`, which the SDK loads from beside the game's executable and runs as a stub without. Download it from the SDK repository at the tag matching the pinned version - [`analytics/windows/google_analytics.dll` at `v13.13.0`](https://github.com/firebase/firebase-cpp-sdk/raw/v13.13.0/analytics/windows/google_analytics.dll) - into `source/Firebase_sdk/libs/windows/`. The Windows build step copies it beside the executable when it is there. The SDK checks the DLL's hash against a list compiled into the pinned library, so a DLL from another tag is refused and Analytics stays a stub; `firebase_analytics_is_desktop_initialized()` reports which. A Run from the IDE executes the game inside the runtime's own runner, and the SDK only looks beside that executable, so Analytics is the stub on an IDE run and live in a packaged or YYC build.

`GMFirebaseCrashlytics`, `GMFirebasePerformance` and `GMFirebaseInAppMessaging` wrap the platform SDKs directly (there is no C++ SDK for those three products) and only work alongside `GMFirebase` in the same project. `GMFirebase` is what supplies the Firebase BoM, applies the `google-services` plugin and stages the credentials on Android, and on iOS the default Firebase app only exists once `firebase_app_initialize()` has been called. Importing one of the three on its own fails at Gradle resolution on Android and finds no configured app on iOS.

Every extension has a `disableDataCollection` option (off by default) for consent-gated builds: it ships the game with that product's automatic collection off - Crashlytics reports, Performance traces, In-App Messaging data collection, and for `GMFirebase` both Analytics collection and the Messaging auto-init token fetch - until the matching runtime call re-enables it (`firebase_crashlytics_set_collection_enabled`, `firebase_performance_set_collection_enabled`, `firebase_in_app_messaging_set_automatic_data_collection_enabled`, `firebase_analytics_set_analytics_collection_enabled` and `firebase_messaging_set_registration_on_init_enabled`).

At game-build time the extension option `firebaseCppSdkPath` (GMFirebase, in the IDE) must point at the same unpacked root: the Android build reads the proguard files and the messaging AAR from it, the iOS build stages the xcframeworks from it, and the Windows build copies `libs/windows/google_analytics.dll` from it beside the executable when the file is present. It defaults to `../Firebase_sdk`, relative to the project folder, which is that location for the demo project. The three credential options (`jsonFile`, `plistFile`, `desktopJsonFile`) default the same way to `../Firebase_private/google-services.json` and `../Firebase_private/GoogleService-Info.plist`; both folders are ignored by git, so put your own Firebase console files there or point the options elsewhere.

---

## Documentation

* Check [the documentation](../../wiki)

The documentation source is the `docs/` folder of this repository - one `docs/<module>.js` per module and the guide pages as Markdown - and the HTML shipped with the extension and inside the demo project's data files is rendered from it.

Additionally, if you're contributing new features through PR (Pull Requests), we kindly ask that you also provide accompanying documentation for these features, to maintain the comprehensiveness and usefulness of our resources.


---
