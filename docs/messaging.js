/**
 * @function firebase_messaging_initialize
 * @desc **Firebase C++ SDK:** [firebase::messaging::Initialize](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#initialize)
 *
 * This function starts Cloud Messaging for the default Firebase App and must be called once, after
 * ${function.firebase_app_initialize} and before any other function of this module. The SDK aborts
 * the game when a messaging call reaches it uninitialised, so every function here that would reach
 * it refuses first with `FirebaseError.NotInitialized`. From this call on the SDK can deliver
 * messages and registration events at any time, each to the callback set for it with
 * ${function.firebase_messaging_set_message_callback}, ${function.firebase_messaging_set_registration_callback}
 * and ${function.firebase_messaging_set_unregistration_callback} - before or after this call, since
 * anything delivered while a callback is not yet set is held for it.
 *
 * On iOS this call shows the system's notification permission prompt at once and registers the
 * device with APNs; ${function.firebase_messaging_initialize_with_options} holds the prompt back for
 * a ${function.firebase_messaging_request_permission} of the game's choosing. On Android the
 * notification permission is the game's to request with `os_request_permission` (the extension
 * declares `android.permission.POST_NOTIFICATIONS`), and the call returns `false` when Google Play
 * services are missing on the device, with ${function.firebase_last_error_message} naming the
 * missing dependency. A second call does nothing and returns `true`.
 *
 * @returns {Bool} `true` when Cloud Messaging is initialised after the call, `false` when the default app does not exist or Google Play services are missing on Android - ${function.firebase_last_error_code} is then `FirebaseError.NotInitialized`.
 *
 * @example
 * ```gml
 * // Create Event of a persistent controller, after firebase_app_initialize()
 * firebase_messaging_set_message_callback(function(_message)
 * {
 *     show_debug_message($"Message {_message.message_id} from {_message.from}");
 * });
 *
 * if (!firebase_messaging_initialize())
 * {
 *     show_debug_message($"Messaging unavailable: {firebase_last_error_message()}");
 *     exit;
 * }
 *
 * if (os_type == os_android)
 * {
 *     var _permission = "android.permission.POST_NOTIFICATIONS";
 *     if (os_check_permission(_permission) != os_permission_granted)
 *     {
 *         os_request_permission(_permission);
 *     }
 * }
 * ```
 * The above code sets the message callback, initialises Cloud Messaging and, on Android, asks for
 * the notification permission the way the platform wants it; the answer arrives in the Async System event as a
 * `"permission_request_result"`. On iOS the initialisation itself has shown the system prompt, so
 * nothing more is needed there.
 * @function_end
 */

/**
 * @function firebase_messaging_terminate
 * @desc **Firebase C++ SDK:** [firebase::messaging::Terminate](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#terminate)
 *
 * This function shuts Cloud Messaging down: the SDK stops delivering to the game, the three callbacks
 * are cleared along with anything held for them, every binary payload handle still out is freed, and
 * the module is back to its uninitialised state. On Android the platform's messaging service keeps
 * running underneath. The module can be initialised again afterwards, with the callbacks set again.
 * There is no need to call it when the game exits.
 *
 * @function_end
 */

/**
 * @function firebase_messaging_set_registration_on_init_enabled
 * @desc **Firebase C++ SDK:** [firebase::messaging::SetRegistrationOnInitEnabled](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#setregistrationoninitenabled)
 *
 * This function turns automatic registration at initialisation on or off. On - the default -
 * ${function.firebase_messaging_initialize} registers the installation and creates its Firebase
 * Installation ID by itself, which sends a new identity to Firebase before the player has agreed to
 * anything. A game that needs consent first ships with the `disableDataCollection` extension option
 * (see ${page.extension_options}), which puts the platform's opt-out into the Android manifest and
 * the iOS `Info.plist` so that the first launch does not register, and calls this function with `true`
 * once the player has agreed; turning it on triggers the registration at once. The setting is
 * stored on the device and overrides the manifest and plist keys from then on, so the call is
 * needed once. Turning it off at runtime does not undo a registration that already happened at
 * this launch - only the option prevents the first one - and holds from the next launch. It can be
 * called before ${function.firebase_messaging_initialize}. The desktop stub ignores it.
 *
 * @param {Bool} enabled `true` to register at initialisation, `false` not to.
 * @function_end
 */

