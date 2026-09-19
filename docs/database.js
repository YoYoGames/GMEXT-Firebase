/**
 * @function firebase_database_get_instance
 * @desc **Firebase C++ SDK:** [firebase::database::Database::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database#getinstance)
 *
 * This function returns a handle to the Realtime Database of the default Firebase App, creating it
 * on first use. The same handle comes back on every call, it lives as long as the game, and there is
 * nothing to release. Every reference starts from it: ${function.firebase_database_get_reference}
 * for the root, ${function.firebase_database_get_reference_at_path} for a location.
 *
 * The database's URL comes from the credential file, which carries it when the database existed
 * at the time the file was downloaded. A credential file older than the database, or a project with
 * several databases, needs ${function.firebase_database_get_instance_for_url} with the URL from
 * the console instead. It returns `0` when
 * ${function.firebase_app_initialize} has not succeeded, with ${function.firebase_last_error_code}
 * set to `FirebaseError.NotInitialized`.
 *
 * [[Note: The Realtime Database must be created in the Firebase console (Build > Realtime Database)
 * before the first request; see ${page.guides_realtime}.]]
 *
 * @returns {Real} The database handle, or `0` when the default app does not exist.
 *
 * @example
 * ```gml
 * // Create Event of a persistent controller
 * database = firebase_database_get_instance();
 * if (database == 0)
 * {
 *     show_debug_message("Realtime Database unavailable: " + firebase_last_error_message());
 *     exit;
 * }
 * firebase_database_set_persistence_enabled(database, true);
 * scores = firebase_database_get_reference_at_path(database, "scores");
 * ```
 * The above code takes the database once, turns on-disk persistence on before any reference
 * exists, and keeps a reference to the `scores` location for the rest of the game.
 * @function_end
 */

/**
 * @function firebase_database_get_instance_for_url
 * @desc **Firebase C++ SDK:** [firebase::database::Database::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database#getinstance_1)
 *
 * This function returns a handle to the Realtime Database at the given URL - the
 * `https://<name>.<region>.firebasedatabase.app` address the console shows - for a project whose
 * database is not the default one, or not in the default region. Each URL has its own instance;
 * the same URL returns the same handle.
 *
 * @param {String} url The database's URL.
 * @returns {Real} The database handle, or `0` when the default app does not exist or the instance could not be created.
 * @function_end
 */

/**
 * @function firebase_database_get_url
 * @desc **Firebase C++ SDK:** [firebase::database::Database::url](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database#url)
 *
 * This function returns the URL the database was created with - the one passed to
 * ${function.firebase_database_get_instance_for_url}, or an empty string for the default
 * database.
 *
 * @param {Real} db_ref The database handle from ${function.firebase_database_get_instance}.
 * @returns {String} The database URL, or an empty string for the default database or an invalid handle.
 * @function_end
 */

/**
 * @function firebase_database_get_reference
 * @desc **Firebase C++ SDK:** [firebase::database::Database::GetReference](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database#getreference)
 *
 * This function returns a reference to the root of the database, from which
 * ${function.firebase_database_ref_child} reaches any location and
 * ${function.firebase_database_ref_update_children} writes to several paths atomically. Release it
 * with ${function.firebase_database_ref_release}.
 *
 * @param {Real} db_ref The database handle from ${function.firebase_database_get_instance}.
 * @returns {Real} A reference handle to release with ${function.firebase_database_ref_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_get_reference_at_path
 * @desc **Firebase C++ SDK:** [firebase::database::Database::GetReference](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database#getreference_1)
 *
 * This function returns a reference to a location, from a slash-separated path from the root
 * (`"players/USER_123/score"`). Nothing is read; the reference is a name, and the location need not
 * exist. A malformed path gives a reference whose ${function.firebase_database_ref_is_valid} is
 * `false`. Release the handle with ${function.firebase_database_ref_release}.
 *
 * @param {Real} db_ref The database handle from ${function.firebase_database_get_instance}.
 * @param {String} path The location's path from the root.
 * @returns {Real} A reference handle to release with ${function.firebase_database_ref_release}, or `0` when the handle is not valid.
 *
 * @example
 * ```gml
 * var _score = firebase_database_get_reference_at_path(database, "players/" + firebase_auth_user_uid(user) + "/score");
 * firebase_database_ref_set_value(_score, 1250, function(_error_code, _error_message)
 * {
 *     show_debug_message(_error_code == FirebaseDatabaseError.None ? "Score saved" : _error_message);
 * });
 * firebase_database_ref_release(_score);
 * ```
 * The above code writes a number to the signed-in player's score location and releases the
 * reference as soon as the write has been started; the SDK holds its own copy.
 * @function_end
 */

/**
 * @function firebase_database_get_reference_from_url
 * @desc **Firebase C++ SDK:** [firebase::database::Database::GetReferenceFromUrl](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database#getreferencefromurl)
 *
 * This function returns a reference from a full URL - the database URL followed by the path, as
 * the console's data viewer shows it. The URL must belong to this database; another database's URL
 * gives a reference whose ${function.firebase_database_ref_is_valid} is `false`. Release the handle
 * with ${function.firebase_database_ref_release}.
 *
 * @param {Real} db_ref The database handle from ${function.firebase_database_get_instance}.
 * @param {String} url The location's full URL.
 * @returns {Real} A reference handle to release with ${function.firebase_database_ref_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_go_offline
 * @desc **Firebase C++ SDK:** [firebase::database::Database::GoOffline](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database#gooffline)
 *
 * This function closes the connection to the server and keeps it closed until
 * ${function.firebase_database_go_online}. Listeners keep firing for local writes, reads are
 * answered from what is cached, and writes queue up. It is the way to test the game's offline
 * behaviour, and the way to stop the connection while the game is in the background if you want
 * that. ${function.firebase_database_ref_go_offline} does the same from a reference.
 *
 * @param {Real} db_ref The database handle from ${function.firebase_database_get_instance}.
 * @returns {Bool} `true` when the call went through, `false` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_go_online
 * @desc **Firebase C++ SDK:** [firebase::database::Database::GoOnline](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database#goonline)
 *
 * This function reopens the connection after ${function.firebase_database_go_offline} and sends
 * the writes that queued up.
 *
 * @param {Real} db_ref The database handle from ${function.firebase_database_get_instance}.
 * @returns {Bool} `true` when the call went through, `false` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_purge_outstanding_writes
 * @desc **Firebase C++ SDK:** [firebase::database::Database::PurgeOutstandingWrites](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database#purgeoutstandingwrites)
 *
 * This function abandons every write that has not reached the server yet - queued sets and
 * updates, and queued disconnect actions alike. They are rolled back locally, so listeners may fire
 * with the values from before them, and they are never sent. The SDK otherwise sends queued writes
 * as soon as the connection allows, so this is for the case where a long offline session produced
 * writes the game no longer wants.
 *
 * @param {Real} db_ref The database handle from ${function.firebase_database_get_instance}.
 * @returns {Bool} `true` when the call went through, `false` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_set_persistence_enabled
 * @desc **Firebase C++ SDK:** [firebase::database::Database::set_persistence_enabled](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database#set_persistence_enabled)
 *
 * This function turns on-disk persistence on or off. Off (the default), the data the game has read
 * and the writes it has queued live in memory only and are lost when the game closes; on, they are
 * written to the device and are there again at the next start, even without a network. Call it
 * once, right after ${function.firebase_database_get_instance} and before any reference is
 * created; the SDK does not accept a change after that.
 *
 * @param {Real} db_ref The database handle from ${function.firebase_database_get_instance}.
 * @param {Bool} enabled `true` to persist to disk, `false` to keep everything in memory.
 * @returns {Bool} `true` when the call went through, `false` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_set_log_level
 * @desc **Firebase C++ SDK:** [firebase::database::Database::set_log_level](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database#set_log_level)
 *
 * This function sets how much the database instance logs to the platform's log, on top of the
 * SDK-wide filter of ${function.firebase_set_log_level} - a message shows only when both levels
 * let it through. The default is `FirebaseLogLevel.Info`. On Android it must be set before the
 * instance does anything else. A value outside ${constant.FirebaseLogLevel} is refused with
 * `FirebaseError.InvalidArgument` in ${function.firebase_last_error_code} and returns `false`.
 *
 * @param {Real} db_ref The database handle from ${function.firebase_database_get_instance}.
 * @param {Enum.FirebaseLogLevel} log_level The new level.
 * @returns {Bool} `true` when the call went through, `false` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_get_log_level
 * @desc **Firebase C++ SDK:** [firebase::database::Database::log_level](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database#log_level)
 *
 * This function returns the database instance's own log level.
 *
 * @param {Real} db_ref The database handle from ${function.firebase_database_get_instance}.
 * @returns {Enum.FirebaseLogLevel} The level, or `FirebaseLogLevel.Verbose` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_order_by_child
 * @desc **Firebase C++ SDK:** [firebase::database::Query::OrderByChild](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#orderbychild_1)
 *
 * This function starts a query over the children of the location that sorts the children by the value of the child at `path` inside each of them - `"score"` to rank players by score. A previous order directive is replaced. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 * Run it with ${function.firebase_database_query_get_value} or listen to it, and release it with
 * ${function.firebase_database_query_release}.
 *
 * @param {Real} ref A reference handle.
 * @param {String} path The relative path of the child to sort by.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 *
 * @example
 * ```gml
 * var _by_score = firebase_database_ref_order_by_child(scores, "score");
 * var _top = firebase_database_query_limit_to_last(_by_score, 10);
 * firebase_database_query_release(_by_score);
 *
 * firebase_database_query_get_value(_top, function(_error_code, _error_message, _snapshot)
 * {
 *     if (_error_code != FirebaseDatabaseError.None) return;
 *     var _children = firebase_database_snapshot_get_children(_snapshot);
 *     for (var _i = array_length(_children) - 1; _i >= 0; _i--)
 *     {
 *         var _entry = firebase_database_snapshot_get_value(_children[_i]);
 *         show_debug_message($"{_entry.user}: {_entry.score}");
 *         firebase_database_snapshot_release(_children[_i]);
 *     }
 *     firebase_database_snapshot_release(_snapshot);
 * });
 * firebase_database_query_release(_top);
 * ```
 * The above code fetches the ten highest scores: ordered by the `score` child ascending, limited
 * to the last ten, and printed from the end of the children array so the highest comes first. Each
 * child snapshot is released as it is read, then the query snapshot.
 * @function_end
 */

