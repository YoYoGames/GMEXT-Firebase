
/**
 * @function FirebaseStorage_Cancel
 * 
 * This function is used to cancel an upload (see ${function.FirebaseStorage_Upload}) or download (see ${function.FirebaseStorage_Download}) process.
 * 
 * @param {real} listener The upload/download asynchronous listener
 * 
 * @example
 * ```gml
 * listener = FirebaseStorage_Upload(localfile, path);
 * 
 * // After some time
 * FirebaseStorage_Cancel(listener);
 * ```
  The code above will start a file upload to the given `path` (using the ${function.FirebaseStorage_Upload} function) and after a while cancel it.
 * @function_end
 */

/**
 * @func FirebaseStorage_Delete
 * @desc This function deletes a path in the Firebase Cloud Storage and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * @param {string} firebasePath The remote path on the Firebase Cloud Storage server
 * @param {string} [bucket] Other Firebase Storage bucket
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseStorage_Delete"`
 * @member {real} listener The asynchronous listener ID.
 * @member {string} path The remote path.
 * @member {bool} [success] Whether or not the download succeeded
 * @event_end
 * 
 * @example
 * ```gml
 * var _uid = FirebaseAuthentication_GetUID();
 * listenerId = FirebaseStorage_Delete("UserProfiles/" + _uid + "/img.png");
 * ```
 * The code above uses the user identifier (provided by the function `FirebaseAuthentication_GetUID()` from the Firebase Authentication extension) to create a remote path and then deletes a file in that path. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseStorage_Delete")
 * {
 *     if (async_load[? "success"])
 *     {
 *         show_debug_message("File was deleted");
 *     }
 *     else
 *     {
 *         show_debug_message("File could not be deleted");
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type** and logs whether the task was completed successfully or not.
 * @function_end
 */

/**
 * @func FirebaseStorage_Download
 * @desc This function is used to download files from a remote path and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * [[Warning: This function is not available on the Web target.]]
 * 
 * @param {string} localPath The local path where the files will be downloaded
 * @param {string} firebasePath The remote path on the Firebase Cloud Storage server
 * @param {string} [bucket] Other Firebase Storage bucket
 * 
 * @returns {real}
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseStorage_Download"`
 * @member {real} listener The asynchronous listener ID.
 * @member {string} path The remote file path.
 * @member {string} localPath The local file path.
 * @member {bool} [success] Whether or not the download succeeded (if finished)
 * @member {real} [transferred] Number of transferred bytes (if NOT finished)
 * @member {real} [total] Total number of bytes (if NOT finished)
 * @event_end
 * 
 * @example
 * ```gml
 * var _uid = FirebaseAuthentication_GetUID();
 * listenerId = FirebaseStorage_Download("profilePic.png", "UserProfiles/" + _uid + "/img.png");
 * ```
 * The code above uses the user identifier (provided by the function `FirebaseAuthentication_GetUID()` from the Firebase Authentication extension) to create a remote path string, then downloads a file from the server to a local path. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * 
 * ```gml
 * if (async_load[? "type"] == "FirebaseStorage_Download")
 * {
 *     if (ds_map_exists(async_load[? "success"]))
 *     {
 *         if (async_load[? "success"])
 *         {
 *             global.percent = 100;
 *             img = sprite_add(async_load[?"localPath"], 0, 0, 0, 0, 0);
 *             show_message_async("Download SUCCESS");
 *         }
 *         else
 *         {
 *             global.percent = 0;
 *             show_message_async("Download FAILED");
 *         }
 *     }
 *     else
 *     {
 *         global.percent = 100 * async_load[? "transferred"] / async_load[? "total"];
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type** and if the download has not finished yet (`"success"` key is not present) then calculates the download percentage and stores it inside a global variable (`global.percent`). When the download finishes it checks if it was a successful download and if so it adds the downloaded file as a sprite (using the ${function.sprite_add} function).
 * [[Note: Always remember to free sprites added this way when you no longer need them (using ${function.sprite_delete}), otherwise it can lead to memory leaks.]]
 * @function_end
 */

