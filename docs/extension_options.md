@title Extension Options

# Extension Options

To configure an extension, double-click it in the Asset Browser; the options sit at the bottom of the
extension window. **GMFirebase** carries the credentials and the build settings every project needs.
The three platform-SDK extensions have one option each.

## GMFirebase

### Android Options

| Option | Type | Default | Description |
|---|---|---|---|
| **google-services (json)** | File | `../Firebase_private/google-services.json` | The `google-services.json` downloaded from the Firebase console for your Android app (${page.platform_setup}). The build step copies it into the Android project, where the `google-services` Gradle plugin reads it. Required for every Android build. |

### iOS Options

| Option | Type | Default | Description |
|---|---|---|---|
| **GoogleService-Info (plist)** | File | `../Firebase_private/GoogleService-Info.plist` | The `GoogleService-Info.plist` downloaded from the Firebase console for your iOS app. The build step copies it into the Xcode project's resources. Required for every iOS build. |

### Extra Options

| Option | Type | Default | Description |
|---|---|---|---|
| **Log Level** | Dropdown (`0`/`1`/`2`) | `1` | How much the extension's own build steps print while staging the credentials and the SDK. Unrelated to the Firebase SDK's runtime log level, which is ${function.firebase_set_log_level}. |
| **disableDataCollection** | Bool | `false` | Ships the game with Analytics collection and the Cloud Messaging auto-init token fetch turned off, for consent flows. See below. |

### CPP SDK

| Option | Type | Default | Description |
|---|---|---|---|
| **Firebase C++ SDK path** | Folder | `../Firebase_sdk` | The root of an unpacked Firebase C++ SDK - the version the extension was built against, which ${function.firebase_get_sdk_version} reports and the README names. The Android build reads the SDK's ProGuard rules and its `firebase_messaging_cpp.aar` from `libs/android/`; the iOS build stages the frameworks from `xcframeworks/`; the Windows build copies `libs/windows/google_analytics.dll` beside the executable when it is there (a file the SDK zip does not carry - see the README and the Platforms section of ${module.analytics}). macOS and Linux builds do not read it. |
| **google-services (desktop json)** | File | `../Firebase_private/google-services.json` | The Firebase configuration for Windows, macOS and Linux builds - the Android `google-services.json` does the job. The build step copies it beside the executable (into the app bundle's resources on macOS), which is where ${function.firebase_app_initialize} looks for it on desktop. |

All four file and folder paths are resolved relative to the project folder, so the defaults point at
two folders that sit next to it: `Firebase_private` for the credential files and `Firebase_sdk` for
the SDK.

[[Warning: Keep the credential files out of the project folder and out of source control. The build
step stages them into the build output every time, so they never need to be inside the project, and
a `google-services.json` in a public repository is your project's API key in a public repository.]]

## disableDataCollection

Every extension in the package has this option, off by default. With it on, the game ships with that
product's automatic collection disabled, and nothing is collected until your code turns it on at
runtime - once the player has consented. Each option injects the platform's own opt-out into the
Android manifest and the iOS `Info.plist`:

| Extension | Turns off | Turn it back on with |
|---|---|---|
| GMFirebase | Analytics collection (`firebase_analytics_collection_enabled`, `FIREBASE_ANALYTICS_COLLECTION_ENABLED`) and the Cloud Messaging auto-init registration (`firebase_messaging_auto_init_enabled`, `FirebaseMessagingAutoInitEnabled`) | ${function.firebase_analytics_set_analytics_collection_enabled} and ${function.firebase_messaging_set_registration_on_init_enabled} |
| GMFirebaseCrashlytics | Crash report collection (`firebase_crashlytics_collection_enabled`, `FirebaseCrashlyticsCollectionEnabled`) | ${function.firebase_crashlytics_set_collection_enabled} |
| GMFirebasePerformance | Performance trace collection (`firebase_performance_collection_enabled`, both platforms) | ${function.firebase_performance_set_collection_enabled} |
| GMFirebaseInAppMessaging | In-App Messaging data collection (`firebase_inapp_messaging_auto_data_collection_enabled`, `FirebaseInAppMessagingAutomaticDataCollectionEnabled`) | ${function.firebase_in_app_messaging_set_automatic_data_collection_enabled} |

The runtime calls persist: once a product has been enabled it stays enabled across launches, so a
consent screen only needs to make the call once.

## GMFirebaseCrashlytics, GMFirebasePerformance, GMFirebaseInAppMessaging

| Option | Type | Default | Description |
|---|---|---|---|
| **disableDataCollection** | Bool | `false` | The product's opt-out, as in the table above. |

These three extensions have no credential options of their own: they rely on GMFirebase being in the
same project, which supplies the Firebase dependencies, the `google-services` plugin and the
credentials on Android, and configures the default app on iOS through
${function.firebase_app_initialize}.
