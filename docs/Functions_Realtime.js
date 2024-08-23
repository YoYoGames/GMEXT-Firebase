/**
 * @function FirebaseRealTime
 * @desc This function is the entry point for database interactions using the Firebase Realtime Database extension.  It returns a **&lt; *dbEntryRef** &gt;* that can be further modified and configured using chained methods.
 * 
 * [[Note: The Firebase Realtime Database implements a fluent-API meaning almost all functions return **self** allowing them to be chained and for you to build complex database interactions while keeping the code clean and easy to follow. Entries in the database are structs and are referred to in this documentation as *dbEntryRef::* ** These, under the hood, are structs that point to a specific path in the database (they are NOT the actual entry).]]
 * 
 * @param {string} [database] Overwrite the default database
 * 
 * @returns {struct.dbEntryRef}
 * @example
 * ```gml
 * // 1) This will use the default database
 * FirebaseRealTime().Path("players/hero/hp").Set(100);
 * 
 * // 2) This will use a custom database url
 * FirebaseRealTime(dbUrl).Path("players/hero/hp").Set(100);
 * ```
 * Above we have two database interaction examples. In the first one we create a reference to a database entry (`"players/hero/hp"`, using the chained method ${function.dbEntryRef::Path} and afterwards we set that entry to the value `100` (using the method ${function.dbEntryRef::Set}). The second example is very similar but we pass in a specific database URL (`dbUrl`) to the main function call; this is very powerful and allows the developer to have access as many different databases as needed.
 * @function_end
 */

/**
 * @func dbEntryRef::Listener
 * @desc The method listens for changes to a given entry in the database. If you need to stop listening to changes you can use ${function.dbEntryRef::ListenerRemove} for a specific database reference or ${function.dbEntryRef::ListenerRemoveAll} to remove all listeners.
 * 
 * [[Warning: When you no longer need to listen to changes make sure to remove the listeners, as not doing so can lead to memory leaks.]]
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseRealTime_Listener"`
 * @member {real} listener The asynchronous listener ID.
 * @member {string} path The path of the database reference.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {real|string|struct} [value] The new value of the entry
 * @member {string} [errorMessage] The readable error message
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseRealTime("players/hero").Listener();
 * ```
 * The code above starts listening for updates on the database entry (`"player/hero"`). If this reference gets updated, set or deleted an async event will be triggered. The function call will return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * 
 * ```gml
 * if (async_load[? "type"] == "FirebaseRealTime_Listener")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("Changes were made to this entry");
 *     }
 *     else
 *     {
 *         var _errorMessage = async_load[? "errorMessage"];
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type** and logs when changes are made to the database reference being listened to.
 * @function_end
 */

/**
 * @func dbEntryRef::Exists
 * @desc This method checks if a reference exists on the database and returns a listener identifier for tracking purposes.
 * 
 * @returns {real}
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseRealTime_Exists"`
 * @member {real} listener The asynchronous listener ID.
 * @member {string} path The path of the database reference.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {boolean} [values] Whether or not the database path exists.
 * @member {string} [errorMessage] The readable error message.
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseRealTime().Path("myCollection/oldDoc").Exists();
 * ```
 * In the code above we first get the reference to a database path (`"myCollection/oldDoc"`, using the function ${function.dbEntryRef::Path}) and check if that entry exists in our database. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * 
 * ```gml
 * if (async_load[? "type"] == "FirebaseRealTime_Exists")
 * {
 *     if (async_load[? "status"] == 200 && async_load[? "values"])
 *     {
 *         show_debug_message("Database entry exists.");
 *     }
 *     else
 *     {
 *         var _errorMessage = async_load[?"errorMessage"];
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, providing a success message if the entry exists in the database.
 *
 * @function_end
 */

