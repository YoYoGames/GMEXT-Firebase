/**
 * @function firebase_firestore_get_instance
 * @desc **Firebase C++ SDK:** [firebase::firestore::Firestore::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/firestore#getinstance_1)
 *
 * This function returns a handle to the Cloud Firestore instance of the default Firebase App,
 * creating it on first use. The same handle comes back on every call, it lives as long as the game,
 * and there is nothing to release. Everything else in this module starts from it: a collection or
 * document reference from ${function.firebase_firestore_collection} and
 * ${function.firebase_firestore_document}, a write batch from ${function.firebase_firestore_batch}.
 *
 * It returns `0` when ${function.firebase_app_initialize} has not succeeded, with
 * ${function.firebase_last_error_code} set to `FirebaseError.NotInitialized`.
 *
 * [[Note: Cloud Firestore must be created in the Firebase console (Build > Firestore Database) before
 * the first request; see ${page.guides_firestore}. Until then every read and write fails in its
 * callback with `FirestoreError.NotFound` or `PermissionDenied`.]]
 *
 * @returns {Real} The instance handle, or `0` when the default app does not exist.
 *
 * @example
 * ```gml
 * // Create Event of a persistent controller
 * firestore = firebase_firestore_get_instance();
 * if (firestore == 0)
 * {
 *     show_debug_message("Firestore unavailable: " + firebase_last_error_message());
 *     exit;
 * }
 *
 * players = firebase_firestore_collection(firestore, "players");
 * ```
 * The above code takes the instance once and keeps a reference to the `players` collection for
 * the rest of the game. Both handles are cheap; the collection reference is released in the Clean Up
 * event with ${function.firebase_firestore_collection_ref_release}.
 * @function_end
 */

/**
 * @function firebase_firestore_get_instance_for_database
 * @desc **Firebase C++ SDK:** [firebase::firestore::Firestore::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/firestore#getinstance_3)
 *
 * This function returns a handle to a named Cloud Firestore database of the default Firebase App,
 * for projects that have more than one database. ${function.firebase_firestore_get_instance} is the
 * same call for the project's default database, `"(default)"`.
 *
 * @param {String} database_name The database ID as shown in the console.
 * @returns {Real} The instance handle, or `0` when the default app does not exist or the instance could not be created.
 * @function_end
 */

/**
 * @function firebase_firestore_settings_get_host
 * @desc **Firebase C++ SDK:** [firebase::firestore::Settings::host](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/settings#host)
 *
 * This function returns the host name the instance connects to - `"firestore.googleapis.com"`
 * unless ${function.firebase_firestore_settings_set_host} changed it.
 *
 * @param {Real} instance_ref The instance handle from ${function.firebase_firestore_get_instance}.
 * @returns {String} The backend host, or an empty string when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_settings_set_host
 * @desc **Firebase C++ SDK:** [firebase::firestore::Settings::set_host](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/settings#set_host)
 *
 * This function points the instance at another backend host. Its use is the local
 * [Firestore emulator](https://firebase.google.com/docs/emulator-suite/connect_firestore): set the
 * host to `"127.0.0.1:8080"` and turn SSL off with ${function.firebase_firestore_settings_set_ssl_enabled}.
 *
 * [[Warning: Settings can only be changed before the instance is used. Set them right after
 * ${function.firebase_firestore_get_instance} and before the first reference is read or written:
 * the SDK treats a later change as a programming error and stops the game.]]
 *
 * @param {Real} instance_ref The instance handle from ${function.firebase_firestore_get_instance}.
 * @param {String} host The host, with the port when it is not the default (`"127.0.0.1:8080"`).
 *
 * @example
 * ```gml
 * firestore = firebase_firestore_get_instance();
 * if (debug_mode)
 * {
 *     firebase_firestore_settings_set_host(firestore, "127.0.0.1:8080");
 *     firebase_firestore_settings_set_ssl_enabled(firestore, false);
 * }
 * ```
 * The above code routes every Firestore request to a local emulator while the game runs from the
 * IDE, before anything else touches the instance.
 * @function_end
 */

/**
 * @function firebase_firestore_settings_get_ssl_enabled
 * @desc **Firebase C++ SDK:** [firebase::firestore::Settings::is_ssl_enabled](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/settings#is_ssl_enabled)
 *
 * This function returns whether the instance talks to its host over SSL, which it does unless
 * ${function.firebase_firestore_settings_set_ssl_enabled} turned it off for an emulator.
 *
 * @param {Real} instance_ref The instance handle from ${function.firebase_firestore_get_instance}.
 * @returns {Bool} `true` when SSL is on, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_firestore_settings_set_ssl_enabled
 * @desc **Firebase C++ SDK:** [firebase::firestore::Settings::set_ssl_enabled](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/settings#set_ssl_enabled)
 *
 * This function turns SSL on or off for the instance's connection. The only reason to turn it off
 * is a local emulator; leave it on for the production host.
 *
 * [[Warning: Settings can only be changed before the instance is used. Set them right after
 * ${function.firebase_firestore_get_instance} and before the first reference is read or written:
 * the SDK treats a later change as a programming error and stops the game.]]
 *
 * @param {Real} instance_ref The instance handle from ${function.firebase_firestore_get_instance}.
 * @param {Bool} enabled `true` for SSL, `false` for a plain connection.
 * @function_end
 */

/**
 * @function firebase_firestore_settings_get_persistence_enabled
 * @desc **Firebase C++ SDK:** [firebase::firestore::Settings::is_persistence_enabled](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/settings#is_persistence_enabled)
 *
 * This function returns whether the instance keeps an on-disk cache of the documents it has read
 * and the writes it has not sent yet, which is on by default.
 *
 * @param {Real} instance_ref The instance handle from ${function.firebase_firestore_get_instance}.
 * @returns {Bool} `true` when the local cache is on, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_firestore_settings_set_persistence_enabled
 * @desc **Firebase C++ SDK:** [firebase::firestore::Settings::set_persistence_enabled](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/settings#set_persistence_enabled)
 *
 * This function turns the on-disk cache on or off. With it on (the default) reads are answered
 * from the cache while offline and writes are queued until the network is back; with it off, an
 * offline read fails with `FirestoreError.Unavailable` and nothing survives a restart.
 *
 * [[Warning: Settings can only be changed before the instance is used. Set them right after
 * ${function.firebase_firestore_get_instance} and before the first reference is read or written:
 * the SDK treats a later change as a programming error and stops the game.]]
 *
 * @param {Real} instance_ref The instance handle from ${function.firebase_firestore_get_instance}.
 * @param {Bool} enabled `true` to keep the local cache, `false` to run without one.
 * @function_end
 */

/**
 * @function firebase_firestore_settings_get_cache_size_bytes
 * @desc **Firebase C++ SDK:** [firebase::firestore::Settings::cache_size_bytes](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/settings#cache_size_bytes)
 *
 * This function returns the size the on-disk cache is allowed to grow to before the SDK starts
 * discarding documents it has not used recently - 100 MB by default, or `-1` for no limit.
 *
 * @param {Real} instance_ref The instance handle from ${function.firebase_firestore_get_instance}.
 * @returns {Real} The cache size threshold in bytes, `-1` for unlimited, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_settings_set_cache_size_bytes
 * @desc **Firebase C++ SDK:** [firebase::firestore::Settings::set_cache_size_bytes](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/settings#set_cache_size_bytes)
 *
 * This function sets the size the on-disk cache may reach before the SDK removes documents that
 * have not been used recently. It is a threshold, not a hard limit: the cache is trimmed once it is
 * found above the size, not kept below it. The minimum is 1 MB; `-1` disables the trimming.
 *
 * [[Warning: Settings can only be changed before the instance is used. Set them right after
 * ${function.firebase_firestore_get_instance} and before the first reference is read or written:
 * the SDK treats a later change as a programming error and stops the game.]]
 *
 * @param {Real} instance_ref The instance handle from ${function.firebase_firestore_get_instance}.
 * @param {Real} bytes The threshold in bytes (at least 1048576), or `-1` for no limit.
 * @function_end
 */

/**
 * @function firebase_firestore_collection
 * @desc **Firebase C++ SDK:** [firebase::firestore::Firestore::Collection](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/firestore#collection)
 *
 * This function returns a reference to a collection, from a slash-separated path with an odd number
 * of segments: `"players"` for a root collection, `"players/USER_123/inventory"` for a
 * subcollection. Nothing is read; the reference is a name. Release it with
 * ${function.firebase_firestore_collection_ref_release}.
 *
 * @param {Real} instance_ref The instance handle from ${function.firebase_firestore_get_instance}.
 * @param {String} path The collection's path.
 * @returns {Real} A collection reference handle, or `0` when the instance handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_document
 * @desc **Firebase C++ SDK:** [firebase::firestore::Firestore::Document](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/firestore#document)
 *
 * This function returns a reference to a document, from a slash-separated path with an even number
 * of segments: `"players/USER_123"`. The document need not exist - the reference is where it would
 * be, and ${function.firebase_firestore_document_ref_set} creates it. Release the handle with
 * ${function.firebase_firestore_document_ref_release}.
 *
 * @param {Real} instance_ref The instance handle from ${function.firebase_firestore_get_instance}.
 * @param {String} path The document's path.
 * @returns {Real} A document reference handle, or `0` when the instance handle is not valid.
 *
 * @example
 * ```gml
 * var _player = firebase_firestore_document(firestore, "players/" + firebase_auth_user_get_info(user).uid);
 * firebase_firestore_document_ref_get(_player, FirestoreSource.Default, function(_error_code, _error_message, _snapshot)
 * {
 *     if (_error_code == FirestoreError.Ok && firebase_firestore_document_snapshot_get_info(_snapshot).exists)
 *     {
 *         var _data = firebase_firestore_document_snapshot_get_data(_snapshot, FirestoreServerTimestampBehavior.None);
 *         show_debug_message($"Welcome back, {_data.name} (level {_data.level})");
 *     }
 *     if (!is_undefined(_snapshot)) firebase_firestore_document_snapshot_release(_snapshot);
 * });
 * firebase_firestore_document_ref_release(_player);
 * ```
 * The above code reads the signed-in player's document, keyed by their Authentication user ID,
 * and prints two of its fields. The reference is released as soon as the read has started and the
 * snapshot as soon as it has been read.
 * @function_end
 */

/**
 * @function firebase_firestore_collection_group
 * @desc **Firebase C++ SDK:** [firebase::firestore::Firestore::CollectionGroup](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/firestore#collectiongroup)
 *
 * This function returns a query over every collection and subcollection in the database whose last
 * path segment is the given ID - all the `inventory` subcollections of all players at once. Refine
 * it with the `firebase_firestore_query_*` functions and run it with
 * ${function.firebase_firestore_query_get}; release it with ${function.firebase_firestore_query_release}.
 *
 * A collection group query needs a collection group index, which the console offers to create the
 * first time the query fails with `FirestoreError.FailedPrecondition`.
 *
 * @param {Real} instance_ref The instance handle from ${function.firebase_firestore_get_instance}.
 * @param {String} collection_id The collection ID (one segment, no slash).
 * @returns {Real} A query handle, or `0` when the instance handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_batch
 * @desc **Firebase C++ SDK:** [firebase::firestore::Firestore::batch](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/firestore#batch)
 *
 * This function creates a write batch: a set of writes to several documents that
 * ${function.firebase_firestore_write_batch_commit} applies as one atomic unit - all of them land
 * or none does. Add writes with ${function.firebase_firestore_write_batch_set},
 * ${function.firebase_firestore_write_batch_update} and ${function.firebase_firestore_write_batch_delete};
 * nothing is visible, locally or on the server, until the commit. A batch holds up to 500 writes.
 *
 * Unlike a transaction, a batch does not read anything, so it works offline and is queued like any
 * other write. Release it with ${function.firebase_firestore_write_batch_release}.
 *
 * @param {Real} instance_ref The instance handle from ${function.firebase_firestore_get_instance}.
 * @returns {Real} A write batch handle, or `0` when the instance handle is not valid.
 *
 * @example
 * ```gml
 * var _batch = firebase_firestore_batch(firestore);
 * var _player = firebase_firestore_document(firestore, "players/USER_123");
 * var _guild = firebase_firestore_document(firestore, "guilds/GUILD_001");
 * var _members = firebase_firestore_field_value_array_union(["USER_123"]);
 *
 * firebase_firestore_write_batch_update(_batch, _player, { guild: "GUILD_001" });
 * firebase_firestore_write_batch_update(_batch, _guild, { members: _members });
 * firebase_firestore_write_batch_commit(_batch, function(_error_code, _error_message)
 * {
 *     show_debug_message(_error_code == FirestoreError.Ok ? "Joined the guild" : _error_message);
 * });
 *
 * firebase_firestore_field_value_release(_members);
 * firebase_firestore_document_ref_release(_player);
 * firebase_firestore_document_ref_release(_guild);
 * firebase_firestore_write_batch_release(_batch);
 * ```
 * The above code joins a guild by updating the player and the guild in one atomic commit, so the
 * two can never disagree. Every handle is released once the commit has been started; the SDK holds
 * its own copies.
 * @function_end
 */

/**
 * @function firebase_firestore_set_log_level
 * @desc **Firebase C++ SDK:** [firebase::firestore::Firestore::set_log_level](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/firestore#set_log_level)
 *
 * This function sets how much every Firestore instance logs to the platform's log (logcat on
 * Android, the Xcode console on iOS, the standard output on desktop), separately from the SDK-wide
 * level of ${function.firebase_set_log_level}. The default is `FirebaseLogLevel.Info`. A value
 * outside ${constant.FirebaseLogLevel} is refused with `FirebaseError.InvalidArgument` in
 * ${function.firebase_last_error_code}.
 *
 * @param {Enum.FirebaseLogLevel} level The new level.
 * @function_end
 */

/**
 * @function firebase_firestore_enable_network
 * @desc **Firebase C++ SDK:** [firebase::firestore::Firestore::EnableNetwork](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/firestore#enablenetwork)
 *
 * This function reconnects the instance to the backend after ${function.firebase_firestore_disable_network},
 * and sends the writes that queued up while it was off. Calling it while the network is already
 * enabled does nothing and still calls the callback.
 *
 * @param {Real} instance_ref The instance handle from ${function.firebase_firestore_get_instance}.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the network is enabled.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_firestore_disable_network
 * @desc **Firebase C++ SDK:** [firebase::firestore::Firestore::DisableNetwork](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/firestore#disablenetwork)
 *
 * This function takes the instance offline: reads and listeners are answered from the local cache,
 * and writes queue up until ${function.firebase_firestore_enable_network}. It is the way to test the
 * game's offline behaviour without pulling the cable. Calling it while the network is already
 * disabled does nothing and still calls the callback.
 *
 * @param {Real} instance_ref The instance handle from ${function.firebase_firestore_get_instance}.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the network is disabled.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_firestore_terminate
 * @desc **Firebase C++ SDK:** [firebase::firestore::Firestore::Terminate](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/firestore#terminate)
 *
 * This function shuts the instance down and releases its resources. After the callback the instance
 * handle and every reference, query, batch, transaction and snapshot derived from it are dead; only
 * ${function.firebase_firestore_clear_persistence} may still be called on it, and
 * ${function.firebase_firestore_get_instance} then creates a fresh instance and frees the
 * terminated one. Pending writes are not cancelled - they are sent the next time the instance
 * starts.
 *
 * Under normal circumstances there is no reason to call this. Its use is a test that wants to wipe
 * the local state between runs.
 *
 * @param {Real} instance_ref The instance handle from ${function.firebase_firestore_get_instance}.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the instance has shut down.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_firestore_clear_persistence
 * @desc **Firebase C++ SDK:** [firebase::firestore::Firestore::ClearPersistence](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/firestore#clearpersistence)
 *
 * This function deletes the on-disk cache - cached documents and queued writes alike. It only works
 * while the instance is not running: right after ${function.firebase_firestore_get_instance} and
 * before anything else, or after ${function.firebase_firestore_terminate}. Called on a running
 * instance it fails in the callback with `FirestoreError.FailedPrecondition`.
 *
 * It exists for tests. A game that must not leave data on the device between players should run
 * with persistence off (${function.firebase_firestore_settings_set_persistence_enabled}) instead;
 * the clear does not overwrite the data securely.
 *
 * @param {Real} instance_ref The instance handle from ${function.firebase_firestore_get_instance}.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the cache has been cleared, or with the reason it was not.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_firestore_wait_for_pending_writes
 * @desc **Firebase C++ SDK:** [firebase::firestore::Firestore::WaitForPendingWrites](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/firestore#waitforpendingwrites)
 *
 * This function calls back once every write issued so far - including writes queued in a previous
 * run of the game - has been acknowledged by the backend, or at once when nothing is pending. Writes
 * made after the call are not waited for; call it again for those. A change of the signed-in user
 * fails any outstanding wait.
 *
 * Use it before showing "your progress is saved" for something that matters, since a write's own
 * callback already fires when the server has accepted that write.
 *
 * @param {Real} instance_ref The instance handle from ${function.firebase_firestore_get_instance}.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when every pending write has reached the server.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_firestore_run_transaction
 * @desc **Firebase C++ SDK:** [firebase::firestore::Firestore::RunTransaction](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/firestore#runtransaction_1)
 *
 * This function runs a transaction: reads followed by writes that the server applies as one atomic
 * unit, and only if none of the documents read changed in between. The SDK calls `update_callback`
 * with a transaction handle; inside it the game reads with
 * ${function.firebase_firestore_transaction_get}, records writes with
 * ${function.firebase_firestore_transaction_set}, ${function.firebase_firestore_transaction_update}
 * and ${function.firebase_firestore_transaction_delete}, and ends the attempt with
 * ${function.firebase_firestore_transaction_commit} or
 * ${function.firebase_firestore_transaction_abort}. Each read delivers its snapshot through its own
 * callback, every read must come before the first write, and nothing is sent until the commit.
 * The update callback need not finish in one step: the handle stays valid, across events, until
 * the commit or abort.
 *
 * When a document the attempt read changed on the server before the commit, or the commit could
 * not reach the server, the SDK discards the attempt and calls `update_callback` again with a new
 * handle, up to `max_attempts` times in all (the SDK's default is 5); the game redoes its reads
 * and writes on the new handle, so the update callback must keep no state from one attempt to
 * the next. The callback fires once: when the commit has been accepted, with the error of the
 * last attempt when it was not, or with `FirestoreError.Aborted` and the message given to
 * ${function.firebase_firestore_transaction_abort} when the game aborted.
 *
 * A transaction needs the server: a read fails with `FirestoreError.Unavailable` offline, and the
 * attempt should then be aborted. A transaction still waiting for its commit when
 * ${function.firebase_firestore_terminate} is called is abandoned - its handle dies with the
 * instance and its callback does not fire. For an atomic write that depends on no read, a write
 * batch (${function.firebase_firestore_batch}) works offline as well; for a counter,
 * ${function.firebase_firestore_field_value_increment_integer} needs no transaction.
 *
 * @param {Real} instance_ref The instance handle from ${function.firebase_firestore_get_instance}.
 * @param {Real} max_attempts How many times the update callback may run before the transaction gives up; at least `1`.
 * @param {Function} [update_callback] The function that performs the attempt's reads and writes; called once per attempt with the transaction handle.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire. `FirebaseError.InvalidArgument` when `update_callback` is not a function or `max_attempts` is below `1`.
 *
 * @event callback:update_callback
 * @desc Fires once per attempt, with the handle the attempt's reads and writes take.
 * @member {Real} transaction_ref The transaction handle; valid until ${function.firebase_firestore_transaction_commit} or ${function.firebase_firestore_transaction_abort}, when it is freed.
 * @event_end
 *
 * @event callback
 * @desc Fires once when the server has accepted the commit, when the game aborted, or with the reason the transaction failed.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @example
 * ```gml
 * // Create Event
 * firestore = firebase_firestore_get_instance();
 * transaction_ref = 0;
 *
 * // Left Pressed Event
 * firebase_firestore_run_transaction(firestore, 5, function(_transaction_ref)
 * {
 *     transaction_ref = _transaction_ref;
 *     var _player = firebase_firestore_document(firestore, "players/USER_123");
 *     firebase_firestore_transaction_get(transaction_ref, _player, function(_error_code, _error_message, _snapshot)
 *     {
 *         if (_error_code != FirestoreError.Ok)
 *         {
 *             firebase_firestore_transaction_abort(transaction_ref, _error_message);
 *             return;
 *         }
 *         var _data = firebase_firestore_document_snapshot_get_data(_snapshot, FirestoreServerTimestampBehavior.None);
 *         var _level = _data[$ "level"] ?? 0;
 *         var _doc = firebase_firestore_document_snapshot_reference(_snapshot);
 *         firebase_firestore_transaction_set_merge(transaction_ref, _doc, { level: _level + 1 });
 *         firebase_firestore_transaction_commit(transaction_ref);
 *         firebase_firestore_document_ref_release(_doc);
 *         firebase_firestore_document_snapshot_release(_snapshot);
 *     });
 *     firebase_firestore_document_ref_release(_player);
 * },
 * function(_error_code, _error_message)
 * {
 *     show_debug_message(_error_code == FirestoreError.Ok ? "Level up" : _error_message);
 * });
 * ```
 * The above code raises the player's level by one, safely against another device doing the same
 * at the same moment: the read and the write are one attempt, and if the document changed in
 * between the SDK runs the update callback again. The handle is kept in an instance variable
 * because a GML function literal does not capture the local variables of the function around it;
 * each attempt overwrites it. A missing document reads as an empty struct, so the level starts at
 * `0`. The reference is released as soon as the read is queued, and the snapshot and the
 * reference taken from it once the commit has been started.
 * @function_end
 */

