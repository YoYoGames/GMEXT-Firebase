/**
 * @function firebase_auth_get_auth
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::GetAuth](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#getauth)
 *
 * This function creates the Authentication instance for the default Firebase App, or returns
 * `true` at once when it already exists. Every other function of this module creates it on first
 * use the same way, so calling this is optional; it is the way to bring Authentication up early and
 * find out whether it could be, before the first sign-in.
 *
 * If the default app does not exist yet (${function.firebase_app_initialize} has not succeeded)
 * the function returns `false` and ${function.firebase_last_error_code} is
 * `FirebaseError.NotInitialized`.
 *
 * @returns {Bool} `true` when the Authentication instance exists, otherwise `false`.
 *
 * @example
 * ```gml
 * if (!firebase_auth_get_auth())
 * {
 *     show_debug_message("Auth unavailable: " + firebase_last_error_message());
 *     exit;
 * }
 * ```
 * The above code brings Authentication up in a Create event and stops the object if that fails,
 * which on Android means ${function.firebase_app_initialize} was never called and on desktop that the
 * configuration file was not found.
 * @function_end
 */

/**
 * @function firebase_auth_language_code
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::language_code](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#language_code)
 *
 * This function returns the language code used for the e-mails Authentication sends (verification,
 * password reset), as set with ${function.firebase_auth_set_language_code}.
 *
 * @returns {String} The BCP 47 language code, or an empty string when the app's default language is in use.
 * @function_end
 */

/**
 * @function firebase_auth_set_language_code
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::set_language_code](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#set_language_code)
 *
 * This function sets the language for the user-facing e-mails and messages Authentication produces -
 * the verification and password reset e-mails, and the SMS of phone sign-in. The code follows
 * BCP 47 (`"en"`, `"pt-BR"`, `"de"`).
 *
 * @param {String} language_code The BCP 47 language code to use.
 *
 * @example
 * ```gml
 * firebase_auth_set_language_code("fr");
 * firebase_auth_send_password_reset_email(email, function(_error_code, _error_message)
 * {
 *     show_debug_message(_error_code == FirebaseAuthError.None ? "Reset e-mail sent" : _error_message);
 * });
 * ```
 * The above code switches Authentication to French before requesting a password reset, so the
 * e-mail the player receives is in French. The language stays set for every later request.
 * @function_end
 */

/**
 * @function firebase_auth_use_app_language
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::UseAppLanguage](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#useapplanguage)
 *
 * This function sets the language for Authentication's e-mails and messages to the device's own
 * language. On desktop it sets the Firebase service's default instead. Use it to undo a
 * ${function.firebase_auth_set_language_code} call.
 *
 * @function_end
 */

/**
 * @function firebase_auth_use_emulator
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::UseEmulator](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#useemulator)
 *
 * This function points Authentication at a local
 * [Firebase Authentication emulator](https://firebase.google.com/docs/emulator-suite/connect_auth)
 * instead of the production service, for development. Call it before the first sign-in; the setting
 * cannot be undone without restarting the game.
 *
 * [[Warning: Never ship a build that calls this function. Accounts created against the emulator
 * do not exist in your Firebase project.]]
 *
 * @param {String} host The emulator's host name or IP address, for example `"127.0.0.1"`.
 * @param {Real} port The port the emulator listens on, `9099` by default.
 *
 * @example
 * ```gml
 * if (debug_mode)
 * {
 *     firebase_auth_use_emulator("127.0.0.1", 9099);
 * }
 * ```
 * The above code routes every Authentication request to a local emulator while the game runs from
 * the IDE, and leaves release builds untouched.
 * @function_end
 */

/**
 * @function firebase_auth_current_user
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::current_user](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#current_user)
 *
 * This function returns a handle to the signed-in user, or `undefined` when nobody is signed in.
 * The handle is a live view of the Authentication instance's current user rather than a copy: the
 * same handle comes back every time, from every sign-in callback and every listener, and it always
 * reports whoever is signed in *now*. After ${function.firebase_auth_sign_out} a handle you kept
 * reports ${function.firebase_auth_user_is_valid} as `false` until someone signs in again.
 *
 * Because the handle is shared, ${function.firebase_auth_user_release} frees nothing; there is no
 * harm in calling it, and no need to.
 *
 * [[Note: On the first call after the game starts the SDK may block briefly while it loads the saved
 * sign-in state from disk. Firebase persists the last user, so a player who signed in on a previous
 * run is signed in again without any call from your code.]]
 *
 * @returns {Real} The current user's handle, or `undefined` when nobody is signed in.
 *
 * @example
 * ```gml
 * var _user = firebase_auth_current_user();
 * if (is_undefined(_user))
 * {
 *     show_debug_message("No user is signed in");
 * }
 * else
 * {
 *     var _info = firebase_auth_user_get_info(_user);
 *     show_debug_message($"Signed in as {_info.uid} ({_info.email})");
 * }
 * ```
 * The above code checks whether a user is signed in and, if so, reads the user's details with
 * ${function.firebase_auth_user_get_info} in one call. The demo project draws this on screen every
 * frame, which the live view makes cheap.
 * @function_end
 */

/**
 * @function firebase_auth_sign_out
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::SignOut](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#signout)
 *
 * This function signs the current user out, removing the saved credentials from the device. It
 * always succeeds, and it fires every listener added with
 * ${function.firebase_auth_add_state_listener} with `undefined`. Any user handle you kept reports
 * ${function.firebase_auth_user_is_valid} as `false` from then on.
 *
 *
 * @example
 * ```gml
 * firebase_auth_sign_out();
 * show_debug_message(is_undefined(firebase_auth_current_user()) ? "Signed out" : "Still signed in");
 * ```
 * The above code signs out and confirms that ${function.firebase_auth_current_user} now returns
 * `undefined`.
 * @function_end
 */

/**
 * @function firebase_auth_fetch_providers_for_email
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::FetchProvidersForEmail](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#fetchprovidersforemail)
 *
 * This function asks the server which sign-in providers are registered for the given e-mail address
 * - `"password"`, `"google.com"`, `"facebook.com"` and so on, the same strings the
 * `*_auth_provider_id` functions return. Use it to show the player the right sign-in button, or to
 * explain a `FirebaseAuthError.AccountExistsWithDifferentCredentials` failure.
 *
 * @param {String} email The e-mail address to look up.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the providers registered for the address.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Array[String]} providers The provider IDs, empty on failure or when the address is unknown.
 * @event_end
 *
 * @example
 * ```gml
 * firebase_auth_fetch_providers_for_email(email, function(_error_code, _error_message, _providers)
 * {
 *     if (_error_code != FirebaseAuthError.None)
 *     {
 *         show_debug_message("Lookup failed: " + _error_message);
 *         return;
 *     }
 *     if (array_contains(_providers, firebase_auth_google_auth_provider_id()))
 *     {
 *         show_debug_message("This account signs in with Google");
 *     }
 * });
 * ```
 * The above code looks up an address and checks whether Google is one of its providers, comparing
 * against ${function.firebase_auth_google_auth_provider_id} rather than a typed string.
 * @function_end
 */

/**
 * @function firebase_auth_sign_in_with_custom_token
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::SignInWithCustomToken](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#signinwithcustomtoken)
 *
 * This function signs in with a custom token minted by your own server through the Firebase Admin
 * SDK - the "bring your own auth" flow. The callback receives a ${struct.FirebaseAuthResult}: `user` is the signed-in user's handle,
 * `credential` a credential the provider returned (or `undefined`) and `additional_user_info` the
 * provider's additional data. Release the result's `credential` and
 * `additional_user_info.updated_credential`, when present, with
 * ${function.firebase_auth_credential_release}.
 *
 * The callback fails with `FirebaseAuthError.InvalidCustomToken` or `CustomTokenMismatch` when the
 * token is malformed or was minted for another project.
 *
 * @param {String} custom_token The token your server minted for this player.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the outcome of the sign-in.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Struct.FirebaseAuthResult} result The sign-in result - `result.user` is the user's handle - or `undefined` on failure.
 * @event_end
 *
 * @example
 * ```gml
 * firebase_auth_sign_in_with_custom_token(token, function(_error_code, _error_message, _result)
 * {
 *     if (_error_code == FirebaseAuthError.None)
 *     {
 *         show_debug_message("Signed in as " + firebase_auth_user_get_info(_result.user).uid);
 *     }
 *     else
 *     {
 *         show_debug_message("Custom token sign-in failed: " + _error_message);
 *     }
 * });
 * ```
 * The above code signs in with a token the game fetched from its own server earlier and prints
 * the user ID on success.
 * @function_end
 */

/**
 * @function firebase_auth_sign_in_with_credential
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::SignInWithCredential](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#signinwithcredential)
 *
 * This function signs in with a credential from one of the `*_get_credential` functions - an
 * e-mail and password pair, a Google ID token, a phone verification. It is the one sign-in whose
 * callback receives the user's handle alone, as the SDK's `SignInWithCredential` does;
 * ${function.firebase_auth_sign_in_and_retrieve_data_with_credential} is the same call delivering
 * the full ${struct.FirebaseAuthResult} with the provider's additional data.
 *
 * The credential can be released with ${function.firebase_auth_credential_release} as soon as this
 * function has returned `FirebaseError.Ok`.
 *
 * [[Note: The user handle is the Auth instance's live user view - the same handle
 * ${function.firebase_auth_current_user} returns - so it reports whoever is signed in now, and
 * ${function.firebase_auth_user_release} has nothing to free.]]
 *
 * @param {Real} credential_ref A credential handle from one of the `*_get_credential` functions.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the outcome of the sign-in.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} user The signed-in user's handle, or `undefined` on failure.
 * @event_end
 *
 * @example
 * ```gml
 * var _credential = firebase_auth_email_auth_provider_get_credential(email, password);
 * var _result = firebase_auth_sign_in_with_credential(_credential, function(_error_code, _error_message, _user)
 * {
 *     if (_error_code == FirebaseAuthError.None)
 *     {
 *         show_debug_message("Signed in as " + firebase_auth_user_get_info(_user).email);
 *     }
 *     else
 *     {
 *         show_debug_message("Sign-in failed: " + _error_message);
 *     }
 * });
 * firebase_auth_credential_release(_credential);
 *
 * if (_result != FirebaseError.Ok)
 * {
 *     show_debug_message("Could not start the sign-in: " + firebase_last_error_message());
 * }
 * ```
 * The above code builds an e-mail credential, signs in with it and releases the credential
 * straight after the call - the SDK holds its own copy. The synchronous return is checked against
 * `FirebaseError.Ok`; when it is anything else the callback never runs.
 * @function_end
 */

