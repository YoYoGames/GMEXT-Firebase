/**
 * @function firebase_app_initialize
 * @desc **Firebase C++ SDK:** [firebase::App::Create](https://firebase.google.com/docs/reference/cpp/class/firebase/app#create)
 *
 * This function creates the default Firebase App, or reuses it when one already exists, and must be
 * called once before any other function of this extension. Every product module (Analytics,
 * Authentication, Cloud Firestore, ...) attaches to the App this call creates.
 *
 * Where the configuration comes from depends on the platform: on Android it is the
 * `google-services.json` file that the `jsonFile` extension option stages into the build, on iOS the
 * `GoogleService-Info.plist` that the `plistFile` option adds to the bundle, and on Windows, macOS and
 * Linux a `google-services-desktop.json` or `google-services.json` placed beside the executable, which
 * the same `jsonFile` option copies there at build time. See ${page.extension_options}.
 *
 * If the function succeeds it returns `true`. If it fails it returns `false` and ${function.firebase_last_error_code}
 * is `FirebaseError.NotInitialized`, with ${function.firebase_last_error_message} saying why - typically
 * a configuration file that could not be found or read.
 *
 * [[Note: This function returns a boolean, not a ${constant.FirebaseError} value, so a truthy test on
 * its return is correct here. The asynchronous functions of this extension return
 * ${constant.FirebaseError} instead, where `FirebaseError.Ok` is `0` - see the notes on this page.]]
 *
 * [[Important: On iOS the `GMFirebaseCrashlytics`, `GMFirebasePerformance` and `GMFirebaseInAppMessaging`
 * extensions depend on this call having configured the default app; their functions are no-ops until
 * it has run. On Android the default app is configured at launch and those three work either way.]]
 *
 * @returns {Bool} `true` if the default app exists after the call, otherwise `false`.
 *
 * @example
 * ```gml
 * if (!firebase_app_initialize())
 * {
 *     show_debug_message("Firebase init failed: " + firebase_last_error_message());
 *     exit;
 * }
 * show_debug_message("Firebase App: " + firebase_app_get_name());
 * ```
 * The above code initialises Firebase in a Create event and stops if that fails, printing the reason
 * from ${function.firebase_last_error_message}. Once it has succeeded, ${function.firebase_app_get_name}
 * returns the name of the default app and every other module can be initialised.
 * @function_end
 */

/**
 * @function firebase_app_is_initialized
 * @desc This function returns whether ${function.firebase_app_initialize} has succeeded. It only reads
 * the state; it never creates the app.
 *
 * @returns {Bool} `true` once the default app has been created, otherwise `false`.
 *
 * @example
 * ```gml
 * if (!firebase_app_is_initialized())
 * {
 *     firebase_app_initialize();
 * }
 * ```
 * The above code initialises Firebase only when it has not been initialised yet, which is the pattern
 * for an object that can be created more than once during the game.
 * @function_end
 */

/**
 * @function firebase_app_get_name
 * @desc **Firebase C++ SDK:** [firebase::App::name](https://firebase.google.com/docs/reference/cpp/class/firebase/app#name)
 *
 * This function returns the name of the default Firebase App. The SDK gives the default app a fixed
 * name; an app created with ${function.firebase_app_initialize_with_options} or
 * ${function.firebase_app_initialize_from_json} and a name of your own is read with
 * ${function.firebase_app_handle_get_name} instead.
 *
 * @returns {String} The name of the default app, or an empty string when it has not been initialised.
 *
 * @example
 * ```gml
 * show_debug_message("Firebase App: " + firebase_app_get_name());
 * ```
 * The above code prints the name of the default app after ${function.firebase_app_initialize} has
 * succeeded.
 * @function_end
 */