/**
 * @function firebase_firestore_transaction_get
 * @desc **Firebase C++ SDK:** [firebase::firestore::Transaction::Get](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/transaction#get)
 *
 * This function reads a document inside the transaction, from the server: the snapshot is the
 * document as the transaction sees it, and the commit only goes through if the document has not
 * changed since. Reads come before writes - a read after the attempt's first write fails with
 * `FirestoreError.InvalidArgument`. The calls on a handle run in the order they were made, and a
 * read holds the ones after it until the server has answered; a commit made before the read's
 * callback still commits, without the writes that callback would have recorded. Put the writes
 * that depend on a read, and the commit, in the read's callback.
 *
 * A document that does not exist is not an error: the `exists` of its
 * ${function.firebase_firestore_document_snapshot_get_info} is `false`. Release the snapshot with
 * ${function.firebase_firestore_document_snapshot_release}. A read that fails - offline, a security
 * rule - should end in ${function.firebase_firestore_transaction_abort}.
 *
 * @param {Real} transaction_ref The transaction handle the update callback of ${function.firebase_firestore_run_transaction} received.
 * @param {Real} document_ref A document reference handle.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the read was queued, otherwise `FirebaseError.InvalidHandle` for a handle that is not valid or an attempt that has already ended.
 *
 * @event callback
 * @desc Fires once with the snapshot.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} snapshot A document snapshot handle to release with ${function.firebase_firestore_document_snapshot_release}, or `undefined` on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_firestore_transaction_set
 * @desc **Firebase C++ SDK:** [firebase::firestore::Transaction::Set](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/transaction#set)
 *
 * This function records a full write of a document in the transaction - the transaction's
 * ${function.firebase_firestore_document_ref_set}: the document is created or replaced with
 * exactly the fields in `data`. Nothing is sent until ${function.firebase_firestore_transaction_commit}; the function only
 * records the write and returns whether it did.
 *
 * @param {Real} transaction_ref The transaction handle the update callback of ${function.firebase_firestore_run_transaction} received.
 * @param {Real} document_ref A document reference handle.
 * @param {Any} data A struct of field names to values; see the module's Data section for the conversion.
 * @returns {Bool} `true` when the write was recorded, `false` when a handle was not valid or the attempt has already ended.
 * @function_end
 */

/**
 * @function firebase_firestore_transaction_set_merge
 * @desc **Firebase C++ SDK:** [firebase::firestore::Transaction::Set](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/transaction#set)
 *
 * This function records a merge write of a document in the transaction - the transaction's
 * ${function.firebase_firestore_document_ref_set_merge}: the fields in `data` are written, the
 * rest left alone, and the document is created if it does not exist. Nothing is sent until ${function.firebase_firestore_transaction_commit}; the function only
 * records the write and returns whether it did.
 *
 * @param {Real} transaction_ref The transaction handle the update callback of ${function.firebase_firestore_run_transaction} received.
 * @param {Real} document_ref A document reference handle.
 * @param {Any} data A struct of field names to values; see the module's Data section for the conversion.
 * @returns {Bool} `true` when the write was recorded, `false` when a handle was not valid or the attempt has already ended.
 * @function_end
 */

/**
 * @function firebase_firestore_transaction_set_merge_fields
 * @desc **Firebase C++ SDK:** [firebase::firestore::Transaction::Set](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/transaction#set)
 *
 * This function records a merge of the named fields in the transaction - the transaction's
 * ${function.firebase_firestore_document_ref_set_merge_fields}. Nothing is sent until ${function.firebase_firestore_transaction_commit}; the function only
 * records the write and returns whether it did.
 *
 * @param {Real} transaction_ref The transaction handle the update callback of ${function.firebase_firestore_run_transaction} received.
 * @param {Real} document_ref A document reference handle.
 * @param {Any} data A struct of field names to values; see the module's Data section for the conversion.
 * @param {Array[String]} fields The names of the fields to write.
 * @returns {Bool} `true` when the write was recorded, `false` when a handle was not valid or the attempt has already ended.
 * @function_end
 */

/**
 * @function firebase_firestore_transaction_set_merge_field_paths
 * @desc **Firebase C++ SDK:** [firebase::firestore::Transaction::Set](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/transaction#set)
 *
 * This function records a merge of the fields named by field path handles in the transaction -
 * the transaction's ${function.firebase_firestore_document_ref_set_merge_field_paths}. Nothing is sent until ${function.firebase_firestore_transaction_commit}; the function only
 * records the write and returns whether it did.
 *
 * @param {Real} transaction_ref The transaction handle the update callback of ${function.firebase_firestore_run_transaction} received.
 * @param {Real} document_ref A document reference handle.
 * @param {Any} data A struct of field names to values; see the module's Data section for the conversion.
 * @param {Array[Real]} field_paths An array of field path handles naming the fields to write.
 * @returns {Bool} `true` when the write was recorded, `false` when a handle was not valid or the attempt has already ended.
 * @function_end
 */

/**
 * @function firebase_firestore_transaction_update
 * @desc **Firebase C++ SDK:** [firebase::firestore::Transaction::Update](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/transaction#update)
 *
 * This function records an update in the transaction - the transaction's
 * ${function.firebase_firestore_document_ref_update}: the given fields change, the document must
 * already exist, and the values can be sentinels such as
 * ${function.firebase_firestore_field_value_increment_integer}. A missing document fails the
 * commit with `FirestoreError.NotFound`, which is not retried. Nothing is sent until ${function.firebase_firestore_transaction_commit}; the function only
 * records the write and returns whether it did.
 *
 * @param {Real} transaction_ref The transaction handle the update callback of ${function.firebase_firestore_run_transaction} received.
 * @param {Real} document_ref A document reference handle.
 * @param {Any} data A struct of field names to values; see the module's Data section for the conversion.
 * @returns {Bool} `true` when the write was recorded, `false` when a handle was not valid or the attempt has already ended.
 * @function_end
 */

/**
 * @function firebase_firestore_transaction_update_field_paths
 * @desc **Firebase C++ SDK:** [firebase::firestore::Transaction::Update](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/transaction#update_1)
 *
 * This function records an update by field path handles in the transaction - the transaction's
 * ${function.firebase_firestore_document_ref_update_field_paths}. Nothing is sent until ${function.firebase_firestore_transaction_commit}; the function only
 * records the write and returns whether it did.
 *
 * @param {Real} transaction_ref The transaction handle the update callback of ${function.firebase_firestore_run_transaction} received.
 * @param {Real} document_ref A document reference handle.
 * @param {Array[Struct.FirestoreFieldPathValue]} entries An array of `{ field_path, value }` structs.
 * @returns {Bool} `true` when the write was recorded, `false` when a handle was not valid or the attempt has already ended.
 * @function_end
 */

/**
 * @function firebase_firestore_transaction_delete
 * @desc **Firebase C++ SDK:** [firebase::firestore::Transaction::Delete](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/transaction#delete)
 *
 * This function records a delete of a document in the transaction - the transaction's
 * ${function.firebase_firestore_document_ref_delete}. Nothing is sent until ${function.firebase_firestore_transaction_commit}; the function only
 * records the write and returns whether it did.
 *
 * @param {Real} transaction_ref The transaction handle the update callback of ${function.firebase_firestore_run_transaction} received.
 * @param {Real} document_ref A document reference handle.
 * @returns {Bool} `true` when the write was recorded, `false` when a handle was not valid or the attempt has already ended.
 * @function_end
 */

/**
 * @function firebase_firestore_transaction_commit
 * @desc This function ends the attempt and lets the SDK commit it: the writes recorded on the handle go
 * to the server as one atomic unit, on the condition that no document the attempt read has
 * changed. The handle is freed at once - calls on it afterwards fail with
 * `FirebaseError.InvalidHandle` - and the outcome arrives in the callback of
 * ${function.firebase_firestore_run_transaction}, which runs the update callback again with a new
 * handle when a document did change underneath the attempt. An attempt that recorded no write
 * still checks its reads, and succeeds when they are unchanged.
 *
 * @param {Real} transaction_ref The transaction handle the update callback of ${function.firebase_firestore_run_transaction} received.
 * @returns {Bool} `true` when the attempt was ended, `false` when the handle is not valid or the attempt had already ended.
 * @function_end
 */

/**
 * @function firebase_firestore_transaction_abort
 * @desc This function ends the attempt without committing it: nothing recorded on the handle is sent,
 * the SDK does not retry, and the callback of ${function.firebase_firestore_run_transaction} fires
 * with `FirestoreError.Aborted` and `error_message`. The handle is freed at once. This is the
 * answer to a read that failed, and to data that makes the write pointless - a level already at
 * its cap.
 *
 * @param {Real} transaction_ref The transaction handle the update callback of ${function.firebase_firestore_run_transaction} received.
 * @param {String} error_message The message the transaction's callback receives.
 * @returns {Bool} `true` when the attempt was ended, `false` when the handle is not valid or the attempt had already ended.
 * @function_end
 */

/**
 * @function firebase_firestore_collection_ref_id
 * @desc **Firebase C++ SDK:** [firebase::firestore::CollectionReference::id](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/collection-reference#id)
 *
 * This function returns the last segment of the collection's path - `"inventory"` for
 * `"players/USER_123/inventory"`.
 *
 * @param {Real} ref A collection reference handle.
 * @returns {String} The collection ID, or an empty string when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_collection_ref_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::CollectionReference::path](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/collection-reference#path)
 *
 * This function returns the collection's full slash-separated path from the root of the database.
 *
 * @param {Real} ref A collection reference handle.
 * @returns {String} The path, or an empty string when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_collection_ref_parent
 * @desc **Firebase C++ SDK:** [firebase::firestore::CollectionReference::Parent](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/collection-reference#parent)
 *
 * This function returns a reference to the document a subcollection sits under. For a root
 * collection the returned reference is not valid (${function.firebase_firestore_document_ref_is_valid}
 * is `false`); it is still a handle to release with ${function.firebase_firestore_document_ref_release}.
 *
 * @param {Real} ref A collection reference handle.
 * @returns {Real} A document reference handle, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_collection_ref_document
 * @desc **Firebase C++ SDK:** [firebase::firestore::CollectionReference::Document](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/collection-reference#document)
 *
 * This function returns a reference to a new document in the collection with an ID the SDK
 * generates locally - 20 random characters, unique for all practical purposes. Write it with
 * ${function.firebase_firestore_document_ref_set}; to add a document and get its reference in one
 * step, ${function.firebase_firestore_collection_ref_add} does both. Release the handle with
 * ${function.firebase_firestore_document_ref_release}.
 *
 * @param {Real} ref A collection reference handle.
 * @returns {Real} A document reference handle, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_collection_ref_document_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::CollectionReference::Document](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/collection-reference#document_1)
 *
 * This function returns a reference to the document at a path relative to the collection - one
 * segment for a document in it (`"USER_123"`), more to go through a subcollection. Release the
 * handle with ${function.firebase_firestore_document_ref_release}.
 *
 * @param {Real} ref A collection reference handle.
 * @param {String} path The document's path relative to the collection.
 * @returns {Real} A document reference handle, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_collection_ref_add
 * @desc **Firebase C++ SDK:** [firebase::firestore::CollectionReference::Add](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/collection-reference#add)
 *
 * This function creates a new document in the collection with an auto-generated ID and the given
 * fields, and hands the callback a reference to it. The write goes into the local cache at once and
 * is sent to the server when the network allows; the callback fires when the server has accepted
 * it.
 *
 * @param {Real} ref A collection reference handle.
 * @param {Any} data A struct of field names to values; see the module's Data section for the conversion.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the server has accepted the document.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} document A reference handle to the new document, to release with ${function.firebase_firestore_document_ref_release}, or `undefined` on failure.
 * @event_end
 *
 * @example
 * ```gml
 * var _scores = firebase_firestore_collection(firestore, "scores");
 * var _when = firebase_firestore_field_value_server_timestamp();
 * firebase_firestore_collection_ref_add(_scores, { user: firebase_auth_user_get_info(user).uid, score: 1250, mode: "ranked", created_at: _when },
 *     function(_error_code, _error_message, _document)
 *     {
 *         if (_error_code == FirestoreError.Ok)
 *         {
 *             show_debug_message("Score saved as " + firebase_firestore_document_ref_id(_document));
 *             firebase_firestore_document_ref_release(_document);
 *         }
 *         else
 *         {
 *             show_debug_message("Save failed: " + _error_message);
 *         }
 *     });
 * firebase_firestore_field_value_release(_when);
 * firebase_firestore_collection_ref_release(_scores);
 * ```
 * The above code adds a score document whose `created_at` the server fills in, and prints the ID
 * the SDK generated. The sentinel and the collection reference are released once the add has been
 * started; the document reference the callback receives is released inside it.
 * @function_end
 */

/**
 * @function firebase_firestore_collection_ref_is_valid
 * @desc **Firebase C++ SDK:** [firebase::firestore::CollectionReference::is_valid](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/collection-reference#is_valid)
 *
 * This function returns whether the handle refers to a usable collection reference - `false` for a
 * released handle and for any reference derived from an instance that has been terminated.
 *
 * @param {Real} ref A collection reference handle.
 * @returns {Bool} `true` when the reference can be used, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_firestore_collection_ref_release
 * @desc This function releases a collection reference handle. Release it as soon as the calls that need
 * it have been started; a query built from it keeps its own copy. A handle that is not a collection
 * reference sets ${function.firebase_last_error_code} to `FirebaseError.InvalidHandle`.
 *
 * @param {Real} ref The handle to release.
 * @function_end
 */

/**
 * @function firebase_firestore_document_ref_id
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentReference::id](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-reference#id)
 *
 * This function returns the document's ID - the last segment of its path.
 *
 * @param {Real} ref A document reference handle.
 * @returns {String} The document ID, or an empty string when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_document_ref_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentReference::path](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-reference#path)
 *
 * This function returns the document's full slash-separated path from the root of the database.
 *
 * @param {Real} ref A document reference handle.
 * @returns {String} The path, or an empty string when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_document_ref_parent
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentReference::Parent](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-reference#parent)
 *
 * This function returns a reference to the collection the document is in. Release it with
 * ${function.firebase_firestore_collection_ref_release}.
 *
 * @param {Real} ref A document reference handle.
 * @returns {Real} A collection reference handle, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_document_ref_collection
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentReference::Collection](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-reference#collection)
 *
 * This function returns a reference to a subcollection of the document, from a path relative to it
 * (`"inventory"`). Release it with ${function.firebase_firestore_collection_ref_release}.
 *
 * @param {Real} ref A document reference handle.
 * @param {String} path The subcollection's path relative to the document.
 * @returns {Real} A collection reference handle, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_document_ref_get
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentReference::Get](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-reference#get)
 *
 * This function reads the document once. With `FirestoreSource.Default` the SDK asks the server and
 * falls back to the local cache when it cannot be reached; `Server` fails instead of falling back
 * (`FirestoreError.Unavailable`); `Cache` answers from the cache without touching the network and
 * fails when the document is not cached.
 *
 * The callback receives a document snapshot. A document that does not exist is not an error: the
 * `exists` of its ${function.firebase_firestore_document_snapshot_get_info} is `false`. Read the fields
 * with ${function.firebase_firestore_document_snapshot_get_data} or
 * ${function.firebase_firestore_document_snapshot_get}, then release the snapshot with
 * ${function.firebase_firestore_document_snapshot_release}. To be told about every later change
 * instead, use ${function.firebase_firestore_document_ref_add_snapshot_listener}.
 *
 * @param {Real} ref A document reference handle.
 * @param {Enum.FirestoreSource} source Where to read from: `FirestoreSource.Default`, `Server` or `Cache`.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire. `FirebaseError.InvalidArgument` for a `source` outside the enum.
 *
 * @event callback
 * @desc Fires once with the snapshot.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} snapshot A document snapshot handle to release with ${function.firebase_firestore_document_snapshot_release}, or `undefined` on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_firestore_document_ref_set
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentReference::Set](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-reference#set)
 *
 * This function writes the document, replacing whatever it held: fields not in `data` are removed.
 * The document is created if it does not exist. To keep the fields you do not mention, use
 * ${function.firebase_firestore_document_ref_set_merge}; to change fields in a document that must
 * already exist, ${function.firebase_firestore_document_ref_update}.
 *
 * The write goes into the local cache at once - a listener on the document fires immediately, with
 * `has_pending_writes` - and the callback fires when the server has accepted it, which offline
 * means not until the network is back.
 *
 * @param {Real} ref A document reference handle.
 * @param {Any} data A struct of field names to values; see the module's Data section for the conversion.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the server has accepted the write, or with the reason it did not.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @example
 * ```gml
 * var _player = firebase_firestore_document(firestore, "players/USER_123");
 * var _created = firebase_firestore_field_value_server_timestamp();
 * var _level = firebase_firestore_field_value_integer(12);
 * var _home = firebase_firestore_field_value_geo_point(51.2465, 22.5684);
 *
 * firebase_firestore_document_ref_set(_player,
 *     { name: "Player", level: _level, rating: 4.75, tags: ["new", "pc"], home: _home, created_at: _created },
 *     function(_error_code, _error_message)
 *     {
 *         show_debug_message(_error_code == FirestoreError.Ok ? "Player created" : _error_message);
 *     });
 *
 * firebase_firestore_field_value_release(_created);
 * firebase_firestore_field_value_release(_level);
 * firebase_firestore_field_value_release(_home);
 * firebase_firestore_document_ref_release(_player);
 * ```
 * The above code creates a player document with one field of each interesting kind: an integer
 * (a plain GML number would be stored as a double), a double, an array, a geo point and a server
 * timestamp. The handles are released once the write has been started.
 * @function_end
 */