/**
 * @function firebase_database_ref_order_by_key
 * @desc **Firebase C++ SDK:** [firebase::database::Query::OrderByKey](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#orderbykey)
 *
 * This function starts a query over the children of the location that sorts the children by their keys - the order push IDs were created in. A previous order directive is replaced. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 * Run it with ${function.firebase_database_query_get_value} or listen to it, and release it with
 * ${function.firebase_database_query_release}.
 *
 * @param {Real} ref A reference handle.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_order_by_value
 * @desc **Firebase C++ SDK:** [firebase::database::Query::OrderByValue](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#orderbyvalue)
 *
 * This function starts a query over the children of the location that sorts the children by their own values, for a location whose children are plain numbers or strings. A previous order directive is replaced. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 * Run it with ${function.firebase_database_query_get_value} or listen to it, and release it with
 * ${function.firebase_database_query_release}.
 *
 * @param {Real} ref A reference handle.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_order_by_priority
 * @desc **Firebase C++ SDK:** [firebase::database::Query::OrderByPriority](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#orderbypriority)
 *
 * This function starts a query over the children of the location that sorts the children by their priority (${function.firebase_database_ref_set_priority}), which is also the order a query without an order directive uses. A previous order directive is replaced. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 * Run it with ${function.firebase_database_query_get_value} or listen to it, and release it with
 * ${function.firebase_database_query_release}.
 *
 * @param {Real} ref A reference handle.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_start_at
 * @desc **Firebase C++ SDK:** [firebase::database::Query::StartAt](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#startat)
 *
 * This function starts a query over the children of the location that keeps the children whose sort value - by the order directive, or the priority without one - is greater than or equal to `order_value`. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 * Run it with ${function.firebase_database_query_get_value} or listen to it, and release it with
 * ${function.firebase_database_query_release}.
 *
 * @param {Real} ref A reference handle.
 * @param {Any} order_value The lowest sort value to include.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_start_at_key
 * @desc **Firebase C++ SDK:** [firebase::database::Query::StartAt](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#startat_1)
 *
 * This function starts a query over the children of the location that keeps the children whose sort value is greater than or equal to `order_value`, and among those with exactly that value, whose key is greater than or equal to `child_key` - the cursor for paging past a tie. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 * Run it with ${function.firebase_database_query_get_value} or listen to it, and release it with
 * ${function.firebase_database_query_release}.
 *
 * [[Note: The SDK reports a known issue with the `_key` variants: they do not work properly on
 * every platform. Prefer the plain variant where the key is not needed.]]
 *
 * @param {Real} ref A reference handle.
 * @param {Any} order_value The lowest sort value to include.
 * @param {String} child_key The lowest key to include among children with that sort value.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_end_at
 * @desc **Firebase C++ SDK:** [firebase::database::Query::EndAt](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#endat)
 *
 * This function starts a query over the children of the location that keeps the children whose sort value is less than or equal to `order_value`. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 * Run it with ${function.firebase_database_query_get_value} or listen to it, and release it with
 * ${function.firebase_database_query_release}.
 *
 * @param {Real} ref A reference handle.
 * @param {Any} order_value The highest sort value to include.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_end_at_key
 * @desc **Firebase C++ SDK:** [firebase::database::Query::EndAt](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#endat_1)
 *
 * This function starts a query over the children of the location that keeps the children whose sort value is less than or equal to `order_value`, and among those with exactly that value, whose key is less than or equal to `child_key`. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 * Run it with ${function.firebase_database_query_get_value} or listen to it, and release it with
 * ${function.firebase_database_query_release}.
 *
 * [[Note: The SDK reports a known issue with the `_key` variants: they do not work properly on
 * every platform. Prefer the plain variant where the key is not needed.]]
 *
 * @param {Real} ref A reference handle.
 * @param {Any} order_value The highest sort value to include.
 * @param {String} child_key The highest key to include among children with that sort value.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_equal_to
 * @desc **Firebase C++ SDK:** [firebase::database::Query::EqualTo](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#equalto)
 *
 * This function starts a query over the children of the location that keeps the children whose sort value equals `order_value` - with ${function.firebase_database_ref_order_by_child}, the lookup of every child whose field has a value. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 * Run it with ${function.firebase_database_query_get_value} or listen to it, and release it with
 * ${function.firebase_database_query_release}.
 *
 * @param {Real} ref A reference handle.
 * @param {Any} order_value The sort value to match.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_equal_to_key
 * @desc **Firebase C++ SDK:** [firebase::database::Query::EqualTo](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#equalto_1)
 *
 * This function starts a query over the children of the location that keeps the one child whose sort value equals `order_value` and whose key is `child_key`. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 * Run it with ${function.firebase_database_query_get_value} or listen to it, and release it with
 * ${function.firebase_database_query_release}.
 *
 * [[Note: The SDK reports a known issue with the `_key` variants: they do not work properly on
 * every platform. Prefer the plain variant where the key is not needed.]]
 *
 * @param {Real} ref A reference handle.
 * @param {Any} order_value The sort value to match.
 * @param {String} child_key The key to match.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_limit_to_first
 * @desc **Firebase C++ SDK:** [firebase::database::Query::LimitToFirst](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#limittofirst)
 *
 * This function starts a query over the children of the location that keeps only the first `limit` children in the query's order. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 * Run it with ${function.firebase_database_query_get_value} or listen to it, and release it with
 * ${function.firebase_database_query_release}.
 *
 * @param {Real} ref A reference handle.
 * @param {Real} limit The maximum number of children.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_limit_to_last
 * @desc **Firebase C++ SDK:** [firebase::database::Query::LimitToLast](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#limittolast)
 *
 * This function starts a query over the children of the location that keeps only the last `limit` children in the query's order - the top ten of an ascending score order, still delivered in ascending order. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 * Run it with ${function.firebase_database_query_get_value} or listen to it, and release it with
 * ${function.firebase_database_query_release}.
 *
 * @param {Real} ref A reference handle.
 * @param {Real} limit The maximum number of children.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_set_keep_synchronized
 * @desc **Firebase C++ SDK:** [firebase::database::Query::SetKeepSynchronized](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#setkeepsynchronized)
 *
 * This function tells the SDK to keep the location downloaded and up to date even while no listener is
 * attached, and to keep it in the on-disk cache when persistence is on - so a read of it is answered
 * at once, and is available offline, at the cost of the bandwidth to keep it current. Turn it off
 * again with `false`.
 *
 * @param {Real} ref A reference handle.
 * @param {Bool} keep_sync `true` to keep the data synchronised, `false` to stop.
 * @returns {Bool} `true` when the call went through, `false` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_get_value
 * @desc **Firebase C++ SDK:** [firebase::database::Query::GetValue](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#getvalue)
 *
 * This function reads the data at the location once and hands the callback a snapshot of it. The snapshot holds the whole subtree below the location, so reading a node high up the tree
 * downloads everything under it; read the location you need, or narrow it with a query. A location
 * with no data is not an error: the snapshot's ${function.firebase_database_snapshot_exists} is
 * `false` and its value `undefined`.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback for a reference
 * that is not valid. To be told about every later change instead, use a value listener.
 *
 * @param {Real} ref A reference handle.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the data at the location.
 * @member {Enum.FirebaseDatabaseError} error_code `FirebaseDatabaseError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} snapshot A snapshot handle to release with ${function.firebase_database_snapshot_release}, or `0` on failure.
 * @event_end
 *
 * @example
 * ```gml
 * var _player = firebase_database_get_reference_at_path(database, "players/USER_123");
 * firebase_database_ref_get_value(_player, function(_error_code, _error_message, _snapshot)
 * {
 *     if (_error_code != FirebaseDatabaseError.None)
 *     {
 *         show_debug_message("Read failed: " + _error_message);
 *         return;
 *     }
 *     if (firebase_database_snapshot_exists(_snapshot))
 *     {
 *         var _data = firebase_database_snapshot_get_value(_snapshot);
 *         show_debug_message($"{_data.name} has {_data.score} points");
 *     }
 *     firebase_database_snapshot_release(_snapshot);
 * });
 * firebase_database_ref_release(_player);
 * ```
 * The above code reads a player node once and prints two of its children, converted into a GML
 * struct by ${function.firebase_database_snapshot_get_value}. The reference is released as soon
 * as the read has started and the snapshot once it has been read.
 * @function_end
 */

/**
 * @function firebase_database_ref_add_value_listener
 * @desc **Firebase C++ SDK:** [firebase::database::Query::AddValueListener](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#addvaluelistener)
 *
 * This function starts listening to the location, so the game learns about every change without polling.
 * The `on_value_changed` callback fires once at registration with the current data and again
 * every time anything at or below the location changes, from the server or from a local write.
 * Each call brings a new snapshot handle of the whole subtree that the callback must release. It
 * keeps firing until the listener is removed with ${function.firebase_database_ref_remove_value_listener} - at the latest in the Clean Up event
 * of the object that owns the callback. `on_cancelled` fires instead when the server refuses the
 * listener - the security rules deny reading the location - after which the listener is gone.
 *
 * Both callbacks are optional, but not both at once; the function returns `0` with ${function.firebase_last_error_code}
 * set when no callback is given or the handle is not valid.
 *
 * @param {Real} ref A reference handle.
 * @param {Function} [on_value_changed] Called with each snapshot.
 * @param {Function} [on_cancelled] Called when the listener is cancelled.
 * @returns {Real} A listener handle, or `0` on failure.
 *
 * @event callback:on_value_changed
 * @desc Fires with the current data at registration and again on every change.
 * @member {Real} snapshot A snapshot handle to release with ${function.firebase_database_snapshot_release}.
 * @event_end
 *
 * @event callback:on_cancelled
 * @desc Fires when the server stops the listener - the rules deny reading the location.
 * @member {Enum.FirebaseDatabaseError} error_code `FirebaseDatabaseError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @example
 * ```gml
 * // Create Event
 * var _player = firebase_database_get_reference_at_path(database, "players/USER_123");
 * player_listener = firebase_database_ref_add_value_listener(_player,
 *     function(_snapshot)
 *     {
 *         if (firebase_database_snapshot_exists(_snapshot))
 *         {
 *             var _data = firebase_database_snapshot_get_value(_snapshot);
 *             gold = _data.gold;
 *         }
 *         firebase_database_snapshot_release(_snapshot);
 *     },
 *     function(_error_code, _error_message)
 *     {
 *         show_debug_message("Listener cancelled: " + _error_message);
 *     });
 * player_ref = _player;
 *
 * // Clean Up Event
 * firebase_database_ref_remove_value_listener(player_ref, player_listener);
 * firebase_database_ref_release(player_ref);
 * ```
 * The above code keeps the object's `gold` variable in step with the player node, on this device
 * and any other the player uses, and stops listening when the object is destroyed. The reference is
 * kept because removing the listener needs it.
 * @function_end
 */