/**
 * @function firebase_messaging_is_registration_on_init_enabled
 * @desc **Firebase C++ SDK:** [firebase::messaging::IsRegistrationOnInitEnabled](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#isregistrationoninitenabled)
 *
 * This function returns whether the SDK registers the installation at initialisation - the stored
 * setting of ${function.firebase_messaging_set_registration_on_init_enabled}, or failing that the
 * manifest or plist key, or failing that the default of on. The desktop stub always returns `true`.
 *
 * @returns {Bool} `true` when registration on init is enabled, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_messaging_set_token_registration_on_init_enabled
 * @desc [[Important: This function has been superseded by ${function.firebase_messaging_set_registration_on_init_enabled}, which sets the same SDK state under its current name; the SDK has deprecated the
 * token API, and we recommend that you only use this function for legacy support.]]
 *
 * **Firebase C++ SDK:** [firebase::messaging::SetTokenRegistrationOnInitEnabled](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#settokenregistrationoninitenabled)
 *
 * This function is ${function.firebase_messaging_set_registration_on_init_enabled} under the
 * setting's old name; both write the same stored setting.
 *
 * @param {Bool} enabled `true` to register at initialisation, `false` not to.
 * @function_end
 */

/**
 * @function firebase_messaging_is_token_registration_on_init_enabled
 * @desc [[Important: This function has been superseded by ${function.firebase_messaging_is_registration_on_init_enabled}, which reads the same SDK state under its current name; the SDK has deprecated the
 * token API, and we recommend that you only use this function for legacy support.]]
 *
 * **Firebase C++ SDK:** [firebase::messaging::IsTokenRegistrationOnInitEnabled](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#istokenregistrationoninitenabled)
 *
 * This function is ${function.firebase_messaging_is_registration_on_init_enabled} under the
 * setting's old name; both read the same stored setting.
 *
 * @returns {Bool} `true` when registration on init is enabled, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_messaging_delivery_metrics_export_to_big_query_enabled
 * @desc **Firebase C++ SDK:** [firebase::messaging::DeliveryMetricsExportToBigQueryEnabled](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#deliverymetricsexporttobigqueryenabled)
 *
 * This function returns whether delivery data is exported to BigQuery, on Android. It returns `false`
 * on every other platform.
 *
 * @returns {Bool} `true` when the export is on, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_messaging_set_delivery_metrics_export_to_big_query
 * @desc **Firebase C++ SDK:** [firebase::messaging::SetDeliveryMetricsExportToBigQuery](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#setdeliverymetricsexporttobigquery)
 *
 * This function turns the export of message delivery data to BigQuery on or off, on Android: with
 * it on, each message's delivery events are written to the BigQuery dataset the project links in
 * the console (Project settings > Integrations), for analysis of what was sent, delivered and
 * opened. It is off by default; the manifest key `delivery_metrics_exported_to_big_query_enabled`
 * also turns it on, and this call overrides the key. The function does nothing on other
 * platforms.
 *
 * @param {Bool} enabled `true` to export delivery metrics, `false` not to.
 * @function_end
 */

/**
 * @function firebase_messaging_request_permission
 * @desc **Firebase C++ SDK:** [firebase::messaging::RequestPermission](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#requestpermission)
 *
 * This function asks the player for permission to show notifications, on iOS: the system prompt
 * appears, unless it was answered before, and the device registers with APNs. The callback fires
 * when that registration has completed or failed with
 * `FirebaseMessagingError.FailedToRegisterForRemoteNotifications` - not when the prompt is answered,
 * so a player who declines still gets a successful
 * callback and simply sees no notifications. ${function.firebase_messaging_initialize} already
 * does all of this on iOS unless the prompt was held back with
 * ${function.firebase_messaging_initialize_with_options}.
 *
 * On Android the call does nothing and the callback fires at once with `FirebaseMessagingError.None`; the notification
 * permission is requested with `os_request_permission("android.permission.POST_NOTIFICATIONS")`
 * and its answer arrives in the Async System event. On Windows, macOS and Linux the callback also
 * fires at once with `FirebaseMessagingError.None`.
 *
 * The function returns `FirebaseError.NotInitialized` without calling the callback when
 * ${function.firebase_messaging_initialize} has not run.
 *
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the device has registered for notifications, or could not.
 * @member {Enum.FirebaseMessagingError} error_code `FirebaseMessagingError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_messaging_register
 * @desc **Firebase C++ SDK:** [firebase::messaging::Register](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#register)
 *
 * This function registers this installation of the game with the Cloud Messaging backend so that
 * messages can reach it: it creates the Firebase Installation ID if there is none yet and sends the
 * app and device details to Firebase. The id itself does not come to this callback; the SDK delivers
 * it to the one set with ${function.firebase_messaging_set_registration_callback}, and does so even
 * when the game was already registered. With registration on init enabled - the default - the SDK registers on its own at
 * ${function.firebase_messaging_initialize}, and this call is for a game that shipped with the
 * `disableDataCollection` option and registers once the player has consented. On Windows, macOS
 * and Linux the callback fires at once with `FirebaseMessagingError.None` and the id delivered is the stub's
 * `"StubRegistrationId"`.
 *
 * The function returns `FirebaseError.NotInitialized` without calling the callback when
 * ${function.firebase_messaging_initialize} has not run.
 *
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the registration has completed or failed.
 * @member {Enum.FirebaseMessagingError} error_code `FirebaseMessagingError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @example
 * ```gml
 * // The consent screen's "Allow notifications" button
 * firebase_messaging_set_registration_on_init_enabled(true);
 * var _result = firebase_messaging_register(function(_error, _message)
 * {
 *     if (_error != FirebaseMessagingError.None) show_debug_message($"Registration failed ({_error}): {_message}");
 * });
 *
 * // Create Event of the persistent controller
 * firebase_messaging_set_registration_callback(function(_installation_id)
 * {
 *     show_debug_message($"Registered as {_installation_id}");
 * });
 * ```
 * The above code is the consent flow for a game built with `disableDataCollection`: the setting
 * is turned on so that later launches register by themselves, this launch registers explicitly, and
 * the installation id arrives through the registration callback rather than the one passed here.
 * @function_end
 */