/**
 * @function firebase_firestore_document_ref_set_merge
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentReference::Set](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-reference#set)
 *
 * This function writes the fields in `data` into the document and leaves every other field as it
 * is, creating the document if it does not exist. A nested struct merges field by field too. It is
 * the write to use when the document may or may not exist yet; when it must exist,
 * ${function.firebase_firestore_document_ref_update} fails instead of creating it.
 *
 * The write goes into the local cache at once - a listener on the document fires immediately, with
 * `has_pending_writes` - and the callback fires when the server has accepted it, which offline
 * means not until the network is back.
 *
 * @param {Real} ref A document reference handle.
 * @param {Any} data A struct of field names to values; see the module's Data section for the conversion.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the server has accepted the write, or with the reason it did not.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_firestore_document_ref_set_merge_fields
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentReference::Set](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-reference#set)
 *
 * This function is ${function.firebase_firestore_document_ref_set_merge} restricted to the named
 * fields: only those are written from `data`, everything else in `data` is ignored, and every field
 * not named is left as it is. Each name must have a value in `data`, or the write fails. Names can
 * be dotted paths to nested fields; for a field whose name contains a dot, use
 * ${function.firebase_firestore_document_ref_set_merge_field_paths}.
 *
 * @param {Real} ref A document reference handle.
 * @param {Any} data A struct of field names to values; see the module's Data section for the conversion.
 * @param {Array[String]} fields The names of the fields to write.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the server has accepted the write, or with the reason it did not.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_firestore_document_ref_update
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentReference::Update](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-reference#update)
 *
 * This function changes fields of a document that already exists, leaving the others as they are.
 * A missing document fails the callback with `FirestoreError.NotFound`. Keys in `data` can be dotted
 * paths into nested maps (`"stats.wins"`), and the values can be the sentinels from the field value
 * constructors - ${function.firebase_firestore_field_value_increment_integer},
 * ${function.firebase_firestore_field_value_array_union},
 * ${function.firebase_firestore_field_value_delete} - which the server applies to the current
 * value.
 *
 * The write goes into the local cache at once - a listener on the document fires immediately, with
 * `has_pending_writes` - and the callback fires when the server has accepted it, which offline
 * means not until the network is back.
 *
 * @param {Real} ref A document reference handle.
 * @param {Any} data A struct of field names to values; see the module's Data section for the conversion.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the server has accepted the update, or with the reason it did not.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @example
 * ```gml
 * var _player = firebase_firestore_document(firestore, "players/USER_123");
 * var _wins = firebase_firestore_field_value_increment_integer(1);
 * var _badge = firebase_firestore_field_value_array_union(["first_win"]);
 * var _gone = firebase_firestore_field_value_delete();
 * var _seen = firebase_firestore_field_value_server_timestamp();
 *
 * firebase_firestore_document_ref_update(_player, { "stats.wins": _wins, badges: _badge, trial: _gone, last_seen: _seen },
 *     function(_error_code, _error_message)
 *     {
 *         show_debug_message(_error_code == FirestoreError.Ok ? "Updated" : _error_message);
 *     });
 *
 * firebase_firestore_field_value_release(_wins);
 * firebase_firestore_field_value_release(_badge);
 * firebase_firestore_field_value_release(_gone);
 * firebase_firestore_field_value_release(_seen);
 * firebase_firestore_document_ref_release(_player);
 * ```
 * The above code increments a nested counter, adds a badge to an array without duplicating it,
 * deletes a field and stamps the server time - four transformations the server applies atomically
 * to whatever the document holds at that moment, so two devices doing the same do not lose an
 * increment.
 * @function_end
 */

/**
 * @function firebase_firestore_document_ref_delete
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentReference::Delete](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-reference#delete)
 *
 * This function deletes the document. Its subcollections are not deleted - Firestore documents do
 * not own their subcollections - so a document with an `inventory` subcollection leaves that
 * subcollection in place, reachable by path. Deleting a document that does not exist succeeds.
 *
 * @param {Real} ref A document reference handle.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the server has accepted the delete, or with the reason it did not.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_firestore_document_ref_add_snapshot_listener
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentReference::AddSnapshotListener](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-reference#addsnapshotlistener_1)
 *
 * This function starts listening to the document, so the game learns about every change without
 * polling. The callback fires at once with the current state (from the cache first when there is one, then
 * again with the server's data) and again on every change, from the server or from a local write.
 * It keeps firing until the listener handle is passed to
 * ${function.firebase_firestore_listener_registration_remove} - at the latest in the Clean Up event
 * of the object that owns the callback. With `include_metadata_changes` set, it also fires when only
 * the metadata changed, for example when a pending local write has been confirmed by the server.
 *
 * Each call brings a new snapshot handle that the callback must release. On an error the listener
 * fires with the error and `0` for the snapshot; after a `PermissionDenied` it will not recover on
 * its own - remove it and add a new one once the user has signed in.
 *
 * The callback is required; without one the function returns `0` with
 * ${function.firebase_last_error_code} set to `FirebaseError.InvalidArgument`.
 *
 * @param {Real} ref A document reference handle.
 * @param {Bool} include_metadata_changes `true` to also fire when only the snapshot's metadata (pending writes, from cache) changed.
 * @param {Function} [callback] The function to call with each snapshot.
 * @returns {Real} A listener handle for ${function.firebase_firestore_listener_registration_remove}, or `0` when the handle is not valid or no callback was given.
 *
 * @event callback
 * @desc Fires with the current document and again on every change.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} snapshot A document snapshot handle to release with ${function.firebase_firestore_document_snapshot_release}, or `0` on error.
 * @event_end
 *
 * @example
 * ```gml
 * // Create Event
 * var _player = firebase_firestore_document(firestore, "players/USER_123");
 * player_listener = firebase_firestore_document_ref_add_snapshot_listener(_player, false, function(_error_code, _error_message, _snapshot)
 * {
 *     if (_error_code != FirestoreError.Ok)
 *     {
 *         show_debug_message("Listener error: " + _error_message);
 *         return;
 *     }
 *     if (firebase_firestore_document_snapshot_get_info(_snapshot).exists)
 *     {
 *         var _data = firebase_firestore_document_snapshot_get_data(_snapshot, FirestoreServerTimestampBehavior.Estimate);
 *         gold = _data.gold;
 *     }
 *     firebase_firestore_document_snapshot_release(_snapshot);
 * });
 * firebase_firestore_document_ref_release(_player);
 *
 * // Clean Up Event
 * firebase_firestore_listener_registration_remove(player_listener);
 * ```
 * The above code keeps the object's `gold` variable in step with the player document, on this
 * device and any other the player uses, and stops listening when the object is destroyed. The
 * reference is released right after the listener is added; the listener holds its own copy.
 * @function_end
 */

/**
 * @function firebase_firestore_document_ref_is_valid
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentReference::is_valid](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-reference#is_valid)
 *
 * This function returns whether the handle refers to a usable document reference - `false` for a
 * released handle, for the parent of a root collection, and for any reference derived from an
 * instance that has been terminated.
 *
 * @param {Real} ref A document reference handle.
 * @returns {Bool} `true` when the reference can be used, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_firestore_document_ref_release
 * @desc This function releases a document reference handle - one from ${function.firebase_firestore_document},
 * from a callback, from a snapshot's `reference`, or read out of a document's reference field.
 * Release it as soon as the calls that need it have been started. A handle that is not a document
 * reference sets ${function.firebase_last_error_code} to `FirebaseError.InvalidHandle`.
 *
 * @param {Real} ref The handle to release.
 * @function_end
 */

/**
 * @function firebase_firestore_query_where_equal_to
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::WhereEqualTo](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#whereequalto)
 *
 * This function narrows a query to the documents whose field is equal to the value. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed. A
 * comparison on a field orders and compares by Firestore's rules (numbers before strings before
 * references and so on); mixing types in one field is rarely what you want.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 *
 * @example
 * ```gml
 * var _scores = firebase_firestore_collection(firestore, "scores");
 * var _ranked = firebase_firestore_query_where_equal_to(_scores, "mode", "ranked");
 * var _sorted = firebase_firestore_query_order_by(_ranked, "score", FirestoreDirection.Descending);
 * var _top = firebase_firestore_query_limit(_sorted, 10);
 *
 * firebase_firestore_collection_ref_release(_scores);
 * firebase_firestore_query_release(_ranked);
 * firebase_firestore_query_release(_sorted);
 *
 * firebase_firestore_query_get(_top, FirestoreSource.Default, on_leaderboard);
 * firebase_firestore_query_release(_top);
 * ```
 * The above code builds the ranked top-ten query in three steps, releasing each intermediate
 * handle once the next step has been built from it. The same chain works from any query handle, so a
 * collection group query or a named query can be refined the same way.
 * @function_end
 */

/**
 * @function firebase_firestore_query_where_not_equal_to
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::WhereNotEqualTo](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#wherenotequalto)
 *
 * This function narrows a query to the documents whose field exists and is not equal to the value. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed. A
 * comparison on a field orders and compares by Firestore's rules (numbers before strings before
 * references and so on); mixing types in one field is rarely what you want.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_where_less_than
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::WhereLessThan](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#wherelessthan)
 *
 * This function narrows a query to the documents whose field is less than the value. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed. A
 * comparison on a field orders and compares by Firestore's rules (numbers before strings before
 * references and so on); mixing types in one field is rarely what you want.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_where_less_than_or_equal_to
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::WhereLessThanOrEqualTo](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#wherelessthanorequalto)
 *
 * This function narrows a query to the documents whose field is less than or equal to the value. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed. A
 * comparison on a field orders and compares by Firestore's rules (numbers before strings before
 * references and so on); mixing types in one field is rarely what you want.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_where_greater_than
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::WhereGreaterThan](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#wheregreaterthan)
 *
 * This function narrows a query to the documents whose field is greater than the value. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed. A
 * comparison on a field orders and compares by Firestore's rules (numbers before strings before
 * references and so on); mixing types in one field is rarely what you want.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_where_greater_than_or_equal_to
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::WhereGreaterThanOrEqualTo](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#wheregreaterthanorequalto)
 *
 * This function narrows a query to the documents whose field is greater than or equal to the value. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed. A
 * comparison on a field orders and compares by Firestore's rules (numbers before strings before
 * references and so on); mixing types in one field is rarely what you want.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_where_array_contains
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::WhereArrayContains](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#wherearraycontains)
 *
 * This function narrows a query to the documents whose field is an array that contains the value. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed. A
 * comparison on a field orders and compares by Firestore's rules (numbers before strings before
 * references and so on); mixing types in one field is rarely what you want.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_where_array_contains_any
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::WhereArrayContainsAny](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#wherearraycontainsany)
 *
 * This function narrows a query to the documents whose field is an array that contains at least one of the values. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed. A
 * comparison on a field orders and compares by Firestore's rules (numbers before strings before
 * references and so on); mixing types in one field is rarely what you want.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Any} values An array of values to match.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_where_in
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::WhereIn](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#wherein)
 *
 * This function narrows a query to the documents whose field is equal to one of the values. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed. A
 * comparison on a field orders and compares by Firestore's rules (numbers before strings before
 * references and so on); mixing types in one field is rarely what you want.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Any} values An array of values to match.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_where_not_in
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::WhereNotIn](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#wherenotin)
 *
 * This function narrows a query to the documents whose field exists and is equal to none of the values (a `null` field never matches). The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed. A
 * comparison on a field orders and compares by Firestore's rules (numbers before strings before
 * references and so on); mixing types in one field is rarely what you want.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Any} values An array of values to match.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_order_by
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::OrderBy](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#orderby)
 *
 * This function sorts the query's results by a field. Documents without the field are left out of
 * the results. Several `order_by` calls sort by the first field, then the next; a range comparison
 * (`less_than`, `greater_than`...) must be on the first field ordered by. A `direction` outside
 * ${constant.FirestoreDirection} is refused with `FirebaseError.InvalidArgument` in
 * ${function.firebase_last_error_code} and returns `0`. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Enum.FirestoreDirection} direction `FirestoreDirection.Ascending` or `Descending`.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_limit
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::Limit](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#limit)
 *
 * This function caps the results at the first `limit` documents in the query's order. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {Real} limit The maximum number of documents.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_limit_to_last
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::LimitToLast](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#limittolast)
 *
 * This function caps the results at the *last* `limit` documents in the query's order - the ten
 * newest of an ascending date order, still returned in ascending order. The query must have an
 * `order_by`. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {Real} limit The maximum number of documents.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_start_at_snapshot
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::StartAt](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#startat)
 *
 * This function starts at the given document (inclusive) in the query's order - the cursor for paging.
 * The snapshot must come from a query with the same `order_by` fields, typically the last document
 * of the previous page. Documents are positioned by the ordered fields' values, so the snapshot's
 * document itself need not still match the query. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {Real} snapshot_ref A document snapshot handle.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_start_at_values
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::StartAt](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#startat_1)
 *
 * This function starts at the given field values (inclusive) in the query's order, one value per
 * `order_by` field in the same order - `[1000]` for a query ordered by score, `[1000, "alice"]` for
 * one ordered by score and then name. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {Any} values An array with one value per ordered field.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_start_after_snapshot
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::StartAfter](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#startafter)
 *
 * This function starts after the given document (exclusive) in the query's order - the cursor for paging.
 * The snapshot must come from a query with the same `order_by` fields, typically the last document
 * of the previous page. Documents are positioned by the ordered fields' values, so the snapshot's
 * document itself need not still match the query. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {Real} snapshot_ref A document snapshot handle.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 *
 * @example
 * ```gml
 * // Page 2: everything after the last document of page 1
 * var _next = firebase_firestore_query_start_after_snapshot(top_query, last_document);
 * firebase_firestore_query_get(_next, FirestoreSource.Default, on_leaderboard);
 * firebase_firestore_query_release(_next);
 * ```
 * The above code fetches the next page of a leaderboard, where `last_document` is the last
 * snapshot handle of the previous page (kept, not released, until the page has been requested).
 * @function_end
 */

/**
 * @function firebase_firestore_query_start_after_values
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::StartAfter](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#startafter_1)
 *
 * This function starts after the given field values (exclusive) in the query's order, one value per
 * `order_by` field in the same order - `[1000]` for a query ordered by score, `[1000, "alice"]` for
 * one ordered by score and then name. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {Any} values An array with one value per ordered field.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_end_before_snapshot
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::EndBefore](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#endbefore)
 *
 * This function ends before the given document (exclusive) in the query's order - the cursor for paging.
 * The snapshot must come from a query with the same `order_by` fields, typically the last document
 * of the previous page. Documents are positioned by the ordered fields' values, so the snapshot's
 * document itself need not still match the query. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {Real} snapshot_ref A document snapshot handle.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_end_before_values
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::EndBefore](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#endbefore_1)
 *
 * This function ends before the given field values (exclusive) in the query's order, one value per
 * `order_by` field in the same order - `[1000]` for a query ordered by score, `[1000, "alice"]` for
 * one ordered by score and then name. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {Any} values An array with one value per ordered field.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_end_at_snapshot
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::EndAt](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#endat)
 *
 * This function ends at the given document (inclusive) in the query's order - the cursor for paging.
 * The snapshot must come from a query with the same `order_by` fields, typically the last document
 * of the previous page. Documents are positioned by the ordered fields' values, so the snapshot's
 * document itself need not still match the query. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {Real} snapshot_ref A document snapshot handle.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_end_at_values
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::EndAt](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#endat_1)
 *
 * This function ends at the given field values (inclusive) in the query's order, one value per
 * `order_by` field in the same order - `[1000]` for a query ordered by score, `[1000, "alice"]` for
 * one ordered by score and then name. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {Any} values An array with one value per ordered field.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_get
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::Get](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#get)
 *
 * This function runs the query once and hands the callback a query snapshot with the matching
 * documents, in the query's order. `source` works as for ${function.firebase_firestore_document_ref_get},
 * with one difference: with `FirestoreSource.Cache` a query nothing is cached for succeeds with an
 * empty snapshot rather than failing.
 *
 * Read the results with ${function.firebase_firestore_query_snapshot_documents}, then release each
 * document snapshot and the query snapshot. A query that needs an index the database does not have
 * fails with `FirestoreError.FailedPrecondition` and a message carrying the console link that
 * creates the index.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {Enum.FirestoreSource} source Where to read from: `FirestoreSource.Default`, `Server` or `Cache`.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire. `FirebaseError.InvalidArgument` for a `source` outside the enum.
 *
 * @event callback
 * @desc Fires once with the snapshot.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} snapshot A query snapshot handle to release with ${function.firebase_firestore_query_snapshot_release}, or `undefined` on failure.
 * @event_end
 *
 * @example
 * ```gml
 * firebase_firestore_query_get(top_query, FirestoreSource.Default, function(_error_code, _error_message, _snapshot)
 * {
 *     if (_error_code != FirestoreError.Ok)
 *     {
 *         show_debug_message("Query failed: " + _error_message);
 *         return;
 *     }
 *     var _documents = firebase_firestore_query_snapshot_documents(_snapshot);
 *     for (var _i = 0; _i < array_length(_documents); _i++)
 *     {
 *         var _data = firebase_firestore_document_snapshot_get_data(_documents[_i], FirestoreServerTimestampBehavior.None);
 *         show_debug_message($"#{_i + 1} {_data.user}: {_data.score}");
 *         firebase_firestore_document_snapshot_release(_documents[_i]);
 *     }
 *     firebase_firestore_query_snapshot_release(_snapshot);
 * });
 * ```
 * The above code runs a leaderboard query and prints one line per result, releasing each document
 * snapshot as it goes and the query snapshot at the end.
 * @function_end
 */

/**
 * @function firebase_firestore_query_add_snapshot_listener
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::AddSnapshotListener](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#addsnapshotlistener_1)
 *
 * This function starts listening to the query's results, so the game learns when a document enters,
 * leaves or changes within them. The callback fires at once with the current state (from the cache first when there is one, then
 * again with the server's data) and again on every change, from the server or from a local write.
 * It keeps firing until the listener handle is passed to
 * ${function.firebase_firestore_listener_registration_remove} - at the latest in the Clean Up event
 * of the object that owns the callback. With `include_metadata_changes` set, it also fires when only
 * the metadata changed, for example when a pending local write has been confirmed by the server.
 *
 * Each call brings a new snapshot handle that the callback must release. On an error the listener
 * fires with the error and `0` for the snapshot; after a `PermissionDenied` it will not recover on
 * its own - remove it and add a new one once the user has signed in.
 *
 * ${function.firebase_firestore_query_snapshot_document_changes} tells the callback what changed
 * since its previous call, which is cheaper than re-reading every document. The callback is
 * required; without one the function returns `0` with ${function.firebase_last_error_code} set to
 * `FirebaseError.InvalidArgument`.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @param {Bool} include_metadata_changes `true` to also fire when only the snapshot's metadata (pending writes, from cache) changed.
 * @param {Function} [callback] The function to call with each snapshot.
 * @returns {Real} A listener handle for ${function.firebase_firestore_listener_registration_remove}, or `0` when the handle is not valid or no callback was given.
 *
 * @event callback
 * @desc Fires with the current results and again on every change.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} snapshot A query snapshot handle to release with ${function.firebase_firestore_query_snapshot_release}, or `0` on error.
 * @event_end
 *
 * @example
 * ```gml
 * // Create Event
 * lobby_listener = firebase_firestore_query_add_snapshot_listener(open_rooms_query, false, function(_error_code, _error_message, _snapshot)
 * {
 *     if (_error_code != FirestoreError.Ok) return;
 *     var _changes = firebase_firestore_query_snapshot_document_changes(_snapshot, false);
 *     for (var _i = 0; _i < array_length(_changes); _i++)
 *     {
 *         var _change = _changes[_i];
 *         var _id = firebase_firestore_document_snapshot_get_info(_change.document).id;
 *         switch (_change.type)
 *         {
 *             case FirestoreDocumentChangeType.Added: lobby_add_room(_id, firebase_firestore_document_snapshot_get_data(_change.document, FirestoreServerTimestampBehavior.None)); break;
 *             case FirestoreDocumentChangeType.Modified: lobby_update_room(_id, firebase_firestore_document_snapshot_get_data(_change.document, FirestoreServerTimestampBehavior.None)); break;
 *             case FirestoreDocumentChangeType.Removed: lobby_remove_room(_id); break;
 *         }
 *         firebase_firestore_document_snapshot_release(_change.document);
 *     }
 *     firebase_firestore_query_snapshot_release(_snapshot);
 * });
 *
 * // Clean Up Event
 * firebase_firestore_listener_registration_remove(lobby_listener);
 * ```
 * The above code keeps a lobby list in step with the open rooms: the first call delivers every
 * room as `Added`, and later calls only what changed. Each change's document snapshot is released
 * after use, then the query snapshot.
 * @function_end
 */

/**
 * @function firebase_firestore_query_is_valid
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::is_valid](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#is_valid)
 *
 * This function returns whether the handle refers to a usable query (or collection reference) -
 * `false` for a released handle and for a query derived from an instance that has been terminated.
 *
 * @param {Real} ref A query handle, or a collection reference handle.
 * @returns {Bool} `true` when the query can be used, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_firestore_query_release
 * @desc This function releases a query handle - one from the `firebase_firestore_query_*` builders,
 * ${function.firebase_firestore_collection_group}, ${function.firebase_firestore_named_query} or a
 * snapshot's `get_query`. A query built from it, a running `get` and a listener each keep their own
 * copy, so release it as soon as the next step has been built or started. A collection reference is
 * not a query handle: release it with ${function.firebase_firestore_collection_ref_release}. A
 * handle that is not a query sets ${function.firebase_last_error_code} to `FirebaseError.InvalidHandle`.
 *
 * @param {Real} ref The handle to release.
 * @function_end
 */

