/**
 * @function firebase_analytics_initialize
 * @desc **Firebase C++ SDK:** [firebase::analytics::Initialize](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#initialize)
 *
 * This function starts Google Analytics for the default Firebase App and must be called once,
 * after ${function.firebase_app_initialize} and before any other function of this module. The SDK
 * aborts the game when an analytics call reaches it uninitialised, so every function here refuses
 * first: the calls that return ${constant.FirebaseError} return `FirebaseError.NotInitialized`,
 * the others do nothing and set ${function.firebase_last_error_code}. On Android and iOS the
 * platform SDK is already collecting from launch - the automatic events, screen views, the
 * session - and this call connects the module to it. On Windows it loads `google_analytics.dll`
 * from the game's folder; see the Platforms section of ${module.analytics}.
 *
 * @returns {Real} `1` when the module is initialised, `0` when the default app does not exist.
 *
 * @example
 * ```gml
 * // Create Event of a persistent controller, after firebase_app_initialize()
 * if (!firebase_analytics_initialize())
 * {
 *     show_debug_message($"Analytics unavailable: {firebase_last_error_message()}");
 *     exit;
 * }
 * firebase_analytics_set_user_property("player_class", save_data.player_class);
 * firebase_analytics_log_event("game_start");
 * ```
 * The above code initialises Analytics, tags the player with a property every later event
 * carries, and logs the first event of the session.
 * @function_end
 */

/**
 * @function firebase_analytics_terminate
 * @desc **Firebase C++ SDK:** [firebase::analytics::Terminate](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#terminate)
 *
 * This function shuts the module down: the functions refuse again until the next
 * ${function.firebase_analytics_initialize}. The platform SDK keeps collecting its automatic
 * events underneath on Android and iOS. There is no need to call it when the game exits.
 *
 * @function_end
 */

/**
 * @function firebase_analytics_set_analytics_collection_enabled
 * @desc **Firebase C++ SDK:** [firebase::analytics::SetAnalyticsCollectionEnabled](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#setanalyticscollectionenabled)
 *
 * This function turns collection on or off for this game on this device: off, nothing is logged
 * or uploaded - not the automatic events either - until it is turned on again. The setting is
 * stored on the device and holds across launches, so a consent screen needs the call once. It is
 * the runtime half of the `disableDataCollection` extension option (see
 * ${page.extension_options}): a game built with the option ships with collection off from the
 * first launch, and calls this function with `1` once the player has agreed. By default
 * collection is on. It does nothing before ${function.firebase_analytics_initialize}.
 *
 * @param {Real} enabled `1` to collect, `0` to stop.
 *
 * @example
 * ```gml
 * // The consent screen's buttons
 * if (player_accepted)
 * {
 *     firebase_analytics_set_analytics_collection_enabled(1);
 *     firebase_analytics_set_consent(1, 1, 1, 1);
 * }
 * else
 * {
 *     firebase_analytics_set_consent(0, 1, 0, 0);
 * }
 * ```
 * The above code is a consent screen for a game built with `disableDataCollection`: acceptance
 * turns collection on and grants every consent type, refusal keeps analytics storage - the
 * game's own measurement - and denies the advertising ones.
 * @function_end
 */

/**
 * @function firebase_analytics_set_consent
 * @desc **Firebase C++ SDK:** [firebase::analytics::SetConsent](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#setconsent)
 *
 * This function sets the player's consent for the four purposes Google's consent mode defines,
 * which decide how Analytics and Google Ads may use the data this device sends: `ad_storage`
 * (advertising cookies and identifiers), `analytics_storage` (analytics identifiers, which also
 * decides whether the game's own measurement is tied to a device), `ad_user_data` (sending user
 * data to Google for advertising) and `ad_personalization` (personalised advertising). All four
 * are set on every call - there is no "leave unchanged" - and the settings are stored on the
 * device across launches. By default every type is granted. A game that shows no ads and only
 * measures itself typically grants `analytics_storage` alone. On Windows, macOS and Linux the
 * call does nothing. It does nothing before ${function.firebase_analytics_initialize}.
 *
 * @param {Real} ad_storage `1` to grant, `0` to deny storage for advertising.
 * @param {Real} analytics_storage `1` to grant, `0` to deny storage for analytics.
 * @param {Real} ad_user_data `1` to grant, `0` to deny sending user data for advertising.
 * @param {Real} ad_personalization `1` to grant, `0` to deny personalised advertising.
 * @function_end
 */

