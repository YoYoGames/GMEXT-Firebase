/**
 * @function firebase_storage_get_instance
 * @desc **Firebase C++ SDK:** [firebase::storage::Storage::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage#getinstance)
 *
 * This function returns a handle to Cloud Storage for the default Firebase App and its default
 * bucket - the one named in the credential file - creating the instance on first use. The same
 * handle comes back on every call, it lives as long as the game, and there is nothing to release.
 * Every reference starts from it: ${function.firebase_storage_get_reference} for the root of the
 * bucket, ${function.firebase_storage_get_reference_path} for an object or folder in it. It returns
 * `0` when ${function.firebase_app_initialize} has not succeeded, with
 * ${function.firebase_last_error_code} set to `FirebaseError.NotInitialized`.
 *
 * [[Note: The default bucket must be created in the Firebase console (Build > Storage) before the
 * first request; see ${page.guides_cloud_storage}.]]
 *
 * @returns {Real} The storage handle, or `0` when the default app does not exist.
 *
 * @example
 * ```gml
 * // Create Event of a persistent controller
 * storage = firebase_storage_get_instance();
 * if (storage == 0)
 * {
 *     show_debug_message($"Storage unavailable: {firebase_last_error_message()}");
 * }
 * ```
 * The above code fetches the storage handle once, right after ${function.firebase_app_initialize},
 * and keeps it in an instance variable for the rest of the game.
 * @function_end
 */

/**
 * @function firebase_storage_get_instance_with_url
 * @desc **Firebase C++ SDK:** [firebase::storage::Storage::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage#getinstance_1)
 *
 * This function is ${function.firebase_storage_get_instance} for another bucket of the same
 * project, named by its `gs://` URL as the console's Storage page shows it. Each URL has its own
 * instance, with its own retry times and emulator setting, and each comes back as the same handle
 * on every call.
 *
 * @param {String} url The bucket's URL (`"gs://my-game-replays"`).
 * @returns {Real} The storage handle for that bucket, or `0` when the default app does not exist.
 * @function_end
 */

/**
 * @function firebase_storage_url
 * @desc **Firebase C++ SDK:** [firebase::storage::Storage::url](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage#url)
 *
 * This function returns the `gs://` URL an instance was created with by
 * ${function.firebase_storage_get_instance_with_url}, or an empty string for the default
 * bucket's instance.
 *
 * @param {Real} storage_ref The storage handle from ${function.firebase_storage_get_instance}.
 * @returns {String} The bucket URL, or an empty string for the default bucket or a handle that is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_get_reference
 * @desc **Firebase C++ SDK:** [firebase::storage::Storage::GetReference](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage#getreference)
 *
 * This function returns a reference to the root of the bucket: the starting point for
 * ${function.firebase_storage_ref_child}, and the place to ${function.firebase_storage_ref_list}
 * the top-level folders. Release the handle with ${function.firebase_storage_ref_release}.
 *
 * @param {Real} storage_ref The storage handle from ${function.firebase_storage_get_instance}.
 * @returns {Real} A reference handle to release with ${function.firebase_storage_ref_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_get_reference_path
 * @desc **Firebase C++ SDK:** [firebase::storage::Storage::GetReference](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage#getreference_1)
 *
 * This function returns a reference to the object or folder at a slash-separated path from the
 * root of the bucket. A reference only names a location: nothing is sent until an operation is
 * started on it, and the location need not exist yet - uploading to it creates the object. Release
 * the handle with ${function.firebase_storage_ref_release}.
 *
 * @param {Real} storage_ref The storage handle from ${function.firebase_storage_get_instance}.
 * @param {String} path The path from the bucket root (`"players/USER_123/avatar.png"`).
 * @returns {Real} A reference handle to release with ${function.firebase_storage_ref_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_get_reference_from_url
 * @desc **Firebase C++ SDK:** [firebase::storage::Storage::GetReferenceFromUrl](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage#getreferencefromurl)
 *
 * This function returns a reference from a full URL: the `gs://bucket/path/to/object` form, or the
 * `https://firebasestorage.googleapis.com/...` form the console shows for a file. The URL must name
 * the bucket this instance was created for; another bucket's URL gives a reference whose
 * ${function.firebase_storage_ref_is_valid} is `false`. Release the handle with
 * ${function.firebase_storage_ref_release}.
 *
 * @param {Real} storage_ref The storage handle from ${function.firebase_storage_get_instance}.
 * @param {String} url The object's full URL.
 * @returns {Real} A reference handle to release with ${function.firebase_storage_ref_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_max_download_retry_time
 * @desc **Firebase C++ SDK:** [firebase::storage::Storage::max_download_retry_time](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage#max_download_retry_time)
 *
 * This function returns how long, in seconds, the SDK keeps retrying a download after a network
 * failure before its callback fires with `FirebaseStorageError.RetryLimitExceeded`. The default is 600
 * seconds.
 *
 * @param {Real} storage_ref The storage handle from ${function.firebase_storage_get_instance}.
 * @returns {Real} The limit in seconds, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_set_max_download_retry_time
 * @desc **Firebase C++ SDK:** [firebase::storage::Storage::set_max_download_retry_time](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage#set_max_download_retry_time)
 *
 * This function sets how long, in seconds, the SDK keeps retrying a download after a network failure
 * before its callback fires with `FirebaseStorageError.RetryLimitExceeded`. The default is 600 seconds;
 * set it before the operation starts. A game that would rather report a failure quickly and let the
 * player try again can bring it down to a few seconds.
 *
 * @param {Real} storage_ref The storage handle from ${function.firebase_storage_get_instance}.
 * @param {Real} seconds The limit in seconds.
 * @function_end
 */

/**
 * @function firebase_storage_max_upload_retry_time
 * @desc **Firebase C++ SDK:** [firebase::storage::Storage::max_upload_retry_time](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage#max_upload_retry_time)
 *
 * This function returns how long, in seconds, the SDK keeps retrying an upload after a network
 * failure before its callback fires with `FirebaseStorageError.RetryLimitExceeded`. The default is 600
 * seconds.
 *
 * @param {Real} storage_ref The storage handle from ${function.firebase_storage_get_instance}.
 * @returns {Real} The limit in seconds, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_set_max_upload_retry_time
 * @desc **Firebase C++ SDK:** [firebase::storage::Storage::set_max_upload_retry_time](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage#set_max_upload_retry_time)
 *
 * This function sets how long, in seconds, the SDK keeps retrying an upload after a network failure
 * before its callback fires with `FirebaseStorageError.RetryLimitExceeded`. The default is 600 seconds;
 * set it before the operation starts. A game that would rather report a failure quickly and let the
 * player try again can bring it down to a few seconds.
 *
 * @param {Real} storage_ref The storage handle from ${function.firebase_storage_get_instance}.
 * @param {Real} seconds The limit in seconds.
 * @function_end
 */

/**
 * @function firebase_storage_max_operation_retry_time
 * @desc **Firebase C++ SDK:** [firebase::storage::Storage::max_operation_retry_time](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage#max_operation_retry_time)
 *
 * This function returns how long, in seconds, the SDK keeps retrying an operation other than an upload or a download - a metadata read or write, a delete, a download URL or a listing after a network
 * failure before its callback fires with `FirebaseStorageError.RetryLimitExceeded`. The default is 120
 * seconds.
 *
 * @param {Real} storage_ref The storage handle from ${function.firebase_storage_get_instance}.
 * @returns {Real} The limit in seconds, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_set_max_operation_retry_time
 * @desc **Firebase C++ SDK:** [firebase::storage::Storage::set_max_operation_retry_time](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage#set_max_operation_retry_time)
 *
 * This function sets how long, in seconds, the SDK keeps retrying an operation other than an upload or a download - a metadata read or write, a delete, a download URL or a listing after a network failure
 * before its callback fires with `FirebaseStorageError.RetryLimitExceeded`. The default is 120 seconds;
 * set it before the operation starts. A game that would rather report a failure quickly and let the
 * player try again can bring it down to a few seconds.
 *
 * @param {Real} storage_ref The storage handle from ${function.firebase_storage_get_instance}.
 * @param {Real} seconds The limit in seconds.
 * @function_end
 */

