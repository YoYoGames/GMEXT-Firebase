/**
 * @function FirebaseRemoteConfig_FetchAndActivate
 * @desc This function asynchronously fetches and then activates the fetched configs. If the time elapsed since the last fetch from the Firebase Remote Config backend is more than the set minimum fetch interval, configs are fetched from the backend. After the fetch is complete, the configs are activated so that the fetched key-value pairs take effect.
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseRemoteConfig_FetchAndActivate"`
 * @member {boolean} success Whether or not the function task succeeded.
 * @event_end
 * 
 * @example
 * ```gml
 * FirebaseRemoteConfig_FetchAndActivate();
 * ```
 * In the code above we are fetching and activating the Remote Config data from the Firebase servers. The function callback can be caught inside a ${event.social}.
 * 
 * ```gml
 * if (async_load[? "type"] == "FirebaseRemoteConfig_FetchAndActivate")
 * {
 *     if (async_load[? "success"])
 *     {
 *         var _keysJSON = FirebaseRemoteConfig_GetKeys();
 *         var _keys = json_parse(_keysJSON);
 *         var _count = array_length(_keys);
 *         show_debug_message("Remote Config Data:");
 * 
 *         for(var i = 0 ; i < _count; i++)
 *         {
 *             var _key = _keys[i];
 *             show_debug_message("key: " + FirebaseRemoteConfig_GetString(_key));
 *         }
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, and if the function task succeeded it gets all keys (using the function ${function.FirebaseRemoteConfig_GetKeys}) that are afterwards parsed into an array (using the ${function.json_parse} function). Finally it gets all their values as strings (using ${function.FirebaseRemoteConfig_GetString} and logs them to the console.
 * @function_end
 */

/**
 * @func FirebaseRemoteConfig_GetDouble
 * @desc This function returns the parameter value for the given key as a real. It evaluates the value of the parameter in the following order:
 * 
 * 1. The activated value, if the last successful ${function.FirebaseRemoteConfig_FetchAndActivate} contained the key.
 * 2. The default value, if the key was set with ${function.FirebaseRemoteConfig_SetDefaultsAsync}.
 * 3. The default real value: `0` (zero).
 * 
 * @param {string} key The key of the remote config parameter to get the value from.
 * 
 * @example
 * ```gml
 * var _magicNumber = FirebaseRemoteConfig_GetDouble("MagicNumber");
 * ```
 * The code above reads the **double** value parameter for the key `"MagicNumber"` that is stored in the Remote Config Extension map.
 * @function_end
 */

/**
 * @func FirebaseRemoteConfig_GetKeys
 * @desc Returns a JSON formatted string of all the available keys.
 * 
 * @returns {string}
 * @example
 * ```gml
 * var _keysJSON = FirebaseRemoteConfig_GetKeys();
 * var _keys = json_parse(_keysJSON);
 * var _count = array_length(_keys);
 * show_debug_message("Remote Config Data:");
 * 
 * for(var i = 0 ; i < _count; i++)
 * {
 *      var _key = _keys[i];
 *      show_debug_message("key: " + FirebaseRemoteConfig_GetString(_key)));
 * }
 * ```
 * The code above gets all keys (using the function ${function.FirebaseRemoteConfig_GetKeys}) that are afterwards parsed into an array (using the ${function.json_parse} function). Finally it gets all their values as strings (using ${function.FirebaseRemoteConfig_GetString} and logs them to the console.
 * @function_end
 */

/**
 * @func FirebaseRemoteConfig_GetString
 * @desc This function returns the parameter value for the given key as a string. It evaluates the value of the parameter in the following order:
 * 
 * 1. The activated value, if the last successful ${function.FirebaseRemoteConfig_FetchAndActivate} contained the key.
 * 2. The default value, if the key was set with ${function.FirebaseRemoteConfig_SetDefaultsAsync}.
 * 3. The default string value: `""` (empty string).
 * 
 * @param {string} key The key of the remote config parameter to get the value from.
 * 
 * @returns {string}
 * @example
 * ```gml
 * var _configuration = FirebaseRemoteConfig_GetString("Configuration");
 * ```
 * The code above reads the **string** value parameter for the key `"Configuration"` that is stored in the Remote Config Extension map.
 * @function_end
 */

