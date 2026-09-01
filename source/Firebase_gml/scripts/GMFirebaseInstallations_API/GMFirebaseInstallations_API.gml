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
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_installations_get_id(_callback)
{
    var __available__ = __GMFirebaseInstallations_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseInstallations_get_dispatcher();

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

    var __return_value__ = __firebase_installations_get_id(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _force_refresh
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_installations_get_token(_force_refresh, _callback)
{
    var __available__ = __GMFirebaseInstallations_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseInstallations_get_dispatcher();

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

    var __return_value__ = __firebase_installations_get_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_installations_delete(_callback)
{
    var __available__ = __GMFirebaseInstallations_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseInstallations_get_dispatcher();

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

    var __return_value__ = __firebase_installations_delete(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @returns {Real}
 */
function firebase_installations_get_app()
{
    var __available__ = __GMFirebaseInstallations_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_installations_get_app(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @returns {Real}
 */
function firebase_installations_get_instance_handle()
{
    var __available__ = __GMFirebaseInstallations_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_installations_get_instance_handle(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @returns {Real}
 */
function firebase_installations_get_instance_for_app(_app)
{
    var __available__ = __GMFirebaseInstallations_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_installations_get_instance_for_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _installations
 * @returns {Real}
 */
function firebase_installations_instance_get_app(_installations)
{
    var __available__ = __GMFirebaseInstallations_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _installations, type: UInt64
    if (!is_numeric(_installations)) show_error($"{_GMFUNCTION_} :: _installations expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _installations);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_installations_instance_get_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _installations
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_installations_instance_get_id(_installations, _callback)
{
    var __available__ = __GMFirebaseInstallations_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseInstallations_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _installations, type: UInt64
    if (!is_numeric(_installations)) show_error($"{_GMFUNCTION_} :: _installations expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _installations);

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

    var __return_value__ = __firebase_installations_instance_get_id(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _installations
 * @param {Bool} _force_refresh
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_installations_instance_get_token(_installations, _force_refresh, _callback)
{
    var __available__ = __GMFirebaseInstallations_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseInstallations_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _installations, type: UInt64
    if (!is_numeric(_installations)) show_error($"{_GMFUNCTION_} :: _installations expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _installations);

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

    var __return_value__ = __firebase_installations_instance_get_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _installations
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_installations_instance_delete(_installations, _callback)
{
    var __available__ = __GMFirebaseInstallations_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseInstallations_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _installations, type: UInt64
    if (!is_numeric(_installations)) show_error($"{_GMFUNCTION_} :: _installations expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _installations);

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

    var __return_value__ = __firebase_installations_instance_delete(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/// @ignore
function __GMFirebaseInstallations_get_decoders()
{
    static __decoders__ = [];
    return __decoders__;
}
/// @ignore
function __GMFirebaseInstallations_get_dispatcher()
{
    static __dispatcher__ = new __GMNativeFunctionDispatcher(__GMFirebaseInstallations_invocation_handler, __GMFirebaseInstallations_get_decoders());
    return __dispatcher__;
}
/// @ignore
function __GMFirebaseInstallations_is_available()
{
    static __available__ = extension_exists("GMFirebaseInstallations");
    return __available__;
}
