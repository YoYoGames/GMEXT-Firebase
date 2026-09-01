// ##### extgen :: Auto-generated file do not edit!! #####

// #####################################################################
// # Macros
// #####################################################################

// #####################################################################
// # Enums
// #####################################################################

enum FirebaseLogLevel
{
    Verbose = 0,
    Debug = 1,
    Info = 2,
    Warning = 3,
    Error = 4,
    Assert = 5
}

enum FirebaseDatabaseError
{
    None = 0,
    Disconnected = 1,
    ExpiredToken = 2,
    InvalidToken = 3,
    MaxRetries = 4,
    NetworkError = 5,
    OperationFailed = 6,
    OverriddenBySet = 7,
    PermissionDenied = 8,
    Unavailable = 9,
    UnknownError = 10,
    WriteCanceled = 11,
    InvalidVariantType = 12,
    ConflictingOperationInProgress = 13,
    TransactionAbortedByUser = 14
}

// #####################################################################
// # Constructors
// #####################################################################

/**
 * @returns {Struct.FirebaseDatabaseReferenceInfo}
 */
function FirebaseDatabaseReferenceInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 3138794886;

    self.key = undefined;
    self.is_root = undefined;
    self.is_valid = undefined;
    self.reference = undefined;
    self.parent = undefined;
    self.root = undefined;
    self.database = undefined;
    self.url = undefined;

}

/**
 * @returns {Struct.FirebaseDataSnapshotInfo}
 */
function FirebaseDataSnapshotInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 3979383028;

    self.key = undefined;
    self.exists = undefined;
    self.is_valid = undefined;
    self.has_children = undefined;
    self.children_count = undefined;
    self.reference = undefined;

}

// #####################################################################
// # Codecs
// #####################################################################

/**
 * @func __FirebaseDatabaseReferenceInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseDatabaseReferenceInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseDatabaseReferenceInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: key, type: String
        if (!is_string(self.key)) show_error($"{_where} :: self.key expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.key));
        buffer_write(_buffer, buffer_string, self.key);

        // field: is_root, type: Bool
        if (!is_bool(self.is_root)) show_error($"{_where} :: self.is_root expected bool", true);
        buffer_write(_buffer, buffer_bool, self.is_root);

        // field: is_valid, type: Bool
        if (!is_bool(self.is_valid)) show_error($"{_where} :: self.is_valid expected bool", true);
        buffer_write(_buffer, buffer_bool, self.is_valid);

        // field: reference, type: UInt64
        if (!is_numeric(self.reference)) show_error($"{_where} :: self.reference expected number", true);
        buffer_write(_buffer, buffer_u64, self.reference);

        // field: parent, type: UInt64
        if (!is_numeric(self.parent)) show_error($"{_where} :: self.parent expected number", true);
        buffer_write(_buffer, buffer_u64, self.parent);

        // field: root, type: UInt64
        if (!is_numeric(self.root)) show_error($"{_where} :: self.root expected number", true);
        buffer_write(_buffer, buffer_u64, self.root);

        // field: database, type: UInt64
        if (!is_numeric(self.database)) show_error($"{_where} :: self.database expected number", true);
        buffer_write(_buffer, buffer_u64, self.database);

        // field: url, type: String
        if (!is_string(self.url)) show_error($"{_where} :: self.url expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.url));
        buffer_write(_buffer, buffer_string, self.url);

    }
}

/**
 * @func __FirebaseDatabaseReferenceInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseDatabaseReferenceInfo}
 * @ignore
 */
function __FirebaseDatabaseReferenceInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseDatabaseReferenceInfo();
    with (_inst)
    {
        // field: key, type: String
        buffer_read(_buffer, buffer_u32);
        self.key = buffer_read(_buffer, buffer_string);

        // field: is_root, type: Bool
        self.is_root = buffer_read(_buffer, buffer_bool);

        // field: is_valid, type: Bool
        self.is_valid = buffer_read(_buffer, buffer_bool);

        // field: reference, type: UInt64
        self.reference = buffer_read(_buffer, buffer_u64);

        // field: parent, type: UInt64
        self.parent = buffer_read(_buffer, buffer_u64);

        // field: root, type: UInt64
        self.root = buffer_read(_buffer, buffer_u64);

        // field: database, type: UInt64
        self.database = buffer_read(_buffer, buffer_u64);

        // field: url, type: String
        buffer_read(_buffer, buffer_u32);
        self.url = buffer_read(_buffer, buffer_string);

    }

    return _inst;
}

/**
 * @func __FirebaseDataSnapshotInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseDataSnapshotInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseDataSnapshotInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: key, type: String
        if (!is_string(self.key)) show_error($"{_where} :: self.key expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.key));
        buffer_write(_buffer, buffer_string, self.key);

        // field: exists, type: Bool
        if (!is_bool(self.exists)) show_error($"{_where} :: self.exists expected bool", true);
        buffer_write(_buffer, buffer_bool, self.exists);

        // field: is_valid, type: Bool
        if (!is_bool(self.is_valid)) show_error($"{_where} :: self.is_valid expected bool", true);
        buffer_write(_buffer, buffer_bool, self.is_valid);

        // field: has_children, type: Bool
        if (!is_bool(self.has_children)) show_error($"{_where} :: self.has_children expected bool", true);
        buffer_write(_buffer, buffer_bool, self.has_children);

        // field: children_count, type: Float64
        if (!is_numeric(self.children_count)) show_error($"{_where} :: self.children_count expected number", true);
        buffer_write(_buffer, buffer_f64, self.children_count);

        // field: reference, type: UInt64
        if (!is_numeric(self.reference)) show_error($"{_where} :: self.reference expected number", true);
        buffer_write(_buffer, buffer_u64, self.reference);

    }
}

/**
 * @func __FirebaseDataSnapshotInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseDataSnapshotInfo}
 * @ignore
 */
function __FirebaseDataSnapshotInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseDataSnapshotInfo();
    with (_inst)
    {
        // field: key, type: String
        buffer_read(_buffer, buffer_u32);
        self.key = buffer_read(_buffer, buffer_string);

        // field: exists, type: Bool
        self.exists = buffer_read(_buffer, buffer_bool);

        // field: is_valid, type: Bool
        self.is_valid = buffer_read(_buffer, buffer_bool);

        // field: has_children, type: Bool
        self.has_children = buffer_read(_buffer, buffer_bool);

        // field: children_count, type: Float64
        self.children_count = buffer_read(_buffer, buffer_f64);

        // field: reference, type: UInt64
        self.reference = buffer_read(_buffer, buffer_u64);

    }

    return _inst;
}

// #####################################################################
// # Functions
// #####################################################################

/**
 * @returns {Real}
 */