/**
 * @function firebase_firestore_write_batch_set
 * @desc **Firebase C++ SDK:** [firebase::firestore::WriteBatch::Set](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/write-batch#set)
 *
 * This function adds a full write of a document to the batch - the batch's
 * ${function.firebase_firestore_document_ref_set}: the document is created or replaced with
 * exactly the fields in `data`. Nothing happens until ${function.firebase_firestore_write_batch_commit}; the function only
 * records the write and returns whether it did.
 *
 * @param {Real} batch_ref A write batch handle from ${function.firebase_firestore_batch}.
 * @param {Real} document_ref A document reference handle.
 * @param {Any} data A struct of field names to values; see the module's Data section for the conversion.
 * @returns {Bool} `true` when the write was added to the batch, `false` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_write_batch_set_merge
 * @desc **Firebase C++ SDK:** [firebase::firestore::WriteBatch::Set](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/write-batch#set)
 *
 * This function adds a merge write of a document to the batch - the batch's
 * ${function.firebase_firestore_document_ref_set_merge}: the fields in `data` are written, the rest
 * left alone, and the document is created if it does not exist. Nothing happens until ${function.firebase_firestore_write_batch_commit}; the function only
 * records the write and returns whether it did.
 *
 * @param {Real} batch_ref A write batch handle from ${function.firebase_firestore_batch}.
 * @param {Real} document_ref A document reference handle.
 * @param {Any} data A struct of field names to values; see the module's Data section for the conversion.
 * @returns {Bool} `true` when the write was added to the batch, `false` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_write_batch_set_merge_fields
 * @desc **Firebase C++ SDK:** [firebase::firestore::WriteBatch::Set](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/write-batch#set)
 *
 * This function adds a merge of the named fields to the batch - the batch's
 * ${function.firebase_firestore_document_ref_set_merge_fields}. Nothing happens until ${function.firebase_firestore_write_batch_commit}; the function only
 * records the write and returns whether it did.
 *
 * @param {Real} batch_ref A write batch handle from ${function.firebase_firestore_batch}.
 * @param {Real} document_ref A document reference handle.
 * @param {Any} data A struct of field names to values; see the module's Data section for the conversion.
 * @param {Array[String]} fields The names of the fields to write.
 * @returns {Bool} `true` when the write was added to the batch, `false` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_write_batch_update
 * @desc **Firebase C++ SDK:** [firebase::firestore::WriteBatch::Update](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/write-batch#update)
 *
 * This function adds an update to the batch - the batch's ${function.firebase_firestore_document_ref_update}:
 * the given fields change, the document must already exist, and the values can be sentinels such
 * as ${function.firebase_firestore_field_value_increment_integer}. A missing document fails the
 * whole commit with `FirestoreError.NotFound`. Nothing happens until ${function.firebase_firestore_write_batch_commit}; the function only
 * records the write and returns whether it did.
 *
 * @param {Real} batch_ref A write batch handle from ${function.firebase_firestore_batch}.
 * @param {Real} document_ref A document reference handle.
 * @param {Any} data A struct of field names to values; see the module's Data section for the conversion.
 * @returns {Bool} `true` when the write was added to the batch, `false` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_write_batch_delete
 * @desc **Firebase C++ SDK:** [firebase::firestore::WriteBatch::Delete](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/write-batch#delete)
 *
 * This function adds a delete of a document to the batch - the batch's
 * ${function.firebase_firestore_document_ref_delete}. Nothing happens until ${function.firebase_firestore_write_batch_commit}; the function only
 * records the write and returns whether it did.
 *
 * @param {Real} batch_ref A write batch handle from ${function.firebase_firestore_batch}.
 * @param {Real} document_ref A document reference handle.
 * @returns {Bool} `true` when the write was added to the batch, `false` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_write_batch_commit
 * @desc **Firebase C++ SDK:** [firebase::firestore::WriteBatch::Commit](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/write-batch#commit)
 *
 * This function applies every write in the batch as one atomic unit: all of them land or, if any
 * fails (a missing document for an update, a security rule), none does. The writes go into the
 * local cache at once and the callback fires when the server has accepted them all. A batch is
 * committed once; release it afterwards with ${function.firebase_firestore_write_batch_release}
 * and create a new one for the next group of writes.
 *
 * @param {Real} batch_ref A write batch handle from ${function.firebase_firestore_batch}.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the server has accepted every write, or with the reason the batch was rejected.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_firestore_write_batch_release
 * @desc This function releases a write batch handle, after the commit has been started. A handle that is
 * not a write batch sets ${function.firebase_last_error_code} to `FirebaseError.InvalidHandle`.
 *
 * @param {Real} batch_ref The handle to release.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_delete
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::Delete](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#delete)
 *
 * This function returns the sentinel that removes a field: put it as the field's value in an
 * ${function.firebase_firestore_document_ref_update} (or a merge set) and the server deletes that
 * field from the document. In a plain set it has no meaning, since the set replaces the document
 * anyway. The handle stands for the value wherever a write takes data - as a field's value in the struct
 * passed to ${function.firebase_firestore_document_ref_set}, ${function.firebase_firestore_document_ref_update},
 * ${function.firebase_firestore_collection_ref_add} or a write batch. Release it with
 * ${function.firebase_firestore_field_value_release} once the write has been started; the SDK keeps
 * its own copy.
 *
 * @returns {Real} A field value handle, to release with ${function.firebase_firestore_field_value_release} once the write has been started.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_server_timestamp
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::ServerTimestamp](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#servertimestamp)
 *
 * This function returns the sentinel the server replaces with the time it applied the write, so
 * every device agrees on when something happened regardless of its own clock. Until the server has
 * answered, a snapshot from the local cache reports the field as `undefined`, an estimate or the
 * previous value according to the `server_timestamp_behavior` the read asked for. It reads back as
 * a ${struct.FirestoreTimestamp}. The handle stands for the value wherever a write takes data - as a field's value in the struct
 * passed to ${function.firebase_firestore_document_ref_set}, ${function.firebase_firestore_document_ref_update},
 * ${function.firebase_firestore_collection_ref_add} or a write batch. Release it with
 * ${function.firebase_firestore_field_value_release} once the write has been started; the SDK keeps
 * its own copy.
 *
 * @returns {Real} A field value handle, to release with ${function.firebase_firestore_field_value_release} once the write has been started.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_array_union
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::ArrayUnion](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#arrayunion)
 *
 * This function returns the sentinel that adds elements to an array field on the server, skipping
 * any already in it. A field that is not an array becomes an array of exactly these elements.
 * Together with ${function.firebase_firestore_field_value_array_remove} it lets two devices edit
 * the same array without one overwriting the other's change. The handle stands for the value wherever a write takes data - as a field's value in the struct
 * passed to ${function.firebase_firestore_document_ref_set}, ${function.firebase_firestore_document_ref_update},
 * ${function.firebase_firestore_collection_ref_add} or a write batch. Release it with
 * ${function.firebase_firestore_field_value_release} once the write has been started; the SDK keeps
 * its own copy.
 *
 * @param {Any} values An array of the elements to add.
 * @returns {Real} A field value handle, to release with ${function.firebase_firestore_field_value_release} once the write has been started.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_array_remove
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::ArrayRemove](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#arrayremove)
 *
 * This function returns the sentinel that removes every occurrence of the given elements from an
 * array field on the server. A field that is not an array becomes an empty array. The handle stands for the value wherever a write takes data - as a field's value in the struct
 * passed to ${function.firebase_firestore_document_ref_set}, ${function.firebase_firestore_document_ref_update},
 * ${function.firebase_firestore_collection_ref_add} or a write batch. Release it with
 * ${function.firebase_firestore_field_value_release} once the write has been started; the SDK keeps
 * its own copy.
 *
 * @param {Any} values An array of the elements to remove.
 * @returns {Real} A field value handle, to release with ${function.firebase_firestore_field_value_release} once the write has been started.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_increment_integer
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::Increment](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#increment)
 *
 * This function returns the sentinel that adds an integer to a numeric field on the server - an
 * atomic counter, safe against two devices incrementing at once. A field that is not a number, or
 * does not exist, is set to the value. Use ${function.firebase_firestore_field_value_increment_double}
 * for a fractional amount. The handle stands for the value wherever a write takes data - as a field's value in the struct
 * passed to ${function.firebase_firestore_document_ref_set}, ${function.firebase_firestore_document_ref_update},
 * ${function.firebase_firestore_collection_ref_add} or a write batch. Release it with
 * ${function.firebase_firestore_field_value_release} once the write has been started; the SDK keeps
 * its own copy.
 *
 * @param {Real} value The amount to add (negative to subtract).
 * @returns {Real} A field value handle, to release with ${function.firebase_firestore_field_value_release} once the write has been started.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_increment_double
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::Increment](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#increment_1)
 *
 * This function returns the sentinel that adds a double to a numeric field on the server, with
 * IEEE 754 arithmetic when the field is a double. See ${function.firebase_firestore_field_value_increment_integer}. The handle stands for the value wherever a write takes data - as a field's value in the struct
 * passed to ${function.firebase_firestore_document_ref_set}, ${function.firebase_firestore_document_ref_update},
 * ${function.firebase_firestore_collection_ref_add} or a write batch. Release it with
 * ${function.firebase_firestore_field_value_release} once the write has been started; the SDK keeps
 * its own copy.
 *
 * @param {Real} value The amount to add (negative to subtract).
 * @returns {Real} A field value handle, to release with ${function.firebase_firestore_field_value_release} once the write has been started.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_integer
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::Integer](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#integer)
 *
 * This function wraps a number as a 64-bit Firestore integer. It exists because a GML number is stored as a Firestore double: wrap a value in this constructor
 * when the stored type matters, for a query, an index or another client that reads the field as an
 * integer. The handle stands for the value wherever a write takes data - as a field's value in the struct
 * passed to ${function.firebase_firestore_document_ref_set}, ${function.firebase_firestore_document_ref_update},
 * ${function.firebase_firestore_collection_ref_add} or a write batch. Release it with
 * ${function.firebase_firestore_field_value_release} once the write has been started; the SDK keeps
 * its own copy.
 *
 * @param {Real} value The integer to store.
 * @returns {Real} A field value handle, to release with ${function.firebase_firestore_field_value_release} once the write has been started.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_double
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::Double](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#double)
 *
 * This function wraps a number as a Firestore double - what a plain GML number becomes anyway. It
 * exists for symmetry with ${function.firebase_firestore_field_value_integer} and for building a
 * typed value programmatically. The handle stands for the value wherever a write takes data - as a field's value in the struct
 * passed to ${function.firebase_firestore_document_ref_set}, ${function.firebase_firestore_document_ref_update},
 * ${function.firebase_firestore_collection_ref_add} or a write batch. Release it with
 * ${function.firebase_firestore_field_value_release} once the write has been started; the SDK keeps
 * its own copy.
 *
 * @param {Real} value The number to store.
 * @returns {Real} A field value handle, to release with ${function.firebase_firestore_field_value_release} once the write has been started.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_timestamp
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::Timestamp](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#timestamp)
 *
 * This function wraps a point in time as a Firestore timestamp: whole seconds since the Unix epoch
 * (UTC) plus nanoseconds. From a GameMaker datetime, `seconds` is
 * `(datetime - date_create_datetime(1970, 1, 1, 0, 0, 0)) * 86400` and `nanoseconds` is `0`. It
 * reads back as a ${struct.FirestoreTimestamp}. For "now, according to the server", use
 * ${function.firebase_firestore_field_value_server_timestamp} instead. The handle stands for the value wherever a write takes data - as a field's value in the struct
 * passed to ${function.firebase_firestore_document_ref_set}, ${function.firebase_firestore_document_ref_update},
 * ${function.firebase_firestore_collection_ref_add} or a write batch. Release it with
 * ${function.firebase_firestore_field_value_release} once the write has been started; the SDK keeps
 * its own copy.
 *
 * @param {Real} seconds Seconds since 1970-01-01 00:00:00 UTC.
 * @param {Real} nanoseconds The fraction of a second in nanoseconds, `0` to `999999999`.
 * @returns {Real} A field value handle, to release with ${function.firebase_firestore_field_value_release} once the write has been started.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_geo_point
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::GeoPoint](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#geopoint)
 *
 * This function wraps a latitude and longitude as a Firestore geo point. It reads back as a
 * ${struct.FirestoreGeoPoint}. Firestore does not query by distance; a geo point is stored data. The handle stands for the value wherever a write takes data - as a field's value in the struct
 * passed to ${function.firebase_firestore_document_ref_set}, ${function.firebase_firestore_document_ref_update},
 * ${function.firebase_firestore_collection_ref_add} or a write batch. Release it with
 * ${function.firebase_firestore_field_value_release} once the write has been started; the SDK keeps
 * its own copy.
 *
 * @param {Real} latitude Degrees north, `-90` to `90`.
 * @param {Real} longitude Degrees east, `-180` to `180`.
 * @returns {Real} A field value handle, to release with ${function.firebase_firestore_field_value_release} once the write has been started.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_reference
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::Reference](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#reference)
 *
 * This function wraps a document reference as a Firestore reference value - a field that points at
 * another document in the same database, the way `players/USER_123` might hold a `guild` field
 * pointing at `guilds/GUILD_001`. A document reference handle placed directly in a data struct is
 * stored the same way; the constructor makes the intent explicit. The field reads back as a new
 * document reference handle, to release with ${function.firebase_firestore_document_ref_release}. The handle stands for the value wherever a write takes data - as a field's value in the struct
 * passed to ${function.firebase_firestore_document_ref_set}, ${function.firebase_firestore_document_ref_update},
 * ${function.firebase_firestore_collection_ref_add} or a write batch. Release it with
 * ${function.firebase_firestore_field_value_release} once the write has been started; the SDK keeps
 * its own copy.
 *
 * @param {Real} document_ref A document reference handle.
 * @returns {Real} A field value handle, to release with ${function.firebase_firestore_field_value_release} once the write has been started. `0` when the document reference handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_blob
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::Blob](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#blob)
 *
 * This function wraps the bytes of a buffer as a Firestore blob - binary data stored in the
 * document. The whole buffer is the blob, so size it to the data; the SDK copies the bytes and the
 * buffer can be deleted as soon as this returns. It reads back as a ${struct.FirestoreBlob} - a
 * handle and a size, copied into a buffer with ${function.firebase_firestore_field_value_blob_copy}.
 * The handle stands for the value wherever a write takes data - as a field's value in the struct
 * passed to ${function.firebase_firestore_document_ref_set},
 * ${function.firebase_firestore_document_ref_update}, ${function.firebase_firestore_collection_ref_add}
 * or a write batch. Release it with ${function.firebase_firestore_field_value_release} once the
 * write has been started; the SDK keeps its own copy.
 *
 * Keep blobs small: a document is capped at 1 MB by Firestore. Anything bigger belongs in Cloud
 * Storage (${module.storage}) with its path kept here.
 *
 * @param {Buffer} data The bytes to store; the whole buffer.
 * @returns {Real} A field value handle, to release with ${function.firebase_firestore_field_value_release} once the write has been started.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_null
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::Null](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#null)
 *
 * This function returns a Firestore null - a field that exists and holds no value, as opposed to a
 * missing field. An `undefined` in a data struct is stored the same way. It reads back as
 * `undefined`, with ${struct.FirestoreFieldLookup}'s `exists` telling the two apart. The handle stands for the value wherever a write takes data - as a field's value in the struct
 * passed to ${function.firebase_firestore_document_ref_set}, ${function.firebase_firestore_document_ref_update},
 * ${function.firebase_firestore_collection_ref_add} or a write batch. Release it with
 * ${function.firebase_firestore_field_value_release} once the write has been started; the SDK keeps
 * its own copy.
 *
 * @returns {Real} A field value handle, to release with ${function.firebase_firestore_field_value_release} once the write has been started.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_release
 * @desc This function releases a field value handle from one of the constructors, once the write it was
 * built for has been started. A handle that is not a field value sets
 * ${function.firebase_last_error_code} to `FirebaseError.InvalidHandle`.
 *
 * @param {Real} ref The handle to release.
 * @function_end
 */

/**
 * @function firebase_firestore_document_snapshot_get_info
 * @desc This function reads a document snapshot's properties into one ${struct.FirestoreDocumentSnapshotInfo}:
 * whether the document exists, its ID, and the two metadata flags. It hands out no handle; a
 * reference to the document comes from ${function.firebase_firestore_document_snapshot_reference},
 * which registers one to release.
 *
 * @param {Real} ref A document snapshot handle.
 * @returns {Struct.FirestoreDocumentSnapshotInfo} The snapshot's properties, or `undefined` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_document_snapshot_get
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentSnapshot::Get](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-snapshot#get_1)
 *
 * This function reads one field of the document, by name or dotted path, into a
 * ${struct.FirestoreFieldLookup}: `exists` says whether the field is there, and `value` is its
 * value converted as the Data section describes - `undefined` for a missing field and for a
 * Firestore null alike. Reading one field this way avoids converting the whole document when a
 * single value is needed; ${function.firebase_firestore_document_snapshot_get_data} converts all
 * of it.
 *
 * A snapshot handle that is not valid, or a `server_timestamp_behavior` outside the enum, returns
 * `undefined` with ${function.firebase_last_error_code} set (`InvalidHandle` or `InvalidArgument`); a
 * missing field is a lookup with `exists` as `false`.
 *
 * @param {Real} ref A document snapshot handle.
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Enum.FirestoreServerTimestampBehavior} server_timestamp_behavior How a server timestamp that the server has not resolved yet is reported: `FirestoreServerTimestampBehavior.None`, `Estimate` or `Previous`.
 * @returns {Struct.FirestoreFieldLookup} The lookup, with `exists` as `false` for a missing field; `undefined` when the snapshot handle or the behavior argument is not valid.
 *
 * @example
 * ```gml
 * var _lookup = firebase_firestore_document_snapshot_get(_snapshot, "stats.wins", FirestoreServerTimestampBehavior.None);
 * if (_lookup.exists)
 * {
 *     show_debug_message($"Wins: {_lookup.value}");
 * }
 * ```
 * The above code reads a nested counter out of a snapshot, checking that the field is present
 * before using it - a new player's document may not have it yet.
 * @function_end
 */

/**
 * @function firebase_firestore_document_snapshot_get_data
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentSnapshot::GetData](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-snapshot#getdata)
 *
 * This function converts the whole document into a GML struct, one member per field, values
 * converted as the Data section describes: numbers, strings and booleans as themselves, nested maps
 * as structs, arrays as arrays, timestamps, geo points, blobs and references as
 * ${struct.FirestoreTimestamp}, ${struct.FirestoreGeoPoint}, ${struct.FirestoreBlob} and
 * ${struct.FirestoreReference} structs, nulls as `undefined`. The one handle a read hands out is
 * a blob's `field_value`, and it belongs to this snapshot: releasing the snapshot releases it. A
 * document that does not exist gives an empty struct.
 *
 * The `server_timestamp_behavior` argument decides what a server timestamp the server has not
 * resolved yet reads as: `undefined` (`None`), the local clock's estimate (`Estimate`) or the value
 * the field held before the write (`Previous`).
 *
 * The converted struct returns through an 8 KB buffer, so a document larger than that cannot be
 * read this way today. A document of many small fields can still be read one field at a time with
 * ${function.firebase_firestore_document_snapshot_get}, which has the same limit per field; a blob
 * does not count (only its handle and size cross), a string over 8 KB belongs in Cloud Storage.
 *
 * @param {Real} ref A document snapshot handle.
 * @param {Enum.FirestoreServerTimestampBehavior} server_timestamp_behavior How a server timestamp that the server has not resolved yet is reported: `FirestoreServerTimestampBehavior.None`, `Estimate` or `Previous`.
 * @returns {Any} A struct of the document's fields, empty when the document does not exist or the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_document_snapshot_release
 * @desc This function releases a document snapshot handle - one from a `get` callback, a listener, a
 * query snapshot's `documents` or a document change. Release each one once its fields have been
 * read; a snapshot kept for paging (${function.firebase_firestore_query_start_after_snapshot}) is
 * released once the next page has been requested. Any ${struct.FirestoreBlob} handle read out of
 * the snapshot that the game has not released itself goes with it. A handle that is not a document
 * snapshot sets ${function.firebase_last_error_code} to `FirebaseError.InvalidHandle`.
 *
 * @param {Real} ref The handle to release.
 * @function_end
 */

