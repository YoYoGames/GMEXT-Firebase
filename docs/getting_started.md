@title Getting Started

# Getting Started

The Firebase package holds four extensions. **GMFirebase** wraps the Firebase C++ SDK - Analytics,
Authentication, Cloud Firestore, Realtime Database, Cloud Storage, Cloud Messaging, Remote Config,
Cloud Functions, App Check, Installations and the User Messaging Platform - and is the one every
project needs. **GMFirebaseCrashlytics**, **GMFirebasePerformance** and **GMFirebaseInAppMessaging**
wrap the Android and iOS SDKs of the three products the C++ SDK does not cover; import them only if
you use those products, and always alongside GMFirebase.

| Platform | GMFirebase | Crashlytics, Performance, In-App Messaging |
|---|---|---|
| Android, iOS | Every module | Yes |
| Windows, macOS, Linux | Authentication, Cloud Firestore, Realtime Database, Cloud Storage, Remote Config, Cloud Functions and App Check; Analytics on Windows only, with the `google_analytics.dll` the ${module.analytics} page describes. Cloud Messaging, Installations and the User Messaging Platform are stubs on desktop - their functions return without doing anything | No |

[[Note: Firebase describes its desktop support as a beta meant for development workflows rather than
shipped builds. It works, and the extension ships real desktop binaries, but that is Google's stated
position on it.]]

To get going:

1. Create a project in the [Firebase console](https://console.firebase.google.com/) and enable the
   products you want to use (each module's page says what needs enabling on the console side).
2. Register your game with that project for each platform you ship on and download the credential
   file the console gives you - `google-services.json` for Android, `GoogleService-Info.plist` for iOS.
   ${page.platform_setup} walks through it. Desktop builds use the Android `google-services.json`.
3. Put the credential files **outside** the project folder - the extension options default to a
   `Firebase_private` folder next to the project - and never commit them: the file identifies your
   Firebase project and carries its API key.
4. Import the extensions into your project, then double-click **GMFirebase** in the Asset Browser
   and point the credential options at your files. On Android and iOS, also point **Firebase C++ SDK
   path** at an unpacked copy of the Firebase C++ SDK the extension was built against (the build
   reads ProGuard rules, an AAR and the iOS frameworks from it). Every option is described on
   ${page.extension_options}.
5. On iOS the Firebase pods need CocoaPods on the Mac that builds the game - see the
   [GameMaker helpdesk article](https://help.gamemaker.io/hc/en-us/articles/360008958858-iOS-and-tvOS-Using-CocoaPods) -
   and the game's minimum iOS version must be **15.0** or higher, which is what the Firebase pods
   require.

# Initialising

Call ${function.firebase_app_initialize} once, before any other Firebase function, in the Create
event of a persistent controller object. It reads the credential file for the platform and creates
the default Firebase App every module attaches to:

```gml
if (!firebase_app_initialize())
{
    show_debug_message("Firebase init failed: " + firebase_last_error_message());
    exit;
}

firebase_analytics_initialize();
firebase_auth_get_auth();
```

The above code creates the default app, stops with the reason from
${function.firebase_last_error_message} if that fails, and then brings up the two modules the game
uses. Each module has its own initialise function (${function.firebase_analytics_initialize},
${function.firebase_messaging_initialize}, ${function.firebase_firestore_get_instance} and so on);
see ${module.app} for the list. Nothing needs to be shut down at the end of the game.

[[Important: On iOS the three platform-SDK extensions (Crashlytics, Performance Monitoring, In-App
Messaging) do nothing until ${function.firebase_app_initialize} has run, because that call is what
configures the default app on that platform. Call it first, then use them.]]

# Results and callbacks

Everything that talks to a Firebase server is asynchronous. Such a function takes a callback as its
last argument and returns a ${constant.FirebaseError} at once:

```gml
var _result = firebase_auth_sign_in_with_email_and_password(email, password, function(_error_code, _error_message, _user)
{
    if (_error_code == 0)
    {
        show_debug_message("Signed in as " + firebase_auth_user_email(_user));
    }
    else
    {
        show_debug_message("Sign-in failed: " + _error_message);
    }
});

if (_result != FirebaseError.Ok)
{
    show_debug_message("Could not start the sign-in: " + firebase_last_error_message());
}
```

The above code starts a sign-in. `FirebaseError.Ok` means the request reached the SDK and the
callback will run exactly once with the server's answer - an error code (`0` on success), a message,
and the value the call produces. Any other return means the request was never sent, the callback
will not run, and ${function.firebase_last_error_code} and ${function.firebase_last_error_message}
say why.

[[Warning: `FirebaseError.Ok` is `0`. Always compare the return against `FirebaseError.Ok`; a truthy
test such as `if (firebase_auth_user_reload(user, callback))` runs its body when the call *failed*.]]

Firebase objects - users, database references, documents, queries, snapshots - reach GML as numeric
handles. A function that hands you one names the function that releases it; release handles when you
are done with them, and release a Cloud Storage reference only after its callback has fired. The
conventions are spelled out on ${module.app}.

# Testing

The package's demo project has a room per module with a button per operation. It expects the
credential files at `../Firebase_private/` next to the project folder, and a Firebase project with
Authentication (email/password and anonymous sign-in), Cloud Firestore, Realtime Database and Cloud
Storage enabled in test mode. Run it on a device, or from the IDE on Windows, macOS or Linux for the
desktop modules; the debug output prints every result.
