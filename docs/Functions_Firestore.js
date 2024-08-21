/**
 * @function dbReference::Child
 * @desc The method appends the given relative path to the current path of a ${struct.dbReference}.
 * 
 * @param {string} path The relative child path.
 * 
 * @returns {struct.dbReference}
 * @example
 * ```gml
 * var _rootPath = "database";
 * var _dbReference = FirebaseFirestore(_rootPath).Child("players/hero");
 * ```
  The code sample above will create a &lt;dbReference&gt; to the `"database"` path and afterwards appends the relative path `"player/hero"` to it, meaning the resulting reference (`dbReference`) now points to the `"database/player/hero"` path.
 * @function_end
 */

/**
 * @func dbReference::Delete
 * @desc This method deletes the current document reference and returns a listener identifier.
 * 
 * [[Warning: This function will only work on dbDocuments; if you pass in a dbCollection it won't be deleted.]]
 * 
 * @returns {real}
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseFirestore_Document_Delete"`
 * @member {real} listener The asynchronous listener ID.
 * @member {bool} path The path of the database reference.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseFirestore("myCollection/oldDoc").Delete();
 * ```
 * In the code above we first get the reference to a database path (`"myCollection/oldDoc"`) and then delete that entry. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * 
 * ```gml
 * if (async_load[? "type"] == "FirebaseFirestore_Document_Delete")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("Document was deleted successfully.");
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
 * @func FirebaseFirestore
 * @desc This function is the entry point for database interactions using the Firebase Firestore extension.  It returns a ${struct.dbReference} that can further be modified and configured using chained methods.
 * 
 * [[Note: Firebase Firestore implements a fluent-API meaning almost all functions return **self** allowing them to be chained and for you to build complex database interactions while keeping the code clean and easy to follow. Entries in the database are structs and are referred as *&lt; **dbReference* &gt;** in this documentation (they can be either a &lt;dbDocument&gt; or a &lt;dbCollection&gt; depending on the path). These, under the hood, are structs that point to a specific path in the database (they are NOT the actual entry).]]
 * 
 * @param {string} [path] The path reference to document or collection
 * 
 * @returns {struct.dbReference}
 * @example
 * ```gml
 * var _data = { name: "Hero", level: 99 };
 * var _json = json_stringify(_data);
 * FirebaseFirestore("playersCollection/heroDocument").Set(_json);
 * ```
 * The code sample above will create a data structure (`_data`) that will be stored inside the database. This data needs to be converted to string using the ${function.json_stringify} function. Afterwards it creates a &lt;dbReference&gt; to the path `"playersCollection/heroDocument"` and calls the ${function.dbReference::Set} method on it (setting the database path to the specified value).
 * @function_end
 */

/**
 * @func dbReference::Listener
 * @desc The method listens for changes to a given document in the database. If you need to stop listening to changes you can use ${function.dbReference::ListenerRemove} for a specific database reference or ${function.dbReference::ListenerRemoveAll} to remove all listeners.
 * 
 * [[Warning: When you no longer need to listen to changes make sure to remove the listeners; not doing so can lead to memory leaks.]]
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseFirestore_Document_Listener"` or `"FirebaseFirestore_Collection_Listener"`
 * @member {real} listener The asynchronous listener ID.
 * @member {string} path The path of the database reference.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} value A JSON formatted string of either a **struct** (document) or **array** (collection)
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseFirestore("myCollection/newDoc").Listener();
 * ```
 * The code above starts listening for updates on the document (`"myCollection/newDoc"`). If this reference gets updated, set or deleted an Async event will be triggered. The function call will return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * 
 * ```gml
 * if (async_load[? "type"] == "FirebaseFirestore_Document_Listener")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("Changes were made to this document");
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
 * @func dbReference::ListenerRemove
 * @desc This function removes a previously created listener (that was created using the function ${function.dbReference::Listener}).
 * 
 * [[Tip: If you wish to remove all created listeners use the function ${function.dbReference::ListenerRemoveAll} instead.]]
 * 
 * @param {real} listenerId The listener ID to be removed.
 * 
 * @example
 * ```gml
 * listenerId = FirebaseFirestore("myCollection/myDoc").Listener();
 * 
 * // Some time later
 * FirebaseFirestore().ListenerRemove(listenerId);
 * ```
 * The code sample above starts by creating a listener to a database reference path (using the ${function.dbReference::Listener} function) which returns a listener ID (`listenerId`); at a later stage it removes that listener.
 * @function_end
 */

