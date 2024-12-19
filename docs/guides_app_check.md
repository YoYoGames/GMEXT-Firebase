@title App Check Guide

# App Check Guide

## Firebase Console

To enable App Check in your game, register your app in the [App Check section of the Firebase Console](https://console.firebase.google.com/project/_/appcheck).

## GameMaker

Add the `YYFirebaseAppCheck` extension to your game. On the extension's supported platforms (Android, iOS and tvOS) it will automatically register the attestation provider that you set in the [Extension Options](manual.gamemaker.io/monthly/en/The_Asset_Editors/Extensions.htm#extension_options).

Both the **Android Provider** and **iOS Provider** default to **Debug**, which is the provider you should use when developing in a debug setting.
More specifically, your game will use either the [Android Debug Provider](https://firebase.google.com/docs/app-check/android/debug-provider) or the [iOS Debug Provider](https://firebase.google.com/docs/app-check/ios/debug-provider), depending on the target platform set.

[[Warning: The debug provider allows access to your Firebase resources from unverified devices. **Don't** use the debug provider in production builds of your app, and **don't** share your debug builds with untrusted parties.]]

When building a final release, set the provider to **PlayIntegrity** for Android, or to **AppAttest|DeviceCheck** for iOS.
On iOS versions 14 and up [App Attest](https://firebase.google.com/docs/app-check/ios/app-attest-provider) is used, on other versions [DeviceCheck](https://firebase.google.com/docs/app-check/ios/devicecheck-provider) is used instead.

When working with a non-Firebase backend you can use the functions ${function.FirebaseAppCheck_GetToken} and ${function.FirebaseAppCheck_LimitedUseToken}.