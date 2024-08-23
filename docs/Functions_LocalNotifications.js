/**
 * @module local_notifications
 * @title Local Notifications
 * 
 * @section_func
 * @ref LocalPushNotification_Create
 * @ref LocalPushNotification_Cancel
 * @ref LocalPushNotification_iOS_Permission_Request
 * @ref LocalPushNotification_iOS_Permission_Status
 * @ref LocalPushNotification_Create_With_Icon
 * @section_end
 * 
 * @section_const
 * @ref LocalPushNotification_iOS_Permission
 * @section_end
 * 
 * @module_end
 */

// Functions

/**
 * @function LocalPushNotification_Create
 * @desc This function creates a local push notification to be delivered some time in the future.
 * 
 * @param {string} uid The ID of the notification
 * @param {real} seconds The number of seconds after which to display the notification
 * @param {string} title The notification title
 * @param {string} message The notification message
 * @param {string} data The notification data
 * 
 * @returns {real}
 * 
 * @event push_notification
 * @desc This event is triggered when the push notification is shown.
 * @member {string} type The string `"Notification_Local"`
 * @member {string} id The unique ID of the notification
 * @member {string} title The notification title
 * @member {string} message The notification message
 * @member {string} data The notification data
 * @event_end
 * 
 * @example
 * ```gml
 * /// Create Event
 * LocalPushNotification_Create("notification", 10, "Title", "This is a notification!", "data_goes_here");
 * ```
 * In the Create event a local push notification is created. The notification is shown after 10 seconds.
 * ```gml
 * /// Async Push Notification Event
 * if(async_load[? "type"] == "Notification_Local")
 * {
 *     // At this point a notification has been fired.
 *     // We are now able to access all its parameters.
 *     show_debug_message("notification_id: " + async_load[? "id"]);
 *     show_debug_message("notification_title: " + async_load[? "title"]);
 *     show_debug_message("notification_message: " + async_load[? "message"]);
 *     show_debug_message("notification_data: " + async_load[? "data"]);
 * }
 * ```
 * When the notification is shown the ${event.push_notification} is also triggered. The details of the notification can be retrieved from the ${var.async_load} variable.
 * @func_end
 */

/**
 * @function LocalPushNotification_Cancel
 * @desc This function cancels the previously created local notification with the given unique ID.
 * 
 * @param {string} uid The unique ID of the local notification
 * 
 * @example
 * ```gml
 * LocalPushNotification_Cancel(uid);
 * ```
 * @func_end
 */

/**
 * @function LocalPushNotification_iOS_Permission_Request
 * @desc This function requests permissions for sending local push notifications on iOS.
 * 
 * @returns {real}
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"LocalPushNotification_iOS_Permission_Request"`
 * @member {bool} success Whether the request was successful
 * @member {bool} value Whether the permission was granted (`true`) or denied (`false`)
 * @event_end
 * 
 * @example
 * ```gml
 * /// Create Event
 * iOS_permission_status = LocalPushNotification_iOS_Permission_Status_NotDetermined;
 * if(os_type == os_ios)
 * {
 *     LocalPushNotification_iOS_Permission_Request();
 * }
 * ```
 * In the Create event a request to obtain permissions on iOS is made.
 * ```gml
 * /// Async Social Event
 * switch(async_load[? "type"])
 * {
 *     // @triggered by LocalPushNotification_iOS_Permission_Request()
 *     case "LocalPushNotification_iOS_Permission_Request":
 * 
 *         // Early exit if the request was not successful
 *         if (!async_load[?"success"]) break;
 *         
 *         // The 'value' key contains either the value: 0 - Permission was denied; 1 - Permission was granted
 *         if(async_load[?"value"])
 *         {
 *             // At this point we know we have been authorized to deliver notifications to the user.
 *             iOS_permission_status = LocalPushNotification_iOS_Permission_Status_Authorized;
 *         }
 *         else
 *         {
 *             // At this point we know we have been denied to deliver notifications to the user.
 *             iOS_permission_status = LocalPushNotification_iOS_Permission_Status_Denied;
 *         }
 *         break;
 *     
 *     // Other cases...
 * }
 * ```
 * In the Async Social event the event type is checked. A type of `"LocalPushNotification_iOS_Permission_Request"` indicates a response to the earlier request.
 * If the request was unsuccesful, further code execution is stopped. If it was successful, the corresponding value of ${constant.LocalPushNotification_iOS_Permission} is assigned to the variable `iOS_permission_status`.
 * @func_end
 */

