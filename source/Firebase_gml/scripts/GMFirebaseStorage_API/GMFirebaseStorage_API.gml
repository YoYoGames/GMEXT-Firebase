// ##### extgen :: Auto-generated file do not edit!! #####

// #####################################################################
// # Macros
// #####################################################################

// #####################################################################
// # Enums
// #####################################################################

// #####################################################################
// # Constructors
// #####################################################################

// #####################################################################
// # Codecs
// #####################################################################

// #####################################################################
// # Functions
// #####################################################################

/**
 * @returns {Real}
 */
function firebase_storage_get_instance()
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_get_instance(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _url
 * @returns {Real}
 */
function firebase_storage_get_instance_with_url(_url)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_get_instance_with_url(_url, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _storage_ref
 * @returns {String}
 */
function firebase_storage_url(_storage_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    var __return_value__ = __firebase_storage_url(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _storage_ref
 * @returns {Real}
 */
function firebase_storage_get_reference(_storage_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_get_reference(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _storage_ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_storage_get_reference_path(_storage_ref, _path)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    // param: _path, type: String
    if (!is_string(_path)) show_error($"{_GMFUNCTION_} :: _path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_path));
    buffer_write(__args_buffer__, buffer_string, _path);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_get_reference_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _storage_ref
 * @param {String} _url
 * @returns {Real}
 */
function firebase_storage_get_reference_from_url(_storage_ref, _url)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    // param: _url, type: String
    if (!is_string(_url)) show_error($"{_GMFUNCTION_} :: _url expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_url));
    buffer_write(__args_buffer__, buffer_string, _url);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_get_reference_from_url(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _storage_ref
 * @returns {Real}
 */
function firebase_storage_max_download_retry_time(_storage_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    var __return_value__ = __firebase_storage_max_download_retry_time(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _storage_ref
 * @param {Real} _seconds
 */
function firebase_storage_set_max_download_retry_time(_storage_ref, _seconds)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    // param: _seconds, type: Float64
    if (!is_numeric(_seconds)) show_error($"{_GMFUNCTION_} :: _seconds expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _seconds);

    var __return_value__ = __firebase_storage_set_max_download_retry_time(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _storage_ref
 * @returns {Real}
 */
function firebase_storage_max_upload_retry_time(_storage_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    var __return_value__ = __firebase_storage_max_upload_retry_time(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _storage_ref
 * @param {Real} _seconds
 */
function firebase_storage_set_max_upload_retry_time(_storage_ref, _seconds)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    // param: _seconds, type: Float64
    if (!is_numeric(_seconds)) show_error($"{_GMFUNCTION_} :: _seconds expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _seconds);

    var __return_value__ = __firebase_storage_set_max_upload_retry_time(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _storage_ref
 * @returns {Real}
 */
function firebase_storage_max_operation_retry_time(_storage_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    var __return_value__ = __firebase_storage_max_operation_retry_time(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _storage_ref
 * @param {Real} _seconds
 */
function firebase_storage_set_max_operation_retry_time(_storage_ref, _seconds)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    // param: _seconds, type: Float64
    if (!is_numeric(_seconds)) show_error($"{_GMFUNCTION_} :: _seconds expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _seconds);

    var __return_value__ = __firebase_storage_set_max_operation_retry_time(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _storage_ref
 * @param {String} _host
 * @param {Real} _port
 */
function firebase_storage_use_emulator(_storage_ref, _host, _port)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    // param: _host, type: String
    if (!is_string(_host)) show_error($"{_GMFUNCTION_} :: _host expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_host));
    buffer_write(__args_buffer__, buffer_string, _host);

    // param: _port, type: Float64
    if (!is_numeric(_port)) show_error($"{_GMFUNCTION_} :: _port expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _port);

    var __return_value__ = __firebase_storage_use_emulator(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_storage_ref_child(_ref, _path)
{
    var __available__ = __GMFirebaseStorage_is_available();
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

    var __return_value__ = __firebase_storage_ref_child(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_ref_get_parent(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_ref_get_parent(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_ref_bucket(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_ref_bucket(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_ref_full_path(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_ref_full_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_ref_name(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_ref_name(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_ref_is_valid(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_ref_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_ref_storage(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_ref_storage(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_storage_ref_delete(_ref, _callback)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseStorage_get_dispatcher();

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

    var __return_value__ = __firebase_storage_ref_delete(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_storage_ref_get_download_url(_ref, _callback)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseStorage_get_dispatcher();

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

    var __return_value__ = __firebase_storage_ref_get_download_url(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_storage_ref_get_metadata(_ref, _callback)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseStorage_get_dispatcher();

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

    var __return_value__ = __firebase_storage_ref_get_metadata(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Real} _metadata_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_storage_ref_update_metadata(_ref, _metadata_ref, _callback)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseStorage_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _metadata_ref, type: UInt64
    if (!is_numeric(_metadata_ref)) show_error($"{_GMFUNCTION_} :: _metadata_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _metadata_ref);

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

    var __return_value__ = __firebase_storage_ref_update_metadata(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Id.Buffer} _data
 * @param {Real} _metadata_ref
 * @param {Function} _progress_callback
 * @param {Real} _controller_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_storage_ref_put_bytes(_ref, _data, _metadata_ref, _progress_callback, _controller_ref, _callback)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseStorage_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _data, type: Buffer
    if (!buffer_exists(_data)) show_error($"{_GMFUNCTION_} :: _data expected Id.Buffer", true);
    __GMFirebaseStorage_queue_buffer(buffer_get_address(_data), buffer_get_size(_data));

    // param: _metadata_ref, type: UInt64
    if (!is_numeric(_metadata_ref)) show_error($"{_GMFUNCTION_} :: _metadata_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _metadata_ref);

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

    // param: _controller_ref, type: UInt64
    if (!is_numeric(_controller_ref)) show_error($"{_GMFUNCTION_} :: _controller_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _controller_ref);

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

    var __return_value__ = __firebase_storage_ref_put_bytes(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _local_path
 * @param {Real} _metadata_ref
 * @param {Function} _progress_callback
 * @param {Real} _controller_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_storage_ref_put_file(_ref, _local_path, _metadata_ref, _progress_callback, _controller_ref, _callback)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseStorage_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _local_path, type: String
    if (!is_string(_local_path)) show_error($"{_GMFUNCTION_} :: _local_path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_local_path));
    buffer_write(__args_buffer__, buffer_string, _local_path);

    // param: _metadata_ref, type: UInt64
    if (!is_numeric(_metadata_ref)) show_error($"{_GMFUNCTION_} :: _metadata_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _metadata_ref);

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

    // param: _controller_ref, type: UInt64
    if (!is_numeric(_controller_ref)) show_error($"{_GMFUNCTION_} :: _controller_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _controller_ref);

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

    var __return_value__ = __firebase_storage_ref_put_file(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Id.Buffer} _data
 * @param {Function} _progress_callback
 * @param {Real} _controller_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_storage_ref_get_bytes(_ref, _data, _progress_callback, _controller_ref, _callback)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseStorage_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _data, type: Buffer
    if (!buffer_exists(_data)) show_error($"{_GMFUNCTION_} :: _data expected Id.Buffer", true);
    __GMFirebaseStorage_queue_buffer(buffer_get_address(_data), buffer_get_size(_data));

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

    // param: _controller_ref, type: UInt64
    if (!is_numeric(_controller_ref)) show_error($"{_GMFUNCTION_} :: _controller_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _controller_ref);

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

    var __return_value__ = __firebase_storage_ref_get_bytes(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _local_path
 * @param {Function} _progress_callback
 * @param {Real} _controller_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_storage_ref_get_file(_ref, _local_path, _progress_callback, _controller_ref, _callback)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseStorage_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _local_path, type: String
    if (!is_string(_local_path)) show_error($"{_GMFUNCTION_} :: _local_path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_local_path));
    buffer_write(__args_buffer__, buffer_string, _local_path);

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

    // param: _controller_ref, type: UInt64
    if (!is_numeric(_controller_ref)) show_error($"{_GMFUNCTION_} :: _controller_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _controller_ref);

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

    var __return_value__ = __firebase_storage_ref_get_file(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Real} _max_results
 * @param {String} _page_token
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_storage_ref_list(_ref, _max_results, _page_token, _callback)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseStorage_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _max_results, type: Float64
    if (!is_numeric(_max_results)) show_error($"{_GMFUNCTION_} :: _max_results expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _max_results);

    // param: _page_token, type: String
    if (!is_string(_page_token)) show_error($"{_GMFUNCTION_} :: _page_token expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_page_token));
    buffer_write(__args_buffer__, buffer_string, _page_token);

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

    var __return_value__ = __firebase_storage_ref_list(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @returns {Real}
 */
function firebase_storage_metadata_create()
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_metadata_create(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_metadata_release(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_metadata_is_valid(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_metadata_bucket(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_bucket(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_metadata_cache_control(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_cache_control(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _value
 */
function firebase_storage_metadata_set_cache_control(_ref, _value)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _value, type: String
    if (!is_string(_value)) show_error($"{_GMFUNCTION_} :: _value expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_value));
    buffer_write(__args_buffer__, buffer_string, _value);

    var __return_value__ = __firebase_storage_metadata_set_cache_control(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_metadata_content_disposition(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_content_disposition(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _value
 */
function firebase_storage_metadata_set_content_disposition(_ref, _value)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _value, type: String
    if (!is_string(_value)) show_error($"{_GMFUNCTION_} :: _value expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_value));
    buffer_write(__args_buffer__, buffer_string, _value);

    var __return_value__ = __firebase_storage_metadata_set_content_disposition(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_metadata_content_encoding(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_content_encoding(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _value
 */
function firebase_storage_metadata_set_content_encoding(_ref, _value)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _value, type: String
    if (!is_string(_value)) show_error($"{_GMFUNCTION_} :: _value expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_value));
    buffer_write(__args_buffer__, buffer_string, _value);

    var __return_value__ = __firebase_storage_metadata_set_content_encoding(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_metadata_content_language(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_content_language(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _value
 */
function firebase_storage_metadata_set_content_language(_ref, _value)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _value, type: String
    if (!is_string(_value)) show_error($"{_GMFUNCTION_} :: _value expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_value));
    buffer_write(__args_buffer__, buffer_string, _value);

    var __return_value__ = __firebase_storage_metadata_set_content_language(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_metadata_content_type(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_content_type(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _value
 */
function firebase_storage_metadata_set_content_type(_ref, _value)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _value, type: String
    if (!is_string(_value)) show_error($"{_GMFUNCTION_} :: _value expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_value));
    buffer_write(__args_buffer__, buffer_string, _value);

    var __return_value__ = __firebase_storage_metadata_set_content_type(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_metadata_creation_time(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_creation_time(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_metadata_generation(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_generation(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_metadata_metadata_generation(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_metadata_generation(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_metadata_name(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_name(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_metadata_path(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_metadata_get_reference(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_metadata_get_reference(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_metadata_size_bytes(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_size_bytes(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_metadata_updated_time(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_updated_time(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_metadata_custom_metadata_count(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_custom_metadata_count(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Real} _index
 * @returns {String}
 */
function firebase_storage_metadata_custom_metadata_key_at(_ref, _index)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _index, type: Float64
    if (!is_numeric(_index)) show_error($"{_GMFUNCTION_} :: _index expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _index);

    var __return_value__ = __firebase_storage_metadata_custom_metadata_key_at(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _key
 * @returns {String}
 */
function firebase_storage_metadata_get_custom_metadata(_ref, _key)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    var __return_value__ = __firebase_storage_metadata_get_custom_metadata(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _key
 * @param {String} _value
 */
function firebase_storage_metadata_set_custom_metadata(_ref, _key, _value)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    // param: _value, type: String
    if (!is_string(_value)) show_error($"{_GMFUNCTION_} :: _value expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_value));
    buffer_write(__args_buffer__, buffer_string, _value);

    var __return_value__ = __firebase_storage_metadata_set_custom_metadata(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @returns {Real}
 */
function firebase_storage_controller_create()
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_controller_create(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_controller_release(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_controller_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_controller_is_valid(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_controller_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_controller_pause(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_controller_pause(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_controller_resume(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_controller_resume(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_controller_cancel(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_controller_cancel(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_controller_is_paused(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_controller_is_paused(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_controller_bytes_transferred(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_controller_bytes_transferred(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_controller_total_byte_count(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_controller_total_byte_count(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_controller_get_reference(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_controller_get_reference(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_list_result_release(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_list_result_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_list_result_is_valid(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_list_result_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_list_result_item_count(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_list_result_item_count(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Real} _index
 * @returns {Real}
 */
function firebase_storage_list_result_item_at(_ref, _index)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _index, type: Float64
    if (!is_numeric(_index)) show_error($"{_GMFUNCTION_} :: _index expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _index);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_list_result_item_at(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_list_result_prefix_count(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_list_result_prefix_count(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Real} _index
 * @returns {Real}
 */
function firebase_storage_list_result_prefix_at(_ref, _index)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _index, type: Float64
    if (!is_numeric(_index)) show_error($"{_GMFUNCTION_} :: _index expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _index);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_list_result_prefix_at(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_list_result_next_page_token(_ref)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_list_result_next_page_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _metadata
 * @returns {String}
 */
function firebase_storage_metadata_md5_hash(_metadata)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _metadata, type: UInt64
    if (!is_numeric(_metadata)) show_error($"{_GMFUNCTION_} :: _metadata expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _metadata);

    var __return_value__ = __firebase_storage_metadata_md5_hash(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _storage
 * @returns {Real}
 */
function firebase_storage_get_app(_storage)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage, type: UInt64
    if (!is_numeric(_storage)) show_error($"{_GMFUNCTION_} :: _storage expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_get_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @returns {Real}
 */
function firebase_storage_get_instance_for_app(_app)
{
    var __available__ = __GMFirebaseStorage_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_get_instance_for_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @param {String} _url
 * @returns {Real}
 */
function firebase_storage_get_instance_for_app_url(_app, _url)
{
    var __available__ = __GMFirebaseStorage_is_available();
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

    var __return_value__ = __firebase_storage_get_instance_for_app_url(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/// @ignore
function __GMFirebaseStorage_get_decoders()
{
    static __decoders__ = [];
    return __decoders__;
}
/// @ignore
function __GMFirebaseStorage_get_dispatcher()
{
    static __dispatcher__ = new __GMNativeFunctionDispatcher(__GMFirebaseStorage_invocation_handler, __GMFirebaseStorage_get_decoders());
    return __dispatcher__;
}
/// @ignore
function __GMFirebaseStorage_is_available()
{
    static __available__ = extension_exists("GMFirebaseStorage");
    return __available__;
}