/**
 * @function firebase_analytics_log_event
 * @desc **Firebase C++ SDK:** [firebase::analytics::LogEvent](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#logevent_4)
 *
 * This function logs an event with no parameters - a thing that happened, counted. A game may use up to 500 distinct event names; Google's recommended names (`level_start`,
 * `level_end`, `post_score`, `unlock_achievement`, `purchase`, ...) get reports of their own in the
 * console, and any other name is a custom event. Names are case-sensitive, and the `firebase_`, `google_` and `ga_` prefixes are reserved. Events
 * are batched on the device and uploaded in the background, on Android and iOS typically within
 * an hour or when the game goes to the background. It does nothing before ${function.firebase_analytics_initialize}.
 *
 * @param {String} name The event's name: 1 to 40 letters, digits and underscores, starting with a letter.
 * @function_end
 */

/**
 * @function firebase_analytics_log_event_string
 * @desc **Firebase C++ SDK:** [firebase::analytics::LogEvent](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#logevent)
 *
 * This function logs an event with one string parameter, such as `level_start` with `level_name`. A game may use up to 500 distinct event names; Google's recommended names (`level_start`,
 * `level_end`, `post_score`, `unlock_achievement`, `purchase`, ...) get reports of their own in the
 * console, and any other name is a custom event. Names are case-sensitive, and the `firebase_`, `google_` and `ga_` prefixes are reserved. It does nothing before ${function.firebase_analytics_initialize}.
 *
 * @param {String} name The event's name: 1 to 40 letters, digits and underscores, starting with a letter.
 * @param {String} parameter_name The parameter's name: 1 to 40 letters, digits and underscores, starting with a letter.
 * @param {String} parameter_value The parameter's value, up to 100 characters.
 * @function_end
 */

/**
 * @function firebase_analytics_log_event_number
 * @desc **Firebase C++ SDK:** [firebase::analytics::LogEvent](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#logevent_1)
 *
 * This function logs an event with one numeric parameter, such as `post_score` with `score`. A game may use up to 500 distinct event names; Google's recommended names (`level_start`,
 * `level_end`, `post_score`, `unlock_achievement`, `purchase`, ...) get reports of their own in the
 * console, and any other name is a custom event. Names are case-sensitive, and the `firebase_`, `google_` and `ga_` prefixes are reserved. It does nothing before ${function.firebase_analytics_initialize}.
 *
 * @param {String} name The event's name: 1 to 40 letters, digits and underscores, starting with a letter.
 * @param {String} parameter_name The parameter's name: 1 to 40 letters, digits and underscores, starting with a letter.
 * @param {Real} parameter_value The parameter's value.
 * @function_end
 */

/**
 * @function firebase_analytics_log_event_params
 * @desc **Firebase C++ SDK:** [firebase::analytics::LogEvent](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#logevent_6)
 *
 * This function logs an event with any number of parameters, up to 25, each a ${struct.FirebaseAnalyticsParameter}
 * holding a name and a number or string value - or, for the `items` parameter of the e-commerce
 * events, an array of structs, one per item. A parameter with an empty name is skipped. A game may use up to 500 distinct event names; Google's recommended names (`level_start`,
 * `level_end`, `post_score`, `unlock_achievement`, `purchase`, ...) get reports of their own in the
 * console, and any other name is a custom event. Names are case-sensitive, and the `firebase_`, `google_` and `ga_` prefixes are reserved. It does nothing before ${function.firebase_analytics_initialize}.
 *
 * @param {String} name The event's name: 1 to 40 letters, digits and underscores, starting with a letter.
 * @param {Array[Struct.FirebaseAnalyticsParameter]} params An array of ${struct.FirebaseAnalyticsParameter} structs, up to 25.
 *
 * @example
 * ```gml
 * firebase_analytics_log_event_params("level_end", [
 *     { name: "level_name", value: room_get_name(room) },
 *     { name: "success", value: won ? 1 : 0 },
 *     { name: "duration_seconds", value: round(level_time / 1000000) },
 *     { name: "deaths", value: deaths }
 * ]);
 * ```
 * The above code logs Google's recommended `level_end` event with its `level_name` and `success`
 * parameters plus two of the game's own, as an array of name/value structs.
 * @function_end
 */