/**
 * @function firebase_storage_use_emulator
 * @desc **Firebase C++ SDK:** [firebase::storage::Storage::UseEmulator](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage#useemulator)
 *
 * This function points an instance at the Storage emulator of the Firebase Local Emulator Suite
 * instead of the real bucket, for development against data that is not billed and not shared. Call
 * it right after obtaining the instance and before anything else is done with it; the SDK does not
 * accept a change once the instance has been used. The emulator's default port is `9199`.
 *
 * @param {Real} storage_ref The storage handle from ${function.firebase_storage_get_instance}.
 * @param {String} host The emulator's host name or address (`"127.0.0.1"`).
 * @param {Real} port The emulator's port.
 * @function_end
 */

/**
 * @function firebase_storage_ref_child
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageReference::Child](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-reference#child)
 *
 * This function returns a reference to a location below this one, so that `"avatars/player.png"`
 * on the root names the same object as `"player.png"` on `"avatars"`. Release the returned handle
 * with ${function.firebase_storage_ref_release}; the input handle is unchanged.
 *
 * @param {Real} ref A reference handle.
 * @param {String} path A slash-separated path relative to this location.
 * @returns {Real} A reference handle to release with ${function.firebase_storage_ref_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_ref_get_parent
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageReference::GetParent](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-reference#getparent)
 *
 * This function returns a reference to the folder holding this location. The root has no parent:
 * there the returned reference's ${function.firebase_storage_ref_is_valid} is `false`, and it still
 * needs releasing.
 *
 * @param {Real} ref A reference handle.
 * @returns {Real} A reference handle to release with ${function.firebase_storage_ref_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_ref_release
 * @desc This function releases a reference handle - one from the storage instance, from
 * ${function.firebase_storage_ref_child} or ${function.firebase_storage_ref_get_parent}, from a
 * metadata's or controller's `get_reference`, or taken out of a list result. Release it once no
 * operation started on it is still running. A handle that is not a reference sets
 * ${function.firebase_last_error_code} to `FirebaseError.InvalidHandle`.
 *
 * [[Warning: On Windows, macOS and Linux the SDK keeps reading the reference an operation was started on
 * until that operation has completed, so keep the reference handle until the callback has fired -
 * releasing it earlier is a use of freed memory on those platforms. Android and iOS only hold the
 * operation itself, but releasing after the callback is correct everywhere.]]
 *
 * @param {Real} ref The handle to release.
 * @function_end
 */

/**
 * @function firebase_storage_ref_bucket
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageReference::bucket](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-reference#bucket)
 *
 * This function returns the name of the bucket a reference belongs to, without the `gs://`
 * prefix.
 *
 * @param {Real} ref A reference handle.
 * @returns {String} The bucket name, or an empty string when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_ref_full_path
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageReference::full_path](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-reference#full_path)
 *
 * This function returns the path from the bucket root, without a leading slash:
 * `"players/USER_123/avatar.png"` for `gs://bucket/players/USER_123/avatar.png`. At the root it is
 * an empty string.
 *
 * @param {Real} ref A reference handle.
 * @returns {String} The full path, or an empty string at the root or when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_ref_name
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageReference::name](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-reference#name)
 *
 * This function returns the last segment of the path - the object's or folder's own name,
 * `"avatar.png"` for `players/USER_123/avatar.png`.
 *
 * @param {Real} ref A reference handle.
 * @returns {String} The name, or an empty string at the root or when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_ref_is_valid
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageReference::is_valid](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-reference#is_valid)
 *
 * This function returns whether the handle refers to a usable reference - `false` for a released
 * handle, for the parent of the root, for the reference of a metadata or controller handle that
 * is not attached to an object, and for one made from another bucket's URL.
 *
 * @param {Real} ref A reference handle.
 * @returns {Bool} `true` when the reference can be used, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_storage_ref_storage
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageReference::storage](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-reference#storage)
 *
 * This function returns the storage instance a reference was made from - the same handle
 * ${function.firebase_storage_get_instance} or ${function.firebase_storage_get_instance_with_url}
 * returned, with nothing to release.
 *
 * @param {Real} ref A reference handle.
 * @returns {Real} The storage handle, or `0` when the reference handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_ref_delete
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageReference::Delete](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-reference#delete)
 *
 * This function deletes the object at the location. Deleting one that does not exist fails with
 * `FirebaseStorageError.ObjectNotFound`. Folders are not objects and cannot be deleted; a folder disappears
 * when its last object does.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when the
 * reference is not valid.
 *
 * [[Warning: On Windows, macOS and Linux the SDK keeps reading the reference an operation was started on
 * until that operation has completed, so keep the reference handle until the callback has fired -
 * releasing it earlier is a use of freed memory on those platforms. Android and iOS only hold the
 * operation itself, but releasing after the callback is correct everywhere.]]
 *
 * @param {Real} ref A reference handle.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the object has been deleted or the delete failed.
 * @member {Enum.FirebaseStorageError} error_code `FirebaseStorageError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_storage_ref_get_download_url
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageReference::GetDownloadUrl](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-reference#getdownloadurl)
 *
 * This function fetches a public `https://` URL for the object, carrying a token that lets anyone
 * holding the URL download it without signing in - the way to hand a file to a browser, a web view
 * or another player. The object must exist (`FirebaseStorageError.ObjectNotFound` otherwise) and the caller
 * needs read access under the security rules. The token can be revoked from the file's details in
 * the console, after which the URL stops working.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when the
 * reference is not valid.
 *
 * [[Warning: On Windows, macOS and Linux the SDK keeps reading the reference an operation was started on
 * until that operation has completed, so keep the reference handle until the callback has fired -
 * releasing it earlier is a use of freed memory on those platforms. Android and iOS only hold the
 * operation itself, but releasing after the callback is correct everywhere.]]
 *
 * @param {Real} ref A reference handle.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the URL.
 * @member {Enum.FirebaseStorageError} error_code `FirebaseStorageError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {String} url The download URL, or an empty string on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_storage_ref_get_metadata
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageReference::GetMetadata](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-reference#getmetadata)
 *
 * This function fetches the object's metadata - size, content type, timestamps, generation, the
 * custom key/value pairs - without downloading its content. The callback's handle is read with the
 * `firebase_storage_metadata_*` functions and released with
 * ${function.firebase_storage_metadata_release}. An object that does not exist fails with
 * `FirebaseStorageError.ObjectNotFound`.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when the
 * reference is not valid.
 *
 * [[Warning: On Windows, macOS and Linux the SDK keeps reading the reference an operation was started on
 * until that operation has completed, so keep the reference handle until the callback has fired -
 * releasing it earlier is a use of freed memory on those platforms. Android and iOS only hold the
 * operation itself, but releasing after the callback is correct everywhere.]]
 *
 * @param {Real} ref A reference handle.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the object's metadata.
 * @member {Enum.FirebaseStorageError} error_code `FirebaseStorageError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} metadata A metadata handle describing the stored object, to release with ${function.firebase_storage_metadata_release}, or `0` on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_storage_ref_update_metadata
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageReference::UpdateMetadata](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-reference#updatemetadata)
 *
 * This function changes the attributes stored with an existing object: content type, cache
 * control, content disposition, encoding, language and the custom pairs. Create a metadata handle
 * with ${function.firebase_storage_metadata_create}, set what should change, and pass it;
 * attributes not set on it are left as they are. The callback's handle is the metadata as it now
 * stands on the server. The object's content, size and hash cannot be changed this way - upload
 * again for that.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when the
 * reference or the metadata handle is not valid.
 *
 * [[Warning: On Windows, macOS and Linux the SDK keeps reading the reference an operation was started on
 * until that operation has completed, so keep the reference handle until the callback has fired -
 * releasing it earlier is a use of freed memory on those platforms. Android and iOS only hold the
 * operation itself, but releasing after the callback is correct everywhere.]]
 *
 * @param {Real} ref A reference handle.
 * @param {Real} metadata_ref A metadata handle carrying the attributes to change.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with the object's updated metadata.
 * @member {Enum.FirebaseStorageError} error_code `FirebaseStorageError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} metadata A metadata handle describing the stored object, to release with ${function.firebase_storage_metadata_release}, or `0` on failure.
 * @event_end
 *
 * @example
 * ```gml
 * // Tag an uploaded replay with the score it came from
 * var _metadata = firebase_storage_metadata_create();
 * firebase_storage_metadata_set_custom_metadata(_metadata, "score", string(score));
 * firebase_storage_metadata_set_custom_metadata(_metadata, "version", GM_version);
 *
 * firebase_storage_ref_update_metadata(replay_ref, _metadata, function(_error, _message, _updated)
 * {
 *     if (_error == FirebaseStorageError.None)
 *     {
 *         show_debug_message($"Now at metadata generation {firebase_storage_metadata_metadata_generation(_updated)}");
 *         firebase_storage_metadata_release(_updated);
 *     }
 *     firebase_storage_ref_release(replay_ref);
 *     replay_ref = 0;
 * });
 * firebase_storage_metadata_release(_metadata);
 * ```
 * The above code sets two custom pairs on a metadata handle, sends them, and releases that handle
 * as soon as the call has returned; the handle the callback brings back is a different one, released
 * after it has been read.
 * @function_end
 */