/**
 * @func dbReference::ListenerRemoveAll
 * @desc This function removes all previously created listeners (that were created using the function ${function.dbReference::Listener}).
 * 
 * [[Tip: If you wish to remove a specific listener use the function ${function.dbReference::ListenerRemove} instead.]]
 * 
 * @example
 * ```gml
 * listenerId1 = FirebaseFirestore("myCollection/myDoc").Listener();
 * listenerId2 = FirebaseFirestore("myCollection/otherDoc").Listener();
 * listenerId3 = FirebaseFirestore("myCollection").Listener();
 * 
 * // Some time later
 * FirebaseFirestore().ListenerRemoveAll();
 * ```
 * The code above creates three listeners (using the ${function.dbReference::Listener} function) and after some time it removes them all.
 * @function_end
 */

/**
 * @func dbReference::Parent
 * @desc This method goes up the hierarchy to the parent path of the current &lt;dbReference&gt; struct.
 * 
 * @returns {struct.dbReference}
 * @example
 * ```gml
 * var _dbPath = "database/player/hero";
 * var _dbReference = FirebaseFirestore(_dbPath).Parent();
 * ```
 * The code above creates a &lt;dbReference&gt; to the `"database/player/hero"` path and afterwards goes up to the parent path meaning the resulting reference (`_dbReference`) now points to the `"database/player"` path.
 * @function_end
 */

/**
 * @func dbReference::Read
 * @desc This method reads the current database reference and returns a listener identifier.
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseFirestore_Document_Read"` or `"FirebaseFirestore_Collection_Read"`
 * @member {real} listener The asynchronous listener ID.
 * @member {string} path The path of the database reference.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} value A JSON formatted string of either a **struct** (document) or **array** (collection)
 * @member {string} [errorMessage] The readable error message
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseFirestore("myCollection/myDoc").Read();
 * ```
 * The code above first gets the reference to a database document (`"myCollection/oldDoc"`) and then reads that entry. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * 
 * ```gml
 * if (async_load[? "type"] == "FirebaseFirestore_Document_Read")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("Document data is: " + async_load[? "value"]);
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
 * @func dbReference::Set
 * @desc This method creates or overwrites a document on the database. If &lt;dbReference&gt; is a collection then a document will be automatically created with an auto-generated name. If you wish to update an existing document instead of replacing it use ${function.dbReference::Update} instead. This function returns a listener identifier.
 * 
 * @param {string} json A JSON formatted string to fill the document with.
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseFirestore_Document_Set"` or `"FirebaseFirestore_Collection_Add"`
 * @member {real} listener The asynchronous listener ID.
 * @member {string} path The path of the database reference.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [errorMessage] The readable error message
 * @event_end
 * 
 * @example
 * ```gml
 * var _json = json_stringify({ name: "Hero", level: 100 });
 * listenerId = FirebaseFirestore("myCollection/newDoc").Set(_json);
 * ```
 * The code above creates a JSON formatted string of a struct (using the ${function.json_stringify} function) and then sets the database document (`"myCollection/newDoc"`) to the new string. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseFirestore_Document_Set")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("Set() function call succeeded!");
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
 * @func dbReference::Update
 * @desc This method updates the given document on the database, without deleting any omitted keys. This function returns a listener identifier.
 * 
 * [[Note: This function will only work on dbDocuments; if you pass in a dbCollection it won't be updated.]]
 * 
 * @param {string} json A JSON formatted string to update the document with.
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseFirestore_Document_Update"`
 * @member {real} listener The asynchronous listener ID.
 * @member {string} path The path of the database reference.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * var _json = json_stringify({ level: 200 });
 * listenerId = FirebaseFirestore("myCollection/newDoc").Update(_json);
 * ```
 * The code above creates a JSON formatted string of a struct (using the ${function.json_stringify} function) and then updates the document (`"myCollection/newDoc"`) with the new key/value pairs (omitted keys will not be deleted). The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * 
 * ```gml
 * if (async_load[? "type"] == "FirebaseFirestore_Document_Update")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message(".Update() function call succeeded!");
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
 * @func dbReference::EndAt
 * @desc This method is a filter that should be used when performing a ${function.dbReference::Query} that is ordered by a specific field. The filter assures that the queried documents stop at a specific value (relative to the field specified in ${function.dbReference::OrderBy}).
 * 
 * @param {real|string} value The value to stop the query at.
 * 
 * @returns {struct.dbReference}
 * @example
 * ```gml
 * listenerId = FirebaseFirestore("myCollection").OrderBy("Points", "ASCENDING").EndAt(99).Query();
 * ```
 * The code above performs a query (using the ${function.dbReference::Query} function) on the database reference `"myCollection"` ordered by the `"Points"` field in an ascending order (using the ${function.dbReference::OrderBy} function) ending the query results when the `"Points"` reach the value `99`.
 * @function_end
 */