/**
 * @function firebase_database_ref_remove_value_listener
 * @desc **Firebase C++ SDK:** [firebase::database::Query::RemoveValueListener](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#removevaluelistener)
 *
 * This function stops a value listener added with ${function.firebase_database_ref_add_value_listener}
 * and frees its handle. The callbacks are not called again after this returns.
 *
 * @param {Real} ref A reference handle.
 * @param {Real} listener_ref The listener handle.
 * @returns {Bool} `true` when the listener was removed, `false` when a handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_remove_all_value_listeners
 * @desc **Firebase C++ SDK:** [firebase::database::Query::RemoveAllValueListeners](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#removeallvaluelisteners)
 *
 * This function stops every value listener on the location. The listener handles are not freed: pass
 * each one to ${function.firebase_database_ref_remove_value_listener} afterwards, which is
 * harmless for an already-stopped listener, to free it.
 *
 * @param {Real} ref A reference handle.
 * @returns {Bool} `true` when the call went through, `false` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_add_child_listener
 * @desc **Firebase C++ SDK:** [firebase::database::Query::AddChildListener](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#addchildlistener)
 *
 * This function starts listening to the children of the location. A child listener reports changes to the children of the location one child at a time, which is
 * the way to keep a list in step without re-reading it: `on_child_added` fires once per existing
 * child at registration (in the query's order) and for every child added later,
 * `on_child_changed` when a child's data changes, `on_child_moved` when a child's position changes
 * because its priority or ordered value did, and `on_child_removed` when a child is deleted. Each
 * call brings a new snapshot handle of that child that the callback must release; the
 * `previous_sibling_key` argument names the child ordered before this one, or is an empty string
 * for the first. `on_cancelled` fires instead when the server refuses the listener, after which
 * the listener is gone.
 *
 * Every callback is optional, but not all at once. Remove the listener with ${function.firebase_database_ref_remove_child_listener} at the latest in the Clean Up
 * event of the object that owns the callbacks. The function returns `0` with
 * ${function.firebase_last_error_code} set when no callback is given or the handle is not valid.
 *
 * @param {Real} ref A reference handle.
 * @param {Function} [on_child_added] Called for each existing child and each new one.
 * @param {Function} [on_child_changed] Called when a child changes.
 * @param {Function} [on_child_moved] Called when a child's position changes.
 * @param {Function} [on_child_removed] Called when a child is deleted.
 * @param {Function} [on_cancelled] Called when the listener is cancelled.
 * @returns {Real} A listener handle, or `0` on failure.
 *
 * @event callback:on_child_added
 * @desc Fires once per existing child at registration and for every child added later.
 * @member {Real} snapshot A snapshot handle of the child, to release with ${function.firebase_database_snapshot_release}.
 * @member {String} previous_sibling_key The key of the child ordered before this one, or an empty string for the first.
 * @event_end
 *
 * @event callback:on_child_changed
 * @desc Fires when a child's data changes.
 * @member {Real} snapshot A snapshot handle of the child, to release with ${function.firebase_database_snapshot_release}.
 * @member {String} previous_sibling_key The key of the child ordered before this one, or an empty string for the first.
 * @event_end
 *
 * @event callback:on_child_moved
 * @desc Fires when a child's position among its siblings changes.
 * @member {Real} snapshot A snapshot handle of the child, to release with ${function.firebase_database_snapshot_release}.
 * @member {String} previous_sibling_key The key of the child now ordered before this one, or an empty string for the first.
 * @event_end
 *
 * @event callback:on_child_removed
 * @desc Fires when a child is deleted.
 * @member {Real} snapshot A snapshot handle of the child as it was, to release with ${function.firebase_database_snapshot_release}.
 * @event_end
 *
 * @event callback:on_cancelled
 * @desc Fires when the server stops the listener - the rules deny reading the location.
 * @member {Enum.FirebaseDatabaseError} error_code `FirebaseDatabaseError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @example
 * ```gml
 * // Create Event
 * lobby_listener = firebase_database_ref_add_child_listener(rooms_ref,
 *     function(_snapshot, _previous_key)
 *     {
 *         lobby_add_room(firebase_database_snapshot_key(_snapshot), firebase_database_snapshot_get_value(_snapshot));
 *         firebase_database_snapshot_release(_snapshot);
 *     },
 *     function(_snapshot, _previous_key)
 *     {
 *         lobby_update_room(firebase_database_snapshot_key(_snapshot), firebase_database_snapshot_get_value(_snapshot));
 *         firebase_database_snapshot_release(_snapshot);
 *     },
 *     undefined,
 *     function(_snapshot)
 *     {
 *         lobby_remove_room(firebase_database_snapshot_key(_snapshot));
 *         firebase_database_snapshot_release(_snapshot);
 *     },
 *     undefined);
 *
 * // Clean Up Event
 * firebase_database_ref_remove_child_listener(rooms_ref, lobby_listener);
 * ```
 * The above code keeps a lobby list in step with the `rooms` node: every existing room arrives
 * through `on_child_added` first, then each change as it happens. The moved and cancelled callbacks
 * are not needed and are passed as `undefined`.
 * @function_end
 */