/**
 * @function firebase_messaging_unregister
 * @desc **Firebase C++ SDK:** [firebase::messaging::Unregister](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#unregister)
 *
 * This function unregisters this installation from the Cloud Messaging backend, so that no more
 * messages reach it; the id it was registered under arrives through the callback set with
 * ${function.firebase_messaging_set_unregistration_callback}. The Firebase Installation ID itself stays on
 * the device - ${function.firebase_installations_delete} removes it. On Windows, macOS and Linux
 * the callback fires at once with `FirebaseMessagingError.None`.
 *
 * The function returns `FirebaseError.NotInitialized` without calling the callback when
 * ${function.firebase_messaging_initialize} has not run.
 *
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the unregistration has completed or failed.
 * @member {Enum.FirebaseMessagingError} error_code `FirebaseMessagingError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_messaging_get_token
 * @desc [[Important: This function has been superseded by ${function.firebase_messaging_register}, which registers the installation and delivers its Firebase Installation ID to the callback set with ${function.firebase_messaging_set_registration_callback}; the SDK has deprecated the
 * token API, and we recommend that you only use this function for legacy support.]]
 *
 * **Firebase C++ SDK:** [firebase::messaging::GetToken](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#gettoken)
 *
 * This function creates the installation's Firebase Installation ID if there is none, sends the app
 * and device details to Firebase, and hands the callback the registration token: the string that
 * the console's test-message dialog and the older server APIs address a single device by. On Windows, macOS and Linux the callback fires at once with `FirebaseMessagingError.None` and the stub's
 * `"StubToken"`.
 *
 * The function returns `FirebaseError.NotInitialized` without calling the callback when
 * ${function.firebase_messaging_initialize} has not run.
 *
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the registration token.
 * @member {Enum.FirebaseMessagingError} error_code `FirebaseMessagingError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {String} token The registration token, or an empty string on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_messaging_delete_token
 * @desc [[Important: This function has been superseded by ${function.firebase_messaging_unregister}, which unregisters the installation and delivers its id to the callback set with ${function.firebase_messaging_set_unregistration_callback}; the SDK has deprecated the
 * token API, and we recommend that you only use this function for legacy support.]]
 *
 * **Firebase C++ SDK:** [firebase::messaging::DeleteToken](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#deletetoken)
 *
 * This function deletes the installation's registration token, so that no more messages reach this
 * device until a new one is generated. The Firebase Installation ID stays on the device;
 * ${function.firebase_installations_delete} removes it. On Windows, macOS and Linux the callback
 * fires at once with `FirebaseMessagingError.None`.
 *
 * The function returns `FirebaseError.NotInitialized` without calling the callback when
 * ${function.firebase_messaging_initialize} has not run.
 *
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the token has been deleted or the deletion failed.
 * @member {Enum.FirebaseMessagingError} error_code `FirebaseMessagingError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_messaging_subscribe
 * @desc **Firebase C++ SDK:** [firebase::messaging::Subscribe](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#subscribe)
 *
 * This function subscribes this installation to a topic, so that every message a server sends to
 * the topic reaches it: the way to address every player, or every player of a region, a language
 * or a guild, without keeping a list of devices. A topic name is 1 to 900 characters from `a-z`, `A-Z`, `0-9`, `-`, `_`, `.`, `~` and
 * `%`; anything else fails with `FirebaseMessagingError.InvalidTopicName`. The subscription needs the
 * installation to be registered: made before the registration at initialisation has completed, it
 * waits for it; with registration on init disabled and no ${function.firebase_messaging_register}
 * done, it fails with `FirebaseMessagingError.NoRegistrationToken`. A subscription is kept by the
 * backend across launches until ${function.firebase_messaging_unsubscribe}. On Windows, macOS and
 * Linux the callback fires at once with `FirebaseMessagingError.None`.
 *
 * The function returns `FirebaseError.NotInitialized` without calling the callback when
 * ${function.firebase_messaging_initialize} has not run.
 *
 * @param {String} topic The topic name, without a `/topics/` prefix.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the subscription has been made or failed.
 * @member {Enum.FirebaseMessagingError} error_code `FirebaseMessagingError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @example
 * ```gml
 * // After the player picks a language and a region
 * firebase_messaging_subscribe($"news-{language}", function(_error, _message)
 * {
 *     if (_error != FirebaseMessagingError.None) show_debug_message($"Subscribe failed ({_error}): {_message}");
 * });
 * firebase_messaging_subscribe($"events-{region}", undefined);
 * ```
 * The above code puts the installation on two topics, so that a message sent from the console or a
 * server to `news-en` or `events-eu` reaches every player who chose them. The second call passes no
 * callback because nothing depends on its outcome.
 * @function_end
 */

