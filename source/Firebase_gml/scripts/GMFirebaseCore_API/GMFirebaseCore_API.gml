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

// Skipping function firebase_app_initialize (no wrapper is required)


// Skipping function firebase_app_is_initialized (no wrapper is required)


// Skipping function firebase_app_get_name (no wrapper is required)


// Skipping function firebase_last_error_code (no wrapper is required)


// Skipping function firebase_last_error_message (no wrapper is required)


/**
 * @returns {Real}
 */
function firebase_app_get_default_handle()
{
    var __available__ = __GMFirebaseCore_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_get_default_handle(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _name
 * @returns {Real}
 */
function firebase_app_get_instance(_name)
{
    var __available__ = __GMFirebaseCore_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_get_instance(_name, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @returns {Any}
 */
function firebase_app_get_apps()
{
    var __available__ = __GMFirebaseCore_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseCore_get_decoders();

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_get_apps(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Any} _options
 * @param {String} _name
 * @returns {Real}
 */
function firebase_app_initialize_with_options(_options, _name)
{
    var __available__ = __GMFirebaseCore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _options, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _options);

    // param: _name, type: String
    if (!is_string(_name)) show_error($"{_GMFUNCTION_} :: _name expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_name));
    buffer_write(__args_buffer__, buffer_string, _name);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_initialize_with_options(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _json_config
 * @param {String} _name
 * @returns {Real}
 */
function firebase_app_initialize_from_json(_json_config, _name)
{
    var __available__ = __GMFirebaseCore_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_initialize_from_json(_json_config, _name, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @returns {String}
 */
function firebase_app_handle_get_name(_app)
{
    var __available__ = __GMFirebaseCore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __return_value__ = __firebase_app_handle_get_name(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _app
 * @returns {Any}
 */
function firebase_app_handle_get_options(_app)
{
    var __available__ = __GMFirebaseCore_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseCore_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_handle_get_options(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @returns {Any}
 */
function firebase_app_get_default_options()
{
    var __available__ = __GMFirebaseCore_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseCore_get_decoders();

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_get_default_options(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _app
 */
function firebase_app_release_handle(_app)
{
    var __available__ = __GMFirebaseCore_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __return_value__ = __firebase_app_release_handle(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

// Skipping function firebase_set_log_level (no wrapper is required)


// Skipping function firebase_get_log_level (no wrapper is required)


// Skipping function firebase_get_sdk_version (no wrapper is required)


/// @ignore
function __GMFirebaseCore_get_decoders()
{
    static __decoders__ = [];
    return __decoders__;
}
/// @ignore
function __GMFirebaseCore_is_available()
{
    static __available__ = extension_exists("GMFirebaseCore");
    return __available__;
}