/**
 * @function firebase_analytics_set_default_event_parameters
 * @desc **Firebase C++ SDK:** [firebase::analytics::SetDefaultEventParameters](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#setdefaulteventparameters_1)
 *
 * This function adds parameters to every event logged from now on, the automatic ones included -
 * a build number, a platform variant, the player's chosen difficulty - without repeating them on
 * each call. The parameters are merged into the set already there, stored on the device across
 * launches, and a parameter given on an event itself wins over a default of the same name. The
 * same limits as event parameters apply. It does nothing before ${function.firebase_analytics_initialize}.
 *
 * @param {Array[Struct.FirebaseAnalyticsParameter]} params An array of ${struct.FirebaseAnalyticsParameter} structs, up to 25.
 * @function_end
 */

/**
 * @function firebase_analytics_log_apple_transaction
 * @desc **Firebase C++ SDK:** [firebase::analytics::LogAppleTransaction](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#logappletransaction)
 *
 * This function logs an in-app purchase made through StoreKit 2 on iOS as an Analytics purchase
 * event, by the transaction's id: the SDK looks the transaction up in the device's purchase
 * history and logs its product and price, and logs nothing when no transaction with that id is
 * found. On every other platform the callback fires at once with `0`.
 *
 * The function returns `FirebaseError.NotInitialized` without calling the callback when
 * ${function.firebase_analytics_initialize} has not run.
 *
 * @param {String} transaction_id The StoreKit 2 transaction id, as a string.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the transaction has been logged, or could not be.
 * @member {Real} error_code `0` on success, otherwise the SDK's error code.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_analytics_set_user_property
 * @desc **Firebase C++ SDK:** [firebase::analytics::SetUserProperty](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#setuserproperty)
 *
 * This function sets a property of the player - a class, a tier, a chosen difficulty - that every
 * event logged from then on carries, so that the console can compare groups of players. A game
 * may have up to 25 user properties; each has to be registered once under **Analytics > Custom
 * definitions** in the console before it appears in reports. An empty value removes the property.
 * Names are case-sensitive, and the `firebase_`, `google_` and `ga_` prefixes are reserved. It does nothing before ${function.firebase_analytics_initialize}.
 *
 * @param {String} name The property's name: 1 to 40 letters, digits and underscores, starting with a letter.
 * @param {String} value The value, a short string; an empty string removes the property.
 * @function_end
 */

/**
 * @function firebase_analytics_set_user_id
 * @desc **Firebase C++ SDK:** [firebase::analytics::SetUserId](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#setuserid)
 *
 * This function sets the id Analytics uses to recognise the same player across devices - the
 * game's own account id, such as the ${function.firebase_auth_user_uid} of the signed-in user,
 * never an email address or a name. An empty string removes it. Google's privacy policy governs
 * its use. It does nothing before ${function.firebase_analytics_initialize}.
 *
 * @param {String} user_id The player's id, up to 256 characters; an empty string removes it.
 * @function_end
 */

/**
 * @function firebase_analytics_set_session_timeout_duration
 * @desc **Firebase C++ SDK:** [firebase::analytics::SetSessionTimeoutDuration](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#setsessiontimeoutduration)
 *
 * This function sets how long the game may stay in the background before the next event starts a
 * new session rather than continuing the old one. The default is 30 minutes. It does nothing before ${function.firebase_analytics_initialize}.
 *
 * @param {Real} milliseconds The idle time that ends a session, in milliseconds.
 * @function_end
 */