/**
 * @function firebase_database_ref_remove_child_listener
 * @desc **Firebase C++ SDK:** [firebase::database::Query::RemoveChildListener](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#removechildlistener)
 *
 * This function stops a child listener added with ${function.firebase_database_ref_add_child_listener}
 * and frees its handle. The callbacks are not called again after this returns.
 *
 * @param {Real} ref A reference handle.
 * @param {Real} listener_ref The listener handle.
 * @returns {Bool} `true` when the listener was removed, `false` when a handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_remove_all_child_listeners
 * @desc **Firebase C++ SDK:** [firebase::database::Query::RemoveAllChildListeners](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#removeallchildlisteners)
 *
 * This function stops every child listener on the location. The listener handles are not freed: pass
 * each one to ${function.firebase_database_ref_remove_child_listener} afterwards to free it.
 *
 * @param {Real} ref A reference handle.
 * @returns {Bool} `true` when the call went through, `false` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_query_order_by_child
 * @desc **Firebase C++ SDK:** [firebase::database::Query::OrderByChild](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#orderbychild_1)
 *
 * This function narrows a query so that it sorts the children by the value of the child at `path` inside each of them - `"score"` to rank players by score. A previous order directive is replaced. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * @param {Real} ref A query handle.
 * @param {String} path The relative path of the child to sort by.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_query_order_by_key
 * @desc **Firebase C++ SDK:** [firebase::database::Query::OrderByKey](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#orderbykey)
 *
 * This function narrows a query so that it sorts the children by their keys - the order push IDs were created in. A previous order directive is replaced. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * @param {Real} ref A query handle.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_query_order_by_value
 * @desc **Firebase C++ SDK:** [firebase::database::Query::OrderByValue](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#orderbyvalue)
 *
 * This function narrows a query so that it sorts the children by their own values, for a location whose children are plain numbers or strings. A previous order directive is replaced. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * @param {Real} ref A query handle.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_query_order_by_priority
 * @desc **Firebase C++ SDK:** [firebase::database::Query::OrderByPriority](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#orderbypriority)
 *
 * This function narrows a query so that it sorts the children by their priority (${function.firebase_database_ref_set_priority}), which is also the order a query without an order directive uses. A previous order directive is replaced. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * @param {Real} ref A query handle.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_query_start_at
 * @desc **Firebase C++ SDK:** [firebase::database::Query::StartAt](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#startat)
 *
 * This function narrows a query so that it keeps the children whose sort value - by the order directive, or the priority without one - is greater than or equal to `order_value`. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * @param {Real} ref A query handle.
 * @param {Any} order_value The lowest sort value to include.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_query_start_at_key
 * @desc **Firebase C++ SDK:** [firebase::database::Query::StartAt](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#startat_1)
 *
 * This function narrows a query so that it keeps the children whose sort value is greater than or equal to `order_value`, and among those with exactly that value, whose key is greater than or equal to `child_key` - the cursor for paging past a tie. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * [[Note: The SDK reports a known issue with the `_key` variants: they do not work properly on
 * every platform. Prefer the plain variant where the key is not needed.]]
 *
 * @param {Real} ref A query handle.
 * @param {Any} order_value The lowest sort value to include.
 * @param {String} child_key The lowest key to include among children with that sort value.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_query_end_at
 * @desc **Firebase C++ SDK:** [firebase::database::Query::EndAt](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#endat)
 *
 * This function narrows a query so that it keeps the children whose sort value is less than or equal to `order_value`. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * @param {Real} ref A query handle.
 * @param {Any} order_value The highest sort value to include.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_query_end_at_key
 * @desc **Firebase C++ SDK:** [firebase::database::Query::EndAt](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#endat_1)
 *
 * This function narrows a query so that it keeps the children whose sort value is less than or equal to `order_value`, and among those with exactly that value, whose key is less than or equal to `child_key`. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * [[Note: The SDK reports a known issue with the `_key` variants: they do not work properly on
 * every platform. Prefer the plain variant where the key is not needed.]]
 *
 * @param {Real} ref A query handle.
 * @param {Any} order_value The highest sort value to include.
 * @param {String} child_key The highest key to include among children with that sort value.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_query_equal_to
 * @desc **Firebase C++ SDK:** [firebase::database::Query::EqualTo](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#equalto)
 *
 * This function narrows a query so that it keeps the children whose sort value equals `order_value` - with ${function.firebase_database_ref_order_by_child}, the lookup of every child whose field has a value. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * @param {Real} ref A query handle.
 * @param {Any} order_value The sort value to match.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_query_equal_to_key
 * @desc **Firebase C++ SDK:** [firebase::database::Query::EqualTo](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#equalto_1)
 *
 * This function narrows a query so that it keeps the one child whose sort value equals `order_value` and whose key is `child_key`. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * [[Note: The SDK reports a known issue with the `_key` variants: they do not work properly on
 * every platform. Prefer the plain variant where the key is not needed.]]
 *
 * @param {Real} ref A query handle.
 * @param {Any} order_value The sort value to match.
 * @param {String} child_key The key to match.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_query_limit_to_first
 * @desc **Firebase C++ SDK:** [firebase::database::Query::LimitToFirst](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#limittofirst)
 *
 * This function narrows a query so that it keeps only the first `limit` children in the query's order. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * @param {Real} ref A query handle.
 * @param {Real} limit The maximum number of children.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_query_limit_to_last
 * @desc **Firebase C++ SDK:** [firebase::database::Query::LimitToLast](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#limittolast)
 *
 * This function narrows a query so that it keeps only the last `limit` children in the query's order - the top ten of an ascending score order, still delivered in ascending order. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * @param {Real} ref A query handle.
 * @param {Real} limit The maximum number of children.
 * @returns {Real} A new query handle to release with ${function.firebase_database_query_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_query_get_reference
 * @desc **Firebase C++ SDK:** [firebase::database::Query::GetReference](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#getreference)
 *
 * This function returns a reference to the location a query reads, without any of the query's
 * ordering or limits. Release it with ${function.firebase_database_ref_release}.
 *
 * @param {Real} ref A query handle.
 * @returns {Real} A reference handle to release with ${function.firebase_database_ref_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_query_set_keep_synchronized
 * @desc **Firebase C++ SDK:** [firebase::database::Query::SetKeepSynchronized](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#setkeepsynchronized)
 *
 * This function tells the SDK to keep the query's results downloaded and up to date even while no listener is
 * attached, and to keep it in the on-disk cache when persistence is on - so a read of it is answered
 * at once, and is available offline, at the cost of the bandwidth to keep it current. Turn it off
 * again with `false`.
 *
 * @param {Real} ref A query handle.
 * @param {Bool} keep_sync `true` to keep the data synchronised, `false` to stop.
 * @returns {Bool} `true` when the call went through, `false` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_query_is_valid
 * @desc **Firebase C++ SDK:** [firebase::database::Query::is_valid](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#is_valid)
 *
 * This function returns whether the handle refers to a usable query - `false` for a released handle
 * and for a query built from a reference that was not valid.
 *
 * @param {Real} ref A query handle.
 * @returns {Bool} `true` when the query can be used, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_database_query_get_value
 * @desc **Firebase C++ SDK:** [firebase::database::Query::GetValue](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#getvalue)
 *
 * This function runs the query once and hands the callback a snapshot of the children that
 * matched, in the query's order - ${function.firebase_database_snapshot_get_children} returns them
 * one snapshot each. The snapshot holds the whole subtree below the location, so reading a node high up the tree
 * downloads everything under it; read the location you need, or narrow it with a query. A location
 * with no data is not an error: the snapshot's ${function.firebase_database_snapshot_exists} is
 * `false` and its value `undefined`.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback for a reference
 * that is not valid. To be told about every later change instead, use a value listener.
 *
 * @param {Real} ref A query handle.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the data at the location.
 * @member {Enum.FirebaseDatabaseError} error_code `FirebaseDatabaseError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} snapshot A snapshot handle to release with ${function.firebase_database_snapshot_release}, or `0` on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_database_query_add_value_listener
 * @desc **Firebase C++ SDK:** [firebase::database::Query::AddValueListener](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#addvaluelistener)
 *
 * This function starts listening to the query's results, so the game learns about every change without polling.
 * The `on_value_changed` callback fires once at registration with the current data and again
 * every time anything at or below the location changes, from the server or from a local write.
 * Each call brings a new snapshot handle of the whole subtree that the callback must release. It
 * keeps firing until the listener is removed with ${function.firebase_database_query_remove_value_listener} - at the latest in the Clean Up event
 * of the object that owns the callback. `on_cancelled` fires instead when the server refuses the
 * listener - the security rules deny reading the location - after which the listener is gone.
 *
 * Both callbacks are optional, but not both at once; the function returns `0` with ${function.firebase_last_error_code}
 * set when no callback is given or the handle is not valid.
 *
 * @param {Real} ref A query handle.
 * @param {Function} [on_value_changed] Called with each snapshot.
 * @param {Function} [on_cancelled] Called when the listener is cancelled.
 * @returns {Real} A listener handle, or `0` on failure.
 *
 * @event callback:on_value_changed
 * @desc Fires with the current data at registration and again on every change.
 * @member {Real} snapshot A snapshot handle to release with ${function.firebase_database_snapshot_release}.
 * @event_end
 *
 * @event callback:on_cancelled
 * @desc Fires when the server stops the listener - the rules deny reading the location.
 * @member {Enum.FirebaseDatabaseError} error_code `FirebaseDatabaseError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_database_query_remove_value_listener
 * @desc **Firebase C++ SDK:** [firebase::database::Query::RemoveValueListener](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#removevaluelistener)
 *
 * This function stops a value listener added with ${function.firebase_database_query_add_value_listener}
 * and frees its handle. The callbacks are not called again after this returns.
 *
 * @param {Real} ref A query handle.
 * @param {Real} listener_ref The listener handle.
 * @returns {Bool} `true` when the listener was removed, `false` when a handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_query_remove_all_value_listeners
 * @desc **Firebase C++ SDK:** [firebase::database::Query::RemoveAllValueListeners](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#removeallvaluelisteners)
 *
 * This function stops every value listener on the query's results. The listener handles are not freed: pass
 * each one to ${function.firebase_database_query_remove_value_listener} afterwards, which is
 * harmless for an already-stopped listener, to free it.
 *
 * @param {Real} ref A query handle.
 * @returns {Bool} `true` when the call went through, `false` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_query_add_child_listener
 * @desc **Firebase C++ SDK:** [firebase::database::Query::AddChildListener](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#addchildlistener)
 *
 * This function starts listening to the children of the query's results. A child listener reports changes to the children of the location one child at a time, which is
 * the way to keep a list in step without re-reading it: `on_child_added` fires once per existing
 * child at registration (in the query's order) and for every child added later,
 * `on_child_changed` when a child's data changes, `on_child_moved` when a child's position changes
 * because its priority or ordered value did, and `on_child_removed` when a child is deleted. Each
 * call brings a new snapshot handle of that child that the callback must release; the
 * `previous_sibling_key` argument names the child ordered before this one, or is an empty string
 * for the first. `on_cancelled` fires instead when the server refuses the listener, after which
 * the listener is gone.
 *
 * Every callback is optional, but not all at once. Remove the listener with ${function.firebase_database_query_remove_child_listener} at the latest in the Clean Up
 * event of the object that owns the callbacks. The function returns `0` with
 * ${function.firebase_last_error_code} set when no callback is given or the handle is not valid.
 *
 * @param {Real} ref A query handle.
 * @param {Function} [on_child_added] Called for each existing child and each new one.
 * @param {Function} [on_child_changed] Called when a child changes.
 * @param {Function} [on_child_moved] Called when a child's position changes.
 * @param {Function} [on_child_removed] Called when a child is deleted.
 * @param {Function} [on_cancelled] Called when the listener is cancelled.
 * @returns {Real} A listener handle, or `0` on failure.
 *
 * @event callback:on_child_added
 * @desc Fires once per existing child at registration and for every child added later.
 * @member {Real} snapshot A snapshot handle of the child, to release with ${function.firebase_database_snapshot_release}.
 * @member {String} previous_sibling_key The key of the child ordered before this one, or an empty string for the first.
 * @event_end
 *
 * @event callback:on_child_changed
 * @desc Fires when a child's data changes.
 * @member {Real} snapshot A snapshot handle of the child, to release with ${function.firebase_database_snapshot_release}.
 * @member {String} previous_sibling_key The key of the child ordered before this one, or an empty string for the first.
 * @event_end
 *
 * @event callback:on_child_moved
 * @desc Fires when a child's position among its siblings changes.
 * @member {Real} snapshot A snapshot handle of the child, to release with ${function.firebase_database_snapshot_release}.
 * @member {String} previous_sibling_key The key of the child now ordered before this one, or an empty string for the first.
 * @event_end
 *
 * @event callback:on_child_removed
 * @desc Fires when a child is deleted.
 * @member {Real} snapshot A snapshot handle of the child as it was, to release with ${function.firebase_database_snapshot_release}.
 * @event_end
 *
 * @event callback:on_cancelled
 * @desc Fires when the server stops the listener - the rules deny reading the location.
 * @member {Enum.FirebaseDatabaseError} error_code `FirebaseDatabaseError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_database_query_remove_child_listener
 * @desc **Firebase C++ SDK:** [firebase::database::Query::RemoveChildListener](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#removechildlistener)
 *
 * This function stops a child listener added with ${function.firebase_database_query_add_child_listener}
 * and frees its handle. The callbacks are not called again after this returns.
 *
 * @param {Real} ref A query handle.
 * @param {Real} listener_ref The listener handle.
 * @returns {Bool} `true` when the listener was removed, `false` when a handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_query_remove_all_child_listeners
 * @desc **Firebase C++ SDK:** [firebase::database::Query::RemoveAllChildListeners](https://firebase.google.com/docs/reference/cpp/class/firebase/database/query#removeallchildlisteners)
 *
 * This function stops every child listener on the query's results. The listener handles are not freed: pass
 * each one to ${function.firebase_database_query_remove_child_listener} afterwards to free it.
 *
 * @param {Real} ref A query handle.
 * @returns {Bool} `true` when the call went through, `false` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_query_release
 * @desc This function releases a query handle. A query built from it, a running `get_value` and a
 * listener each keep their own copy, so release it as soon as the next step has been built or
 * started. A reference is not a query handle: release it with ${function.firebase_database_ref_release}. A handle that is not a query sets
 * ${function.firebase_last_error_code} to `FirebaseError.InvalidHandle`.
 *
 * @param {Real} ref The handle to release.
 * @function_end
 */