/**
 * @function firebase_last_error_code
 * @desc This function returns the error code of the last call that failed before it reached the
 * Firebase SDK - an invalid handle, a module that has not been initialised, or an argument the
 * extension refused. The value is set on the thread that made the call, so read it right after a call
 * has reported failure: after an asynchronous function returned anything other than `FirebaseError.Ok`,
 * or after an initialise function returned `0`.
 *
 * Note that the value is not cleared by a later call that succeeds; it holds the code of the last
 * *failure* until the next one overwrites it. Do not poll it to find out whether a call worked - the
 * call's own return value says that.
 *
 * A result the SDK produces - a sign-in that was rejected, a document that does not exist, a network
 * error - never lands here. It is delivered to that call's callback, as the callback's `error_code` and
 * `error_message` arguments, and nowhere else.
 *
 * @returns {Enum.FirebaseError} The code of the last call that failed before reaching the SDK.
 *
 * @example
 * ```gml
 * var _result = firebase_auth_sign_in_with_email_and_password(email, password, function(_error_code, _error_message, _user)
 * {
 *     // The SDK's own result arrives here
 * });
 *
 * if (_result != FirebaseError.Ok)
 * {
 *     show_debug_message($"Sign-in not started: {firebase_last_error_code()} {firebase_last_error_message()}");
 * }
 * ```
 * The above code starts a sign-in and checks the synchronous return against `FirebaseError.Ok`. When
 * the call could not be started - here because ${function.firebase_app_initialize} has not succeeded,
 * so `_result` is `FirebaseError.NotInitialized` - the callback will never run, and
 * ${function.firebase_last_error_code} and ${function.firebase_last_error_message} carry the reason.
 * When the call did start, the callback is the only place the outcome is reported.
 * @function_end
 */

/**
 * @function firebase_last_error_message
 * @desc This function returns the message that goes with ${function.firebase_last_error_code} - the
 * name of the function that failed and what it objected to, for example
 * `"firebase_app_initialize: no google-services-desktop.json or google-services.json in <folder>"`.
 * The same rules apply: it describes the last call that failed before reaching the SDK, it is not
 * cleared by a later success, and an SDK result never lands here.
 *
 * @returns {String} The message of the last call that failed before reaching the SDK, or an empty string when nothing has failed yet.
 *
 * @example
 * ```gml
 * if (!firebase_app_initialize())
 * {
 *     show_debug_message("Firebase init failed: " + firebase_last_error_message());
 * }
 * ```
 * The above code prints why the default app could not be created. The message names the missing or
 * unreadable configuration file, which is the usual cause on desktop.
 * @function_end
 */

/**
 * @function firebase_app_get_default_handle
 * @desc **Firebase C++ SDK:** [firebase::App::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/app#getinstance)
 *
 * This function returns a handle to the default Firebase App, for the functions that take an app
 * argument - ${function.firebase_analytics_initialize_for_app},
 * ${function.firebase_messaging_initialize_for_app}, ${function.firebase_app_check_get_instance_for_app}
 * and their siblings. On Windows, macOS, Linux and iOS the default app is created on demand if
 * ${function.firebase_app_initialize} has not run yet; on Android it must have run first, and the
 * function returns `0` otherwise.
 *
 * Release the handle with ${function.firebase_app_release_handle} when you no longer need it. The app
 * itself lives for the rest of the game; only the handle is released.
 *
 * @returns {Real} A handle to the default app, or `0` when it does not exist.
 *
 * @example
 * ```gml
 * var _app = firebase_app_get_default_handle();
 * firebase_analytics_initialize_for_app(_app);
 * firebase_app_release_handle(_app);
 * ```
 * The above code fetches a handle to the default app, initialises Analytics against it and releases
 * the handle again, since the module keeps its own reference to the app from then on.
 * @function_end
 */

/**
 * @function firebase_app_get_instance
 * @desc **Firebase C++ SDK:** [firebase::App::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/app#getinstance_1)
 *
 * This function returns a handle to the app with the given name, created earlier with
 * ${function.firebase_app_initialize_with_options} or ${function.firebase_app_initialize_from_json}.
 * An empty name returns the default app. Unlike ${function.firebase_app_get_default_handle}, this
 * function never creates an app: it returns `0` when no app of that name exists.
 *
 * Release the handle with ${function.firebase_app_release_handle} when you no longer need it.
 *
 * @param {String} name The name the app was created with, or an empty string for the default app.
 *
 * @returns {Real} A handle to the named app, or `0` when it does not exist.
 *
 * @example
 * ```gml
 * var _app = firebase_app_get_instance("analytics-only");
 * if (_app == 0)
 * {
 *     _app = firebase_app_initialize_from_json(json_config, "analytics-only");
 * }
 * ```
 * The above code looks up a named app and creates it from a configuration string when it does not
 * exist yet, so the object that runs this can be created any number of times without creating the app
 * twice.
 * @function_end
 */