/**
 * @func dbEntryRef::Delete
 * @desc This method deletes a reference on the database and returns a listener identifier for tracking purposes.
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseRealTime_Delete"`
 * @member {real} listener The asynchronous listener ID.
 * @member {string} path The path of the database reference.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [errorMessage] The readable error message
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseRealTime().Path("myCollection/oldDoc").Delete();
 * ```
 * In the code above we first get the reference to a database path (`"myCollection/oldDoc"`, using the method ${function.dbEntryRef::Path}) and then delete that entry. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * 
 * ```gml
 * if (async_load[? "type"] == "FirebaseRealTime_Delete")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("Database entry was successfully deleted.");
 *     }
 *     else
 *     {
 *         var _errorMessage = async_load[?"errorMessage"];
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, providing a success message if **status** is valid.
 * @function_end
 */

/**
 * @func dbEntryRef::ListenerRemove
 * @desc This method removes a previously created listener (that was created using the function ${function.dbEntryRef::Listener}).
 * 
 * [[Tip: If you wish to remove all created listeners use the function ${function.dbEntryRef::ListenerRemoveAll} instead.]]
 * 
 * @param {real} listenerId The listener Id to be removed.
 * 
 * @example
 * ```gml
 * listenerId = FirebaseRealTime("players/hero").Listener();
 * 
 * // Some time later
 * 
 * FirebaseRealTime().ListenerRemove(listenerId);
 * 
 * ```
 * The code sample above starts by creating a listener to a database entry reference (using the ${function.dbEntryRef::Listener} method). This function returns a listener ID (`listenerId`) and at a later stage we use that ID to remove the listener.
 * @function_end
 */

/**
 * @func dbEntryRef::ListenerRemoveAll
 * @desc This method removes all previously created listeners (that were created using the function ${function.dbEntryRef::Listener}).
 * 
 * [[tip: If you wish to remove a specific listener use the ${function.dbEntryRef::ListenerRemove} instead.]]
 * 
 * @example
 * ```gml
 * listenerId1 = FirebaseRealTime().Path("players/hero").Listener();
 * listenerId2 = FirebaseRealTime().Path("players/knight").Listener();
 * 
 * // Some time later
 * FirebaseRealTime().ListenerRemoveAll();
 * ```
  The code above creates two listeners (using the ${function.dbEntryRef::Listener} function) on different database entries (using the ${function.dbEntryRef::Path} method) and after some time it removes them all.
 * @function_end
 */

/**
 * @func dbEntryRef::Path
 * @desc This method attaches a path reference to the current database's **&lt;dbEntryRef&gt;**.
 * 
 * [[Note: Paths are a representation of references in the database (i.e.: the path to get `"Opera X YoYoGames"` is `"Testing/String"`).]]
 * 
 * ![](assets/realtimeNode.png)
 * 
 * @param {string} path The path reference to the database entry.
 * 
 * @returns {struct.dbEntryRef}
 * @example
 * ```gml
 * FirebaseRealTime().Path("Testing/String").Read();
 * ```
 * The code above first creates the reference to a database entry (`"Testing/String"`) and then reads that entry (using the ${function.dbEntryRef::Read} method).
 * @function_end
 */

/**
 * @func dbEntryRef::Child
 * @desc This method appends the given relatives path to the current path of a Realtime Database &lt;dbEntryRef&gt; struct.
 * 
 * @param {string} path Relative child path
 * 
 * @returns {struct.dbEntryRef}
 * @example
 * ```gml
 * var _parentNode = "characters/player";
 * var _nodeRef = FirebaseRealTime().Path(_parentNode).Child("health");
 * ```
 * The code sample above will create a &lt;dbNodeRef&gt; to the `"characters/player"` path (using the ${function.dbEntryRef::Path} method) and afterwards append the relative path `"health"` to it, meaning the resulting reference (`nodeRef`) now points to the `"characters/player/health"` path.
 * @function_end
 */

/**
 * @func dbEntryRef::Parent
 * @desc This method goes up the hierarchy to the parent path of the current &lt;dbEntryRef&gt; struct.
 * 
 * @returns {struct.dbEntryRef}
 * @example
 * ```gml
 * var _dbPath = "players/hero/name";
 * var _dbEntryRef = FirebaseRealTime().Path(dbPath).Parent().Child("magic").Set(99);
 * ```
 * The code above creates a &lt;dbEntryRef&gt; to the `"players/hero/name"` path (using the ${function.dbEntryRef::Path} function) and afterwards goes up to the parent path meaning the resulting reference (`dbEntryRef`) now points to the `"players/hero"` path. We then go into the child database entry (using the ${function.dbEntryRef::Child} method) and finally set this new reference (`"players/hero/magic"`) to the value `99` (using the ${function.dbEntryRef::Set} method).
 * @function_end
 */