/**
 * @function firebase_database_ref_get
 * @desc This function reads a reference's properties into one ${struct.FirebaseDatabaseReferenceInfo}:
 * its key, whether it is the root, whether it is valid, its URL and the database handle, which is
 * never released. It hands out no reference handles: ${function.firebase_database_ref_get_parent},
 * ${function.firebase_database_ref_get_root} and ${function.firebase_database_query_get_reference}
 * each register one to release. The individual `firebase_database_ref_*` getters return the same
 * values one at a time.
 *
 * @param {Real} ref A reference handle.
 * @returns {Struct.FirebaseDatabaseReferenceInfo} The reference's properties, or `undefined` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_child
 * @desc **Firebase C++ SDK:** [firebase::database::DatabaseReference::Child](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database-reference#child_1)
 *
 * This function returns a reference to a location below this one, from a relative path of one or
 * more segments. Release it with ${function.firebase_database_ref_release}.
 *
 * @param {Real} ref A reference handle.
 * @param {String} path A slash-separated path relative to this location (`"stats/wins"`).
 * @returns {Real} A reference handle to release with ${function.firebase_database_ref_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_push
 * @desc **Firebase C++ SDK:** [firebase::database::DatabaseReference::PushChild](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database-reference#pushchild)
 *
 * This function returns a reference to a new child of this location with a key the SDK generates
 * - a 20-character push ID that sorts by creation time, so children pushed one after another come
 * back in that order from ${function.firebase_database_ref_get_value} and the listeners. Nothing is
 * written until you write to the reference; a list of items is built by pushing a child per item.
 * Release the handle with ${function.firebase_database_ref_release}.
 *
 * @param {Real} ref A reference handle.
 * @returns {Real} A reference handle to release with ${function.firebase_database_ref_release}, or `0` when the handle is not valid.
 *
 * @example
 * ```gml
 * var _entry = firebase_database_ref_push(scores);
 * show_debug_message("New score key: " + firebase_database_ref_key(_entry));
 * firebase_database_ref_set_value(_entry, { user: firebase_auth_user_uid(user), score: 1250, scored_at: firebase_database_server_timestamp() },
 *     function(_error_code, _error_message)
 *     {
 *         show_debug_message(_error_code == FirebaseDatabaseError.None ? "Score posted" : _error_message);
 *     });
 * firebase_database_ref_release(_entry);
 * ```
 * The above code appends a score to the `scores` list under a fresh time-ordered key, with the
 * server filling in when it arrived.
 * @function_end
 */

/**
 * @function firebase_database_ref_go_online
 * @desc **Firebase C++ SDK:** [firebase::database::DatabaseReference::GoOnline](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database-reference#goonline)
 *
 * This function reopens the connection of the database the reference belongs to; it is
 * ${function.firebase_database_go_online} reached from a reference.
 *
 * @param {Real} ref A reference handle.
 * @returns {Bool} `true` when the call went through, `false` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_go_offline
 * @desc **Firebase C++ SDK:** [firebase::database::DatabaseReference::GoOffline](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database-reference#gooffline)
 *
 * This function closes the connection of the database the reference belongs to - the whole
 * database, not just this location; it is ${function.firebase_database_go_offline} reached from a
 * reference.
 *
 * @param {Real} ref A reference handle.
 * @returns {Bool} `true` when the call went through, `false` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_set_value
 * @desc **Firebase C++ SDK:** [firebase::database::DatabaseReference::SetValue](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database-reference#setvalue)
 *
 * This function writes a value at the location, replacing whatever was there - including every
 * child below it. A struct writes a subtree, an array a list, `undefined` deletes the location. The
 * write applies locally at once (listeners fire before the network is touched) and the callback
 * fires when the server has accepted it, which offline means when the connection is back. To change
 * some children and keep the rest, use ${function.firebase_database_ref_update_children}. Only one write of this kind should be in flight on a location at a time; a second one before
 * the first has completed fails with `FirebaseDatabaseError.ConflictingOperationInProgress`.
 *
 * @param {Real} ref A reference handle.
 * @param {Any} value The value to write: a number, string, boolean, array or struct, or `undefined` to delete.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the server has accepted the write, or with the reason it did not.
 * @member {Enum.FirebaseDatabaseError} error_code `FirebaseDatabaseError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @example
 * ```gml
 * var _player = firebase_database_get_reference_at_path(database, "players/USER_123");
 * firebase_database_ref_set_value(_player,
 *     { name: "Player", score: 0, inventory: ["sword", "shield"], stats: { wins: 0, losses: 0 }, joined: firebase_database_server_timestamp() },
 *     function(_error_code, _error_message)
 *     {
 *         show_debug_message(_error_code == FirebaseDatabaseError.None ? "Player written" : _error_message);
 *     });
 * firebase_database_ref_release(_player);
 * ```
 * The above code writes a whole player node in one call: a struct becomes the subtree, the array
 * a list, and the server timestamp placeholder the time the server received it.
 * @function_end
 */

/**
 * @function firebase_database_ref_set_priority
 * @desc **Firebase C++ SDK:** [firebase::database::DatabaseReference::SetPriority](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database-reference#setpriority)
 *
 * This function sets the location's priority, the value that orders it among its siblings for
 * ${function.firebase_database_ref_order_by_priority} and the default order of a query without an
 * `order_by`: children with no priority first, then numeric priorities ascending, then string
 * priorities ascending; ties broken by key. A priority is a number, a string or `undefined`;
 * anything else fails the callback with `FirebaseDatabaseError.InvalidVariantType`. Priorities
 * are a legacy feature - ordering by a child value with
 * ${function.firebase_database_ref_order_by_child} does the same job with visible data. Only one write of this kind should be in flight on a location at a time; a second one before
 * the first has completed fails with `FirebaseDatabaseError.ConflictingOperationInProgress`.
 *
 * @param {Real} ref A reference handle.
 * @param {Any} priority A number, a string, or `undefined` for no priority.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the server has accepted the priority, or with the reason it did not.
 * @member {Enum.FirebaseDatabaseError} error_code `FirebaseDatabaseError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_database_ref_set_value_and_priority
 * @desc **Firebase C++ SDK:** [firebase::database::DatabaseReference::SetValueAndPriority](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database-reference#setvalueandpriority)
 *
 * This function writes a value and its priority in one operation - see
 * ${function.firebase_database_ref_set_value} and ${function.firebase_database_ref_set_priority}.
 * It cannot run at the same time as either of those on the same location
 * (`FirebaseDatabaseError.ConflictingOperationInProgress`).
 *
 * @param {Real} ref A reference handle.
 * @param {Any} value The value to write: a number, string, boolean, array or struct, or `undefined` to delete.
 * @param {Any} priority A number, a string, or `undefined` for no priority.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the server has accepted the write, or with the reason it did not.
 * @member {Enum.FirebaseDatabaseError} error_code `FirebaseDatabaseError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_database_ref_update_children
 * @desc **Firebase C++ SDK:** [firebase::database::DatabaseReference::UpdateChildren](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database-reference#updatechildren)
 *
 * This function writes several children of the location at once and leaves the others untouched.
 * Each key of `values` is a path relative to the location - one segment for a direct child, more
 * to reach deeper (`"stats/wins"`) - and each value replaces what is at that path; `undefined`
 * deletes it. All the paths are written as one atomic operation: either every one lands or none
 * does. From the root reference this is the multi-location update, the way to change a player's
 * node and a leaderboard entry in one consistent step.
 *
 * @param {Real} ref A reference handle.
 * @param {Any} values A struct of relative paths to values.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the server has accepted every write, or with the reason it rejected them.
 * @member {Enum.FirebaseDatabaseError} error_code `FirebaseDatabaseError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @example
 * ```gml
 * var _root = firebase_database_get_reference(database);
 * var _updates = {};
 * _updates[$ "players/USER_123/guild"] = "GUILD_001";
 * _updates[$ "guilds/GUILD_001/members/USER_123"] = true;
 * _updates[$ "invites/USER_123"] = undefined;
 *
 * firebase_database_ref_update_children(_root, _updates, function(_error_code, _error_message)
 * {
 *     show_debug_message(_error_code == FirebaseDatabaseError.None ? "Joined the guild" : _error_message);
 * });
 * firebase_database_ref_release(_root);
 * ```
 * The above code joins a guild by writing three locations atomically from the root - the
 * player's guild, the guild's member list, and the deletion of the pending invite - so no reader
 * ever sees one without the others. The keys contain slashes, so the struct is built with the
 * accessor syntax.
 * @function_end
 */

/**
 * @function firebase_database_ref_remove_value
 * @desc **Firebase C++ SDK:** [firebase::database::DatabaseReference::RemoveValue](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database-reference#removevalue)
 *
 * This function deletes the location and everything below it - the same as writing `undefined`
 * with ${function.firebase_database_ref_set_value}. Deleting a location that has no data
 * succeeds. Only one write of this kind should be in flight on a location at a time; a second one before
 * the first has completed fails with `FirebaseDatabaseError.ConflictingOperationInProgress`.
 *
 * @param {Real} ref A reference handle.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the server has accepted the delete, or with the reason it did not.
 * @member {Enum.FirebaseDatabaseError} error_code `FirebaseDatabaseError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_database_ref_run_transaction
 * @desc **Firebase C++ SDK:** [firebase::database::DatabaseReference::RunTransaction](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database-reference#runtransaction_1)
 *
 * This function is not available. A Realtime Database transaction runs a handler synchronously on
 * the SDK's own thread, possibly several times, and must return the new value before that call
 * unwinds; the extension's callback bridge cannot hold a GML function to that contract, so the
 * call never reaches the SDK: it returns `FirebaseError.Unsupported` at once,
 * ${function.firebase_last_error_code} says the same, and the callback is never called.
 *
 * [[Important: For a counter or another value that several devices change at once, keep the
 * increment on a server you control - a Cloud Function (${module.functions}) reading and writing
 * the location - or accept the race and read with ${function.firebase_database_ref_get_value} and
 * write with ${function.firebase_database_ref_set_value}. For several locations that must change
 * together, ${function.firebase_database_ref_update_children} is atomic and needs no read.]]
 *
 * @param {Real} ref A reference handle.
 * @param {Function} [callback] Not used.
 * @returns {Enum.FirebaseError} Always `FirebaseError.Unsupported`.
 *
 * @event callback
 * @desc Never fires.
 * @member {Enum.FirebaseDatabaseError} error_code `FirebaseDatabaseError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_database_ref_release
 * @desc This function releases a reference handle - one from the database, from
 * ${function.firebase_database_ref_child}, from a query's `get_reference`, from a snapshot, or from
 * ${function.firebase_database_ref_get_parent} and ${function.firebase_database_ref_get_root}.
 * Release it as soon as the calls that need it have
 * been started; queries, listeners and writes keep their own copies. A handle that is not a reference sets
 * ${function.firebase_last_error_code} to `FirebaseError.InvalidHandle`.
 *
 * @param {Real} ref The handle to release.
 * @function_end
 */

