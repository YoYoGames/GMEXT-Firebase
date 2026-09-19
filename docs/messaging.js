/**
 * @function firebase_messaging_initialize
 * @desc **Firebase C++ SDK:** [firebase::messaging::Initialize](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#initialize)
 *
 * This function starts Cloud Messaging for the default Firebase App and must be called once, after
 * ${function.firebase_app_initialize} and before any other function of this module. The SDK aborts
 * the game when a messaging call reaches it uninitialised, so every function here that would reach
 * it refuses first with `FirebaseError.NotInitialized`, and the poll functions return `0`. From this
 * call on the SDK can deliver messages and registration events at any time; the game collects them
 * with ${function.firebase_messaging_poll_message}, ${function.firebase_messaging_poll_registration}
 * and ${function.firebase_messaging_poll_unregistration} once per step.
 *
 * On iOS this call shows the system's notification permission prompt at once and registers the
 * device with APNs; ${function.firebase_messaging_initialize_with_options} holds the prompt back for
 * a ${function.firebase_messaging_request_permission} of the game's choosing. On Android the
 * notification permission is the game's to request with `os_request_permission` (the extension
 * declares `android.permission.POST_NOTIFICATIONS`), and the call returns `1` when Google Play
 * services are missing on the device. A second call does nothing and returns `0`.
 *
 * [[Note: The return is the SDK's init result, where `0` is success - the opposite of
 * ${function.firebase_app_initialize}. Compare it with `0` rather than testing it for truth.]]
 *
 * @returns {Real} `0` on success, `1` when Google Play services are missing on Android, `-1` when the default app does not exist.
 *
 * @example
 * ```gml
 * // Create Event of a persistent controller, after firebase_app_initialize()
 * if (firebase_messaging_initialize() != 0)
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
 * The above code initialises Cloud Messaging and, on Android, asks for the notification permission
 * the way the platform wants it; the answer arrives in the Async System event as a
 * `"permission_request_result"`. On iOS the initialisation itself has shown the system prompt, so
 * nothing more is needed there.
 * @function_end
 */

/**
 * @function firebase_messaging_terminate
 * @desc **Firebase C++ SDK:** [firebase::messaging::Terminate](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#terminate)
 *
 * This function shuts Cloud Messaging down: the SDK stops delivering to the game, the queued messages
 * and the last polled message, installation id and token are dropped, and the module is back to its
 * uninitialised state, where the poll functions return `0` and the getters empty strings. On Android
 * the platform's messaging service keeps running underneath. The module can be initialised again
 * afterwards. There is no need to call it when the game exits.
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
 * the iOS `Info.plist` so that the first launch does not register, and calls this function with `1`
 * once the player has agreed; turning it on triggers the registration at once. The setting is
 * stored on the device and overrides the manifest and plist keys from then on, so the call is
 * needed once. Turning it off at runtime does not undo a registration that already happened at
 * this launch - only the option prevents the first one - and holds from the next launch. It can be
 * called before ${function.firebase_messaging_initialize}. The desktop stub ignores it.
 *
 * @param {Real} enabled `1` to register at initialisation, `0` not to.
 * @function_end
 */

/**
 * @function firebase_messaging_is_registration_on_init_enabled
 * @desc **Firebase C++ SDK:** [firebase::messaging::IsRegistrationOnInitEnabled](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#isregistrationoninitenabled)
 *
 * This function returns whether the SDK registers the installation at initialisation - the stored
 * setting of ${function.firebase_messaging_set_registration_on_init_enabled}, or failing that the
 * manifest or plist key, or failing that the default of on. The desktop stub always returns `1`.
 *
 * @returns {Real} `1` when registration on init is enabled, otherwise `0`.
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
 * @param {Real} enabled `1` to register at initialisation, `0` not to.
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
 * @returns {Real} `1` when registration on init is enabled, otherwise `0`.
 * @function_end
 */

/**
 * @function firebase_messaging_delivery_metrics_export_to_big_query_enabled
 * @desc **Firebase C++ SDK:** [firebase::messaging::DeliveryMetricsExportToBigQueryEnabled](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#deliverymetricsexporttobigqueryenabled)
 *
 * This function returns whether delivery data is exported to BigQuery, on Android. It returns `0`
 * on every other platform.
 *
 * @returns {Real} `1` when the export is on, otherwise `0`.
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
 * @param {Real} enabled `1` to export delivery metrics, `0` not to.
 * @function_end
 */