/**
 * @func dbEntryRef::Push
 * @desc This method is useful for storing arrays inside the database. Database elements can be of type **string** , **real** or **struct** , meaning that arrays are not a valid type within a Firebase Realtime Database. This method attaches an auto-generated child location to the current database entry reference.
 * 
 * In this image below we can see the auto-generated keys in &quot;Testing/List&quot;.
 * 
 * ![](assets/realtimePush.png)
 * 
 * @returns {struct.dbEntryRef}
 * @example
 * ```gml
 * var _data = { health: 100, magic: 99 };
 * var _jsonData = json_stringify(_data);
 * 
 * FirebaseRealTime().Path("Enemies/List").Push().Set(_jsonData);
 * ```
 * The code above first creates the reference to a database entry (`"Enemies/List"`, using the ${function.dbEntryRef::Path} method) and then pushes a new auto-generated key into that reference (this is what emulates arrays/collections). Finally it sets that database entry with the previously created data (using the ${function.dbEntryRef::Set} method).
 * @function_end
 */

/**
 * @func dbEntryRef::Read
 * @desc This method reads the current database reference and returns a listener identifier.
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseRealTime_Read"`
 * @member {real} listener The asynchronous listener ID.
 * @member {string} path The path of the database reference.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {real|string|struct} [value] The value being read
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseRealTime().Path("players/hero").Read();
 * ```
 * The code above first gets the reference to a database entry (`"players/hero"`, using the ${function.dbEntryRef::Path} method) and then reads that entry. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseRealTime_Read")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("The entry data is: " + async_load[? "value"]);
 *     }
 *     else
 *     {
 *         var _errorMessage = async_load[?"errorMessage"];
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, providing the document **data** if the task succeeded.
 * @function_end
 */

/**
 * @func dbEntryRef::Set
 * @desc This method creates or overwrites a database entry value of type  **real** ,  **string** , or **struct** (arrays are not a valid type) and returns a listener ID to be used for tracking purposes.
 * 
 * [[Tip: It's also possible to add a time-stamp value to the database entry if you set it to `{ .sv: "timestamp" }` (example below).]]
 * 
 * @param {real|string|struct} value The data to be set within the current database entry.
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseRealTime_Set"`
 * @member {real} listener The asynchronous listener ID.
 * @member {string} path The path of the database reference.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * // (1) Set value using a real
 * listenerId = FirebaseRealTime().Path("enemies/bat/health").Set(999);
 * 
 * // (2) Set value using a string
 * listenerId = FirebaseRealTime().Path("enemies/bat/name").Set("Monster");
 * 
 * // (3) Set value using a struct
 * var _data = { health: 100, magic: 99 };
 * listenerId = FirebaseRealTime().Path("enemies/bat").Set(_data);
 * 
 * // (4) Time stamps
 * var _data = {};
 * _data[$ ".sv"] = "timestamp";
 * listenerId = FirebaseRealTime().Path("enemies/bat/timestamp").Set(_data);
 * ```
 * The code sample above provides three example for setting values in a database entry using a **real** , a **string** and a **struct** (a **timestamp** example is also provided). The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseRealTime_Set")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message(".Set() function call succeeded!");
 *     }
 *     else
 *     {
 *         var _errorMessage = async_load[? "errorMessage"];
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type** and logs the success of the task.
 * @function_end
 */

