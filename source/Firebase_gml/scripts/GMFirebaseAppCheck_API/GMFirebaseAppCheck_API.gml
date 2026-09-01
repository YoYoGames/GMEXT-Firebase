// ##### extgen :: Auto-generated file do not edit!! #####

// #####################################################################
// # Macros
// #####################################################################

// #####################################################################
// # Enums
// #####################################################################

enum FirebaseAppCheckProvider
{
    Debug = 0,
    DeviceCheck = 1,
    PlayIntegrity = 2,
    AppAttest = 3
}

// #####################################################################
// # Constructors
// #####################################################################

// #####################################################################
// # Codecs
// #####################################################################

// #####################################################################
// # Functions
// #####################################################################

// Skipping function firebase_app_check_set_provider_factory (no wrapper is required)


// Skipping function firebase_app_check_debug_provider_set_debug_token (no wrapper is required)


// Skipping function firebase_app_check_set_token_auto_refresh_enabled (no wrapper is required)


/**
 * @param {Real} _force_refresh
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_app_check_get_token(_force_refresh, _callback)
{
    var __available__ = __GMFirebaseAppCheck_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAppCheck_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _force_refresh, type: Float64
    if (!is_numeric(_force_refresh)) show_error($"{_GMFUNCTION_} :: _force_refresh expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _force_refresh);

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

    var __return_value__ = __firebase_app_check_get_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_app_check_get_limited_use_token(_callback)
{
    var __available__ = __GMFirebaseAppCheck_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAppCheck_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

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

    var __return_value__ = __firebase_app_check_get_limited_use_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_app_check_add_listener(_callback)
{
    var __available__ = __GMFirebaseAppCheck_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAppCheck_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

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

    var __return_value__ = __firebase_app_check_add_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _listener_ref
 * @returns {Real}
 */
function firebase_app_check_remove_listener(_listener_ref)
{
    var __available__ = __GMFirebaseAppCheck_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _listener_ref, type: UInt64
    if (!is_numeric(_listener_ref)) show_error($"{_GMFUNCTION_} :: _listener_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _listener_ref);

    var __return_value__ = __firebase_app_check_remove_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @returns {Real}
 */
function firebase_app_check_get_app()
{
    var __available__ = __GMFirebaseAppCheck_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_check_get_app(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @returns {Real}
 */
function firebase_app_check_get_instance_handle()
{
    var __available__ = __GMFirebaseAppCheck_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_check_get_instance_handle(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @returns {Real}
 */
function firebase_app_check_get_instance_for_app(_app)
{
    var __available__ = __GMFirebaseAppCheck_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_check_get_instance_for_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app_check
 * @returns {Real}
 */
function firebase_app_check_instance_get_app(_app_check)
{
    var __available__ = __GMFirebaseAppCheck_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app_check, type: UInt64
    if (!is_numeric(_app_check)) show_error($"{_GMFUNCTION_} :: _app_check expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app_check);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_check_instance_get_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app_check
 * @param {Bool} _enabled
 */
function firebase_app_check_instance_set_token_auto_refresh_enabled(_app_check, _enabled)
{
    var __available__ = __GMFirebaseAppCheck_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app_check, type: UInt64
    if (!is_numeric(_app_check)) show_error($"{_GMFUNCTION_} :: _app_check expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app_check);

    // param: _enabled, type: Bool
    if (!is_bool(_enabled)) show_error($"{_GMFUNCTION_} :: _enabled expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _enabled);

    var __return_value__ = __firebase_app_check_instance_set_token_auto_refresh_enabled(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _app_check
 * @param {Bool} _force_refresh
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_app_check_instance_get_token(_app_check, _force_refresh, _callback)
{
    var __available__ = __GMFirebaseAppCheck_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAppCheck_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app_check, type: UInt64
    if (!is_numeric(_app_check)) show_error($"{_GMFUNCTION_} :: _app_check expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app_check);

    // param: _force_refresh, type: Bool
    if (!is_bool(_force_refresh)) show_error($"{_GMFUNCTION_} :: _force_refresh expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _force_refresh);

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

    var __return_value__ = __firebase_app_check_instance_get_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _app_check
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_app_check_instance_get_limited_use_token(_app_check, _callback)
{
    var __available__ = __GMFirebaseAppCheck_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAppCheck_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app_check, type: UInt64
    if (!is_numeric(_app_check)) show_error($"{_GMFUNCTION_} :: _app_check expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app_check);

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

    var __return_value__ = __firebase_app_check_instance_get_limited_use_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _app_check
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_app_check_instance_add_listener(_app_check, _callback)
{
    var __available__ = __GMFirebaseAppCheck_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAppCheck_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app_check, type: UInt64
    if (!is_numeric(_app_check)) show_error($"{_GMFUNCTION_} :: _app_check expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app_check);

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

    var __return_value__ = __firebase_app_check_instance_add_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/// @ignore
function __GMFirebaseAppCheck_get_decoders()
{
    static __decoders__ = [];
    return __decoders__;
}
/// @ignore
function __GMFirebaseAppCheck_get_dispatcher()
{
    static __dispatcher__ = new __GMNativeFunctionDispatcher(__GMFirebaseAppCheck_invocation_handler, __GMFirebaseAppCheck_get_decoders());
    return __dispatcher__;
}
/// @ignore
function __GMFirebaseAppCheck_is_available()
{
    static __available__ = extension_exists("GMFirebaseAppCheck");
    return __available__;
}
