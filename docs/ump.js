/**
 * @function firebase_ump_get_instance
 * @desc **Firebase C++ SDK:** [firebase::ump::ConsentInfo::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/ump/consent-info#getinstance)
 *
 * This function returns the handle to the consent-info object every other function in this
 * module takes. The User Messaging Platform SDK has one such object per process, so the same
 * handle comes back on every call and there is nothing to release. It returns `undefined` with
 * ${function.firebase_last_error_code} set when ${function.firebase_app_initialize} has not run
 * or the SDK could not initialise - on Android, when its Java classes could not be loaded.
 *
 * @returns {Real} The consent-info handle, or `undefined` on failure.
 * @function_end
 */

/**
 * @function firebase_ump_get_consent_status
 * @desc **Firebase C++ SDK:** [firebase::ump::ConsentInfo::GetConsentStatus](https://firebase.google.com/docs/reference/cpp/class/firebase/ump/consent-info#getconsentstatus)
 *
 * This function returns the player's consent status: `Unknown` until
 * ${function.firebase_ump_request_consent_info_update} has been called (or when it failed with
 * nothing stored from before), `Required` when a consent form has to be shown, `NotRequired`
 * when the region does not call for one, `Obtained` when the player has answered. The value is
 * the previous session's as soon as the update is requested and the fresh one when its callback
 * fires; the form functions update it before their callbacks.
 *
 * @param {Real} consent_ref The consent-info handle from ${function.firebase_ump_get_instance}.
 * @returns {Enum.FirebaseUmpConsentStatus} The status, `FirebaseUmpConsentStatus.Unknown` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_ump_get_consent_form_status
 * @desc **Firebase C++ SDK:** [firebase::ump::ConsentInfo::GetConsentFormStatus](https://firebase.google.com/docs/reference/cpp/class/firebase/ump/consent-info#getconsentformstatus)
 *
 * This function returns whether a consent form is available to load: `Unknown` before
 * ${function.firebase_ump_request_consent_info_update}, `Unavailable` when there is no form for
 * this player (no message configured, none required, or the player is tagged as under age),
 * `Available` when ${function.firebase_ump_load_consent_form} can load one.
 *
 * @param {Real} consent_ref The consent-info handle from ${function.firebase_ump_get_instance}.
 * @returns {Enum.FirebaseUmpConsentFormStatus} The status, `FirebaseUmpConsentFormStatus.Unknown` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_ump_get_privacy_options_requirement_status
 * @desc **Firebase C++ SDK:** [firebase::ump::ConsentInfo::GetPrivacyOptionsRequirementStatus](https://firebase.google.com/docs/reference/cpp/class/firebase/ump/consent-info#getprivacyoptionsrequirementstatus)
 *
 * This function returns whether the game has to offer the player a way to revisit their consent
 * choices: `Required` means a "Privacy settings" entry point (a button in the options menu is
 * the usual one) must call ${function.firebase_ump_show_privacy_options_form}, `NotRequired`
 * that none is needed, `Unknown` before ${function.firebase_ump_request_consent_info_update}.
 * Check it after the update and after each form has been dismissed, and show or hide the entry
 * point accordingly.
 *
 * @param {Real} consent_ref The consent-info handle from ${function.firebase_ump_get_instance}.
 * @returns {Enum.FirebaseUmpPrivacyOptionsRequirementStatus} The status, `FirebaseUmpPrivacyOptionsRequirementStatus.Unknown` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_ump_can_request_ads
 * @desc **Firebase C++ SDK:** [firebase::ump::ConsentInfo::CanRequestAds](https://firebase.google.com/docs/reference/cpp/class/firebase/ump/consent-info#canrequestads)
 *
 * This function says whether the game may request ads: `true` once
 * ${function.firebase_ump_request_consent_info_update} has been called this session and the
 * consent status is `FirebaseUmpConsentStatus.Obtained` or `NotRequired`, `false` before that and
 * whenever consent is required but not given. It is the one check the ads code needs - gate the
 * ads SDK's initialisation and every ad request on it - and it reflects the previous session's
 * consent as soon as the update is requested, before the callback.
 *
 * @param {Real} consent_ref The consent-info handle from ${function.firebase_ump_get_instance}.
 * @returns {Bool} `true` when ads may be requested, `false` otherwise (or when the handle is not valid).
 * @function_end
 */