/**
 * @function firebase_auth_sign_in_and_retrieve_data_with_credential
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::SignInAndRetrieveDataWithCredential](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#signinandretrievedatawithcredential)
 *
 * This function signs in with a credential, like ${function.firebase_auth_sign_in_with_credential},
 * and delivers the full ${struct.FirebaseAuthResult}: the user, and the provider's additional data -
 * the profile the provider returned, the user name, and for some providers an updated credential.
 * Release the result's credentials with ${function.firebase_auth_credential_release}.
 *
 * @param {Real} credential_ref A credential handle from one of the `*_get_credential` functions.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the outcome of the sign-in.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Struct.FirebaseAuthResult} result The sign-in result - `result.user` is the user's handle - or `undefined` on failure.
 * @event_end
 *
 * @example
 * ```gml
 * firebase_auth_sign_in_and_retrieve_data_with_credential(credential, function(_error_code, _error_message, _result)
 * {
 *     if (_error_code != FirebaseAuthError.None)
 *     {
 *         show_debug_message("Sign-in failed: " + _error_message);
 *         return;
 *     }
 *     var _info = _result.additional_user_info;
 *     show_debug_message($"Signed in through {_info.provider_id} as {_info.user_name}");
 *     if (variable_struct_exists(_info.profile, "picture"))
 *     {
 *         show_debug_message("Avatar: " + _info.profile.picture);
 *     }
 *     if (!is_undefined(_result.credential)) firebase_auth_credential_release(_result.credential);
 *     if (!is_undefined(_info.updated_credential)) firebase_auth_credential_release(_info.updated_credential);
 * });
 * ```
 * The above code signs in with a provider credential and reads the provider's profile from the
 * result - the keys in `profile` are the provider's own, so the code checks for the one it wants -
 * then releases both credentials the result may carry.
 * @function_end
 */

/**
 * @function firebase_auth_sign_in_anonymously
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::SignInAnonymously](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#signinanonymously)
 *
 * This function creates a temporary anonymous account and signs it in, so the player can use
 * Firebase-backed features before registering. The account persists across runs on the same device.
 * Later, link a real credential to it with ${function.firebase_auth_user_link_with_credential} to
 * keep the player's data when they register.
 *
 * Anonymous sign-in must be enabled in the Firebase console (Authentication > Sign-in method), or the
 * callback fails with `FirebaseAuthError.OperationNotAllowed`. The callback receives a ${struct.FirebaseAuthResult}: `user` is the signed-in user's handle,
 * `credential` a credential the provider returned (or `undefined`) and `additional_user_info` the
 * provider's additional data. Release the result's `credential` and
 * `additional_user_info.updated_credential`, when present, with
 * ${function.firebase_auth_credential_release}.
 *
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the outcome of the sign-in.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Struct.FirebaseAuthResult} result The sign-in result - `result.user` is the user's handle - or `undefined` on failure.
 * @event_end
 *
 * @example
 * ```gml
 * firebase_auth_sign_in_anonymously(function(_error_code, _error_message, _result)
 * {
 *     if (_error_code == FirebaseAuthError.None)
 *     {
 *         show_debug_message("Anonymous sign-in OK, uid " + firebase_auth_user_get_info(_result.user).uid);
 *     }
 *     else
 *     {
 *         show_debug_message("Anonymous sign-in failed: " + _error_message);
 *     }
 * });
 * ```
 * The above code signs in anonymously and prints the user ID the project assigned. The same ID
 * comes back on the next run of the game, until the player signs out or the app data is cleared.
 * @function_end
 */

/**
 * @function firebase_auth_sign_in_with_email_and_password
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::SignInWithEmailAndPassword](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#signinwithemailandpassword)
 *
 * This function signs in an existing account with its e-mail address and password. The common
 * failures are `FirebaseAuthError.WrongPassword`, `UserNotFound`, `InvalidEmail` and, after
 * repeated failures, `TooManyRequests`. The callback receives a ${struct.FirebaseAuthResult}: `user` is the signed-in user's handle,
 * `credential` a credential the provider returned (or `undefined`) and `additional_user_info` the
 * provider's additional data. Release the result's `credential` and
 * `additional_user_info.updated_credential`, when present, with
 * ${function.firebase_auth_credential_release}.
 *
 * E-mail/password sign-in must be enabled in the Firebase console (Authentication > Sign-in method).
 * To register a new account use ${function.firebase_auth_create_user_with_email_and_password}.
 *
 * @param {String} email The account's e-mail address.
 * @param {String} password The account's password.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the outcome of the sign-in.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Struct.FirebaseAuthResult} result The sign-in result - `result.user` is the user's handle - or `undefined` on failure.
 * @event_end
 *
 * @example
 * ```gml
 * firebase_auth_sign_in_with_email_and_password(email, password, function(_error_code, _error_message, _result)
 * {
 *     if (_error_code != FirebaseAuthError.None)
 *     {
 *         show_debug_message("Login failed: " + _error_message);
 *         return;
 *     }
 *     var _info = firebase_auth_user_get_info(_result.user);
 *     show_debug_message($"UID: {_info.uid}, e-mail: {_info.email}, name: {_info.display_name}");
 * });
 * ```
 * The above code signs in and, on success, reads the user's details in one
 * ${function.firebase_auth_user_get_info} call. On failure the message names the cause, and the
 * error code can be compared against ${constant.FirebaseAuthError} to react to a wrong password
 * differently from an unknown account.
 * @function_end
 */

/**
 * @function firebase_auth_create_user_with_email_and_password
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::CreateUserWithEmailAndPassword](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#createuserwithemailandpassword)
 *
 * This function registers a new account with the given e-mail address and password and signs it in.
 * The callback fails with `FirebaseAuthError.EmailAlreadyInUse` when the address is taken,
 * `WeakPassword` when the password is shorter than six characters, and `InvalidEmail` when the
 * address is malformed. The callback receives a ${struct.FirebaseAuthResult}: `user` is the signed-in user's handle,
 * `credential` a credential the provider returned (or `undefined`) and `additional_user_info` the
 * provider's additional data. Release the result's `credential` and
 * `additional_user_info.updated_credential`, when present, with
 * ${function.firebase_auth_credential_release}.
 *
 * The new account's e-mail is unverified; ${function.firebase_auth_user_send_email_verification}
 * sends the verification e-mail.
 *
 * @param {String} email The e-mail address for the new account.
 * @param {String} password The password for the new account, at least six characters.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the outcome of the sign-up.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Struct.FirebaseAuthResult} result The sign-in result - `result.user` is the user's handle - or `undefined` on failure.
 * @event_end
 *
 * @example
 * ```gml
 * firebase_auth_create_user_with_email_and_password(email, password, function(_error_code, _error_message, _result)
 * {
 *     switch (_error_code)
 *     {
 *         case FirebaseAuthError.None:
 *             show_debug_message("Account created, uid " + firebase_auth_user_get_info(_result.user).uid);
 *             firebase_auth_user_send_email_verification(_result.user, undefined);
 *             break;
 *         case FirebaseAuthError.EmailAlreadyInUse:
 *             show_debug_message("That address already has an account");
 *             break;
 *         default:
 *             show_debug_message("Sign-up failed: " + _error_message);
 *     }
 * });
 * ```
 * The above code registers an account and sends the verification e-mail as soon as it exists,
 * without waiting for that second call's result (its callback is `undefined`). The address-taken
 * case gets its own message; everything else prints the SDK's.
 * @function_end
 */

/**
 * @function firebase_auth_send_password_reset_email
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::SendPasswordResetEmail](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#sendpasswordresetemail)
 *
 * This function sends a password reset e-mail to the given address, in the language set with
 * ${function.firebase_auth_set_language_code}. Nobody needs to be signed in. The callback fails with
 * `FirebaseAuthError.UserNotFound` when no account has that address.
 *
 * @param {String} email The e-mail address of the account to reset.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the e-mail has been sent, or with the reason it was not.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @example
 * ```gml
 * firebase_auth_send_password_reset_email(email, function(_error_code, _error_message)
 * {
 *     if (_error_code == FirebaseAuthError.None)
 *     {
 *         show_debug_message("Check your inbox");
 *     }
 *     else
 *     {
 *         show_debug_message("Could not send the reset e-mail: " + _error_message);
 *     }
 * });
 * ```
 * The above code requests a password reset and tells the player to check their inbox once the
 * server has accepted the request.
 * @function_end
 */

/**
 * @function firebase_auth_add_state_listener
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::AddAuthStateListener](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#addauthstatelistener)
 *
 * This function registers a function to be called whenever the signed-in user changes: right after
 * registration (with the current state), on every sign-in, on sign-out, and when the current user is
 * replaced. It is the way to keep the game's idea of "who is signed in" current without polling
 * ${function.firebase_auth_current_user}, and it catches the sign-in Firebase restores on its own at
 * start-up.
 *
 * The function returns a listener handle; pass it to
 * ${function.firebase_auth_remove_state_listener} to stop the callbacks, at the latest when the
 * object that owns the callback is destroyed. Several listeners can be registered at once. It
 * returns `undefined` when Authentication could not be created.
 *
 * @param {Function} callback The function to call on every change.
 * @returns {Real} A listener handle for ${function.firebase_auth_remove_state_listener}, or `undefined` when Authentication is unavailable.
 *
 * @event callback
 * @desc Fires once on registration and again on every change of the signed-in user.
 * @member {Real} user The signed-in user's handle, or `undefined` when nobody is signed in.
 * @event_end
 *
 * @example
 * ```gml
 * // Create Event
 * auth_listener = firebase_auth_add_state_listener(function(_user)
 * {
 *     if (is_undefined(_user))
 *     {
 *         show_debug_message("Signed out");
 *     }
 *     else
 *     {
 *         show_debug_message("Signed in as " + firebase_auth_user_get_info(_user).uid);
 *     }
 * });
 *
 * // Clean Up Event
 * firebase_auth_remove_state_listener(auth_listener);
 * ```
 * The above code registers a listener in the Create event and removes it in the Clean Up event.
 * The first call arrives right away with the restored user, if there is one, and each later sign-in
 * or sign-out arrives as it happens.
 * @function_end
 */

/**
 * @function firebase_auth_remove_state_listener
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::RemoveAuthStateListener](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#removeauthstatelistener)
 *
 * This function removes a listener added with ${function.firebase_auth_add_state_listener} and frees
 * it. Removing a handle that is not a listener sets ${function.firebase_last_error_code} to
 * `FirebaseError.InvalidHandle` and does nothing else.
 *
 * @param {Real} listener_ref The handle ${function.firebase_auth_add_state_listener} returned.
 * @function_end
 */