/**
 * @function firebase_messaging_request_permission
 * @desc **Firebase C++ SDK:** [firebase::messaging::RequestPermission](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#requestpermission)
 *
 * This function asks the player for permission to show notifications, on iOS: the system prompt
 * appears, unless it was answered before, and the device registers with APNs. The callback fires
 * when that registration has completed or failed with `FailedToRegisterForRemoteNotifications`
 * (code `1`) - not when the prompt is answered, so a player who declines still gets a successful
 * callback and simply sees no notifications. ${function.firebase_messaging_initialize} already
 * does all of this on iOS unless the prompt was held back with
 * ${function.firebase_messaging_initialize_with_options}.
 *
 * On Android the call does nothing and the callback fires at once with `0`; the notification
 * permission is requested with `os_request_permission("android.permission.POST_NOTIFICATIONS")`
 * and its answer arrives in the Async System event. On Windows, macOS and Linux the callback also
 * fires at once with `0`.
 *
 * The function returns `FirebaseError.NotInitialized` without calling the callback when
 * ${function.firebase_messaging_initialize} has not run.
 *
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the device has registered for notifications, or could not.
 * @member {Real} error_code `0` on success, otherwise one of the codes listed under Error codes on the ${module.messaging} page.
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
 * app and device details to Firebase. The id itself does not come to the callback; the SDK delivers
 * it through ${function.firebase_messaging_poll_registration} and
 * ${function.firebase_messaging_current_installation_id}, and does so even when the game was already
 * registered. With registration on init enabled - the default - the SDK registers on its own at
 * ${function.firebase_messaging_initialize}, and this call is for a game that shipped with the
 * `disableDataCollection` option and registers once the player has consented. On Windows, macOS
 * and Linux the callback fires at once with `0` and the id delivered is the stub's
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
 * @member {Real} error_code `0` on success, otherwise one of the codes listed under Error codes on the ${module.messaging} page.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @example
 * ```gml
 * // The consent screen's "Allow notifications" button
 * firebase_messaging_set_registration_on_init_enabled(1);
 * var _result = firebase_messaging_register(function(_error, _message)
 * {
 *     if (_error != 0) show_debug_message($"Registration failed ({_error}): {_message}");
 * });
 *
 * // Step Event of the persistent controller
 * while (firebase_messaging_poll_registration())
 * {
 *     show_debug_message($"Registered as {firebase_messaging_current_installation_id()}");
 * }
 * ```
 * The above code is the consent flow for a game built with `disableDataCollection`: the setting
 * is turned on so that later launches register by themselves, this launch registers explicitly, and
 * the installation id arrives through the poll in the Step event rather than in the callback.
 * @function_end
 */