/**
 * @function firebase_ump_reset
 * @desc **Firebase C++ SDK:** [firebase::ump::ConsentInfo::Reset](https://firebase.google.com/docs/reference/cpp/class/firebase/ump/consent-info#reset)
 *
 * This function clears the consent state the SDK has stored on the device, so that the next
 * ${function.firebase_ump_request_consent_info_update} treats the game as a fresh install and
 * shows the form again. It is for development - testing the flow without reinstalling - and
 * has no place in a shipped build.
 *
 * @param {Real} consent_ref The consent-info handle from ${function.firebase_ump_get_instance}.
 * @function_end
 */

/**
 * @function firebase_ump_request_consent_info_update
 * @desc **Firebase C++ SDK:** [firebase::ump::ConsentInfo::RequestConsentInfoUpdate](https://firebase.google.com/docs/reference/cpp/class/firebase/ump/consent-info#requestconsentinfoupdate)
 *
 * This function asks the User Messaging Platform whether this player has to be shown a consent
 * message and which one: it sends the device's region and the app's AdMob configuration to
 * Google and updates the three statuses (${function.firebase_ump_get_consent_status},
 * ${function.firebase_ump_get_consent_form_status},
 * ${function.firebase_ump_get_privacy_options_requirement_status}) and
 * ${function.firebase_ump_can_request_ads}. Call it at every launch, before anything else in
 * the module: the statuses start as the previous session's values as soon as the call is made,
 * so a game that already has consent from last time can request ads while the update is in
 * flight, and settle on the fresh values when the callback fires. The usual next call is
 * ${function.firebase_ump_load_and_show_consent_form_if_required}.
 *
 * The two debug parameters make a development build behave as if the device were in the
 * European Economic Area (or outside it): `debug_geography` applies only to devices whose ids
 * are in `debug_device_ids` - the SDK prints a device's id to the log the first time it runs with
 * debug settings - and to emulators and simulators, where it always applies. Ship with
 * `FirebaseUmpConsentDebugGeography.Disabled` and no ids. It returns `FirebaseError.InvalidHandle` without calling the callback when the handle is not
 * valid. It returns
 * `FirebaseError.InvalidArgument` when `debug_geography` is not a
 * ${constant.FirebaseUmpConsentDebugGeography} value.
 *
 * @param {Real} consent_ref The consent-info handle from ${function.firebase_ump_get_instance}.
 * @param {Enum.FirebaseUmpConsentDebugGeography} debug_geography The geography to simulate on the debug devices, or `FirebaseUmpConsentDebugGeography.Disabled`.
 * @param {Bool} tag_for_under_age_of_consent `true` when the player is known to be under the age of consent - the SDK then shows no consent form - `false` otherwise.
 * @param {Array[String]} [debug_device_ids] The ids of the devices the debug geography applies to, as the SDK logs them; omit it or pass `undefined` for none.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the statuses have been updated, or the request failed.
 * @member {Enum.FirebaseUmpConsentRequestError} error_code `FirebaseUmpConsentRequestError.Success` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @example
 * ```gml
 * consent = firebase_ump_get_instance();
 * firebase_ump_request_consent_info_update(consent, FirebaseUmpConsentDebugGeography.Disabled, false, undefined, function(_error, _message)
 * {
 *     if (_error != FirebaseUmpConsentRequestError.Success)
 *     {
 *         show_debug_message($"Consent info update failed ({_error}): {_message}");
 *         // Fall through: the previous session's consent, if any, still applies.
 *     }
 *     firebase_ump_load_and_show_consent_form_if_required(consent, 0, function(_error, _message)
 *     {
 *         if (firebase_ump_can_request_ads(consent))
 *         {
 *             start_ads();
 *         }
 *     });
 * });
 * ```
 * The above code is the whole flow for a launch: refresh the consent information, show the
 * form when the player has to see one, and start the ads only once the SDK says the game may
 * request them. An update that fails is not fatal - the statuses keep the previous session's
 * values, so a returning player who consented last time still gets ads.
 * @function_end
 */