/**
 * @func dbReference::Limit
 * @desc This method is a filter that should be used when performing a ${function.dbReference::Query} that will limit the number of queried documents. 
 * 
 * @param {real} value The maximum number of documents to return.
 * 
 * @returns {struct.dbReference}
 * @example
 * ```gml
 * listenerId = FirebaseFirestore("myCollection").OrderBy("Points", "ASCENDING").Limit(10).Query();
 * ```
 * The code above performs a query (using the ${function.dbReference::Query} function) on the database reference `"myCollection"` ordered by the `"Points"` field in an ascending order (using the ${function.dbReference::OrderBy} function) and returns the first `10` elements.
 * @function_end
 */

/**
 * @func dbReference::OrderBy
 * @desc This method is a filter that should be used when performing a ${function.dbReference::Query} that will return documents ordered by a specific field.
 * 
 * [[Note: This function does not ensure that the data you receive from your query will be sorted, however any other filter functions being called after this will see the data sorted in the correct order. For example, if you call this function to sort a collection in an **ascending order** and then call `.Limit(5)`, you will get the first 5 items from that **sorted list** however those 5 items may not get to you in the same order.]]
 * 
 * @param {string} path The path to the field to be used for sorting/ordering
 * @param {string} direction The direction to order by `"ASCENDING"` or `"DESCENDING"`
 * 
 * @returns {struct.dbReference}
 * @example
 * ```gml
 * listenerId = FirebaseFirestore("myCollection").OrderBy("Points", "ASCENDING").Limit(10).Query();
 * ```
 * The code above performs a query (using the ${function.dbReference::Query} function) on the database reference `"myCollection"` ordered by the `"Points"` field in an ascending order and returns the first `10` elements (using the ${function.dbReference::Limit} function).
 * @function_end
 */

/**
 * @func dbReference::Query
 * @desc This method executes a query and returns a listener identifier.
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseFirestore_Collection_Query"`
 * @member {real} listener The asynchronous listener ID.
 * @member {string} path The path of the database reference.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} value A JSON formatted string of an **array**
 * @member {string} [errorMessage] The readable error message
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseFirestore("myCollection").OrderBy("Points", "ASCENDING").Limit(10).Query();
 * ```
 * The code above performs a query (using the ${function.dbReference::Query} function) on the database reference `"myCollection"` ordered by the `"Points"` field in an ascending order and returns the first `10` elements (using the ${function.dbReference::Limit} function). The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * 
 * ```gml
 * if (async_load[? "type"] == "FirebaseFirestore_Collection_Query")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message(async_load[? "value"]);
 *     }
 *     else
 *     {
 *         var _errorMessage = async_load[? "errorMessage"];
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type** and logs the results of the performed query.
 * @function_end
 */

/**
 * @func dbReference::StartAt
 * @desc This method is a filter that should be used when performing a ${function.dbReference::Query} that is ordered by a specific field. The filter assures that the queried documents start at a specific value (relative to the field specified in ${function.dbReference::OrderBy}).
 * 
 * @param {real|string} value The value to start the query at.
 * 
 * @returns {struct.dbReference}
 * @example
 * ```gml
 * listenerId = FirebaseFirestore("myCollection").OrderBy("Points", "ASCENDING").StartAt(10).Query();
 * ```
 * The code above performs a query (using the ${function.dbReference::Query} function) on the database reference `"myCollection"` ordered by the `"Points"` field in an ascending order (using the ${function.dbReference::OrderBy} function) starting the query results when the `"Points"` fields is higher then `10`.
 * @function_end
 */

/**
 * @func dbReference::Where
 * @desc This method is a filter that should be used when performing a ${function.dbReference::Query} and allows you to perform comparison operations on a field's values.
 * 
 * @param {string} path The path to field.
 * @param {string} operation Any one of the following operations (as strings): `"=="`,`"!="`,`""`,`">"`,`">="`,`"="`
 * @param {real|string} value The value used for the comparison.
 * 
 * @returns {struct.dbReference}
 * @example
 * ```gml
 * listenerId = FirebaseFirestore("myCollection").Where("Points", ">=", 1000).Query();
 * ```
 * The code above performs a query (using the ${function.dbReference::Query} function) on the database reference `"myCollection"` returning every element where the `"Points"` field is more than or equal to `1000`.
 * @function_end
 */