/**
 * @function firebase_app_get_apps
 * @desc **Firebase C++ SDK:** [firebase::App::GetApps](https://firebase.google.com/docs/reference/cpp/class/firebase/app#getapps)
 *
 * This function returns a handle to every Firebase App that exists, the default one included. Each
 * handle should be released with ${function.firebase_app_release_handle} when you are done with it.
 *
 * @returns {Array[Real]} An array with one handle per app, empty when no app has been created.
 *
 * @example
 * ```gml
 * var _apps = firebase_app_get_apps();
 * for (var _i = 0; _i < array_length(_apps); _i++)
 * {
 *     show_debug_message(firebase_app_handle_get_name(_apps[_i]));
 *     firebase_app_release_handle(_apps[_i]);
 * }
 * ```
 * The above code prints the name of every app and releases each handle as it goes.
 * @function_end
 */

/**
 * @function firebase_app_initialize_with_options
 * @desc **Firebase C++ SDK:** [firebase::App::Create](https://firebase.google.com/docs/reference/cpp/class/firebase/app#create_2)
 *
 * This function creates a Firebase App from the given ${struct.FirebaseAppOptions} instead of the
 * configuration file, and returns a handle to it. Any variable of the struct left `undefined` keeps
 * the SDK's default for that setting. With an empty name the app becomes the default app - the one
 * every product module attaches to, exactly as if ${function.firebase_app_initialize} had created
 * it; with a name of your own it is a second app that only the `*_for_app` functions use.
 *
 * If the SDK cannot create the app the function returns `0` and ${function.firebase_last_error_code}
 * is `FirebaseError.NotInitialized`.
 *
 * [[Note: The usual way to configure the extension is the credential files described on
 * ${page.getting_started}. Use this function when the configuration has to come from somewhere else
 * at runtime - a second Firebase project, or values fetched from your own server.]]
 *
 * @param {Struct.FirebaseAppOptions} options The settings for the app, created with `new FirebaseAppOptions()`; variables left `undefined` keep the SDK defaults.
 * @param {String} name The name for the app, or an empty string to create the default app.
 *
 * @returns {Real} A handle to the new app, or `0` when it could not be created.
 *
 * @example
 * ```gml
 * var _options = new FirebaseAppOptions();
 * _options.app_id = "1:012345678901:android:0123456789abcdef";
 * _options.api_key = "AIza...";
 * _options.project_id = "my-second-project";
 * _options.messaging_sender_id = "012345678901";
 * second_app = firebase_app_initialize_with_options(_options, "second");
 * if (second_app == 0)
 * {
 *     show_debug_message(firebase_last_error_message());
 * }
 * ```
 * The above code creates a second, named app for another Firebase project and keeps its handle in an
 * instance variable so the `*_for_app` functions can use it later. The variables left `undefined`
 * (`database_url`, `storage_bucket`, `ga_tracking_id`) keep their defaults. The struct has to come
 * from `new FirebaseAppOptions()`: a plain struct literal is refused by the function.
 * @function_end
 */

/**
 * @function firebase_app_initialize_from_json
 * @desc **Firebase C++ SDK:** [firebase::AppOptions::LoadFromJsonConfig](https://firebase.google.com/docs/reference/cpp/class/firebase/app-options#loadfromjsonconfig)
 *
 * This function creates a Firebase App from the contents of a `google-services.json` file passed as a
 * string, and returns a handle to it. It is ${function.firebase_app_initialize_with_options} with the
 * options parsed for you: the same rules apply to the name (empty for the default app, anything else
 * for a second app) and to the handle.
 *
 * If the string is not a Firebase configuration the function returns `0` and
 * ${function.firebase_last_error_code} is `FirebaseError.InvalidArgument`; if the SDK then cannot
 * create the app it is `FirebaseError.NotInitialized`.
 *
 * @param {String} json_config The contents of a `google-services.json` file.
 * @param {String} name The name for the app, or an empty string to create the default app.
 *
 * @returns {Real} A handle to the new app, or `0` when it could not be created.
 *
 * @example
 * ```gml
 * var _buffer = buffer_load("second-project.json");
 * var _json = buffer_read(_buffer, buffer_text);
 * buffer_delete(_buffer);
 *
 * second_app = firebase_app_initialize_from_json(_json, "second");
 * ```
 * The above code loads a configuration file from the Included Files with `buffer_load`, reads it as
 * text and creates a named app from it. Keep such a file out of a public repository: it identifies
 * your Firebase project.
 * @function_end
 */