/**
 * @function firebase_messaging_unsubscribe
 * @desc **Firebase C++ SDK:** [firebase::messaging::Unsubscribe](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#unsubscribe)
 *
 * This function removes this installation from a topic, so that messages sent to it no longer
 * arrive. A topic name is 1 to 900 characters from `a-z`, `A-Z`, `0-9`, `-`, `_`, `.`, `~` and
 * `%`; anything else fails with `FirebaseMessagingError.InvalidTopicName`. On Windows, macOS and Linux the callback fires at once with `FirebaseMessagingError.None`.
 *
 * The function returns `FirebaseError.NotInitialized` without calling the callback when
 * ${function.firebase_messaging_initialize} has not run.
 *
 * @param {String} topic The topic name, without a `/topics/` prefix.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the subscription has been removed or the removal failed.
 * @member {Enum.FirebaseMessagingError} error_code `FirebaseMessagingError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_messaging_set_message_callback
 * @desc **Firebase C++ SDK:** [firebase::messaging::Listener::OnMessage](https://firebase.google.com/docs/reference/cpp/class/firebase/messaging/listener#onmessage)
 *
 * This function sets the callback the SDK delivers every message to, as a ${struct.FirebaseMessagingMessage}.
 * It can be called before or after ${function.firebase_messaging_initialize}: messages that arrive
 * while no message callback is set are held in the order they came - up to 256, after which the
 * oldest is dropped with a warning in the debug log - and delivered one by one the moment a callback
 * is set. Passing `undefined` clears the callback, after which messages are held again. A message
 * with a notification the player tapped while the game was in the background arrives with
 * `notification_opened` set.
 *
 * @param {Function} [callback] The function to call with each message, or `undefined` to clear it.
 *
 * @event callback
 * @desc Fires once per message the SDK delivers.
 * @member {Struct.FirebaseMessagingMessage} message The message.
 * @event_end
 *
 * @example
 * ```gml
 * // Create Event of the persistent controller, before firebase_messaging_initialize()
 * firebase_messaging_set_message_callback(function(_message)
 * {
 *     switch (_message.data[$ "kind"])
 *     {
 *         case "gift":
 *             inventory_add(_message.data[$ "item"], real(_message.data[$ "amount"]));
 *             break;
 *         case "event":
 *             if (_message.notification_opened)
 *             {
 *                 room_goto(rm_event);
 *             }
 *             break;
 *     }
 * });
 * ```
 * The above code acts on the `kind` key the server put in each message's data. A message with a
 * notification that the player tapped while the game was in the background arrives here with
 * `notification_opened` set, which the code uses to take the player straight to the event.
 * @function_end
 */