/**
 * @function firebase_storage_ref_put_bytes
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageReference::PutBytes](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-reference#putbytes)
 *
 * This function uploads the whole content of a buffer to the location - `buffer_get_size` bytes
 * from its start, whatever its seek position - creating the object or replacing the one there, so
 * size the buffer to exactly the data to send. The bytes are copied before the function returns,
 * so the buffer can be deleted or resized straight away.
 *
 * Pass a metadata handle to store a content type and other attributes with the object; without
 * one the object has no content type, and a browser given its download URL will not know what it
 * is. The callback's `metadata` describes the object as stored - size, generation, the attributes
 * the server settled on - and is a handle to release. The `progress_callback` fires as bytes go up.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling either callback when the
 * reference or the metadata handle is not valid.
 *
 * [[Warning: On Windows, macOS and Linux the SDK keeps reading the reference an operation was started on
 * until that operation has completed, so keep the reference handle until the callback has fired -
 * releasing it earlier is a use of freed memory on those platforms. Android and iOS only hold the
 * operation itself, but releasing after the callback is correct everywhere.]]
 *
 * @param {Real} ref A reference handle.
 * @param {Buffer} data The buffer whose whole content is uploaded.
 * @param {Real} metadata_ref A metadata handle from ${function.firebase_storage_metadata_create} carrying the content type and other attributes to store with the object, or `0` for none.
 * @param {Function} [progress_callback] The function to call as the transfer progresses, or `undefined` for none.
 * @param {Real} controller_ref A controller handle from ${function.firebase_storage_controller_create} to attach to the transfer, or `0` for none.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback:progress_callback
 * @desc Fires as the transfer makes progress, and once more with `paused` set when a controller pauses it.
 * @member {Bool} paused `true` when this call reports a pause, `false` for a progress report.
 * @member {Real} bytes_transferred The number of bytes moved so far.
 * @member {Real} total_byte_count The size of the transfer in bytes, or `-1` while it is not yet known.
 * @event_end
 *
 * @event callback
 * @desc Fires once when the upload has completed or failed.
 * @member {Enum.FirebaseStorageError} error_code `FirebaseStorageError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} metadata A metadata handle describing the stored object, to release with ${function.firebase_storage_metadata_release}, or `0` on failure.
 * @event_end
 *
 * @example
 * ```gml
 * // Upload the current level as JSON
 * var _json = json_stringify(level_data);
 * upload_buffer = buffer_create(string_byte_length(_json), buffer_fixed, 1);
 * buffer_write(upload_buffer, buffer_text, _json);
 *
 * var _metadata = firebase_storage_metadata_create();
 * firebase_storage_metadata_set_content_type(_metadata, "application/json");
 *
 * level_ref = firebase_storage_ref_child(root_ref, $"levels/{level_id}.json");
 * var _result = firebase_storage_ref_put_bytes(level_ref, upload_buffer, _metadata, undefined, 0,
 *     function(_error, _message, _metadata)
 *     {
 *         if (_error == FirebaseStorageError.None)
 *         {
 *             show_debug_message($"Stored {firebase_storage_metadata_size_bytes(_metadata)} bytes");
 *             firebase_storage_metadata_release(_metadata);
 *         }
 *         else
 *         {
 *             show_debug_message($"Upload failed: {_message}");
 *         }
 *         buffer_delete(upload_buffer);
 *         firebase_storage_ref_release(level_ref);
 *         level_ref = 0;
 *     });
 * firebase_storage_metadata_release(_metadata);
 *
 * if (_result != FirebaseError.Ok)
 * {
 *     buffer_delete(upload_buffer);
 *     firebase_storage_ref_release(level_ref);
 *     level_ref = 0;
 * }
 * ```
 * The above code serialises a struct, writes it into a buffer sized to the text, uploads it with a
 * content type, and frees the buffer and the reference only once the callback has fired - or at
 * once when the call could not start. The metadata handle the game created is released as soon
 * as the call returns; the one the callback brings is a different handle.
 * @function_end
 */

/**
 * @function firebase_storage_ref_put_file
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageReference::PutFile](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-reference#putfile)
 *
 * This function uploads a file from the device to the location, creating the object or replacing
 * the one there. The SDK opens the file itself, not through GameMaker's file functions, so give it
 * a path the operating system can open: a file the game wrote under `game_save_id`, or on desktop
 * an included file in `working_directory`. On Android an included file lives inside the app
 * package, so write it out with `buffer_load` and `buffer_save` first. The file must stay in place
 * until the callback has fired.
 *
 * Pass a metadata handle to store a content type and other attributes with the object; the
 * callback's `metadata` describes the object as stored and is a handle to release. The
 * `progress_callback` fires as bytes go up.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling either callback when the
 * reference or the metadata handle is not valid.
 *
 * [[Warning: On Windows, macOS and Linux the SDK keeps reading the reference an operation was started on
 * until that operation has completed, so keep the reference handle until the callback has fired -
 * releasing it earlier is a use of freed memory on those platforms. Android and iOS only hold the
 * operation itself, but releasing after the callback is correct everywhere.]]
 *
 * @param {Real} ref A reference handle.
 * @param {String} local_path The path of the file to upload.
 * @param {Real} metadata_ref A metadata handle from ${function.firebase_storage_metadata_create} carrying the content type and other attributes to store with the object, or `0` for none.
 * @param {Function} [progress_callback] The function to call as the transfer progresses, or `undefined` for none.
 * @param {Real} controller_ref A controller handle from ${function.firebase_storage_controller_create} to attach to the transfer, or `0` for none.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback:progress_callback
 * @desc Fires as the transfer makes progress, and once more with `paused` set when a controller pauses it.
 * @member {Bool} paused `true` when this call reports a pause, `false` for a progress report.
 * @member {Real} bytes_transferred The number of bytes moved so far.
 * @member {Real} total_byte_count The size of the transfer in bytes, or `-1` while it is not yet known.
 * @event_end
 *
 * @event callback
 * @desc Fires once when the upload has completed or failed.
 * @member {Enum.FirebaseStorageError} error_code `FirebaseStorageError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} metadata A metadata handle describing the stored object, to release with ${function.firebase_storage_metadata_release}, or `0` on failure.
 * @event_end
 *
 * @example
 * ```gml
 * // Upload a screenshot with progress, keeping the reference until the callback
 * screenshot_save(game_save_id + "shot.png", 0, 0, room_width, room_height);
 * shot_ref = firebase_storage_get_reference_path(storage, $"players/{user_id}/shot.png");
 *
 * var _result = firebase_storage_ref_put_file(shot_ref, game_save_id + "shot.png", 0,
 *     function(_paused, _sent, _total)
 *     {
 *         if (_total > 0) upload_progress = _sent / _total;
 *     },
 *     0,
 *     function(_error, _message, _metadata)
 *     {
 *         if (_error == FirebaseStorageError.None)
 *         {
 *             firebase_storage_metadata_release(_metadata);
 *         }
 *         else
 *         {
 *             show_debug_message($"Upload failed ({_error}): {_message}");
 *         }
 *         firebase_storage_ref_release(shot_ref);
 *         shot_ref = 0;
 *     });
 *
 * if (_result != FirebaseError.Ok)
 * {
 *     firebase_storage_ref_release(shot_ref);
 *     shot_ref = 0;
 * }
 * ```
 * The above code saves a screenshot where the SDK can open it, uploads it with a progress
 * callback that drives a bar, and releases the reference in the completion callback - the only
 * safe moment on desktop. The callback's metadata handle is released as soon as it is not needed.
 * @function_end
 */