/**
 * @function firebase_analytics_reset_analytics_data
 * @desc **Firebase C++ SDK:** [firebase::analytics::ResetAnalyticsData](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#resetanalyticsdata)
 *
 * This function clears every piece of analytics data the SDK holds for this game on this device
 * and gives it a new app instance id, so that nothing logged afterwards can be tied to what came
 * before - the call to make when a player deletes their account or withdraws consent. It does nothing before ${function.firebase_analytics_initialize}.
 *
 * @function_end
 */

/**
 * @function firebase_analytics_get_analytics_instance_id
 * @desc **Firebase C++ SDK:** [firebase::analytics::GetAnalyticsInstanceId](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#getanalyticsinstanceid)
 *
 * This function fetches the app instance id: the identifier Analytics gave this installation of
 * the game, which is what the exported data (BigQuery's `user_pseudo_id`) and the Measurement
 * Protocol identify a device by. It changes after ${function.firebase_analytics_reset_analytics_data}.
 * On Windows, macOS and Linux the callback receives a placeholder id.
 *
 * The function returns `FirebaseError.NotInitialized` without calling the callback when
 * ${function.firebase_analytics_initialize} has not run.
 *
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the id.
 * @member {Real} error_code `0` on success, otherwise the SDK's error code.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {String} instance_id The app instance id, or an empty string on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_analytics_get_session_id
 * @desc **Firebase C++ SDK:** [firebase::analytics::GetSessionId](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#getsessionid)
 *
 * This function fetches the id of the current session - the number Analytics stamps on every
 * event of the session as `ga_session_id`, useful to join the game's own logs to the console's.
 * It fails when collection is off or no session is running. On Windows, macOS and Linux the
 * callback receives a placeholder id.
 *
 * The function returns `FirebaseError.NotInitialized` without calling the callback when
 * ${function.firebase_analytics_initialize} has not run.
 *
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the id.
 * @member {Real} error_code `0` on success, otherwise the SDK's error code.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} session_id The session id, or `0` on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_analytics_notify_app_lifecycle_termination
 * @desc **Firebase C++ SDK:** [firebase::analytics::NotifyAppLifecycleChange](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#notifyapplifecyclechange)
 *
 * This function tells the Windows Analytics library that the game is about to exit, so that it
 * uploads the events still batched on the device before the process ends; the call blocks until
 * the upload is done or fails. Call it from the Game End event of the controller that owns the
 * module. It does nothing on other platforms, where the platform SDK handles termination itself.
 * ${function.firebase_analytics_notify_app_lifecycle_change} is the general form. It does nothing before ${function.firebase_analytics_initialize}.
 *
 * @function_end
 */

/**
 * @function firebase_analytics_is_desktop_initialized
 * @desc **Firebase C++ SDK:** [firebase::analytics::IsDesktopInitialized](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#isdesktopinitialized)
 *
 * This function returns whether the Windows Analytics library was found and started: `1` when
 * `google_analytics.dll` was loaded from the game's folder at
 * ${function.firebase_analytics_initialize} and initialised, `0` when it was not - in which case
 * every call on Windows is a no-op. It returns `0` on every other platform.
 *
 * @returns {Real} `1` when Analytics is live on Windows, otherwise `0`.
 * @function_end
 */

/**
 * @function firebase_analytics_set_desktop_debug_mode
 * @desc **Firebase C++ SDK:** [firebase::analytics::SetDesktopDebugMode](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#setdesktopdebugmode)
 *
 * This function turns debug mode on or off for the Windows library: on, events are uploaded at
 * once and marked as debug events, so that they appear in the console's **DebugView** as they
 * happen instead of in the reports hours later. It does nothing on other platforms - Android and
 * iOS enable DebugView from the platform's side, with `adb shell setprop debug.firebase.analytics.app`
 * and the `-FIRDebugEnabled` launch argument. It does nothing before ${function.firebase_analytics_initialize}.
 *
 * @param {Real} enabled `1` for debug mode, `0` for normal operation.
 * @function_end
 */

