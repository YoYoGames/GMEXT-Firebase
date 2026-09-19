/**
 * @function firebase_in_app_messaging_set_automatic_data_collection_enabled
 * @desc **Firebase SDK:** [FirebaseInAppMessaging.setAutomaticDataCollectionEnabled(boolean) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/inappmessaging/FirebaseInAppMessaging#setAutomaticDataCollectionEnabled%28boolean%29), [FIRInAppMessaging automaticDataCollectionEnabled (iOS)](https://firebase.google.com/docs/reference/ios/firebaseinappmessaging/api/reference/Classes/FIRInAppMessaging#automaticdatacollectionenabled)
 *
 * This function turns In-App Messaging's data collection on or off. Off, the SDK collects
 * nothing and fetches no campaigns, so no message is shown; on, it fetches the campaigns the
 * player is eligible for and reports impressions, clicks and dismissals to the console. It
 * overrides the `disableDataCollection` extension option (see ${page.extension_options}) and
 * persists across launches, so a consent screen calls it once when the player agrees. It does
 * nothing before the SDK is ready - on iOS until ${function.firebase_app_initialize} has run, on Android without a default Firebase App.
 *
 * @param {Bool} enabled `true` to collect data and fetch campaigns, `false` to do neither.
 * @function_end
 */

/**
 * @function firebase_in_app_messaging_is_automatic_data_collection_enabled
 * @desc **Firebase SDK:** [FirebaseInAppMessaging.isAutomaticDataCollectionEnabled() (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/inappmessaging/FirebaseInAppMessaging#isAutomaticDataCollectionEnabled%28%29), [FIRInAppMessaging automaticDataCollectionEnabled (iOS)](https://firebase.google.com/docs/reference/ios/firebaseinappmessaging/api/reference/Classes/FIRInAppMessaging#automaticdatacollectionenabled)
 *
 * This function returns whether In-App Messaging's data collection is on: the value set with
 * ${function.firebase_in_app_messaging_set_automatic_data_collection_enabled}, or the
 * `disableDataCollection` option's when nothing has been set. It returns `false` before the SDK is ready - on iOS until ${function.firebase_app_initialize} has run, on Android without a default Firebase App.
 *
 * @returns {Bool} `true` when data is collected and campaigns fetched, `false` otherwise.
 * @function_end
 */

/**
 * @function firebase_in_app_messaging_set_messages_suppressed
 * @desc **Firebase SDK:** [FirebaseInAppMessaging.setMessagesSuppressed(java.lang.Boolean) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/inappmessaging/FirebaseInAppMessaging#setMessagesSuppressed%28java.lang.Boolean%29), [FIRInAppMessaging messageDisplaySuppressed (iOS)](https://firebase.google.com/docs/reference/ios/firebaseinappmessaging/api/reference/Classes/FIRInAppMessaging#messagedisplaysuppressed)
 *
 * This function stops messages from being shown, or lets them be shown again. Suppress them
 * where a message would get in the way - during a level, a cutscene, a purchase, a tutorial -
 * and lift the suppression on the menu, where a message belongs: while suppressed, a campaign
 * whose trigger fires is not shown. Suppression is not remembered across launches; every run
 * starts unsuppressed.
 *
 * @param {Bool} suppressed `true` to hold messages back, `false` to show them.
 *
 * @example
 * ```gml
 * // Room Start
 * firebase_in_app_messaging_set_messages_suppressed(room != rm_menu);
 * ```
 * The above code, in a persistent controller, lets messages appear only on the menu room:
 * every other room suppresses them on entry, and the menu lifts the suppression.
 * @function_end
 */

