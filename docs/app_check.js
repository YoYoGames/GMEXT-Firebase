/**
 * @function firebase_app_check_set_provider_factory
 * @desc **Firebase C++ SDK:** [firebase::app_check::AppCheck::SetAppCheckProviderFactory](https://firebase.google.com/docs/reference/cpp/class/firebase/app-check/app-check#setappcheckproviderfactory)
 *
 * This function chooses how this build proves it is the genuine game: a ${constant.FirebaseAppCheckProvider}
 * naming the platform's attestation service - `PlayIntegrity` on Android, `DeviceCheck` or
 * `AppAttest` on iOS - or `Debug`, which exchanges a debug token registered in the console for an
 * App Check token and is the only provider that works on Windows, macOS and Linux, on an emulator
 * or a simulator. Call it before ${function.firebase_app_initialize}: iOS reads the choice when
 * the app is created, the other platforms when App Check is first used, and before initialisation
 * is the rule that holds everywhere. Without it App Check mints no tokens and every request goes
 * out unattested, which the services refuse once enforcement is on for them. A provider the
 * platform does not have is logged as unsupported and installs nothing, so token requests then
 * fail as they would with no provider at all.
 *
 * [[Warning: The `Debug` provider must only be selected in a development configuration. A debug
 * token in a shipped build is a way around App Check for anyone who extracts it; the extension
 * does not remove the provider from release builds, so the game's configuration has to.]]
 *
 * @param {Enum.FirebaseAppCheckProvider} provider The provider for this build.
 *
 * @example
 * ```gml
 * // Create Event, before firebase_app_initialize()
 * if (os_type == os_android)
 * {
 *     firebase_app_check_set_provider_factory(FirebaseAppCheckProvider.PlayIntegrity);
 * }
 * else if (os_type == os_ios)
 * {
 *     firebase_app_check_set_provider_factory(FirebaseAppCheckProvider.AppAttest);
 * }
 * else if (DEBUG_BUILD)   // a configuration-scoped macro, never true in a shipped build
 * {
 *     firebase_app_check_set_provider_factory(FirebaseAppCheckProvider.Debug);
 * }
 * firebase_app_initialize();
 * ```
 * The above code picks the platform's attestation on the stores' platforms and the debug
 * provider on desktop, where there is no other - gated by a macro that release configurations
 * define as `false`, so a shipped desktop build sends no App Check tokens rather than a debug
 * one.
 * @function_end
 */

/**
 * @function firebase_app_check_debug_provider_set_debug_token
 * @desc **Firebase C++ SDK:** [firebase::app_check::DebugAppCheckProviderFactory::SetDebugToken](https://firebase.google.com/docs/reference/cpp/class/firebase/app-check/debug-app-check-provider-factory#setdebugtoken)
 *
 * This function sets the debug token the `Debug` provider exchanges for App Check tokens - a
 * string registered under **App Check > Apps > Manage debug tokens** in the console. Call it
 * before ${function.firebase_app_initialize}. Without it, on Windows, macOS and Linux the SDK
 * reads the `APP_CHECK_DEBUG_TOKEN` environment variable, or generates a fresh token at every
 * launch and prints it to the debug log with the console link to register it at; a token set here
 * or in the variable survives launches, which is the usual choice for a development machine. On
 * Android and iOS the platform SDK manages the debug token itself.
 *
 * [[Important: A debug token is a secret: it lets anything that presents it pass as the game.
 * Keep it out of source control and out of shipped builds, and delete it from the console when
 * it is no longer needed.]]
 *
 * @param {String} token The debug token, as registered in the console.
 * @function_end
 */

/**
 * @function firebase_app_check_get_instance
 * @desc **Firebase C++ SDK:** [firebase::app_check::AppCheck::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/app-check/app-check#getinstance)
 *
 * This function returns a handle to the App Check instance of the default app, the one
 * ${function.firebase_app_initialize} set up. The token and listener functions take this handle,
 * or the one ${function.firebase_app_check_get_instance_for_app} returns for another app. The SDK
 * keeps one instance per app, so the same handle comes back on every call and there is nothing
 * to release.
 *
 * @returns {Real} The App Check handle, or `0` when ${function.firebase_app_initialize} has not run.
 * @function_end
 */

