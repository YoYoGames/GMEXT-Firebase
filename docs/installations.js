/**
 * @function firebase_installations_get_id
 * @desc **Firebase C++ SDK:** [firebase::installations::Installations::GetId](https://firebase.google.com/docs/reference/cpp/class/firebase/installations/installations#getid)
 *
 * This function delivers the Firebase installation id (FID) of the default app: the identifier
 * Firebase gives each install of the game, minted on the device the first time a Firebase
 * service needs one and kept until the game's data is cleared or
 * ${function.firebase_installations_delete} runs (on Android a reinstall gets a new one; on iOS
 * the id lives in the keychain and can outlive a reinstall). Cloud Messaging, Remote Config,
 * Analytics, Crashlytics, Performance Monitoring and In-App Messaging all key this install's
 * data by it, so a game shows it to the player, or logs it, when a support request or a data
 * request has to name this install. It is not a user id and says nothing about who is playing.
 * On Windows, macOS and Linux the callback fires at once with `0` and the stub's `"FakeId"`.
 *
 * The function returns `FirebaseError.NotInitialized` without calling the callback when
 * ${function.firebase_app_initialize} has not run.
 *
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the installation id.
 * @member {Real} error_code `0` on success, `1` on failure (see Error codes on the ${module.installations} page).
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {String} id The Firebase installation id, or an empty string on failure.
 * @event_end
 *
 * @example
 * ```gml
 * firebase_installations_get_id(function(_error, _message, _id)
 * {
 *     if (_error != 0)
 *     {
 *         show_debug_message($"Could not read the installation id: {_message}");
 *         exit;
 *     }
 *     installation_id = _id;
 *     clipboard_set_text(_id);
 * });
 * ```
 * The above code reads the installation id and puts it on the clipboard, for a support screen
 * where the player is asked to send it along with their report.
 * @function_end
 */

/**
 * @function firebase_installations_get_token
 * @desc **Firebase C++ SDK:** [firebase::installations::Installations::GetToken](https://firebase.google.com/docs/reference/cpp/class/firebase/installations/installations#gettoken)
 *
 * This function delivers the installation auth token of the default app: the credential, valid
 * for a week and renewed by the SDK, with which the Firebase services authenticate this
 * installation's requests. The services attach it themselves, so few games have a use for it;
 * it is neither the Cloud Messaging registration token, which ${function.firebase_messaging_register}
 * delivers, nor proof that the game is genuine, which is ${module.app_check}. On Windows, macOS
 * and Linux the callback fires at once with `0` and the stub's `"FakeToken"`
 * (`"FakeTokenForceRefresh"` when `force_refresh` is set).
 *
 * The function returns `FirebaseError.NotInitialized` without calling the callback when
 * ${function.firebase_app_initialize} has not run.
 *
 * @param {Real} force_refresh `1` to mint a new token even when the current one is still valid, `0` to reuse it.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the token.
 * @member {Real} error_code `0` on success, `1` on failure (see Error codes on the ${module.installations} page).
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {String} token The installation auth token, or an empty string on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_installations_delete
 * @desc **Firebase C++ SDK:** [firebase::installations::Installations::Delete](https://firebase.google.com/docs/reference/cpp/class/firebase/installations/installations#delete)
 *
 * This function deletes the default app's installation from the Firebase backend, and with it
 * the data the services keep under its id: the install stops receiving Cloud Messaging
 * messages and drops out of every service's per-install records until a service asks for an id
 * again, at which point a new one is minted. It is the call behind a "reset my data" or "forget this
 * device" option, and part of honouring a player's data-deletion request. It does not sign the
 * player out, delete their Authentication account or touch data keyed by user id. On Windows,
 * macOS and Linux the callback fires at once with `0`.
 *
 * The function returns `FirebaseError.NotInitialized` without calling the callback when
 * ${function.firebase_app_initialize} has not run.
 *
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the installation has been deleted, or could not be.
 * @member {Real} error_code `0` on success, `1` on failure (see Error codes on the ${module.installations} page).
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @example
 * ```gml
 * firebase_installations_delete(function(_error, _message)
 * {
 *     if (_error != 0)
 *     {
 *         show_debug_message($"Could not delete the installation: {_message}");
 *         exit;
 *     }
 *     installation_id = "";
 *     firebase_messaging_register();
 * });
 * ```
 * The above code deletes the installation and registers for Cloud Messaging again, which mints
 * a fresh id and a fresh registration for the device.
 * @function_end
 */