/**
 * @function firebase_app_handle_get_name
 * @desc **Firebase C++ SDK:** [firebase::App::name](https://firebase.google.com/docs/reference/cpp/class/firebase/app#name)
 *
 * This function returns the name of the app the given handle refers to.
 *
 * @param {Real} app The app handle.
 *
 * @returns {String} The app's name, or an empty string when the handle is not valid.
 *
 * @example
 * ```gml
 * show_debug_message("Second app: " + firebase_app_handle_get_name(second_app));
 * ```
 * The above code prints the name a second app was created with.
 * @function_end
 */

/**
 * @function firebase_app_handle_get_options
 * @desc **Firebase C++ SDK:** [firebase::App::options](https://firebase.google.com/docs/reference/cpp/class/firebase/app#options)
 *
 * This function returns the ${struct.FirebaseAppOptions} the app behind the given handle was created
 * with. Every variable of the struct is present; a setting the configuration did not supply is an
 * empty string.
 *
 * @param {Real} app The app handle.
 *
 * @returns {Struct.FirebaseAppOptions} The app's settings, or `undefined` when the handle is not valid.
 *
 * @example
 * ```gml
 * var _options = firebase_app_handle_get_options(second_app);
 * if (!is_undefined(_options))
 * {
 *     show_debug_message("Project: " + _options.project_id);
 * }
 * ```
 * The above code reads the project ID of a second app, checking for `undefined` first in case the
 * handle has been released.
 * @function_end
 */

/**
 * @function firebase_app_get_default_options
 * @desc **Firebase C++ SDK:** [firebase::App::options](https://firebase.google.com/docs/reference/cpp/class/firebase/app#options)
 *
 * This function returns the ${struct.FirebaseAppOptions} of the default app - the values read from
 * `google-services.json` or `GoogleService-Info.plist`. Every variable of the struct is present; a
 * setting the file did not supply is an empty string.
 *
 * @returns {Struct.FirebaseAppOptions} The default app's settings, or `undefined` when the default app does not exist.
 *
 * @example
 * ```gml
 * var _options = firebase_app_get_default_options();
 * show_debug_message("Project: " + _options.project_id + ", bucket: " + _options.storage_bucket);
 * ```
 * The above code prints the project ID and the storage bucket of the default app, which is a quick way
 * to check that the right configuration file made it into the build.
 * @function_end
 */

/**
 * @function firebase_app_release_handle
 * @desc This function releases an app handle returned by ${function.firebase_app_get_default_handle},
 * ${function.firebase_app_get_instance}, ${function.firebase_app_get_apps},
 * ${function.firebase_app_initialize_with_options} or ${function.firebase_app_initialize_from_json}.
 * Only the handle goes: the Firebase App itself is never destroyed, and a new handle to it can be
 * fetched at any time. Releasing a handle that was already released, or `0`, does nothing.
 *
 * @param {Real} app The app handle to release.
 *
 * @example
 * ```gml
 * var _app = firebase_app_get_default_handle();
 * firebase_messaging_initialize_for_app(_app);
 * firebase_app_release_handle(_app);
 * ```
 * The above code uses a handle for a single call and releases it straight after. The messaging
 * module keeps its own reference to the app, so the handle is not needed once the call has returned.
 * @function_end
 */

/**
 * @function firebase_set_log_level
 * @desc **Firebase C++ SDK:** [firebase::SetLogLevel](https://firebase.google.com/docs/reference/cpp/namespace/firebase#setloglevel)
 *
 * This function sets how much the Firebase SDK logs: every message at or above the given level is
 * written to the platform's log (logcat on Android, the system log on iOS, standard output on
 * desktop). The default is `FirebaseLogLevel.Info`. The setting is global - it
 * applies to every app and every product.
 *
 * A value that is not a ${constant.FirebaseLogLevel} member is refused: the level is left unchanged
 * and ${function.firebase_last_error_code} is `FirebaseError.InvalidArgument`.
 *
 * @param {Enum.FirebaseLogLevel} level The lowest level to log.
 *
 * @example
 * ```gml
 * if (debug_mode)
 * {
 *     firebase_set_log_level(FirebaseLogLevel.Verbose);
 * }
 * ```
 * The above code turns on the SDK's full logging while the game runs from the IDE, which is where the
 * SDK's own messages about a missing configuration or a rejected request are most useful.
 * @function_end
 */

