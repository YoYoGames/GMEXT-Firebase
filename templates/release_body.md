## IMPORTANT

- This extension is compatible with GameMaker **2026.0.x.x** and future releases.
- Requires the Firebase C++ SDK **13.13.0**: download
  [firebase_cpp_sdk_13.13.0.zip](https://dl.google.com/firebase/sdk/cpp/firebase_cpp_sdk_13.13.0.zip),
  unpack it and point the `sdkPath` extension option at the unpacked folder. The game
  build reads the Android messaging AAR, the iOS xcframeworks and the Windows Analytics DLL
  from it; the DLL is a separate download from the SDK repository, see the README.
- Works with **Windows**, **macOS**, **Linux**, **Android** and **iOS**.
- Crashlytics, Performance Monitoring and In-App Messaging are Android and iOS only. On Windows,
  macOS and Linux, Cloud Messaging, Installations and the User Messaging Platform are SDK stubs
  that succeed with placeholder values, and Analytics is live only with the DLL above.
- **Version 4.0.0 is a breaking change**: the extension has been rewritten over the Firebase C++
  SDK, with the platform bindings generated from a single GMIDL spec and every asynchronous call
  now taking a GML callback function directly, replacing the `async_load`-based Social Async
  Events and the REST layer. Every 3.x function is renamed or gone, the per-product extensions are
  now one `GMFirebase` plus three platform-SDK companions, and there is no HTML5 target, so moving
  an existing project across is a migration rather than a drop-in upgrade. Projects that need the
  old API should stay on the final 3.1.0 release. Check the documentation for the current API.

## CHANGES SINCE ${releaseOldVersion}

https://github.com/YoYoGames/GMEXT-Firebase/compare/${releaseOldVersion}...${releaseNewVersion}

## DESCRIPTION

Firebase is Google's app development platform: analytics, authentication, cloud databases, file
storage, push messaging, remote configuration and crash reporting behind one project and one set
of credentials. This extension wraps the Firebase C++ SDK for Android, iOS, Windows, macOS and
Linux, and adds the three products that only exist as platform SDKs - Crashlytics, Performance
Monitoring and In-App Messaging - for Android and iOS.

## FEATURES

- Analytics
- Authentication
- Cloud Firestore
- Realtime Database
- Cloud Storage
- Cloud Messaging
- Remote Config
- Cloud Functions
- App Check
- Installations
- User Messaging Platform
- Crashlytics (Android and iOS)
- Performance Monitoring (Android and iOS)
- In-App Messaging (Android and iOS)

## DOCUMENTATION

The full documentation of the API is included in the extension asset (included files).