/**
 * @func dbEntryRef::LimitToFirst
 * @desc This function is a filter that should be used when performing a ${function.dbEntryRef::Read} operation or creating ${function.dbEntryRef::Listener} that is ordered in some way (see ${function.dbEntryRef::OrderByChild}, ${function.dbEntryRef::OrderByKey} and ${function.dbEntryRef::OrderByValue}). The filter assures that the returned results stop after the first `amount` elements.
 * 
 * [[info: This method will filter elements from the start of the ordered group; if you want to read from the end, use ${function.dbEntryRef::LimitToLast} instead.]]
 * 
 * @param {real} amount The number of results to read (from the start)
 * 
 * @returns {struct.dbEntryRef}
 * @example
 * ```gml
 * listenerId = FirebaseRealTime().Path("players/healthList").OrderByValue().LimitToFirst(5).Read();
 * ```
 * The code above performs a read operation (using the ${function.dbEntryRef::Read} method) on the database reference `"players/healthList"` (using the ${function.dbEntryRef::Path} method) ordered by the value (using the ${function.dbEntryRef::OrderByValue} method), returning only the first `5` results.
 * @function_end
 */

/**
 * @func dbEntryRef::OrderByChild
 * @desc This method should be used when performing a ${function.dbEntryRef::Read} operation or creating a ${function.dbEntryRef::Listener}, and orders the returned results by a child field `path` so they can be then filtered using one of the filtering methods (see ${function.dbEntryRef::StartAt}, ${function.dbEntryRef::EndAt}, ${function.dbEntryRef::EqualTo}, ${function.dbEntryRef::LimitToFirst} and${function.dbEntryRef::LimitToLast}).
 * 
 * [[Note: The final result from the `Read()` call will not be sorted; the sort order is only used by any filter methods chained after this.]]
 * 
 * @param {real} path The path to the specified field to sort the values by.
 * 
 * @returns {struct.dbEntryRef}
 * @example
 * ```gml
 * listenerId = FirebaseRealTime().Path("enemies").OrderByChild("points").LimitToLast(5).Read();
 * ```
 * The code above performs a read operation (using the ${function.dbEntryRef::Read} method) on the database reference `"enemies"` (using the ${function.dbEntryRef::Path} method) ordered by the children `"points"`, returning only the last `5` results (using the${function.dbEntryRef::LimitToLast} method).
 * @function_end
 */

/**
 * @func dbEntryRef::EqualTo
 * @desc This function is a filter that should be used when performing a ${function.dbEntryRef::Read} operation or creating ${function.dbEntryRef::Listener} that is ordered in some way (see ${function.dbEntryRef::OrderByChild}, ${function.dbEntryRef::OrderByKey} and ${function.dbEntryRef::OrderByValue}). The filter assures that the returned results have a specific value.
 * 
 * @param {real|string} value The value to equal to.
 * 
 * @returns {struct.dbEntryRef}
 * @example
 * ```gml
 * listenerId = FirebaseRealTime().Path("players/healthList").OrderByValue().EqualTo(77).Read();
 * ```
 * The code above performs a read operation (using the ${function.dbEntryRef::Read} method) on the database reference `"players/healthList"` (using the ${function.dbEntryRef::Path} method) ordered by the value (using the ${function.dbEntryRef::OrderByValue} method), returning only values that are equal to `77`.
 * @function_end
 */

/**
 * @func dbEntryRef::StartAt
 * @desc This function is a filter that should be used when performing a ${function.dbEntryRef::Read} operation or creating a ${function.dbEntryRef::Listener} that is ordered in some way (see ${function.dbEntryRef::OrderByChild}, ${function.dbEntryRef::OrderByKey} and ${function.dbEntryRef::OrderByValue}). The filter assures that the returned results start at a specific value.
 * 
 * @param {real|string} value The value to start the query at.
 * 
 * @returns {struct.dbEntryRef}
 * @example
 * ```gml
 * listenerId = FirebaseRealTime().Path("players/healthList").OrderByValue().StartAt(10).Read();
 * ```
 * The code above performs a read operation (using the ${function.dbEntryRef::Read} method) on the database reference `"players/healthList"` (using the ${function.dbEntryRef::Path} method) ordered by the value (using the ${function.dbEntryRef::OrderByValue} method), returning only those values that are above or equal to `10`.
 * @function_end
 */