/**
 * @function firebase_analytics_set_log_callback
 * @desc **Firebase C++ SDK:** [firebase::analytics::SetLogCallback](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#setlogcallback)
 *
 * This function routes the Windows Analytics library's own log messages to a GML function - the
 * way to see why `google_analytics.dll` did not load or an event was refused. Pass `undefined` to
 * stop. It does nothing on other platforms. It does nothing before ${function.firebase_analytics_initialize}.
 *
 * @param {Function} [callback] The function to call with each message, or `undefined` to stop.
 *
 * @event callback
 * @desc Fires for each message the library logs.
 * @member {Enum.FirebaseLogLevel} level The message's level.
 * @member {String} message The message.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_analytics_initiate_on_device_conversion_measurement_email
 * @desc **Firebase C++ SDK:** [firebase::analytics::InitiateOnDeviceConversionMeasurementWithEmailAddress](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#initiateondeviceconversionmeasurementwithemailaddress)
 *
 * This function starts on-device conversion measurement for a player identified by email
 * address - an iOS feature that matches the player to an ad they saw without the address leaving
 * the device, for measuring the ads that brought players to the game.
 *
 * It is iOS-only: on Android, Windows, macOS and Linux the call does nothing. The
 * `GoogleAdsOnDeviceConversion` framework it needs comes with the `FirebaseAnalytics` pod the
 * extension pins, so nothing has to be added to the iOS build. It does nothing before
 * ${function.firebase_analytics_initialize}.
 *
 * @param {String} email_address The player's email address, domain included.
 * @function_end
 */

/**
 * @function firebase_analytics_initiate_on_device_conversion_measurement_phone
 * @desc **Firebase C++ SDK:** [firebase::analytics::InitiateOnDeviceConversionMeasurementWithPhoneNumber](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#initiateondeviceconversionmeasurementwithphonenumber)
 *
 * This function is ${function.firebase_analytics_initiate_on_device_conversion_measurement_email}
 * for a phone number.
 *
 * It is iOS-only, like ${function.firebase_analytics_initiate_on_device_conversion_measurement_email}.
 * It does nothing before ${function.firebase_analytics_initialize}.
 *
 * @param {String} phone_number The player's phone number in E.164 format (`"+14155552671"`).
 * @function_end
 */

/**
 * @function firebase_analytics_notify_app_lifecycle_change
 * @desc **Firebase C++ SDK:** [firebase::analytics::NotifyAppLifecycleChange](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#notifyapplifecyclechange)
 *
 * This function tells the Windows Analytics library about a change of the game's lifecycle state.
 * The SDK defines two states: `0`, unknown, and `1`, termination - which is what
 * ${function.firebase_analytics_notify_app_lifecycle_termination} sends. It does nothing on other
 * platforms. It does nothing before ${function.firebase_analytics_initialize}.
 *
 * @param {Real} state The lifecycle state: `1` for termination.
 * @function_end
 */

/**
 * @function firebase_analytics_initiate_on_device_conversion_measurement_hashed_email
 * @desc **Firebase C++ SDK:** [firebase::analytics::InitiateOnDeviceConversionMeasurementWithHashedEmailAddress](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#initiateondeviceconversionmeasurementwithhashedemailaddress)
 *
 * This function is ${function.firebase_analytics_initiate_on_device_conversion_measurement_email}
 * for an email address the game has already normalised and SHA-256 hashed, as Google's on-device
 * measurement guide describes, passed as the raw 32 bytes of the hash.
 *
 * It is iOS-only, like ${function.firebase_analytics_initiate_on_device_conversion_measurement_email}.
 * It does nothing before ${function.firebase_analytics_initialize}.
 *
 * @param {Buffer} hashed_email A buffer holding the hash's bytes.
 * @function_end
 */