/**
 * @function firebase_messaging_unregister
 * @desc **Firebase C++ SDK:** [firebase::messaging::Unregister](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#unregister)
 *
 * This function unregisters this installation from the Cloud Messaging backend, so that no more
 * messages reach it; the id it was registered under arrives through
 * ${function.firebase_messaging_poll_unregistration}. The Firebase Installation ID itself stays on
 * the device - ${function.firebase_installations_delete} removes it. On Windows, macOS and Linux
 * the callback fires at once with `0`.
 *
 * The function returns `FirebaseError.NotInitialized` without calling the callback when
 * ${function.firebase_messaging_initialize} has not run.
 *
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the unregistration has completed or failed.
 * @member {Real} error_code `0` on success, otherwise one of the codes listed under Error codes on the ${module.messaging} page.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_messaging_get_token
 * @desc [[Important: This function has been superseded by ${function.firebase_messaging_register}, which registers the installation and delivers its Firebase Installation ID through ${function.firebase_messaging_poll_registration}; the SDK has deprecated the
 * token API, and we recommend that you only use this function for legacy support.]]
 *
 * **Firebase C++ SDK:** [firebase::messaging::GetToken](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#gettoken)
 *
 * This function creates the installation's Firebase Installation ID if there is none, sends the app
 * and device details to Firebase, and hands the callback the registration token: the string that
 * the console's test-message dialog and the older server APIs address a single device by. The
 * token also arrives through ${function.firebase_messaging_poll_token} whenever the SDK generates
 * or refreshes one. On Windows, macOS and Linux the callback fires at once with `0` and the stub's
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
 * @member {Real} error_code `0` on success, otherwise one of the codes listed under Error codes on the ${module.messaging} page.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {String} token The registration token, or an empty string on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_messaging_delete_token
 * @desc [[Important: This function has been superseded by ${function.firebase_messaging_unregister}, which unregisters the installation and delivers its id through ${function.firebase_messaging_poll_unregistration}; the SDK has deprecated the
 * token API, and we recommend that you only use this function for legacy support.]]
 *
 * **Firebase C++ SDK:** [firebase::messaging::DeleteToken](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#deletetoken)
 *
 * This function deletes the installation's registration token, so that no more messages reach this
 * device until a new one is generated. The Firebase Installation ID stays on the device;
 * ${function.firebase_installations_delete} removes it. On Windows, macOS and Linux the callback
 * fires at once with `0`.
 *
 * The function returns `FirebaseError.NotInitialized` without calling the callback when
 * ${function.firebase_messaging_initialize} has not run.
 *
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the token has been deleted or the deletion failed.
 * @member {Real} error_code `0` on success, otherwise one of the codes listed under Error codes on the ${module.messaging} page.
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
 * `%`; anything else fails with `InvalidTopicName` (code `2`). The subscription needs the
 * installation to be registered: made before the registration at initialisation has completed, it
 * waits for it; with registration on init disabled and no ${function.firebase_messaging_register}
 * done, it fails with `NoRegistrationToken` (code `3`). A subscription is kept by the backend
 * across launches until ${function.firebase_messaging_unsubscribe}. On Windows, macOS and Linux
 * the callback fires at once with `0`.
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
 * @member {Real} error_code `0` on success, otherwise one of the codes listed under Error codes on the ${module.messaging} page.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @example
 * ```gml
 * // After the player picks a language and a region
 * firebase_messaging_subscribe($"news-{language}", function(_error, _message)
 * {
 *     if (_error != 0) show_debug_message($"Subscribe failed ({_error}): {_message}");
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
 * `%`; anything else fails with `InvalidTopicName` (code `2`). On Windows, macOS and Linux the callback fires at once with `0`.
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
 * @member {Real} error_code `0` on success, otherwise one of the codes listed under Error codes on the ${module.messaging} page.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_messaging_poll_message
 * @desc **Firebase C++ SDK:** [firebase::messaging::Listener::OnMessage](https://firebase.google.com/docs/reference/cpp/class/firebase/messaging/listener#onmessage)
 *
 * This function takes the oldest message waiting in the queue, if there is one, and makes it the
 * current message that the `firebase_messaging_message_*` getters read. Call it in a `while` loop
 * once per step, until it returns `0`, so that a burst of messages is handled in the step it
 * arrived. A game that stops polling - a long loading screen, a room with no controller - keeps at
 * most 256 messages queued, after which the oldest is dropped with a warning in the debug log. The
 * current message stays readable until the next poll that returns `1` or
 * ${function.firebase_messaging_terminate}.
 *
 * @returns {Real} `1` when a message was taken from the queue and is now current, otherwise `0` - also before initialisation.
 *
 * @example
 * ```gml
 * // Step Event of the persistent controller
 * while (firebase_messaging_poll_message())
 * {
 *     var _kind = firebase_messaging_message_get_data("kind");
 *     switch (_kind)
 *     {
 *         case "gift":
 *             inventory_add(firebase_messaging_message_get_data("item"),
 *                           real(firebase_messaging_message_get_data("amount")));
 *             break;
 *         case "event":
 *             if (firebase_messaging_message_notification_opened())
 *             {
 *                 room_goto(rm_event);
 *             }
 *             break;
 *     }
 * }
 * ```
 * The above code drains the queue every step and acts on the `kind` key the server put in each
 * message's data. A message with a notification that the player tapped while the game was in the
 * background arrives here with `notification_opened` set, which the code uses to take the player
 * straight to the event.
 * @function_end
 */

/**
 * @function firebase_messaging_poll_registration
 * @desc **Firebase C++ SDK:** [firebase::messaging::Listener::OnRegistrationReceived](https://firebase.google.com/docs/reference/cpp/class/firebase/messaging/listener#onregistrationreceived)
 *
 * This function checks whether a registration has completed since the last poll - after
 * ${function.firebase_messaging_register}, or at initialisation when registration on init is
 * enabled - and, when one has, makes ${function.firebase_messaging_current_installation_id} return
 * its Firebase Installation ID. Call it once per step. Each completed registration is reported once,
 * and only the latest is kept between polls.
 *
 * @returns {Real} `1` when a registration was pending and its id is now current, otherwise `0` - also before initialisation.
 * @function_end
 */

/**
 * @function firebase_messaging_poll_unregistration
 * @desc **Firebase C++ SDK:** [firebase::messaging::Listener::OnUnregistrationReceived](https://firebase.google.com/docs/reference/cpp/class/firebase/messaging/listener#onunregistrationreceived)
 *
 * This function checks whether an ${function.firebase_messaging_unregister} has completed since
 * the last poll and, when one has, makes ${function.firebase_messaging_current_installation_id}
 * return the id that was unregistered. Call it once per step; each completed unregistration is
 * reported once.
 *
 * @returns {Real} `1` when an unregistration was pending and its id is now current, otherwise `0` - also before initialisation.
 * @function_end
 */