/**
 * @function firebase_messaging_set_registration_callback
 * @desc **Firebase C++ SDK:** [firebase::messaging::Listener::OnRegistrationReceived](https://firebase.google.com/docs/reference/cpp/class/firebase/messaging/listener#onregistrationreceived)
 *
 * This function sets the callback that receives the Firebase Installation ID once a registration
 * has completed - after ${function.firebase_messaging_register}, or at initialisation when
 * registration on init is enabled - the identifier of this installation of the game, which a server
 * uses to send a message to this device alone. It can be called before or after
 * ${function.firebase_messaging_initialize}; an id that arrived while no callback was set is
 * delivered as soon as one is, the latest only. Passing `undefined` clears the callback. On Windows,
 * macOS and Linux the id delivered is the stub's `"StubRegistrationId"`.
 *
 * @param {Function} [callback] The function to call with the installation id, or `undefined` to clear it.
 *
 * @event callback
 * @desc Fires once per completed registration.
 * @member {String} installation_id The Firebase Installation ID this installation is registered under.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_messaging_set_unregistration_callback
 * @desc **Firebase C++ SDK:** [firebase::messaging::Listener::OnUnregistrationReceived](https://firebase.google.com/docs/reference/cpp/class/firebase/messaging/listener#onunregistrationreceived)
 *
 * This function sets the callback that receives the id an ${function.firebase_messaging_unregister}
 * unregistered. It can be called before or after ${function.firebase_messaging_initialize}; an id
 * that arrived while no callback was set is delivered as soon as one is, the latest only. Passing
 * `undefined` clears the callback.
 *
 * @param {Function} [callback] The function to call with the installation id, or `undefined` to clear it.
 *
 * @event callback
 * @desc Fires once per completed unregistration.
 * @member {String} installation_id The Firebase Installation ID that was unregistered.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_messaging_raw_data_copy
 * @desc **Firebase C++ SDK:** [firebase::messaging::Message::raw_data](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/message#raw_data)
 *
 * This function copies the bytes a message's binary payload handle holds into the start of a
 * GameMaker buffer, up to the buffer's size, and returns how many were copied. The
 * ${struct.FirebaseMessagingMessage} gives the handle in `raw_data` and the size to create the buffer
 * with in `raw_data_size`; the handle keeps the bytes until ${function.firebase_messaging_raw_data_release}
 * frees it, so it can be copied from more than once. Messages sent through the console or the HTTP
 * API carry no binary payload, so `raw_data` is `undefined` in practice.
 *
 * @param {Real} raw_data_ref The `raw_data` handle of a ${struct.FirebaseMessagingMessage}.
 * @param {Buffer} out_buffer The buffer to write into.
 * @returns {Real} The number of bytes copied, or `0` with ${function.firebase_last_error_code} set to `FirebaseError.InvalidHandle` when the handle is not a live payload.
 *
 * @example
 * ```gml
 * firebase_messaging_set_message_callback(function(_message)
 * {
 *     if (is_undefined(_message.raw_data)) exit;
 *
 *     var _buffer = buffer_create(_message.raw_data_size, buffer_fixed, 1);
 *     firebase_messaging_raw_data_copy(_message.raw_data, _buffer);
 *     firebase_messaging_raw_data_release(_message.raw_data);
 *
 *     // ... read the payload out of _buffer ...
 *     buffer_delete(_buffer);
 * });
 * ```
 * The above code copies a message's binary payload into a buffer sized from the message and releases
 * the handle as soon as the copy is done.
 * @function_end
 */

/**
 * @function firebase_messaging_raw_data_release
 * @desc This function frees the bytes a message's binary payload handle holds. Call it once the bytes
 * have been copied out; the memory stays allocated until then, or until
 * ${function.firebase_messaging_terminate}. A handle that is not a payload sets
 * ${function.firebase_last_error_code} to `FirebaseError.InvalidHandle`.
 *
 * @param {Real} raw_data_ref The handle to release.
 * @function_end
 */

/**
 * @function firebase_messaging_initialize_with_options
 * @desc **Firebase C++ SDK:** [firebase::messaging::Initialize](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#initialize_1)
 *
 * This function is ${function.firebase_messaging_initialize} with the one option the SDK has: on iOS,
 * `suppress_notification_permission_prompt` set to `true` keeps the system permission prompt from
 * appearing at initialisation, so that the game can explain why it wants to notify the player and
 * call ${function.firebase_messaging_request_permission} at the right moment. A prompt the player
 * has already answered is not shown again either way. The option does nothing on Android.
 *
 * @param {Bool} suppress_notification_permission_prompt `true` to hold the iOS permission prompt back until ${function.firebase_messaging_request_permission}, `false` to show it now.
 * @returns {Bool} `true` when Cloud Messaging is initialised after the call, `false` when the default app does not exist or Google Play services are missing on Android - ${function.firebase_last_error_code} is then `FirebaseError.NotInitialized`.
 * @function_end
 */

