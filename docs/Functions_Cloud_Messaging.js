
/**
 * @function FirebaseCloudMessaging_DeleteToken
 * @desc This function deletes the FCM registration token for this Firebase project. Note that if auto-init is enabled, a new token will be generated the next time the app is started. Disable auto-init (using the function ${function.FirebaseCloudMessaging_SetAutoInitEnabled}) to avoid this behaviour.
 * 
 * @event social
 * @desc 
 * @member {string} type The constant `"FirebaseCloudMessaging_DeleteToken"`
 * @member {boolean} success Whether or not the function task succeeded.
 * @event_end
 * 
 * @example
 * ```gml
 * FirebaseCloudMessaging_DeleteToken()
 * ```
 * In the code above we request for the FCM token to be deleted. The function callback can be caught inside a ${event.social}.
 * ```gml
 * if(async_load[?"type"] == "FirebaseCloudMessaging_DeleteToken")
 * {
 *     if(async_load[?"success"])
 *     {
 *        show_debug_message("FCM token deleted");
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, and provides a success message if **success** is true.
 * @function_end
 */

/**
 * @func FirebaseCloudMessaging_GetToken
 * @desc Requests the FCM registration token for this Firebase project. This sends information about the application and the device where it's running to the Firebase backend. See ${function.FirebaseCloudMessaging_DeleteToken} for information on deleting the token.
 * 
 * @event social
 * @desc 
 * @member {string} type The constant `"FirebaseCloudMessaging_GetToken"`
 * @member {boolean} success Whether or not the function task succeeded.
 * @member {string} value The FCM registration token.
 * @event_end
 * 
 * @example
 * ```gml
 * FirebaseCloudMessaging_GetToken();
 * ```
 * In the code above we request for the current FCM token. The function callback can be caught inside a ${event.social}.
 * ```gml
 * if(async_load[?"type"] == "FirebaseCloudMessaging_GetToken")
 * {
 *     if(async_load[?"success"])
 *     {
 *         global.fcmToken = async_load[? "value"];
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, and if the tasks succeeds it stores the token value into a global variable (`global.fcmToken`).
 * @function_end
 */

/**
 * @func FirebaseCloudMessaging_IsAutoInitEnabled
 * @desc Returns whether FCM auto-initialization is enabled or disabled.
 * 
 * @returns {bool}
 * 
 * @example
 * ```gml
 * if (FirebaseCloudMessaging_IsAutoInitEnabled())
 * {
 *     FirebaseCloudMessaging_SetAutoInitEnabled(false);
 * }
 * ```
 * The code above checks if auto-initialization is enabled and if it is it disables it (using ${function.FirebaseCloudMessaging_SetAutoInitEnabled}).
 * @function_end
 */

/**
 * @func FirebaseCloudMessaging_SetAutoInitEnabled
 * @desc Enables or disables auto-initialization of Firebase Cloud Messaging.
 * 
 * When enabled, Firebase Cloud Messaging generates a registration token on app startup if there is no valid one (see ${function.FirebaseCloudMessaging_GetToken}) and periodically sends data to the Firebase backend to validate the token. This setting is persistent across app restarts.
 * 
 * [[Note: By default, Firebase Cloud Messaging auto-initialization is enabled.]]
 * 
 * @param {boolean} enabled Whether auto-initialization should be turned on or off.
 * 
 * @example
 * ```gml
 * if (FirebaseCloudMessaging_IsAutoInitEnabled())
 * {
 *     FirebaseCloudMessaging_SetAutoInitEnabled(false);
 * }
 * ```
 * The code above checks if auto-initialization is enabled (using the ${function.FirebaseCloudMessaging_IsAutoInitEnabled} function) and if it is disables it.
 * @function_end
 */

/**
 * @func FirebaseCloudMessaging_SubscribeToTopic
 * @desc Subscribes the user to the given topic in the background. The subscription operation is persistent and will keep retrying until it is successful. This uses the FCM registration token to identify the app instance, generating one if it does not exist (see ${function.FirebaseCloudMessaging_GetToken}), which periodically sends data to the Firebase backend when auto-init is enabled. To delete the data, delete the token (see ${function.FirebaseCloudMessaging_DeleteToken}).
 * @param {string} topic The name of the topic to subscribe to.
 * 
 * @event social
 * @desc 
 * @member {string} type The constant `"FirebaseCloudMessaging_SubscribeToTopic"`
 * @member {boolean} success Whether or not the function task succeeded.
 * @member {string} value The name of topic subscription requested.
 * @event_end
 * 
 * @example
 * ```gml
 * FirebaseCloudMessaging_SubscribeToTopic("my_awesome_topic");
 * ```
 * In the code above we request a subscription to a topic (`"my_awesome topic"`). The function callback can be caught inside a ${event.social}.
 * ```gml
 * if(async_load[?"type"] == "FirebaseCloudMessaging_SubscribeToTopic")
 * {
 *     var _topic = async_load[? "topic"];
 * 
 *     if(async_load[?"success"])
 *     {
 *         show_debug_message("Subscription to " + _topic + " SUCCEEDED");
 *     }
 *     else
 *     {
 *         show_debug_message("Subscription to " + _topic + " FAILED");
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, and if the tasks succeeds it stores the topic value in a local variable (`_topic`) and logs the success of the operation.
 * @function_end
 */

/**
 * @func FirebaseCloudMessaging_UnsubscribeFromTopic
 * @desc Unsubscribes from a previously subscribed topic (see ${function.FirebaseCloudMessaging_SubscribeToTopic}) in the background. The unsubscribe operation is persistent and will keep retrying until it is completed.
 * 
 * @param {string} topic The name of the topic to unsubscribe from.
 * 
 * @event social
 * @desc 
 * @member {string} type The constant `"FirebaseCloudMessaging_UnsubscribeFromTopic"`
 * @member {boolean} success Whether or not the function task succeeded.
 * @member {string} value The name of topic subscription requested.
 * @event_end
 * 
 * @example
 * ```gml
 * FirebaseCloudMessaging_UnsubscribeFromTopic("my_awesome_topic");
 * ```
 * In the code above we request for the subscription to the topic `"my_awesome topic"` to be canceled. The function callback can be caught inside a ${event.social}.
 * 
 * ```gml
 * if(async_load[?"type"] == "FirebaseCloudMessaging_UnsubscribeFromTopic")
 * {
 *     var _topic = async_load[? "topic"];
 * 
 *     if(async_load[?"success"])
 *     {
 *         show_debug_message("Subscription removed successfully");
 *     }
 *     else
 *     {
 *         show_debug_message("Subscription could not be removed");
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, and if the tasks succeeds it stores the topic value in a local variable (`_topic`) and logs the success of the operation.
 * @function_end
 */