/**
 * @function firebase_ump_load_consent_form
 * @desc **Firebase C++ SDK:** [firebase::ump::ConsentInfo::LoadConsentForm](https://firebase.google.com/docs/reference/cpp/class/firebase/ump/consent-info#loadconsentform)
 *
 * This function loads the consent form so that ${function.firebase_ump_show_consent_form} can
 * present it without a delay - the split lets a game load during a loading screen and show at
 * a moment of its choosing. It needs ${function.firebase_ump_get_consent_form_status} to be
 * `FirebaseUmpConsentFormStatus.Available`, which
 * ${function.firebase_ump_request_consent_info_update} establishes; otherwise the callback
 * fires with `FirebaseUmpConsentFormError.Unavailable`. A loaded form is shown once; load again to
 * show it again. It returns `FirebaseError.InvalidHandle` without calling the callback when the handle is not
 * valid.
 *
 * @param {Real} consent_ref The consent-info handle from ${function.firebase_ump_get_instance}.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the form has loaded, or could not be.
 * @member {Enum.FirebaseUmpConsentFormError} error_code `FirebaseUmpConsentFormError.Success` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_ump_show_consent_form
 * @desc **Firebase C++ SDK:** [firebase::ump::ConsentInfo::ShowConsentForm](https://firebase.google.com/docs/reference/cpp/class/firebase/ump/consent-info#showconsentform)
 *
 * This function presents the consent form ${function.firebase_ump_load_consent_form} loaded,
 * full screen, and fires the callback once the player has made their choice and the form has
 * gone; the statuses and ${function.firebase_ump_can_request_ads} are updated by then. Showing
 * without a loaded form fails with `FirebaseUmpConsentFormError.Unavailable` and showing a form a
 * second time with `AlreadyUsed`. Unlike
 * ${function.firebase_ump_load_and_show_consent_form_if_required} it shows the form whatever the
 * consent status - the way to let a player who has already consented see the form again is
 * ${function.firebase_ump_show_privacy_options_form}, not this. It returns `FirebaseError.InvalidHandle` without calling the callback when the handle is not
 * valid, and `FirebaseError.NotInitialized` when `form_parent` is `0` and there is no window to
 * show the form on yet (no Firebase App on Android, no root view controller on iOS).
 *
 * @param {Real} consent_ref The consent-info handle from ${function.firebase_ump_get_instance}.
 * @param {Real} form_parent `0` for the game's own window; see Form parents on the ${module.ump} page.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the form has been dismissed, or could not be shown.
 * @member {Enum.FirebaseUmpConsentFormError} error_code `FirebaseUmpConsentFormError.Success` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_ump_load_and_show_consent_form_if_required
 * @desc **Firebase C++ SDK:** [firebase::ump::ConsentInfo::LoadAndShowConsentFormIfRequired](https://firebase.google.com/docs/reference/cpp/class/firebase/ump/consent-info#loadandshowconsentformifrequired)
 *
 * This function shows the consent form when ${function.firebase_ump_get_consent_status} is
 * `FirebaseUmpConsentStatus.Required`, loading it first, and does nothing when it is not: the
 * callback fires with `FirebaseUmpConsentFormError.Success` once the player has made their choice and the form has gone, or at once
 * when no form was needed, and with a form code when the form could not be loaded or shown. The
 * statuses and ${function.firebase_ump_can_request_ads} are updated before the callback fires.
 * It is the call to make after ${function.firebase_ump_request_consent_info_update} completes;
 * ${function.firebase_ump_load_consent_form} and ${function.firebase_ump_show_consent_form} are
 * the same two steps taken separately. It returns `FirebaseError.InvalidHandle` without calling the callback when the handle is not
 * valid, and `FirebaseError.NotInitialized` when `form_parent` is `0` and there is no window to
 * show the form on yet (no Firebase App on Android, no root view controller on iOS).
 *
 * @param {Real} consent_ref The consent-info handle from ${function.firebase_ump_get_instance}.
 * @param {Real} form_parent `0` for the game's own window; see Form parents on the ${module.ump} page.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the form has been dismissed, was not required, or could not be shown.
 * @member {Enum.FirebaseUmpConsentFormError} error_code `FirebaseUmpConsentFormError.Success` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_ump_show_privacy_options_form
 * @desc **Firebase C++ SDK:** [firebase::ump::ConsentInfo::ShowPrivacyOptionsForm](https://firebase.google.com/docs/reference/cpp/class/firebase/ump/consent-info#showprivacyoptionsform)
 *
 * This function presents the privacy options form - the consent form again, for a player who
 * wants to change their answer - and fires the callback once they have dismissed it, with a form
 * code when no form could be presented. Call it only from the player's own action, the entry
 * point that ${function.firebase_ump_get_privacy_options_requirement_status} says the game must
 * offer; the SDK keeps the form preloaded once one is available, and loads one on demand
 * otherwise. Re-check ${function.firebase_ump_can_request_ads} when the callback fires: the
 * player may have withdrawn consent. It returns `FirebaseError.InvalidHandle` without calling the callback when the handle is not
 * valid, and `FirebaseError.NotInitialized` when `form_parent` is `0` and there is no window to
 * show the form on yet (no Firebase App on Android, no root view controller on iOS).
 *
 * @param {Real} consent_ref The consent-info handle from ${function.firebase_ump_get_instance}.
 * @param {Real} form_parent `0` for the game's own window; see Form parents on the ${module.ump} page.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the form has been dismissed, or could not be shown.
 * @member {Enum.FirebaseUmpConsentFormError} error_code `FirebaseUmpConsentFormError.Success` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @example
 * ```gml
 * // Options menu: the "Privacy settings" button, shown only when required
 * if (firebase_ump_get_privacy_options_requirement_status(consent) == FirebaseUmpPrivacyOptionsRequirementStatus.Required)
 * {
 *     firebase_ump_show_privacy_options_form(consent, 0, function(_error, _message)
 *     {
 *         ads_allowed = firebase_ump_can_request_ads(consent);
 *     });
 * }
 * ```
 * The above code opens the privacy options form from a button and refreshes the game's own
 * ads flag afterwards, since the player may have withdrawn the consent they gave earlier.
 * @function_end
 */