/**
 * @function firebase_messaging_initialize_for_app
 * @desc **Firebase C++ SDK:** [firebase::messaging::Initialize](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#initialize)
 *
 * This function is ${function.firebase_messaging_initialize} for another Firebase App, created with
 * ${function.firebase_app_initialize_with_options} or ${function.firebase_app_initialize_from_json}.
 * Cloud Messaging is initialised once per game, for one app: once any of the initialise functions
 * has succeeded, the others do nothing and return `true`.
 *
 * @param {Real} app An app handle.
 * @returns {Bool} `true` when Cloud Messaging is initialised after the call, `false` when the app handle is not valid (`FirebaseError.InvalidHandle`) or Google Play services are missing on Android (`FirebaseError.NotInitialized`).
 * @function_end
 */

/**
 * @function firebase_messaging_initialize_for_app_with_options
 * @desc **Firebase C++ SDK:** [firebase::messaging::Initialize](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#initialize_1)
 *
 * This function is ${function.firebase_messaging_initialize_with_options} for another Firebase App.
 *
 * @param {Real} app An app handle.
 * @param {Bool} suppress_notification_permission_prompt `true` to hold the iOS permission prompt back until ${function.firebase_messaging_request_permission}, `false` to show it now.
 * @returns {Bool} `true` when Cloud Messaging is initialised after the call, `false` when the app handle is not valid (`FirebaseError.InvalidHandle`) or Google Play services are missing on Android (`FirebaseError.NotInitialized`).
 * @function_end
 */

/**
 * @struct FirebaseMessagingAndroidNotificationParams
 * @desc **Firebase C++ SDK:** [firebase::messaging::AndroidNotificationParams](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/android-notification-params)
 *
 * The part of a ${struct.FirebaseMessagingNotification} that only Android fills.
 *
 * @member {String} channel_id The Android notification channel the sender addressed; the channel decides the importance, sound and vibration the system gives the notification.
 * @struct_end
 */

/**
 * @struct FirebaseMessagingNotification
 * @desc **Firebase C++ SDK:** [firebase::messaging::Notification](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/notification)
 *
 * The notification part of a ${struct.FirebaseMessagingMessage}: the title, body and presentation
 * fields the operating system shows in its tray. Which fields are filled depends on what the sender
 * set and on the platform - the icon, tag and colour are Android's, the badge is iOS's.
 *
 * @member {String} title The notification's title.
 * @member {String} body The notification's body text.
 * @member {String} icon The name of the drawable resource the sender chose as the notification's icon, on Android.
 * @member {String} sound The sound the sender chose: `"default"`, or the name of a sound file bundled with the game.
 * @member {String} badge The badge count the sender set for the app icon, on iOS.
 * @member {String} tag The notification's tag, on Android: notifications with the same tag replace each other in the tray instead of stacking.
 * @member {String} color The icon colour the sender set, as `#rrggbb`, on Android.
 * @member {String} click_action What a tap on the notification does: the intent action on Android, the APNs category on iOS.
 * @member {String} body_loc_key The key of the body text in the game's string resources (`loc-key` on iOS), for a notification the sender localised on the device rather than in the message.
 * @member {Array[String]} body_loc_args The format arguments to substitute into the localised body, in order; an empty array when there are none.
 * @member {String} title_loc_key The key of the title in the game's string resources (`title-loc-key` on iOS), for a notification the sender localised on the device.
 * @member {Array[String]} title_loc_args The format arguments to substitute into the localised title, in order; an empty array when there are none.
 * @member {Struct.FirebaseMessagingAndroidNotificationParams} [android] The Android-only parameters, or `undefined` on other platforms and when the sender set none.
 * @struct_end
 */