/**
 * @function firebase_firestore_query_snapshot_get_info
 * @desc This function reads a query snapshot's properties into one ${struct.FirestoreQuerySnapshotInfo}:
 * the number of documents, whether there are none, and the two metadata flags.
 *
 * @param {Real} ref A query snapshot handle.
 * @returns {Struct.FirestoreQuerySnapshotInfo} The snapshot's properties, or `undefined` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_snapshot_documents
 * @desc **Firebase C++ SDK:** [firebase::firestore::QuerySnapshot::documents](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query-snapshot#documents)
 *
 * This function returns the matching documents as an array of document snapshot handles, in the
 * query's order. Each handle is new and is released with
 * ${function.firebase_firestore_document_snapshot_release} once read - a loop that forgets to leaks
 * one per result.
 *
 * @param {Real} ref A query snapshot handle.
 * @returns {Array[Real]} An array of document snapshot handles, empty when there are no results or the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_snapshot_document_changes
 * @desc **Firebase C++ SDK:** [firebase::firestore::QuerySnapshot::DocumentChanges](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query-snapshot#documentchanges)
 *
 * This function returns what changed between the listener's previous snapshot and this one, as an
 * array of ${struct.FirestoreDocumentChange} structs: the kind of change, the document, and its
 * position in the results before and after (`-1` for "not present"). On a listener's first snapshot
 * every document is an `Added` change. Each entry's `document` is a new snapshot handle to release
 * with ${function.firebase_firestore_document_snapshot_release}. With `include_metadata_changes`
 * set, a document whose metadata alone changed is listed as `Modified`.
 *
 * @param {Real} ref A query snapshot handle.
 * @param {Bool} include_metadata_changes `true` to list documents whose metadata alone changed.
 * @returns {Array[Struct.FirestoreDocumentChange]} An array of changes, empty when nothing changed or the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_snapshot_release
 * @desc This function releases a query snapshot handle, once its documents have been read. Releasing it
 * does not release the document snapshot handles taken from it; those are released one by one. A
 * handle that is not a query snapshot sets ${function.firebase_last_error_code} to
 * `FirebaseError.InvalidHandle`.
 *
 * @param {Real} ref The handle to release.
 * @function_end
 */

/**
 * @function firebase_firestore_listener_registration_remove
 * @desc **Firebase C++ SDK:** [firebase::firestore::ListenerRegistration::Remove](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/listener-registration#remove)
 *
 * This function stops a listener - from ${function.firebase_firestore_document_ref_add_snapshot_listener},
 * ${function.firebase_firestore_query_add_snapshot_listener} or
 * ${function.firebase_firestore_add_snapshots_in_sync_listener} - and releases its handle. The
 * callback is not called again after this returns. Removing a handle that is not a listener sets
 * ${function.firebase_last_error_code} to `FirebaseError.InvalidHandle` and does nothing else.
 *
 * Remove every listener an object owns in its Clean Up event: a listener outlives the object
 * otherwise and keeps calling a method of an instance that no longer exists.
 *
 * @param {Real} ref The listener handle.
 * @function_end
 */

/**
 * @function firebase_firestore_field_path_create
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldPath::FieldPath](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-path#fieldpath_2)
 *
 * This function builds a field path from its segments, one array element per level:
 * `["settings", "audio.volume"]` names the `audio.volume` field inside the `settings` map. A string
 * field name with dots in it is read as a nested path everywhere in this module; a field path is
 * the only way to name a field that itself contains a dot. The `_field_path` variants of the query,
 * filter, snapshot and update functions take the handle. Release it with
 * ${function.firebase_firestore_field_path_release}.
 *
 * @param {Array[String]} components The path's segments, outermost first.
 * @returns {Real} A field path handle.
 * @function_end
 */

/**
 * @function firebase_firestore_field_path_document_id
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldPath::DocumentId](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-path#documentid)
 *
 * This function returns the special field path that stands for the document's ID, for sorting or
 * filtering a query by ID: ${function.firebase_firestore_query_order_by_field_path} to page through
 * a collection in ID order, ${function.firebase_firestore_query_where_in_field_path} to fetch a
 * known set of documents in one query. Release it with ${function.firebase_firestore_field_path_release}.
 *
 * @returns {Real} A field path handle.
 *
 * @example
 * ```gml
 * var _by_id = firebase_firestore_field_path_document_id();
 * var _query = firebase_firestore_query_where_in_field_path(players, _by_id, ["USER_123", "USER_456", "USER_789"]);
 * firebase_firestore_query_get(_query, FirestoreSource.Default, on_friends);
 * firebase_firestore_query_release(_query);
 * firebase_firestore_field_path_release(_by_id);
 * ```
 * The above code fetches three known player documents with one query instead of three reads.
 * @function_end
 */

/**
 * @function firebase_firestore_field_path_is_valid
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldPath::is_valid](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-path#is_valid)
 *
 * This function returns whether the handle refers to a usable field path.
 *
 * @param {Real} field_path A field path handle.
 * @returns {Bool} `true` when the field path can be used, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_firestore_field_path_to_string
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldPath::ToString](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-path#tostring)
 *
 * This function returns the field path as text for the debug output, in the SDK's own format.
 *
 * @param {Real} field_path A field path handle.
 * @returns {String} The path as text, or an empty string when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_field_path_release
 * @desc This function releases a field path handle. Queries, filters and writes built with it keep their
 * own copies. A handle that is not a field path sets ${function.firebase_last_error_code} to
 * `FirebaseError.InvalidHandle`.
 *
 * @param {Real} field_path The handle to release.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_equal_to
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::EqualTo](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#equalto)
 *
 * This function builds a filter that matches the documents whose field is equal to the value, for
 * ${function.firebase_firestore_filter_and}, ${function.firebase_firestore_filter_or} and
 * ${function.firebase_firestore_query_where_filter}. On its own it is the same condition as
 * ${function.firebase_firestore_query_where_equal_to}.
 *
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A filter handle, to release with ${function.firebase_firestore_filter_release} once it has been applied.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_not_equal_to
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::NotEqualTo](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#notequalto)
 *
 * This function builds a filter that matches the documents whose field exists and is not equal to the value, for
 * ${function.firebase_firestore_filter_and}, ${function.firebase_firestore_filter_or} and
 * ${function.firebase_firestore_query_where_filter}. On its own it is the same condition as
 * ${function.firebase_firestore_query_where_not_equal_to}.
 *
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A filter handle, to release with ${function.firebase_firestore_filter_release} once it has been applied.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_less_than
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::LessThan](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#lessthan)
 *
 * This function builds a filter that matches the documents whose field is less than the value, for
 * ${function.firebase_firestore_filter_and}, ${function.firebase_firestore_filter_or} and
 * ${function.firebase_firestore_query_where_filter}. On its own it is the same condition as
 * ${function.firebase_firestore_query_where_less_than}.
 *
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A filter handle, to release with ${function.firebase_firestore_filter_release} once it has been applied.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_less_than_or_equal_to
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::LessThanOrEqualTo](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#lessthanorequalto)
 *
 * This function builds a filter that matches the documents whose field is less than or equal to the value, for
 * ${function.firebase_firestore_filter_and}, ${function.firebase_firestore_filter_or} and
 * ${function.firebase_firestore_query_where_filter}. On its own it is the same condition as
 * ${function.firebase_firestore_query_where_less_than_or_equal_to}.
 *
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A filter handle, to release with ${function.firebase_firestore_filter_release} once it has been applied.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_greater_than
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::GreaterThan](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#greaterthan)
 *
 * This function builds a filter that matches the documents whose field is greater than the value, for
 * ${function.firebase_firestore_filter_and}, ${function.firebase_firestore_filter_or} and
 * ${function.firebase_firestore_query_where_filter}. On its own it is the same condition as
 * ${function.firebase_firestore_query_where_greater_than}.
 *
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A filter handle, to release with ${function.firebase_firestore_filter_release} once it has been applied.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_greater_than_or_equal_to
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::GreaterThanOrEqualTo](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#greaterthanorequalto)
 *
 * This function builds a filter that matches the documents whose field is greater than or equal to the value, for
 * ${function.firebase_firestore_filter_and}, ${function.firebase_firestore_filter_or} and
 * ${function.firebase_firestore_query_where_filter}. On its own it is the same condition as
 * ${function.firebase_firestore_query_where_greater_than_or_equal_to}.
 *
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A filter handle, to release with ${function.firebase_firestore_filter_release} once it has been applied.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_array_contains
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::ArrayContains](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#arraycontains)
 *
 * This function builds a filter that matches the documents whose field is an array that contains the value, for
 * ${function.firebase_firestore_filter_and}, ${function.firebase_firestore_filter_or} and
 * ${function.firebase_firestore_query_where_filter}. On its own it is the same condition as
 * ${function.firebase_firestore_query_where_array_contains}.
 *
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A filter handle, to release with ${function.firebase_firestore_filter_release} once it has been applied.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_array_contains_any
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::ArrayContainsAny](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#arraycontainsany)
 *
 * This function builds a filter that matches the documents whose field is an array that contains at least one of the values, for
 * ${function.firebase_firestore_filter_and}, ${function.firebase_firestore_filter_or} and
 * ${function.firebase_firestore_query_where_filter}. On its own it is the same condition as
 * ${function.firebase_firestore_query_where_array_contains_any}.
 *
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Any} values An array of values to match.
 * @returns {Real} A filter handle, to release with ${function.firebase_firestore_filter_release} once it has been applied.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_in
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::In](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#in)
 *
 * This function builds a filter that matches the documents whose field is equal to one of the values, for
 * ${function.firebase_firestore_filter_and}, ${function.firebase_firestore_filter_or} and
 * ${function.firebase_firestore_query_where_filter}. On its own it is the same condition as
 * ${function.firebase_firestore_query_where_in}.
 *
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Any} values An array of values to match.
 * @returns {Real} A filter handle, to release with ${function.firebase_firestore_filter_release} once it has been applied.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_not_in
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::NotIn](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#notin)
 *
 * This function builds a filter that matches the documents whose field exists and is equal to none of the values (a `null` field never matches), for
 * ${function.firebase_firestore_filter_and}, ${function.firebase_firestore_filter_or} and
 * ${function.firebase_firestore_query_where_filter}. On its own it is the same condition as
 * ${function.firebase_firestore_query_where_not_in}.
 *
 * @param {String} field The field's name, or a dot-separated path to a nested field (`"stats.wins"`).
 * @param {Any} values An array of values to match.
 * @returns {Real} A filter handle, to release with ${function.firebase_firestore_filter_release} once it has been applied.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_equal_to_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::EqualTo](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#equalto_1)
 *
 * This function is ${function.firebase_firestore_filter_equal_to} with the field named by a field path
 * handle instead of a string.
 *
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A filter handle, or `0` when the field path handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_not_equal_to_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::NotEqualTo](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#notequalto_1)
 *
 * This function is ${function.firebase_firestore_filter_not_equal_to} with the field named by a field path
 * handle instead of a string.
 *
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A filter handle, or `0` when the field path handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_less_than_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::LessThan](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#lessthan_1)
 *
 * This function is ${function.firebase_firestore_filter_less_than} with the field named by a field path
 * handle instead of a string.
 *
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A filter handle, or `0` when the field path handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_less_than_or_equal_to_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::LessThanOrEqualTo](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#lessthanorequalto_1)
 *
 * This function is ${function.firebase_firestore_filter_less_than_or_equal_to} with the field named by a field path
 * handle instead of a string.
 *
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A filter handle, or `0` when the field path handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_greater_than_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::GreaterThan](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#greaterthan_1)
 *
 * This function is ${function.firebase_firestore_filter_greater_than} with the field named by a field path
 * handle instead of a string.
 *
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A filter handle, or `0` when the field path handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_greater_than_or_equal_to_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::GreaterThanOrEqualTo](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#greaterthanorequalto_1)
 *
 * This function is ${function.firebase_firestore_filter_greater_than_or_equal_to} with the field named by a field path
 * handle instead of a string.
 *
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A filter handle, or `0` when the field path handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_array_contains_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::ArrayContains](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#arraycontains_1)
 *
 * This function is ${function.firebase_firestore_filter_array_contains} with the field named by a field path
 * handle instead of a string.
 *
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A filter handle, or `0` when the field path handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_array_contains_any_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::ArrayContainsAny](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#arraycontainsany_1)
 *
 * This function is ${function.firebase_firestore_filter_array_contains_any} with the field named by a field path
 * handle instead of a string.
 *
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Any} values An array of values to match.
 * @returns {Real} A filter handle, or `0` when the field path handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_in_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::In](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#in_1)
 *
 * This function is ${function.firebase_firestore_filter_in} with the field named by a field path
 * handle instead of a string.
 *
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Any} values An array of values to match.
 * @returns {Real} A filter handle, or `0` when the field path handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_not_in_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::NotIn](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#notin_1)
 *
 * This function is ${function.firebase_firestore_filter_not_in} with the field named by a field path
 * handle instead of a string.
 *
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Any} values An array of values to match.
 * @returns {Real} A filter handle, or `0` when the field path handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_and
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::And](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#and_1)
 *
 * This function combines filters so that a document must satisfy all of them. Chained `where`
 * calls are already an AND; this exists to nest an AND inside an ${function.firebase_firestore_filter_or}.
 * The input filters can be released once the combined filter exists. A handle in the array that is
 * not a filter is skipped.
 *
 * @param {Array[Real]} filters An array of filter handles.
 * @returns {Real} A filter handle, to release with ${function.firebase_firestore_filter_release} once it has been applied.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_or
 * @desc **Firebase C++ SDK:** [firebase::firestore::Filter::Or](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/filter#or_1)
 *
 * This function combines filters so that a document matches when it satisfies any of them - the OR
 * the chained `where` functions cannot express. Apply the result with
 * ${function.firebase_firestore_query_where_filter}. The input filters can be released once the
 * combined filter exists. A handle in the array that is not a filter is skipped.
 *
 * @param {Array[Real]} filters An array of filter handles.
 * @returns {Real} A filter handle, to release with ${function.firebase_firestore_filter_release} once it has been applied.
 * @function_end
 */

/**
 * @function firebase_firestore_filter_release
 * @desc This function releases a filter handle. A query built with it and a combined filter built from it
 * keep their own copies. A handle that is not a filter sets ${function.firebase_last_error_code} to
 * `FirebaseError.InvalidHandle`.
 *
 * @param {Real} filter The handle to release.
 * @function_end
 */

/**
 * @function firebase_firestore_query_where_filter
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::Where](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#where)
 *
 * This function narrows a query with a filter built by the `firebase_firestore_filter_*` functions,
 * which is the way to express an OR: ${function.firebase_firestore_filter_or} of several filters.
 * The filter can be released once the query has been built. The input is not changed; the function returns a new query with the condition added, and the
 * input handle can be released once it is no longer needed.
 *
 * @param {Real} query A query handle, or a collection reference handle.
 * @param {Real} filter A filter handle.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 *
 * @example
 * ```gml
 * var _easy = firebase_firestore_filter_equal_to("difficulty", "easy");
 * var _short = firebase_firestore_filter_less_than("length", 60);
 * var _either = firebase_firestore_filter_or([_easy, _short]);
 *
 * var _levels = firebase_firestore_collection(firestore, "levels");
 * var _query = firebase_firestore_query_where_filter(_levels, _either);
 * firebase_firestore_query_get(_query, FirestoreSource.Default, on_levels);
 *
 * firebase_firestore_query_release(_query);
 * firebase_firestore_collection_ref_release(_levels);
 * firebase_firestore_filter_release(_either);
 * firebase_firestore_filter_release(_short);
 * firebase_firestore_filter_release(_easy);
 * ```
 * The above code fetches the levels that are easy *or* short - a condition the chained `where`
 * functions cannot express, since each one is an AND.
 * @function_end
 */

/**
 * @function firebase_firestore_query_where_equal_to_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::WhereEqualTo](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#whereequalto_1)
 *
 * This function is ${function.firebase_firestore_query_where_equal_to} with the field named by a field
 * path handle instead of a string - for a field whose name contains a dot, or for the document ID
 * through ${function.firebase_firestore_field_path_document_id}.
 *
 * @param {Real} query A query handle, or a collection reference handle.
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_where_not_equal_to_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::WhereNotEqualTo](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#wherenotequalto_1)
 *
 * This function is ${function.firebase_firestore_query_where_not_equal_to} with the field named by a field
 * path handle instead of a string - for a field whose name contains a dot, or for the document ID
 * through ${function.firebase_firestore_field_path_document_id}.
 *
 * @param {Real} query A query handle, or a collection reference handle.
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_where_less_than_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::WhereLessThan](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#wherelessthan_1)
 *
 * This function is ${function.firebase_firestore_query_where_less_than} with the field named by a field
 * path handle instead of a string - for a field whose name contains a dot, or for the document ID
 * through ${function.firebase_firestore_field_path_document_id}.
 *
 * @param {Real} query A query handle, or a collection reference handle.
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_where_less_than_or_equal_to_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::WhereLessThanOrEqualTo](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#wherelessthanorequalto_1)
 *
 * This function is ${function.firebase_firestore_query_where_less_than_or_equal_to} with the field named by a field
 * path handle instead of a string - for a field whose name contains a dot, or for the document ID
 * through ${function.firebase_firestore_field_path_document_id}.
 *
 * @param {Real} query A query handle, or a collection reference handle.
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_where_greater_than_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::WhereGreaterThan](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#wheregreaterthan_1)
 *
 * This function is ${function.firebase_firestore_query_where_greater_than} with the field named by a field
 * path handle instead of a string - for a field whose name contains a dot, or for the document ID
 * through ${function.firebase_firestore_field_path_document_id}.
 *
 * @param {Real} query A query handle, or a collection reference handle.
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_where_greater_than_or_equal_to_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::WhereGreaterThanOrEqualTo](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#wheregreaterthanorequalto_1)
 *
 * This function is ${function.firebase_firestore_query_where_greater_than_or_equal_to} with the field named by a field
 * path handle instead of a string - for a field whose name contains a dot, or for the document ID
 * through ${function.firebase_firestore_field_path_document_id}.
 *
 * @param {Real} query A query handle, or a collection reference handle.
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_where_array_contains_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::WhereArrayContains](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#wherearraycontains_1)
 *
 * This function is ${function.firebase_firestore_query_where_array_contains} with the field named by a field
 * path handle instead of a string - for a field whose name contains a dot, or for the document ID
 * through ${function.firebase_firestore_field_path_document_id}.
 *
 * @param {Real} query A query handle, or a collection reference handle.
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Any} value The value to compare with - a GML value, or a handle from the field value constructors.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_where_array_contains_any_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::WhereArrayContainsAny](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#wherearraycontainsany_1)
 *
 * This function is ${function.firebase_firestore_query_where_array_contains_any} with the field named by a field
 * path handle instead of a string - for a field whose name contains a dot, or for the document ID
 * through ${function.firebase_firestore_field_path_document_id}.
 *
 * @param {Real} query A query handle, or a collection reference handle.
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Any} values An array of values to match.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_where_in_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::WhereIn](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#wherein_1)
 *
 * This function is ${function.firebase_firestore_query_where_in} with the field named by a field
 * path handle instead of a string - for a field whose name contains a dot, or for the document ID
 * through ${function.firebase_firestore_field_path_document_id}.
 *
 * @param {Real} query A query handle, or a collection reference handle.
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Any} values An array of values to match.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_where_not_in_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::WhereNotIn](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#wherenotin_1)
 *
 * This function is ${function.firebase_firestore_query_where_not_in} with the field named by a field
 * path handle instead of a string - for a field whose name contains a dot, or for the document ID
 * through ${function.firebase_firestore_field_path_document_id}.
 *
 * @param {Real} query A query handle, or a collection reference handle.
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Any} values An array of values to match.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_order_by_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::OrderBy](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#orderby_1)
 *
 * This function is ${function.firebase_firestore_query_order_by} with the field named by a field path
 * handle - ${function.firebase_firestore_field_path_document_id} to sort by document ID.
 *
 * @param {Real} query A query handle, or a collection reference handle.
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Enum.FirestoreDirection} direction `FirestoreDirection.Ascending` or `Descending`.
 * @returns {Real} A new query handle to release with ${function.firebase_firestore_query_release}, or `0` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_count
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::Count](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#count)
 *
 * This function turns a query into an aggregate query that counts its matching documents on the
 * server without downloading them - the way to show "1,204 players online" for a result set too
 * large to fetch. Run it with ${function.firebase_firestore_aggregate_query_get} and release it
 * with ${function.firebase_firestore_aggregate_query_release}.
 *
 * @param {Real} query A query handle, or a collection reference handle.
 * @returns {Real} An aggregate query handle, or `0` when the handle is not valid.
 *
 * @example
 * ```gml
 * var _online = firebase_firestore_query_where_equal_to(players, "online", true);
 * var _count = firebase_firestore_query_count(_online);
 * firebase_firestore_aggregate_query_get(_count, FirestoreAggregateSource.Server, function(_error_code, _error_message, _snapshot)
 * {
 *     if (_error_code == FirestoreError.Ok)
 *     {
 *         show_debug_message($"{firebase_firestore_aggregate_snapshot_count(_snapshot)} players online");
 *         firebase_firestore_aggregate_snapshot_release(_snapshot);
 *     }
 * });
 * firebase_firestore_aggregate_query_release(_count);
 * firebase_firestore_query_release(_online);
 * ```
 * The above code counts the online players with one small server round trip instead of fetching
 * every player document.
 * @function_end
 */