/**
 * @function firebase_in_app_messaging_are_messages_suppressed
 * @desc **Firebase SDK:** [FirebaseInAppMessaging.areMessagesSuppressed() (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/inappmessaging/FirebaseInAppMessaging#areMessagesSuppressed%28%29), [FIRInAppMessaging messageDisplaySuppressed (iOS)](https://firebase.google.com/docs/reference/ios/firebaseinappmessaging/api/reference/Classes/FIRInAppMessaging#messagedisplaysuppressed)
 *
 * This function returns whether messages are currently held back by
 * ${function.firebase_in_app_messaging_set_messages_suppressed}. It returns `false` before the SDK is ready - on iOS until ${function.firebase_app_initialize} has run, on Android without a default Firebase App.
 *
 * @returns {Bool} `true` while messages are suppressed, `false` otherwise.
 * @function_end
 */

/**
 * @function firebase_in_app_messaging_trigger_event
 * @desc **Firebase SDK:** [FirebaseInAppMessaging.triggerEvent(java.lang.String) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/inappmessaging/FirebaseInAppMessaging#triggerEvent%28java.lang.String%29), [FIRInAppMessaging triggerEvent: (iOS)](https://firebase.google.com/docs/reference/ios/firebaseinappmessaging/api/reference/Classes/FIRInAppMessaging#-triggerevent:)
 *
 * This function fires a named event for campaigns to trigger on: a campaign whose trigger in the
 * console is a custom event of this name, and whose audience includes the player, shows its
 * message now (within the campaign's own frequency limit and unless messages are suppressed).
 * It is the game's own trigger, next to the Analytics events campaigns can also trigger on: use
 * it for the moments that are not Analytics events, or where the message must come from exactly
 * this call - the end of a run, the tenth launch, a level milestone. The name is matched
 * exactly. An empty name does nothing, and so does a call before the SDK is ready - on iOS until ${function.firebase_app_initialize} has run, on Android without a default Firebase App.
 *
 * @param {String} event_name The event's name, as entered in the campaign's trigger.
 *
 * @example
 * ```gml
 * // The run has ended: a campaign triggered on "run_complete" can show its message here
 * firebase_in_app_messaging_trigger_event("run_complete");
 * ```
 * The above code fires the trigger at the end of a run; a campaign in the console with a custom
 * trigger event named `run_complete` shows its message on the spot, to the players it targets.
 * @function_end
 */

