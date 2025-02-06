// Functions

/**
 * @func FirebaseCloudFunctions_Call
 * @desc This function calls the cloud function with the given name and the given parameters.
 * 
 * @param {string} function The name of the function to call
 * @param {struct|array} params The parameters to pass to the function
 * @param {real} [timeout] An optional timeout value in seconds. Defaults to 0.
 * 
 * @event social
 * @desc Triggered on a successful function call:
 * @member {string} type The string `"FirebaseCloudFunctions_Call"`
 * @member {real} listener The async request ID
 * @member {real} status The status code of the call
 * @member {string} value The data returned by the function call
 * @event_end
 * 
 * @event social
 * @desc Triggered when an error occurred:
 * @member {string} type The string `"FirebaseCloudFunctions_Call"`
 * @member {real} listener The async request ID
 * @member {real} status The status code of the call
 * @member {string} errorMessage A message describing the error that occurred
 * @event_end
 * 
 * @example
 * ```gml
 * async_id = FirebaseCloudFunctions_Call("my_cloud_function", {text: "Hello!", number: 100});
 * ```
 * 
 * ```gml
 * /// Async Social Event
 * if (async_load[? "listener"] != async_id) { exit; }
 * 
 * if (!ds_map_exists(async_load, "value")) { exit; }
 * 
 * show_debug_message($"Result: {async_load[? "value"]}");
 * ```
 * 
 * @func_end
 */

// Modules

/**
 * @module cloud_functions
 * @title Cloud Functions Overview
 * @desc 
 * 
 * ![](assets/Cloud%20FunctionsBanner.png)
 * 
 * Cloud Functions for Firebase is a server-less framework that lets you automatically run backend code in response to events triggered by Firebase features and HTTPS requests. Your JavaScript or TypeScript code is stored in Google's cloud and runs in a managed environment, meaning there is no need to manage and scale your own servers.
 * Check the [official page](https://firebase.google.com/docs/functions) for more information.
 * 
 * @section Setup
 * @desc Before starting to use any Firebase extensions, you are required to follow some initial configuration steps. However unlike most of the modules this is purely server-side, as you will be creating JavaScript functions that you can later call using the ${function.http_request} function from inside your GameMaker project.
 * 
 * * ${page.guides_analytics#Create_Project}
 * * ${page.guides_cloud_storage#Firebase_Console}
 * * ${page.guides_cloud_storage#Platform_Setup}
 * 
 * @section_end
 * 
 * @section_func Functions
 * @desc These are the functions in this module:
 * @ref FirebaseCloudFunctions_Call
 * @section_end
 * 
 * @module_end
 */