/**
 * @function firebase_app_check_get_instance_for_app
 * @desc **Firebase C++ SDK:** [firebase::app_check::AppCheck::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/app-check/app-check#getinstance)
 *
 * This function returns a handle to the App Check instance of another Firebase App, created with
 * ${function.firebase_app_initialize_with_options} or ${function.firebase_app_initialize_from_json}.
 * The provider set with ${function.firebase_app_check_set_provider_factory} applies to every
 * app. As with the default app's handle, the same one comes back on every call and there is
 * nothing to release.
 *
 * @param {Real} app An app handle.
 * @returns {Real} The App Check handle, or `0` when the app handle is not valid.
 * @function_end
 */

/**
 * @function firebase_app_check_get_app
 * @desc **Firebase C++ SDK:** [firebase::app_check::AppCheck::app](https://firebase.google.com/docs/reference/cpp/class/firebase/app-check/app-check#app)
 *
 * This function returns a handle to the Firebase App an App Check instance attests for. Release
 * it with ${function.firebase_app_release_handle}.
 *
 * @param {Real} app_check An App Check handle from ${function.firebase_app_check_get_instance} or ${function.firebase_app_check_get_instance_for_app}.
 * @returns {Real} An app handle, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_app_check_set_token_auto_refresh_enabled
 * @desc **Firebase C++ SDK:** [firebase::app_check::AppCheck::SetTokenAutoRefreshEnabled](https://firebase.google.com/docs/reference/cpp/class/firebase/app-check/app-check#settokenautorefreshenabled)
 *
 * This function turns automatic token refresh on or off for the app the handle belongs to: on,
 * the SDK mints a new token whenever a request needs one and the current one has expired - the
 * Android and iOS SDKs ahead of expiry, the desktop SDK at the request; off, requests use only
 * tokens the game fetched itself with ${function.firebase_app_check_get_token} and have none once
 * the last one has expired. On Android and iOS the setting otherwise follows the app's
 * data-collection default, which the `disableDataCollection` extension option turns off (see
 * ${page.extension_options}), so a game built with the option turns refresh on here once the
 * player has consented; on Windows, macOS and Linux it is on from the start. Nothing happens
 * when the handle is not valid.
 *
 * @param {Real} app_check An App Check handle from ${function.firebase_app_check_get_instance} or ${function.firebase_app_check_get_instance_for_app}.
 * @param {Bool} enabled `true` to refresh tokens ahead of expiry, `false` to fetch on demand only.
 * @function_end
 */

/**
 * @function firebase_app_check_get_token
 * @desc **Firebase C++ SDK:** [firebase::app_check::AppCheck::GetAppCheckToken](https://firebase.google.com/docs/reference/cpp/class/firebase/app-check/app-check#getappchecktoken)
 *
 * This function fetches the current App Check token for the app the handle belongs to, minting
 * one through the provider when there is none or `force_refresh` asks for a fresh one. Requests to Firebase's own services are attested automatically once a provider is set; this
 * call is for the game's own backend, which receives the token in a header and verifies it with
 * the Firebase Admin SDK. A
 * token is valid for about an hour; ${struct.FirebaseAppCheckToken} carries its expiry, and
 * ${function.firebase_app_check_add_listener} reports each new one without polling.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when the
 * handle is not valid.
 *
 * @param {Real} app_check An App Check handle from ${function.firebase_app_check_get_instance} or ${function.firebase_app_check_get_instance_for_app}.
 * @param {Bool} force_refresh `true` to mint a new token even when the current one is still valid, `false` to reuse it.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the token.
 * @member {Enum.FirebaseAppCheckError} error_code `FirebaseAppCheckError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Struct.FirebaseAppCheckToken} token The token and its expiry, or `undefined` on failure.
 * @event_end
 *
 * @example
 * ```gml
 * var _app_check = firebase_app_check_get_instance();
 * firebase_app_check_get_token(_app_check, false, function(_error, _message, _token)
 * {
 *     if (_error != FirebaseAppCheckError.None)
 *     {
 *         show_debug_message($"App Check failed ({_error}): {_message}");
 *         exit;
 *     }
 *     var _headers = ds_map_create();
 *     ds_map_add(_headers, "X-Firebase-AppCheck", _token.token);
 *     request = http_request(api_url + "/claim", "POST", _headers, json_stringify(claim));
 *     ds_map_destroy(_headers);
 * });
 * ```
 * The above code fetches the default app's token and sends it to the game's own server in the
 * `X-Firebase-AppCheck` header, which is where the Firebase Admin SDK's verification expects it;
 * the server rejects requests whose token is missing or forged.
 * @function_end
 */