/**
 * @function firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone
 * @desc **Firebase C++ SDK:** [firebase::analytics::InitiateOnDeviceConversionMeasurementWithHashedPhoneNumber](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#initiateondeviceconversionmeasurementwithhashedphonenumber)
 *
 * This function is ${function.firebase_analytics_initiate_on_device_conversion_measurement_phone}
 * for a phone number the game has already normalised to E.164 and SHA-256 hashed, passed as the
 * raw 32 bytes of the hash.
 *
 * It is iOS-only, like ${function.firebase_analytics_initiate_on_device_conversion_measurement_email}.
 * It does nothing before ${function.firebase_analytics_initialize}.
 *
 * @param {Buffer} hashed_phone A buffer holding the hash's bytes.
 * @function_end
 */

/**
 * @function firebase_analytics_initialize_for_app
 * @desc **Firebase C++ SDK:** [firebase::analytics::Initialize](https://firebase.google.com/docs/reference/cpp/namespace/firebase/analytics#initialize)
 *
 * This function is ${function.firebase_analytics_initialize} for another Firebase App, created
 * with ${function.firebase_app_initialize_with_options} or
 * ${function.firebase_app_initialize_from_json}. Analytics is initialised once per game, for one
 * app.
 *
 * @param {Real} app An app handle.
 * @returns {Real} `1` when the module is initialised, `0` when the app handle is not valid.
 * @function_end
 */

/**
 * @struct FirebaseAnalyticsParameter
 * @desc **Firebase C++ SDK:** [firebase::analytics::Parameter](https://firebase.google.com/docs/reference/cpp/struct/firebase/analytics/parameter)
 *
 * One event parameter, for ${function.firebase_analytics_log_event_params} and
 * ${function.firebase_analytics_set_default_event_parameters}: a name and a value. Written as a
 * struct literal, `{ name: "score", value: 1200 }`.
 *
 * @member {String} name The parameter's name: 1 to 40 letters, digits and underscores, starting with a letter; `firebase_`, `google_` and `ga_` are reserved.
 * @member {Any} value A number, a string of up to 100 characters, or - for the `items` parameter of e-commerce events - an array of structs.
 * @struct_end
 */