/**
 * @function firebase_ump_get_instance_for_app
 * @desc **Firebase C++ SDK:** [firebase::ump::ConsentInfo::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/ump/consent-info#getinstance)
 *
 * This function returns the consent-info handle through another Firebase App. The User
 * Messaging Platform SDK has a single consent-info object per process, so this is the same
 * handle ${function.firebase_ump_get_instance} returns whichever app is passed; it exists for
 * symmetry with the other modules.
 *
 * @param {Real} app An app handle.
 * @returns {Real} The consent-info handle, or `undefined` when the app handle is not valid or the SDK could not initialise.
 * @function_end
 */

/**
 * @const FirebaseUmpConsentStatus
 * @desc **Firebase C++ SDK:** [firebase::ump::ConsentStatus](https://firebase.google.com/docs/reference/cpp/namespace/firebase/ump#consentstatus)
 *
 * The player's consent status, from ${function.firebase_ump_get_consent_status}.
 *
 * @member Unknown Not known yet: before ${function.firebase_ump_request_consent_info_update}, or after it failed with nothing stored.
 * @member Required A consent form has to be shown and has not been answered.
 * @member NotRequired No consent is required for this player.
 * @member Obtained Consent was required and the player has answered.
 * @const_end
 */

/**
 * @const FirebaseUmpConsentFormStatus
 * @desc **Firebase C++ SDK:** [firebase::ump::ConsentFormStatus](https://firebase.google.com/docs/reference/cpp/namespace/firebase/ump#consentformstatus)
 *
 * Whether a consent form is available, from ${function.firebase_ump_get_consent_form_status}.
 *
 * @member Unknown Not known yet; ${function.firebase_ump_request_consent_info_update} updates it.
 * @member Unavailable There is no form to load for this player.
 * @member Available A form can be loaded with ${function.firebase_ump_load_consent_form}.
 * @const_end
 */