/**
 * @function firebase_storage_ref_get_bytes
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageReference::GetBytes](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-reference#getbytes)
 *
 * This function downloads the object into memory on the extension's side and hands the game a
 * download handle to copy it out of. `max_size` is the most it will accept, so set it for the
 * largest object expected or read the size from ${function.firebase_storage_ref_get_metadata}
 * first: an object larger than that fails with `FirebaseStorageError.DownloadSizeExceeded`. The
 * callback's `download_ref` and `size` are the handle and the byte count; create a buffer of that
 * size, ${function.firebase_storage_download_copy} the bytes into it, then
 * ${function.firebase_storage_download_release} the handle. On failure `download_ref` is `0`.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling either callback when the
 * reference is not valid, and `FirebaseError.InvalidArgument` when `max_size` is below 1. For an
 * object the game will load from disk anyway, ${function.firebase_storage_ref_get_file} avoids
 * holding it in memory twice.
 *
 * [[Warning: On Windows, macOS and Linux the SDK keeps reading the reference an operation was started on
 * until that operation has completed, so keep the reference handle until the callback has fired -
 * releasing it earlier is a use of freed memory on those platforms. Android and iOS only hold the
 * operation itself, but releasing after the callback is correct everywhere.]]
 *
 * @param {Real} ref A reference handle.
 * @param {Real} max_size The largest object to accept, in bytes; the download is held in memory of this size.
 * @param {Function} [progress_callback] The function to call as the transfer progresses, or `undefined` for none.
 * @param {Real} controller_ref A controller handle from ${function.firebase_storage_controller_create} to attach to the transfer, or `0` for none.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback:progress_callback
 * @desc Fires as the transfer makes progress, and once more with `paused` set when a controller pauses it.
 * @member {Bool} paused `true` when this call reports a pause, `false` for a progress report.
 * @member {Real} bytes_transferred The number of bytes moved so far.
 * @member {Real} total_byte_count The size of the transfer in bytes, or `-1` while it is not yet known.
 * @event_end
 *
 * @event callback
 * @desc Fires once when the download has completed or failed.
 * @member {Enum.FirebaseStorageError} error_code `FirebaseStorageError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} download_ref A download handle holding the bytes, to copy from with ${function.firebase_storage_download_copy} and release with ${function.firebase_storage_download_release}; `0` on failure.
 * @member {Real} size The number of bytes downloaded, or `0` on failure.
 * @event_end
 *
 * @example
 * ```gml
 * // Download a JSON level into memory
 * level_ref = firebase_storage_get_reference_path(storage, $"levels/{level_id}.json");
 *
 * var _result = firebase_storage_ref_get_bytes(level_ref, 1 << 20, undefined, 0, // up to 1 MiB
 *     function(_error, _message, _download, _size)
 *     {
 *         if (_error == FirebaseStorageError.None)
 *         {
 *             var _buffer = buffer_create(_size, buffer_fixed, 1);
 *             firebase_storage_download_copy(_download, _buffer);
 *             firebase_storage_download_release(_download);
 *             level_data = json_parse(buffer_read(_buffer, buffer_text));
 *             buffer_delete(_buffer);
 *         }
 *         else
 *         {
 *             show_debug_message($"Download failed ({_error}): {_message}");
 *         }
 *         firebase_storage_ref_release(level_ref);
 *         level_ref = 0;
 *     });
 *
 * if (_result != FirebaseError.Ok)
 * {
 *     firebase_storage_ref_release(level_ref);
 *     level_ref = 0;
 * }
 * ```
 * The above code accepts a level of up to 1 MiB, copies the bytes into a buffer sized exactly to
 * what arrived, releases the download handle, and parses the text.
 * @function_end
 */

/**
 * @function firebase_storage_download_copy
 * @desc This function copies the bytes a download handle holds into the start of a GameMaker
 * buffer, up to the buffer's size, and returns how many were copied. The callback of
 * ${function.firebase_storage_ref_get_bytes} gives the handle and the size to create the buffer
 * with; the handle keeps the bytes until ${function.firebase_storage_download_release} frees it,
 * so it can be copied from more than once.
 *
 * @param {Real} download_ref A download handle from a ${function.firebase_storage_ref_get_bytes} callback.
 * @param {Buffer} out_buffer The buffer to write into.
 * @returns {Real} The number of bytes copied, or `0` with ${function.firebase_last_error_code} set to `FirebaseError.InvalidHandle` when the handle is not a live download.
 * @function_end
 */

/**
 * @function firebase_storage_download_release
 * @desc This function frees the bytes a download handle holds. Call it once the bytes have been
 * copied out; the memory stays allocated until then. A handle that is not a download sets
 * ${function.firebase_last_error_code} to `FirebaseError.InvalidHandle`.
 *
 * @param {Real} download_ref The handle to release.
 * @function_end
 */