/**
 * @function firebase_firestore_aggregate_query_get_query
 * @desc **Firebase C++ SDK:** [firebase::firestore::AggregateQuery::query](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/aggregate-query#query)
 *
 * This function returns the query an aggregate query counts over, as a new query handle to release
 * with ${function.firebase_firestore_query_release}.
 *
 * @param {Real} aggregate_query An aggregate query handle.
 * @returns {Real} A query handle, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_aggregate_query_is_valid
 * @desc **Firebase C++ SDK:** [firebase::firestore::AggregateQuery::is_valid](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/aggregate-query#is_valid)
 *
 * This function returns whether the handle refers to a usable aggregate query.
 *
 * @param {Real} aggregate_query An aggregate query handle.
 * @returns {Bool} `true` when the aggregate query can be used, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_firestore_aggregate_query_get
 * @desc **Firebase C++ SDK:** [firebase::firestore::AggregateQuery::Get](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/aggregate-query#get)
 *
 * This function runs an aggregate query from ${function.firebase_firestore_query_count} and hands
 * the callback an aggregate snapshot to read with ${function.firebase_firestore_aggregate_snapshot_count}
 * and release with ${function.firebase_firestore_aggregate_snapshot_release}. The only source is
 * `FirestoreAggregateSource.Server`: the count is computed on the server from the server's data,
 * ignoring the local cache and pending writes, and fails with `FirestoreError.Unavailable` offline.
 *
 * @param {Real} aggregate_query An aggregate query handle.
 * @param {Enum.FirestoreAggregateSource} source `FirestoreAggregateSource.Server`.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire. `FirebaseError.InvalidArgument` for a `source` outside the enum.
 *
 * @event callback
 * @desc Fires once with the result.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} snapshot An aggregate snapshot handle, or `undefined` on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_firestore_aggregate_query_release
 * @desc This function releases an aggregate query handle. A running `get` keeps its own copy. A handle
 * that is not an aggregate query sets ${function.firebase_last_error_code} to `FirebaseError.InvalidHandle`.
 *
 * @param {Real} aggregate_query The handle to release.
 * @function_end
 */

/**
 * @function firebase_firestore_aggregate_snapshot_count
 * @desc **Firebase C++ SDK:** [firebase::firestore::AggregateQuerySnapshot::count](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/aggregate-query-snapshot#count)
 *
 * This function returns the number of documents the aggregate query's underlying query matched on
 * the server.
 *
 * @param {Real} snapshot An aggregate snapshot handle.
 * @returns {Real} The document count, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_aggregate_snapshot_get_query
 * @desc **Firebase C++ SDK:** [firebase::firestore::AggregateQuerySnapshot::query](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/aggregate-query-snapshot#query)
 *
 * This function returns the aggregate query the snapshot answers, as a new handle to release with
 * ${function.firebase_firestore_aggregate_query_release}.
 *
 * @param {Real} snapshot An aggregate snapshot handle.
 * @returns {Real} An aggregate query handle, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_aggregate_snapshot_is_valid
 * @desc **Firebase C++ SDK:** [firebase::firestore::AggregateQuerySnapshot::is_valid](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/aggregate-query-snapshot#is_valid)
 *
 * This function returns whether the handle refers to a usable aggregate snapshot.
 *
 * @param {Real} snapshot An aggregate snapshot handle.
 * @returns {Bool} `true` when the snapshot can be read, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_firestore_aggregate_snapshot_release
 * @desc This function releases an aggregate snapshot handle. A handle that is not an aggregate snapshot
 * sets ${function.firebase_last_error_code} to `FirebaseError.InvalidHandle`.
 *
 * @param {Real} snapshot The handle to release.
 * @function_end
 */

/**
 * @function firebase_firestore_add_snapshots_in_sync_listener
 * @desc **Firebase C++ SDK:** [firebase::firestore::Firestore::AddSnapshotsInSyncListener](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/firestore#addsnapshotsinsynclistener)
 *
 * This function registers a function to be called every time all snapshot listeners on the instance
 * have been told about a change - the point at which the game's view of several documents is
 * consistent again after one server update or local write touched more than one of them. It says
 * nothing about whether the listeners are in sync with the *server*; each snapshot's `is_from_cache`
 * answers that.
 *
 * The function returns a listener handle for ${function.firebase_firestore_listener_registration_remove}.
 * It returns `0` with ${function.firebase_last_error_code} set when no callback is given or the
 * instance handle is not valid.
 *
 * @param {Real} firestore The instance handle from ${function.firebase_firestore_get_instance}.
 * @param {Function} [callback] The function to call, with no arguments.
 * @returns {Real} A listener handle, or `0` on failure.
 *
 * @event callback
 * @desc Fires each time every snapshot listener affected by a change has been called.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_firestore_load_bundle
 * @desc **Firebase C++ SDK:** [firebase::firestore::Firestore::LoadBundle](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/firestore#loadbundle_1)
 *
 * This function loads a [Firestore bundle](https://firebase.google.com/docs/firestore/bundles) -
 * documents and named queries packaged on the server with the Admin SDK and shipped to the game as
 * a file or a download - into the local cache, so the first reads come from the cache at once
 * instead of one query per document. The bundle's bytes are read from a GameMaker buffer.
 *
 * The progress callback, when given, fires as documents land; the completion callback fires once
 * with the final progress, whose `state` is `FirestoreLoadBundleTaskState.Success` or `Error`.
 * Named queries in the bundle are then reachable through ${function.firebase_firestore_named_query}.
 *
 * @param {Real} firestore The instance handle from ${function.firebase_firestore_get_instance}.
 * @param {Buffer} bundle A buffer holding the bundle's bytes, from `buffer_load` or an HTTP download.
 * @param {Function} [progress_callback] A function called with each progress update, or `undefined`.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback:progress_callback
 * @desc Fires each time more of the bundle has been loaded.
 * @member {Struct.FirestoreLoadBundleTaskProgress} progress How far the load has got.
 * @event_end
 *
 * @event callback
 * @desc Fires once when the bundle has been loaded, or with the reason it was not.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Struct.FirestoreLoadBundleTaskProgress} progress The final progress, or `undefined` on failure.
 * @event_end
 *
 * @example
 * ```gml
 * var _bundle = buffer_load("levels.bundle");
 * firebase_firestore_load_bundle(firestore, _bundle, undefined, function(_error_code, _error_message, _progress)
 * {
 *     if (_error_code != FirestoreError.Ok)
 *     {
 *         show_debug_message("Bundle failed: " + _error_message);
 *         return;
 *     }
 *     show_debug_message($"Loaded {_progress.documents_loaded} documents");
 *     firebase_firestore_named_query(firestore, "featured-levels", function(_error_code, _error_message, _query)
 *     {
 *         if (!is_undefined(_query))
 *         {
 *             firebase_firestore_query_get(_query, FirestoreSource.Cache, on_levels);
 *             firebase_firestore_query_release(_query);
 *         }
 *     });
 * });
 * buffer_delete(_bundle);
 * ```
 * The above code loads a bundle shipped in the game's Included Files, then runs the named query it
 * carries against the cache, where the bundle's documents now are. The buffer is deleted right after
 * the call; the SDK copied its bytes.
 * @function_end
 */

/**
 * @function firebase_firestore_named_query
 * @desc **Firebase C++ SDK:** [firebase::firestore::Firestore::NamedQuery](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/firestore#namedquery)
 *
 * This function looks up a query by the name it was given when a bundle was built, once
 * ${function.firebase_firestore_load_bundle} has loaded that bundle. The callback receives a query
 * handle to run with ${function.firebase_firestore_query_get} (with `FirestoreSource.Cache` to stay
 * on the bundled documents) and to release with ${function.firebase_firestore_query_release}. An
 * unknown name completes without an error and with `undefined` for the query.
 *
 * @param {Real} firestore The instance handle from ${function.firebase_firestore_get_instance}.
 * @param {String} name The query's name in the bundle.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the query.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} query A query handle, or `undefined` when the name is unknown or the lookup failed.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_firestore_document_ref_set_merge_field_paths
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentReference::Set](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-reference#set)
 *
 * This function is ${function.firebase_firestore_document_ref_set_merge_fields} with the fields
 * named by field path handles instead of strings. A handle in the array that is not a field path is
 * skipped.
 *
 * @param {Real} document A document reference handle.
 * @param {Any} data A struct of field names to values; see the module's Data section for the conversion.
 * @param {Array[Real]} field_paths An array of field path handles naming the fields to write.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the server has accepted the write, or with the reason it did not.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_firestore_write_batch_set_merge_field_paths
 * @desc **Firebase C++ SDK:** [firebase::firestore::WriteBatch::Set](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/write-batch#set)
 *
 * This function adds a merge of the fields named by field path handles to the batch - the batch's
 * ${function.firebase_firestore_document_ref_set_merge_field_paths}. Nothing happens until ${function.firebase_firestore_write_batch_commit}; the function only
 * records the write and returns whether it did.
 *
 * @param {Real} batch A write batch handle from ${function.firebase_firestore_batch}.
 * @param {Real} document A document reference handle.
 * @param {Any} data A struct of field names to values; see the module's Data section for the conversion.
 * @param {Array[Real]} field_paths An array of field path handles naming the fields to write.
 * @returns {Bool} `true` when the write was added to the batch, `false` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_type
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::type](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#type_1)
 *
 * This function returns the kind of value a field value handle holds, as a
 * ${constant.FirestoreFieldValueType} member - one of the eleven value kinds, or one of the six
 * sentinels a write can carry. The `is_*` functions answer the same question one kind at a time.
 * A handle that is not a field value sets ${function.firebase_last_error_code} to
 * `FirebaseError.InvalidHandle`.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {Enum.FirestoreFieldValueType} The kind of value, or `FirestoreFieldValueType.Null` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_is_valid
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::is_valid](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#is_valid)
 *
 * This function returns whether the handle refers to a usable field value.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {Bool} `true` when the handle holds a value, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_is_null
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::is_null](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#is_null)
 *
 * This function returns whether a field value handle holds a null.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {Bool} `true` when the value is a null, otherwise `false` (also for an invalid handle).
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_is_boolean
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::is_boolean](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#is_boolean)
 *
 * This function returns whether a field value handle holds a boolean.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {Bool} `true` when the value is a boolean, otherwise `false` (also for an invalid handle).
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_is_integer
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::is_integer](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#is_integer)
 *
 * This function returns whether a field value handle holds an integer.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {Bool} `true` when the value is an integer, otherwise `false` (also for an invalid handle).
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_is_double
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::is_double](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#is_double)
 *
 * This function returns whether a field value handle holds a double.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {Bool} `true` when the value is a double, otherwise `false` (also for an invalid handle).
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_is_timestamp
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::is_timestamp](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#is_timestamp)
 *
 * This function returns whether a field value handle holds a timestamp.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {Bool} `true` when the value is a timestamp, otherwise `false` (also for an invalid handle).
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_is_string
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::is_string](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#is_string)
 *
 * This function returns whether a field value handle holds a string.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {Bool} `true` when the value is a string, otherwise `false` (also for an invalid handle).
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_is_blob
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::is_blob](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#is_blob)
 *
 * This function returns whether a field value handle holds a blob.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {Bool} `true` when the value is a blob, otherwise `false` (also for an invalid handle).
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_is_reference
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::is_reference](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#is_reference)
 *
 * This function returns whether a field value handle holds a document reference.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {Bool} `true` when the value is a document reference, otherwise `false` (also for an invalid handle).
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_is_geo_point
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::is_geo_point](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#is_geo_point)
 *
 * This function returns whether a field value handle holds a geo point.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {Bool} `true` when the value is a geo point, otherwise `false` (also for an invalid handle).
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_is_array
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::is_array](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#is_array)
 *
 * This function returns whether a field value handle holds an array.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {Bool} `true` when the value is an array, otherwise `false` (also for an invalid handle).
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_is_map
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::is_map](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#is_map)
 *
 * This function returns whether a field value handle holds a map.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {Bool} `true` when the value is a map, otherwise `false` (also for an invalid handle).
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_boolean_value
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::boolean_value](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#boolean_value)
 *
 * This function returns the boolean a field value handle holds. Values read from a snapshot arrive as plain GML values, so this
 * only ever inspects a handle the game built with one of the constructors.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {Bool} The value, or `false` when the handle does not hold a boolean.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_integer_value
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::integer_value](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#integer_value)
 *
 * This function returns the integer a field value handle holds. Values read from a snapshot arrive as plain GML values, so this
 * only ever inspects a handle the game built with one of the constructors.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {Real} The value, or `0` when the handle does not hold an integer.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_double_value
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::double_value](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#double_value)
 *
 * This function returns the double a field value handle holds. Values read from a snapshot arrive as plain GML values, so this
 * only ever inspects a handle the game built with one of the constructors.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {Real} The value, or `0` when the handle does not hold a double.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_string_value
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::string_value](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#string_value)
 *
 * This function returns the string a field value handle holds. Values read from a snapshot arrive as plain GML values, so this
 * only ever inspects a handle the game built with one of the constructors.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {String} The value, or an empty string when the handle does not hold a string.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_blob_size
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::blob_size](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#blob_size)
 *
 * This function returns the size in bytes of the blob a field value handle holds - one the game
 * built with ${function.firebase_firestore_field_value_blob}, or the `field_value` of a
 * ${struct.FirestoreBlob} read out of a document, whose `size` member already says the same.
 *
 * @param {Real} field_value A field value handle holding a blob.
 * @returns {Real} The blob's size, or `0` when the handle does not hold a blob.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_blob_copy
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::blob_value](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#blob_value)
 *
 * This function copies the bytes of the blob a field value handle holds into the start of a
 * GameMaker buffer, up to the buffer's size, and returns how many bytes were copied. It is how a
 * blob read out of a document reaches the game: the ${struct.FirestoreBlob} in the decoded data
 * carries the handle and the size, so create a buffer of that size and copy into it. The handle
 * stays valid until the snapshot it came from is released, or until
 * ${function.firebase_firestore_field_value_release} frees it earlier.
 *
 * @param {Real} field_value A field value handle holding a blob.
 * @param {Buffer} out_buffer The buffer to write into.
 * @returns {Real} The number of bytes copied, or `0` when the handle does not hold a blob.
 *
 * @example
 * ```gml
 * // Read the "avatar" blob of a document into a buffer of its own
 * var _data = firebase_firestore_document_snapshot_get_data(snapshot, FirestoreServerTimestampBehavior.None);
 * var _blob = _data.avatar;
 * avatar_buffer = buffer_create(_blob.size, buffer_fixed, 1);
 * firebase_firestore_field_value_blob_copy(_blob.field_value, avatar_buffer);
 *
 * // Releasing the snapshot frees the blob handle with it; the buffer is the game's
 * firebase_firestore_document_snapshot_release(snapshot);
 * ```
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_reference_value
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::reference_value](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#reference_value)
 *
 * This function returns the document reference a field value handle holds, as a new handle to release with ${function.firebase_firestore_document_ref_release}. Values read from a snapshot arrive as plain GML values, so this
 * only ever inspects a handle the game built with one of the constructors.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {Real} A document reference handle, or `0` when the handle does not hold a reference.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_timestamp_value
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::timestamp_value](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#timestamp_value)
 *
 * This function returns the timestamp a field value handle holds. Values read from a snapshot arrive as plain GML values, so this
 * only ever inspects a handle the game built with one of the constructors.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {Struct.FirestoreTimestamp} The timestamp, or `undefined` when the handle does not hold one.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_geo_point_value
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::geo_point_value](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#geo_point_value)
 *
 * This function returns the geo point a field value handle holds. Values read from a snapshot arrive as plain GML values, so this
 * only ever inspects a handle the game built with one of the constructors.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {Struct.FirestoreGeoPoint} The geo point, or `undefined` when the handle does not hold one.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_array_value
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::array_value](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#array_value)
 *
 * This function returns the elements of the array a field value handle holds, converted as the Data section describes. Values read from a snapshot arrive as plain GML values, so this
 * only ever inspects a handle the game built with one of the constructors.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {Any} The elements as a GML array, empty when the handle does not hold an array.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_map_value
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::map_value](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#map_value)
 *
 * This function returns the members of the map a field value handle holds, converted as the Data section describes. Values read from a snapshot arrive as plain GML values, so this
 * only ever inspects a handle the game built with one of the constructors.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {Any} The members as a GML struct, empty when the handle does not hold a map.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_to_string
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::ToString](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#tostring)
 *
 * This function returns a field value handle's contents as text for the debug output, in the SDK's
 * own format.
 *
 * @param {Real} field_value A field value handle from one of the constructors on this page.
 * @returns {String} The value as text, or an empty string when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_get_firestore
 * @desc **Firebase C++ SDK:** [firebase::firestore::Query::firestore](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query#firestore)
 *
 * This function returns the instance handle a query belongs to.
 *
 * @param {Real} query A query handle, or a collection reference handle.
 * @returns {Real} The instance handle, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_document_ref_get_firestore
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentReference::firestore](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-reference#firestore)
 *
 * This function returns the instance handle a document reference belongs to - the same handle
 * ${function.firebase_firestore_get_instance} returned for that database.
 *
 * @param {Real} document A document reference handle.
 * @returns {Real} The instance handle, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_document_ref_to_string
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentReference::ToString](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-reference#tostring)
 *
 * This function returns the reference as one line of text for the debug output. The format is the
 * SDK's own and can change; for the path itself use ${function.firebase_firestore_document_ref_path}.
 *
 * @param {Real} document A document reference handle.
 * @returns {String} The reference as text, or an empty string when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_document_ref_update_field_paths
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentReference::Update](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-reference#update_1)
 *
 * This function is ${function.firebase_firestore_document_ref_update} with each field named by a
 * field path handle instead of a string, in an array of ${struct.FirestoreFieldPathValue} entries.
 * It is the way to update a field whose name contains a dot. An entry whose handle is not a field
 * path is skipped.
 *
 * @param {Real} document A document reference handle.
 * @param {Array[Struct.FirestoreFieldPathValue]} entries An array of `{ field_path, value }` structs.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the server has accepted the update, or with the reason it did not.
 * @member {Enum.FirestoreError} error_code `FirestoreError.Ok` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @example
 * ```gml
 * var _path = firebase_firestore_field_path_create(["settings", "audio.volume"]);
 * firebase_firestore_document_ref_update_field_paths(_player, [{ field_path: _path, value: 0.8 }], function(_error_code, _error_message)
 * {
 *     show_debug_message(_error_code == FirestoreError.Ok ? "Volume saved" : _error_message);
 * });
 * firebase_firestore_field_path_release(_path);
 * ```
 * The above code updates the `audio.volume` field inside the `settings` map - a field name with a
 * dot in it, which a string key would have read as two levels.
 * @function_end
 */