/**
 * @function LocalPushNotification_iOS_Permission_Status
 * @desc This function requests the current permission status regarding local push notifications on iOS.
 * 
 * @returns {real}
 * 
 * @event social
 * @member {string} type The string `"LocalPushNotification_iOS_Permission_Status"`
 * @member {constant.LocalPushNotification_iOS_Permission} value The status of the permission
 * @event_end
 * 
 * @example
 * ```gml
 * /// Create Event
 * iOS_permission_status = LocalPushNotification_iOS_Permission_Status_NotDetermined;
 * if(os_type == os_ios)
 * {
 *     LocalPushNotification_iOS_Permission_Status();
 * }
 * ```
 * In the Create event a variable is first set to store the permission status on iOS. It is assigned the constant `LocalPushNotification_iOS_Permission_Status_NotDetermined` to indicate that the status hasn't been determined yet.
 * In case the ${var.os_type} equals `os_ios`, an asynchronous request is made to retrieve the permission.
 * ```gml
 * /// Async Social Event
 * switch(async_load[? "type"])
 * {
 *     // @triggered by LocalPushNotification_iOS_Permission_Status()
 *     case "LocalPushNotification_iOS_Permission_Status":
 *         iOS_permission_status =  async_load[? "value"];
 *         switch(iOS_permission_status)
 *         {
 *             case LocalPushNotification_iOS_Permission_Status_Authorized:
 *                 // At this point we know we have been authorized to deliver notifications to the user.
 *                 break;
 *             case LocalPushNotification_iOS_Permission_Status_Denied:
 *                 // At this point we know we have been denided to deliver notifications to the user.
 *                 break;
 *             case LocalPushNotification_iOS_Permission_Status_NotDetermined:
 *                 // At this point we know we haven't requested for permissions just yet
 *                 // We use this logic to request for the permission the function below doesn't return
 *                 // any value but triggers an Async Push Notification Event of the same 'type' value.
 *                 LocalPushNotification_iOS_Permission_Request();
 *                 break;
 *         }
 * 
 *     // Other cases ...
 * ```
 * In the Async Social event the event type is checked. When it is the string `"LocalPushNotification_iOS_Permission_Status"` this means it's a response to the request sent earlier.
 * ${var.async_load}'s `value` member is then assigned to `iOS_permission_status` and the value is then checked. If the permission status is still undetermined, a request for permissions is sent using ${function.LocalPushNotification_iOS_Permission_Request}.
 * @func_end
 */

/**
 * @function LocalPushNotification_Create_With_Icon
 * @desc This function creates a local push notification which can have an icon image on it.
 * 
 * The function allows you to provide a custom icon image to display on the notification.
 * You can save any sprite from GameMaker to a PNG file using the ${function.sprite_save} function and pass the resulting file as the `filename` parameter.
 * 
 * [[Note: This function can only be used on Android.]]
 * 
 * @param {string} uid The ID of the notification
 * @param {real} seconds The number of seconds after which to display the notification
 * @param {string} title The notification title
 * @param {string} message The notification message
 * @param {string} data Extra data to include with the notification (can be retrieved in the ${var.async_load} in the async event)
 * @param {string} filename The path to a custom icon image to display on the notification
 * 
 * @returns {real}
 * 
 * @event push_notification
 * @desc This event is triggered when the push notification is shown.
 * @member {string} type The string `"Notification_Local"`
 * @member {string} id The unique ID of the notification
 * @member {string} title The notification title
 * @member {string} message The notification message
 * @member {string} data The notification data
 * @event_end
 * 
 * @example
 * ```gml
 * /// Create Event
 * icon_sprite = sprite_duplicate(spr_notification);
 * sprite_save(icon_sprite, 0, "icon.png");
 * sprite_delete(icon_sprite);
 * LocalPushNotification_Create_With_Icon("notification", 10, "Title", "This is a notification!", "data_goes_here", "icon.png");
 * ```
 * In the Create event a local push notification is created. The notification is shown after 10 seconds.
 * ```gml
 * /// Async Push Notification Event
 * if(async_load[? "type"] == "Notification_Local")
 * {
 *     // At this point a notification has been fired.
 *     // We are now able to access all its parameters.
 *     show_debug_message("notification_id: " + async_load[? "id"]);
 *     show_debug_message("notification_title: " + async_load[? "title"]);
 *     show_debug_message("notification_message: " + async_load[? "message"]);
 *     show_debug_message("notification_data: " + async_load[? "data"]);
 * }
 * ```
 * When the notification is shown the ${event.push_notification} is also triggered. The details of the notification can be retrieved from the ${var.async_load} variable.
 * @func_end
 */

// Constants

/**
 * @constant LocalPushNotification_iOS_Permission
 * @desc This set of constants holds the possible values for the permission on iOS.
 * @member LocalPushNotification_iOS_Permission_Status_Authorized Authorized to deliver notifications to the user
 * @member LocalPushNotification_iOS_Permission_Status_Denied Denied authorization to deliver notifications to the user
 * @member LocalPushNotification_iOS_Permission_Status_NotDetermined Not determined if we're autorized to deliver notifications. The request for the permission still needs to be made.
 * @constant_end
 */