/**
 * @function firebase_app_check_get_limited_use_token
 * @desc **Firebase C++ SDK:** [firebase::app_check::AppCheck::GetLimitedUseAppCheckToken](https://firebase.google.com/docs/reference/cpp/class/firebase/app-check/app-check#getlimiteduseappchecktoken)
 *
 * This function mints a limited-use App Check token for the app the handle belongs to: a
 * short-lived token meant to be consumed once by the game's backend (the Admin SDK's
 * `consumeAppCheckToken`), so that a request captured in transit cannot be replayed. It always
 * goes to the provider, so it costs an attestation per call; use it for the requests that
 * matter - a purchase, a reward claim - and ${function.firebase_app_check_get_token} for the
 * rest. Requests to Firebase's own services are attested automatically once a provider is set; this
 * call is for the game's own backend, which receives the token in a header and verifies it with
 * the Firebase Admin SDK.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when the
 * handle is not valid.
 *
 * @param {Real} app_check An App Check handle from ${function.firebase_app_check_get_instance} or ${function.firebase_app_check_get_instance_for_app}.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the token.
 * @member {Enum.FirebaseAppCheckError} error_code `FirebaseAppCheckError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Struct.FirebaseAppCheckToken} token The token and its expiry, or `undefined` on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_app_check_add_listener
 * @desc **Firebase C++ SDK:** [firebase::app_check::AppCheck::AddAppCheckListener](https://firebase.google.com/docs/reference/cpp/class/firebase/app-check/app-check#addappchecklistener)
 *
 * This function registers a function to be called with each new token the app mints - at the
 * first attestation and at every refresh - so that a game talking to its own backend always has
 * the current token to hand without fetching it per request. The listener is not called when a
 * token merely expires. Remove it with ${function.firebase_app_check_remove_listener}. It returns
 * `0` with ${function.firebase_last_error_code} set when no callback is given or the handle is
 * not valid.
 *
 * @param {Real} app_check An App Check handle from ${function.firebase_app_check_get_instance} or ${function.firebase_app_check_get_instance_for_app}.
 * @param {Function} [callback] The function to call with each new token.
 * @returns {Real} A listener handle to remove with ${function.firebase_app_check_remove_listener}, or `0` on failure.
 *
 * @event callback
 * @desc Fires each time a new token has been minted.
 * @member {Struct.FirebaseAppCheckToken} token The new token and its expiry.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_app_check_remove_listener
 * @desc **Firebase C++ SDK:** [firebase::app_check::AppCheck::RemoveAppCheckListener](https://firebase.google.com/docs/reference/cpp/class/firebase/app-check/app-check#removeappchecklistener)
 *
 * This function removes a listener added with ${function.firebase_app_check_add_listener} and
 * frees its handle. The listener remembers the App Check instance it was added to, so no
 * instance handle is needed here.
 *
 * @param {Real} listener_ref The listener handle.
 * @returns {Bool} `true` when a listener was removed, `false` when the handle was not one.
 * @function_end
 */

/**
 * @struct FirebaseAppCheckToken
 * @desc **Firebase C++ SDK:** [firebase::app_check::AppCheckToken](https://firebase.google.com/docs/reference/cpp/struct/firebase/app-check/app-check-token)
 *
 * An App Check token as the token functions and the listener deliver it.
 *
 * @member {String} token The token: an opaque string to send to the game's backend as it is.
 * @member {Real} expire_time_millis When the token stops being valid, in milliseconds since the Unix epoch.
 * @struct_end
 */

/**
 * @const FirebaseAppCheckError
 * @desc **Firebase C++ SDK:** [firebase::app_check::AppCheckError](https://firebase.google.com/docs/reference/cpp/namespace/firebase/app-check#appcheckerror)
 *
 * The `error_code` every App Check token callback receives, mirroring the SDK's codes value for
 * value. `None` is success. The finer members come from the iOS SDK; Android reports every failure
 * as `Unknown`.
 *
 * @member None Success.
 * @member ServerUnreachable No connection to the attestation or App Check backend.
 * @member InvalidConfiguration The App Check configuration is not valid - on Windows, macOS and Linux, no provider was set.
 * @member SystemKeychain The system keychain could not be accessed (Apple platforms); the app needs keychain access.
 * @member UnsupportedProvider The chosen provider does not exist on this platform or OS version.
 * @member Unknown An error the SDK could not classify - every Android failure, and a rejected debug token on desktop.
 * @const_end
 */