/**
 * @function firebase_auth_add_id_token_listener
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::AddIdTokenListener](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#addidtokenlistener)
 *
 * This function registers a function to be called whenever the current user's ID token changes: on
 * registration, on sign-in and sign-out, when the user changes, and every time the token is
 * refreshed (roughly hourly while signed in). Use it when your own server checks the token - fetch a
 * fresh one with ${function.firebase_auth_user_get_token} from the callback - and
 * ${function.firebase_auth_add_state_listener} otherwise, which fires only on the sign-in changes.
 *
 * Remove the listener with ${function.firebase_auth_remove_id_token_listener}.
 *
 * @param {Function} callback The function to call on every change.
 * @returns {Real} A listener handle for ${function.firebase_auth_remove_id_token_listener}, or `undefined` when Authentication is unavailable.
 *
 * @event callback
 * @desc Fires once on registration and again on every change of the user or of their token.
 * @member {Real} user The signed-in user's handle, or `undefined` when nobody is signed in.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_auth_remove_id_token_listener
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::RemoveIdTokenListener](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#removeidtokenlistener)
 *
 * This function removes a listener added with ${function.firebase_auth_add_id_token_listener} and
 * frees it. Removing a handle that is not a listener sets ${function.firebase_last_error_code} to
 * `FirebaseError.InvalidHandle` and does nothing else.
 *
 * @param {Real} listener_ref The handle ${function.firebase_auth_add_id_token_listener} returned.
 * @function_end
 */

/**
 * @function firebase_auth_credential_provider
 * @desc **Firebase C++ SDK:** [firebase::auth::Credential::provider](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/credential#provider)
 *
 * This function returns the ID of the provider a credential belongs to - `"password"`,
 * `"google.com"`, `"phone"` and so on, the strings the `*_auth_provider_id` functions return.
 *
 * @param {Real} credential_ref The credential's handle.
 * @returns {String} The provider ID, or an empty string when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_auth_credential_is_valid
 * @desc **Firebase C++ SDK:** [firebase::auth::Credential::is_valid](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/credential#is_valid)
 *
 * This function returns whether a credential handle refers to a usable credential. A credential
 * built from empty values - an empty e-mail or password, say - is not valid, and neither is a handle
 * that has been released.
 *
 * @param {Real} credential_ref The credential's handle.
 * @returns {Bool} `true` when the credential can be used to sign in, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_auth_credential_release
 * @desc This function releases a credential handle minted by one of the `*_get_credential` functions,
 * ${function.firebase_auth_phone_get_credential}, or returned inside a ${struct.FirebaseAuthResult}.
 * Release a credential as soon as the call that consumed it has returned `FirebaseError.Ok` - the
 * SDK keeps its own copy. A handle that is not a credential sets
 * ${function.firebase_last_error_code} to `FirebaseError.InvalidHandle`.
 *
 * @param {Real} credential_ref The credential handle to release.
 * @function_end
 */

/**
 * @function firebase_auth_email_auth_provider_get_credential
 * @desc **Firebase C++ SDK:** [firebase::auth::EmailAuthProvider::GetCredential](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/email-auth-provider#getcredential)
 *
 * This function builds a credential from an e-mail address and password, for
 * ${function.firebase_auth_user_link_with_credential} (to attach a password to an anonymous
 * account) and ${function.firebase_auth_user_reauthenticate}. For a plain sign-in,
 * ${function.firebase_auth_sign_in_with_email_and_password} does the same without the handle.
 *
 * The credential is built locally; nothing is checked until it is used. Release it with
 * ${function.firebase_auth_credential_release}.
 *
 * @param {String} email The account's e-mail address.
 * @param {String} password The account's password.
 * @returns {Real} A credential handle.
 *
 * @example
 * ```gml
 * var _user = firebase_auth_current_user();
 * var _credential = firebase_auth_email_auth_provider_get_credential(email, password);
 * firebase_auth_user_link_with_credential(_user, _credential, function(_error_code, _error_message, _linked_user)
 * {
 *     show_debug_message(_error_code == FirebaseAuthError.None ? "Account upgraded" : _error_message);
 * });
 * firebase_auth_credential_release(_credential);
 * ```
 * The above code turns the anonymous account the player has been using into an e-mail/password
 * account by linking a credential to it. The player keeps their user ID and everything stored under
 * it.
 * @function_end
 */

/**
 * @function firebase_auth_facebook_auth_provider_get_credential
 * @desc **Firebase C++ SDK:** [firebase::auth::FacebookAuthProvider::GetCredential](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/facebook-auth-provider#getcredential)
 *
 * This function builds a credential from a Facebook Login access token. Obtaining that token - the
 * Facebook sign-in flow itself - is not part of this extension; a separate Facebook extension has to
 * provide it. Release the credential with ${function.firebase_auth_credential_release} once used.
 *
 * @param {String} access_token The access token Facebook Login returned.
 * @returns {Real} A credential handle.
 * @function_end
 */

/**
 * @function firebase_auth_game_center_auth_provider_get_credential
 * @desc **Firebase C++ SDK:** [firebase::auth::GameCenterAuthProvider::GetCredential](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/game-center-auth-provider#getcredential)
 *
 * This function asks Game Center for a credential for the player currently signed in to it, on iOS
 * only. The callback receives the credential handle, to be used with
 * ${function.firebase_auth_sign_in_with_credential} and released with
 * ${function.firebase_auth_credential_release}. Check
 * ${function.firebase_auth_game_center_auth_provider_is_player_authenticated} first.
 *
 * On Android, Windows, macOS and Linux the function returns `FirebaseError.Unsupported` without
 * calling the callback - the SDK has no Game Center there.
 *
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the Game Center credential.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} credential A credential handle, or `undefined` on failure.
 * @event_end
 *
 * @example
 * ```gml
 * if (firebase_auth_game_center_auth_provider_is_player_authenticated())
 * {
 *     firebase_auth_game_center_auth_provider_get_credential(function(_error_code, _error_message, _credential)
 *     {
 *         if (_error_code != FirebaseAuthError.None)
 *         {
 *             show_debug_message("Game Center credential failed: " + _error_message);
 *             return;
 *         }
 *         firebase_auth_sign_in_with_credential(_credential, function(_error_code, _error_message, _user)
 *         {
 *             show_debug_message(_error_code == FirebaseAuthError.None ? "Signed in with Game Center" : _error_message);
 *         });
 *         firebase_auth_credential_release(_credential);
 *     });
 * }
 * ```
 * The above code fetches a credential for the Game Center player and signs in to Firebase with
 * it, releasing the credential once the sign-in has been started.
 * @function_end
 */

/**
 * @function firebase_auth_game_center_auth_provider_is_player_authenticated
 * @desc **Firebase C++ SDK:** [firebase::auth::GameCenterAuthProvider::IsPlayerAuthenticated](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/game-center-auth-provider#isplayerauthenticated)
 *
 * This function returns whether a player is signed in to Game Center on this device.
 *
 * On Android, Windows, macOS and Linux it returns `false` and sets ${function.firebase_last_error_code}
 * to `FirebaseError.Unsupported` - the SDK has no Game Center there.
 *
 * @returns {Bool} `true` when a Game Center player is signed in, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_auth_github_auth_provider_get_credential
 * @desc **Firebase C++ SDK:** [firebase::auth::GitHubAuthProvider::GetCredential](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/git-hub-auth-provider#getcredential)
 *
 * This function builds a credential from a GitHub OAuth access token obtained through your own
 * OAuth flow. Release it with ${function.firebase_auth_credential_release} once used.
 *
 * @param {String} token The GitHub OAuth access token.
 * @returns {Real} A credential handle.
 * @function_end
 */

/**
 * @function firebase_auth_google_auth_provider_get_credential
 * @desc **Firebase C++ SDK:** [firebase::auth::GoogleAuthProvider::GetCredential](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/google-auth-provider#getcredential)
 *
 * This function builds a credential from the ID token and/or access token of a Google Sign-In.
 * Obtaining those tokens - the Google sign-in flow itself - is not part of this extension; a
 * separate Google Sign-In extension has to provide them. Either token can be an empty string when
 * you only have the other. Release the credential with ${function.firebase_auth_credential_release}
 * once used.
 *
 * @param {String} id_token The Google Sign-In ID token, or an empty string.
 * @param {String} access_token The Google Sign-In access token, or an empty string.
 * @returns {Real} A credential handle.
 * @function_end
 */

/**
 * @function firebase_auth_oauth_provider_get_credential
 * @desc **Firebase C++ SDK:** [firebase::auth::OAuthProvider::GetCredential](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/o-auth-provider#getcredential)
 *
 * This function builds a credential for any OAuth provider Firebase supports from the tokens your
 * own OAuth flow obtained - Microsoft, Yahoo, Apple, or a custom OIDC provider configured in the
 * console. Release it with ${function.firebase_auth_credential_release} once used.
 *
 * @param {String} provider_id The provider's ID as configured in the console, for example `"microsoft.com"` or `"apple.com"`.
 * @param {String} id_token The provider's ID token (OIDC providers), or an empty string.
 * @param {String} access_token The provider's access token, or an empty string.
 * @returns {Real} A credential handle.
 * @function_end
 */

/**
 * @function firebase_auth_oauth_provider_get_credential_with_nonce
 * @desc **Firebase C++ SDK:** [firebase::auth::OAuthProvider::GetCredential](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/o-auth-provider#getcredential_1)
 *
 * This function is ${function.firebase_auth_oauth_provider_get_credential} for providers whose ID
 * token carries a hashed nonce - Sign in with Apple is the usual one. The raw nonce you generated for
 * the request is passed alongside so the server can check it; a mismatch fails the sign-in with
 * `FirebaseAuthError.MissingOrInvalidNonce`.
 *
 * @param {String} provider_id The provider's ID as configured in the console, for example `"apple.com"`.
 * @param {String} id_token The provider's ID token.
 * @param {String} raw_nonce The unhashed nonce that was sent with the sign-in request.
 * @param {String} access_token The provider's access token, or an empty string.
 * @returns {Real} A credential handle.
 * @function_end
 */

/**
 * @function firebase_auth_play_games_auth_provider_get_credential
 * @desc **Firebase C++ SDK:** [firebase::auth::PlayGamesAuthProvider::GetCredential](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/play-games-auth-provider#getcredential)
 *
 * This function builds a credential from the server auth code of a Google Play Games sign-in, on
 * Android. Obtaining that code is not part of this extension; a separate Google Play Services
 * extension has to provide it. Release the credential with ${function.firebase_auth_credential_release}
 * once used.
 *
 * @param {String} server_auth_code The server auth code Play Games Sign-In returned.
 * @returns {Real} A credential handle.
 * @function_end
 */

/**
 * @function firebase_auth_twitter_auth_provider_get_credential
 * @desc **Firebase C++ SDK:** [firebase::auth::TwitterAuthProvider::GetCredential](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/twitter-auth-provider#getcredential)
 *
 * This function builds a credential from a Twitter OAuth token and secret obtained through your own
 * OAuth flow. Release it with ${function.firebase_auth_credential_release} once used.
 *
 * @param {String} token The Twitter OAuth token.
 * @param {String} secret The Twitter OAuth token secret.
 * @returns {Real} A credential handle.
 * @function_end
 */