/**
 * @function firebase_get_log_level
 * @desc **Firebase C++ SDK:** [firebase::GetLogLevel](https://firebase.google.com/docs/reference/cpp/namespace/firebase#getloglevel)
 *
 * This function returns the SDK's current log level, as set with ${function.firebase_set_log_level}.
 *
 * @returns {Enum.FirebaseLogLevel} The lowest level the SDK currently logs.
 *
 * @example
 * ```gml
 * if (firebase_get_log_level() > FirebaseLogLevel.Debug)
 * {
 *     firebase_set_log_level(FirebaseLogLevel.Debug);
 * }
 * ```
 * The above code lowers the log level to `Debug` unless it is already at `Debug` or `Verbose`.
 * @function_end
 */

/**
 * @function firebase_get_sdk_version
 * @desc This function returns the version of the Firebase C++ SDK the extension was built against,
 * as a string such as `"13.13.0"`. It is a compile-time constant, useful when reporting a problem.
 *
 * @returns {String} The Firebase C++ SDK version.
 *
 * @example
 * ```gml
 * show_debug_message("Firebase C++ SDK " + firebase_get_sdk_version());
 * ```
 * The above code prints the SDK version at start-up.
 * @function_end
 */

/**
 * @struct FirebaseAppOptions
 * @desc The settings a Firebase App is created from - the values `google-services.json` and
 * `GoogleService-Info.plist` carry. ${function.firebase_app_initialize_with_options} takes one,
 * created with `new FirebaseAppOptions()` (every variable starts `undefined`, and a variable left
 * that way keeps the SDK's default; a plain struct literal is refused). ${function.firebase_app_get_default_options}
 * and ${function.firebase_app_handle_get_options} return one with every variable present, an empty
 * string standing for a setting that was not supplied.
 *
 * @member {String} [app_id] The Firebase app ID that identifies this app (`mobilesdk_app_id` in `google-services.json`, `GOOGLE_APP_ID` in the plist).
 * @member {String} [api_key] The API key that authenticates requests from the app.
 * @member {String} [messaging_sender_id] The Cloud Messaging sender ID.
 * @member {String} [database_url] The Realtime Database root URL.
 * @member {String} [ga_tracking_id] The Google Analytics tracking ID.
 * @member {String} [storage_bucket] The Cloud Storage bucket name.
 * @member {String} [project_id] The Google Cloud project ID.
 * @struct_end
 */

/**
 * @const FirebaseError
 * @desc What every asynchronous function of this extension returns. `Ok` means the call reached the
 * SDK and the callback will be called exactly once with the SDK's own result. Any other value means
 * the call failed before the SDK was involved, the callback will never be called, and
 * ${function.firebase_last_error_code} and ${function.firebase_last_error_message} say why.
 *
 * The failure codes are negative on purpose, so they can never be mistaken for a product's own error
 * code (the SDK's are zero or positive). `Ok` is `0`: compare a return against `FirebaseError.Ok`,
 * never test it for truth - `if (firebase_..._(...))` runs on failure, not on success.
 *
 * @member Ok The call reached the SDK; the callback fires once with the result.
 * @member InvalidHandle A handle argument does not refer to a live object - it was never valid, or it has been released.
 * @member NotInitialized The module the function belongs to has not been initialised, or the default app does not exist.
 * @member InvalidArgument An argument was refused before the call - an enum value outside its range, a value of a kind the SDK cannot take, an empty name where one is required.
 * @member Unsupported The operation is not available on this platform, or is not implemented by this version of the extension.
 * @const_end
 */