/**
 * @struct FirebaseMessagingMessage
 * @desc **Firebase C++ SDK:** [firebase::messaging::Message](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/message)
 *
 * A message as the SDK delivers it to the callback set with ${function.firebase_messaging_set_message_callback}.
 * `data` is the sender's key/value strings as a struct with the sender's own keys, so check for a
 * key before reading it; `notification` is the part the system shows, `undefined` for a data-only
 * message; `raw_data` is `undefined` unless the message carries a binary payload, and is then a
 * handle for ${function.firebase_messaging_raw_data_copy} with `raw_data_size` bytes behind it,
 * which the game releases with ${function.firebase_messaging_raw_data_release}. `original_priority`
 * and `sent_time` are filled on Android only.
 *
 * @member {String} from The sender's authenticated id: the project's sender ID for a message sent to this device, or `/topics/<name>` for a message sent to a topic.
 * @member {String} to The recipient as the sender addressed it - a token, a topic or a project id - often empty on a message sent from the console.
 * @member {String} collapse_key The collapse key, when the sender set one: while the device is offline, messages that share a key are collapsed so that only the latest is delivered when it comes back. An empty string otherwise.
 * @member {Any} data A struct with the key/value strings the sender attached, under the sender's own keys; every value is a string as the sender typed it.
 * @member {Real} [raw_data] A handle to the binary payload for ${function.firebase_messaging_raw_data_copy}, or `undefined` when the message carries none - which is the case for every message sent through the console or the HTTP API.
 * @member {Real} raw_data_size The binary payload's size in bytes, `0` when there is none.
 * @member {String} message_id The message's id, set by the sender or by Firebase.
 * @member {String} message_type An empty string for an ordinary message; `"deleted_messages"` when the backend dropped queued messages because too many - a hundred - piled up while the device was offline, in which case the game should ask its own server what it missed; `"send_event"` and `"send_error"` concern upstream messages, which this extension does not send.
 * @member {String} priority The priority the message was delivered with: `"high"`, which can wake the device and reaches the game at once, or `"normal"`, which saves battery and may be delayed.
 * @member {Real} time_to_live How long, in seconds, the sender allowed the message to wait for the device while it was offline before being dropped - up to four weeks, which is the default.
 * @member {String} error The error code of a `send_error` message about an upstream message, which this extension never sends, so it reads as an empty string.
 * @member {String} error_description The description that goes with `error`, empty for the same reason.
 * @member {Struct.FirebaseMessagingNotification} [notification] The notification part - what the system showed, or would have shown, the player - or `undefined` for a data-only message.
 * @member {Bool} notification_opened `true` when the message reached the game because the player tapped its notification in the system tray, `false` for a message delivered while the game was in the foreground.
 * @member {String} link The link into the game the message carried, when the sender attached one; an empty string otherwise.
 * @member {String} original_priority The priority the sender asked for, which differs from `priority` when the platform lowered it - Android does so for an app whose high-priority messages did not produce notifications the player saw. Android only; an empty string on iOS.
 * @member {Real} sent_time When the message was sent, as milliseconds since the Unix epoch, to tell a message that waited out an offline stretch from a fresh one. Android only; `0` on iOS.
 * @struct_end
 */

/**
 * @const FirebaseMessagingError
 * @desc **Firebase C++ SDK:** [firebase::messaging::Error](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#error)
 *
 * The `error_code` every Cloud Messaging callback receives, mirroring the SDK's codes value for
 * value. `None` is success; the other four each belong to one call.
 *
 * @member None Success.
 * @member FailedToRegisterForRemoteNotifications The iOS device could not register with APNs - permission to receive notifications was not granted.
 * @member InvalidTopicName The topic name has characters outside `a-z`, `A-Z`, `0-9`, `-`, `_`, `.`, `~`, `%`, or is longer than 900.
 * @member NoRegistrationToken A topic call was made with registration disabled and no registration done.
 * @member Unknown An error the SDK could not classify.
 * @const_end
 */