/**
 * @function firebase_auth_phone_verify_phone_number
 * @desc **Firebase C++ SDK:** [firebase::auth::PhoneAuthProvider::VerifyPhoneNumber](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/phone-auth-provider#verifyphonenumber)
 *
 * This function starts a phone number sign-in: Firebase sends an SMS with a verification code to the
 * given number, and the four callbacks report what happens. It returns a listener handle that must
 * stay alive until the flow has ended and is then released with
 * ${function.firebase_auth_phone_listener_release}. Phone sign-in works on Android and iOS only, and
 * must be enabled in the Firebase console (Authentication > Sign-in method).
 *
 * The flow ends in one of two ways. On Android the SDK can read the SMS itself, and then
 * `on_verification_completed` delivers a ready phone credential. Otherwise `on_code_sent` delivers a
 * verification ID once the SMS is out; ask the player for the code from the message and build the
 * credential with ${function.firebase_auth_phone_get_credential}. Either credential goes to
 * ${function.firebase_auth_sign_in_with_credential}, ${function.firebase_auth_user_link_with_credential}
 * or ${function.firebase_auth_user_update_phone_number_credential}, and is released with
 * ${function.firebase_auth_credential_release}.
 *
 * The `timeout_ms` argument is how long Android waits for the automatic SMS read before
 * `on_timeout` fires: `0` turns the automatic read off (and `on_timeout` fires at once), and any
 * other value is clamped to the SDK's 30 to 120 second range. iOS has no automatic read, so there
 * `on_timeout` always fires at once and `on_verification_completed` never fires. A negative value is
 * refused with `FirebaseError.InvalidArgument` and the function returns `0`.
 *
 * To resend the SMS - only when the player asks - call this function again with the
 * `force_resending_token` that `on_code_sent` delivered; pass `0` the first time. Release the token
 * with ${function.firebase_auth_phone_resending_token_release} when the flow is over.
 *
 * @param {String} phone_number The number to verify, in E.164 format (`"+14155552671"`).
 * @param {Real} timeout_ms How long to wait for the automatic SMS read (in milliseconds), `0` to disable it; clamped to 30000-120000 otherwise.
 * @param {Real} force_resending_token The token from a previous `on_code_sent` to resend the SMS, or `0` for a new verification.
 * @param {Function} [on_verification_completed] Called when the SDK verified the number itself (Android only).
 * @param {Function} [on_verification_failed] Called when the verification failed.
 * @param {Function} [on_code_sent] Called when the SMS has been sent.
 * @param {Function} [on_timeout] Called when the automatic read's timeout has passed.
 * @returns {Real} A listener handle for ${function.firebase_auth_phone_listener_release}, or `0` when the flow could not be started.
 *
 * @event callback:on_verification_completed
 * @desc Fires when the SDK read the SMS itself and the number is verified. Android only.
 * @member {Real} phone_credential A ready phone credential handle.
 * @event_end
 *
 * @event callback:on_verification_failed
 * @desc Fires when the verification failed - a malformed number, an exhausted quota, a blocked app.
 * @member {Enum.FirebaseAuthError} error_code Always `FirebaseAuthError.Failure`; the message carries the detail.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @event callback:on_code_sent
 * @desc Fires once the SMS has been sent.
 * @member {String} verification_id The ID to pass to ${function.firebase_auth_phone_get_credential} with the code the player types.
 * @member {Real} force_resending_token A token to pass back to this function to resend the SMS.
 * @event_end
 *
 * @event callback:on_timeout
 * @desc Fires when the automatic SMS read gave up - at once on iOS, or with `timeout_ms` of `0`.
 * @member {String} verification_id The verification this timeout belongs to.
 * @event_end
 *
 * @example
 * ```gml
 * // Create Event
 * phone_listener = firebase_auth_phone_verify_phone_number("+14155552671", 60000, 0,
 *     function(_phone_credential)
 *     {
 *         sign_in_with(_phone_credential);
 *     },
 *     function(_error_code, _error_message)
 *     {
 *         show_debug_message("Verification failed: " + _error_message);
 *     },
 *     function(_verification_id, _resend_token)
 *     {
 *         verification_id = _verification_id;
 *         resend_token = _resend_token;
 *         show_debug_message("Enter the code from the SMS");
 *     },
 *     function(_verification_id)
 *     {
 *         show_debug_message("Automatic read timed out; waiting for the code");
 *     });
 *
 * // When the player has typed the code
 * var _credential = firebase_auth_phone_get_credential(verification_id, typed_code);
 * sign_in_with(_credential);
 *
 * // Clean Up Event
 * firebase_auth_phone_listener_release(phone_listener);
 * firebase_auth_phone_resending_token_release(resend_token);
 * ```
 * The above code starts a verification with a 60 second automatic-read window and handles both
 * outcomes: a credential delivered directly, or a verification ID that is combined with the code the
 * player typed. `sign_in_with` is the game's own function that calls
 * ${function.firebase_auth_sign_in_with_credential} and releases the credential. The listener and
 * the resend token are released when the object goes.
 * @function_end
 */

/**
 * @function firebase_auth_phone_get_credential
 * @desc **Firebase C++ SDK:** [firebase::auth::PhoneAuthProvider::GetCredential](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/phone-auth-provider#getcredential)
 *
 * This function builds a phone credential from the verification ID that `on_code_sent` delivered
 * and the code the player typed from the SMS. Nothing is checked until the credential is used: a
 * wrong code fails the sign-in with `FirebaseAuthError.InvalidVerificationCode`, an expired one with
 * `SessionExpired`. Release the credential with ${function.firebase_auth_credential_release}.
 *
 * @param {String} verification_id The verification ID from `on_code_sent`.
 * @param {String} verification_code The code the player received by SMS.
 * @returns {Real} A phone credential handle, or `0` when Authentication is unavailable.
 * @function_end
 */

/**
 * @function firebase_auth_phone_credential_sms_code
 * @desc **Firebase C++ SDK:** [firebase::auth::PhoneAuthCredential::sms_code](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/phone-auth-credential#sms_code)
 *
 * This function returns the verification code the SDK read from the SMS itself, for a credential
 * that `on_verification_completed` delivered on Android. It is an empty string for any other
 * credential and on every other platform.
 *
 * @param {Real} credential A phone credential handle.
 * @returns {String} The automatically read SMS code, or an empty string.
 * @function_end
 */

/**
 * @function firebase_auth_phone_resending_token_release
 * @desc This function releases a resend token that `on_code_sent` delivered. Release it when the
 * verification flow is over; passing a released token to
 * ${function.firebase_auth_phone_verify_phone_number} makes that call fail and return `0`.
 *
 * @param {Real} token The resend token to release.
 * @function_end
 */

/**
 * @function firebase_auth_phone_listener_release
 * @desc This function releases the listener ${function.firebase_auth_phone_verify_phone_number} returned,
 * and with it the four callbacks. Release it only once the flow has ended - after
 * `on_verification_completed` or `on_verification_failed`, or after the credential has been built
 * from the code - since a released listener receives nothing.
 *
 * @param {Real} listener The listener handle to release.
 * @function_end
 */

/**
 * @function firebase_auth_user_get_info
 * @desc This function reads every property of a user into one ${struct.FirebaseAuthUserInfo}: the ID,
 * e-mail, display name, photo URL, provider, phone number, the verified and anonymous flags and the
 * two timestamps. It is the one place a user's properties are read; the struct's members say what
 * each one holds and what it is for.
 *
 * [[Note: Do not use the ID to authenticate the player with your own server - anyone can claim
 * one. Send the token from ${function.firebase_auth_user_get_token} instead, which the server
 * verifies with the Firebase Admin SDK.]]
 *
 * @param {Real} user The user's handle, from ${function.firebase_auth_current_user} or a sign-in callback.
 * @returns {Struct.FirebaseAuthUserInfo} The user's properties, or `undefined` when the handle is not valid; `is_valid` inside is the SDK's own answer for a user handle that did resolve.
 *
 * @example
 * ```gml
 * var _user = firebase_auth_current_user();
 * if (!is_undefined(_user))
 * {
 *     var _info = firebase_auth_user_get_info(_user);
 *     show_debug_message($"{_info.display_name} <{_info.email}> verified: {_info.is_email_verified}");
 *     show_debug_message($"Created {_info.creation_timestamp}, last sign-in {_info.last_sign_in_timestamp}");
 * }
 * ```
 * The above code prints a summary of the signed-in user. The timestamps are UTC milliseconds
 * since the Unix epoch, so divide by 1000 and add them to `date_create_datetime(1970, 1, 1, 0, 0, 0)`
 * to get a GameMaker datetime.
 * @function_end
 */

/**
 * @function firebase_auth_user_release
 * @desc This function exists for symmetry with the other `*_release` functions and does nothing: a user
 * handle is the Authentication instance's shared live view (see
 * ${function.firebase_auth_current_user}), not a copy, and it lives as long as the game. Calling it
 * is harmless, and code written for the "one handle per sign-in" model keeps working.
 *
 * @param {Real} user_ref The user's handle.
 * @function_end
 */

/**
 * @function firebase_auth_user_is_valid
 * @desc **Firebase C++ SDK:** [firebase::auth::User::is_valid](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/user#is_valid)
 *
 * This function returns whether the handle currently refers to a signed-in user. Because a user
 * handle is a live view, it becomes invalid after ${function.firebase_auth_sign_out} and valid again
 * after the next sign-in, without the handle itself changing.
 *
 * @param {Real} user_ref The user's handle, from ${function.firebase_auth_current_user} or a sign-in callback.
 * @returns {Bool} `true` while a user is signed in, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_auth_user_get_token
 * @desc **Firebase C++ SDK:** [firebase::auth::User::GetToken](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/user#gettoken)
 *
 * This function fetches the user's ID token - the JSON Web Token that identifies the player to your
 * own backend, which verifies it with the Firebase Admin SDK. A cached token that has not expired is
 * returned at once; set `force_refresh` to get a new one regardless, for example after the server
 * rejected the last one.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when nobody is
 * signed in on the handle.
 *
 * @param {Real} user_ref The user's handle, from ${function.firebase_auth_current_user} or a sign-in callback.
 * @param {Bool} force_refresh `true` to fetch a new token even if the cached one is still valid.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the token.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {String} token The ID token, or an empty string on failure.
 * @event_end
 *
 * @example
 * ```gml
 * var _user = firebase_auth_current_user();
 * if (!is_undefined(_user))
 * {
 *     firebase_auth_user_get_token(_user, false, function(_error_code, _error_message, _token)
 *     {
 *         if (_error_code == FirebaseAuthError.None)
 *         {
 *             http_request(server_url, "POST", json_encode_headers, json_stringify({ token: _token }));
 *         }
 *         else
 *         {
 *             show_debug_message("Token fetch failed: " + _error_message);
 *         }
 *     });
 * }
 * ```
 * The above code fetches the current user's token and sends it to the game's own server, which
 * can check who the player is without trusting anything the client says.
 * @function_end
 */