/**
 * @function firebase_database_snapshot_exists
 * @desc **Firebase C++ SDK:** [firebase::database::DataSnapshot::exists](https://firebase.google.com/docs/reference/cpp/class/firebase/database/data-snapshot#exists)
 *
 * This function returns whether the snapshot holds any data. A read of a location that has none
 * is not an error; this is how it shows.
 *
 * @param {Real} ref A snapshot handle.
 * @returns {Bool} `true` when there is data, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_database_snapshot_is_valid
 * @desc **Firebase C++ SDK:** [firebase::database::DataSnapshot::is_valid](https://firebase.google.com/docs/reference/cpp/class/firebase/database/data-snapshot#is_valid)
 *
 * This function returns whether the handle refers to a usable snapshot - `false` after it has been
 * released.
 *
 * @param {Real} ref A snapshot handle.
 * @returns {Bool} `true` when the snapshot can be read, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_database_snapshot_child
 * @desc **Firebase C++ SDK:** [firebase::database::DataSnapshot::Child](https://firebase.google.com/docs/reference/cpp/class/firebase/database/data-snapshot#child_1)
 *
 * This function returns a snapshot of a location below this one, out of the data already
 * downloaded - no request is made. It is the way to read one part of a large snapshot without
 * converting all of it. The child need not exist; its ${function.firebase_database_snapshot_exists}
 * says. Release the handle with ${function.firebase_database_snapshot_release}.
 *
 * @param {Real} ref A snapshot handle.
 * @param {String} path A slash-separated path relative to this location (`"stats/wins"`).
 * @returns {Real} A snapshot handle to release with ${function.firebase_database_snapshot_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_snapshot_has_child
 * @desc **Firebase C++ SDK:** [firebase::database::DataSnapshot::HasChild](https://firebase.google.com/docs/reference/cpp/class/firebase/database/data-snapshot#haschild_1)
 *
 * This function returns whether the snapshot holds data at a path below its location.
 *
 * @param {Real} ref A snapshot handle.
 * @param {String} path A slash-separated path relative to this location (`"stats/wins"`).
 * @returns {Bool} `true` when there is data at the path, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_database_snapshot_has_children
 * @desc **Firebase C++ SDK:** [firebase::database::DataSnapshot::has_children](https://firebase.google.com/docs/reference/cpp/class/firebase/database/data-snapshot#has_children)
 *
 * This function returns whether the snapshot's location is a node with children rather than a
 * leaf value or an empty location.
 *
 * @param {Real} ref A snapshot handle.
 * @returns {Bool} `true` when there are children, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_database_snapshot_children_count
 * @desc **Firebase C++ SDK:** [firebase::database::DataSnapshot::children_count](https://firebase.google.com/docs/reference/cpp/class/firebase/database/data-snapshot#children_count)
 *
 * This function returns how many direct children the snapshot's location has.
 *
 * @param {Real} ref A snapshot handle.
 * @returns {Real} The number of children, or `0` for a leaf, an empty location or an invalid handle.
 * @function_end
 */

/**
 * @function firebase_database_snapshot_get_children
 * @desc **Firebase C++ SDK:** [firebase::database::DataSnapshot::children](https://firebase.google.com/docs/reference/cpp/class/firebase/database/data-snapshot#children)
 *
 * This function returns the snapshot's direct children as an array of snapshot handles, in the
 * order of the query that produced the snapshot (key order for a plain reference). Each handle is
 * new and is released with ${function.firebase_database_snapshot_release} once read - a loop that
 * forgets to leaks one per child.
 *
 * @param {Real} ref A snapshot handle.
 * @returns {Array[Real]} An array of snapshot handles, empty when there are no children or the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_snapshot_key
 * @desc **Firebase C++ SDK:** [firebase::database::DataSnapshot::key_string](https://firebase.google.com/docs/reference/cpp/class/firebase/database/data-snapshot#key_string)
 *
 * This function returns the key of the snapshot's location - the last segment of its path, or the
 * push ID of a child delivered by a child listener.
 *
 * @param {Real} ref A snapshot handle.
 * @returns {String} The key, or an empty string for the root or an invalid handle.
 * @function_end
 */

/**
 * @function firebase_database_snapshot_get_reference
 * @desc **Firebase C++ SDK:** [firebase::database::DataSnapshot::GetReference](https://firebase.google.com/docs/reference/cpp/class/firebase/database/data-snapshot#getreference)
 *
 * This function returns a reference to the snapshot's location, as a new handle to release with
 * ${function.firebase_database_ref_release} - the way to write back to a child a listener or a
 * query delivered.
 *
 * @param {Real} ref A snapshot handle.
 * @returns {Real} A reference handle to release with ${function.firebase_database_ref_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_snapshot_get_info
 * @desc This function reads a snapshot's properties into one ${struct.FirebaseDataSnapshotInfo}: its
 * key, whether it holds data, whether it is valid, and whether and how many children it has. It
 * hands out no handle; a reference to the snapshot's location comes from
 * ${function.firebase_database_snapshot_get_reference}, which registers one to release. The value
 * itself is read separately with ${function.firebase_database_snapshot_get_value}; the individual
 * functions below return the same properties one at a time.
 *
 * @param {Real} snapshot A snapshot handle.
 * @returns {Struct.FirebaseDataSnapshotInfo} The snapshot's properties, or `undefined` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_snapshot_get_value
 * @desc **Firebase C++ SDK:** [firebase::database::DataSnapshot::value](https://firebase.google.com/docs/reference/cpp/class/firebase/database/data-snapshot#value)
 *
 * This function converts the data in the snapshot into a GML value: a number, string or boolean for
 * a leaf, a struct for a node with children (a nested struct per child node), an array for a node
 * whose keys are `0`, `1`, `2`... and `undefined` for a location with no data. Integers and doubles
 * both arrive as numbers. The conversion walks the whole subtree, so on a large snapshot read only
 * the children you need through ${function.firebase_database_snapshot_child}.
 *
 * @param {Real} snapshot A snapshot handle.
 * @returns {Any} The data, or `undefined` for an empty location or an invalid handle.
 * @function_end
 */

/**
 * @function firebase_database_snapshot_get_priority
 * @desc **Firebase C++ SDK:** [firebase::database::DataSnapshot::priority](https://firebase.google.com/docs/reference/cpp/class/firebase/database/data-snapshot#priority)
 *
 * This function returns the priority of the snapshot's location - a number, a string, or
 * `undefined` when it has none (the usual case).
 *
 * @param {Real} snapshot A snapshot handle.
 * @returns {Any} The priority, or `undefined`.
 * @function_end
 */

/**
 * @function firebase_database_snapshot_release
 * @desc This function releases a snapshot handle - one from a `get_value` callback, a listener,
 * ${function.firebase_database_snapshot_get_children} or ${function.firebase_database_snapshot_child}.
 * Release each one once its data has been read. A handle that is not a snapshot sets
 * ${function.firebase_last_error_code} to `FirebaseError.InvalidHandle`.
 *
 * @param {Real} snapshot The handle to release.
 * @function_end
 */

/**
 * @function firebase_database_ref_key
 * @desc **Firebase C++ SDK:** [firebase::database::DatabaseReference::key_string](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database-reference#key_string)
 *
 * This function returns the last segment of the reference's path - `"USER_123"` for
 * `players/USER_123` - or an empty string for the root.
 *
 * @param {Real} ref A reference handle.
 * @returns {String} The key, or an empty string for the root or an invalid handle.
 * @function_end
 */

/**
 * @function firebase_database_ref_is_root
 * @desc **Firebase C++ SDK:** [firebase::database::DatabaseReference::is_root](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database-reference#is_root)
 *
 * This function returns whether the reference is the root of the database.
 *
 * @param {Real} ref A reference handle.
 * @returns {Bool} `true` for the root, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_database_ref_is_valid
 * @desc **Firebase C++ SDK:** [firebase::database::DatabaseReference::is_valid](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database-reference#is_valid)
 *
 * This function returns whether the handle refers to a usable reference - `false` for a released
 * handle and for a reference built from a malformed path or a URL of another database.
 *
 * @param {Real} ref A reference handle.
 * @returns {Bool} `true` when the reference can be used, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_database_ref_get_parent
 * @desc **Firebase C++ SDK:** [firebase::database::DatabaseReference::GetParent](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database-reference#getparent)
 *
 * This function returns a reference to the location above this one, or to the root again when
 * this is the root.
 *
 * @param {Real} ref A reference handle.
 * @returns {Real} A reference handle to release with ${function.firebase_database_ref_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_get_root
 * @desc **Firebase C++ SDK:** [firebase::database::DatabaseReference::GetRoot](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database-reference#getroot)
 *
 * This function returns a reference to the root of the database this reference belongs to.
 *
 * @param {Real} ref A reference handle.
 * @returns {Real} A reference handle to release with ${function.firebase_database_ref_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_get_database
 * @desc **Firebase C++ SDK:** [firebase::database::DatabaseReference::database](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database-reference#database)
 *
 * This function returns the database handle a reference belongs to - the same handle
 * ${function.firebase_database_get_instance} returned for that database.
 *
 * @param {Real} ref A reference handle.
 * @returns {Real} The database handle, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_ref_get_url
 * @desc **Firebase C++ SDK:** [firebase::database::DatabaseReference::url](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database-reference#url)
 *
 * This function returns the location's full URL - the database URL followed by the path.
 *
 * @param {Real} ref A reference handle.
 * @returns {String} The URL, or an empty string when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_server_timestamp
 * @desc This function returns the placeholder the server replaces with the time it applied the write, in
 * milliseconds since the Unix epoch, so every device agrees on when something happened regardless
 * of its own clock. Put it wherever a value goes - a whole location, a child in a struct, an entry
 * in ${function.firebase_database_ref_update_children} - and it reads back as a number. It is a
 * plain struct (`{ ".sv": "timestamp" }`), so there is nothing to release. A snapshot from a
 * local write shows the device's estimate until the server's value arrives.
 *
 * @returns {Any} The placeholder value.
 * @function_end
 */