/**
 * @const FirebaseUmpPrivacyOptionsRequirementStatus
 * @desc **Firebase C++ SDK:** [firebase::ump::PrivacyOptionsRequirementStatus](https://firebase.google.com/docs/reference/cpp/namespace/firebase/ump#privacyoptionsrequirementstatus)
 *
 * Whether a privacy options entry point has to be offered, from
 * ${function.firebase_ump_get_privacy_options_requirement_status}.
 *
 * @member Unknown Not known yet; ${function.firebase_ump_request_consent_info_update} updates it.
 * @member NotRequired No entry point is needed.
 * @member Required The game must offer one that calls ${function.firebase_ump_show_privacy_options_form}.
 * @const_end
 */

/**
 * @const FirebaseUmpConsentDebugGeography
 * @desc **Firebase C++ SDK:** [firebase::ump::ConsentDebugGeography](https://firebase.google.com/docs/reference/cpp/namespace/firebase/ump#consentdebuggeography)
 *
 * The geography a development build simulates, for
 * ${function.firebase_ump_request_consent_info_update}.
 *
 * @member Disabled No simulation: the device's real region. The value to ship with.
 * @member EEA Debug devices appear to be in the European Economic Area, so a consent form is required.
 * @member NonEEA Debug devices appear to be outside the European Economic Area.
 * @const_end
 */

/**
 * @const FirebaseUmpConsentRequestError
 * @desc **Firebase C++ SDK:** [firebase::ump::ConsentRequestError](https://firebase.google.com/docs/reference/cpp/namespace/firebase/ump#consentrequesterror)
 *
 * The `error_code` of ${function.firebase_ump_request_consent_info_update}'s callback, mirroring
 * the SDK's codes value for value. `Success` is success.
 *
 * @member Success Success.
 * @member InvalidAppId The AdMob app id in the Android manifest or `Info.plist` is missing or wrong.
 * @member Network No connection.
 * @member Internal An error inside the SDK.
 * @member Misconfiguration The message setup in the AdMob console is not valid.
 * @member Unknown An error the SDK could not classify.
 * @member InvalidOperation The call was not valid at this point; try again.
 * @member OperationInProgress The previous update has not completed yet.
 * @const_end
 */

/**
 * @const FirebaseUmpConsentFormError
 * @desc **Firebase C++ SDK:** [firebase::ump::ConsentFormError](https://firebase.google.com/docs/reference/cpp/namespace/firebase/ump#consentformerror)
 *
 * The `error_code` of the four form functions' callbacks, mirroring the SDK's codes value for
 * value. `Success` is success.
 *
 * @member Success Success.
 * @member Timeout The form did not load in time; try again.
 * @member Internal An error inside the SDK.
 * @member Unknown An error the SDK could not classify.
 * @member Unavailable There is no form to show - not required, not loaded, or none configured.
 * @member AlreadyUsed The loaded form has been shown already; load it again.
 * @member InvalidOperation The call was not valid at this point (on iOS, a bad form parent).
 * @member OperationInProgress The previous form call has not completed yet.
 * @const_end
 */