/**
 * @function firebase_auth_user_update_password
 * @desc **Firebase C++ SDK:** [firebase::auth::User::UpdatePassword](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/user#updatepassword)
 *
 * This function changes the user's password. Firebase requires a recent sign-in for this: when the
 * callback fails with `FirebaseAuthError.RequiresRecentLogin`, call
 * ${function.firebase_auth_user_reauthenticate} with the current password and try again. A password
 * shorter than six characters fails with `WeakPassword`.
 *
 * @param {Real} user_ref The user's handle, from ${function.firebase_auth_current_user} or a sign-in callback.
 * @param {String} password The new password, at least six characters.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the password has been changed, or with the reason it was not.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @example
 * ```gml
 * firebase_auth_user_update_password(user, new_password, function(_error_code, _error_message)
 * {
 *     if (_error_code == FirebaseAuthError.RequiresRecentLogin)
 *     {
 *         var _credential = firebase_auth_email_auth_provider_get_credential(email, old_password);
 *         firebase_auth_user_reauthenticate(user, _credential, function(_error_code, _error_message)
 *         {
 *             if (_error_code == FirebaseAuthError.None)
 *             {
 *                 firebase_auth_user_update_password(user, new_password, undefined);
 *             }
 *         });
 *         firebase_auth_credential_release(_credential);
 *     }
 * });
 * ```
 * The above code changes the password and, if the server wants a fresh sign-in first,
 * re-authenticates with the old password and retries. The retry passes `undefined` as its callback
 * for brevity; a real game would report that result too.
 * @function_end
 */

/**
 * @function firebase_auth_user_update_profile
 * @desc **Firebase C++ SDK:** [firebase::auth::User::UpdateUserProfile](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/user#updateuserprofile)
 *
 * This function sets the user's display name and photo URL. Both are always written: an empty string
 * clears that field. To change only one of them, pass the current value of the other, read through
 * ${function.firebase_auth_user_get_info}.
 *
 * @param {Real} user_ref The user's handle, from ${function.firebase_auth_current_user} or a sign-in callback.
 * @param {String} display_name The new display name, or an empty string to clear it.
 * @param {String} photo_url The new photo URL, or an empty string to clear it.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the profile has been updated, or with the reason it was not.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @example
 * ```gml
 * var _photo_url = firebase_auth_user_get_info(user).photo_url;
 * firebase_auth_user_update_profile(user, "Player One", _photo_url, function(_error_code, _error_message)
 * {
 *     show_debug_message(_error_code == FirebaseAuthError.None ? "Name updated" : _error_message);
 * });
 * ```
 * The above code changes the display name and keeps the photo URL as it is by passing the
 * current value back.
 * @function_end
 */

/**
 * @function firebase_auth_user_send_email_verification
 * @desc **Firebase C++ SDK:** [firebase::auth::User::SendEmailVerification](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/user#sendemailverification)
 *
 * This function sends the user a verification e-mail with a link; once they follow it, the
 * `is_email_verified` of ${function.firebase_auth_user_get_info} reports `true` after the next
 * ${function.firebase_auth_user_reload}. The e-mail is in the language set with
 * ${function.firebase_auth_set_language_code}.
 *
 * @param {Real} user_ref The user's handle, from ${function.firebase_auth_current_user} or a sign-in callback.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the e-mail has been sent, or with the reason it was not.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_auth_user_send_email_verification_before_updating_email
 * @desc **Firebase C++ SDK:** [firebase::auth::User::SendEmailVerificationBeforeUpdatingEmail](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/user#sendemailverificationbeforeupdatingemail)
 *
 * This function changes the user's e-mail address the safe way: a verification e-mail goes to the
 * *new* address, and the account switches to it once the link is followed. Until then the old
 * address stays in place. It may fail with `FirebaseAuthError.RequiresRecentLogin`, in which case
 * ${function.firebase_auth_user_reauthenticate} first.
 *
 * @param {Real} user_ref The user's handle, from ${function.firebase_auth_current_user} or a sign-in callback.
 * @param {String} new_email The address to switch the account to.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the verification e-mail has been sent, or with the reason it was not.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_auth_user_reauthenticate
 * @desc **Firebase C++ SDK:** [firebase::auth::User::Reauthenticate](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/user#reauthenticate)
 *
 * This function proves the user's identity again with a fresh credential, which Firebase demands
 * before sensitive changes - a new password, a new e-mail address, deleting the account - when the
 * sign-in is more than a few minutes old (`FirebaseAuthError.RequiresRecentLogin`). The credential
 * must belong to the signed-in user; another account's credential fails with `UserMismatch`.
 *
 * [[Note: On Android and desktop a failed re-authentication can sign the user out.]]
 *
 * @param {Real} user_ref The user's handle, from ${function.firebase_auth_current_user} or a sign-in callback.
 * @param {Real} credential_ref A credential handle from one of the `*_get_credential` functions.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the user has been re-authenticated, or with the reason they were not.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_auth_user_reauthenticate_and_retrieve_data
 * @desc **Firebase C++ SDK:** [firebase::auth::User::ReauthenticateAndRetrieveData](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/user#reauthenticateandretrievedata)
 *
 * This function is ${function.firebase_auth_user_reauthenticate} with the provider's data requested
 * from the server, delivered as a ${struct.FirebaseAuthResult}: the user, and the provider's
 * additional data and any credential it returned, to release with
 * ${function.firebase_auth_credential_release}.
 *
 * @param {Real} user_ref The user's handle, from ${function.firebase_auth_current_user} or a sign-in callback.
 * @param {Real} credential_ref A credential handle from one of the `*_get_credential` functions.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the outcome of the re-authentication.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Struct.FirebaseAuthResult} result The sign-in result - `result.user` is the user's handle - or `undefined` on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_auth_user_link_with_credential
 * @desc **Firebase C++ SDK:** [firebase::auth::User::LinkWithCredential](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/user#linkwithcredential)
 *
 * This function attaches another sign-in method to the user's account, so the same account can be
 * reached with either - an e-mail/password credential on an anonymous account, a Google credential
 * on an e-mail account. The callback fails with `FirebaseAuthError.CredentialAlreadyInUse` when the
 * credential belongs to a different account, and with `ProviderAlreadyLinked` when the account
 * already has that provider. Remove a provider again with ${function.firebase_auth_user_unlink}.
 * The callback receives a ${struct.FirebaseAuthResult}: `user` is the signed-in user's handle,
 * `credential` a credential the provider returned (or `undefined`) and `additional_user_info` the
 * provider's additional data. Release the result's `credential` and
 * `additional_user_info.updated_credential`, when present, with
 * ${function.firebase_auth_credential_release}.
 *
 * @param {Real} user_ref The user's handle, from ${function.firebase_auth_current_user} or a sign-in callback.
 * @param {Real} credential_ref A credential handle from one of the `*_get_credential` functions.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the outcome of the link.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Struct.FirebaseAuthResult} result The sign-in result - `result.user` is the user's handle - or `undefined` on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_auth_user_unlink
 * @desc **Firebase C++ SDK:** [firebase::auth::User::Unlink](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/user#unlink)
 *
 * This function detaches a sign-in provider from the user's account. The callback fails with
 * `FirebaseAuthError.NoSuchProvider` when the account is not linked to that provider. It delivers
 * a ${struct.FirebaseAuthResult} whose `user` is the account as it now stands.
 *
 * @param {Real} user_ref The user's handle, from ${function.firebase_auth_current_user} or a sign-in callback.
 * @param {String} provider_id The provider to detach, for example the value of ${function.firebase_auth_google_auth_provider_id}.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the outcome of the unlink.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Struct.FirebaseAuthResult} result The sign-in result - `result.user` is the user's handle - or `undefined` on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_auth_user_reload
 * @desc **Firebase C++ SDK:** [firebase::auth::User::Reload](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/user#reload)
 *
 * This function refreshes the cached user from the server - the verified flag, the display name,
 * the linked providers, everything the getters read. Call it after the player has followed a
 * verification link, or when another device may have changed the account.
 *
 * @param {Real} user_ref The user's handle, from ${function.firebase_auth_current_user} or a sign-in callback.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the user data has been refreshed, or with the reason it was not.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @example
 * ```gml
 * firebase_auth_user_reload(user, function(_error_code, _error_message)
 * {
 *     if (_error_code == FirebaseAuthError.None && firebase_auth_user_get_info(user).is_email_verified)
 *     {
 *         show_debug_message("E-mail verified");
 *     }
 * });
 * ```
 * The above code refreshes the user and then reads the verified flag, which the cached user
 * would still report as `false` after the player clicked the link.
 * @function_end
 */

/**
 * @function firebase_auth_user_delete
 * @desc **Firebase C++ SDK:** [firebase::auth::User::Delete](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/user#delete)
 *
 * This function deletes the user's account from the Firebase project and signs the user out. It
 * requires a recent sign-in (`FirebaseAuthError.RequiresRecentLogin`, see
 * ${function.firebase_auth_user_reauthenticate}). The player's data in Cloud Firestore, the
 * Realtime Database and Cloud Storage is not touched; delete it yourself before or after.
 *
 * [[Warning: There is no undo. The user ID is gone for good, and a later sign-up with the same
 * address gets a new one.]]
 *
 * @param {Real} user_ref The user's handle, from ${function.firebase_auth_current_user} or a sign-in callback.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the account has been deleted, or with the reason it was not.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_auth_federated_oauth_provider_create
 * @desc **Firebase C++ SDK:** [firebase::auth::FederatedOAuthProvider::FederatedOAuthProvider](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/federated-o-auth-provider#federatedoauthprovider)
 *
 * This function creates a provider description for a sign-in that Firebase drives itself, through a
 * web view on Android and iOS: Microsoft, Yahoo, Apple, GitHub, Twitter, or a custom OIDC provider
 * enabled in the console. Pass the handle to ${function.firebase_auth_sign_in_with_provider},
 * ${function.firebase_auth_user_link_with_provider} or
 * ${function.firebase_auth_user_reauthenticate_with_provider}, and release it with
 * ${function.firebase_auth_federated_oauth_provider_release} when done.
 *
 * This is the way to sign in with those providers without a separate sign-in extension, on Android
 * and iOS only: on desktop the sign-in fails with `FirebaseAuthError.Unimplemented`.
 *
 * @param {String} provider_id The provider's ID as configured in the console, for example `"microsoft.com"`.
 * @param {Array[String]} scopes The OAuth scopes to request, or an empty array for the provider's defaults.
 * @param {Any} custom_parameters A struct of string values with the provider's own parameters (`{ prompt: "consent" }`), or an empty struct.
 * @returns {Real} A provider handle.
 *
 * @example
 * ```gml
 * var _provider = firebase_auth_federated_oauth_provider_create("microsoft.com", ["mail.read"], { prompt: "consent" });
 * firebase_auth_sign_in_with_provider(_provider, function(_error_code, _error_message, _result)
 * {
 *     if (_error_code == FirebaseAuthError.None)
 *     {
 *         show_debug_message("Signed in as " + firebase_auth_user_get_info(_result.user).uid);
 *         if (!is_undefined(_result.credential))
 *         {
 *             firebase_auth_credential_release(_result.credential);
 *         }
 *     }
 *     else if (_error_code == FirebaseAuthError.UserCancelled)
 *     {
 *         show_debug_message("The player closed the sign-in page");
 *     }
 *     else
 *     {
 *         show_debug_message("Sign-in failed: " + _error_message);
 *     }
 * });
 * firebase_auth_federated_oauth_provider_release(_provider);
 * ```
 * The above code signs in with a Microsoft account through the web view the SDK opens, asking for
 * one extra scope and forcing the consent prompt. The result's credential is released when present,
 * and the provider is released right after the call - the SDK keeps its own copy.
 * @function_end
 */