/**
 * @function firebase_installations_get_app
 * @desc **Firebase C++ SDK:** [firebase::installations::Installations::app](https://firebase.google.com/docs/reference/cpp/class/firebase/installations/installations#app)
 *
 * This function returns a handle to the default Firebase App, the one the module-level functions
 * work on. Release it with ${function.firebase_app_release_handle}.
 *
 * @returns {Real} An app handle, or `0` when ${function.firebase_app_initialize} has not run.
 * @function_end
 */

/**
 * @function firebase_installations_get_instance_handle
 * @desc **Firebase C++ SDK:** [firebase::installations::Installations::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/installations/installations#getinstance)
 *
 * This function returns a handle to the Installations instance of the default app - the object
 * the module-level functions use - for the `firebase_installations_instance_*` functions, which
 * take an instance handle so that a game with several Firebase Apps can read each one's
 * installation. The same handle comes back on every call and there is nothing to release.
 *
 * @returns {Real} The instance handle, or `0` when ${function.firebase_app_initialize} has not run.
 * @function_end
 */

/**
 * @function firebase_installations_get_instance_for_app
 * @desc **Firebase C++ SDK:** [firebase::installations::Installations::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/installations/installations#getinstance)
 *
 * This function returns a handle to the Installations instance of another Firebase App, created
 * with ${function.firebase_app_initialize_with_options} or
 * ${function.firebase_app_initialize_from_json}. Each app has its own installation id.
 *
 * @param {Real} app An app handle.
 * @returns {Real} The instance handle, or `0` when the app handle is not valid.
 * @function_end
 */

/**
 * @function firebase_installations_instance_get_app
 * @desc **Firebase C++ SDK:** [firebase::installations::Installations::app](https://firebase.google.com/docs/reference/cpp/class/firebase/installations/installations#app)
 *
 * This function returns a handle to the Firebase App an Installations instance belongs to.
 * Release it with ${function.firebase_app_release_handle}.
 *
 * @param {Real} installations An Installations instance handle from ${function.firebase_installations_get_instance_handle} or ${function.firebase_installations_get_instance_for_app}.
 * @returns {Real} An app handle, or `0` when the instance handle is not valid.
 * @function_end
 */