/**
 * @function firebase_in_app_messaging_set_impression_callback
 * @desc **Firebase SDK:** [FirebaseInAppMessaging.addImpressionListener(com.google.firebase.inappmessaging.FirebaseInAppMessagingImpressionListener) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/inappmessaging/FirebaseInAppMessaging#addImpressionListener%28com.google.firebase.inappmessaging.FirebaseInAppMessagingImpressionListener%29), [FIRInAppMessagingDisplayDelegate impressionDetectedForMessage: (iOS)](https://firebase.google.com/docs/reference/ios/firebaseinappmessaging/api/reference/Protocols/FIRInAppMessagingDisplayDelegate#-impressiondetectedformessage:)
 *
 * This function sets the function called when a message has been shown - the moment to pause
 * what the player was doing, or to record that this campaign has been seen. One callback of each kind is held at a time: setting another replaces
 * it, ${function.firebase_in_app_messaging_clear_callbacks} removes all four. An event that
 * arrives before its callback has been set - a message shown at launch, before the Create event
 * that sets it - is kept (the latest of its kind) and delivered as soon as the callback is set.
 * The callback runs on the game's thread.
 *
 * @param {Function} callback The function to call when a message is shown.
 *
 * @event callback
 * @desc Fires each time a message has been shown.
 * @member {String} message_id The campaign's message id.
 * @member {String} campaign_name The campaign's name, as in the console.
 * @member {Bool} is_test_message `true` when this is a test message sent to this device from the console.
 * @member {String} message_type The layout: `modal`, `banner`, `image_only` or `card` (`unknown` or `unsupported` when the SDK does not say).
 * @member {String} data_json The campaign's custom key-value pairs as a JSON object string - `"{}"` when there are none; parse with `json_parse`.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_in_app_messaging_set_click_callback
 * @desc **Firebase SDK:** [FirebaseInAppMessaging.addClickListener(com.google.firebase.inappmessaging.FirebaseInAppMessagingClickListener) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/inappmessaging/FirebaseInAppMessaging#addClickListener%28com.google.firebase.inappmessaging.FirebaseInAppMessagingClickListener%29), [FIRInAppMessagingDisplayDelegate messageClicked:withAction: (iOS)](https://firebase.google.com/docs/reference/ios/firebaseinappmessaging/api/reference/Protocols/FIRInAppMessagingDisplayDelegate#-messageclicked:withaction:)
 *
 * This function sets the function called when the player has tapped a message's button or
 * body. The callback receives the action the campaign attached to it - a URL, which the SDK
 * opens itself, and the button's text - and the campaign's custom data, which is how a message
 * tells the game what to do: a campaign whose custom data says `{"screen": "shop"}` can have the
 * game open the shop from this callback. One callback of each kind is held at a time: setting another replaces
 * it, ${function.firebase_in_app_messaging_clear_callbacks} removes all four. An event that
 * arrives before its callback has been set - a message shown at launch, before the Create event
 * that sets it - is kept (the latest of its kind) and delivered as soon as the callback is set.
 * The callback runs on the game's thread.
 *
 * @param {Function} callback The function to call when a message is tapped.
 *
 * @event callback
 * @desc Fires each time a message's button or body has been tapped.
 * @member {String} message_id The campaign's message id.
 * @member {String} campaign_name The campaign's name, as in the console.
 * @member {Bool} is_test_message `true` when this is a test message sent to this device from the console.
 * @member {String} message_type The layout: `modal`, `banner`, `image_only` or `card` (`unknown` or `unsupported` when the SDK does not say).
 * @member {String} action_url The URL the action opens, or an empty string when it has none.
 * @member {String} action_text The tapped button's text, or an empty string when the body was tapped.
 * @member {String} data_json The campaign's custom key-value pairs as a JSON object string - `"{}"` when there are none; parse with `json_parse`.
 * @event_end
 *
 * @example
 * ```gml
 * firebase_in_app_messaging_set_click_callback(function(_id, _campaign, _is_test, _type, _url, _text, _data_json)
 * {
 *     var _data = json_parse(_data_json);
 *     if (variable_struct_exists(_data, "screen"))
 *     {
 *         open_screen(_data.screen);
 *     }
 * });
 * ```
 * The above code reads the campaign's custom data when the player taps the message and opens
 * the screen it names, so that a "Sale this weekend" message can take the player straight to the
 * shop without the game knowing the campaign in advance.
 * @function_end
 */