/**
 * @function firebase_auth_federated_oauth_provider_set_data
 * @desc **Firebase C++ SDK:** [firebase::auth::FederatedOAuthProvider::SetProviderData](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/federated-o-auth-provider#setproviderdata)
 *
 * This function replaces the provider ID, scopes and custom parameters of an existing provider
 * handle, for reuse across sign-ins.
 *
 * @param {Real} provider A provider handle from ${function.firebase_auth_federated_oauth_provider_create}.
 * @param {String} provider_id The provider's ID as configured in the console.
 * @param {Array[String]} scopes The OAuth scopes to request, or an empty array.
 * @param {Any} custom_parameters A struct of string values with the provider's own parameters, or an empty struct.
 * @function_end
 */

/**
 * @function firebase_auth_federated_oauth_provider_release
 * @desc This function releases a provider handle from
 * ${function.firebase_auth_federated_oauth_provider_create}. Release it as soon as the call that used
 * it has returned `FirebaseError.Ok`.
 *
 * @param {Real} provider The provider handle to release.
 * @function_end
 */

/**
 * @function firebase_auth_sign_in_with_provider
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::SignInWithProvider](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#signinwithprovider)
 *
 * This function signs in through a provider Firebase drives itself: the SDK opens the provider's
 * sign-in page in a web view, and the callback receives a ${struct.FirebaseAuthResult} with the
 * user, the provider's credential and its additional data. Android and iOS only; on desktop the
 * callback fails with `FirebaseAuthError.Unimplemented`. A player who closes the page fails with
 * `UserCancelled`.
 *
 * Release the result's `credential` and `additional_user_info.updated_credential`, when present,
 * with ${function.firebase_auth_credential_release}.
 *
 * @param {Real} provider A provider handle from ${function.firebase_auth_federated_oauth_provider_create}.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the outcome of the sign-in, after the web view has closed.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Struct.FirebaseAuthResult} result The sign-in result - `result.user` is the user's handle - or `undefined` on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_auth_user_provider_data
 * @desc **Firebase C++ SDK:** [firebase::auth::User::provider_data](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/user#provider_data)
 *
 * This function returns the sign-in providers linked to the user's account, one
 * ${struct.FirebaseAuthProviderUserInfo} per provider in the SDK's order: the profile each provider
 * holds for the user - the ID, e-mail, display name, photo and phone number as that provider knows
 * them. The array is empty for a user with no provider entries and for a handle that is not valid
 * (with ${function.firebase_last_error_code} set to `FirebaseError.InvalidHandle`).
 *
 * @param {Real} user The user's handle, from ${function.firebase_auth_current_user} or a sign-in callback.
 * @returns {Array[Struct.FirebaseAuthProviderUserInfo]} An array of the linked providers' profiles, empty when there are none.
 *
 * @example
 * ```gml
 * var _providers = firebase_auth_user_provider_data(user);
 * for (var _i = 0; _i < array_length(_providers); _i++)
 * {
 *     var _entry = _providers[_i];
 *     show_debug_message($"{_entry.provider_id}: {_entry.display_name} <{_entry.email}>");
 * }
 * ```
 * The above code lists every provider linked to the account with the name and address each one
 * knows the player by.
 * @function_end
 */

/**
 * @function firebase_auth_user_reauthenticate_with_provider
 * @desc **Firebase C++ SDK:** [firebase::auth::User::ReauthenticateWithProvider](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/user#reauthenticatewithprovider)
 *
 * This function re-authenticates the user through a provider Firebase drives itself, opening the
 * provider's page in a web view as ${function.firebase_auth_sign_in_with_provider} does. Android
 * and iOS only; on desktop the callback fails with `FirebaseAuthError.Unimplemented`.
 *
 * @param {Real} user The user's handle, from ${function.firebase_auth_current_user} or a sign-in callback.
 * @param {Real} provider A provider handle from ${function.firebase_auth_federated_oauth_provider_create}.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the outcome of the re-authentication.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Struct.FirebaseAuthResult} result The sign-in result - `result.user` is the user's handle - or `undefined` on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_auth_user_link_with_provider
 * @desc **Firebase C++ SDK:** [firebase::auth::User::LinkWithProvider](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/user#linkwithprovider)
 *
 * This function links a provider Firebase drives itself to the user's account, opening the
 * provider's page in a web view as ${function.firebase_auth_sign_in_with_provider} does. Android
 * and iOS only; on desktop the callback fails with `FirebaseAuthError.Unimplemented`.
 *
 * @param {Real} user The user's handle, from ${function.firebase_auth_current_user} or a sign-in callback.
 * @param {Real} provider A provider handle from ${function.firebase_auth_federated_oauth_provider_create}.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the outcome of the link.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Struct.FirebaseAuthResult} result The sign-in result - `result.user` is the user's handle - or `undefined` on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_auth_user_update_phone_number_credential
 * @desc **Firebase C++ SDK:** [firebase::auth::User::UpdatePhoneNumberCredential](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/user#updatephonenumbercredential)
 *
 * This function replaces the phone number linked to the user's account with the one a new phone
 * credential was verified for - a shortcut for unlinking the phone provider and linking the new
 * credential. The credential must come from the phone flow
 * (${function.firebase_auth_phone_verify_phone_number} or
 * ${function.firebase_auth_phone_get_credential}); any other kind fails with
 * `FirebaseError.InvalidHandle` before the call.
 *
 * @param {Real} user The user's handle, from ${function.firebase_auth_current_user} or a sign-in callback.
 * @param {Real} phone_credential A phone credential handle.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the outcome of the update.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} updated_user The user's handle, or `undefined` on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_auth_get_app
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::app](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#app)
 *
 * This function returns a handle to the Firebase App the Authentication instance belongs to - the
 * default app unless ${function.firebase_auth_use_instance} switched to another. Release it with
 * ${function.firebase_app_release_handle}.
 *
 * @returns {Real} An app handle, or `0` when Authentication is unavailable.
 * @function_end
 */

/**
 * @function firebase_auth_get_current_instance_handle
 * @desc This function returns a handle to the Authentication instance the `firebase_auth_*` functions
 * currently act on, so it can be restored with ${function.firebase_auth_use_instance} after
 * switching to a second app's instance. Authentication instances live as long as the game; there is
 * nothing to release.
 *
 * @returns {Real} The current instance's handle, or `0` when Authentication is unavailable.
 * @function_end
 */

/**
 * @function firebase_auth_get_instance_for_app
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::GetAuth](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#getauth)
 *
 * This function returns a handle to the Authentication instance of another Firebase App, created
 * with ${function.firebase_app_initialize_with_options} or
 * ${function.firebase_app_initialize_from_json}, creating the instance if needed. The
 * `firebase_auth_*` functions have no instance argument, so to use it, switch with
 * ${function.firebase_auth_use_instance}. Returns `0`, with ${function.firebase_last_error_code} set,
 * when the app handle is not valid or the instance could not be created.
 *
 * @param {Real} app An app handle.
 * @returns {Real} The app's Authentication instance handle, or `0` on failure.
 * @function_end
 */

/**
 * @function firebase_auth_use_instance
 * @desc This function makes the given Authentication instance the one every `firebase_auth_*` function
 * acts on, for a game that signs in against more than one Firebase project. Save the handle from
 * ${function.firebase_auth_get_current_instance_handle} first to switch back.
 *
 * @param {Real} auth An instance handle from ${function.firebase_auth_get_instance_for_app} or ${function.firebase_auth_get_current_instance_handle}.
 * @returns {Bool} `true` when the instance was switched, `false` when the handle is not valid.
 *
 * @example
 * ```gml
 * var _default_auth = firebase_auth_get_current_instance_handle();
 * var _second_auth = firebase_auth_get_instance_for_app(second_app);
 *
 * firebase_auth_use_instance(_second_auth);
 * firebase_auth_sign_in_anonymously(function(_error_code, _error_message, _result)
 * {
 *     show_debug_message("Second project: " + (_error_code == FirebaseAuthError.None ? firebase_auth_user_get_info(_result.user).uid : _error_message));
 * });
 * firebase_auth_use_instance(_default_auth);
 * ```
 * The above code signs in anonymously against a second Firebase project and switches straight
 * back to the default instance. The callback still belongs to the second instance's call and reports
 * that project's user.
 * @function_end
 */

/**
 * @function firebase_auth_instance_get_app
 * @desc **Firebase C++ SDK:** [firebase::auth::Auth::app](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/auth#app)
 *
 * This function returns a handle to the Firebase App an Authentication instance belongs to. Release
 * it with ${function.firebase_app_release_handle}.
 *
 * @param {Real} auth An instance handle.
 * @returns {Real} An app handle, or `0` when the instance handle is not valid.
 * @function_end
 */

/**
 * @function firebase_auth_email_auth_provider_id
 * @desc This function returns the provider ID of e-mail/password accounts, `"password"`.
 *
 * @returns {String} The provider ID.
 * @function_end
 */

/**
 * @function firebase_auth_facebook_auth_provider_id
 * @desc This function returns the provider ID of Facebook Login, `"facebook.com"`.
 *
 * @returns {String} The provider ID.
 * @function_end
 */

/**
 * @function firebase_auth_game_center_auth_provider_id
 * @desc This function returns the provider ID of Game Center, `"gc.apple.com"`.
 *
 * @returns {String} The provider ID.
 * @function_end
 */

/**
 * @function firebase_auth_github_auth_provider_id
 * @desc This function returns the provider ID of GitHub, `"github.com"`.
 *
 * @returns {String} The provider ID.
 * @function_end
 */

/**
 * @function firebase_auth_google_auth_provider_id
 * @desc This function returns the provider ID of Google Sign-In, `"google.com"`.
 *
 * @returns {String} The provider ID.
 * @function_end
 */