/**
 * @func dbEntryRef::EndAt
 * @desc This function is a filter that should be used when performing a ${function.dbEntryRef::Read} operation or creating ${function.dbEntryRef::Listener} that is ordered in some way (see ${function.dbEntryRef::OrderByChild}, ${function.dbEntryRef::OrderByKey} and ${function.dbEntryRef::OrderByValue}). The filter assures that the returned results stop at a specific value.
 * 
 * @param {real|string} value The value to stop the query at.
 * 
 * @returns {struct.dbEntryRef}
 * @example
 * ```gml
 * listenerId = FirebaseRealTime().Path("players/healthList").OrderByValue().EndAt(99).Read();
 * ```
 * The code above performs a read operation (using the ${function.dbEntryRef::Read} method) on the database reference `"players/healthList"` (using the ${function.dbEntryRef::Path} method) ordered by the value (using the ${function.dbEntryRef::OrderByValue} method), returning only values below or equal to `99`.
 * @function_end
 */

/**
 * @func dbEntryRef::LimitToLast
 * @desc This function is a filter that should be used when performing a ${function.dbEntryRef::Read} operation or creating ${function.dbEntryRef::Listener} that is ordered in some way (see ${function.dbEntryRef::OrderByChild}, ${function.dbEntryRef::OrderByKey} and ${function.dbEntryRef::OrderByValue}). The filter assures that the returned results are the last `amount` of elements.
 * 
 * [[Info: This method will filter elements from the end of the ordered group; if you want to read from the start, use ${function.dbEntryRef::LimitToFirst} instead.]]
 * 
 * @param {real} amount The number of results to read (from the end)
 * 
 * @returns {struct.dbEntryRef}
 * @example
 * ```gml
 * listenerId = FirebaseRealTime().Path("players/healthList").OrderByValue().LimitToLast(5).Read();
 * ```
 * The code above performs a read operation (using the ${function.dbEntryRef::Read} method) on the database reference `"players/healthList"` (using the ${function.dbEntryRef::Path} method) ordered by the value (using the ${function.dbEntryRef::OrderByValue} method), returning only the last `5` results.
 * @function_end
 */

/**
 * @func dbEntryRef::OrderByKey
 * @desc This method should be used when performing a ${function.dbEntryRef::Read} operation or creating a ${function.dbEntryRef::Listener}, and orders the returned results by key so they can be then filtered using one of the filtering methods (see ${function.dbEntryRef::StartAt}, ${function.dbEntryRef::EndAt}, ${function.dbEntryRef::EqualTo}, ${function.dbEntryRef::LimitToFirst} and${function.dbEntryRef::LimitToLast}).
 * 
 * [[Note: The final result from the `Read()` call will not be sorted; the sort order is only used by any filter methods chained after this.]]
 * 
 * @returns {struct.dbEntryRef}
 * @example
 * ```gml
 * listenerId = FirebaseRealTime().Path("enemies/names").OrderByKey().LimitToFirst(5).Read();
 * ```
 * The code above performs a read operation (using the ${function.dbEntryRef::Read} method) on the database reference `"enemies/names"` (using the ${function.dbEntryRef::Path} method) ordering the results by key and returning only the first `5` elements (using the ${function.dbEntryRef::LimitToFirst} method).
 * @function_end
 */

/**
 * @func dbEntryRef::OrderByValue
 * @desc This method should be used when performing a ${function.dbEntryRef::Read} operation or creating a ${function.dbEntryRef::Listener}, and orders the returned results by value so they can be then filtered using one of the filtering methods (see ${function.dbEntryRef::StartAt}, ${function.dbEntryRef::EndAt}, ${function.dbEntryRef::EqualTo}, ${function.dbEntryRef::LimitToFirst} and${function.dbEntryRef::LimitToLast}).
 * 
 * [[Note: The final result from the `Read()` call will not be sorted; the sort order is only used by any filter methods chained after this.]]
 * 
 * @returns {struct.dbEntryRef}
 * @example
 * ```gml
 * listenerId = FirebaseRealTime().Path("enemies/names").OrderByValue().LimitToFirst(5).Read();
 * ```
 * The code above performs a read operation (using the ${function.dbEntryRef::Read} method) on the database reference `"enemies/names"` (using the ${function.dbEntryRef::Path} method) ordering the results by value and returning only the first `5` elements (using the ${function.dbEntryRef::LimitToFirst} method).
 * @function_end
 */

/**
 * @struct dbEntryRef
 * 
 * 
 * @struct_end
 */