/**
 * @function firebase_messaging_current_installation_id
 * @desc This function returns the Firebase Installation ID that the last successful
 * ${function.firebase_messaging_poll_registration} or ${function.firebase_messaging_poll_unregistration}
 * delivered: the identifier of this installation of the game, which a server uses to send a message
 * to this device alone. It is an empty string until a poll has returned `1`, and again after
 * ${function.firebase_messaging_terminate}.
 *
 * @returns {String} The installation id, or an empty string.
 * @function_end
 */

/**
 * @function firebase_messaging_poll_token
 * @desc [[Important: This function has been superseded by ${function.firebase_messaging_poll_registration}, which reports each completed registration with its Firebase Installation ID; the SDK has deprecated the
 * token API, and we recommend that you only use this function for legacy support.]]
 *
 * **Firebase C++ SDK:** [firebase::messaging::Listener::OnTokenReceived](https://firebase.google.com/docs/reference/cpp/class/firebase/messaging/listener#ontokenreceived)
 *
 * This function checks whether the SDK generated or refreshed a registration token since the last
 * poll and, when it has, makes ${function.firebase_messaging_current_token} return it. Call it once
 * per step; only the latest token is kept between polls. Android and iOS still deliver tokens this
 * way.
 *
 * @returns {Real} `1` when a token was pending and is now current, otherwise `0` - also before initialisation.
 * @function_end
 */

/**
 * @function firebase_messaging_current_token
 * @desc [[Important: This function has been superseded by ${function.firebase_messaging_current_installation_id}, which returns the Firebase Installation ID the last registration poll delivered; the SDK has deprecated the
 * token API, and we recommend that you only use this function for legacy support.]]
 *
 * This function returns the registration token the last successful
 * ${function.firebase_messaging_poll_token} delivered. It is an empty string until a poll has
 * returned `1`, and again after ${function.firebase_messaging_terminate}.
 *
 * @returns {String} The registration token, or an empty string.
 * @function_end
 */

/**
 * @function firebase_messaging_message_from
 * @desc **Firebase C++ SDK:** [firebase::messaging::Message::from](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/message#from)
 *
 * This function returns the sender's authenticated id: the project's sender ID for a message sent to this device, or `/topics/<name>` for a message sent to a topic. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {String} The sender id.
 * @function_end
 */

/**
 * @function firebase_messaging_message_to
 * @desc **Firebase C++ SDK:** [firebase::messaging::Message::to](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/message#to)
 *
 * This function returns the recipient as the sender addressed it - a token, a topic or a project id - which is often empty on a message sent from the console. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {String} The recipient, or an empty string.
 * @function_end
 */

/**
 * @function firebase_messaging_message_collapse_key
 * @desc **Firebase C++ SDK:** [firebase::messaging::Message::collapse_key](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/message#collapse_key)
 *
 * This function returns the collapse key, when the sender set one: while the device is offline, messages that share a key are collapsed so that only the latest is delivered when it comes back. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {String} The collapse key, or an empty string.
 * @function_end
 */

/**
 * @function firebase_messaging_message_message_id
 * @desc **Firebase C++ SDK:** [firebase::messaging::Message::message_id](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/message#message_id)
 *
 * This function returns the message's id, set by the sender or by Firebase. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {String} The message id.
 * @function_end
 */

/**
 * @function firebase_messaging_message_message_type
 * @desc **Firebase C++ SDK:** [firebase::messaging::Message::message_type](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/message#message_type)
 *
 * This function returns an empty string for an ordinary message; `"deleted_messages"` when the backend dropped queued messages because too many - a hundred - piled up while the device was offline, in which case the game should ask its own server what it missed; `"send_event"` and `"send_error"` concern upstream messages, which this extension does not send. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {String} The message type, or an empty string for an ordinary message.
 * @function_end
 */

/**
 * @function firebase_messaging_message_priority
 * @desc **Firebase C++ SDK:** [firebase::messaging::Message::priority](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/message#priority)
 *
 * This function returns the priority the message was delivered with: `"high"`, which can wake the device and reaches the game at once, or `"normal"`, which saves battery and may be delayed. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {String} `"high"` or `"normal"`.
 * @function_end
 */