/**
 * @function firebase_storage_ref_get_file
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageReference::GetFile](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-reference#getfile)
 *
 * This function downloads the object to a file on the device, creating or replacing it; the
 * directory must already exist, and the path must be one the operating system can write to, such as
 * one under `game_save_id`. The callback's `bytes_read` is the size written. Load the file with the
 * usual functions once the callback has fired - `sprite_add`, `buffer_load`, `audio_create_stream`.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling either callback when the
 * reference is not valid.
 *
 * [[Warning: On Windows, macOS and Linux the SDK keeps reading the reference an operation was started on
 * until that operation has completed, so keep the reference handle until the callback has fired -
 * releasing it earlier is a use of freed memory on those platforms. Android and iOS only hold the
 * operation itself, but releasing after the callback is correct everywhere.]]
 *
 * @param {Real} ref A reference handle.
 * @param {String} local_path The path of the file to write.
 * @param {Function} [progress_callback] The function to call as the transfer progresses, or `undefined` for none.
 * @param {Real} controller_ref A controller handle from ${function.firebase_storage_controller_create} to attach to the transfer, or `0` for none.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback:progress_callback
 * @desc Fires as the transfer makes progress, and once more with `paused` set when a controller pauses it.
 * @member {Bool} paused `true` when this call reports a pause, `false` for a progress report.
 * @member {Real} bytes_transferred The number of bytes moved so far.
 * @member {Real} total_byte_count The size of the transfer in bytes, or `-1` while it is not yet known.
 * @event_end
 *
 * @event callback
 * @desc Fires once when the download has completed or failed.
 * @member {Enum.FirebaseStorageError} error_code `FirebaseStorageError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} bytes_read The number of bytes written to the file, or `0` on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_storage_ref_list
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageReference::List](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-reference#list)
 *
 * This function lists what is directly under a location, one page at a time: the objects as items
 * and the sub-folders as prefixes, each reachable as a reference. `max_results` is the page size,
 * from 1 to 1000; `page_token` is an empty string for the first page and the previous result's
 * ${function.firebase_storage_list_result_next_page_token} for the one after it. The callback's
 * `list_result` is a handle to release, and every reference taken out of it with
 * ${function.firebase_storage_list_result_item_at} or ${function.firebase_storage_list_result_prefix_at}
 * is a handle of its own. A location with nothing under it is not an error: the result has no
 * items and no prefixes.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when the
 * reference is not valid.
 *
 * [[Note: Listing needs security rules written for rules version 2 - the `rules_version = '2';`
 * line at the top of the rules file - and read access to the location.]]
 *
 * [[Warning: On Windows, macOS and Linux the SDK keeps reading the reference an operation was started on
 * until that operation has completed, so keep the reference handle until the callback has fired -
 * releasing it earlier is a use of freed memory on those platforms. Android and iOS only hold the
 * operation itself, but releasing after the callback is correct everywhere.]]
 *
 * @param {Real} ref A reference handle.
 * @param {Real} max_results The most entries to return in this page, 1 to 1000.
 * @param {String} page_token An empty string for the first page, or the token from the previous page's result.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once with a page of results.
 * @member {Enum.FirebaseStorageError} error_code `FirebaseStorageError.None` on success, otherwise the reason it failed.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Real} list_result A list result handle to release with ${function.firebase_storage_list_result_release}, or `0` on failure.
 * @event_end
 *
 * @example
 * ```gml
 * // Collect the names of every replay, one page at a time
 * list_replays = function(_page_token)
 * {
 *     var _result = firebase_storage_ref_list(replays_ref, 100, _page_token,
 *         function(_error, _message, _list)
 *         {
 *             if (_error != FirebaseStorageError.None)
 *             {
 *                 show_debug_message($"List failed ({_error}): {_message}");
 *                 firebase_storage_ref_release(replays_ref);
 *                 exit;
 *             }
 *             var _count = firebase_storage_list_result_item_count(_list);
 *             for (var _i = 0; _i < _count; _i++)
 *             {
 *                 var _item = firebase_storage_list_result_item_at(_list, _i);
 *                 array_push(replay_names, firebase_storage_ref_name(_item));
 *                 firebase_storage_ref_release(_item);
 *             }
 *             var _next = firebase_storage_list_result_next_page_token(_list);
 *             firebase_storage_list_result_release(_list);
 *             if (_next != "")
 *             {
 *                 list_replays(_next);
 *             }
 *             else
 *             {
 *                 firebase_storage_ref_release(replays_ref);
 *             }
 *         });
 *     if (_result != FirebaseError.Ok) firebase_storage_ref_release(replays_ref);
 * }
 *
 * replay_names = [];
 * replays_ref = firebase_storage_get_reference_path(storage, $"players/{user_id}/replays");
 * list_replays("");
 * ```
 * The above code walks the pages of a folder listing by feeding each result's token back into the
 * next call, keeping only the names and releasing each item reference and each result as it goes.
 * The folder reference is released when the last page has been read, or on the first failure.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_create
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::Metadata](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#metadata)
 *
 * This function creates an empty metadata handle to fill with the `set_*` functions and pass to
 * ${function.firebase_storage_ref_put_bytes}, ${function.firebase_storage_ref_put_file} or
 * ${function.firebase_storage_ref_update_metadata}. It carries only what is set on it; the
 * read-only attributes - size, timestamps, generation, hash, bucket and path - are filled on the
 * handles that callbacks return. Release it with ${function.firebase_storage_metadata_release}
 * once the call that consumed it has returned; the SDK copies it.
 *
 * @returns {Real} A metadata handle to release with ${function.firebase_storage_metadata_release}.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_release
 * @desc This function releases a metadata handle - one from ${function.firebase_storage_metadata_create}
 * or one a callback returned. A handle that is not a metadata handle sets
 * ${function.firebase_last_error_code} to `FirebaseError.InvalidHandle`.
 *
 * @param {Real} ref The handle to release.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_is_valid
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::is_valid](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#is_valid)
 *
 * This function returns whether the handle refers to usable metadata - `false` for a released handle.
 *
 * @param {Real} ref A metadata handle.
 * @returns {Bool} `true` when the metadata can be read, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_bucket
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::bucket](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#bucket)
 *
 * This function returns the name of the bucket holding the object the metadata describes; an
 * empty string on a handle the game created.
 *
 * @param {Real} ref A metadata handle.
 * @returns {String} The bucket name, or an empty string.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_cache_control
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::cache_control](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#cache_control)
 *
 * This function returns the cache control: the `Cache-Control` header sent with the object when it is fetched by download URL, `"public, max-age=3600"` for content that may be cached for an hour. It is an empty string when the attribute is not set.
 *
 * @param {Real} ref A metadata handle.
 * @returns {String} The `Cache-Control` header value, or an empty string.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_set_cache_control
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::set_cache_control](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#set_cache_control)
 *
 * This function sets the cache control on a metadata handle: the `Cache-Control` header sent with the object when it is fetched by download URL, `"public, max-age=3600"` for content that may be cached for an hour. It takes effect on the server when
 * the handle is passed to an upload or to ${function.firebase_storage_ref_update_metadata}.
 *
 * @param {Real} ref A metadata handle.
 * @param {String} value The `Cache-Control` header value.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_content_disposition
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::content_disposition](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#content_disposition)
 *
 * This function returns the content disposition: the `Content-Disposition` header sent with the object, `"attachment; filename=save.dat"` to have a browser save the download under that name rather than display it. It is an empty string when the attribute is not set.
 *
 * @param {Real} ref A metadata handle.
 * @returns {String} The `Content-Disposition` header value, or an empty string.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_set_content_disposition
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::set_content_disposition](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#set_content_disposition)
 *
 * This function sets the content disposition on a metadata handle: the `Content-Disposition` header sent with the object, `"attachment; filename=save.dat"` to have a browser save the download under that name rather than display it. It takes effect on the server when
 * the handle is passed to an upload or to ${function.firebase_storage_ref_update_metadata}.
 *
 * @param {Real} ref A metadata handle.
 * @param {String} value The `Content-Disposition` header value.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_content_encoding
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::content_encoding](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#content_encoding)
 *
 * This function returns the content encoding: the `Content-Encoding` header sent with the object, `"gzip"` for content that was stored compressed. It is an empty string when the attribute is not set.
 *
 * @param {Real} ref A metadata handle.
 * @returns {String} The `Content-Encoding` header value, or an empty string.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_set_content_encoding
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::set_content_encoding](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#set_content_encoding)
 *
 * This function sets the content encoding on a metadata handle: the `Content-Encoding` header sent with the object, `"gzip"` for content that was stored compressed. It takes effect on the server when
 * the handle is passed to an upload or to ${function.firebase_storage_ref_update_metadata}.
 *
 * @param {Real} ref A metadata handle.
 * @param {String} value The `Content-Encoding` header value.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_content_language
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::content_language](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#content_language)
 *
 * This function returns the content language: the object's language as an ISO 639-1 two-letter code, `"en"` or `"pt"`. It is an empty string when the attribute is not set.
 *
 * @param {Real} ref A metadata handle.
 * @returns {String} The two-letter language code, or an empty string.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_set_content_language
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::set_content_language](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#set_content_language)
 *
 * This function sets the content language on a metadata handle: the object's language as an ISO 639-1 two-letter code, `"en"` or `"pt"`. It takes effect on the server when
 * the handle is passed to an upload or to ${function.firebase_storage_ref_update_metadata}.
 *
 * @param {Real} ref A metadata handle.
 * @param {String} value The two-letter language code.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_content_type
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::content_type](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#content_type)
 *
 * This function returns the content type: the object's MIME type - `"image/png"`, `"application/json"` - which decides how a browser treats the download URL and is the attribute most worth setting on every upload. It is an empty string when the attribute is not set.
 *
 * @param {Real} ref A metadata handle.
 * @returns {String} The MIME type, or an empty string.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_set_content_type
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::set_content_type](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#set_content_type)
 *
 * This function sets the content type on a metadata handle: the object's MIME type - `"image/png"`, `"application/json"` - which decides how a browser treats the download URL and is the attribute most worth setting on every upload. It takes effect on the server when
 * the handle is passed to an upload or to ${function.firebase_storage_ref_update_metadata}.
 *
 * @param {Real} ref A metadata handle.
 * @param {String} value The MIME type.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_creation_time
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::creation_time](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#creation_time)
 *
 * This function returns when the object was created, in milliseconds since the Unix epoch. It is `0`
 * on a handle the game created.
 *
 * @param {Real} ref A metadata handle.
 * @returns {Real} The time in milliseconds since the Unix epoch, or `0`.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_generation
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::generation](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#generation)
 *
 * This function returns the object's generation, a number the server assigns to each version of
 * its content: it changes whenever the object is uploaded again, so two metadata handles with the
 * same generation describe the same bytes. It is `0` on a handle the game created.
 *
 * @param {Real} ref A metadata handle.
 * @returns {Real} The content generation, or `0`.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_metadata_generation
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::metadata_generation](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#metadata_generation)
 *
 * This function returns the metadata generation, a counter that goes up on every
 * ${function.firebase_storage_ref_update_metadata} of the object and starts over with each new
 * content generation. It is `0` on a handle the game created.
 *
 * @param {Real} ref A metadata handle.
 * @returns {Real} The metadata generation, or `0`.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_name
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::name](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#name)
 *
 * This function returns the object's own name, the last segment of its path; an empty string on
 * a handle the game created.
 *
 * @param {Real} ref A metadata handle.
 * @returns {String} The object's name, or an empty string.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_path
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::path](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#path)
 *
 * This function returns the object's full path from the bucket root; an empty string on a handle
 * the game created.
 *
 * @param {Real} ref A metadata handle.
 * @returns {String} The object's path, or an empty string.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_get_reference
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::GetReference](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#getreference)
 *
 * This function returns a reference to the object the metadata describes - on a handle the game
 * created, one whose ${function.firebase_storage_ref_is_valid} is `false`. Release it with
 * ${function.firebase_storage_ref_release}.
 *
 * @param {Real} ref A metadata handle.
 * @returns {Real} A reference handle to release with ${function.firebase_storage_ref_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_size_bytes
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::size_bytes](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#size_bytes)
 *
 * This function returns the object's size in bytes - what a buffer for
 * ${function.firebase_storage_ref_get_bytes} has to hold. It is `0` on a handle the game
 * created.
 *
 * @param {Real} ref A metadata handle.
 * @returns {Real} The size in bytes, or `0`.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_updated_time
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::updated_time](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#updated_time)
 *
 * This function returns when the object was last changed - by an upload or a metadata update, in milliseconds since the Unix epoch. It is `0`
 * on a handle the game created.
 *
 * @param {Real} ref A metadata handle.
 * @returns {Real} The time in milliseconds since the Unix epoch, or `0`.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_custom_metadata_count
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::custom_metadata](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#custom_metadata)
 *
 * This function returns how many custom key/value pairs the metadata carries. Custom pairs are
 * strings the game attaches to an object - a score, a version, an owner - shown in the console's
 * file details and readable by security rules as `resource.metadata`. Walk them with
 * ${function.firebase_storage_metadata_custom_metadata_key_at} and
 * ${function.firebase_storage_metadata_get_custom_metadata}.
 *
 * @param {Real} ref A metadata handle.
 * @returns {Real} The number of custom pairs, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_custom_metadata_key_at
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::custom_metadata](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#custom_metadata)
 *
 * This function returns the key of one custom pair by position; the pairs come in key order.
 *
 * @param {Real} ref A metadata handle.
 * @param {Real} index The pair's position, from `0`.
 * @returns {String} The key, or an empty string when the position is out of range or the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_get_custom_metadata
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::custom_metadata](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#custom_metadata)
 *
 * This function returns the value stored under a custom key.
 *
 * @param {Real} ref A metadata handle.
 * @param {String} key The custom key.
 * @returns {String} The value, or an empty string when the key is not present or the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_set_custom_metadata
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::custom_metadata](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#custom_metadata)
 *
 * This function stores a value under a custom key on a metadata handle, replacing any value the
 * key had. It takes effect on the server when the handle is passed to an upload or to
 * ${function.firebase_storage_ref_update_metadata}.
 *
 * @param {Real} ref A metadata handle.
 * @param {String} key The custom key.
 * @param {String} value The value to store, a string.
 * @function_end
 */