/**
 * @function firebase_database_ref_on_disconnect
 * @desc **Firebase C++ SDK:** [firebase::database::DatabaseReference::OnDisconnect](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database-reference#ondisconnect)
 *
 * This function returns a handle to the location's disconnect handler, through which the game
 * registers writes the *server* performs when this client's connection is lost - the basis of
 * presence: set `online` to `true` now, and register that it becomes `false` on disconnect. Each
 * `firebase_database_on_disconnect_*` call queues one action on the server for this location;
 * ${function.firebase_database_on_disconnect_cancel} clears the queue. Release the handler with
 * ${function.firebase_database_on_disconnect_release} once the calls have been started. Each call
 * returns a handle of its own, and it stays valid after the reference handle it came from has been
 * released.
 *
 * @param {Real} ref A reference handle.
 * @returns {Real} A disconnect handler handle, or `0` when the handle is not valid.
 *
 * @example
 * ```gml
 * var _presence = firebase_database_get_reference_at_path(database, "presence/" + firebase_auth_user_uid(user));
 * firebase_database_ref_set_value(_presence, { online: true, since: firebase_database_server_timestamp() }, undefined);
 *
 * var _on_disconnect = firebase_database_ref_on_disconnect(_presence);
 * firebase_database_on_disconnect_update_children(_on_disconnect, { online: false, last_seen: firebase_database_server_timestamp() },
 *     function(_error_code, _error_message)
 *     {
 *         show_debug_message(_error_code == FirebaseDatabaseError.None ? "Presence armed" : _error_message);
 *     });
 * firebase_database_on_disconnect_release(_on_disconnect);
 * firebase_database_ref_release(_presence);
 * ```
 * The above code marks the player online and arms the server to mark them offline, with the
 * time, the moment the connection drops - whether the game quit cleanly or not. Both handles are
 * released once the calls have been started.
 * @function_end
 */

/**
 * @function firebase_database_on_disconnect_cancel
 * @desc **Firebase C++ SDK:** [firebase::database::DisconnectionHandler::Cancel](https://firebase.google.com/docs/reference/cpp/class/firebase/database/disconnection-handler#cancel)
 *
 * This function discards every action queued on the server for this location's disconnect - the
 * way to disarm presence before the player signs out on purpose. The callback fires when the
 * server has cleared the queue.
 *
 * @param {Real} handler A disconnect handler handle from ${function.firebase_database_ref_on_disconnect}.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the server has cleared the queued actions.
 * @member {Enum.FirebaseDatabaseError} error_code `FirebaseDatabaseError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_database_on_disconnect_remove_value
 * @desc **Firebase C++ SDK:** [firebase::database::DisconnectionHandler::RemoveValue](https://firebase.google.com/docs/reference/cpp/class/firebase/database/disconnection-handler#removevalue)
 *
 * This function queues the deletion of the location for when this client disconnects. The callback fires when the server has queued the action, not when it runs; the action runs
 * on the server when this client's connection drops - the game closes, crashes or loses the
 * network - and is discarded by ${function.firebase_database_on_disconnect_cancel} or when the
 * connection ends by ${function.firebase_database_go_offline}.
 *
 * @param {Real} handler A disconnect handler handle from ${function.firebase_database_ref_on_disconnect}.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the server has queued the delete, or with the reason it did not.
 * @member {Enum.FirebaseDatabaseError} error_code `FirebaseDatabaseError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_database_on_disconnect_set_value
 * @desc **Firebase C++ SDK:** [firebase::database::DisconnectionHandler::SetValue](https://firebase.google.com/docs/reference/cpp/class/firebase/database/disconnection-handler#setvalue)
 *
 * This function queues a write of the location for when this client disconnects, with the value
 * rules of ${function.firebase_database_ref_set_value}. The callback fires when the server has queued the action, not when it runs; the action runs
 * on the server when this client's connection drops - the game closes, crashes or loses the
 * network - and is discarded by ${function.firebase_database_on_disconnect_cancel} or when the
 * connection ends by ${function.firebase_database_go_offline}.
 *
 * @param {Real} handler A disconnect handler handle from ${function.firebase_database_ref_on_disconnect}.
 * @param {Any} value The value to write: a number, string, boolean, array or struct, or `undefined` to delete.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the server has queued the write, or with the reason it did not.
 * @member {Enum.FirebaseDatabaseError} error_code `FirebaseDatabaseError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_database_on_disconnect_set_value_and_priority
 * @desc **Firebase C++ SDK:** [firebase::database::DisconnectionHandler::SetValueAndPriority](https://firebase.google.com/docs/reference/cpp/class/firebase/database/disconnection-handler#setvalueandpriority)
 *
 * This function queues a write of the location's value and priority for when this client
 * disconnects; see ${function.firebase_database_ref_set_value_and_priority}. The callback fires when the server has queued the action, not when it runs; the action runs
 * on the server when this client's connection drops - the game closes, crashes or loses the
 * network - and is discarded by ${function.firebase_database_on_disconnect_cancel} or when the
 * connection ends by ${function.firebase_database_go_offline}.
 *
 * @param {Real} handler A disconnect handler handle from ${function.firebase_database_ref_on_disconnect}.
 * @param {Any} value The value to write: a number, string, boolean, array or struct, or `undefined` to delete.
 * @param {Any} priority A number, a string, or `undefined` for no priority.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the server has queued the write, or with the reason it did not.
 * @member {Enum.FirebaseDatabaseError} error_code `FirebaseDatabaseError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_database_on_disconnect_update_children
 * @desc **Firebase C++ SDK:** [firebase::database::DisconnectionHandler::UpdateChildren](https://firebase.google.com/docs/reference/cpp/class/firebase/database/disconnection-handler#updatechildren)
 *
 * This function queues an update of several children of the location for when this client
 * disconnects, with the path rules of ${function.firebase_database_ref_update_children}. The callback fires when the server has queued the action, not when it runs; the action runs
 * on the server when this client's connection drops - the game closes, crashes or loses the
 * network - and is discarded by ${function.firebase_database_on_disconnect_cancel} or when the
 * connection ends by ${function.firebase_database_go_offline}.
 *
 * @param {Real} handler A disconnect handler handle from ${function.firebase_database_ref_on_disconnect}.
 * @param {Any} values A struct of relative paths to values.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the server has queued the update, or with the reason it did not.
 * @member {Enum.FirebaseDatabaseError} error_code `FirebaseDatabaseError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_database_on_disconnect_release
 * @desc This function releases a disconnect handler handle once its calls have been started. The
 * actions queued on the server are not affected. A handle that is not a disconnect handler sets
 * ${function.firebase_last_error_code} to `FirebaseError.InvalidHandle`.
 *
 * @param {Real} handler The handle to release.
 * @function_end
 */

/**
 * @function firebase_database_get_app
 * @desc **Firebase C++ SDK:** [firebase::database::Database::app](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database#app)
 *
 * This function returns a handle to the Firebase App a database belongs to. Release it with
 * ${function.firebase_app_release_handle}.
 *
 * @param {Real} database The database handle from ${function.firebase_database_get_instance}.
 * @returns {Real} An app handle, or `0` when the database handle is not valid.
 * @function_end
 */

/**
 * @function firebase_database_get_instance_for_app
 * @desc **Firebase C++ SDK:** [firebase::database::Database::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database#getinstance)
 *
 * This function returns a handle to the Realtime Database of another Firebase App, created with
 * ${function.firebase_app_initialize_with_options} or ${function.firebase_app_initialize_from_json}.
 * It returns `0` with ${function.firebase_last_error_code} set when the app handle is not valid or
 * the instance could not be created.
 *
 * @param {Real} app An app handle.
 * @returns {Real} The database handle, or `0` on failure.
 * @function_end
 */

/**
 * @function firebase_database_get_instance_for_app_url
 * @desc **Firebase C++ SDK:** [firebase::database::Database::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/database/database#getinstance_1)
 *
 * This function is ${function.firebase_database_get_instance_for_app} for a database URL of that
 * app.
 *
 * @param {Real} app An app handle.
 * @param {String} url The database's URL.
 * @returns {Real} The database handle, or `0` on failure.
 * @function_end
 */

/**
 * @struct FirebaseDatabaseReferenceInfo
 * @desc Every property of a reference in one struct, from ${function.firebase_database_ref_get}. It
 * carries no reference handles - the parent, the root and a copy of the location itself come from
 * ${function.firebase_database_ref_get_parent}, ${function.firebase_database_ref_get_root} and
 * ${function.firebase_database_query_get_reference}; the database handle is not released.
 *
 * @member {String} key The last segment of the path, or an empty string for the root.
 * @member {Bool} is_root Whether this is the root of the database.
 * @member {Bool} is_valid Whether the reference can be used.
 * @member {Real} database The database handle.
 * @member {String} url The location's full URL.
 * @struct_end
 */

/**
 * @struct FirebaseDataSnapshotInfo
 * @desc Every property of a snapshot but its value, from ${function.firebase_database_snapshot_get_info}.
 * It carries no handle; ${function.firebase_database_snapshot_get_reference} registers one to the
 * snapshot's location.
 *
 * @member {String} key The key of the snapshot's location.
 * @member {Bool} exists Whether there is data.
 * @member {Bool} is_valid Whether the snapshot can be read.
 * @member {Bool} has_children Whether the location is a node with children.
 * @member {Real} children_count The number of direct children.
 * @struct_end
 */