/**
 * @function firebase_messaging_message_original_priority
 * @desc **Firebase C++ SDK:** [firebase::messaging::Message::original_priority](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/message#original_priority)
 *
 * This function returns the priority the sender asked for, which differs from ${function.firebase_messaging_message_priority} when the platform lowered it - Android does so for an app whose high-priority messages did not produce notifications the player saw. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {String} `"high"` or `"normal"`.
 * @function_end
 */

/**
 * @function firebase_messaging_message_time_to_live
 * @desc **Firebase C++ SDK:** [firebase::messaging::Message::time_to_live](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/message#time_to_live)
 *
 * This function returns how long, in seconds, the message was to be kept for the device while it
 * was offline before being dropped - up to four weeks, which is the default. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {Real} The time to live in seconds.
 * @function_end
 */

/**
 * @function firebase_messaging_message_sent_time
 * @desc **Firebase C++ SDK:** [firebase::messaging::Message::sent_time](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/message#sent_time)
 *
 * This function returns when the message was sent, in milliseconds since the Unix epoch - the way
 * to tell a message that waited out an offline stretch from a fresh one. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {Real} The send time in milliseconds since the Unix epoch, or `0` when the platform did not provide it.
 * @function_end
 */

/**
 * @function firebase_messaging_message_error
 * @desc **Firebase C++ SDK:** [firebase::messaging::Message::error](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/message#error)
 *
 * This function returns the error code of a `send_error` message about an upstream message, which this extension never sends, so it reads as an empty string. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {String} The error code, or an empty string.
 * @function_end
 */

/**
 * @function firebase_messaging_message_error_description
 * @desc **Firebase C++ SDK:** [firebase::messaging::Message::error_description](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/message#error_description)
 *
 * This function returns the description that goes with ${function.firebase_messaging_message_error}, empty for the same reason. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {String} The description, or an empty string.
 * @function_end
 */

/**
 * @function firebase_messaging_message_link
 * @desc **Firebase C++ SDK:** [firebase::messaging::Message::link](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/message#link)
 *
 * This function returns the link into the game the message carried, when the sender attached one. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {String} The link, or an empty string.
 * @function_end
 */

/**
 * @function firebase_messaging_message_notification_opened
 * @desc **Firebase C++ SDK:** [firebase::messaging::Message::notification_opened](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/message#notification_opened)
 *
 * This function returns whether the message reached the game because the player tapped its
 * notification: the game was in the background or not running, the system showed the notification
 * in its tray, and the tap brought the game up with this message, data payload included. A message
 * delivered while the game was in the foreground reads `0`. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {Real} `1` when the player opened the message's notification, otherwise `0`.
 * @function_end
 */

/**
 * @function firebase_messaging_message_data_count
 * @desc **Firebase C++ SDK:** [firebase::messaging::Message::data](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/message#data)
 *
 * This function returns how many key/value pairs the message's data payload holds: the custom
 * strings the sender attached, which is where a game puts what it acts on, since the notification
 * part is for the player's eyes. Keys beginning with `google.`, `gcm.` or `goog` are the platform's.
 * Walk them with ${function.firebase_messaging_message_data_key_at} and
 * ${function.firebase_messaging_message_get_data}. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {Real} The number of data pairs.
 * @function_end
 */

/**
 * @function firebase_messaging_message_data_key_at
 * @desc **Firebase C++ SDK:** [firebase::messaging::Message::data](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/message#data)
 *
 * This function returns the key of one data pair by position; the pairs come in key order. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @param {Real} index The pair's position, from `0`.
 * @returns {String} The key, or an empty string when the position is out of range.
 * @function_end
 */

/**
 * @function firebase_messaging_message_get_data
 * @desc **Firebase C++ SDK:** [firebase::messaging::Message::data](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/message#data)
 *
 * This function returns the value stored under a data key. Every value is a string, whatever the
 * sender typed; convert with `real` or `json_parse` as needed. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @param {String} key The data key.
 * @returns {String} The value, or an empty string when the key is not present.
 * @function_end
 */

/**
 * @function firebase_messaging_message_raw_data_size
 * @desc **Firebase C++ SDK:** [firebase::messaging::Message::raw_data](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/message#raw_data)
 *
 * This function returns the size in bytes of the message's binary payload. Messages sent through
 * the console or the HTTP API carry none, so it reads `0` in practice. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {Real} The payload size in bytes.
 * @function_end
 */

/**
 * @function firebase_messaging_message_raw_data_copy
 * @desc **Firebase C++ SDK:** [firebase::messaging::Message::raw_data](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/message#raw_data)
 *
 * This function copies the message's binary payload into a buffer the game created, from the
 * buffer's start and up to its size; size the buffer from
 * ${function.firebase_messaging_message_raw_data_size}. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @param {Buffer} out_buffer The buffer to copy into.
 * @returns {Real} The number of bytes copied.
 * @function_end
 */