/**
 * @function firebase_storage_controller_create
 * @desc **Firebase C++ SDK:** [firebase::storage::Controller::Controller](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/controller#controller)
 *
 * This function creates a controller handle to pass into ${function.firebase_storage_ref_put_bytes},
 * ${function.firebase_storage_ref_put_file}, ${function.firebase_storage_ref_get_bytes} or
 * ${function.firebase_storage_ref_get_file}, to pause, resume or cancel that transfer and to read
 * its progress while it runs. A new controller is attached to nothing - its
 * ${function.firebase_storage_controller_is_valid} is `false` until a transfer has been started with
 * it - and one controller drives one transfer at a time. Release it with
 * ${function.firebase_storage_controller_release} once the transfer's callback has fired.
 *
 * @returns {Real} A controller handle to release with ${function.firebase_storage_controller_release}.
 *
 * @example
 * ```gml
 * // Create Event: start a download the player can cancel
 * controller = firebase_storage_controller_create();
 * pack_ref = firebase_storage_get_reference_path(storage, "packs/winter.zip");
 * var _result = firebase_storage_ref_get_file(pack_ref, game_save_id + "winter.zip", undefined, controller,
 *     function(_error, _message, _bytes_read)
 *     {
 *         if (_error == FirebaseStorageError.Cancelled) show_debug_message("Cancelled by the player");
 *         firebase_storage_controller_release(controller);
 *         firebase_storage_ref_release(pack_ref);
 *         instance_destroy();
 *     });
 * if (_result != FirebaseError.Ok)
 * {
 *     firebase_storage_controller_release(controller);
 *     firebase_storage_ref_release(pack_ref);
 *     instance_destroy();
 * }
 *
 * // Step Event: a progress bar and a cancel key
 * if (firebase_storage_controller_is_valid(controller))
 * {
 *     var _total = firebase_storage_controller_total_byte_count(controller);
 *     if (_total > 0) progress = firebase_storage_controller_bytes_transferred(controller) / _total;
 *     if (keyboard_check_pressed(vk_escape)) firebase_storage_controller_cancel(controller);
 * }
 * ```
 * The above code attaches a controller to a download, polls it every step for the progress bar
 * instead of using a progress callback, and cancels it on a key press; the completion callback then
 * fires with `FirebaseStorageError.Cancelled` and frees everything.
 * @function_end
 */

/**
 * @function firebase_storage_controller_release
 * @desc This function releases a controller handle. Release it after the transfer it was attached to
 * has completed; a transfer keeps running when its controller is released, it just cannot be
 * driven any more. A handle that is not a controller sets
 * ${function.firebase_last_error_code} to `FirebaseError.InvalidHandle`.
 *
 * @param {Real} ref The handle to release.
 * @function_end
 */

