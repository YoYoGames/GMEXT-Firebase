// ##### extgen :: Auto-generated file do not edit!! #####

// #####################################################################
// # Macros
// #####################################################################

// #####################################################################
// # Enums
// #####################################################################

enum FirebaseRemoteConfigLastFetchStatus
{
    Success = 0,
    Failure = 1,
    Pending = 2
}

enum FirebaseRemoteConfigFetchFailureReason
{
    Invalid = 0,
    Throttled = 1,
    Error = 2
}

// #####################################################################
// # Constructors
// #####################################################################

/**
 * @returns {Struct.FirebaseRemoteConfigInfo}
 */
function FirebaseRemoteConfigInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 3905783408;

    self.fetch_time = undefined;
    self.last_fetch_status = undefined;
    self.last_fetch_failure_reason = undefined;
    self.throttled_end_time = undefined;

}

// #####################################################################
// # Codecs
// #####################################################################

/**
 * @func __FirebaseRemoteConfigInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseRemoteConfigInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseRemoteConfigInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: fetch_time, type: Float64
        if (!is_numeric(self.fetch_time)) show_error($"{_where} :: self.fetch_time expected number", true);
        buffer_write(_buffer, buffer_f64, self.fetch_time);

        // field: last_fetch_status, type: Float64
        if (!is_numeric(self.last_fetch_status)) show_error($"{_where} :: self.last_fetch_status expected number", true);
        buffer_write(_buffer, buffer_f64, self.last_fetch_status);

        // field: last_fetch_failure_reason, type: Float64
        if (!is_numeric(self.last_fetch_failure_reason)) show_error($"{_where} :: self.last_fetch_failure_reason expected number", true);
        buffer_write(_buffer, buffer_f64, self.last_fetch_failure_reason);

        // field: throttled_end_time, type: Float64
        if (!is_numeric(self.throttled_end_time)) show_error($"{_where} :: self.throttled_end_time expected number", true);
        buffer_write(_buffer, buffer_f64, self.throttled_end_time);

    }
}

/**
 * @func __FirebaseRemoteConfigInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseRemoteConfigInfo}
 * @ignore
 */
function __FirebaseRemoteConfigInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseRemoteConfigInfo();
    with (_inst)
    {
        // field: fetch_time, type: Float64
        self.fetch_time = buffer_read(_buffer, buffer_f64);

        // field: last_fetch_status, type: Float64
        self.last_fetch_status = buffer_read(_buffer, buffer_f64);

        // field: last_fetch_failure_reason, type: Float64
        self.last_fetch_failure_reason = buffer_read(_buffer, buffer_f64);

        // field: throttled_end_time, type: Float64
        self.throttled_end_time = buffer_read(_buffer, buffer_f64);

    }

    return _inst;
}

// #####################################################################
// # Functions
// #####################################################################

/**
 * @returns {Real}
 */