/**
 * @function firebase_messaging_message_has_notification
 * @desc **Firebase C++ SDK:** [firebase::messaging::Message::notification](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/message#notification)
 *
 * This function returns whether the message carries a notification part - the title, body and
 * presentation fields the operating system shows in its tray - as opposed to a data-only message.
 * Every `firebase_messaging_message_notification_*` getter reads as an empty string or `0` when
 * there is none. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {Real} `1` when the message has a notification, otherwise `0`.
 * @function_end
 */

/**
 * @function firebase_messaging_message_notification_title
 * @desc **Firebase C++ SDK:** [firebase::messaging::Notification::title](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/notification#title)
 *
 * This function returns the notification's title. It is an empty string when the message carries no notification part. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {String} The title, or an empty string.
 * @function_end
 */

/**
 * @function firebase_messaging_message_notification_body
 * @desc **Firebase C++ SDK:** [firebase::messaging::Notification::body](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/notification#body)
 *
 * This function returns the notification's body text. It is an empty string when the message carries no notification part. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {String} The body, or an empty string.
 * @function_end
 */

/**
 * @function firebase_messaging_message_notification_icon
 * @desc **Firebase C++ SDK:** [firebase::messaging::Notification::icon](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/notification#icon)
 *
 * This function returns the name of the drawable resource the sender chose as the notification's icon, on Android. It is an empty string when the message carries no notification part. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {String} The icon, or an empty string.
 * @function_end
 */

/**
 * @function firebase_messaging_message_notification_sound
 * @desc **Firebase C++ SDK:** [firebase::messaging::Notification::sound](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/notification#sound)
 *
 * This function returns the sound the sender chose: `"default"`, or the name of a sound file bundled with the game. It is an empty string when the message carries no notification part. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {String} The sound, or an empty string.
 * @function_end
 */

/**
 * @function firebase_messaging_message_notification_badge
 * @desc **Firebase C++ SDK:** [firebase::messaging::Notification::badge](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/notification#badge)
 *
 * This function returns the badge count the sender set for the app icon, on iOS. It is an empty string when the message carries no notification part. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {String} The badge, or an empty string.
 * @function_end
 */

/**
 * @function firebase_messaging_message_notification_tag
 * @desc **Firebase C++ SDK:** [firebase::messaging::Notification::tag](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/notification#tag)
 *
 * This function returns the notification's tag, on Android: notifications with the same tag replace each other in the tray instead of stacking. It is an empty string when the message carries no notification part. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {String} The tag, or an empty string.
 * @function_end
 */

/**
 * @function firebase_messaging_message_notification_color
 * @desc **Firebase C++ SDK:** [firebase::messaging::Notification::color](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/notification#color)
 *
 * This function returns the icon colour the sender set, as `#rrggbb`, on Android. It is an empty string when the message carries no notification part. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {String} The color, or an empty string.
 * @function_end
 */

/**
 * @function firebase_messaging_message_notification_click_action
 * @desc **Firebase C++ SDK:** [firebase::messaging::Notification::click_action](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/notification#click_action)
 *
 * This function returns what a tap on the notification does: the intent action on Android, the APNs category on iOS. It is an empty string when the message carries no notification part. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {String} The click action, or an empty string.
 * @function_end
 */

/**
 * @function firebase_messaging_message_notification_body_loc_key
 * @desc **Firebase C++ SDK:** [firebase::messaging::Notification::body_loc_key](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/notification#body_loc_key)
 *
 * This function returns the key of the body text in the game's string resources (`loc-key` on iOS), for a notification the sender localised on the device rather than in the message. It is an empty string when the message carries no notification part. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {String} The body loc key, or an empty string.
 * @function_end
 */

/**
 * @function firebase_messaging_message_notification_body_loc_args_count
 * @desc **Firebase C++ SDK:** [firebase::messaging::Notification::body_loc_args](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/notification#body_loc_args)
 *
 * This function returns how many format arguments go with
 * ${function.firebase_messaging_message_notification_body_loc_key} - the values to substitute into the
 * localised body. It is `0` when there are none or the message has no notification part. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {Real} The number of arguments.
 * @function_end
 */

/**
 * @function firebase_messaging_message_notification_body_loc_args_at
 * @desc **Firebase C++ SDK:** [firebase::messaging::Notification::body_loc_args](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/notification#body_loc_args)
 *
 * This function returns one of the format arguments for the localised body, by position. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @param {Real} index The argument's position, from `0`.
 * @returns {String} The argument, or an empty string when the position is out of range or the message has no notification part.
 * @function_end
 */

