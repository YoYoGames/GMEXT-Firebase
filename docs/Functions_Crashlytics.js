/**
 * @function FirebaseCrashlytics_Crash
 * @desc This function throws an error that crashes the app and creates a fatal report to be sent to Crashlytics server. A crash created using this function can be tracked during the next application execution using the method ${function.FirebaseCrashlytics_DidCrashOnPreviousExecution}.
 * 
 * [[Warning: This function needs to be called at least once to enable Crashlytics for the first time.]]
 * 
 * @param {string} errorMessage The error message to report (this will be a **fatal** report).
 * 
 * @example
 * ```gml
 * FirebaseCrashlytics_Crash("Test Crash");
 * ```
 * The code above logs a **fatal error** report to the Crashlytics server. Another way to deal with error reporting would be to call the ${function.exception_unhandled_handler} function and override the default error handling function with the example below.
 * 
 * ```gml
 * exception_unhandled_handler(function(_exception) {
 *     var _info = json_stringify(_exception);
 * 
 *     FirebaseCrashlytics_Crash(_info);
 *     show_debug_message(_info);
 * });
 * ```
 * The code above catches all the exceptions and trigger a **fatal error** report with the information from the exception converted to a string (using the function ${function.json_stringify}) and will also print the same information to the debug console.
 * @function_end
 */

/**
 * @func FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check
 * @desc This function returns whether automatic data collection is enabled or not. The function uses two ways to check whether automatic data collection is enabled, in order of priority:
 * 
 * * If ${function.FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set} was called, uses its value.
 * * If the `FirebaseCrashlyticsCollectionEnabled` key is in your app's `Info.plist`, uses that.
 * 
 * [[Warning: This function is only available on **iOS** targets.]]
 * 
 * @returns {bool}
 * @example
 * ```gml
 * if (FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check())
 * {
 *     FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set(false);
 * }
 * ```
 * The code above checks if Crashlytics automatic data collection is enabled and if so it will disable it (using the function ${function.FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set}).
 * @function_end
 */

/**
 * @func FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set
 * @desc This function is used to enable or disable the automatic data collection configuration for Crashlytics. If this is set, it overrides any automatic data collection settings configured in the extension options as well as any Firebase-wide settings.
 * 
 * If automatic data collection is disabled for Crashlytics, crash reports are stored on the device. To check for unsent reports, use the ${function.FirebaseCrashlytics_UnsentReports_Check} function. Use ${function.FirebaseCrashlytics_UnsentReports_Send} to upload existing reports when automatic data collection is disabled. Use ${function.FirebaseCrashlytics_UnsentReports_Delete} to delete any reports stored on the device without sending them to Crashlytics.
 * 
 * @param {boolean} enabled Whether to enable automatic data collection.
 * 
 * @example
 * ```gml
 * if (FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check())
 * {
 *     FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set(false);
 * }
 * ```
 * The code above checks if automatic data collection is enabled (using ${function.FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check}) and if so it will disable it.
 * @function_end
 */

/**
 * @func FirebaseCrashlytics_Log
 * @desc This function logs a message that is included in the next fatal or non-fatal report. Logs are visible in the session view on the Firebase Crashlytics console. Newline characters are stripped and extremely long messages are truncated. The maximum log size is 64k. If exceeded, the log rolls such that messages are removed, starting from the oldest.
 * 
 * @param {string} message The message to be logged.
 * 
 * @example
 * ```gml
 * FirebaseCrashlytics_Log("Entered the " + room_get_name(room) + " room");
 * ```
 * The code example above will log a message that will be included in the next report; this might be useful for identifying the source of the error within the game (e.g. in the example above we log the name of the current room so we know which room the error originated in).
 * @function_end
 */

/**
 * @func FirebaseCrashlytics_RecordException
 * @desc Records a non-fatal report to send to Crashlytics. Non-fatal reports are manually thrown by the developer and may not represent crashes that occurred during code execution.
 * 
 * @param {string} errorMessage Error message to include in the report.
 * 
 * @example
 * ```gml
 * switch (characterClass)
 * {
 *     case "hero":
 *         // Do something
 *         break;
 * 
 *     case "enemy":
 *         // Do something else
 *         break;
 * 
 *     default:
 *         // There are no more classes, so we shouldn't be hitting this line
 *         FirebaseCrashlytics_RecordException("characterClass has an unknown value of :" + characterClass);
 *         break;
 * }
 * ```
 * In the code above we have a switch statement where the variable (`characterClass`) is expected to only be equal to either `"hero"` or `"enemy"`. If it happens to be none of these then we might want to report this even though it's not a fatal error.
 * @function_end
 */