function firebase_remote_config_get_instance()
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_get_instance(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_remote_config_ensure_initialized(_rc_ref, _callback)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseRemoteConfig_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

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

    var __return_value__ = __firebase_remote_config_ensure_initialized(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {Real} _fetch_timeout_ms
 * @param {Real} _minimum_fetch_interval_ms
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_remote_config_set_config_settings(_rc_ref, _fetch_timeout_ms, _minimum_fetch_interval_ms, _callback)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseRemoteConfig_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _fetch_timeout_ms, type: Float64
    if (!is_numeric(_fetch_timeout_ms)) show_error($"{_GMFUNCTION_} :: _fetch_timeout_ms expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _fetch_timeout_ms);

    // param: _minimum_fetch_interval_ms, type: Float64
    if (!is_numeric(_minimum_fetch_interval_ms)) show_error($"{_GMFUNCTION_} :: _minimum_fetch_interval_ms expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _minimum_fetch_interval_ms);

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

    var __return_value__ = __firebase_remote_config_set_config_settings(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @returns {Real}
 */
function firebase_remote_config_get_config_settings_fetch_timeout(_rc_ref)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    var __return_value__ = __firebase_remote_config_get_config_settings_fetch_timeout(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @returns {Real}
 */
function firebase_remote_config_get_config_settings_minimum_fetch_interval(_rc_ref)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    var __return_value__ = __firebase_remote_config_get_config_settings_minimum_fetch_interval(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_remote_config_fetch(_rc_ref, _callback)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseRemoteConfig_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

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

    var __return_value__ = __firebase_remote_config_fetch(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {Real} _cache_expiration_in_seconds
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_remote_config_fetch_with_expiration(_rc_ref, _cache_expiration_in_seconds, _callback)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseRemoteConfig_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _cache_expiration_in_seconds, type: Float64
    if (!is_numeric(_cache_expiration_in_seconds)) show_error($"{_GMFUNCTION_} :: _cache_expiration_in_seconds expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _cache_expiration_in_seconds);

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

    var __return_value__ = __firebase_remote_config_fetch_with_expiration(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_remote_config_fetch_and_activate(_rc_ref, _callback)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseRemoteConfig_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

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

    var __return_value__ = __firebase_remote_config_fetch_and_activate(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_remote_config_activate(_rc_ref, _callback)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseRemoteConfig_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

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

    var __return_value__ = __firebase_remote_config_activate(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @returns {Real}
 */
function firebase_remote_config_get_boolean(_rc_ref, _key)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    var __return_value__ = __firebase_remote_config_get_boolean(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @returns {Real}
 */
function firebase_remote_config_get_long(_rc_ref, _key)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    var __return_value__ = __firebase_remote_config_get_long(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @returns {Real}
 */
function firebase_remote_config_get_double(_rc_ref, _key)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    var __return_value__ = __firebase_remote_config_get_double(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @returns {String}
 */
function firebase_remote_config_get_string(_rc_ref, _key)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    var __return_value__ = __firebase_remote_config_get_string(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @returns {Real}
 */
function firebase_remote_config_get_data_size(_rc_ref, _key)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    var __return_value__ = __firebase_remote_config_get_data_size(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @param {Id.Buffer} _out_buffer
 * @returns {Real}
 */
function firebase_remote_config_get_data(_rc_ref, _key, _out_buffer)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    // param: _out_buffer, type: Buffer
    if (!buffer_exists(_out_buffer)) show_error($"{_GMFUNCTION_} :: _out_buffer expected Id.Buffer", true);
    __GMFirebaseRemoteConfig_queue_buffer(buffer_get_address(_out_buffer), buffer_get_size(_out_buffer));

    var __return_value__ = __firebase_remote_config_get_data(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _prefix
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_remote_config_get_keys_by_prefix(_rc_ref, _prefix, _callback)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseRemoteConfig_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _prefix, type: String
    if (!is_string(_prefix)) show_error($"{_GMFUNCTION_} :: _prefix expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_prefix));
    buffer_write(__args_buffer__, buffer_string, _prefix);

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

    var __return_value__ = __firebase_remote_config_get_keys_by_prefix(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_remote_config_get_keys(_rc_ref, _callback)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseRemoteConfig_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

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

    var __return_value__ = __firebase_remote_config_get_keys(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_remote_config_get_all(_rc_ref, _callback)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseRemoteConfig_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

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

    var __return_value__ = __firebase_remote_config_get_all(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {Any} _defaults
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_remote_config_set_defaults(_rc_ref, _defaults, _callback)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseRemoteConfig_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _defaults, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _defaults);

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

    var __return_value__ = __firebase_remote_config_set_defaults(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @returns {Struct.FirebaseRemoteConfigInfo}
 */
function firebase_remote_config_get_info(_rc_ref)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_get_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __FirebaseRemoteConfigInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_remote_config_add_config_update_listener(_rc_ref, _callback)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseRemoteConfig_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

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

    var __return_value__ = __firebase_remote_config_add_config_update_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _reg_ref
 * @returns {Real}
 */
function firebase_remote_config_remove_config_update_listener(_reg_ref)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _reg_ref, type: UInt64
    if (!is_numeric(_reg_ref)) show_error($"{_GMFUNCTION_} :: _reg_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _reg_ref);

    var __return_value__ = __firebase_remote_config_remove_config_update_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_remote_config_ensure_initialized_info(_rc_ref, _callback)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseRemoteConfig_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

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

    var __return_value__ = __firebase_remote_config_ensure_initialized_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @returns {Any}
 */
function firebase_remote_config_get_boolean_with_info(_rc_ref, _key)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseRemoteConfig_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_get_boolean_with_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @returns {Any}
 */
function firebase_remote_config_get_long_with_info(_rc_ref, _key)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseRemoteConfig_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_get_long_with_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @returns {Any}
 */
function firebase_remote_config_get_double_with_info(_rc_ref, _key)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseRemoteConfig_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_get_double_with_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @returns {Any}
 */
function firebase_remote_config_get_string_with_info(_rc_ref, _key)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseRemoteConfig_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_get_string_with_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @param {Id.Buffer} _out_buffer
 * @returns {Any}
 */
function firebase_remote_config_get_data_with_info(_rc_ref, _key, _out_buffer)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseRemoteConfig_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    // param: _out_buffer, type: Buffer
    if (!buffer_exists(_out_buffer)) show_error($"{_GMFUNCTION_} :: _out_buffer expected Id.Buffer", true);
    __GMFirebaseRemoteConfig_queue_buffer(buffer_get_address(_out_buffer), buffer_get_size(_out_buffer));

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_get_data_with_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _remote_config
 * @returns {Real}
 */
function firebase_remote_config_get_app(_remote_config)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _remote_config, type: UInt64
    if (!is_numeric(_remote_config)) show_error($"{_GMFUNCTION_} :: _remote_config expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _remote_config);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_get_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @returns {Real}
 */
function firebase_remote_config_get_instance_for_app(_app)
{
    var __available__ = __GMFirebaseRemoteConfig_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_get_instance_for_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/// @ignore
function __GMFirebaseRemoteConfig_get_decoders()
{
    static __decoders__ = [
        __FirebaseRemoteConfigInfo_decode
    ];
    return __decoders__;
}
/// @ignore
function __GMFirebaseRemoteConfig_get_dispatcher()
{
    static __dispatcher__ = new __GMNativeFunctionDispatcher(__GMFirebaseRemoteConfig_invocation_handler, __GMFirebaseRemoteConfig_get_decoders());
    return __dispatcher__;
}
/// @ignore
function __GMFirebaseRemoteConfig_is_available()
{
    static __available__ = extension_exists("GMFirebaseRemoteConfig");
    return __available__;
}
