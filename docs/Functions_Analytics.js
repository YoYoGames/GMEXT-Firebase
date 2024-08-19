
/**
 * @function FirebaseAnalytics_LogEvent
 * @desc This function logs an app event. The event can have up to 25 parameters. Note that events with the same name must have the same parameters. Up to 500 event names are supported. Using predefined [FirebaseAnalytics.Event](https://firebase.google.com/docs/reference/android/com/google/firebase/analytics/FirebaseAnalytics.Event) and/or [FirebaseAnalytics.Param](https://firebase.google.com/docs/reference/android/com/google/firebase/analytics/FirebaseAnalytics.Param) is recommended for optimal reporting.
 * 
 * @param {string} event The event data (available [events](https://firebase.google.com/docs/reference/android/com/google/firebase/analytics/FirebaseAnalytics.Event) reference)
 * @param {string} params The data as a **JSON formatted** string (available [params](https://firebase.google.com/docs/reference/android/com/google/firebase/analytics/FirebaseAnalytics.Param) reference)
 * 
 * @example
 * ```gml
 * var _data = { screen_name : room_get_name(room) };
 * 
 * FirebaseAnalytics_LogEvent("screen_view", json_stringify(_data));
 * ```
 * In the code sample above we will submit a log to the event `"screen_view"` (see [event](https://firebase.google.com/docs/reference/android/com/google/firebase/analytics/FirebaseAnalytics.Event#SCREEN_VIEW) details), so first create a data struct with a parameter named `"screen_name"` (this is one of the allowed parameters) and convert it to a string using the ${function.json_stringify} function.
 * 
 * @function_end
 */

/**
 * @func FirebaseAnalytics_ResetAnalyticsData
 * @desc This function clears all analytics data for the app from the current device and resets the app instance ID.
 * 
 * [[Note: This will not clear analytics previously collected by the app that have already been pushed to the server.]]
 * 
 * @example
 * ```gml
 * if (global.stopDataCollection)
 * {
 *     FirebaseAnalytics_ResetAnalyticsData();
 *     FirebaseAnalytics_SetAnalyticsCollectionEnabled(false);
 * }
 * ```
 * The code above will check if a global variable is set to true (`global.stopDataCollection`) and if so we will clear the local collected data for this extension and disable the analytics data collection (using the function [FirebaseAnalytics_SetAnalyticsCollectionEnabled](#FirebaseAnalytics_SetAnalyticsCollectionEnabled)).
 * @function_end
 */

/**
 * @func FirebaseAnalytics_SetAnalyticsCollectionEnabled
 * @desc This function is used to enable or disable analytics collection for the app on the current device. This setting is persisted across app sessions. By default it is enabled.
 * 
 * @param {boolean} enable Whether or not analytics collection should be enabled.
 * 
 * @example
 * ```gml
 * if (global.stopDataCollection)
 * {
 *     FirebaseAnalytics_ResetAnalyticsData();
 *     FirebaseAnalytics_SetAnalyticsCollectionEnabled(false);
 * }
 * ```
 * The code above will check if a global variable is set to true and if so we will clear the local collected data (using the function [FirebaseAnalytics_ResetAnalyticsData](#FirebaseAnalytics_ResetAnalyticsData)) for this extension and disable the analytics data collection.
 * @function_end
 */

/**
 * @func FirebaseAnalytics_SetDefaultEventParameters
 * @desc This function sets &quot;default&quot; parameters that will be provided with every event logged from the SDK, including automatic ones. The values passed in the parameters bundle will be added to the map of default event parameters. These parameters persist across app runs. They are of lower precedence than event parameters, so if an event parameter and a parameter set using this function have the same name, the value of the event parameter will be used. The same limitations on event parameters apply to default event parameters.
 * 
 * @param {string} parameters A **JSON** **formatted** string of a struct to be added to **every** event. These parameters will be added to the default event parameters, replacing any existing parameter with the same name. Valid parameter values are **string** and **double** . Setting a key's value to `pointer_null` will clear that parameter.
 * 
 * @example
 * ```gml
 * var _parameters = {
 *     playerName: "Hero",
 *     bossName: pointer_null,
 * };
 * 
 * FirebaseAnalytics_SetDefaultEventParameters(json_stringify(_parameters));
 * ```
 * With the code above we are setting the default parameters to be used on all further calls to [FirebaseAnalytics_LogEvent](#FirebaseAnalytics_LogEvent). First we create a struct (`parameters`) with a `"playerName"` and `"bossName"` keys, the boss name is set to `pointer_null` meaning it will be removed from the set of default event parameters.
 * @function_end
 */

/**
 * @func FirebaseAnalytics_SetSessionTimeoutDuration
 * @desc This function sets the duration of inactivity (in milliseconds) that terminates the current session. The default value is 1800000 (30 minutes).
 * 
 * @param {real} milliseconds Session timeout duration in milliseconds.
 * 
 * @example
 * ```gml
 * FirebaseAnalytics_SetSessionTimeoutDuration(3600000); //1 hour
 * ```
 * The code above sets the timeout duration to 1 hour, meaning that if no events are logged within this timeout the session will be terminated.
 * @function_end
 */

/**
 * @func FirebaseAnalytics_SetUserId
 * @desc This function sets the user ID property. This feature must be used in accordance with [Google's Privacy Policy](https://www.google.com/policies/privacy).
 * 
 * @param {string} userID The user ID string  to assign to the user of this app on this device, which must be non-empty and no more than 256 characters long. Setting the ID to `pointer_null` removes the user ID.
 * 
 * @example
 * ```gml
 * FirebaseAnalytics_SetUserId("myUser123");
 * ```
 * The above code will set the user ID to the string `"myUser123"`.
 * @function_end
 */

/**
 * @func FirebaseAnalytics_SetUserProperty
 * @desc This function sets a user property to the given value. Up to 25 user property names are supported. Once set, user property values persist throughout the app life cycle and across sessions.
 * 
 * @param {string} key The name of the user property to set. Should contain 1 to 24 **alphanumeric**  characters or underscores and must start with an **alphabetic** character.<br> <br> [[Warning: The `"firebase_"`, `"google_"` and `"ga_"` prefixes are reserved and should not be used for user property names]].
 * @param {string} value The value of the user property. Values can be up to 36 characters long. Setting the value to `pointer_null` removes the user property.
 * 
 * @example
 * ```gml
 * FirebaseAnalytics_SetUserProperty("location", "UK");
 * ```
 * The code above will set a user property `"location"` to the value `"UK"`.
 * @function_end
 */