/**
 * @module analytics
 * @title Analytics
 * @desc This module covers Google Analytics for Firebase: events the game logs - a level finished, a
 * purchase, an achievement - with parameters, user properties that group players, and the
 * sessions and audiences the console builds from them, feeding the other products' targeting
 * (Remote Config conditions, Cloud Messaging audiences, In-App Messaging triggers). The platform
 * SDK collects a set of events on its own - first open, session start, app update, screen views
 * on the platform's terms - and the module adds the game's. Everything starts with
 * ${function.firebase_analytics_initialize}, after ${function.firebase_app_initialize}.
 *
 * ### Platforms
 *
 * Analytics works fully on Android and iOS. On Windows the SDK loads Google Analytics from a
 * `google_analytics.dll` beside the game's executable and runs every call as a no-op without it;
 * ${function.firebase_analytics_is_desktop_initialized} says which. The SDK package does not
 * include that DLL: the README says where to download it (the SDK repository, at the tag matching
 * the pinned version) and where to put it (`libs/windows/` under the SDK root), and the Windows
 * build step copies it beside the executable from there. The SDK checks the DLL's hash against a
 * list compiled into the pinned library, so a DLL from another SDK version is refused and Analytics
 * stays a no-op - ${function.firebase_analytics_set_log_callback} shows the "Hash mismatch for
 * Analytics DLL." line when that happens. One flow cannot load it at all: a Run from the IDE (VM)
 * executes the game inside the runtime's own runner, whose folder is the runtime's, and the SDK
 * only looks beside the running executable - so on an IDE run
 * ${function.firebase_analytics_is_desktop_initialized} reads `0` and Analytics is the stub, while a
 * packaged or YYC build is its own executable and loads the DLL. On macOS and Linux every call is a
 * no-op. On all three, ${function.firebase_analytics_get_analytics_instance_id} and
 * ${function.firebase_analytics_get_session_id} answer with placeholder ids,
 * ${function.firebase_analytics_set_consent} does nothing, and the functions in the Desktop
 * section are Windows-only. Game code need not branch: the calls are safe everywhere.
 *
 * ### Events and parameters
 *
 * An event has a name and up to 25 parameters, each a number or a string (or, for the
 * e-commerce `items` parameter, an array of structs); a game may log up to 500 distinct event
 * names, and the recommended names Google publishes get purpose-built reports in the console.
 * Names are 1 to 40 letters, digits and underscores starting with a letter, case-sensitive, with
 * the `firebase_`, `google_` and `ga_` prefixes reserved; string values are up to 100 characters.
 * Events are queued on the device and uploaded in batches, so nothing here is asynchronous
 * except the two id fetches and the Apple transaction.
 *
 * ### Consent
 *
 * Collection is on by default from the first launch on Android and iOS, before any code runs.
 * A game that needs consent first ships with the `disableDataCollection` extension option (see
 * ${page.extension_options}), which turns collection off in the manifest and the `Info.plist`,
 * and calls ${function.firebase_analytics_set_analytics_collection_enabled} with `1` once the
 * player has agreed; ${function.firebase_analytics_set_consent} sets the finer-grained consent
 * mode signals for advertising. Both are stored on the device.
 *
 * ### Console setup
 *
 * Analytics is enabled on the project when it is created, or afterwards under **Analytics** in
 * the console; the credential file carries what the SDK needs. Events appear in **Analytics >
 * Events** hours after they are logged, or at once in **DebugView** for a device in debug mode.
 * Custom parameters and user properties are registered under **Analytics > Custom definitions**
 * before they show in reports.
 *
 * @section_func Initialisation
 * @desc Starting and stopping the module:
 * @ref firebase_analytics_initialize
 * @ref firebase_analytics_initialize_for_app
 * @ref firebase_analytics_terminate
 * @section_end
 *
 * @section_func Collection and consent
 * @desc Turning collection on or off, the consent mode signals, and the reset:
 * @ref firebase_analytics_set_analytics_collection_enabled
 * @ref firebase_analytics_set_consent
 * @ref firebase_analytics_reset_analytics_data
 * @section_end
 *
 * @section_func Events
 * @desc Logging events, with none, one or many parameters, the parameters every event carries, and
 * Apple purchases:
 * @ref firebase_analytics_log_event
 * @ref firebase_analytics_log_event_string
 * @ref firebase_analytics_log_event_number
 * @ref firebase_analytics_log_event_params
 * @ref firebase_analytics_set_default_event_parameters
 * @ref firebase_analytics_log_apple_transaction
 * @section_end
 *
 * @section_func Users and sessions
 * @desc Describing the player, and the ids of the installation and the session:
 * @ref firebase_analytics_set_user_property
 * @ref firebase_analytics_set_user_id
 * @ref firebase_analytics_set_session_timeout_duration
 * @ref firebase_analytics_get_analytics_instance_id
 * @ref firebase_analytics_get_session_id
 * @section_end
 *
 * @section_func Desktop
 * @desc The Windows library's own controls; no-ops elsewhere:
 * @ref firebase_analytics_is_desktop_initialized
 * @ref firebase_analytics_set_desktop_debug_mode
 * @ref firebase_analytics_set_log_callback
 * @ref firebase_analytics_notify_app_lifecycle_termination
 * @ref firebase_analytics_notify_app_lifecycle_change
 * @section_end
 *
 * @section_func On-device conversion measurement
 * @desc Matching a player to the ad that brought them, on the device; not linked in this version:
 * @ref firebase_analytics_initiate_on_device_conversion_measurement_email
 * @ref firebase_analytics_initiate_on_device_conversion_measurement_phone
 * @ref firebase_analytics_initiate_on_device_conversion_measurement_hashed_email
 * @ref firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone
 * @section_end
 *
 * @section_struct Structs
 * @desc The following structs are used by this module:
 * @ref FirebaseAnalyticsParameter
 * @section_end
 *
 * @module_end
 */