function firebase_database_get_instance()
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_get_instance(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _url
 * @returns {Real}
 */
function firebase_database_get_instance_for_url(_url)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_get_instance_for_url(_url, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _db_ref
 * @returns {String}
 */
function firebase_database_get_url(_db_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _db_ref, type: UInt64
    if (!is_numeric(_db_ref)) show_error($"{_GMFUNCTION_} :: _db_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _db_ref);

    var __return_value__ = __firebase_database_get_url(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _db_ref
 * @returns {Real}
 */
function firebase_database_get_reference(_db_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _db_ref, type: UInt64
    if (!is_numeric(_db_ref)) show_error($"{_GMFUNCTION_} :: _db_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _db_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_get_reference(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _db_ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_database_get_reference_at_path(_db_ref, _path)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _db_ref, type: UInt64
    if (!is_numeric(_db_ref)) show_error($"{_GMFUNCTION_} :: _db_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _db_ref);

    // param: _path, type: String
    if (!is_string(_path)) show_error($"{_GMFUNCTION_} :: _path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_path));
    buffer_write(__args_buffer__, buffer_string, _path);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_get_reference_at_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _db_ref
 * @param {String} _url
 * @returns {Real}
 */
function firebase_database_get_reference_from_url(_db_ref, _url)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _db_ref, type: UInt64
    if (!is_numeric(_db_ref)) show_error($"{_GMFUNCTION_} :: _db_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _db_ref);

    // param: _url, type: String
    if (!is_string(_url)) show_error($"{_GMFUNCTION_} :: _url expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_url));
    buffer_write(__args_buffer__, buffer_string, _url);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_get_reference_from_url(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _db_ref
 * @returns {Real}
 */
function firebase_database_go_offline(_db_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _db_ref, type: UInt64
    if (!is_numeric(_db_ref)) show_error($"{_GMFUNCTION_} :: _db_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _db_ref);

    var __return_value__ = __firebase_database_go_offline(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _db_ref
 * @returns {Real}
 */
function firebase_database_go_online(_db_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _db_ref, type: UInt64
    if (!is_numeric(_db_ref)) show_error($"{_GMFUNCTION_} :: _db_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _db_ref);

    var __return_value__ = __firebase_database_go_online(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _db_ref
 * @returns {Real}
 */
function firebase_database_purge_outstanding_writes(_db_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _db_ref, type: UInt64
    if (!is_numeric(_db_ref)) show_error($"{_GMFUNCTION_} :: _db_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _db_ref);

    var __return_value__ = __firebase_database_purge_outstanding_writes(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _db_ref
 * @param {Real} _enabled
 * @returns {Real}
 */
function firebase_database_set_persistence_enabled(_db_ref, _enabled)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _db_ref, type: UInt64
    if (!is_numeric(_db_ref)) show_error($"{_GMFUNCTION_} :: _db_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _db_ref);

    // param: _enabled, type: Float64
    if (!is_numeric(_enabled)) show_error($"{_GMFUNCTION_} :: _enabled expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _enabled);

    var __return_value__ = __firebase_database_set_persistence_enabled(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _db_ref
 * @param {Enum.FirebaseLogLevel} _log_level
 * @returns {Real}
 */
function firebase_database_set_log_level(_db_ref, _log_level)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _db_ref, type: UInt64
    if (!is_numeric(_db_ref)) show_error($"{_GMFUNCTION_} :: _db_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _db_ref);

    // param: _log_level, type: enum FirebaseLogLevel

    if (!is_numeric(_log_level)) show_error($"{_GMFUNCTION_} :: _log_level expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _log_level);

    var __return_value__ = __firebase_database_set_log_level(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _db_ref
 * @returns {Enum.FirebaseLogLevel}
 */
function firebase_database_get_log_level(_db_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _db_ref, type: UInt64
    if (!is_numeric(_db_ref)) show_error($"{_GMFUNCTION_} :: _db_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _db_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_get_log_level(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_database_ref_order_by_child(_ref, _path)
{
    var __available__ = __GMFirebaseDatabase_is_available();
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

    var __return_value__ = __firebase_database_ref_order_by_child(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_order_by_key(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_order_by_key(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_order_by_value(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_order_by_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_order_by_priority(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_order_by_priority(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _order_value
 * @returns {Real}
 */
function firebase_database_ref_start_at(_ref, _order_value)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _order_value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _order_value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_start_at(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _order_value
 * @param {String} _child_key
 * @returns {Real}
 */
function firebase_database_ref_start_at_key(_ref, _order_value, _child_key)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _order_value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _order_value);

    // param: _child_key, type: String
    if (!is_string(_child_key)) show_error($"{_GMFUNCTION_} :: _child_key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_child_key));
    buffer_write(__args_buffer__, buffer_string, _child_key);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_start_at_key(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _order_value
 * @returns {Real}
 */
function firebase_database_ref_end_at(_ref, _order_value)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _order_value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _order_value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_end_at(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _order_value
 * @param {String} _child_key
 * @returns {Real}
 */
function firebase_database_ref_end_at_key(_ref, _order_value, _child_key)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _order_value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _order_value);

    // param: _child_key, type: String
    if (!is_string(_child_key)) show_error($"{_GMFUNCTION_} :: _child_key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_child_key));
    buffer_write(__args_buffer__, buffer_string, _child_key);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_end_at_key(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _order_value
 * @returns {Real}
 */
function firebase_database_ref_equal_to(_ref, _order_value)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _order_value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _order_value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_equal_to(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _order_value
 * @param {String} _child_key
 * @returns {Real}
 */
function firebase_database_ref_equal_to_key(_ref, _order_value, _child_key)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _order_value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _order_value);

    // param: _child_key, type: String
    if (!is_string(_child_key)) show_error($"{_GMFUNCTION_} :: _child_key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_child_key));
    buffer_write(__args_buffer__, buffer_string, _child_key);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_equal_to_key(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _limit
 * @returns {Real}
 */
function firebase_database_ref_limit_to_first(_ref, _limit)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _limit, type: Float64
    if (!is_numeric(_limit)) show_error($"{_GMFUNCTION_} :: _limit expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _limit);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_limit_to_first(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _limit
 * @returns {Real}
 */
function firebase_database_ref_limit_to_last(_ref, _limit)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _limit, type: Float64
    if (!is_numeric(_limit)) show_error($"{_GMFUNCTION_} :: _limit expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _limit);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_limit_to_last(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _keep_sync
 * @returns {Real}
 */
function firebase_database_ref_set_keep_synchronized(_ref, _keep_sync)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _keep_sync, type: Float64
    if (!is_numeric(_keep_sync)) show_error($"{_GMFUNCTION_} :: _keep_sync expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _keep_sync);

    var __return_value__ = __firebase_database_ref_set_keep_synchronized(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_database_ref_get_value(_ref, _callback)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseDatabase_get_dispatcher();

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

    var __return_value__ = __firebase_database_ref_get_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _on_value_changed
 * @param {Function} _on_cancelled
 * @returns {Real}
 */
function firebase_database_ref_add_value_listener(_ref, _on_value_changed, _on_cancelled)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseDatabase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _on_value_changed, type: optional<Function>
    if (is_undefined(_on_value_changed))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_value_changed)) show_error($"{_GMFUNCTION_} :: _on_value_changed expected callable type", true);
        var _on_value_changed_handle = __ext_core_function_register(_on_value_changed, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_value_changed_handle);
    }

    // param: _on_cancelled, type: optional<Function>
    if (is_undefined(_on_cancelled))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_cancelled)) show_error($"{_GMFUNCTION_} :: _on_cancelled expected callable type", true);
        var _on_cancelled_handle = __ext_core_function_register(_on_cancelled, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_cancelled_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_add_value_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _listener_ref
 * @returns {Real}
 */
function firebase_database_ref_remove_value_listener(_ref, _listener_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _listener_ref, type: UInt64
    if (!is_numeric(_listener_ref)) show_error($"{_GMFUNCTION_} :: _listener_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _listener_ref);

    var __return_value__ = __firebase_database_ref_remove_value_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_remove_all_value_listeners(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_ref_remove_all_value_listeners(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _on_child_added
 * @param {Function} _on_child_changed
 * @param {Function} _on_child_moved
 * @param {Function} _on_child_removed
 * @param {Function} _on_cancelled
 * @returns {Real}
 */
function firebase_database_ref_add_child_listener(_ref, _on_child_added, _on_child_changed, _on_child_moved, _on_child_removed, _on_cancelled)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseDatabase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _on_child_added, type: optional<Function>
    if (is_undefined(_on_child_added))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_child_added)) show_error($"{_GMFUNCTION_} :: _on_child_added expected callable type", true);
        var _on_child_added_handle = __ext_core_function_register(_on_child_added, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_child_added_handle);
    }

    // param: _on_child_changed, type: optional<Function>
    if (is_undefined(_on_child_changed))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_child_changed)) show_error($"{_GMFUNCTION_} :: _on_child_changed expected callable type", true);
        var _on_child_changed_handle = __ext_core_function_register(_on_child_changed, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_child_changed_handle);
    }

    // param: _on_child_moved, type: optional<Function>
    if (is_undefined(_on_child_moved))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_child_moved)) show_error($"{_GMFUNCTION_} :: _on_child_moved expected callable type", true);
        var _on_child_moved_handle = __ext_core_function_register(_on_child_moved, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_child_moved_handle);
    }

    // param: _on_child_removed, type: optional<Function>
    if (is_undefined(_on_child_removed))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_child_removed)) show_error($"{_GMFUNCTION_} :: _on_child_removed expected callable type", true);
        var _on_child_removed_handle = __ext_core_function_register(_on_child_removed, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_child_removed_handle);
    }

    // param: _on_cancelled, type: optional<Function>
    if (is_undefined(_on_cancelled))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_cancelled)) show_error($"{_GMFUNCTION_} :: _on_cancelled expected callable type", true);
        var _on_cancelled_handle = __ext_core_function_register(_on_cancelled, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_cancelled_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_add_child_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _listener_ref
 * @returns {Real}
 */
function firebase_database_ref_remove_child_listener(_ref, _listener_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _listener_ref, type: UInt64
    if (!is_numeric(_listener_ref)) show_error($"{_GMFUNCTION_} :: _listener_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _listener_ref);

    var __return_value__ = __firebase_database_ref_remove_child_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_remove_all_child_listeners(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_ref_remove_all_child_listeners(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_database_query_order_by_child(_ref, _path)
{
    var __available__ = __GMFirebaseDatabase_is_available();
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

    var __return_value__ = __firebase_database_query_order_by_child(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_query_order_by_key(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_order_by_key(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_query_order_by_value(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_order_by_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_query_order_by_priority(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_order_by_priority(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _order_value
 * @returns {Real}
 */
function firebase_database_query_start_at(_ref, _order_value)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _order_value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _order_value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_start_at(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _order_value
 * @param {String} _child_key
 * @returns {Real}
 */
function firebase_database_query_start_at_key(_ref, _order_value, _child_key)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _order_value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _order_value);

    // param: _child_key, type: String
    if (!is_string(_child_key)) show_error($"{_GMFUNCTION_} :: _child_key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_child_key));
    buffer_write(__args_buffer__, buffer_string, _child_key);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_start_at_key(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _order_value
 * @returns {Real}
 */
function firebase_database_query_end_at(_ref, _order_value)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _order_value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _order_value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_end_at(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _order_value
 * @param {String} _child_key
 * @returns {Real}
 */
function firebase_database_query_end_at_key(_ref, _order_value, _child_key)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _order_value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _order_value);

    // param: _child_key, type: String
    if (!is_string(_child_key)) show_error($"{_GMFUNCTION_} :: _child_key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_child_key));
    buffer_write(__args_buffer__, buffer_string, _child_key);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_end_at_key(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _order_value
 * @returns {Real}
 */
function firebase_database_query_equal_to(_ref, _order_value)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _order_value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _order_value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_equal_to(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _order_value
 * @param {String} _child_key
 * @returns {Real}
 */
function firebase_database_query_equal_to_key(_ref, _order_value, _child_key)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _order_value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _order_value);

    // param: _child_key, type: String
    if (!is_string(_child_key)) show_error($"{_GMFUNCTION_} :: _child_key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_child_key));
    buffer_write(__args_buffer__, buffer_string, _child_key);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_equal_to_key(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _limit
 * @returns {Real}
 */
function firebase_database_query_limit_to_first(_ref, _limit)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _limit, type: Float64
    if (!is_numeric(_limit)) show_error($"{_GMFUNCTION_} :: _limit expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _limit);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_limit_to_first(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _limit
 * @returns {Real}
 */
function firebase_database_query_limit_to_last(_ref, _limit)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _limit, type: Float64
    if (!is_numeric(_limit)) show_error($"{_GMFUNCTION_} :: _limit expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _limit);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_limit_to_last(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_query_get_reference(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_get_reference(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _keep_sync
 * @returns {Real}
 */
function firebase_database_query_set_keep_synchronized(_ref, _keep_sync)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _keep_sync, type: Float64
    if (!is_numeric(_keep_sync)) show_error($"{_GMFUNCTION_} :: _keep_sync expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _keep_sync);

    var __return_value__ = __firebase_database_query_set_keep_synchronized(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_query_is_valid(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_query_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_database_query_get_value(_ref, _callback)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseDatabase_get_dispatcher();

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

    var __return_value__ = __firebase_database_query_get_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _on_value_changed
 * @param {Function} _on_cancelled
 * @returns {Real}
 */
function firebase_database_query_add_value_listener(_ref, _on_value_changed, _on_cancelled)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseDatabase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _on_value_changed, type: optional<Function>
    if (is_undefined(_on_value_changed))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_value_changed)) show_error($"{_GMFUNCTION_} :: _on_value_changed expected callable type", true);
        var _on_value_changed_handle = __ext_core_function_register(_on_value_changed, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_value_changed_handle);
    }

    // param: _on_cancelled, type: optional<Function>
    if (is_undefined(_on_cancelled))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_cancelled)) show_error($"{_GMFUNCTION_} :: _on_cancelled expected callable type", true);
        var _on_cancelled_handle = __ext_core_function_register(_on_cancelled, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_cancelled_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_add_value_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _listener_ref
 * @returns {Real}
 */
function firebase_database_query_remove_value_listener(_ref, _listener_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _listener_ref, type: UInt64
    if (!is_numeric(_listener_ref)) show_error($"{_GMFUNCTION_} :: _listener_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _listener_ref);

    var __return_value__ = __firebase_database_query_remove_value_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_query_remove_all_value_listeners(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_query_remove_all_value_listeners(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _on_child_added
 * @param {Function} _on_child_changed
 * @param {Function} _on_child_moved
 * @param {Function} _on_child_removed
 * @param {Function} _on_cancelled
 * @returns {Real}
 */
function firebase_database_query_add_child_listener(_ref, _on_child_added, _on_child_changed, _on_child_moved, _on_child_removed, _on_cancelled)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseDatabase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _on_child_added, type: optional<Function>
    if (is_undefined(_on_child_added))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_child_added)) show_error($"{_GMFUNCTION_} :: _on_child_added expected callable type", true);
        var _on_child_added_handle = __ext_core_function_register(_on_child_added, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_child_added_handle);
    }

    // param: _on_child_changed, type: optional<Function>
    if (is_undefined(_on_child_changed))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_child_changed)) show_error($"{_GMFUNCTION_} :: _on_child_changed expected callable type", true);
        var _on_child_changed_handle = __ext_core_function_register(_on_child_changed, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_child_changed_handle);
    }

    // param: _on_child_moved, type: optional<Function>
    if (is_undefined(_on_child_moved))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_child_moved)) show_error($"{_GMFUNCTION_} :: _on_child_moved expected callable type", true);
        var _on_child_moved_handle = __ext_core_function_register(_on_child_moved, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_child_moved_handle);
    }

    // param: _on_child_removed, type: optional<Function>
    if (is_undefined(_on_child_removed))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_child_removed)) show_error($"{_GMFUNCTION_} :: _on_child_removed expected callable type", true);
        var _on_child_removed_handle = __ext_core_function_register(_on_child_removed, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_child_removed_handle);
    }

    // param: _on_cancelled, type: optional<Function>
    if (is_undefined(_on_cancelled))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_cancelled)) show_error($"{_GMFUNCTION_} :: _on_cancelled expected callable type", true);
        var _on_cancelled_handle = __ext_core_function_register(_on_cancelled, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_cancelled_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_add_child_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _listener_ref
 * @returns {Real}
 */
function firebase_database_query_remove_child_listener(_ref, _listener_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _listener_ref, type: UInt64
    if (!is_numeric(_listener_ref)) show_error($"{_GMFUNCTION_} :: _listener_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _listener_ref);

    var __return_value__ = __firebase_database_query_remove_child_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_query_remove_all_child_listeners(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_query_remove_all_child_listeners(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_query_release(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_query_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Struct.FirebaseDatabaseReferenceInfo}
 */
function firebase_database_ref_get(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_get(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __FirebaseDatabaseReferenceInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_database_ref_child(_ref, _path)
{
    var __available__ = __GMFirebaseDatabase_is_available();
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

    var __return_value__ = __firebase_database_ref_child(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_push(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_push(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_go_online(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_ref_go_online(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_go_offline(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_ref_go_offline(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Any} _value
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_database_ref_set_value(_ref, _value, _callback)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseDatabase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

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

    var __return_value__ = __firebase_database_ref_set_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Any} _priority
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_database_ref_set_priority(_ref, _priority, _callback)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseDatabase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _priority, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _priority);

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

    var __return_value__ = __firebase_database_ref_set_priority(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Any} _value
 * @param {Any} _priority
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_database_ref_set_value_and_priority(_ref, _value, _priority, _callback)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseDatabase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    // param: _priority, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _priority);

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

    var __return_value__ = __firebase_database_ref_set_value_and_priority(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Any} _values
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_database_ref_update_children(_ref, _values, _callback)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseDatabase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

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

    var __return_value__ = __firebase_database_ref_update_children(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_database_ref_remove_value(_ref, _callback)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseDatabase_get_dispatcher();

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

    var __return_value__ = __firebase_database_ref_remove_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_database_ref_run_transaction(_ref, _callback)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseDatabase_get_dispatcher();

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

    var __return_value__ = __firebase_database_ref_run_transaction(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_release(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_ref_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_snapshot_exists(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_snapshot_exists(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_snapshot_is_valid(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_snapshot_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_database_snapshot_child(_ref, _path)
{
    var __available__ = __GMFirebaseDatabase_is_available();
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

    var __return_value__ = __firebase_database_snapshot_child(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_database_snapshot_has_child(_ref, _path)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _path, type: String
    if (!is_string(_path)) show_error($"{_GMFUNCTION_} :: _path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_path));
    buffer_write(__args_buffer__, buffer_string, _path);

    var __return_value__ = __firebase_database_snapshot_has_child(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_snapshot_has_children(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_snapshot_has_children(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_snapshot_children_count(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_snapshot_children_count(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Any}
 */
function firebase_database_snapshot_get_children(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseDatabase_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_snapshot_get_children(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_database_snapshot_key(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_snapshot_key(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_snapshot_get_reference(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_snapshot_get_reference(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _snapshot
 * @returns {Struct.FirebaseDataSnapshotInfo}
 */
function firebase_database_snapshot_get_info(_snapshot)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_snapshot_get_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __FirebaseDataSnapshotInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    return __result__;
}

/**
 * @param {Real} _snapshot
 * @returns {Any}
 */
function firebase_database_snapshot_get_value(_snapshot)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseDatabase_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_snapshot_get_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _snapshot
 * @returns {Any}
 */
function firebase_database_snapshot_get_priority(_snapshot)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseDatabase_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_snapshot_get_priority(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _snapshot
 * @returns {Real}
 */
function firebase_database_snapshot_release(_snapshot)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_database_snapshot_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_database_ref_key(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_ref_key(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_is_root(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_ref_is_root(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_is_valid(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_ref_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_get_parent(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_get_parent(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_get_root(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_get_root(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_get_database(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_get_database(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_database_ref_get_url(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_ref_get_url(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @returns {Any}
 */
function firebase_database_server_timestamp()
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseDatabase_get_decoders();

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_server_timestamp(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_on_disconnect(_ref)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_on_disconnect(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _handler
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_database_on_disconnect_cancel(_handler, _callback)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseDatabase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _handler, type: UInt64
    if (!is_numeric(_handler)) show_error($"{_GMFUNCTION_} :: _handler expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _handler);

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

    var __return_value__ = __firebase_database_on_disconnect_cancel(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _handler
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_database_on_disconnect_remove_value(_handler, _callback)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseDatabase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _handler, type: UInt64
    if (!is_numeric(_handler)) show_error($"{_GMFUNCTION_} :: _handler expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _handler);

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

    var __return_value__ = __firebase_database_on_disconnect_remove_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _handler
 * @param {Any} _value
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_database_on_disconnect_set_value(_handler, _value, _callback)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseDatabase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _handler, type: UInt64
    if (!is_numeric(_handler)) show_error($"{_GMFUNCTION_} :: _handler expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _handler);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

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

    var __return_value__ = __firebase_database_on_disconnect_set_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _handler
 * @param {Any} _value
 * @param {Any} _priority
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_database_on_disconnect_set_value_and_priority(_handler, _value, _priority, _callback)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseDatabase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _handler, type: UInt64
    if (!is_numeric(_handler)) show_error($"{_GMFUNCTION_} :: _handler expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _handler);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    // param: _priority, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _priority);

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

    var __return_value__ = __firebase_database_on_disconnect_set_value_and_priority(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _handler
 * @param {Any} _values
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_database_on_disconnect_update_children(_handler, _values, _callback)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseDatabase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _handler, type: UInt64
    if (!is_numeric(_handler)) show_error($"{_GMFUNCTION_} :: _handler expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _handler);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

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

    var __return_value__ = __firebase_database_on_disconnect_update_children(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _handler
 */
function firebase_database_on_disconnect_release(_handler)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _handler, type: UInt64
    if (!is_numeric(_handler)) show_error($"{_GMFUNCTION_} :: _handler expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _handler);

    var __return_value__ = __firebase_database_on_disconnect_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _database
 * @returns {Real}
 */
function firebase_database_get_app(_database)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _database, type: UInt64
    if (!is_numeric(_database)) show_error($"{_GMFUNCTION_} :: _database expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _database);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_get_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @returns {Real}
 */
function firebase_database_get_instance_for_app(_app)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_get_instance_for_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @param {String} _url
 * @returns {Real}
 */
function firebase_database_get_instance_for_app_url(_app, _url)
{
    var __available__ = __GMFirebaseDatabase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    // param: _url, type: String
    if (!is_string(_url)) show_error($"{_GMFUNCTION_} :: _url expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_url));
    buffer_write(__args_buffer__, buffer_string, _url);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_get_instance_for_app_url(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/// @ignore
function __GMFirebaseDatabase_get_decoders()
{
    static __decoders__ = [
        __FirebaseDatabaseReferenceInfo_decode,
        __FirebaseDataSnapshotInfo_decode
    ];
    return __decoders__;
}
/// @ignore
function __GMFirebaseDatabase_get_dispatcher()
{
    static __dispatcher__ = new __GMNativeFunctionDispatcher(__GMFirebaseDatabase_invocation_handler, __GMFirebaseDatabase_get_decoders());
    return __dispatcher__;
}
/// @ignore
function __GMFirebaseDatabase_is_available()
{
    static __available__ = extension_exists("GMFirebaseDatabase");
    return __available__;
}