/**
 * @func FirebaseStorage_GetURL
 * @desc This function asynchronously retrieves a long lived download URL with a revocable token. This can be used to share the file with others, but can be revoked by the developer in the Firebase Console if desired.
 * 
 * @param {string} firebasePath The remote path on Firebase Cloud Storage server.
 * @param {string} [bucket] Other Firebase Storage bucket
 * 
 * @returns {real}
 * 
 * @event social
 * @member {string} type The constant `"FirebaseStorage_GetURL"`
 * @member {real} listener The asynchronous listener ID.
 * @member {string} path The remote file path.
 * @member {bool} success Whether or not the task succeeded
 * @member {string} [value] The URL of the file (if task succeeded)
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseStorage_GetURL(path);
 * ```
 * The code above tries to retrieve an URL from a remote path on the Firebase Cloud Storage server. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * 
 * ```gml
 * if (async_load[? "type"] == "FirebaseStorage_GetURL")
 * {
 *     if (async_load[? "success"])
 *     {
 *         show_debug_message(async_load[? "path"] + " URL: " + async_load[? "value"]);
 *     }
 *     else
 *     {
 *         show_debug_message("There was an error retrieving the URL");
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type** and if the task was successful it logs the retrieved URL for the specific path.
 * @function_end
 */

/**
 * @func FirebaseStorage_List
 * @desc This function queries the contents of a Firebase Cloud Storage path, if `pageToken` is provided the query will start after the page number provided. It also returns a listener identifier that can be used for tracking progress on the request.
 * 
 * @param {string} path The remote Firebase path to query
 * @param {real} maxResults The max number of results
 * @param {string} [pageToken] Token of the last request
 * @param {string} [bucket] Other Firebase Storage bucket
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseStorage_List"`
 * @member {real} listener The asynchronous listener ID.
 * @member {string} path The remote path.
 * @member {bool} success Whether or not the task succeeded
 * @member {string} [files] A JSON formatted string of an array of file paths.
 * @member {string} [folders] A JSON formatted string of an array of folder paths.
 * @member {real} pageToken The current query page.
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseStorage_List("/testing", 5);
 * ```
 * The code above queries for files and folders inside the path `"/testing"`, returning a maximum of `5` results. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseStorage_List")
 * {
 *     if (async_load[? "success"])
 *     {
 *         global.arrayOfFiles = json_parse(async_load[? "files"]);
 *         global.arrayOfFolders = json_parse(async_load[? "folders"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type** and if the task was successful it stores the files and folders paths parsed as arrays (using the ${function.json_parse} function) inside global variables (`global.arrayOfFiles` and `global.arrayOfFolders`).
 * @function_end
 */

/**
 * @func FirebaseStorage_ListAll
 * @desc This function queries all the contents of a Firebase Cloud Storage path and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * @param {string} path The remote Firebase path to query
 * @param {string} bucket Other Firebase Storage bucket
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseStorage_ListAll"`
 * @member {real} listener The asynchronous listener ID.
 * @member {string} path The remote path.
 * @member {bool} success Whether or not the task succeeded
 * @member {string} files A JSON formatted string of an array of file paths.
 * @member {string} folders A JSON formatted string of an array of folder paths.
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseStorage_ListAll("/testing");
 * ```
 * The code above queries for all files and folders inside the path `"/testing"`. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * 
 * ```gml
if (async_load[? "type"] == "FirebaseStorage_ListAll")
{
    if (async_load[? "success"])
    {
        global.arrayOfFiles = json_parse(async_load[? "files"]);
        global.arrayOfFolders = json_parse(async_load[? "folders"]);
    }
}
 * ```
 * The code above matches the response against the correct event **type** and if the task was successful it stores the files and folders paths parsed as arrays (using the ${function.json_parse} function) inside global variables (`global.arrayOfFiles` and `global.arrayOfFolders`).
 * @function_end
 */