/**
 * @function firebase_in_app_messaging_set_dismiss_callback
 * @desc **Firebase SDK:** [FirebaseInAppMessaging.addDismissListener(com.google.firebase.inappmessaging.FirebaseInAppMessagingDismissListener) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/inappmessaging/FirebaseInAppMessaging#addDismissListener%28com.google.firebase.inappmessaging.FirebaseInAppMessagingDismissListener%29), [FIRInAppMessagingDisplayDelegate messageDismissed:dismissType: (iOS)](https://firebase.google.com/docs/reference/ios/firebaseinappmessaging/api/reference/Protocols/FIRInAppMessagingDisplayDelegate#-messagedismissed:dismisstype:)
 *
 * This function sets the function called when a message has gone - dismissed by the player,
 * closed after a tap, or timed out - the moment to resume what the impression callback
 * paused. One callback of each kind is held at a time: setting another replaces
 * it, ${function.firebase_in_app_messaging_clear_callbacks} removes all four. An event that
 * arrives before its callback has been set - a message shown at launch, before the Create event
 * that sets it - is kept (the latest of its kind) and delivered as soon as the callback is set.
 * The callback runs on the game's thread.
 *
 * @param {Function} callback The function to call when a message has gone.
 *
 * @event callback
 * @desc Fires each time a message has been dismissed.
 * @member {String} message_id The campaign's message id.
 * @member {String} campaign_name The campaign's name, as in the console.
 * @member {Bool} is_test_message `true` when this is a test message sent to this device from the console.
 * @member {String} message_type The layout: `modal`, `banner`, `image_only` or `card` (`unknown` or `unsupported` when the SDK does not say).
 * @member {String} data_json The campaign's custom key-value pairs as a JSON object string - `"{}"` when there are none; parse with `json_parse`.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_in_app_messaging_set_display_error_callback
 * @desc **Firebase SDK:** [FirebaseInAppMessaging.addDisplayErrorListener(com.google.firebase.inappmessaging.FirebaseInAppMessagingDisplayErrorListener) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/inappmessaging/FirebaseInAppMessaging#addDisplayErrorListener%28com.google.firebase.inappmessaging.FirebaseInAppMessagingDisplayErrorListener%29), [FIRInAppMessagingDisplayDelegate displayErrorForMessage:error: (iOS)](https://firebase.google.com/docs/reference/ios/firebaseinappmessaging/api/reference/Protocols/FIRInAppMessagingDisplayDelegate#-displayerrorformessage:error:)
 *
 * This function sets the function called when a message could not be shown - its image could
 * not be fetched or decoded, or the rendering failed - so that a game which paused for an
 * impression that never came, or which counts on a message having been seen, can find out. The
 * reason arrives as one of four names on both platforms: `IMAGE_FETCH_ERROR`,
 * `IMAGE_UNSUPPORTED_FORMAT`, `IMAGE_DISPLAY_ERROR` and `UNSPECIFIED_RENDER_ERROR`. One callback of each kind is held at a time: setting another replaces
 * it, ${function.firebase_in_app_messaging_clear_callbacks} removes all four. An event that
 * arrives before its callback has been set - a message shown at launch, before the Create event
 * that sets it - is kept (the latest of its kind) and delivered as soon as the callback is set.
 * The callback runs on the game's thread.
 *
 * @param {Function} callback The function to call when a message could not be shown.
 *
 * @event callback
 * @desc Fires each time a message could not be shown.
 * @member {String} message_id The campaign's message id.
 * @member {String} campaign_name The campaign's name, as in the console.
 * @member {Bool} is_test_message `true` when this is a test message sent to this device from the console.
 * @member {String} message_type The layout: `modal`, `banner`, `image_only` or `card` (`unknown` or `unsupported` when the SDK does not say).
 * @member {String} error_message The reason: `IMAGE_FETCH_ERROR`, `IMAGE_UNSUPPORTED_FORMAT`, `IMAGE_DISPLAY_ERROR` or `UNSPECIFIED_RENDER_ERROR`.
 * @member {String} data_json The campaign's custom key-value pairs as a JSON object string - `"{}"` when there are none; parse with `json_parse`.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_in_app_messaging_clear_callbacks
 * @desc **Firebase SDK:** [FirebaseInAppMessaging.removeImpressionListener(com.google.firebase.inappmessaging.FirebaseInAppMessagingImpressionListener) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/inappmessaging/FirebaseInAppMessaging#removeImpressionListener%28com.google.firebase.inappmessaging.FirebaseInAppMessagingImpressionListener%29), [FIRInAppMessaging delegate (iOS)](https://firebase.google.com/docs/reference/ios/firebaseinappmessaging/api/reference/Classes/FIRInAppMessaging#delegate)
 *
 * This function removes all four callbacks and detaches the extension from the SDK's message
 * events: nothing is delivered or kept until a callback is set again. Call it from the Clean Up
 * event of the object that set the callbacks. Messages themselves keep being shown; only the
 * game stops hearing about them.
 *
 * @function_end
 */