/**
 * @function firebase_auth_microsoft_auth_provider_id
 * @desc This function returns the provider ID of Microsoft accounts, `"microsoft.com"`.
 *
 * @returns {String} The provider ID.
 * @function_end
 */

/**
 * @function firebase_auth_play_games_auth_provider_id
 * @desc This function returns the provider ID of Google Play Games, `"playgames.google.com"`.
 *
 * @returns {String} The provider ID.
 * @function_end
 */

/**
 * @function firebase_auth_twitter_auth_provider_id
 * @desc This function returns the provider ID of Twitter, `"twitter.com"`.
 *
 * @returns {String} The provider ID.
 * @function_end
 */

/**
 * @function firebase_auth_yahoo_auth_provider_id
 * @desc This function returns the provider ID of Yahoo, `"yahoo.com"`.
 *
 * @returns {String} The provider ID.
 * @function_end
 */

/**
 * @function firebase_auth_game_center_auth_provider_get_credential_last_result
 * @desc **Firebase C++ SDK:** [firebase::auth::GameCenterAuthProvider::GetCredentialLastResult](https://firebase.google.com/docs/reference/cpp/class/firebase/auth/game-center-auth-provider#getcredentiallastresult)
 *
 * This function delivers the result of the most recent
 * ${function.firebase_auth_game_center_auth_provider_get_credential} call again, to its callback,
 * without asking Game Center anew. iOS only; elsewhere it returns `FirebaseError.Unsupported`
 * without calling the callback.
 *
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the last Game Center credential result.
 * @member {Enum.FirebaseAuthError} error_code `FirebaseAuthError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} credential A credential handle, or `undefined` on failure.
 * @event_end
 * @function_end
 */

/**
 * @struct FirebaseAuthProviderUserInfo
 * @desc The profile one linked sign-in provider holds for a user, one element of the array
 * ${function.firebase_auth_user_provider_data} returns. Each field is what *that provider* reported,
 * which can differ from the user's own values in ${struct.FirebaseAuthUserInfo}.
 *
 * @member {String} uid The user's ID at the provider.
 * @member {String} email The e-mail address the provider reported, or an empty string.
 * @member {String} display_name The display name the provider reported, or an empty string.
 * @member {String} photo_url The photo URL the provider reported, or an empty string.
 * @member {String} provider_id The provider's ID, for example `"google.com"`.
 * @member {String} phone_number The phone number the provider reported, or an empty string.
 * @struct_end
 */

/**
 * @struct FirebaseAuthAdditionalUserInfo
 * @desc What the identity provider returned beyond the user, inside a ${struct.FirebaseAuthResult}.
 * `profile` is the provider's raw profile with the provider's own keys - `picture`, `locale`,
 * `given_name` for Google, say - so check for a key before reading it.
 *
 * @member {String} provider_id The ID of the provider that signed the user in.
 * @member {String} user_name The user's name at the provider, or an empty string.
 * @member {Any} profile A struct with the provider's raw profile, empty when the provider returned none.
 * @member {Real} [updated_credential] A credential the provider returned for reuse, or `undefined`. Release it with ${function.firebase_auth_credential_release}.
 * @struct_end
 */

/**
 * @struct FirebaseAuthUserInfo
 * @desc Every property of a user in one struct, from ${function.firebase_auth_user_get_info}, read from
 * the cached user - ${function.firebase_auth_user_reload} refreshes it from the server.
 *
 * @member {String} uid The user ID, unique within the project - the key to store the player's data under in Cloud Firestore or the Realtime Database.
 * @member {String} email The e-mail address associated with the account, or an empty string.
 * @member {String} display_name The display name, as set by the sign-in provider or ${function.firebase_auth_user_update_profile}, or an empty string.
 * @member {String} photo_url The URL of the profile photo, as set by the sign-in provider or ${function.firebase_auth_user_update_profile}, or an empty string.
 * @member {String} provider_id The ID of the provider the user signed in with - `"firebase"` for a Firebase user; the providers linked to the account are listed by ${function.firebase_auth_user_provider_data}.
 * @member {String} phone_number The phone number linked to the account, in E.164 format, or an empty string.
 * @member {Bool} is_email_verified Whether the user has followed the link ${function.firebase_auth_user_send_email_verification} sends.
 * @member {Bool} is_anonymous Whether the user signed in with ${function.firebase_auth_sign_in_anonymously} and has not yet linked a real credential.
 * @member {Bool} is_valid Whether a user is signed in on this handle.
 * @member {Real} creation_timestamp When the account was created (UTC milliseconds since the Unix epoch).
 * @member {Real} last_sign_in_timestamp When the user last signed in (UTC milliseconds since the Unix epoch).
 * @struct_end
 */

/**
 * @struct FirebaseAuthResult
 * @desc The full outcome of a sign-in, sign-up, link, unlink or re-authentication, delivered by every
 * such callback except ${function.firebase_auth_sign_in_with_credential}'s. The `user` is the live
 * user view (see ${function.firebase_auth_current_user}); the two credentials it may carry are
 * handles to release with ${function.firebase_auth_credential_release}.
 *
 * @member {Real} [user] The signed-in user's handle, or `undefined` when the operation failed.
 * @member {Real} [credential] The credential the provider returned, or `undefined`.
 * @member {Struct.FirebaseAuthAdditionalUserInfo} additional_user_info The provider's additional data.
 * @struct_end
 */

/**
 * @const FirebaseAuthError
 * @desc The `error_code` every Authentication callback receives, mirroring the SDK's own error
 * codes value for value. `None` is success; compare against the named members to react to a
 * specific failure, and print `error_message` for the rest. Several codes only occur on one
 * platform, as noted.
 *
 * @member None Success.
 * @member Unimplemented The operation is not implemented on this platform - a web-view sign-in on desktop, for example.
 * @member Failure An internal error; the message carries the detail.
 * @member InvalidCustomToken The custom token is malformed.
 * @member CustomTokenMismatch The custom token was minted for a different project.
 * @member InvalidCredential The credential is malformed or has expired.
 * @member UserDisabled The account has been disabled in the console.
 * @member AccountExistsWithDifferentCredentials An account with this e-mail exists, signed in with another provider; link the accounts instead.
 * @member OperationNotAllowed This sign-in method is not enabled in the console.
 * @member EmailAlreadyInUse The e-mail address already has an account.
 * @member RequiresRecentLogin The change needs a fresh sign-in; re-authenticate and retry.
 * @member CredentialAlreadyInUse The credential is already linked to another account.
 * @member InvalidEmail The e-mail address is malformed.
 * @member WrongPassword The password is wrong.
 * @member TooManyRequests Too many requests in a short time; try again later.
 * @member UserNotFound No account matches - an unknown e-mail, or a deleted user.
 * @member ProviderAlreadyLinked The account is already linked to this provider.
 * @member NoSuchProvider The account is not linked to this provider.
 * @member InvalidUserToken The saved sign-in is no longer valid; the user must sign in again.
 * @member UserTokenExpired The saved sign-in has expired, for example after a password change elsewhere; the user must sign in again.
 * @member NetworkRequestFailed A network error - timeout, no connection, unreachable host; usually worth a retry.
 * @member InvalidApiKey The API key in the configuration file is not valid.
 * @member AppNotAuthorized The app is not authorised to use Authentication with this API key.
 * @member UserMismatch The credential belongs to a different user than the one being re-authenticated.
 * @member WeakPassword The password is too weak (fewer than six characters).
 * @member NoSignedInUser A token was requested with nobody signed in. Android only.
 * @member ApiNotAvailable The Authentication API is not loaded. Android only.
 * @member ExpiredActionCode The out-of-band code (from an e-mail link) has expired.
 * @member InvalidActionCode The out-of-band code is not valid.
 * @member InvalidMessagePayload The password reset request carried invalid parameters.
 * @member InvalidPhoneNumber The phone number is malformed.
 * @member MissingPhoneNumber No phone number was given. iOS only.
 * @member InvalidRecipientEmail The recipient e-mail address is not valid.
 * @member InvalidSender The sender configured for the e-mails is not valid.
 * @member InvalidVerificationCode The SMS code is wrong.
 * @member InvalidVerificationId The verification ID is not valid.
 * @member MissingVerificationCode The phone credential was built with an empty code.
 * @member MissingVerificationId The phone credential was built with an empty verification ID.
 * @member MissingEmail No e-mail address was given.
 * @member MissingPassword No password was given. Android only.
 * @member QuotaExceeded The project's quota for this operation (SMS, sign-ins, account creation) is used up.
 * @member RetryPhoneAuth The phone credentials did not identify the user; read the message. Android only.
 * @member SessionExpired The SMS code has expired.
 * @member AppNotVerified Firebase could not verify the app during phone sign-in. iOS only.
 * @member AppVerificationFailed The app verification flow failed. iOS only.
 * @member CaptchaCheckFailed The reCAPTCHA token is not valid. iOS only.
 * @member InvalidAppCredential The APNs device token is not valid. iOS only.
 * @member MissingAppCredential The APNs device token is missing. iOS only.
 * @member InvalidClientId The client ID used for a web flow is not valid. iOS only.
 * @member InvalidContinueUri The continue URL's domain is not valid. iOS only.
 * @member MissingContinueUri A continue URL was required and not given.
 * @member KeychainError The keychain could not be accessed. iOS only.
 * @member MissingAppToken The APNs device token could not be obtained - remote notifications are not set up. iOS only.
 * @member MissingIosBundleId An App Store ID was given without a bundle ID. iOS only.
 * @member NotificationNotForwarded The app did not forward a remote notification to Firebase. iOS only.
 * @member UnauthorizedDomain The continue URL's domain is not on the console's allow list. iOS only.
 * @member WebContextAlreadyPresented A web sign-in page is already open.
 * @member WebContextCancelled The player closed the web sign-in page early.
 * @member DynamicLinkNotActivated Dynamic Links is not enabled for the project.
 * @member Cancelled The operation was cancelled.
 * @member InvalidProviderId The provider ID for a web sign-in is not valid.
 * @member WebInternalError An internal error during a web sign-in.
 * @member WebStorateUnsupported Third-party cookies or storage are disabled in the web view.
 * @member TenantIdMismatch The tenant ID does not match the Authentication instance's.
 * @member UnsupportedTenantOperation The operation does not support multi-tenancy.
 * @member InvalidLinkDomain The Dynamic Links domain for an e-mail link flow is not configured or not authorised.
 * @member RejectedCredential The credential data is not valid - a project mismatch, or a Game Center player already signed in to another account.
 * @member PhoneNumberNotFound The phone number is not a second factor of this user.
 * @member InvalidTenantId The tenant ID is not valid.
 * @member MissingClientIdentifier The request had no valid client identifier.
 * @member MissingMultiFactorSession A second-factor challenge was requested without a first-factor sign-in.
 * @member MissingMultiFactorInfo A second-factor challenge was requested without a factor identifier.
 * @member InvalidMultiFactorSession The first-factor proof in a second-factor challenge is not valid.
 * @member MultiFactorInfoNotFound The user has no second factor with that identifier.
 * @member AdminRestrictedOperation The operation is restricted to administrators.
 * @member UnverifiedEmail The user's e-mail must be verified first.
 * @member SecondFactorAlreadyEnrolled The second factor is already enrolled.
 * @member MaximumSecondFactorCountExceeded The user has the maximum number of second factors.
 * @member UnsupportedFirstFactor The first factor is not supported for two-factor users.
 * @member EmailChangeNeedsVerification A two-factor user must change their e-mail through the verify-before-update flow.
 * @member InvalidEventHandler The event handler is null or not valid.
 * @member FederatedProviderAreadyInUse The federated provider is busy with a previous request; try again when it completes.
 * @member InvalidAuthenticatedUserData The authenticated user data has invalid fields.
 * @member FederatedSignInUserInteractionFailure The web sign-in flow failed while the player was entering their credentials.
 * @member MissingOrInvalidNonce The nonce is missing or does not match the one hashed into the ID token.
 * @member UserCancelled The player did not authorise the app during a web sign-in.
 * @member UnsupportedPassthroughOperation An unsupported backend endpoint was requested in passthrough mode.
 * @member TokenRefreshUnavailable A token refresh was requested with no refresh token available.
 * @const_end
 */