/**
 * @function firebase_messaging_message_notification_title_loc_key
 * @desc **Firebase C++ SDK:** [firebase::messaging::Notification::title_loc_key](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/notification#title_loc_key)
 *
 * This function returns the key of the title in the game's string resources (`title-loc-key` on iOS), for a notification the sender localised on the device. It is an empty string when the message carries no notification part. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {String} The title loc key, or an empty string.
 * @function_end
 */

/**
 * @function firebase_messaging_message_notification_title_loc_args_count
 * @desc **Firebase C++ SDK:** [firebase::messaging::Notification::title_loc_args](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/notification#title_loc_args)
 *
 * This function returns how many format arguments go with
 * ${function.firebase_messaging_message_notification_title_loc_key} - the values to substitute into the
 * localised title. It is `0` when there are none or the message has no notification part. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {Real} The number of arguments.
 * @function_end
 */

/**
 * @function firebase_messaging_message_notification_title_loc_args_at
 * @desc **Firebase C++ SDK:** [firebase::messaging::Notification::title_loc_args](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/notification#title_loc_args)
 *
 * This function returns one of the format arguments for the localised title, by position. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @param {Real} index The argument's position, from `0`.
 * @returns {String} The argument, or an empty string when the position is out of range or the message has no notification part.
 * @function_end
 */

/**
 * @function firebase_messaging_message_notification_android_channel_id
 * @desc **Firebase C++ SDK:** [firebase::messaging::AndroidNotificationParams::channel_id](https://firebase.google.com/docs/reference/cpp/struct/firebase/messaging/android-notification-params#channel_id)
 *
 * This function returns the Android notification channel the sender addressed, when the message
 * set one; the channel decides the importance, sound and vibration the system gives the
 * notification. It is an empty string on other platforms and when no channel was set. It reads the message the last successful ${function.firebase_messaging_poll_message} made current.
 *
 * @returns {String} The channel id, or an empty string.
 * @function_end
 */

/**
 * @function firebase_messaging_initialize_with_options
 * @desc **Firebase C++ SDK:** [firebase::messaging::Initialize](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#initialize_1)
 *
 * This function is ${function.firebase_messaging_initialize} with the one option the SDK has: on iOS,
 * `suppress_notification_permission_prompt` set to `1` keeps the system permission prompt from
 * appearing at initialisation, so that the game can explain why it wants to notify the player and
 * call ${function.firebase_messaging_request_permission} at the right moment. A prompt the player
 * has already answered is not shown again either way. The option does nothing on Android.
 *
 * @param {Real} suppress_notification_permission_prompt `1` to hold the iOS permission prompt back until ${function.firebase_messaging_request_permission}, `0` to show it now.
 * @returns {Real} `0` on success, `1` when Google Play services are missing on Android, `-1` when the default app does not exist.
 * @function_end
 */

/**
 * @function firebase_messaging_initialize_for_app
 * @desc **Firebase C++ SDK:** [firebase::messaging::Initialize](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#initialize)
 *
 * This function is ${function.firebase_messaging_initialize} for another Firebase App, created with
 * ${function.firebase_app_initialize_with_options} or ${function.firebase_app_initialize_from_json}.
 * Cloud Messaging is initialised once per game, for one app: once any of the initialise functions
 * has succeeded, the others do nothing and return `0`.
 *
 * @param {Real} app An app handle.
 * @returns {Real} `0` on success, `1` when Google Play services are missing on Android, `-1` when the app handle is not valid.
 * @function_end
 */