/**
 * @const FirebaseLogLevel
 * @desc The Firebase SDK's log levels, from the most to the least verbose, for
 * ${function.firebase_set_log_level} and ${function.firebase_get_log_level}. Setting a level logs
 * every message at that level and above.
 *
 * @member Verbose Everything, including the SDK's internal tracing.
 * @member Debug Debugging detail.
 * @member Info Informational messages - the default.
 * @member Warning Warnings only.
 * @member Error Errors only.
 * @member Assert Assertion failures only.
 * @const_end
 */

/**
 * @module app
 * @title App
 * @desc This module covers the Firebase App every other module attaches to, the synchronous error
 * channel, the SDK's log level and the conventions the whole extension follows.
 *
 * ### Initialisation
 *
 * Call ${function.firebase_app_initialize} once, before any other function of this extension or of
 * the `GMFirebaseCrashlytics`, `GMFirebasePerformance` and `GMFirebaseInAppMessaging` extensions. It
 * reads the credential file the extension options point at (see ${page.getting_started} and
 * ${page.extension_options}) and creates the default app. Each product module then has its own
 * `initialize` function - ${function.firebase_analytics_initialize},
 * ${function.firebase_messaging_initialize} and so on, or creates itself on first use as
 * ${function.firebase_auth_get_auth} does - which attaches that product to the default app. The
 * `*_for_app` variants attach it to a second app instead, created with
 * ${function.firebase_app_initialize_with_options} or ${function.firebase_app_initialize_from_json}.
 *
 * ### Errors and callbacks
 *
 * Every function that takes a callback returns ${constant.FirebaseError} synchronously. `FirebaseError.Ok`
 * means the call reached the SDK and the callback will be called exactly once, on the game's own
 * thread, with the SDK's result: an `error_code` argument (`0` on success, otherwise the product's
 * own error enum - ${constant.FirebaseAuthError}, ${constant.FirestoreError},
 * ${constant.FirebaseDatabaseError}, ${constant.FirebaseRemoteConfigError} - or the SDK's raw code
 * where no enum is declared), an `error_message` string, and then the value the call produces, if
 * any. Any other return means the call failed before the SDK saw it, the callback will never be
 * called, and ${function.firebase_last_error_code} and ${function.firebase_last_error_message} hold
 * the reason.
 *
 * [[Warning: `FirebaseError.Ok` is `0`. Compare the return against `FirebaseError.Ok`; a truthy test
 * (`if (firebase_..._(...))`) runs its body on failure. The only functions of this extension that
 * return a plain success flag are the `initialize` family - ${function.firebase_app_initialize},
 * ${function.firebase_analytics_initialize} and their siblings.]]
 *
 * ### Handles
 *
 * Firebase objects - apps, users, references, documents, queries, snapshots - reach GML as numeric
 * handles. A function that returns one names the function that releases it, and `0` always means
 * "no object". A handle can be released as soon as the call that needed it has started: the SDK holds
 * what it needs, and the callback still fires. The one exception is a Cloud Storage reference on
 * Windows, macOS and Linux, which must stay alive until the callback of any operation started on it
 * has fired - see ${function.firebase_storage_ref_release}. A handle that was released, or never
 * valid, makes a call fail with `FirebaseError.InvalidHandle`.
 *
 * @section_func Functions
 * @desc The following functions are provided for the app, the error channel and logging:
 * @ref firebase_app_initialize
 * @ref firebase_app_is_initialized
 * @ref firebase_app_get_name
 * @ref firebase_last_error_code
 * @ref firebase_last_error_message
 * @ref firebase_app_get_default_handle
 * @ref firebase_app_get_instance
 * @ref firebase_app_get_apps
 * @ref firebase_app_initialize_with_options
 * @ref firebase_app_initialize_from_json
 * @ref firebase_app_handle_get_name
 * @ref firebase_app_handle_get_options
 * @ref firebase_app_get_default_options
 * @ref firebase_app_release_handle
 * @ref firebase_set_log_level
 * @ref firebase_get_log_level
 * @ref firebase_get_sdk_version
 * @section_end
 *
 * @section_struct Structs
 * @desc The following struct is used by this module:
 * @ref FirebaseAppOptions
 * @section_end
 *
 * @section_const Constants
 * @desc The following constants are used by this module:
 * @ref FirebaseError
 * @ref FirebaseLogLevel
 * @section_end
 *
 * @module_end
 */