/**
 * @module ump
 * @title User Messaging Platform
 * @desc This module covers the User Messaging Platform (UMP): Google's consent SDK for ads. Where a
 * regulation requires it - the GDPR in the European Economic Area, the UK and Switzerland, the US
 * state privacy laws - the SDK shows the player the consent message configured in the AdMob
 * console, records their choice in the standard form the Google Mobile Ads SDK reads, and tells
 * the game whether it may request ads. It is about consent for ads, not for Firebase's own data
 * collection: that is the `disableDataCollection` option and the per-product functions it points
 * at (see ${page.extension_options}).
 *
 * ### The flow
 *
 * Every launch: ${function.firebase_ump_request_consent_info_update}, then
 * ${function.firebase_ump_load_and_show_consent_form_if_required}, then start the ads when
 * ${function.firebase_ump_can_request_ads} says so. The previous session's consent applies as
 * soon as the update is requested, so a returning player is not held up by the round trip. When
 * ${function.firebase_ump_get_privacy_options_requirement_status} is `Required`, the game must
 * offer a way back into the form - a "Privacy settings" button that calls
 * ${function.firebase_ump_show_privacy_options_form} - and re-check
 * ${function.firebase_ump_can_request_ads} afterwards. The consent the SDK stores is read by the
 * Google Mobile Ads SDK on the device, whichever extension makes the ad requests.
 *
 * ### Form parents
 *
 * The three form functions take a `form_parent`. Pass `0`: the extension supplies the game's own
 * window - the activity the Firebase App was created with on Android, the runner's root view
 * controller on iOS - which is the only window a GameMaker game has. A non-zero value is a
 * platform handle (an Android `Activity`, an iOS `UIViewController`) for a game that bridges
 * one of its own, and is passed through untouched.
 *
 * ### Platforms
 *
 * Android and iOS have the real SDK; the extension links `user-messaging-platform` 4.0.0 and the
 * `GoogleUserMessagingPlatform` 2.3.0 pod. Windows, macOS and Linux have a stub that walks the
 * flow without a network or a form, for a game to test its own logic: the update completes at
 * once with consent `Obtained` (`Required` with the `EEA` debug geography, `NotRequired` with
 * `NonEEA`, whatever the device ids), a form is `Available` only when consent is `Required` and
 * the player is not tagged as under age, showing a form sets `Obtained` and, under `EEA`, makes
 * the privacy options `Required`, and the privacy options form sets consent back to `Required`.
 * Every callback fires at once.
 *
 * ### Error codes
 *
 * The callbacks' `error_code` is one of two enums, both `Success` on success:
 * ${constant.FirebaseUmpConsentRequestError} for ${function.firebase_ump_request_consent_info_update}
 * and ${constant.FirebaseUmpConsentFormError} for the four form functions.
 *
 * On Android the SDK reports a single "invalid operation" code, and the C++ layer tells the request
 * errors `InvalidAppId`, `Misconfiguration` and `InvalidOperation`, and the form errors
 * `Unavailable`, `AlreadyUsed` and `InvalidOperation`, apart by the message text - an unexpected
 * wording lands on `InvalidOperation`.
 *
 * ### Console and project setup
 *
 * Consent messages are created and published in the AdMob console under **Privacy & messaging**,
 * per app, and the app has to carry its AdMob app id: `com.google.android.gms.ads.APPLICATION_ID`
 * in the Android manifest and `GADApplicationIdentifier` in `Info.plist`. This extension does
 * not inject either - the AdMob extension does, from its Android App ID and iOS App ID options -
 * so a game that shows ads through anything else adds them itself; without them the update
 * fails with `FirebaseUmpConsentRequestError.InvalidAppId`.
 *
 * @section_func Instance
 * @desc The consent-info handle the other functions take:
 * @ref firebase_ump_get_instance
 * @ref firebase_ump_get_instance_for_app
 * @section_end
 *
 * @section_func Consent flow
 * @desc Refreshing the consent information, showing the form and checking whether ads may be requested:
 * @ref firebase_ump_request_consent_info_update
 * @ref firebase_ump_load_and_show_consent_form_if_required
 * @ref firebase_ump_load_consent_form
 * @ref firebase_ump_show_consent_form
 * @ref firebase_ump_can_request_ads
 * @section_end
 *
 * @section_func Status
 * @desc The three statuses the update maintains:
 * @ref firebase_ump_get_consent_status
 * @ref firebase_ump_get_consent_form_status
 * @ref firebase_ump_get_privacy_options_requirement_status
 * @section_end
 *
 * @section_func Privacy options
 * @desc Letting the player revisit their choice:
 * @ref firebase_ump_show_privacy_options_form
 * @section_end
 *
 * @section_func Development
 * @desc Testing the flow:
 * @ref firebase_ump_reset
 * @section_end
 *
 * @section_const Constants
 * @desc The following constants are used by this module:
 * @ref FirebaseUmpConsentStatus
 * @ref FirebaseUmpConsentFormStatus
 * @ref FirebaseUmpPrivacyOptionsRequirementStatus
 * @ref FirebaseUmpConsentDebugGeography
 * @ref FirebaseUmpConsentRequestError
 * @ref FirebaseUmpConsentFormError
 * @section_end
 *
 * @module_end
 */