/**
 * @function firebase_messaging_initialize_for_app_with_options
 * @desc **Firebase C++ SDK:** [firebase::messaging::Initialize](https://firebase.google.com/docs/reference/cpp/namespace/firebase/messaging#initialize_1)
 *
 * This function is ${function.firebase_messaging_initialize_with_options} for another Firebase App.
 *
 * @param {Real} app An app handle.
 * @param {Real} suppress_notification_permission_prompt `1` to hold the iOS permission prompt back until ${function.firebase_messaging_request_permission}, `0` to show it now.
 * @returns {Real} `0` on success, `1` when Google Play services are missing on Android, `-1` when the app handle is not valid.
 * @function_end
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
 * succeeds, every callback fires at once with `0` and the message `"Successfully completed as a
 * stub."`, ${function.firebase_messaging_register} delivers the id `"StubRegistrationId"` and
 * ${function.firebase_messaging_get_token} the token `"StubToken"`, the settings read as their
 * defaults, and no message ever arrives.
 *
 * ### Receiving
 *
 * The SDK delivers on its own threads, at any moment, so this module does not call the game back
 * for messages: it queues them, and the game polls once per step -
 * ${function.firebase_messaging_poll_message} in a `while` loop, then the
 * `firebase_messaging_message_*` getters on the message the poll made current. Registration events
 * work the same way through ${function.firebase_messaging_poll_registration} and
 * ${function.firebase_messaging_poll_unregistration}. The queue keeps 256 messages; the oldest is
 * dropped beyond that.
 *
 * A message has a data part - key/value strings the sender attached - and, optionally, a
 * notification part the system shows. While the game is in the foreground every message reaches the
 * poll and nothing is shown. While it is in the background or closed, a message with a notification
 * is shown by the system and reaches the game when the player taps it, with
 * ${function.firebase_messaging_message_notification_opened} set; a data-only message reaches the
 * game on the platform's terms - at once on Android when its priority is high, otherwise when the
 * platform next lets the game run.
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
 * a callback. The callback's `error_code` is Cloud Messaging's own code, a plain number:
 *
 * - `0` - success.
 * - `1` - `FailedToRegisterForRemoteNotifications`: the iOS device could not register with APNs.
 * - `2` - `InvalidTopicName`: the topic name has characters outside `a-z`, `A-Z`, `0-9`, `-`, `_`, `.`, `~`, `%`, or is longer than 900.
 * - `3` - `NoRegistrationToken`: a topic call was made with registration disabled and no registration done.
 * - `4` - `Unknown`: an error the SDK could not classify.
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
 * @desc Registering the installation with the backend, the id that identifies it, the consent
 * setting, the notification permission, and the BigQuery export:
 * @ref firebase_messaging_request_permission
 * @ref firebase_messaging_register
 * @ref firebase_messaging_unregister
 * @ref firebase_messaging_poll_registration
 * @ref firebase_messaging_poll_unregistration
 * @ref firebase_messaging_current_installation_id
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
 * @desc Polling the queue, and reading the current message's envelope and data payload:
 * @ref firebase_messaging_poll_message
 * @ref firebase_messaging_message_from
 * @ref firebase_messaging_message_to
 * @ref firebase_messaging_message_collapse_key
 * @ref firebase_messaging_message_message_id
 * @ref firebase_messaging_message_message_type
 * @ref firebase_messaging_message_priority
 * @ref firebase_messaging_message_original_priority
 * @ref firebase_messaging_message_time_to_live
 * @ref firebase_messaging_message_sent_time
 * @ref firebase_messaging_message_error
 * @ref firebase_messaging_message_error_description
 * @ref firebase_messaging_message_link
 * @ref firebase_messaging_message_notification_opened
 * @ref firebase_messaging_message_data_count
 * @ref firebase_messaging_message_data_key_at
 * @ref firebase_messaging_message_get_data
 * @ref firebase_messaging_message_raw_data_size
 * @ref firebase_messaging_message_raw_data_copy
 * @section_end
 *
 * @section_func The notification
 * @desc Reading the notification part of the current message - what the system showed, or would
 * have shown, the player:
 * @ref firebase_messaging_message_has_notification
 * @ref firebase_messaging_message_notification_title
 * @ref firebase_messaging_message_notification_body
 * @ref firebase_messaging_message_notification_icon
 * @ref firebase_messaging_message_notification_sound
 * @ref firebase_messaging_message_notification_badge
 * @ref firebase_messaging_message_notification_tag
 * @ref firebase_messaging_message_notification_color
 * @ref firebase_messaging_message_notification_click_action
 * @ref firebase_messaging_message_notification_body_loc_key
 * @ref firebase_messaging_message_notification_body_loc_args_count
 * @ref firebase_messaging_message_notification_body_loc_args_at
 * @ref firebase_messaging_message_notification_title_loc_key
 * @ref firebase_messaging_message_notification_title_loc_args_count
 * @ref firebase_messaging_message_notification_title_loc_args_at
 * @ref firebase_messaging_message_notification_android_channel_id
 * @section_end
 *
 * @section_func Deprecated
 * @desc The token-based registration API the SDK deprecated in favour of the Firebase Installation ID.
 * Each function still works and names its replacement:
 * @ref firebase_messaging_get_token
 * @ref firebase_messaging_delete_token
 * @ref firebase_messaging_poll_token
 * @ref firebase_messaging_current_token
 * @ref firebase_messaging_set_token_registration_on_init_enabled
 * @ref firebase_messaging_is_token_registration_on_init_enabled
 * @section_end
 *
 * @module_end
 */