/**
 * @function firebase_storage_controller_is_valid
 * @desc **Firebase C++ SDK:** [firebase::storage::Controller::is_valid](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/controller#is_valid)
 *
 * This function returns whether the controller is attached to a transfer - `false` for a new
 * controller that has not been passed to one yet, and for a released handle.
 *
 * @param {Real} ref A controller handle.
 * @returns {Bool} `true` when the controller drives a transfer, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_storage_controller_pause
 * @desc **Firebase C++ SDK:** [firebase::storage::Controller::Pause](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/controller#pause)
 *
 * This function pauses the transfer the controller is attached to. The transfer's
 * `progress_callback`, when there is one, fires with `paused` set; ${function.firebase_storage_controller_resume}
 * continues from where it stopped.
 *
 * @param {Real} ref A controller handle.
 * @returns {Bool} `true` when the transfer was paused, `false` when it could not be - not running, already paused, or the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_controller_resume
 * @desc **Firebase C++ SDK:** [firebase::storage::Controller::Resume](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/controller#resume)
 *
 * This function resumes a transfer paused with ${function.firebase_storage_controller_pause}.
 *
 * @param {Real} ref A controller handle.
 * @returns {Bool} `true` when the transfer was resumed, `false` when it could not be - not paused, or the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_controller_cancel
 * @desc **Firebase C++ SDK:** [firebase::storage::Controller::Cancel](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/controller#cancel)
 *
 * This function cancels the transfer the controller is attached to. Its completion callback fires
 * with `FirebaseStorageError.Cancelled`; a cancelled upload leaves no object, and a cancelled download
 * leaves the buffer or file partly written.
 *
 * @param {Real} ref A controller handle.
 * @returns {Bool} `true` when the transfer was cancelled, `false` when it could not be - already finished, or the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_controller_is_paused
 * @desc **Firebase C++ SDK:** [firebase::storage::Controller::is_paused](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/controller#is_paused)
 *
 * This function returns whether the transfer is currently paused.
 *
 * @param {Real} ref A controller handle.
 * @returns {Bool} `true` while the transfer is paused, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_storage_controller_bytes_transferred
 * @desc **Firebase C++ SDK:** [firebase::storage::Controller::bytes_transferred](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/controller#bytes_transferred)
 *
 * This function returns how many bytes the transfer has moved so far - a way to poll progress
 * from a Step event instead of taking a `progress_callback`.
 *
 * @param {Real} ref A controller handle.
 * @returns {Real} The bytes transferred, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_controller_total_byte_count
 * @desc **Firebase C++ SDK:** [firebase::storage::Controller::total_byte_count](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/controller#total_byte_count)
 *
 * This function returns the size of the transfer in bytes, or `-1` while the SDK does not know it
 * yet - a download's size arrives with the first response.
 *
 * @param {Real} ref A controller handle.
 * @returns {Real} The total bytes, `-1` while unknown, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_controller_get_reference
 * @desc **Firebase C++ SDK:** [firebase::storage::Controller::GetReference](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/controller#getreference)
 *
 * This function returns a reference to the object the transfer works on - on a controller not yet
 * attached to one, a reference whose ${function.firebase_storage_ref_is_valid} is `false`. Release it
 * with ${function.firebase_storage_ref_release}.
 *
 * @param {Real} ref A controller handle.
 * @returns {Real} A reference handle to release with ${function.firebase_storage_ref_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_list_result_release
 * @desc This function releases a list result handle from ${function.firebase_storage_ref_list}. The
 * references already taken out of it are unaffected; each is released on its own. A handle that is not a list result sets
 * ${function.firebase_last_error_code} to `FirebaseError.InvalidHandle`.
 *
 * @param {Real} ref The handle to release.
 * @function_end
 */

/**
 * @function firebase_storage_list_result_is_valid
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageListResult::is_valid](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-list-result#is_valid)
 *
 * This function returns whether the handle refers to a usable list result - `false` for a released
 * handle.
 *
 * @param {Real} ref A list result handle.
 * @returns {Bool} `true` when the result can be read, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_storage_list_result_item_count
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageListResult::items](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-list-result#items)
 *
 * This function returns how many objects the page holds.
 *
 * @param {Real} ref A list result handle.
 * @returns {Real} The number of items, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_list_result_item_at
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageListResult::items](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-list-result#items)
 *
 * This function returns a reference to one of the objects in the page, by position. Release it with
 * ${function.firebase_storage_ref_release}.
 *
 * @param {Real} ref A list result handle.
 * @param {Real} index The item's position, from `0`.
 * @returns {Real} A reference handle to release with ${function.firebase_storage_ref_release}, or `0` when the position is out of range or the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_list_result_prefix_count
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageListResult::prefixes](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-list-result#prefixes)
 *
 * This function returns how many sub-folders the page holds.
 *
 * @param {Real} ref A list result handle.
 * @returns {Real} The number of prefixes, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_list_result_prefix_at
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageListResult::prefixes](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-list-result#prefixes)
 *
 * This function returns a reference to one of the sub-folders in the page, by position, ready to
 * be listed in turn. Release it with ${function.firebase_storage_ref_release}.
 *
 * @param {Real} ref A list result handle.
 * @param {Real} index The prefix's position, from `0`.
 * @returns {Real} A reference handle to release with ${function.firebase_storage_ref_release}, or `0` when the position is out of range or the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_list_result_next_page_token
 * @desc **Firebase C++ SDK:** [firebase::storage::StorageListResult::next_page_token](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage-list-result#next_page_token)
 *
 * This function returns the token that fetches the page after this one through
 * ${function.firebase_storage_ref_list}, or an empty string when this was the last page.
 *
 * @param {Real} ref A list result handle.
 * @returns {String} The next page's token, or an empty string on the last page or when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_metadata_md5_hash
 * @desc **Firebase C++ SDK:** [firebase::storage::Metadata::md5_hash](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/metadata#md5_hash)
 *
 * This function returns the MD5 hash of the object's content, Base64-encoded as the server
 * reports it: a way to tell whether a local copy is still the same file without downloading it.
 * It is an empty string on a handle the game created.
 *
 * @param {Real} metadata A metadata handle.
 * @returns {String} The Base64 MD5 hash, or an empty string.
 * @function_end
 */

/**
 * @function firebase_storage_get_app
 * @desc **Firebase C++ SDK:** [firebase::storage::Storage::app](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage#app)
 *
 * This function returns a handle to the Firebase App a storage instance belongs to. Release it
 * with ${function.firebase_app_release_handle}.
 *
 * @param {Real} storage The storage handle from ${function.firebase_storage_get_instance}.
 * @returns {Real} An app handle, or `0` when the storage handle is not valid.
 * @function_end
 */

/**
 * @function firebase_storage_get_instance_for_app
 * @desc **Firebase C++ SDK:** [firebase::storage::Storage::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage#getinstance)
 *
 * This function returns a handle to Cloud Storage for another Firebase App, created with
 * ${function.firebase_app_initialize_with_options} or ${function.firebase_app_initialize_from_json},
 * and that app's default bucket. It returns `0` with ${function.firebase_last_error_code} set when
 * the app handle is not valid or the instance could not be created.
 *
 * @param {Real} app An app handle.
 * @returns {Real} The storage handle, or `0` on failure.
 * @function_end
 */

/**
 * @function firebase_storage_get_instance_for_app_url
 * @desc **Firebase C++ SDK:** [firebase::storage::Storage::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/storage/storage#getinstance_1)
 *
 * This function is ${function.firebase_storage_get_instance_for_app} for a bucket of that app
 * named by its `gs://` URL.
 *
 * @param {Real} app An app handle.
 * @param {String} url The bucket's URL.
 * @returns {Real} The storage handle, or `0` on failure.
 * @function_end
 */

/**
 * @const FirebaseStorageError
 * @desc **Firebase C++ SDK:** [firebase::storage::Error](https://firebase.google.com/docs/reference/cpp/namespace/firebase/storage#error)
 *
 * The `error_code` every Cloud Storage callback receives, mirroring the SDK's codes value for
 * value. `None` is success. The ones a game meets: `ObjectNotFound` (a download, metadata fetch or
 * delete of an object that does not exist), `Unauthenticated` and `Unauthorized` (the security
 * rules refused the caller), `RetryLimitExceeded` (the network stayed down past the retry time)
 * and `Cancelled` (the game's own controller stopped the transfer).
 *
 * @member None Success.
 * @member Unknown An error the SDK could not classify.
 * @member ObjectNotFound Nothing exists at the reference.
 * @member BucketNotFound The project has no bucket, or the instance's URL names one that does not exist.
 * @member ProjectNotFound No project is configured for Cloud Storage.
 * @member QuotaExceeded The bucket's quota is used up.
 * @member Unauthenticated The rules require a signed-in user and there is none.
 * @member Unauthorized The rules refuse this user this operation.
 * @member RetryLimitExceeded The retry time ran out - the maximum time limit on the operation was exceeded.
 * @member NonMatchingChecksum The server received something other than what was sent.
 * @member DownloadSizeExceeded The object is larger than the buffer given to ${function.firebase_storage_ref_get_bytes}.
 * @member Cancelled ${function.firebase_storage_controller_cancel} stopped the transfer.
 * @const_end
 */