/**
 * @function firebase_installations_instance_get_id
 * @desc **Firebase C++ SDK:** [firebase::installations::Installations::GetId](https://firebase.google.com/docs/reference/cpp/class/firebase/installations/installations#getid)
 *
 * This function is ${function.firebase_installations_get_id} for one Installations instance. It returns `FirebaseError.InvalidHandle` without calling the callback when the handle is not
 * valid.
 *
 * @param {Real} installations An Installations instance handle from ${function.firebase_installations_get_instance_handle} or ${function.firebase_installations_get_instance_for_app}.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the installation id.
 * @member {Real} error_code `0` on success, `1` on failure (see Error codes on the ${module.installations} page).
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {String} id The Firebase installation id, or an empty string on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_installations_instance_get_token
 * @desc **Firebase C++ SDK:** [firebase::installations::Installations::GetToken](https://firebase.google.com/docs/reference/cpp/class/firebase/installations/installations#gettoken)
 *
 * This function is ${function.firebase_installations_get_token} for one Installations instance. It returns `FirebaseError.InvalidHandle` without calling the callback when the handle is not
 * valid.
 *
 * @param {Real} installations An Installations instance handle from ${function.firebase_installations_get_instance_handle} or ${function.firebase_installations_get_instance_for_app}.
 * @param {Bool} force_refresh `true` to mint a new token even when the current one is still valid, `false` to reuse it.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the token.
 * @member {Real} error_code `0` on success, `1` on failure (see Error codes on the ${module.installations} page).
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {String} token The installation auth token, or an empty string on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_installations_instance_delete
 * @desc **Firebase C++ SDK:** [firebase::installations::Installations::Delete](https://firebase.google.com/docs/reference/cpp/class/firebase/installations/installations#delete)
 *
 * This function is ${function.firebase_installations_delete} for one Installations instance. It returns `FirebaseError.InvalidHandle` without calling the callback when the handle is not
 * valid.
 *
 * @param {Real} installations An Installations instance handle from ${function.firebase_installations_get_instance_handle} or ${function.firebase_installations_get_instance_for_app}.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the installation has been deleted, or could not be.
 * @member {Real} error_code `0` on success, `1` on failure (see Error codes on the ${module.installations} page).
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @module installations
 * @title Installations
 * @desc This module covers Firebase Installations: the identity Firebase gives each install of the
 * game. The first time a Firebase service needs one - Cloud Messaging registering the device,
 * Remote Config fetching, Analytics, Crashlytics or Performance Monitoring reporting - the SDK
 * mints a Firebase installation id (FID) on the device and registers it with the backend, and
 * from then on every service keys this install's data by it. The module reads that id, reads
 * the auth token that goes with it, and deletes the installation; nothing here has to be
 * called for the services to work.
 *
 * ### What the id is for
 *
 * Two things. Support: the id names this install to Firebase, so a game that shows it on a
 * support screen lets the player quote it in a report and lets you find the install in the
 * console's per-instance views. Data requests: ${function.firebase_installations_delete} removes
 * the installation and the data the services hold under it, which is the per-install half of
 * honouring a deletion request (the per-user half is the Authentication account and whatever the
 * game keys by user id). The id is not shared between apps and identifies an install rather
 * than a person.
 *
 * ### Platforms
 *
 * Android and iOS have the real service. Windows, macOS and Linux have a stub: every callback
 * fires at once with `0`, the id is `"FakeId"`, the token `"FakeToken"` (or
 * `"FakeTokenForceRefresh"`), and nothing is registered anywhere - the same stub the Cloud
 * Messaging desktop build stands on (see ${module.messaging}).
 *
 * ### Error codes
 *
 * The callbacks' `error_code` is `0` on success and `1` on failure, with the platform SDK's
 * description in `error_message`; the finer `firebase::installations::Error` values of the C++
 * header are never delivered. Two things to know when reading the message: on failure it is the
 * platform's own text (an Android exception message, an iOS `NSError` description), and on iOS a
 * successful ${function.firebase_installations_get_id} arrives with the message `"test"`, a
 * leftover in the SDK - read `error_code`, not the message.
 *
 * ### Console setup
 *
 * There is nothing to set up: the installations service is on for every Firebase project and
 * needs only the app registered under **Project settings > Your apps**.
 *
 * @section_func Installation
 * @desc The default app's installation id, auth token and deletion:
 * @ref firebase_installations_get_id
 * @ref firebase_installations_get_token
 * @ref firebase_installations_delete
 * @ref firebase_installations_get_app
 * @section_end
 *
 * @section_func Instances
 * @desc The same operations on a chosen Installations instance, for a game with several Firebase Apps:
 * @ref firebase_installations_get_instance_handle
 * @ref firebase_installations_get_instance_for_app
 * @ref firebase_installations_instance_get_app
 * @ref firebase_installations_instance_get_id
 * @ref firebase_installations_instance_get_token
 * @ref firebase_installations_instance_delete
 * @section_end
 *
 * @module_end
 */