/**
 * @function firebase_firestore_write_batch_update_field_paths
 * @desc **Firebase C++ SDK:** [firebase::firestore::WriteBatch::Update](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/write-batch#update_1)
 *
 * This function adds an update by field path handles to the batch - the batch's
 * ${function.firebase_firestore_document_ref_update_field_paths}. Nothing happens until ${function.firebase_firestore_write_batch_commit}; the function only
 * records the write and returns whether it did.
 *
 * @param {Real} batch A write batch handle from ${function.firebase_firestore_batch}.
 * @param {Real} document A document reference handle.
 * @param {Array[Struct.FirestoreFieldPathValue]} entries An array of `{ field_path, value }` structs.
 * @returns {Bool} `true` when the write was added to the batch, `false` when a handle was not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_write_batch_is_valid
 * @desc **Firebase C++ SDK:** [firebase::firestore::WriteBatch::is_valid](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/write-batch#is_valid)
 *
 * This function returns whether the handle refers to a usable write batch.
 *
 * @param {Real} batch A write batch handle from ${function.firebase_firestore_batch}.
 * @returns {Bool} `true` when the batch can be used, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_firestore_settings_to_string
 * @desc **Firebase C++ SDK:** [firebase::firestore::Settings::ToString](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/settings#tostring)
 *
 * This function returns the instance's settings as one line of text, for the debug output. The
 * format is the SDK's own and can change between versions; do not parse it.
 *
 * @param {Real} firestore The instance handle from ${function.firebase_firestore_get_instance}.
 * @returns {String} The settings as text, or an empty string when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_document_snapshot_is_valid
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentSnapshot::is_valid](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-snapshot#is_valid)
 *
 * This function returns whether the handle refers to a usable document snapshot - `false` after it
 * has been released.
 *
 * @param {Real} snapshot A document snapshot handle.
 * @returns {Bool} `true` when the snapshot can be read, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_firestore_document_snapshot_to_string
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentSnapshot::ToString](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-snapshot#tostring)
 *
 * This function returns the snapshot - its path, metadata and fields - as text for the debug
 * output, in the SDK's own format.
 *
 * @param {Real} snapshot A document snapshot handle.
 * @returns {String} The snapshot as text, or an empty string when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_document_snapshot_get_field_path
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentSnapshot::Get](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-snapshot#get_2)
 *
 * This function is ${function.firebase_firestore_document_snapshot_get} with the field named by a
 * field path handle, for a field whose name contains a dot.
 *
 * @param {Real} snapshot A document snapshot handle.
 * @param {Real} field_path A field path handle from ${function.firebase_firestore_field_path_create} or ${function.firebase_firestore_field_path_document_id}.
 * @param {Enum.FirestoreServerTimestampBehavior} server_timestamp_behavior How a server timestamp that the server has not resolved yet is reported: `FirestoreServerTimestampBehavior.None`, `Estimate` or `Previous`.
 * @returns {Struct.FirestoreFieldLookup} The lookup, with `exists` as `false` for a missing field; `undefined` when the snapshot handle, the path handle or the behavior argument is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_snapshot_is_valid
 * @desc **Firebase C++ SDK:** [firebase::firestore::QuerySnapshot::is_valid](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query-snapshot#is_valid)
 *
 * This function returns whether the handle refers to a usable query snapshot - `false` after it has
 * been released.
 *
 * @param {Real} snapshot A query snapshot handle.
 * @returns {Bool} `true` when the snapshot can be read, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_firestore_query_snapshot_get_query
 * @desc **Firebase C++ SDK:** [firebase::firestore::QuerySnapshot::query](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/query-snapshot#query)
 *
 * This function returns the query the snapshot answers, as a new query handle to release with
 * ${function.firebase_firestore_query_release} - useful in a listener callback that wants to run the
 * same query again or refine it.
 *
 * @param {Real} snapshot A query snapshot handle.
 * @returns {Real} A query handle, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_listener_registration_is_valid
 * @desc **Firebase C++ SDK:** [firebase::firestore::ListenerRegistration::is_valid](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/listener-registration#is_valid)
 *
 * This function returns whether the handle refers to a listener that is still registered.
 *
 * @param {Real} listener The listener handle.
 * @returns {Bool} `true` while the listener is registered, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_firestore_get_app
 * @desc **Firebase C++ SDK:** [firebase::firestore::Firestore::app](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/firestore#app)
 *
 * This function returns a handle to the Firebase App an instance belongs to. Release it with
 * ${function.firebase_app_release_handle}.
 *
 * @param {Real} firestore The instance handle from ${function.firebase_firestore_get_instance}.
 * @returns {Real} An app handle, or `0` when the instance handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_get_instance_for_app
 * @desc **Firebase C++ SDK:** [firebase::firestore::Firestore::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/firestore#getinstance)
 *
 * This function returns a handle to the Cloud Firestore instance of another Firebase App, created
 * with ${function.firebase_app_initialize_with_options} or ${function.firebase_app_initialize_from_json},
 * for a game that talks to two Firebase projects. It returns `0` with
 * ${function.firebase_last_error_code} set when the app handle is not valid or the instance could
 * not be created.
 *
 * @param {Real} app An app handle.
 * @returns {Real} The app's instance handle, or `0` on failure.
 * @function_end
 */

/**
 * @function firebase_firestore_get_instance_for_app_database
 * @desc **Firebase C++ SDK:** [firebase::firestore::Firestore::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/firestore#getinstance_2)
 *
 * This function is ${function.firebase_firestore_get_instance_for_app} for a named database of that
 * app.
 *
 * @param {Real} app An app handle.
 * @param {String} database_id The database ID as shown in the console.
 * @returns {Real} The instance handle, or `0` on failure.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_boolean
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::Boolean](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#boolean)
 *
 * This function wraps a boolean as a Firestore boolean. A GML `true`/`false` in a data struct is
 * stored as a boolean already, so the constructor is for building a typed value programmatically or
 * for a value that reaches the write as a number. The handle stands for the value wherever a write takes data - as a field's value in the struct
 * passed to ${function.firebase_firestore_document_ref_set}, ${function.firebase_firestore_document_ref_update},
 * ${function.firebase_firestore_collection_ref_add} or a write batch. Release it with
 * ${function.firebase_firestore_field_value_release} once the write has been started; the SDK keeps
 * its own copy.
 *
 * @param {Bool} value The value to store.
 * @returns {Real} A field value handle, to release with ${function.firebase_firestore_field_value_release} once the write has been started.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_string
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::String](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#string)
 *
 * This function wraps a string as a Firestore string - what a GML string in a data struct becomes
 * anyway. The handle stands for the value wherever a write takes data - as a field's value in the struct
 * passed to ${function.firebase_firestore_document_ref_set}, ${function.firebase_firestore_document_ref_update},
 * ${function.firebase_firestore_collection_ref_add} or a write batch. Release it with
 * ${function.firebase_firestore_field_value_release} once the write has been started; the SDK keeps
 * its own copy.
 *
 * @param {String} value The string to store.
 * @returns {Real} A field value handle, to release with ${function.firebase_firestore_field_value_release} once the write has been started.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_array
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::Array](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#array)
 *
 * This function wraps a GML array as a Firestore array, each element converted as the Data section
 * describes - what an array in a data struct becomes anyway. The handle stands for the value wherever a write takes data - as a field's value in the struct
 * passed to ${function.firebase_firestore_document_ref_set}, ${function.firebase_firestore_document_ref_update},
 * ${function.firebase_firestore_collection_ref_add} or a write batch. Release it with
 * ${function.firebase_firestore_field_value_release} once the write has been started; the SDK keeps
 * its own copy.
 *
 * @param {Any} value The array to store.
 * @returns {Real} A field value handle, to release with ${function.firebase_firestore_field_value_release} once the write has been started.
 * @function_end
 */

/**
 * @function firebase_firestore_field_value_map
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::Map](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#map)
 *
 * This function wraps a GML struct as a Firestore map, each member converted as the Data section
 * describes - what a nested struct in a data struct becomes anyway. The handle stands for the value wherever a write takes data - as a field's value in the struct
 * passed to ${function.firebase_firestore_document_ref_set}, ${function.firebase_firestore_document_ref_update},
 * ${function.firebase_firestore_collection_ref_add} or a write batch. Release it with
 * ${function.firebase_firestore_field_value_release} once the write has been started; the SDK keeps
 * its own copy.
 *
 * @param {Any} value The struct to store.
 * @returns {Real} A field value handle, to release with ${function.firebase_firestore_field_value_release} once the write has been started.
 * @function_end
 */

/**
 * @function firebase_firestore_document_snapshot_metadata_to_string
 * @desc **Firebase C++ SDK:** [firebase::firestore::SnapshotMetadata::ToString](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/snapshot-metadata#tostring)
 *
 * This function returns the snapshot's two metadata flags as text for the debug output.
 *
 * @param {Real} snapshot A document snapshot handle.
 * @returns {String} The metadata as text, or an empty string when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_query_snapshot_metadata_to_string
 * @desc **Firebase C++ SDK:** [firebase::firestore::SnapshotMetadata::ToString](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/snapshot-metadata#tostring)
 *
 * This function returns the snapshot's two metadata flags as text for the debug output.
 *
 * @param {Real} snapshot A query snapshot handle.
 * @returns {String} The metadata as text, or an empty string when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_firestore_document_snapshot_reference
 * @desc **Firebase C++ SDK:** [firebase::firestore::DocumentSnapshot::reference](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/document-snapshot#reference)
 *
 * This function returns a reference to the document the snapshot is of, as a new handle to release
 * with ${function.firebase_firestore_document_ref_release} - the way to write back to a document a
 * query returned.
 *
 * @param {Real} snapshot A document snapshot handle.
 * @returns {Real} A document reference handle, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @struct FirestoreTimestamp
 * @desc A point in time as Firestore stores it - how a timestamp field reads back, and what
 * ${function.firebase_firestore_field_value_timestamp_value} returns. Convert to a GameMaker
 * datetime with `date_create_datetime(1970, 1, 1, 0, 0, 0) + seconds / 86400`.
 *
 * @member {Real} seconds Whole seconds since 1970-01-01 00:00:00 UTC.
 * @member {Real} nanoseconds The fraction of a second in nanoseconds, `0` to `999999999`.
 * @struct_end
 */

/**
 * @struct FirestoreGeoPoint
 * @desc A geographic point as Firestore stores it - how a geo point field reads back, and what
 * ${function.firebase_firestore_field_value_geo_point_value} returns.
 *
 * @member {Real} latitude Degrees north, `-90` to `90`.
 * @member {Real} longitude Degrees east, `-180` to `180`.
 * @struct_end
 */

/**
 * @struct FirestoreBlob
 * @desc Binary data as it reads back out of a document. The bytes stay on the extension's side
 * behind a field value handle - the one read that hands out a handle, since nothing but a buffer
 * can carry bytes into GML and the extension cannot create one - and the game copies them into a
 * buffer of `size` bytes with ${function.firebase_firestore_field_value_blob_copy}. The handle
 * belongs to the snapshot the blob was read from: releasing the snapshot releases it, and
 * ${function.firebase_firestore_field_value_release} releases it earlier. To store one, use
 * ${function.firebase_firestore_field_value_blob} with a buffer - writing this struct back stores a
 * map with `field_value` and `size` members, not a blob.
 *
 * @member {Real} field_value A field value handle holding the bytes, valid while the snapshot is.
 * @member {Real} size The blob's size in bytes.
 * @struct_end
 */

/**
 * @struct FirestoreReference
 * @desc A document reference as it reads back out of a document: the referenced document's path
 * (`"users/abc"`). Reading one registers nothing - ${function.firebase_firestore_document} turns
 * the path into a document reference handle when the document is needed. To store one, use
 * ${function.firebase_firestore_field_value_reference} with a document reference handle - writing
 * this struct back stores a map with a `path` member, not a reference.
 *
 * @member {String} path The referenced document's path, relative to the database root.
 * @struct_end
 */

/**
 * @struct FirestoreDocumentChange
 * @desc One change between two snapshots of a query listener, from
 * ${function.firebase_firestore_query_snapshot_document_changes}. Applying the changes in array
 * order, each at its `new_index` (or removing the one at `old_index`), reproduces the new result
 * list from the old one.
 *
 * @member {Enum.FirestoreDocumentChangeType} type Whether the document entered the results, changed within them, or left them.
 * @member {Real} document A snapshot handle of the document as it is now (or was, for a removal), to release with ${function.firebase_firestore_document_snapshot_release}.
 * @member {Real} old_index The document's position in the previous results, or `-1` for an added document.
 * @member {Real} new_index The document's position in the new results, or `-1` for a removed document.
 * @struct_end
 */

/**
 * @struct FirestoreFieldLookup
 * @desc The result of reading one field with ${function.firebase_firestore_document_snapshot_get} or
 * ${function.firebase_firestore_document_snapshot_get_field_path}. `value` is `undefined` both for a
 * field that is not there and for one that holds a Firestore null; `exists` tells them apart.
 *
 * @member {Bool} exists Whether the document has the field.
 * @member {Any} value The field's value converted as the Data section describes, or `undefined`.
 * @struct_end
 */

/**
 * @struct FirestoreFieldPathValue
 * @desc One field-path-to-value pair for ${function.firebase_firestore_document_ref_update_field_paths}
 * and ${function.firebase_firestore_write_batch_update_field_paths}, written as a GML struct literal
 * `{ field_path: handle, value: v }`.
 *
 * @member {Real} field_path A field path handle naming the field.
 * @member {Any} value The value to write - a GML value or a field value handle.
 * @struct_end
 */

/**
 * @struct FirestoreLoadBundleTaskProgress
 * @desc How far ${function.firebase_firestore_load_bundle} has got, delivered to its progress callback
 * while loading and to its completion callback at the end. The totals are `0` when the bundle could
 * not be parsed.
 *
 * @member {Real} documents_loaded Documents loaded so far.
 * @member {Real} total_documents Documents in the bundle.
 * @member {Real} bytes_loaded Bytes loaded so far.
 * @member {Real} total_bytes Bytes in the bundle.
 * @member {Enum.FirestoreLoadBundleTaskState} state `InProgress` while loading, then `Success` or `Error` - both final.
 * @struct_end
 */

/**
 * @struct FirestoreDocumentSnapshotInfo
 * @desc Every property of a document snapshot but its fields, from
 * ${function.firebase_firestore_document_snapshot_get_info}.
 *
 * @member {Bool} exists Whether the document existed when the snapshot was taken; a read of a missing document is not an error, this is how it shows.
 * @member {String} id The ID of the document the snapshot is of, whether or not it exists.
 * @member {Bool} has_pending_writes Whether the snapshot reflects a local write the server has not confirmed yet; a listener that opted into metadata changes fires again with `false` once the server has.
 * @member {Bool} is_from_cache Whether the snapshot came from the local cache rather than the server - because the read asked for the cache, the device was offline, or a listener delivered the cached copy first; a listener that opted into metadata changes fires again with `false` once the server's data has arrived.
 * @struct_end
 */

/**
 * @struct FirestoreQuerySnapshotInfo
 * @desc Every property of a query snapshot but its documents, from
 * ${function.firebase_firestore_query_snapshot_get_info}.
 *
 * @member {Real} size The number of documents in the results.
 * @member {Bool} empty Whether there are none.
 * @member {Bool} has_pending_writes Whether any document in the results reflects a local write the server has not confirmed yet.
 * @member {Bool} is_from_cache Whether the results came from the local cache rather than the server, as ${struct.FirestoreDocumentSnapshotInfo}'s `is_from_cache` describes.
 * @struct_end
 */

/**
 * @const FirestoreError
 * @desc The `error_code` every Cloud Firestore callback receives, mirroring the SDK's codes value for
 * value. `Ok` is success. The ones a game meets: `PermissionDenied` (a security rule, or nobody
 * signed in when the rules need a user), `NotFound` (an update of a document that does not exist),
 * `FailedPrecondition` (a query that needs an index - the message carries the console link that
 * creates it), `Unavailable` (offline with a `Server` read), `ResourceExhausted` (the project's
 * quota).
 *
 * @member Ok Success.
 * @member Cancelled The operation was cancelled.
 * @member Unknown An unknown error, or one from outside Firestore.
 * @member InvalidArgument An argument is wrong regardless of the database's state - an invalid field name, an operator combination Firestore does not allow.
 * @member DeadlineExceeded The operation did not complete in time; a write may still have gone through.
 * @member NotFound The document does not exist (an update of a missing document), or the database has not been created.
 * @member AlreadyExists The document being created already exists.
 * @member PermissionDenied The security rules refused the operation.
 * @member ResourceExhausted A quota is used up - the project's, or the device's storage.
 * @member FailedPrecondition The database is not in the state the operation needs: a missing index, a clear of a running instance.
 * @member Aborted The operation was aborted by a concurrency conflict.
 * @member OutOfRange The operation went past a valid range.
 * @member Unimplemented The operation is not implemented or not enabled.
 * @member Internal An internal error; something in the SDK or the service is broken.
 * @member Unavailable The service could not be reached - usually the device is offline; worth a retry.
 * @member DataLoss Unrecoverable data loss or corruption.
 * @member Unauthenticated The request has no valid authentication credentials; sign in first.
 * @const_end
 */

/**
 * @const FirestoreSource
 * @desc Where ${function.firebase_firestore_document_ref_get} and ${function.firebase_firestore_query_get} read from.
 *
 * @member Default Ask the server, and fall back to the local cache when it cannot be reached.
 * @member Server Ask the server only; fail with `FirestoreError.Unavailable` when it cannot be reached. Pending local writes are still merged into the result.
 * @member Cache Read the local cache only, without touching the network. A document that is not cached fails with `Unavailable`; a query with nothing cached succeeds with an empty snapshot.
 * @const_end
 */

/**
 * @const FirestoreDirection
 * @desc The sort direction of ${function.firebase_firestore_query_order_by}.
 *
 * @member Ascending Smallest first.
 * @member Descending Largest first.
 * @const_end
 */

/**
 * @const FirestoreServerTimestampBehavior
 * @desc What a snapshot reports for a server timestamp field
 * (${function.firebase_firestore_field_value_server_timestamp}) whose write the server has not
 * confirmed yet - only ever a question for a snapshot with `has_pending_writes`.
 *
 * @member None Report the field as `undefined` until the server has set it.
 * @member Estimate Report the local clock's estimate, which changes to the server's value once it arrives.
 * @member Previous Report the value the field held before the pending write.
 * @const_end
 */

/**
 * @const FirestoreDocumentChangeType
 * @desc The kind of change a ${struct.FirestoreDocumentChange} describes.
 *
 * @member Added The document entered the query's results.
 * @member Modified The document changed while in the results.
 * @member Removed The document left the results - deleted, or no longer matching.
 * @const_end
 */

/**
 * @const FirestoreLoadBundleTaskState
 * @desc The `state` of a ${struct.FirestoreLoadBundleTaskProgress}.
 *
 * @member Error The load failed; final.
 * @member InProgress The load is running.
 * @member Success The load finished; final.
 * @const_end
 */