/**
 * @module storage
 * @title Cloud Storage
 * @desc This module covers Cloud Storage for Firebase: object storage for the files a game makes or
 * needs after it has shipped - screenshots, replays, avatars, level packs, saves - kept in a
 * bucket, addressed by path, uploaded from a buffer or a file and downloaded the same way, with
 * metadata on each object, listing by folder, shareable download URLs, and security rules that
 * decide who may read and write what. Everything starts from the storage handle of
 * ${function.firebase_storage_get_instance}.
 *
 * ### Handles
 *
 * A reference, a metadata record, a controller and a list result each reach GML as a numeric
 * handle with its own `*_release` function; the storage instance handle has none and lives as
 * long as the game. Every call that returns one of the four mints a new handle, including each
 * callback's `metadata` or `list_result` and each reference taken from a list result, so each is
 * released once. A metadata or controller handle can be released as soon as the call that
 * consumed it has returned, because the SDK copies it - a released controller no longer drives its
 * transfer, but the transfer goes on.
 *
 * A reference is different. On Windows, macOS and Linux the SDK keeps reading the reference an
 * operation was started on until that operation has completed, so a reference must outlive every
 * operation started on it: release it in the callback, or after all the callbacks when several
 * operations share it. Android and iOS do not read it after the call returns, but the same order
 * is correct there too, and the demo objects keep it.
 *
 * ### Transfers
 *
 * Uploads take the data as a GML buffer (${function.firebase_storage_ref_put_bytes}, used whole
 * and copied before the call returns) or a file on the device
 * (${function.firebase_storage_ref_put_file}); downloads land in a file
 * (${function.firebase_storage_ref_get_file}) or in extension memory that the game copies into a
 * buffer of its own through a download handle (${function.firebase_storage_ref_get_bytes},
 * ${function.firebase_storage_download_copy}, ${function.firebase_storage_download_release}).
 * Each transfer takes an optional `progress_callback`, called as bytes move,
 * and an optional controller from ${function.firebase_storage_controller_create}, which can pause,
 * resume or cancel it and be polled for its progress. A failed transfer is retried on its own for
 * up to the instance's retry time - ten minutes by default for uploads and downloads, two for
 * everything else, set with the `firebase_storage_set_max_*_retry_time` functions - before its
 * callback fires with `RetryLimitExceeded`.
 *
 * ### Error codes
 *
 * Every operation returns ${constant.FirebaseError} at once and delivers its outcome to a
 * callback. The callback's `error_code` is a ${constant.FirebaseStorageError}, Cloud Storage's own
 * code set: `None` on success, otherwise the member that names the failure.
 *
 * ### Console setup
 *
 * Create the bucket under **Build > Storage** in the Firebase console and write security rules for
 * it: the starting rules require a signed-in user for every read and write, so a game that has not
 * signed the player in - anonymously is enough, see ${module.auth} - gets
 * `FirebaseStorageError.Unauthenticated` on its first request. Listing needs rules written for rules
 * version 2. At the time of
 * writing a new project has to be on the pay-as-you-go plan to create its bucket; the free tier
 * still applies within it. ${page.guides_cloud_storage} walks through it.
 *
 * @section_func Instance
 * @desc The storage instance, its references, retry times and emulator:
 * @ref firebase_storage_get_instance
 * @ref firebase_storage_get_instance_with_url
 * @ref firebase_storage_get_instance_for_app
 * @ref firebase_storage_get_instance_for_app_url
 * @ref firebase_storage_get_app
 * @ref firebase_storage_url
 * @ref firebase_storage_get_reference
 * @ref firebase_storage_get_reference_path
 * @ref firebase_storage_get_reference_from_url
 * @ref firebase_storage_max_download_retry_time
 * @ref firebase_storage_set_max_download_retry_time
 * @ref firebase_storage_max_upload_retry_time
 * @ref firebase_storage_set_max_upload_retry_time
 * @ref firebase_storage_max_operation_retry_time
 * @ref firebase_storage_set_max_operation_retry_time
 * @ref firebase_storage_use_emulator
 * @section_end
 *
 * @section_func References
 * @desc A reference names an object or folder in the bucket, whether or not it exists yet; it is
 * where every transfer, metadata call and listing starts:
 * @ref firebase_storage_ref_child
 * @ref firebase_storage_ref_get_parent
 * @ref firebase_storage_ref_bucket
 * @ref firebase_storage_ref_full_path
 * @ref firebase_storage_ref_name
 * @ref firebase_storage_ref_is_valid
 * @ref firebase_storage_ref_storage
 * @ref firebase_storage_ref_release
 * @section_end
 *
 * @section_func Uploading and downloading
 * @desc Moving an object's content up from, or down into, a buffer or a file; fetching a shareable URL
 * for it; deleting it:
 * @ref firebase_storage_ref_put_bytes
 * @ref firebase_storage_ref_put_file
 * @ref firebase_storage_ref_get_bytes
 * @ref firebase_storage_download_copy
 * @ref firebase_storage_download_release
 * @ref firebase_storage_ref_get_file
 * @ref firebase_storage_ref_get_download_url
 * @ref firebase_storage_ref_delete
 * @section_end
 *
 * @section_func Listing
 * @desc Reading what is under a location one page at a time, and taking the objects and sub-folders
 * out of a page:
 * @ref firebase_storage_ref_list
 * @ref firebase_storage_list_result_release
 * @ref firebase_storage_list_result_is_valid
 * @ref firebase_storage_list_result_item_count
 * @ref firebase_storage_list_result_item_at
 * @ref firebase_storage_list_result_prefix_count
 * @ref firebase_storage_list_result_prefix_at
 * @ref firebase_storage_list_result_next_page_token
 * @section_end
 *
 * @section_func Metadata
 * @desc What the server stores alongside an object's content: fetching and updating it, and reading
 * or setting each attribute on a metadata handle:
 * @ref firebase_storage_ref_get_metadata
 * @ref firebase_storage_ref_update_metadata
 * @ref firebase_storage_metadata_create
 * @ref firebase_storage_metadata_release
 * @ref firebase_storage_metadata_is_valid
 * @ref firebase_storage_metadata_bucket
 * @ref firebase_storage_metadata_name
 * @ref firebase_storage_metadata_path
 * @ref firebase_storage_metadata_get_reference
 * @ref firebase_storage_metadata_size_bytes
 * @ref firebase_storage_metadata_creation_time
 * @ref firebase_storage_metadata_updated_time
 * @ref firebase_storage_metadata_generation
 * @ref firebase_storage_metadata_metadata_generation
 * @ref firebase_storage_metadata_md5_hash
 * @ref firebase_storage_metadata_content_type
 * @ref firebase_storage_metadata_set_content_type
 * @ref firebase_storage_metadata_cache_control
 * @ref firebase_storage_metadata_set_cache_control
 * @ref firebase_storage_metadata_content_disposition
 * @ref firebase_storage_metadata_set_content_disposition
 * @ref firebase_storage_metadata_content_encoding
 * @ref firebase_storage_metadata_set_content_encoding
 * @ref firebase_storage_metadata_content_language
 * @ref firebase_storage_metadata_set_content_language
 * @ref firebase_storage_metadata_custom_metadata_count
 * @ref firebase_storage_metadata_custom_metadata_key_at
 * @ref firebase_storage_metadata_get_custom_metadata
 * @ref firebase_storage_metadata_set_custom_metadata
 * @section_end
 *
 * @section_func Controllers
 * @desc Pausing, resuming, cancelling and polling a transfer in flight:
 * @ref firebase_storage_controller_create
 * @ref firebase_storage_controller_release
 * @ref firebase_storage_controller_is_valid
 * @ref firebase_storage_controller_pause
 * @ref firebase_storage_controller_resume
 * @ref firebase_storage_controller_cancel
 * @ref firebase_storage_controller_is_paused
 * @ref firebase_storage_controller_bytes_transferred
 * @ref firebase_storage_controller_total_byte_count
 * @ref firebase_storage_controller_get_reference
 * @section_end
 *
 * @section_const Constants
 * @desc The following constants are used by this module:
 * @ref FirebaseStorageError
 * @section_end
 *
 * @module_end
 */