/**
 * @func FirebaseCrashlytics_SetCustomKey
 * @desc This function sets a custom key-value pair that is associated with subsequent fatal and non-fatal reports. Calling this function with an existing key will simply update the value for that key. The value of any key at the time of a fatal or non-fatal event is associated with that event. Keys and associated values are visible in the session view on the Firebase Crashlytics console.
 * 
 * Crashlytics supports a maximum of 64 key/value pairs. New keys beyond that limit are ignored. Keys or values that exceed 1024 characters are truncated.
 * 
 * @param {string} key A unique key.
 * @param {real|string} value The value to be associated with the given key.
 * 
 * @example
 * ```gml
 * FirebaseCrashlytics_SetCustomKey("level", room_get_name(room));
 * ```
 * The code above sets the custom key `"level"` to be included in subsequent reports, which can help the developer know which room caused a certain crash.
 * @function_end
 */

/**
 * @func FirebaseCrashlytics_SetUserIdentifier
 * @desc This function records a user ID (identifier) that is associated with subsequent fatal and non-fatal reports. The user ID is visible in the session view on the Firebase Crashlytics console. Identifiers longer than 1024 characters will be truncated.
 * 
 * @param {string} identifier A unique identifier for the current user.
 * 
 * @example
 * ```gml
 * FirebaseCrashlytics_SetUserIdentifier("MyUser1234567");
 * ```
 * The code above will add additional user information to the any subsequent reports.
 * @function_end
 */

/**
 * @func FirebaseCrashlytics_UnsentReports_Check
 * @desc This function checks the device for any fatal or non-fatal crash reports that haven't yet been sent to Crashlytics. If automatic data collection is enabled, then reports are uploaded automatically and this always returns false in its Async event. If automatic data collection is disabled, this function can be used to check whether the user opted in to send crash reports from their device.
 * 
 * [[Warning: If there are any unsent reports, this function will only (asynchronously) return `true` for the first time it is called in each game execution.]]
 * 
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseCrashlytics_UnsentReports_Check"`
 * @member {boolean} value Whether or not there are unsent reports.
 * @event_end
 * 
 * @example
 * ```gml
 * FirebaseCrashlytics_UnsentReports_Check();
 * ```
 * In the code above we are checking for collected unsent reports. The function callback can be caught inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseCrashlytics_UnsentReports_Check")
 * {
 *     if (async_load[? "value"])
 *     {
 *         FirebaseCrashlytics_UnsentReports_Send();
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, and if there are unsent reports we proceed to send them to the Crashlytics servers (using the function ${function.FirebaseCrashlytics_UnsentReports_Send}).
 * @function_end
 */

/**
 * @func FirebaseCrashlytics_UnsentReports_Delete
 * @desc If automatic data collection is disabled, this function queues up any unsent reports on the device for deletion. Otherwise, it does nothing.
 * 
 * @example
 * ```gml
 * if (async_load[? "type"] == "FirebaseCrashlytics_UnsentReports_Check")
 * {
 *     if (async_load[? "value"])
 *     {
 *         FirebaseCrashlytics_UnsentReports_Delete();
 *     }
 * }
 * ```
 * The code above exists in the ${event.social} as a callback for the ${function.FirebaseCrashlytics_UnsentReports_Check} function, and checks if there are any unsent reports on the device; in that case, it deletes them.
 * @function_end
 */

/**
 * @func FirebaseCrashlytics_UnsentReports_Send
 * @desc If automatic data collection is disabled, this function queues up any unsent reports on the device to be sent to Crashlytics. Otherwise, it does nothing.
 * 
 * @example
 * ```gml
 * if (async_load[? "type"] == "FirebaseCrashlytics_UnsentReports_Check")
 * {
 *     if (async_load[? "value"])
 *     {
 *         FirebaseCrashlytics_UnsentReports_Send();
 *     }
 * }
 * ```
 * The code above exists in the ${event.social} as a callback for the ${function.FirebaseCrashlytics_UnsentReports_Check} function, and checks if there are any unsent reports on the device; in that case, it proceeds to send them to the Crashlytics server.
 * @function_end
 */

/**
 * @func FirebaseCrashlytics_DidCrashOnPreviousExecution
 * @desc This function returns whether the app crashed during its previous run (any errors handled by the ${function.FirebaseCrashlytics_Crash} function are considered to be crashes by this function).
 * 
 * @returns {boolean}
 * @example
 * ```gml
 * if (FirebaseCrashlytics_DidCrashOnPreviousExecution())
 * {
 *      FirebaseCrashlytics_UnsentReports_Send();
 * }
 * ```
 * The code above checks if the application crashed on its previous execution and in that case, sends all the unsent reports to the Crashlytics servers (using the function ${function.FirebaseCrashlytics_UnsentReports_Send}).
 * @function_end
 */