/**
 * @module in_app_messaging
 * @title In-App Messaging
 * @desc This module covers Firebase In-App Messaging for Android and iOS: messages composed in the
 * console - a modal, a banner, an image, a card, with a button and an action - and shown inside
 * the game to the players a campaign targets, when its trigger fires. The console does the
 * targeting (Analytics audiences and user properties), the scheduling and the layout; the SDK
 * fetches the campaigns a player is eligible for and shows them; the module is the game's side of
 * it - when messages may appear, the game's own triggers, and what happens when a message is
 * shown, tapped or closed. With the extension in the project, campaigns triggered on Analytics
 * events or on app foreground show without a single call from the game.
 *
 * ### Triggers
 *
 * A campaign shows on an Analytics event (the ones ${function.firebase_analytics_log_event}
 * sends, and the automatic ones such as `first_open`) or on a custom event the game fires with
 * ${function.firebase_in_app_messaging_trigger_event}; a campaign can also show every time it is
 * triggered, or once. ${function.firebase_in_app_messaging_set_messages_suppressed} holds messages
 * back where they would interrupt play. Analytics is what In-App Messaging targets and triggers
 * with, so it has to be collecting for messages to work.
 *
 * ### Callbacks
 *
 * Four callbacks tell the game about a message: shown, tapped, gone, and could not be shown. Each
 * receives the campaign's id and name, whether it is a test message, the layout, and the custom
 * key-value pairs entered for the campaign as a JSON string - the channel by which a message can
 * tell the game to do something, such as open a screen; the tap callback also receives the
 * action's URL and the button's text. Set them once in a persistent controller's Create event
 * and clear them in its Clean Up; an event that fires before its callback exists is kept and
 * delivered when the callback is set.
 *
 * ### Platforms
 *
 * The module is the `GMFirebaseInAppMessaging` extension, built for Android and iOS only; in a
 * Windows, macOS or Linux build every function returns `undefined` at once and no callback ever
 * fires. On Android the extension adds `firebase-inappmessaging-display` (which brings the
 * headless SDK with it) and the SDK is active from process start. On iOS it adds the
 * `FirebaseInAppMessaging` pod - a beta release, `12.19.0-beta`, the Apple SDK's current state -
 * and attaches to the SDK once ${function.firebase_app_initialize} has configured the default
 * app; nothing is fetched or shown before that.
 *
 * ### Consent
 *
 * Fetching campaigns and reporting impressions is data collection. A game that asks first ships
 * with the `disableDataCollection` option on (see ${page.extension_options}) and calls
 * ${function.firebase_in_app_messaging_set_automatic_data_collection_enabled} once the player
 * agrees; the setting persists.
 *
 * ### Console setup
 *
 * Campaigns are composed under **Engage > In-App Messaging** in the console. The SDK fetches a
 * player's eligible campaigns once a day, so a campaign published now is not seen by running
 * games at once; to see a message on a device now, use the campaign's **Test on device** option
 * with the device's Firebase installation id, which ${function.firebase_installations_get_id}
 * delivers - test messages arrive at once and carry `is_test_message` `true`.
 *
 * @section_func Collection and display
 * @desc Data collection, suppression, and the game's own triggers:
 * @ref firebase_in_app_messaging_set_automatic_data_collection_enabled
 * @ref firebase_in_app_messaging_is_automatic_data_collection_enabled
 * @ref firebase_in_app_messaging_set_messages_suppressed
 * @ref firebase_in_app_messaging_are_messages_suppressed
 * @ref firebase_in_app_messaging_trigger_event
 * @section_end
 *
 * @section_func Callbacks
 * @desc What the game hears about a message:
 * @ref firebase_in_app_messaging_set_impression_callback
 * @ref firebase_in_app_messaging_set_click_callback
 * @ref firebase_in_app_messaging_set_dismiss_callback
 * @ref firebase_in_app_messaging_set_display_error_callback
 * @ref firebase_in_app_messaging_clear_callbacks
 * @section_end
 *
 * @module_end
 */