/**
 * @const FirebaseAppCheckProvider
 * @desc The attestation provider ${function.firebase_app_check_set_provider_factory} installs, one of
 * the four provider factories the Firebase C++ SDK ships.
 *
 * @member Debug Exchanges a registered debug token for App Check tokens; every platform, development only.
 * @member DeviceCheck Apple's DeviceCheck; iOS, every device.
 * @member PlayIntegrity Google's Play Integrity API; Android devices with Google Play services.
 * @member AppAttest Apple's App Attest; iOS 14 and later, the stronger of the two Apple providers.
 * @const_end
 */

/**
 * @module app_check
 * @title App Check
 * @desc This module covers Firebase App Check: proof, attached to every request the game makes to
 * Firebase, that the request comes from the genuine game on an untampered device. The platform's
 * attestation service - Play Integrity on Android, App Attest or DeviceCheck on iOS - vouches for
 * the game, Firebase exchanges that for a short-lived App Check token, and the SDK sends the token
 * with every call to the services that have enforcement turned on (Realtime Database, Cloud
 * Firestore, Cloud Storage, Cloud Functions, Authentication), which then refuse requests without
 * one. Most games need only ${function.firebase_app_check_set_provider_factory} before
 * ${function.firebase_app_initialize}; the rest of the module is for a game with its own backend
 * that wants the same proof.
 *
 * ### Providers and platforms
 *
 * A build chooses one provider with ${function.firebase_app_check_set_provider_factory}. The
 * store platforms have real attestation; Windows, macOS and Linux, emulators and simulators have
 * only the `Debug` provider, which trades a token registered in the console for real App Check
 * tokens - a development tool that must never ship, since the registered token is a bypass. The
 * extension keeps every provider available in every build, so keeping `Debug` out of release
 * configurations is the game's responsibility.
 *
 * ### Tokens
 *
 * A token lasts about an hour and is refreshed by the SDK ahead of expiry when automatic refresh
 * is on. Every token and listener call takes the App Check handle of the app it works on -
 * ${function.firebase_app_check_get_instance} returns the default app's,
 * ${function.firebase_app_check_get_instance_for_app} another app's - so a game with several
 * Firebase Apps attests each the same way. The token functions return
 * ${constant.FirebaseError} at once and deliver a ${struct.FirebaseAppCheckToken} to a callback
 * whose `error_code` is a ${constant.FirebaseAppCheckError}, App Check's own code set: `None` on
 * success, otherwise the member that names the failure.
 *
 * The finer codes come from the iOS SDK. Android reports every failure as `Unknown`, since its
 * SDK has no code set; on Windows, macOS and Linux a missing provider is `InvalidConfiguration`
 * and a debug token the App Check backend rejects is `Unknown`, with the HTTP status and body in
 * `error_message`.
 *
 * ### Console setup
 *
 * Register each app's attestation under **App Check > Apps** in the console - Play Integrity
 * needs the app's SHA-256 fingerprint, App Attest and DeviceCheck an Apple team id and, for
 * DeviceCheck, a private key - then turn enforcement on per service under **App Check > APIs**,
 * after the metrics show the genuine traffic is verified. Debug tokens are registered per app
 * under **Manage debug tokens**.
 *
 * @section_func Setup
 * @desc Choosing the provider before the app is initialised:
 * @ref firebase_app_check_set_provider_factory
 * @ref firebase_app_check_debug_provider_set_debug_token
 * @section_end
 *
 * @section_func Instances
 * @desc The App Check handle the token functions take, for the default app or another one:
 * @ref firebase_app_check_get_instance
 * @ref firebase_app_check_get_instance_for_app
 * @ref firebase_app_check_get_app
 * @section_end
 *
 * @section_func Tokens
 * @desc Fetching and watching tokens, for a backend of the game's own:
 * @ref firebase_app_check_set_token_auto_refresh_enabled
 * @ref firebase_app_check_get_token
 * @ref firebase_app_check_get_limited_use_token
 * @ref firebase_app_check_add_listener
 * @ref firebase_app_check_remove_listener
 * @section_end
 *
 * @section_struct Structs
 * @desc The following structs are used by this module:
 * @ref FirebaseAppCheckToken
 * @section_end
 *
 * @section_const Constants
 * @desc The following constants are used by this module:
 * @ref FirebaseAppCheckProvider
 * @ref FirebaseAppCheckError
 * @section_end
 *
 * @module_end
 */