/**
 * @module auth
 * @title Authentication
 * @desc This module covers Firebase Authentication: signing players in with an e-mail and password,
 * anonymously, with a phone number, with a custom token from your own server, or with a credential
 * from another identity provider; reading and updating the signed-in user; and keeping several
 * sign-in methods linked to one account.
 *
 * ### How a sign-in works
 *
 * Every sign-in function takes a callback and returns ${constant.FirebaseError} synchronously; the
 * callback receives an `error_code` from ${constant.FirebaseAuthError} (`None` on success), an
 * `error_message`, and a ${struct.FirebaseAuthResult} whose `user` is the signed-in user, with the
 * provider's additional data and any credential it returned alongside
 * (${function.firebase_auth_sign_in_with_credential} alone delivers the user handle by itself, as
 * the SDK does). The user arrives as a **handle** that is the Authentication instance's live view of
 * its current user: the same handle comes back from ${function.firebase_auth_current_user}, from
 * every sign-in and from every listener, and it always reports whoever is signed in now.
 * ${function.firebase_auth_user_release} therefore frees nothing. Firebase persists the sign-in, so
 * on the next run the player is signed in before any of your code runs -
 * ${function.firebase_auth_add_state_listener} is the way to learn that.
 *
 * ### Credentials and providers
 *
 * E-mail/password and anonymous sign-in need nothing else. Every other provider needs a
 * **credential**, built with the matching `*_get_credential` function from a token that provider's
 * own sign-in flow produced, and released with ${function.firebase_auth_credential_release} once
 * the sign-in has started. Obtaining that token is not part of this extension: a Google, Facebook or
 * Play Games sign-in needs the corresponding extension to run the provider's flow first, and Game
 * Center works on iOS through ${function.firebase_auth_game_center_auth_provider_get_credential}.
 * Phone number sign-in is built in, on Android and iOS, through
 * ${function.firebase_auth_phone_verify_phone_number}. For Microsoft, Yahoo, Apple, GitHub, Twitter
 * and custom OIDC providers, ${function.firebase_auth_sign_in_with_provider} lets the SDK run the
 * whole flow in a web view on Android and iOS, with no other extension involved.
 *
 * Whichever way the player signed in, ${function.firebase_auth_user_link_with_credential} attaches
 * further sign-in methods to the same account, which is how an anonymous player keeps their data
 * when they register.
 *
 * ### Console setup
 *
 * Enable each sign-in method you use under **Authentication > Sign-in method** in the Firebase
 * console; a method that is not enabled fails with `FirebaseAuthError.OperationNotAllowed`. On
 * Android, Firebase Authentication also needs your signing certificate's SHA-1 on the app
 * registration (${page.platform_setup}). See ${page.guides_authentication} for the console steps.
 *
 * @section_func Instance
 * @desc The Authentication instance, its language and the emulator switch:
 * @ref firebase_auth_get_auth
 * @ref firebase_auth_language_code
 * @ref firebase_auth_set_language_code
 * @ref firebase_auth_use_app_language
 * @ref firebase_auth_use_emulator
 * @ref firebase_auth_get_app
 * @ref firebase_auth_get_current_instance_handle
 * @ref firebase_auth_get_instance_for_app
 * @ref firebase_auth_use_instance
 * @ref firebase_auth_instance_get_app
 * @section_end
 *
 * @section_func Sign-in and sign-out
 * @desc Signing a player in and out, and the current user:
 * @ref firebase_auth_current_user
 * @ref firebase_auth_sign_out
 * @ref firebase_auth_fetch_providers_for_email
 * @ref firebase_auth_sign_in_anonymously
 * @ref firebase_auth_sign_in_with_email_and_password
 * @ref firebase_auth_create_user_with_email_and_password
 * @ref firebase_auth_send_password_reset_email
 * @ref firebase_auth_sign_in_with_custom_token
 * @ref firebase_auth_sign_in_with_credential
 * @ref firebase_auth_sign_in_and_retrieve_data_with_credential
 * @ref firebase_auth_sign_in_with_provider
 * @section_end
 *
 * @section_func Listeners
 * @desc Being told when the signed-in user or their token changes:
 * @ref firebase_auth_add_state_listener
 * @ref firebase_auth_remove_state_listener
 * @ref firebase_auth_add_id_token_listener
 * @ref firebase_auth_remove_id_token_listener
 * @section_end
 *
 * @section_func User
 * @desc Reading the signed-in user. ${function.firebase_auth_user_get_info} returns every property at once
 * as a ${struct.FirebaseAuthUserInfo}:
 *
 * ```gml
 * var _user = firebase_auth_current_user();
 * if (!is_undefined(_user) && firebase_auth_user_is_valid(_user))
 * {
 *     var _info = firebase_auth_user_get_info(_user);
 *     show_debug_message(_info.display_name + " <" + _info.email + ">");
 * }
 * ```
 *
 * The above code prints the current user's name and address, checking first that someone is signed
 * in. For a handle nobody is signed in on, `is_valid` is `false` and every string member is empty.
 * @ref firebase_auth_user_get_info
 * @ref firebase_auth_user_release
 * @ref firebase_auth_user_is_valid
 * @ref firebase_auth_user_provider_data
 * @ref firebase_auth_user_get_token
 * @ref firebase_auth_user_reload
 * @section_end
 *
 * @section_func Updating the user
 * @desc Changing the account's password, profile, e-mail address and phone number, and deleting it:
 * @ref firebase_auth_user_update_password
 * @ref firebase_auth_user_update_profile
 * @ref firebase_auth_user_send_email_verification
 * @ref firebase_auth_user_send_email_verification_before_updating_email
 * @ref firebase_auth_user_update_phone_number_credential
 * @ref firebase_auth_user_delete
 * @section_end
 *
 * @section_func Linking and re-authentication
 * @desc Attaching further sign-in methods to an account and proving the player's identity again:
 * @ref firebase_auth_user_link_with_credential
 * @ref firebase_auth_user_link_with_provider
 * @ref firebase_auth_user_unlink
 * @ref firebase_auth_user_reauthenticate
 * @ref firebase_auth_user_reauthenticate_and_retrieve_data
 * @ref firebase_auth_user_reauthenticate_with_provider
 * @section_end
 *
 * @section_func Credentials
 * @desc Building a credential from another provider's token, and the two accessors every credential has.
 * The `*_auth_provider_id` functions return the provider ID strings the rest of the module uses -
 * compare against them rather than typing the strings:
 *
 * ```gml
 * var _credential = firebase_auth_google_auth_provider_get_credential(id_token, access_token);
 * if (firebase_auth_credential_is_valid(_credential) && firebase_auth_credential_provider(_credential) == firebase_auth_google_auth_provider_id())
 * {
 *     firebase_auth_sign_in_with_credential(_credential, on_signed_in);
 * }
 * firebase_auth_credential_release(_credential);
 * ```
 *
 * The above code builds a Google credential from tokens a Google Sign-In extension obtained, checks
 * it before use and releases it once the sign-in has been started.
 * @ref firebase_auth_credential_provider
 * @ref firebase_auth_credential_is_valid
 * @ref firebase_auth_credential_release
 * @ref firebase_auth_email_auth_provider_get_credential
 * @ref firebase_auth_google_auth_provider_get_credential
 * @ref firebase_auth_facebook_auth_provider_get_credential
 * @ref firebase_auth_play_games_auth_provider_get_credential
 * @ref firebase_auth_github_auth_provider_get_credential
 * @ref firebase_auth_twitter_auth_provider_get_credential
 * @ref firebase_auth_oauth_provider_get_credential
 * @ref firebase_auth_oauth_provider_get_credential_with_nonce
 * @ref firebase_auth_game_center_auth_provider_get_credential
 * @ref firebase_auth_game_center_auth_provider_get_credential_last_result
 * @ref firebase_auth_game_center_auth_provider_is_player_authenticated
 * @ref firebase_auth_email_auth_provider_id
 * @ref firebase_auth_google_auth_provider_id
 * @ref firebase_auth_facebook_auth_provider_id
 * @ref firebase_auth_play_games_auth_provider_id
 * @ref firebase_auth_game_center_auth_provider_id
 * @ref firebase_auth_github_auth_provider_id
 * @ref firebase_auth_twitter_auth_provider_id
 * @ref firebase_auth_microsoft_auth_provider_id
 * @ref firebase_auth_yahoo_auth_provider_id
 * @section_end
 *
 * @section_func Web sign-in providers
 * @desc Providers the SDK signs in with itself, through a web view, on Android and iOS:
 * @ref firebase_auth_federated_oauth_provider_create
 * @ref firebase_auth_federated_oauth_provider_set_data
 * @ref firebase_auth_federated_oauth_provider_release
 * @section_end
 *
 * @section_func Phone number sign-in
 * @desc Verifying a phone number by SMS, on Android and iOS:
 * @ref firebase_auth_phone_verify_phone_number
 * @ref firebase_auth_phone_get_credential
 * @ref firebase_auth_phone_credential_sms_code
 * @ref firebase_auth_phone_resending_token_release
 * @ref firebase_auth_phone_listener_release
 * @section_end
 *
 * @section_struct Structs
 * @desc The following structs are used by this module:
 * @ref FirebaseAuthUserInfo
 * @ref FirebaseAuthProviderUserInfo
 * @ref FirebaseAuthResult
 * @ref FirebaseAuthAdditionalUserInfo
 * @section_end
 *
 * @section_const Constants
 * @desc The following constants are used by this module:
 * @ref FirebaseAuthError
 * @section_end
 *
 * @module_end
 */