/**
 * @const FirestoreFieldValueType
 * @desc **Firebase C++ SDK:** [firebase::firestore::FieldValue::Type](https://firebase.google.com/docs/reference/cpp/class/firebase/firestore/field-value#type)
 *
 * The kind of value a field value handle holds, from ${function.firebase_firestore_field_value_type}:
 * the eleven kinds a document can store, and the six sentinels that are only ever passed to a write
 * and never come back from Firestore.
 *
 * @member Null A null value - also what an invalid handle reports.
 * @member Boolean A boolean.
 * @member Integer A 64-bit integer.
 * @member Double A double.
 * @member Timestamp A ${struct.FirestoreTimestamp}.
 * @member String A string.
 * @member Blob A byte array.
 * @member Reference A document reference.
 * @member GeoPoint A ${struct.FirestoreGeoPoint}.
 * @member Array An array of field values.
 * @member Map A map of field names to field values.
 * @member Delete Sentinel: deletes the field, from ${function.firebase_firestore_field_value_delete}.
 * @member ServerTimestamp Sentinel: the server's time at the write, from ${function.firebase_firestore_field_value_server_timestamp}.
 * @member ArrayUnion Sentinel: adds elements to an array field, from ${function.firebase_firestore_field_value_array_union}.
 * @member ArrayRemove Sentinel: removes elements from an array field, from ${function.firebase_firestore_field_value_array_remove}.
 * @member IncrementInteger Sentinel: adds an integer to a numeric field, from ${function.firebase_firestore_field_value_increment_integer}.
 * @member IncrementDouble Sentinel: adds a double to a numeric field, from ${function.firebase_firestore_field_value_increment_double}.
 * @const_end
 */

/**
 * @const FirestoreAggregateSource
 * @desc Where ${function.firebase_firestore_aggregate_query_get} computes its result.
 *
 * @member Server On the server, from the server's data alone - the local cache and pending writes are ignored, and the call fails offline.
 * @const_end
 */

/**
 * @module firestore
 * @title Cloud Firestore
 * @desc This module covers Cloud Firestore, Firebase's document database: documents (structs of fields)
 * in collections, read once or listened to, written singly or in atomic batches, queried by field
 * values, and cached on the device so the game keeps working offline. Everything starts from the
 * instance handle of ${function.firebase_firestore_get_instance}.
 *
 * ### Handles
 *
 * A reference, query, batch, snapshot, filter, field path and field value each reach GML as a
 * numeric handle, and each has a `*_release` function. The rule is the same everywhere: a handle
 * can be released as soon as the call that consumed it has returned, because the SDK keeps its own
 * copy - a query built from a collection reference, a listener on a document, a batch holding a
 * document reference, a write holding a field value none of them need the original handle kept
 * alive. Snapshots are the exception in the other direction: each callback, each element of
 * ${function.firebase_firestore_query_snapshot_documents} and each ${struct.FirestoreDocumentChange}
 * mints a new snapshot handle that the game must release, and a loop that does not leaks one per
 * document.
 *
 * The query builders (`firebase_firestore_query_where_*`, `order_by`, `limit`, the cursors) never
 * change their input: each returns a new handle with the condition added, and takes either a query
 * handle or a collection reference handle. Release the intermediate handles as the chain is built.
 *
 * ### Data
 *
 * A document is written from a GML struct and read back as one. On the way in: a number becomes a
 * Firestore double (wrap it in ${function.firebase_firestore_field_value_integer} when the stored
 * type matters), a string a string, `true`/`false` a boolean, an array an array, a nested struct a
 * map, `undefined` a null, a document reference handle a reference, and a handle from the field
 * value constructors the value or sentinel it stands for - a server timestamp, an increment, an
 * array union, a delete. On the way out: integers and doubles both arrive as numbers, maps as
 * structs, arrays as arrays, nulls as `undefined`, and the four Firestore types GML has no value
 * for as one struct each - ${struct.FirestoreTimestamp}, ${struct.FirestoreGeoPoint},
 * ${struct.FirestoreBlob} (a handle to copy the bytes out of, plus their size) and
 * ${struct.FirestoreReference} (the document's path). The blob's handle is the one a read hands
 * out, and it is released with the snapshot; to write one of the four back, use its
 * `firebase_firestore_field_value_*` constructor - passing the struct itself stores a map of its
 * members.
 *
 * A field name in a data struct or a query can be a dotted path into nested maps (`"stats.wins"`).
 * A field whose own name contains a dot is reached through a field path handle
 * (${function.firebase_firestore_field_path_create}) and the `_field_path` variants.
 *
 * ### Reads, writes and the cache
 *
 * Every read and write takes a callback and returns ${constant.FirebaseError} at once; the
 * callback's `error_code` is a ${constant.FirestoreError}. A write lands in the local cache
 * immediately - a listener on the document fires before the network is touched, with
 * `has_pending_writes` set - and its callback fires when the server has accepted it, which offline
 * means not until the connection is back. Reads with `FirestoreSource.Default` ask the server and
 * fall back to the cache; the cache holds every document the game has read or written and every
 * result of a listened-to query, so a game that listens to what it shows keeps working offline.
 *
 * A read that must be atomic with its write is a transaction
 * (${function.firebase_firestore_run_transaction}): the update callback reads and writes through
 * a transaction handle and commits, and the SDK runs it again when a document it read changed in
 * between. Atomic writes of several documents that need no read are write batches; atomic
 * counters and array edits are the field value sentinels.
 *
 * ### Console setup
 *
 * Create the database under **Build > Firestore Database** in the Firebase console and write
 * security rules for it; the default test-mode rules expire after 30 days and the default locked
 * rules refuse everything with `FirestoreError.PermissionDenied`. A query that needs a composite
 * index fails with `FailedPrecondition` and a message carrying the link that creates the index.
 * ${page.guides_firestore} walks through it.
 *
 * @section_func Instance and settings
 * @desc The Firestore instance and the settings that must be applied before it is first used:
 * @ref firebase_firestore_get_instance
 * @ref firebase_firestore_get_instance_for_database
 * @ref firebase_firestore_get_instance_for_app
 * @ref firebase_firestore_get_instance_for_app_database
 * @ref firebase_firestore_get_app
 * @ref firebase_firestore_settings_get_host
 * @ref firebase_firestore_settings_set_host
 * @ref firebase_firestore_settings_get_ssl_enabled
 * @ref firebase_firestore_settings_set_ssl_enabled
 * @ref firebase_firestore_settings_get_persistence_enabled
 * @ref firebase_firestore_settings_set_persistence_enabled
 * @ref firebase_firestore_settings_get_cache_size_bytes
 * @ref firebase_firestore_settings_set_cache_size_bytes
 * @ref firebase_firestore_settings_to_string
 * @ref firebase_firestore_set_log_level
 * @section_end
 *
 * @section_func Instance lifecycle
 * @desc Going offline and back, waiting for writes, bundles, and the two test-only resets:
 * @ref firebase_firestore_enable_network
 * @ref firebase_firestore_disable_network
 * @ref firebase_firestore_wait_for_pending_writes
 * @ref firebase_firestore_add_snapshots_in_sync_listener
 * @ref firebase_firestore_load_bundle
 * @ref firebase_firestore_named_query
 * @ref firebase_firestore_terminate
 * @ref firebase_firestore_clear_persistence
 * @section_end
 *
 * @section_func Paths
 * @desc Turning a path into a reference, a collection ID into a collection group query, and starting a batch:
 * @ref firebase_firestore_collection
 * @ref firebase_firestore_document
 * @ref firebase_firestore_collection_group
 * @ref firebase_firestore_batch
 * @section_end
 *
 * @section_func Collection references
 * @desc A collection reference names a collection; it adds documents, reaches the documents in it,
 * and is the starting point of every query over it (every `firebase_firestore_query_*` function
 * accepts one):
 * @ref firebase_firestore_collection_ref_id
 * @ref firebase_firestore_collection_ref_path
 * @ref firebase_firestore_collection_ref_parent
 * @ref firebase_firestore_collection_ref_document
 * @ref firebase_firestore_collection_ref_document_path
 * @ref firebase_firestore_collection_ref_add
 * @ref firebase_firestore_collection_ref_is_valid
 * @ref firebase_firestore_collection_ref_release
 * @section_end
 *
 * @section_func Document references
 * @desc A document reference names one document, which may or may not exist; it reads, writes,
 * deletes and listens to it:
 * @ref firebase_firestore_document_ref_id
 * @ref firebase_firestore_document_ref_path
 * @ref firebase_firestore_document_ref_parent
 * @ref firebase_firestore_document_ref_collection
 * @ref firebase_firestore_document_ref_get
 * @ref firebase_firestore_document_ref_set
 * @ref firebase_firestore_document_ref_set_merge
 * @ref firebase_firestore_document_ref_set_merge_fields
 * @ref firebase_firestore_document_ref_set_merge_field_paths
 * @ref firebase_firestore_document_ref_update
 * @ref firebase_firestore_document_ref_update_field_paths
 * @ref firebase_firestore_document_ref_delete
 * @ref firebase_firestore_document_ref_add_snapshot_listener
 * @ref firebase_firestore_document_ref_is_valid
 * @ref firebase_firestore_document_ref_release
 * @ref firebase_firestore_document_ref_get_firestore
 * @ref firebase_firestore_document_ref_to_string
 * @section_end
 *
 * @section_func Queries
 * @desc Refining a query one condition at a time - every builder returns a new handle and accepts a
 * query or a collection reference - then running it once or listening to it. Firestore restricts
 * how the operators combine (one `not_in` or `not_equal_to` per query, a `not_in` never matching
 * `null`, the list operators capped in length); a query that breaks a rule fails in its callback
 * with `FirestoreError.InvalidArgument` and a message naming the rule, and the
 * [query limitations](https://firebase.google.com/docs/firestore/query-data/queries#limitations)
 * page is the current list:
 * @ref firebase_firestore_query_where_equal_to
 * @ref firebase_firestore_query_where_not_equal_to
 * @ref firebase_firestore_query_where_less_than
 * @ref firebase_firestore_query_where_less_than_or_equal_to
 * @ref firebase_firestore_query_where_greater_than
 * @ref firebase_firestore_query_where_greater_than_or_equal_to
 * @ref firebase_firestore_query_where_array_contains
 * @ref firebase_firestore_query_where_array_contains_any
 * @ref firebase_firestore_query_where_in
 * @ref firebase_firestore_query_where_not_in
 * @ref firebase_firestore_query_where_equal_to_field_path
 * @ref firebase_firestore_query_where_not_equal_to_field_path
 * @ref firebase_firestore_query_where_less_than_field_path
 * @ref firebase_firestore_query_where_less_than_or_equal_to_field_path
 * @ref firebase_firestore_query_where_greater_than_field_path
 * @ref firebase_firestore_query_where_greater_than_or_equal_to_field_path
 * @ref firebase_firestore_query_where_array_contains_field_path
 * @ref firebase_firestore_query_where_array_contains_any_field_path
 * @ref firebase_firestore_query_where_in_field_path
 * @ref firebase_firestore_query_where_not_in_field_path
 * @ref firebase_firestore_query_where_filter
 * @ref firebase_firestore_query_order_by
 * @ref firebase_firestore_query_order_by_field_path
 * @ref firebase_firestore_query_limit
 * @ref firebase_firestore_query_limit_to_last
 * @ref firebase_firestore_query_start_at_snapshot
 * @ref firebase_firestore_query_start_at_values
 * @ref firebase_firestore_query_start_after_snapshot
 * @ref firebase_firestore_query_start_after_values
 * @ref firebase_firestore_query_end_before_snapshot
 * @ref firebase_firestore_query_end_before_values
 * @ref firebase_firestore_query_end_at_snapshot
 * @ref firebase_firestore_query_end_at_values
 * @ref firebase_firestore_query_get
 * @ref firebase_firestore_query_add_snapshot_listener
 * @ref firebase_firestore_query_count
 * @ref firebase_firestore_query_is_valid
 * @ref firebase_firestore_query_release
 * @ref firebase_firestore_query_get_firestore
 * @section_end
 *
 * @section_func Filters
 * @desc Conditions as values, for the OR that chained `where` calls cannot express: build one filter
 * per condition, combine with `and`/`or`, apply with ${function.firebase_firestore_query_where_filter}:
 * @ref firebase_firestore_filter_equal_to
 * @ref firebase_firestore_filter_not_equal_to
 * @ref firebase_firestore_filter_less_than
 * @ref firebase_firestore_filter_less_than_or_equal_to
 * @ref firebase_firestore_filter_greater_than
 * @ref firebase_firestore_filter_greater_than_or_equal_to
 * @ref firebase_firestore_filter_array_contains
 * @ref firebase_firestore_filter_array_contains_any
 * @ref firebase_firestore_filter_in
 * @ref firebase_firestore_filter_not_in
 * @ref firebase_firestore_filter_equal_to_field_path
 * @ref firebase_firestore_filter_not_equal_to_field_path
 * @ref firebase_firestore_filter_less_than_field_path
 * @ref firebase_firestore_filter_less_than_or_equal_to_field_path
 * @ref firebase_firestore_filter_greater_than_field_path
 * @ref firebase_firestore_filter_greater_than_or_equal_to_field_path
 * @ref firebase_firestore_filter_array_contains_field_path
 * @ref firebase_firestore_filter_array_contains_any_field_path
 * @ref firebase_firestore_filter_in_field_path
 * @ref firebase_firestore_filter_not_in_field_path
 * @ref firebase_firestore_filter_and
 * @ref firebase_firestore_filter_or
 * @ref firebase_firestore_filter_release
 * @section_end
 *
 * @section_func Field paths
 * @desc Naming a field by its segments, for a name that contains a dot, and the document ID as a field:
 * @ref firebase_firestore_field_path_create
 * @ref firebase_firestore_field_path_document_id
 * @ref firebase_firestore_field_path_is_valid
 * @ref firebase_firestore_field_path_to_string
 * @ref firebase_firestore_field_path_release
 * @section_end
 *
 * @section_func Aggregate queries
 * @desc Counting a query's results on the server without downloading them:
 * @ref firebase_firestore_aggregate_query_get_query
 * @ref firebase_firestore_aggregate_query_is_valid
 * @ref firebase_firestore_aggregate_query_get
 * @ref firebase_firestore_aggregate_query_release
 * @ref firebase_firestore_aggregate_snapshot_count
 * @ref firebase_firestore_aggregate_snapshot_get_query
 * @ref firebase_firestore_aggregate_snapshot_is_valid
 * @ref firebase_firestore_aggregate_snapshot_release
 * @section_end
 *
 * @section_func Write batches
 * @desc Several writes committed as one atomic unit:
 * @ref firebase_firestore_write_batch_set
 * @ref firebase_firestore_write_batch_set_merge
 * @ref firebase_firestore_write_batch_set_merge_fields
 * @ref firebase_firestore_write_batch_set_merge_field_paths
 * @ref firebase_firestore_write_batch_update
 * @ref firebase_firestore_write_batch_update_field_paths
 * @ref firebase_firestore_write_batch_delete
 * @ref firebase_firestore_write_batch_commit
 * @ref firebase_firestore_write_batch_is_valid
 * @ref firebase_firestore_write_batch_release
 * @section_end
 *
 * @section_func Transactions
 * @desc The calls an update callback of ${function.firebase_firestore_run_transaction} makes on its
 * handle - reads, then writes, then the commit or abort that ends the attempt:
 * @ref firebase_firestore_run_transaction
 * @ref firebase_firestore_transaction_get
 * @ref firebase_firestore_transaction_set
 * @ref firebase_firestore_transaction_set_merge
 * @ref firebase_firestore_transaction_set_merge_fields
 * @ref firebase_firestore_transaction_set_merge_field_paths
 * @ref firebase_firestore_transaction_update
 * @ref firebase_firestore_transaction_update_field_paths
 * @ref firebase_firestore_transaction_delete
 * @ref firebase_firestore_transaction_commit
 * @ref firebase_firestore_transaction_abort
 * @section_end
 *
 * @section_func Field values
 * @desc Values a plain GML value cannot express, for use inside the data of a write: the sentinels
 * the server resolves (delete, server timestamp, array union and remove, increment), the typed
 * constructors (an integer rather than a double, a timestamp, a geo point, a reference, a blob, a
 * null), and the accessors that inspect a handle the game built:
 * @ref firebase_firestore_field_value_delete
 * @ref firebase_firestore_field_value_server_timestamp
 * @ref firebase_firestore_field_value_array_union
 * @ref firebase_firestore_field_value_array_remove
 * @ref firebase_firestore_field_value_increment_integer
 * @ref firebase_firestore_field_value_increment_double
 * @ref firebase_firestore_field_value_integer
 * @ref firebase_firestore_field_value_double
 * @ref firebase_firestore_field_value_boolean
 * @ref firebase_firestore_field_value_string
 * @ref firebase_firestore_field_value_array
 * @ref firebase_firestore_field_value_map
 * @ref firebase_firestore_field_value_timestamp
 * @ref firebase_firestore_field_value_geo_point
 * @ref firebase_firestore_field_value_reference
 * @ref firebase_firestore_field_value_blob
 * @ref firebase_firestore_field_value_null
 * @ref firebase_firestore_field_value_type
 * @ref firebase_firestore_field_value_is_valid
 * @ref firebase_firestore_field_value_is_null
 * @ref firebase_firestore_field_value_is_boolean
 * @ref firebase_firestore_field_value_is_integer
 * @ref firebase_firestore_field_value_is_double
 * @ref firebase_firestore_field_value_is_timestamp
 * @ref firebase_firestore_field_value_is_string
 * @ref firebase_firestore_field_value_is_blob
 * @ref firebase_firestore_field_value_is_reference
 * @ref firebase_firestore_field_value_is_geo_point
 * @ref firebase_firestore_field_value_is_array
 * @ref firebase_firestore_field_value_is_map
 * @ref firebase_firestore_field_value_boolean_value
 * @ref firebase_firestore_field_value_integer_value
 * @ref firebase_firestore_field_value_double_value
 * @ref firebase_firestore_field_value_string_value
 * @ref firebase_firestore_field_value_blob_size
 * @ref firebase_firestore_field_value_blob_copy
 * @ref firebase_firestore_field_value_reference_value
 * @ref firebase_firestore_field_value_timestamp_value
 * @ref firebase_firestore_field_value_geo_point_value
 * @ref firebase_firestore_field_value_array_value
 * @ref firebase_firestore_field_value_map_value
 * @ref firebase_firestore_field_value_to_string
 * @ref firebase_firestore_field_value_release
 * @section_end
 *
 * @section_func Document snapshots
 * @desc What a read or a listener delivers for one document - its existence, its fields, and where
 * the data came from:
 * @ref firebase_firestore_document_snapshot_get_info
 * @ref firebase_firestore_document_snapshot_get
 * @ref firebase_firestore_document_snapshot_get_field_path
 * @ref firebase_firestore_document_snapshot_get_data
 * @ref firebase_firestore_document_snapshot_reference
 * @ref firebase_firestore_document_snapshot_metadata_to_string
 * @ref firebase_firestore_document_snapshot_is_valid
 * @ref firebase_firestore_document_snapshot_to_string
 * @ref firebase_firestore_document_snapshot_release
 * @section_end
 *
 * @section_func Query snapshots
 * @desc What a query read or listener delivers - the matching documents, and what changed since the
 * listener's previous snapshot:
 * @ref firebase_firestore_query_snapshot_get_info
 * @ref firebase_firestore_query_snapshot_documents
 * @ref firebase_firestore_query_snapshot_document_changes
 * @ref firebase_firestore_query_snapshot_metadata_to_string
 * @ref firebase_firestore_query_snapshot_get_query
 * @ref firebase_firestore_query_snapshot_is_valid
 * @ref firebase_firestore_query_snapshot_release
 * @section_end
 *
 * @section_func Listeners
 * @desc Stopping a listener, and checking one:
 * @ref firebase_firestore_listener_registration_remove
 * @ref firebase_firestore_listener_registration_is_valid
 * @section_end
 *
 * @section_struct Structs
 * @desc The following structs are used by this module:
 * @ref FirestoreTimestamp
 * @ref FirestoreGeoPoint
 * @ref FirestoreBlob
 * @ref FirestoreReference
 * @ref FirestoreDocumentChange
 * @ref FirestoreFieldLookup
 * @ref FirestoreFieldPathValue
 * @ref FirestoreLoadBundleTaskProgress
 * @ref FirestoreDocumentSnapshotInfo
 * @ref FirestoreQuerySnapshotInfo
 * @section_end
 *
 * @section_const Constants
 * @desc The following constants are used by this module:
 * @ref FirestoreError
 * @ref FirestoreSource
 * @ref FirestoreDirection
 * @ref FirestoreServerTimestampBehavior
 * @ref FirestoreDocumentChangeType
 * @ref FirestoreLoadBundleTaskState
 * @ref FirestoreAggregateSource
 * @ref FirestoreFieldValueType
 * @section_end
 *
 * @module_end
 */