/**
 * @func dbReference::WhereEqual
 * @desc This method is a filter that can be used when performing a ${function.dbReference::Query} and selects elements where the field's `path` value is equal to `value`.
 * 
 * @param {string} path The path to field.
 * @param {real|string} value The value used for the comparison.
 * 
 * @returns {struct.dbReference}
 * @example
 * ```gml
 * listenerId = FirebaseFirestore("myCollection").WhereEqual("Points", 1000).Query();
 * ```
 * The code above performs a query (using the ${function.dbReference::Query} function) on the database reference `"myCollection"` returning every element where the `"Points"` field is equal to `1000`.
 * @function_end
 */

/**
 * @func dbReference::WhereGreaterThan
 * @desc This method is a filter that can be used when performing a ${function.dbReference::Query} and selects elements where the field's `path` value is greater than `value`.
 * 
 * @param {string} path The path to field.
 * @param {real|string} value The value used for the comparison.
 * 
 * @returns {struct.dbReference}
 * @example
 * ```gml
 * listenerId = FirebaseFirestore("myCollection").WhereGreaterThan("Points", 1000).Query();
 * ```
 * The code above performs a query (using the ${function.dbReference::Query} function) on the database reference `"myCollection"` returning every element where the `"Points"` field is greater than `1000`.
 * @function_end
 */

/**
 * @func dbReference::WhereGreaterThanOrEqual
 * @desc This method is a filter that can be used when performing a ${function.dbReference::Query} and selects elements where the field's `path` value is greater than or equal to `value`.
 * @param {string} path The path to field.
 * @param {real|string} value The value used for the comparison.
 * 
 * @returns {struct.dbReference}
 * @example
 * ```gml
 * listenerId = FirebaseFirestore("myCollection").WhereGreaterThanOrEqual("Points", 1000).Query();
 * ```
 * The code above performs a query (using the ${function.dbReference::Query} function) on the database reference `"myCollection"` returning every element where the `"Points"` field is greater than or equal to `1000`.
 * @function_end
 */

/**
 * @func dbReference::WhereLessThan
 * @desc This method is a filter that can be used when performing a ${function.dbReference::Query} and selects elements where the field's `path` value is less than `value`.
 * 
 * @param {string} path The path to field.
 * @param {real|string} value The value used for the comparison.
 * 
 * @returns {struct.dbReference}
 * @example
 * ```gml
 * listenerId = FirebaseFirestore("myCollection").WhereLessThan("Points", 1000).Query();
 * ```
 * The code above performs a query (using the ${function.dbReference::Query} function) on the database reference `"myCollection"` returning every element where the `"Points"` field is less than `1000`.
 * @function_end
 */

/**
 * @func dbReference::WhereLessThanOrEqual
 * @desc This method is a filter that can be used when performing a ${function.dbReference::Query} and selects elements where the field's `path` value is less than or equal to `value`.
 * 
 * @param {string} path The path to field.
 * @param {real|string} value The value used for the comparison.
 * 
 * @returns {struct.dbReference}
 * @example
 * ```gml
 * listenerId = FirebaseFirestore("myCollection").WhereLessThanOrEqual("Points", 1000).Query();
 * ```
 * The code above performs a query (using the ${function.dbReference::Query} function) on the database reference `"myCollection"` returning every element where the `"Points"` field is less than or equal to `1000`.
 * @function_end
 */

/**
 * @func dbReference::WhereNotEqual
 * @desc This method is a filter that can be used when performing a ${function.dbReference::Query} and selects elements where the field's `path` value is not equal to `value`.
 * 
 * @param {string} path The path to field.
 * @param {real|string} value The value used for the comparison.
 * 
 * @returns {struct.dbReference}
 * @example
 * ```gml
 * listenerId = FirebaseFirestore("myCollection").WhereNotEqual("Points", 1000).Query();
 * ```
 * The code above performs a query (using the ${function.dbReference::Query} function) on the database reference `"myCollection"` returning every element where the `"Points"` field is not equal to `1000`.
 * @function_end
 */

/**
 * @struct dbReference
 * @desc This struct is used by the Firestore functions. You use methods on it to build and refine the query.
 * 
 * See the examples included with the various functions.
 * 
 * @struct_end
 */
