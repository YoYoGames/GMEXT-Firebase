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
function firebase_functions_get_instance()
{
    var __available__ = __GMFirebaseFunctions_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_get_instance(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _region
 * @returns {Real}
 */
function firebase_functions_get_instance_with_region(_region)
{
    var __available__ = __GMFirebaseFunctions_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_get_instance_with_region(_region, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _functions_ref
 * @param {String} _origin
 */
function firebase_functions_use_functions_emulator(_functions_ref, _origin)
{
    var __available__ = __GMFirebaseFunctions_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _functions_ref, type: UInt64
    if (!is_numeric(_functions_ref)) show_error($"{_GMFUNCTION_} :: _functions_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _functions_ref);

    // param: _origin, type: String
    if (!is_string(_origin)) show_error($"{_GMFUNCTION_} :: _origin expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_origin));
    buffer_write(__args_buffer__, buffer_string, _origin);

    var __return_value__ = __firebase_functions_use_functions_emulator(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _functions_ref
 * @param {String} _name
 * @returns {Real}
 */
function firebase_functions_get_https_callable(_functions_ref, _name)
{
    var __available__ = __GMFirebaseFunctions_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _functions_ref, type: UInt64
    if (!is_numeric(_functions_ref)) show_error($"{_GMFUNCTION_} :: _functions_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _functions_ref);

    // param: _name, type: String
    if (!is_string(_name)) show_error($"{_GMFUNCTION_} :: _name expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_name));
    buffer_write(__args_buffer__, buffer_string, _name);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_get_https_callable(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _functions_ref
 * @param {String} _name
 * @param {Real} _limited_use_app_check_token
 * @returns {Real}
 */
function firebase_functions_get_https_callable_with_options(_functions_ref, _name, _limited_use_app_check_token)
{
    var __available__ = __GMFirebaseFunctions_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _functions_ref, type: UInt64
    if (!is_numeric(_functions_ref)) show_error($"{_GMFUNCTION_} :: _functions_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _functions_ref);

    // param: _name, type: String
    if (!is_string(_name)) show_error($"{_GMFUNCTION_} :: _name expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_name));
    buffer_write(__args_buffer__, buffer_string, _name);

    // param: _limited_use_app_check_token, type: Float64
    if (!is_numeric(_limited_use_app_check_token)) show_error($"{_GMFUNCTION_} :: _limited_use_app_check_token expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _limited_use_app_check_token);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_get_https_callable_with_options(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _functions_ref
 * @param {String} _url
 * @returns {Real}
 */
function firebase_functions_get_https_callable_from_url(_functions_ref, _url)
{
    var __available__ = __GMFirebaseFunctions_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _functions_ref, type: UInt64
    if (!is_numeric(_functions_ref)) show_error($"{_GMFUNCTION_} :: _functions_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _functions_ref);

    // param: _url, type: String
    if (!is_string(_url)) show_error($"{_GMFUNCTION_} :: _url expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_url));
    buffer_write(__args_buffer__, buffer_string, _url);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_get_https_callable_from_url(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _functions_ref
 * @param {String} _url
 * @param {Real} _limited_use_app_check_token
 * @returns {Real}
 */
function firebase_functions_get_https_callable_from_url_with_options(_functions_ref, _url, _limited_use_app_check_token)
{
    var __available__ = __GMFirebaseFunctions_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _functions_ref, type: UInt64
    if (!is_numeric(_functions_ref)) show_error($"{_GMFUNCTION_} :: _functions_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _functions_ref);

    // param: _url, type: String
    if (!is_string(_url)) show_error($"{_GMFUNCTION_} :: _url expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_url));
    buffer_write(__args_buffer__, buffer_string, _url);

    // param: _limited_use_app_check_token, type: Float64
    if (!is_numeric(_limited_use_app_check_token)) show_error($"{_GMFUNCTION_} :: _limited_use_app_check_token expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _limited_use_app_check_token);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_get_https_callable_from_url_with_options(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_functions_callable_is_valid(_ref)
{
    var __available__ = __GMFirebaseFunctions_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_functions_callable_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_functions_callable_call(_ref, _callback)
{
    var __available__ = __GMFirebaseFunctions_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFunctions_get_dispatcher();

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

    var __return_value__ = __firebase_functions_callable_call(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Any} _data
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_functions_callable_call_with_data(_ref, _data, _callback)
{
    var __available__ = __GMFirebaseFunctions_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseFunctions_get_dispatcher();

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

    var __return_value__ = __firebase_functions_callable_call_with_data(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _functions
 * @returns {Real}
 */
function firebase_functions_get_app(_functions)
{
    var __available__ = __GMFirebaseFunctions_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _functions, type: UInt64
    if (!is_numeric(_functions)) show_error($"{_GMFUNCTION_} :: _functions expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _functions);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_get_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _callable
 * @returns {Real}
 */
function firebase_functions_callable_get_functions(_callable)
{
    var __available__ = __GMFirebaseFunctions_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callable, type: UInt64
    if (!is_numeric(_callable)) show_error($"{_GMFUNCTION_} :: _callable expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _callable);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_callable_get_functions(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @returns {Real}
 */
function firebase_functions_get_instance_for_app(_app)
{
    var __available__ = __GMFirebaseFunctions_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_get_instance_for_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @param {String} _region
 * @returns {Real}
 */
function firebase_functions_get_instance_for_app_region(_app, _region)
{
    var __available__ = __GMFirebaseFunctions_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    // param: _region, type: String
    if (!is_string(_region)) show_error($"{_GMFUNCTION_} :: _region expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_region));
    buffer_write(__args_buffer__, buffer_string, _region);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_get_instance_for_app_region(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/// @ignore
function __GMFirebaseFunctions_get_decoders()
{
    static __decoders__ = [];
    return __decoders__;
}
/// @ignore
function __GMFirebaseFunctions_get_dispatcher()
{
    static __dispatcher__ = new __GMNativeFunctionDispatcher(__GMFirebaseFunctions_invocation_handler, __GMFirebaseFunctions_get_decoders());
    return __dispatcher__;
}
/// @ignore
function __GMFirebaseFunctions_is_available()
{
    static __available__ = extension_exists("GMFirebaseFunctions");
    return __available__;
}