/**
 * @module messaging
 * @title Cloud Messaging
 * @desc This module covers Firebase Cloud Messaging: push messages from a server or the Firebase console
 * to the devices a game is installed on - a notification the operating system shows while the game
 * is closed, a data payload the game acts on, or both - addressed to one installation, to a topic
 * every interested installation subscribes to, or to an audience the console picks. Everything
 * starts with ${function.firebase_messaging_initialize}, after ${function.firebase_app_initialize}.
 *
 * ### Platforms
 *
 * Cloud Messaging works on Android and iOS. On Windows, macOS and Linux the SDK ships a stub, and
 * the extension keeps it callable so that the same game code runs everywhere: initialisation
 * succeeds, every callback fires at once with `FirebaseMessagingError.None` and the message `"Successfully completed as a
 * stub."`, ${function.firebase_messaging_register} delivers the id `"StubRegistrationId"` and
 * ${function.firebase_messaging_get_token} the token `"StubToken"`, the settings read as their
 * defaults, and no message ever arrives.
 *
 * ### Receiving
 *
 * The SDK delivers each event to a callback the game sets: every message to the one set with
 * ${function.firebase_messaging_set_message_callback}, as a ${struct.FirebaseMessagingMessage}, and
 * each completed registration and unregistration to ${function.firebase_messaging_set_registration_callback}
 * and ${function.firebase_messaging_set_unregistration_callback} with the Firebase Installation ID.
 * The callbacks can be set before or after initialisation: whatever arrives while one is not set is
 * held for it - messages in order, up to 256, and the latest id - and delivered the moment it is.
 *
 * A message has a data part - key/value strings the sender attached - and, optionally, a
 * notification part the system shows. While the game is in the foreground every message reaches the
 * callback and nothing is shown. While it is in the background or closed, a message with a
 * notification is shown by the system and reaches the game when the player taps it, with
 * `notification_opened` set; a data-only message reaches the game on the platform's terms - at once
 * on Android when its priority is high, otherwise when the platform next lets the game run.
 *
 * ### Registration and consent
 *
 * An installation of the game is known to Firebase by its Firebase Installation ID, created and
 * registered with the backend at the first ${function.firebase_messaging_initialize} unless
 * registration on init is off. That registration is data collection under the privacy laws that
 * need consent first; the `disableDataCollection` extension option (see ${page.extension_options})
 * ships the game with it off, and ${function.firebase_messaging_set_registration_on_init_enabled}
 * turns it on for good once the player agrees. Showing notifications needs the player's permission
 * too: on iOS the SDK asks at initialisation (or at ${function.firebase_messaging_request_permission}
 * when the prompt is held back), on Android the game asks with `os_request_permission` for
 * `android.permission.POST_NOTIFICATIONS`, which the extension declares.
 *
 * ### Error codes
 *
 * Every asynchronous function returns ${constant.FirebaseError} at once and delivers its outcome to
 * a callback. The callback's `error_code` is a ${constant.FirebaseMessagingError}, Cloud Messaging's
 * own code set: `None` on success, otherwise the member that names the failure.
 *
 * ### Console setup
 *
 * Android needs nothing beyond the credential file. iOS needs an APNs authentication key from the
 * Apple Developer site uploaded under **Project settings > Cloud Messaging** for the iOS app, and
 * the Push Notifications capability on the app id. Messages are sent from **Engage > Messaging**
 * in the console - a test message to one device, a campaign to an audience or a topic - or from a
 * server through the FCM HTTP v1 API. ${page.guides_cloud_messaging} walks through it.
 *
 * @section_func Initialisation
 * @desc Starting and stopping the module:
 * @ref firebase_messaging_initialize
 * @ref firebase_messaging_initialize_with_options
 * @ref firebase_messaging_initialize_for_app
 * @ref firebase_messaging_initialize_for_app_with_options
 * @ref firebase_messaging_terminate
 * @section_end
 *
 * @section_func Registration and permission
 * @desc Registering the installation with the backend, the callbacks that deliver its id, the consent
 * setting, the notification permission, and the BigQuery export:
 * @ref firebase_messaging_request_permission
 * @ref firebase_messaging_register
 * @ref firebase_messaging_unregister
 * @ref firebase_messaging_set_registration_callback
 * @ref firebase_messaging_set_unregistration_callback
 * @ref firebase_messaging_set_registration_on_init_enabled
 * @ref firebase_messaging_is_registration_on_init_enabled
 * @ref firebase_messaging_set_delivery_metrics_export_to_big_query
 * @ref firebase_messaging_delivery_metrics_export_to_big_query_enabled
 * @section_end
 *
 * @section_func Topics
 * @desc Joining and leaving the topics a server broadcasts to:
 * @ref firebase_messaging_subscribe
 * @ref firebase_messaging_unsubscribe
 * @section_end
 *
 * @section_func Receiving messages
 * @desc The callback every message is delivered to, and the binary payload a message can carry:
 * @ref firebase_messaging_set_message_callback
 * @ref firebase_messaging_raw_data_copy
 * @ref firebase_messaging_raw_data_release
 * @section_end
 *
 * @section_func Deprecated
 * @desc The token-based registration API the SDK deprecated in favour of the Firebase Installation ID.
 * Each function still works and names its replacement:
 * @ref firebase_messaging_get_token
 * @ref firebase_messaging_delete_token
 * @ref firebase_messaging_set_token_registration_on_init_enabled
 * @ref firebase_messaging_is_token_registration_on_init_enabled
 * @section_end
 *
 * @section_struct Structs
 * @desc The following structs are used by this module:
 * @ref FirebaseMessagingMessage
 * @ref FirebaseMessagingNotification
 * @ref FirebaseMessagingAndroidNotificationParams
 * @section_end
 *
 * @section_const Constants
 * @desc The following constants are used by this module:
 * @ref FirebaseMessagingError
 * @section_end
 *
 * @module_end
 */