/**
 * @const FirebaseDatabaseError
 * @desc The `error_code` every Realtime Database callback receives, mirroring the SDK's codes value for
 * value. `None` is success. The ones a game meets: `PermissionDenied` (the security rules refused
 * the read or write - the default locked rules refuse everything), `NetworkError` and
 * `Disconnected` (the connection dropped mid-operation), `ExpiredToken` (the player's sign-in has
 * lapsed).
 *
 * @member None Success.
 * @member Disconnected The operation was aborted because the network disconnected.
 * @member ExpiredToken The authentication token has expired; sign the player in again.
 * @member InvalidToken The authentication token is not valid.
 * @member MaxRetries A transaction ran out of retries.
 * @member NetworkError A network error stopped the operation.
 * @member OperationFailed The server reported that the operation failed.
 * @member OverriddenBySet A transaction was overridden by a later set.
 * @member PermissionDenied The security rules refused the operation.
 * @member Unavailable The service is unavailable.
 * @member UnknownError An unknown error.
 * @member WriteCanceled The write was cancelled locally, for example by ${function.firebase_database_purge_outstanding_writes}.
 * @member InvalidVariantType A value of a kind the location does not accept - a priority or a map key that is not a number or a string.
 * @member ConflictingOperationInProgress Another write that cannot run alongside this one is in flight on the location - a set with a set-and-priority, an update with a set.
 * @member TransactionAbortedByUser A transaction was aborted by its handler (transactions are not available in this extension).
 * @const_end
 */

/**
 * @module database
 * @title Realtime Database
 * @desc This module covers the Firebase Realtime Database: one JSON tree per database, addressed by
 * path, read once or listened to, written whole or in atomic multi-path updates, queried by key,
 * value, priority or a child's value, with the server able to write on the client's behalf when its
 * connection drops. Everything starts from the database handle of
 * ${function.firebase_database_get_instance}. For a new game, Cloud Firestore (${module.firestore})
 * is the database Firebase recommends; the Realtime Database's strengths are latency, presence
 * through the disconnect handlers, and simplicity for small trees.
 *
 * ### Handles
 *
 * A reference, query, snapshot, listener and disconnect handler each reach GML as a numeric handle
 * with its own `*_release` function (listeners are freed by their `remove` function). A handle can
 * be released as soon as the call that consumed it has returned, because the SDK keeps its own
 * copy - except that removing a listener needs the reference or query it was added on, so keep that
 * one until then. Snapshots go the other way: each callback, each element of
 * ${function.firebase_database_snapshot_get_children} and each ${function.firebase_database_snapshot_child}
 * mints a new snapshot handle that the game must release.
 *
 * The query builders never change their input: `firebase_database_ref_*` starts a query from a
 * reference and `firebase_database_query_*` narrows a query, each returning a new handle with the
 * condition added. Release the intermediate handles as the chain is built.
 *
 * ### Data
 *
 * A location's data is written from a GML value and read back as one: a number becomes a JSON
 * number (a Firebase integer when it came from an `int64`, a double otherwise - both read back as
 * numbers), a string a string, `true`/`false` a boolean, a struct a node with one child per member,
 * an array a node with keys `0`, `1`, `2`... (which reads back as an array while the keys stay
 * sequential), and `undefined` deletes the location. There are no other value kinds - no
 * timestamps, references or blobs - beyond the server timestamp placeholder of
 * ${function.firebase_database_server_timestamp}, which reads back as a number of milliseconds.
 *
 * ### Reads, writes and the cache
 *
 * Every read and write takes a callback and returns ${constant.FirebaseError} at once; the
 * callback's `error_code` is a ${constant.FirebaseDatabaseError}. A write applies locally
 * immediately - a listener on the location fires before the network is touched - and its callback
 * fires when the server has accepted it, which offline means when the connection is back. The SDK
 * keeps in memory every location a listener is attached to, and with
 * ${function.firebase_database_set_persistence_enabled} keeps it on disk across runs. Transactions
 * are not available: ${function.firebase_database_ref_run_transaction} returns
 * `FirebaseError.Unsupported`, and a counter several devices change at once belongs on a server.
 *
 * ### Console setup
 *
 * Create the database under **Build > Realtime Database** in the Firebase console and write
 * security rules for it; the default locked rules refuse everything with
 * `FirebaseDatabaseError.PermissionDenied`, and test-mode rules expire after 30 days. Download
 * the credential file again after creating the database, so that it carries the database URL, or
 * pass the URL to ${function.firebase_database_get_instance_for_url}. ${page.guides_realtime}
 * walks through it.
 *
 * @section_func Instance
 * @desc The database instance, its references, persistence and connection:
 * @ref firebase_database_get_instance
 * @ref firebase_database_get_instance_for_url
 * @ref firebase_database_get_instance_for_app
 * @ref firebase_database_get_instance_for_app_url
 * @ref firebase_database_get_app
 * @ref firebase_database_get_url
 * @ref firebase_database_get_reference
 * @ref firebase_database_get_reference_at_path
 * @ref firebase_database_get_reference_from_url
 * @ref firebase_database_set_persistence_enabled
 * @ref firebase_database_set_log_level
 * @ref firebase_database_get_log_level
 * @ref firebase_database_go_offline
 * @ref firebase_database_go_online
 * @ref firebase_database_purge_outstanding_writes
 * @section_end
 *
 * @section_func References
 * @desc A reference names a location in the tree, which may or may not hold data; it reaches the
 * locations around it and is where reads, writes, listeners and queries start:
 * @ref firebase_database_ref_get
 * @ref firebase_database_ref_key
 * @ref firebase_database_ref_is_root
 * @ref firebase_database_ref_is_valid
 * @ref firebase_database_ref_get_parent
 * @ref firebase_database_ref_get_root
 * @ref firebase_database_ref_get_database
 * @ref firebase_database_ref_get_url
 * @ref firebase_database_ref_child
 * @ref firebase_database_ref_push
 * @ref firebase_database_ref_go_online
 * @ref firebase_database_ref_go_offline
 * @ref firebase_database_ref_release
 * @section_end
 *
 * @section_func Reading and writing
 * @desc Reading a location once, and the writes - whole value, priority, several paths at once,
 * delete - plus the server timestamp placeholder:
 * @ref firebase_database_ref_get_value
 * @ref firebase_database_ref_set_value
 * @ref firebase_database_ref_set_priority
 * @ref firebase_database_ref_set_value_and_priority
 * @ref firebase_database_ref_update_children
 * @ref firebase_database_ref_remove_value
 * @ref firebase_database_ref_run_transaction
 * @ref firebase_database_server_timestamp
 * @section_end
 *
 * @section_func Listening
 * @desc Being told when a location or its children change. A value listener delivers the whole subtree
 * on every change; a child listener delivers one child per event and is the right tool for a
 * list:
 * @ref firebase_database_ref_add_value_listener
 * @ref firebase_database_ref_remove_value_listener
 * @ref firebase_database_ref_remove_all_value_listeners
 * @ref firebase_database_ref_add_child_listener
 * @ref firebase_database_ref_remove_child_listener
 * @ref firebase_database_ref_remove_all_child_listeners
 * @ref firebase_database_ref_set_keep_synchronized
 * @section_end
 *
 * @section_func Queries from a reference
 * @desc Starting a query over a location's children - an order directive, then a range, then a limit.
 * A query has one order directive; a range without one compares priorities:
 * @ref firebase_database_ref_order_by_child
 * @ref firebase_database_ref_order_by_key
 * @ref firebase_database_ref_order_by_value
 * @ref firebase_database_ref_order_by_priority
 * @ref firebase_database_ref_start_at
 * @ref firebase_database_ref_start_at_key
 * @ref firebase_database_ref_end_at
 * @ref firebase_database_ref_end_at_key
 * @ref firebase_database_ref_equal_to
 * @ref firebase_database_ref_equal_to_key
 * @ref firebase_database_ref_limit_to_first
 * @ref firebase_database_ref_limit_to_last
 * @section_end
 *
 * @section_func Queries
 * @desc Narrowing a query further, running it, listening to it, and releasing it:
 * @ref firebase_database_query_order_by_child
 * @ref firebase_database_query_order_by_key
 * @ref firebase_database_query_order_by_value
 * @ref firebase_database_query_order_by_priority
 * @ref firebase_database_query_start_at
 * @ref firebase_database_query_start_at_key
 * @ref firebase_database_query_end_at
 * @ref firebase_database_query_end_at_key
 * @ref firebase_database_query_equal_to
 * @ref firebase_database_query_equal_to_key
 * @ref firebase_database_query_limit_to_first
 * @ref firebase_database_query_limit_to_last
 * @ref firebase_database_query_get_reference
 * @ref firebase_database_query_set_keep_synchronized
 * @ref firebase_database_query_is_valid
 * @ref firebase_database_query_get_value
 * @ref firebase_database_query_add_value_listener
 * @ref firebase_database_query_remove_value_listener
 * @ref firebase_database_query_remove_all_value_listeners
 * @ref firebase_database_query_add_child_listener
 * @ref firebase_database_query_remove_child_listener
 * @ref firebase_database_query_remove_all_child_listeners
 * @ref firebase_database_query_release
 * @section_end
 *
 * @section_func On disconnect
 * @desc Writes the server performs when this client's connection drops - presence and cleanup that
 * survive a crash:
 * @ref firebase_database_ref_on_disconnect
 * @ref firebase_database_on_disconnect_set_value
 * @ref firebase_database_on_disconnect_set_value_and_priority
 * @ref firebase_database_on_disconnect_update_children
 * @ref firebase_database_on_disconnect_remove_value
 * @ref firebase_database_on_disconnect_cancel
 * @ref firebase_database_on_disconnect_release
 * @section_end
 *
 * @section_func Snapshots
 * @desc What a read or a listener delivers - the data at a location and its children:
 * @ref firebase_database_snapshot_get_info
 * @ref firebase_database_snapshot_get_value
 * @ref firebase_database_snapshot_get_priority
 * @ref firebase_database_snapshot_exists
 * @ref firebase_database_snapshot_is_valid
 * @ref firebase_database_snapshot_key
 * @ref firebase_database_snapshot_child
 * @ref firebase_database_snapshot_has_child
 * @ref firebase_database_snapshot_has_children
 * @ref firebase_database_snapshot_children_count
 * @ref firebase_database_snapshot_get_children
 * @ref firebase_database_snapshot_get_reference
 * @ref firebase_database_snapshot_release
 * @section_end
 *
 * @section_struct Structs
 * @desc The following structs are used by this module:
 * @ref FirebaseDatabaseReferenceInfo
 * @ref FirebaseDataSnapshotInfo
 * @section_end
 *
 * @section_const Constants
 * @desc The following constants are used by this module:
 * @ref FirebaseDatabaseError
 * @section_end
 *
 * @module_end
 */