/**
 * @func FirebaseRemoteConfig_Initialize
 * @desc This function initializes the Firebase Remote Config extension and sets the minimum interval between successive fetch calls. Any fetches performed within the interval of the last fetch will use values returned during that fetch.
 * 
 * [[Note: The default fetch interval is 3600 seconds.]]
 * 
 * @param {real} fetchInterval The minimum fetch Interval duration in seconds.
 * 
 * @example
 * ```gml
 * FirebaseRemoteConfig_Initialize(1000);
 * ```
  The code above initializes the Firebase Remote Config extension and sets the fetch interval to `1000` seconds.
 * @function_end
 */

/**
 * @func FirebaseRemoteConfig_Reset
 * @desc This function deletes all activated, fetched and defaults configs and resets all Firebase Remote Config settings.
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseRemoteConfig_Reset"`
 * @member {boolean} success Whether or not the function task succeeded.
 * @event_end
 * 
 * @example
 * ```gml
 * FirebaseRemoteConfig_Reset();
 * ```
 * In the code above we request for the reset of the Remote Config value. The function callback can be caught inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseRemoteConfig_Reset")
 * {
 *     if (async_load[? "success"])
 *     {
 *         show_debug_message("FirebaseRemoteConfig_Reset() SUCCEEDED");
 *     }
 *     else
 *     {
 *         show_debug_message("FirebaseRemoteConfig_Reset() FAILED");
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, and logs the success of the operation.
 * @function_end
 */

/**
 * @func FirebaseRemoteConfig_SetDefaultsAsync
 * @desc This function asynchronously sets the default configs using the given JSON formatted string with a set of key-value pairs. Contained values can only be strings or reals.
 * 
 * @param {string} jsonString The JSON formatted representation of a struct with default key/value pairs.
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseRemoteConfig_SetDefaultsAsync"`
 * @member {boolean} success Whether or not the function task succeeded.
 * @event_end
 * 
 * @example
 * ```gml
 * var _jsonData = { name: "John", age: 10 };
 * FirebaseRemoteConfig_SetDefaultsAsync(json_stringify(_jsonData));
 * 
 * ```
 * In the code above we request to set the default values for the parameters inside the struct (`_jsonData`) the struct is then converted to JSON formatted string (using the built-in function ${function.json_stringify}). The function callback can be caught inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseRemoteConfig_SetDefaultsAsync")
 * {
 *     if (async_load[? "success"])
 *     {
 *         show_debug_message("Default values were set successfully!");
 *     }
 *     else
 *     {
 *         show_debug_message("Default values failed to be set!");
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, and logs the success of the operation.
 * @function_end
 */

/**
 * @function FirebaseRemoteConfig_AddOnConfigUpdateListener
 * @desc This function starts listening for real-time config updates from the Remote Config backend and automatically fetches updates from the RC backend when they are available.
 * 
 * [[Note: This function is only available on Android and iOS.]]
 * 
 * @event social
 * @member {string} type The string `"FirebaseRemoteConfig_AddOnConfigUpdateListener"`
 * @member {string} keys An JSON-encoded array of strings
 * @member {boolean} success Whether successful
 * @event_end
 * 
 * @example
 * ```gml
 * /// Create Event
 * if(os_type == os_android or os_type == os_ios)
 * {
 *     FirebaseRemoteConfig_AddOnConfigUpdateListener();
 * }
 * ```
 * In the ${event.create}, the function is called if ${var.os_type} is either `os_android` or `os_ios`.
 * ```gml
 * /// Async Social Event
 * switch(async_load[?"type"])
 * {
 *     // @triggered by FirebaseRemoteConfig_FetchAndActivate()
 *     case "FirebaseRemoteConfig_AddOnConfigUpdateListener":
 *         if(async_load[?"success"])
 *         {
 *             var _arr_strings = json_parse(async_load[?"keys"]);
 *             array_foreach(_arr_strings, show_debug_message);
 *         }
 *         break;
 *     
 *     // Other cases..
 * }
 * ```
 * In the ${event.social}, the event type is checked. The `"FirebaseRemoteConfig_AddOnConfigUpdateListener"` event type indicates a config update.
 * If the update is successful, the `"keys"` value is parsed using ${function.json_parse} and the value of each string in the resulting array is output in a debug message (going through all items using ${function.array_foreach}).
 * @function_end
 */