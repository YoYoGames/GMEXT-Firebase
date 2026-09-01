// ##### extgen :: Auto-generated file do not edit!! #####

// #####################################################################
// # Macros
// #####################################################################

// #####################################################################
// # Enums
// #####################################################################

enum FirestoreError
{
    Ok = 0,
    Cancelled = 1,
    Unknown = 2,
    InvalidArgument = 3,
    DeadlineExceeded = 4,
    NotFound = 5,
    AlreadyExists = 6,
    PermissionDenied = 7,
    ResourceExhausted = 8,
    FailedPrecondition = 9,
    Aborted = 10,
    OutOfRange = 11,
    Unimplemented = 12,
    Internal = 13,
    Unavailable = 14,
    DataLoss = 15,
    Unauthenticated = 16
}

enum FirestoreSource
{
    Default = 0,
    Cache = 1,
    Server = 2
}

enum FirestoreDirection
{
    Ascending = 0,
    Descending = 1
}

enum FirestoreServerTimestampBehavior
{
    None = 0,
    Estimate = 1,
    Previous = 2
}

enum FirestoreDocumentChangeType
{
    Added = 0,
    Modified = 1,
    Removed = 2
}

// #####################################################################
// # Constructors
// #####################################################################

/**
 * @returns {Struct.FirestoreDocumentSnapshotInfo}
 */
function FirestoreDocumentSnapshotInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 1265412019;

    self.exists = undefined;
    self.id = undefined;
    self.reference = undefined;
    self.has_pending_writes = undefined;
    self.is_from_cache = undefined;

}

/**
 * @returns {Struct.FirestoreQuerySnapshotInfo}
 */
function FirestoreQuerySnapshotInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 1676591002;

    self.size = undefined;
    self.empty = undefined;
    self.has_pending_writes = undefined;
    self.is_from_cache = undefined;

}

// #####################################################################
// # Codecs
// #####################################################################

/**
 * @func __FirestoreDocumentSnapshotInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirestoreDocumentSnapshotInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirestoreDocumentSnapshotInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: exists, type: Bool
        if (!is_bool(self.exists)) show_error($"{_where} :: self.exists expected bool", true);
        buffer_write(_buffer, buffer_bool, self.exists);

        // field: id, type: String
        if (!is_string(self.id)) show_error($"{_where} :: self.id expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.id));
        buffer_write(_buffer, buffer_string, self.id);

        // field: reference, type: UInt64
        if (!is_numeric(self.reference)) show_error($"{_where} :: self.reference expected number", true);
        buffer_write(_buffer, buffer_u64, self.reference);

        // field: has_pending_writes, type: Bool
        if (!is_bool(self.has_pending_writes)) show_error($"{_where} :: self.has_pending_writes expected bool", true);
        buffer_write(_buffer, buffer_bool, self.has_pending_writes);

        // field: is_from_cache, type: Bool
        if (!is_bool(self.is_from_cache)) show_error($"{_where} :: self.is_from_cache expected bool", true);
        buffer_write(_buffer, buffer_bool, self.is_from_cache);

    }
}

/**
 * @func __FirestoreDocumentSnapshotInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirestoreDocumentSnapshotInfo}
 * @ignore
 */
function __FirestoreDocumentSnapshotInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirestoreDocumentSnapshotInfo();
    with (_inst)
    {
        // field: exists, type: Bool
        self.exists = buffer_read(_buffer, buffer_bool);

        // field: id, type: String
        buffer_read(_buffer, buffer_u32);
        self.id = buffer_read(_buffer, buffer_string);

        // field: reference, type: UInt64
        self.reference = buffer_read(_buffer, buffer_u64);

        // field: has_pending_writes, type: Bool
        self.has_pending_writes = buffer_read(_buffer, buffer_bool);

        // field: is_from_cache, type: Bool
        self.is_from_cache = buffer_read(_buffer, buffer_bool);

    }

    return _inst;
}

/**
 * @func __FirestoreQuerySnapshotInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirestoreQuerySnapshotInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirestoreQuerySnapshotInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: size, type: Float64
        if (!is_numeric(self.size)) show_error($"{_where} :: self.size expected number", true);
        buffer_write(_buffer, buffer_f64, self.size);

        // field: empty, type: Bool
        if (!is_bool(self.empty)) show_error($"{_where} :: self.empty expected bool", true);
        buffer_write(_buffer, buffer_bool, self.empty);

        // field: has_pending_writes, type: Bool
        if (!is_bool(self.has_pending_writes)) show_error($"{_where} :: self.has_pending_writes expected bool", true);
        buffer_write(_buffer, buffer_bool, self.has_pending_writes);

        // field: is_from_cache, type: Bool
        if (!is_bool(self.is_from_cache)) show_error($"{_where} :: self.is_from_cache expected bool", true);
        buffer_write(_buffer, buffer_bool, self.is_from_cache);

    }
}

/**
 * @func __FirestoreQuerySnapshotInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirestoreQuerySnapshotInfo}
 * @ignore
 */
function __FirestoreQuerySnapshotInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirestoreQuerySnapshotInfo();
    with (_inst)
    {
        // field: size, type: Float64
        self.size = buffer_read(_buffer, buffer_f64);

        // field: empty, type: Bool
        self.empty = buffer_read(_buffer, buffer_bool);

        // field: has_pending_writes, type: Bool
        self.has_pending_writes = buffer_read(_buffer, buffer_bool);

        // field: is_from_cache, type: Bool
        self.is_from_cache = buffer_read(_buffer, buffer_bool);

    }

    return _inst;
}

// #####################################################################
// # Functions
// #####################################################################

/**
 * @returns {Real}
 */
function firebase_firestore_get_instance()
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_get_instance(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _database_name
 * @returns {Real}
 */
function firebase_firestore_get_instance_for_database(_database_name)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_get_instance_for_database(_database_name, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _instance_ref
 * @returns {String}
 */
function firebase_firestore_settings_get_host(_instance_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    var __return_value__ = __firebase_firestore_settings_get_host(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @param {String} _host
 */
function firebase_firestore_settings_set_host(_instance_ref, _host)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _host, type: String
    if (!is_string(_host)) show_error($"{_GMFUNCTION_} :: _host expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_host));
    buffer_write(__args_buffer__, buffer_string, _host);

    var __return_value__ = __firebase_firestore_settings_set_host(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @returns {Bool}
 */
function firebase_firestore_settings_get_ssl_enabled(_instance_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    var __return_value__ = __firebase_firestore_settings_get_ssl_enabled(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @param {Bool} _enabled
 */
function firebase_firestore_settings_set_ssl_enabled(_instance_ref, _enabled)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _enabled, type: Bool
    if (!is_bool(_enabled)) show_error($"{_GMFUNCTION_} :: _enabled expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _enabled);

    var __return_value__ = __firebase_firestore_settings_set_ssl_enabled(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @returns {Bool}
 */
function firebase_firestore_settings_get_persistence_enabled(_instance_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    var __return_value__ = __firebase_firestore_settings_get_persistence_enabled(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @param {Bool} _enabled
 */
function firebase_firestore_settings_set_persistence_enabled(_instance_ref, _enabled)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _enabled, type: Bool
    if (!is_bool(_enabled)) show_error($"{_GMFUNCTION_} :: _enabled expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _enabled);

    var __return_value__ = __firebase_firestore_settings_set_persistence_enabled(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @returns {Real}
 */
function firebase_firestore_settings_get_cache_size_bytes(_instance_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    var __return_value__ = __firebase_firestore_settings_get_cache_size_bytes(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @param {Real} _bytes
 */
function firebase_firestore_settings_set_cache_size_bytes(_instance_ref, _bytes)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _bytes, type: Float64
    if (!is_numeric(_bytes)) show_error($"{_GMFUNCTION_} :: _bytes expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _bytes);

    var __return_value__ = __firebase_firestore_settings_set_cache_size_bytes(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_firestore_collection(_instance_ref, _path)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _path, type: String
    if (!is_string(_path)) show_error($"{_GMFUNCTION_} :: _path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_path));
    buffer_write(__args_buffer__, buffer_string, _path);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_collection(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _instance_ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_firestore_document(_instance_ref, _path)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _path, type: String
    if (!is_string(_path)) show_error($"{_GMFUNCTION_} :: _path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_path));
    buffer_write(__args_buffer__, buffer_string, _path);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _instance_ref
 * @param {String} _collection_id
 * @returns {Real}
 */
function firebase_firestore_collection_group(_instance_ref, _collection_id)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _collection_id, type: String
    if (!is_string(_collection_id)) show_error($"{_GMFUNCTION_} :: _collection_id expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_collection_id));
    buffer_write(__args_buffer__, buffer_string, _collection_id);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_collection_group(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _instance_ref
 * @returns {Real}
 */
function firebase_firestore_batch(_instance_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_batch(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

// Skipping function firebase_firestore_set_log_level (no wrapper is required)


/**
 * @param {Real} _instance_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_enable_network(_instance_ref, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_firestore_enable_network(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_disable_network(_instance_ref, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_firestore_disable_network(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_terminate(_instance_ref, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_firestore_terminate(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_clear_persistence(_instance_ref, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_firestore_clear_persistence(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_wait_for_pending_writes(_instance_ref, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_firestore_wait_for_pending_writes(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_run_transaction(_instance_ref, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_firestore_run_transaction(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_firestore_collection_ref_id(_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_collection_ref_id(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_firestore_collection_ref_path(_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_collection_ref_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_firestore_collection_ref_parent(_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_collection_ref_parent(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_firestore_collection_ref_document(_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_collection_ref_document(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_firestore_collection_ref_document_path(_ref, _path)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _path, type: String
    if (!is_string(_path)) show_error($"{_GMFUNCTION_} :: _path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_path));
    buffer_write(__args_buffer__, buffer_string, _path);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_collection_ref_document_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _data
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_collection_ref_add(_ref, _data, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_firestore_collection_ref_add(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_firestore_collection_ref_is_valid(_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_collection_ref_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 */
function firebase_firestore_collection_ref_release(_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_collection_ref_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_firestore_document_ref_id(_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_document_ref_id(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_firestore_document_ref_path(_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_document_ref_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_firestore_document_ref_parent(_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_ref_parent(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_firestore_document_ref_collection(_ref, _path)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _path, type: String
    if (!is_string(_path)) show_error($"{_GMFUNCTION_} :: _path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_path));
    buffer_write(__args_buffer__, buffer_string, _path);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_ref_collection(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _source
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_document_ref_get(_ref, _source, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _source, type: Float64
    if (!is_numeric(_source)) show_error($"{_GMFUNCTION_} :: _source expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _source);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_firestore_document_ref_get(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Any} _data
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_document_ref_set(_ref, _data, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_firestore_document_ref_set(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Any} _data
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_document_ref_set_merge(_ref, _data, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_firestore_document_ref_set_merge(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Any} _data
 * @param {Any} _fields
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_document_ref_set_merge_fields(_ref, _data, _fields, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    // param: _fields, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _fields);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_firestore_document_ref_set_merge_fields(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Any} _data
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_document_ref_update(_ref, _data, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_firestore_document_ref_update(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_document_ref_delete(_ref, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_firestore_document_ref_delete(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Bool} _include_metadata_changes
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_document_ref_add_snapshot_listener(_ref, _include_metadata_changes, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _include_metadata_changes, type: Bool
    if (!is_bool(_include_metadata_changes)) show_error($"{_GMFUNCTION_} :: _include_metadata_changes expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _include_metadata_changes);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_ref_add_snapshot_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_firestore_document_ref_is_valid(_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_document_ref_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 */
function firebase_firestore_document_ref_release(_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_document_ref_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_equal_to(_ref, _field, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_equal_to(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_not_equal_to(_ref, _field, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_not_equal_to(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_less_than(_ref, _field, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_less_than(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_less_than_or_equal_to(_ref, _field, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_less_than_or_equal_to(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_greater_than(_ref, _field, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_greater_than(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_greater_than_or_equal_to(_ref, _field, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_greater_than_or_equal_to(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_array_contains(_ref, _field, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_array_contains(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_query_where_array_contains_any(_ref, _field, _values)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_array_contains_any(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_query_where_in(_ref, _field, _values)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_in(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_query_where_not_in(_ref, _field, _values)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_not_in(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Real} _direction
 * @returns {Real}
 */
function firebase_firestore_query_order_by(_ref, _field, _direction)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _direction, type: Float64
    if (!is_numeric(_direction)) show_error($"{_GMFUNCTION_} :: _direction expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _direction);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_order_by(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _limit
 * @returns {Real}
 */
function firebase_firestore_query_limit(_ref, _limit)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _limit, type: Float64
    if (!is_numeric(_limit)) show_error($"{_GMFUNCTION_} :: _limit expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _limit);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_limit(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _limit
 * @returns {Real}
 */
function firebase_firestore_query_limit_to_last(_ref, _limit)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _limit, type: Float64
    if (!is_numeric(_limit)) show_error($"{_GMFUNCTION_} :: _limit expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _limit);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_limit_to_last(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _snapshot_ref
 * @returns {Real}
 */
function firebase_firestore_query_start_at_snapshot(_ref, _snapshot_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _snapshot_ref, type: UInt64
    if (!is_numeric(_snapshot_ref)) show_error($"{_GMFUNCTION_} :: _snapshot_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_start_at_snapshot(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_query_start_at_values(_ref, _values)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_start_at_values(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _snapshot_ref
 * @returns {Real}
 */
function firebase_firestore_query_start_after_snapshot(_ref, _snapshot_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _snapshot_ref, type: UInt64
    if (!is_numeric(_snapshot_ref)) show_error($"{_GMFUNCTION_} :: _snapshot_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_start_after_snapshot(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_query_start_after_values(_ref, _values)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_start_after_values(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _snapshot_ref
 * @returns {Real}
 */
function firebase_firestore_query_end_before_snapshot(_ref, _snapshot_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _snapshot_ref, type: UInt64
    if (!is_numeric(_snapshot_ref)) show_error($"{_GMFUNCTION_} :: _snapshot_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_end_before_snapshot(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_query_end_before_values(_ref, _values)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_end_before_values(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _snapshot_ref
 * @returns {Real}
 */
function firebase_firestore_query_end_at_snapshot(_ref, _snapshot_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _snapshot_ref, type: UInt64
    if (!is_numeric(_snapshot_ref)) show_error($"{_GMFUNCTION_} :: _snapshot_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_end_at_snapshot(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_query_end_at_values(_ref, _values)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_end_at_values(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _source
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_query_get(_ref, _source, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _source, type: Float64
    if (!is_numeric(_source)) show_error($"{_GMFUNCTION_} :: _source expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _source);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_firestore_query_get(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Bool} _include_metadata_changes
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_query_add_snapshot_listener(_ref, _include_metadata_changes, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _include_metadata_changes, type: Bool
    if (!is_bool(_include_metadata_changes)) show_error($"{_GMFUNCTION_} :: _include_metadata_changes expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _include_metadata_changes);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_add_snapshot_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_firestore_query_is_valid(_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_query_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 */
function firebase_firestore_query_release(_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_query_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _batch_ref
 * @param {Real} _document_ref
 * @param {Any} _data
 * @returns {Real}
 */
function firebase_firestore_write_batch_set(_batch_ref, _document_ref, _data)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _batch_ref, type: UInt64
    if (!is_numeric(_batch_ref)) show_error($"{_GMFUNCTION_} :: _batch_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _batch_ref);

    // param: _document_ref, type: UInt64
    if (!is_numeric(_document_ref)) show_error($"{_GMFUNCTION_} :: _document_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document_ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    var __return_value__ = __firebase_firestore_write_batch_set(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _batch_ref
 * @param {Real} _document_ref
 * @param {Any} _data
 * @returns {Real}
 */
function firebase_firestore_write_batch_set_merge(_batch_ref, _document_ref, _data)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _batch_ref, type: UInt64
    if (!is_numeric(_batch_ref)) show_error($"{_GMFUNCTION_} :: _batch_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _batch_ref);

    // param: _document_ref, type: UInt64
    if (!is_numeric(_document_ref)) show_error($"{_GMFUNCTION_} :: _document_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document_ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    var __return_value__ = __firebase_firestore_write_batch_set_merge(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _batch_ref
 * @param {Real} _document_ref
 * @param {Any} _data
 * @param {Any} _fields
 * @returns {Real}
 */
function firebase_firestore_write_batch_set_merge_fields(_batch_ref, _document_ref, _data, _fields)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _batch_ref, type: UInt64
    if (!is_numeric(_batch_ref)) show_error($"{_GMFUNCTION_} :: _batch_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _batch_ref);

    // param: _document_ref, type: UInt64
    if (!is_numeric(_document_ref)) show_error($"{_GMFUNCTION_} :: _document_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document_ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    // param: _fields, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _fields);

    var __return_value__ = __firebase_firestore_write_batch_set_merge_fields(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _batch_ref
 * @param {Real} _document_ref
 * @param {Any} _data
 * @returns {Real}
 */
function firebase_firestore_write_batch_update(_batch_ref, _document_ref, _data)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _batch_ref, type: UInt64
    if (!is_numeric(_batch_ref)) show_error($"{_GMFUNCTION_} :: _batch_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _batch_ref);

    // param: _document_ref, type: UInt64
    if (!is_numeric(_document_ref)) show_error($"{_GMFUNCTION_} :: _document_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document_ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    var __return_value__ = __firebase_firestore_write_batch_update(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _batch_ref
 * @param {Real} _document_ref
 * @returns {Real}
 */
function firebase_firestore_write_batch_delete(_batch_ref, _document_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _batch_ref, type: UInt64
    if (!is_numeric(_batch_ref)) show_error($"{_GMFUNCTION_} :: _batch_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _batch_ref);

    // param: _document_ref, type: UInt64
    if (!is_numeric(_document_ref)) show_error($"{_GMFUNCTION_} :: _document_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document_ref);

    var __return_value__ = __firebase_firestore_write_batch_delete(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _batch_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_write_batch_commit(_batch_ref, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _batch_ref, type: UInt64
    if (!is_numeric(_batch_ref)) show_error($"{_GMFUNCTION_} :: _batch_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _batch_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_firestore_write_batch_commit(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _batch_ref
 */
function firebase_firestore_write_batch_release(_batch_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _batch_ref, type: UInt64
    if (!is_numeric(_batch_ref)) show_error($"{_GMFUNCTION_} :: _batch_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _batch_ref);

    var __return_value__ = __firebase_firestore_write_batch_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

// Skipping function firebase_firestore_field_value_delete (no wrapper is required)


// Skipping function firebase_firestore_field_value_server_timestamp (no wrapper is required)


/**
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_field_value_array_union(_values)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __return_value__ = __firebase_firestore_field_value_array_union(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_field_value_array_remove(_values)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __return_value__ = __firebase_firestore_field_value_array_remove(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

// Skipping function firebase_firestore_field_value_increment_integer (no wrapper is required)


// Skipping function firebase_firestore_field_value_increment_double (no wrapper is required)


// Skipping function firebase_firestore_field_value_integer (no wrapper is required)


// Skipping function firebase_firestore_field_value_double (no wrapper is required)


// Skipping function firebase_firestore_field_value_timestamp (no wrapper is required)


// Skipping function firebase_firestore_field_value_geo_point (no wrapper is required)


/**
 * @param {Real} _document_ref
 * @returns {Real}
 */
function firebase_firestore_field_value_reference(_document_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _document_ref, type: UInt64
    if (!is_numeric(_document_ref)) show_error($"{_GMFUNCTION_} :: _document_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document_ref);

    var __return_value__ = __firebase_firestore_field_value_reference(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

// Skipping function firebase_firestore_field_value_blob (no wrapper is required)


// Skipping function firebase_firestore_field_value_null (no wrapper is required)


/**
 * @param {Real} _ref
 */
function firebase_firestore_field_value_release(_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_field_value_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Struct.FirestoreDocumentSnapshotInfo}
 */
function firebase_firestore_document_snapshot_get_info(_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_snapshot_get_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __FirestoreDocumentSnapshotInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Real} _server_timestamp_behavior
 * @returns {Any}
 */
function firebase_firestore_document_snapshot_get(_ref, _field, _server_timestamp_behavior)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseFirestore_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _server_timestamp_behavior, type: Float64
    if (!is_numeric(_server_timestamp_behavior)) show_error($"{_GMFUNCTION_} :: _server_timestamp_behavior expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _server_timestamp_behavior);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_snapshot_get(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _server_timestamp_behavior
 * @returns {Any}
 */
function firebase_firestore_document_snapshot_get_data(_ref, _server_timestamp_behavior)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseFirestore_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _server_timestamp_behavior, type: Float64
    if (!is_numeric(_server_timestamp_behavior)) show_error($"{_GMFUNCTION_} :: _server_timestamp_behavior expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _server_timestamp_behavior);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_snapshot_get_data(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _ref
 */
function firebase_firestore_document_snapshot_release(_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_document_snapshot_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Struct.FirestoreQuerySnapshotInfo}
 */
function firebase_firestore_query_snapshot_get_info(_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_snapshot_get_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __FirestoreQuerySnapshotInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Any}
 */
function firebase_firestore_query_snapshot_documents(_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseFirestore_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_snapshot_documents(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Bool} _include_metadata_changes
 * @returns {Any}
 */
function firebase_firestore_query_snapshot_document_changes(_ref, _include_metadata_changes)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseFirestore_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _include_metadata_changes, type: Bool
    if (!is_bool(_include_metadata_changes)) show_error($"{_GMFUNCTION_} :: _include_metadata_changes expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _include_metadata_changes);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_snapshot_document_changes(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _ref
 */
function firebase_firestore_query_snapshot_release(_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_query_snapshot_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 */
function firebase_firestore_listener_registration_remove(_ref)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_listener_registration_remove(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Any} _components
 * @returns {Real}
 */
function firebase_firestore_field_path_create(_components)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _components, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _components);

    var __return_value__ = __firebase_firestore_field_path_create(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

// Skipping function firebase_firestore_field_path_document_id (no wrapper is required)


/**
 * @param {Real} _field_path
 * @returns {Bool}
 */
function firebase_firestore_field_path_is_valid(_field_path)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    var __return_value__ = __firebase_firestore_field_path_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_path
 * @returns {String}
 */
function firebase_firestore_field_path_to_string(_field_path)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    var __return_value__ = __firebase_firestore_field_path_to_string(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_path
 */
function firebase_firestore_field_path_release(_field_path)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    var __return_value__ = __firebase_firestore_field_path_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_equal_to(_field, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __return_value__ = __firebase_firestore_filter_equal_to(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_not_equal_to(_field, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __return_value__ = __firebase_firestore_filter_not_equal_to(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_less_than(_field, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __return_value__ = __firebase_firestore_filter_less_than(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_less_than_or_equal_to(_field, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __return_value__ = __firebase_firestore_filter_less_than_or_equal_to(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_greater_than(_field, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __return_value__ = __firebase_firestore_filter_greater_than(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_greater_than_or_equal_to(_field, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __return_value__ = __firebase_firestore_filter_greater_than_or_equal_to(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_array_contains(_field, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __return_value__ = __firebase_firestore_filter_array_contains(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _field
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_filter_array_contains_any(_field, _values)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __return_value__ = __firebase_firestore_filter_array_contains_any(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _field
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_filter_in(_field, _values)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __return_value__ = __firebase_firestore_filter_in(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _field
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_filter_not_in(_field, _values)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __return_value__ = __firebase_firestore_filter_not_in(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_equal_to_field_path(_field_path, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __return_value__ = __firebase_firestore_filter_equal_to_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_not_equal_to_field_path(_field_path, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __return_value__ = __firebase_firestore_filter_not_equal_to_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_less_than_field_path(_field_path, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __return_value__ = __firebase_firestore_filter_less_than_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_less_than_or_equal_to_field_path(_field_path, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __return_value__ = __firebase_firestore_filter_less_than_or_equal_to_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_greater_than_field_path(_field_path, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __return_value__ = __firebase_firestore_filter_greater_than_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_greater_than_or_equal_to_field_path(_field_path, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __return_value__ = __firebase_firestore_filter_greater_than_or_equal_to_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_array_contains_field_path(_field_path, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __return_value__ = __firebase_firestore_filter_array_contains_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_path
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_filter_array_contains_any_field_path(_field_path, _values)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __return_value__ = __firebase_firestore_filter_array_contains_any_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_path
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_filter_in_field_path(_field_path, _values)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __return_value__ = __firebase_firestore_filter_in_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_path
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_filter_not_in_field_path(_field_path, _values)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __return_value__ = __firebase_firestore_filter_not_in_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Any} _filters
 * @returns {Real}
 */
function firebase_firestore_filter_and(_filters)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _filters, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _filters);

    var __return_value__ = __firebase_firestore_filter_and(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Any} _filters
 * @returns {Real}
 */
function firebase_firestore_filter_or(_filters)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _filters, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _filters);

    var __return_value__ = __firebase_firestore_filter_or(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _filter
 */
function firebase_firestore_filter_release(_filter)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _filter, type: UInt64
    if (!is_numeric(_filter)) show_error($"{_GMFUNCTION_} :: _filter expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _filter);

    var __return_value__ = __firebase_firestore_filter_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _query
 * @param {Real} _filter
 * @returns {Real}
 */
function firebase_firestore_query_where_filter(_query, _filter)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _filter, type: UInt64
    if (!is_numeric(_filter)) show_error($"{_GMFUNCTION_} :: _filter expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _filter);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_filter(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_equal_to_field_path(_query, _field_path, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_equal_to_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_not_equal_to_field_path(_query, _field_path, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_not_equal_to_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_less_than_field_path(_query, _field_path, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_less_than_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_less_than_or_equal_to_field_path(_query, _field_path, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_less_than_or_equal_to_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_greater_than_field_path(_query, _field_path, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_greater_than_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_greater_than_or_equal_to_field_path(_query, _field_path, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_greater_than_or_equal_to_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_array_contains_field_path(_query, _field_path, _value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_array_contains_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_query_where_array_contains_any_field_path(_query, _field_path, _values)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_array_contains_any_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_query_where_in_field_path(_query, _field_path, _values)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_in_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_query_where_not_in_field_path(_query, _field_path, _values)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_not_in_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Real} _direction
 * @returns {Real}
 */
function firebase_firestore_query_order_by_field_path(_query, _field_path, _direction)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _direction, type: Float64
    if (!is_numeric(_direction)) show_error($"{_GMFUNCTION_} :: _direction expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _direction);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_order_by_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @returns {Real}
 */
function firebase_firestore_query_count(_query)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_count(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _aggregate_query
 * @returns {Real}
 */
function firebase_firestore_aggregate_query_get_query(_aggregate_query)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _aggregate_query, type: UInt64
    if (!is_numeric(_aggregate_query)) show_error($"{_GMFUNCTION_} :: _aggregate_query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _aggregate_query);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_aggregate_query_get_query(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _aggregate_query
 * @returns {Bool}
 */
function firebase_firestore_aggregate_query_is_valid(_aggregate_query)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _aggregate_query, type: UInt64
    if (!is_numeric(_aggregate_query)) show_error($"{_GMFUNCTION_} :: _aggregate_query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _aggregate_query);

    var __return_value__ = __firebase_firestore_aggregate_query_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _aggregate_query
 * @param {Real} _source
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_aggregate_query_get(_aggregate_query, _source, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _aggregate_query, type: UInt64
    if (!is_numeric(_aggregate_query)) show_error($"{_GMFUNCTION_} :: _aggregate_query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _aggregate_query);

    // param: _source, type: Float64
    if (!is_numeric(_source)) show_error($"{_GMFUNCTION_} :: _source expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _source);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_firestore_aggregate_query_get(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _aggregate_query
 */
function firebase_firestore_aggregate_query_release(_aggregate_query)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _aggregate_query, type: UInt64
    if (!is_numeric(_aggregate_query)) show_error($"{_GMFUNCTION_} :: _aggregate_query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _aggregate_query);

    var __return_value__ = __firebase_firestore_aggregate_query_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @returns {Real}
 */
function firebase_firestore_aggregate_snapshot_count(_snapshot)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_aggregate_snapshot_count(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @returns {Real}
 */
function firebase_firestore_aggregate_snapshot_get_query(_snapshot)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_aggregate_snapshot_get_query(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _snapshot
 * @returns {Bool}
 */
function firebase_firestore_aggregate_snapshot_is_valid(_snapshot)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_aggregate_snapshot_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 */
function firebase_firestore_aggregate_snapshot_release(_snapshot)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_aggregate_snapshot_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _firestore
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_add_snapshots_in_sync_listener(_firestore, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _firestore, type: UInt64
    if (!is_numeric(_firestore)) show_error($"{_GMFUNCTION_} :: _firestore expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _firestore);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_add_snapshots_in_sync_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _firestore
 * @param {Id.Buffer} _bundle
 * @param {Function} _progress_callback
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_load_bundle(_firestore, _bundle, _progress_callback, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _firestore, type: UInt64
    if (!is_numeric(_firestore)) show_error($"{_GMFUNCTION_} :: _firestore expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _firestore);

    // param: _bundle, type: Buffer
    if (!buffer_exists(_bundle)) show_error($"{_GMFUNCTION_} :: _bundle expected Id.Buffer", true);
    __GMFirebaseFirestore_queue_buffer(buffer_get_address(_bundle), buffer_get_size(_bundle));

    // param: _progress_callback, type: optional<Function>
    if (is_undefined(_progress_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_progress_callback)) show_error($"{_GMFUNCTION_} :: _progress_callback expected callable type", true);
        var _progress_callback_handle = __ext_core_function_register(_progress_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _progress_callback_handle);
    }

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_firestore_load_bundle(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _firestore
 * @param {String} _name
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_named_query(_firestore, _name, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _firestore, type: UInt64
    if (!is_numeric(_firestore)) show_error($"{_GMFUNCTION_} :: _firestore expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _firestore);

    // param: _name, type: String
    if (!is_string(_name)) show_error($"{_GMFUNCTION_} :: _name expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_name));
    buffer_write(__args_buffer__, buffer_string, _name);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_firestore_named_query(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _document
 * @param {Any} _data
 * @param {Any} _field_paths
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_document_ref_set_merge_field_paths(_document, _data, _field_paths, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _document, type: UInt64
    if (!is_numeric(_document)) show_error($"{_GMFUNCTION_} :: _document expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    // param: _field_paths, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _field_paths);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_firestore_document_ref_set_merge_field_paths(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _batch
 * @param {Real} _document
 * @param {Any} _data
 * @param {Any} _field_paths
 */
function firebase_firestore_write_batch_set_merge_field_paths(_batch, _document, _data, _field_paths)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _batch, type: UInt64
    if (!is_numeric(_batch)) show_error($"{_GMFUNCTION_} :: _batch expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _batch);

    // param: _document, type: UInt64
    if (!is_numeric(_document)) show_error($"{_GMFUNCTION_} :: _document expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    // param: _field_paths, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _field_paths);

    var __return_value__ = __firebase_firestore_write_batch_set_merge_field_paths(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Real}
 */
function firebase_firestore_field_value_type(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_type(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_valid(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_null(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_null(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_boolean(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_boolean(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_integer(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_integer(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_double(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_double(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_timestamp(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_timestamp(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_string(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_string(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_blob(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_blob(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_reference(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_reference(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_geo_point(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_geo_point(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_array(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_array(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_map(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_map(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_boolean_value(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_boolean_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Real}
 */
function firebase_firestore_field_value_integer_value(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_integer_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Real}
 */
function firebase_firestore_field_value_double_value(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_double_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {String}
 */
function firebase_firestore_field_value_string_value(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_string_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Real}
 */
function firebase_firestore_field_value_blob_size(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_blob_size(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @param {Id.Buffer} _out_buffer
 * @returns {Real}
 */
function firebase_firestore_field_value_blob_copy(_field_value, _out_buffer)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    // param: _out_buffer, type: Buffer
    if (!buffer_exists(_out_buffer)) show_error($"{_GMFUNCTION_} :: _out_buffer expected Id.Buffer", true);
    __GMFirebaseFirestore_queue_buffer(buffer_get_address(_out_buffer), buffer_get_size(_out_buffer));

    var __return_value__ = __firebase_firestore_field_value_blob_copy(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Real}
 */
function firebase_firestore_field_value_reference_value(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_reference_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _field_value
 * @returns {Any}
 */
function firebase_firestore_field_value_timestamp_value(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseFirestore_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_timestamp_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _field_value
 * @returns {Any}
 */
function firebase_firestore_field_value_geo_point_value(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseFirestore_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_geo_point_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _field_value
 * @returns {Any}
 */
function firebase_firestore_field_value_array_value(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseFirestore_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_array_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _field_value
 * @returns {Any}
 */
function firebase_firestore_field_value_map_value(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseFirestore_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_map_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _field_value
 * @returns {String}
 */
function firebase_firestore_field_value_to_string(_field_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_to_string(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _query
 * @returns {Real}
 */
function firebase_firestore_query_get_firestore(_query)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_get_firestore(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _document
 * @returns {Real}
 */
function firebase_firestore_document_ref_get_firestore(_document)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _document, type: UInt64
    if (!is_numeric(_document)) show_error($"{_GMFUNCTION_} :: _document expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_ref_get_firestore(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _document
 * @returns {String}
 */
function firebase_firestore_document_ref_to_string(_document)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _document, type: UInt64
    if (!is_numeric(_document)) show_error($"{_GMFUNCTION_} :: _document expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document);

    var __return_value__ = __firebase_firestore_document_ref_to_string(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _document
 * @param {Any} _entries
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_document_ref_update_field_paths(_document, _entries, _callback)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFirestore_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _document, type: UInt64
    if (!is_numeric(_document)) show_error($"{_GMFUNCTION_} :: _document expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document);

    // param: _entries, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _entries);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_firestore_document_ref_update_field_paths(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _batch
 * @param {Real} _document
 * @param {Any} _entries
 * @returns {Real}
 */
function firebase_firestore_write_batch_update_field_paths(_batch, _document, _entries)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _batch, type: UInt64
    if (!is_numeric(_batch)) show_error($"{_GMFUNCTION_} :: _batch expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _batch);

    // param: _document, type: UInt64
    if (!is_numeric(_document)) show_error($"{_GMFUNCTION_} :: _document expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document);

    // param: _entries, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _entries);

    var __return_value__ = __firebase_firestore_write_batch_update_field_paths(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _batch
 * @returns {Bool}
 */
function firebase_firestore_write_batch_is_valid(_batch)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _batch, type: UInt64
    if (!is_numeric(_batch)) show_error($"{_GMFUNCTION_} :: _batch expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _batch);

    var __return_value__ = __firebase_firestore_write_batch_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _firestore
 * @returns {String}
 */
function firebase_firestore_settings_to_string(_firestore)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _firestore, type: UInt64
    if (!is_numeric(_firestore)) show_error($"{_GMFUNCTION_} :: _firestore expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _firestore);

    var __return_value__ = __firebase_firestore_settings_to_string(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @returns {Bool}
 */
function firebase_firestore_document_snapshot_is_valid(_snapshot)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_document_snapshot_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @returns {String}
 */
function firebase_firestore_document_snapshot_to_string(_snapshot)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_document_snapshot_to_string(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @param {Real} _field_path
 * @param {Real} _server_timestamp_behavior
 * @returns {Any}
 */
function firebase_firestore_document_snapshot_get_field_path(_snapshot, _field_path, _server_timestamp_behavior)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseFirestore_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _server_timestamp_behavior, type: Float64
    if (!is_numeric(_server_timestamp_behavior)) show_error($"{_GMFUNCTION_} :: _server_timestamp_behavior expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _server_timestamp_behavior);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_snapshot_get_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _snapshot
 * @returns {Bool}
 */
function firebase_firestore_query_snapshot_is_valid(_snapshot)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_query_snapshot_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @returns {Real}
 */
function firebase_firestore_query_snapshot_get_query(_snapshot)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_snapshot_get_query(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _listener
 * @returns {Bool}
 */
function firebase_firestore_listener_registration_is_valid(_listener)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _listener, type: UInt64
    if (!is_numeric(_listener)) show_error($"{_GMFUNCTION_} :: _listener expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _listener);

    var __return_value__ = __firebase_firestore_listener_registration_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _firestore
 * @returns {Real}
 */
function firebase_firestore_get_app(_firestore)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _firestore, type: UInt64
    if (!is_numeric(_firestore)) show_error($"{_GMFUNCTION_} :: _firestore expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _firestore);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_get_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @returns {Real}
 */
function firebase_firestore_get_instance_for_app(_app)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_get_instance_for_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @param {String} _database_id
 * @returns {Real}
 */
function firebase_firestore_get_instance_for_app_database(_app, _database_id)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    // param: _database_id, type: String
    if (!is_string(_database_id)) show_error($"{_GMFUNCTION_} :: _database_id expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_database_id));
    buffer_write(__args_buffer__, buffer_string, _database_id);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_get_instance_for_app_database(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

// Skipping function firebase_firestore_field_value_boolean (no wrapper is required)


// Skipping function firebase_firestore_field_value_string (no wrapper is required)


/**
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_field_value_array(_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __return_value__ = __firebase_firestore_field_value_array(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_field_value_map(_value)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __return_value__ = __firebase_firestore_field_value_map(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @returns {String}
 */
function firebase_firestore_document_snapshot_metadata_to_string(_snapshot)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_document_snapshot_metadata_to_string(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @returns {String}
 */
function firebase_firestore_query_snapshot_metadata_to_string(_snapshot)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_query_snapshot_metadata_to_string(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @returns {Bool}
 */
function firebase_firestore_document_snapshot_exists(_snapshot)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_document_snapshot_exists(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @returns {String}
 */
function firebase_firestore_document_snapshot_id(_snapshot)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_document_snapshot_id(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @returns {Real}
 */
function firebase_firestore_document_snapshot_reference(_snapshot)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_snapshot_reference(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _snapshot
 * @returns {Bool}
 */
function firebase_firestore_document_snapshot_metadata_has_pending_writes(_snapshot)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_document_snapshot_metadata_has_pending_writes(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @returns {Bool}
 */
function firebase_firestore_document_snapshot_metadata_is_from_cache(_snapshot)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_document_snapshot_metadata_is_from_cache(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @returns {Real}
 */
function firebase_firestore_query_snapshot_size(_snapshot)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_query_snapshot_size(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @returns {Bool}
 */
function firebase_firestore_query_snapshot_empty(_snapshot)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_query_snapshot_empty(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @returns {Bool}
 */
function firebase_firestore_query_snapshot_metadata_has_pending_writes(_snapshot)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_query_snapshot_metadata_has_pending_writes(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @returns {Bool}
 */
function firebase_firestore_query_snapshot_metadata_is_from_cache(_snapshot)
{
    var __available__ = __GMFirebaseFirestore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_query_snapshot_metadata_is_from_cache(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/// @ignore
function __GMFirebaseFirestore_get_decoders()
{
    static __decoders__ = [
        __FirestoreDocumentSnapshotInfo_decode,
        __FirestoreQuerySnapshotInfo_decode
    ];
    return __decoders__;
}
/// @ignore
function __GMFirebaseFirestore_get_dispatcher()
{
    static __dispatcher__ = new __GMNativeFunctionDispatcher(__GMFirebaseFirestore_invocation_handler, __GMFirebaseFirestore_get_decoders());
    return __dispatcher__;
}
/// @ignore
function __GMFirebaseFirestore_is_available()
{
    static __available__ = extension_exists("GMFirebaseFirestore");
    return __available__;
}
