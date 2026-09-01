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

// Skipping function firebase_analytics_initialize (no wrapper is required)


// Skipping function firebase_analytics_terminate (no wrapper is required)


// Skipping function firebase_analytics_set_analytics_collection_enabled (no wrapper is required)


// Skipping function firebase_analytics_set_consent (no wrapper is required)


// Skipping function firebase_analytics_log_event (no wrapper is required)


// Skipping function firebase_analytics_log_event_string (no wrapper is required)


// Skipping function firebase_analytics_log_event_number (no wrapper is required)


/**
 * @param {String} _name
 * @param {Any} _params
 */
function firebase_analytics_log_event_params(_name, _params)
{
    var __available__ = __GMFirebaseAnalytics_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _name, type: String
    if (!is_string(_name)) show_error($"{_GMFUNCTION_} :: _name expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_name));
    buffer_write(__args_buffer__, buffer_string, _name);

    // param: _params, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _params);

    var __return_value__ = __firebase_analytics_log_event_params(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Any} _params
 */
function firebase_analytics_set_default_event_parameters(_params)
{
    var __available__ = __GMFirebaseAnalytics_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _params, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _params);

    var __return_value__ = __firebase_analytics_set_default_event_parameters(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _transaction_id
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_analytics_log_apple_transaction(_transaction_id, _callback)
{
    var __available__ = __GMFirebaseAnalytics_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAnalytics_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _transaction_id, type: String
    if (!is_string(_transaction_id)) show_error($"{_GMFUNCTION_} :: _transaction_id expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_transaction_id));
    buffer_write(__args_buffer__, buffer_string, _transaction_id);

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

    var __return_value__ = __firebase_analytics_log_apple_transaction(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

// Skipping function firebase_analytics_set_user_property (no wrapper is required)


// Skipping function firebase_analytics_set_user_id (no wrapper is required)


// Skipping function firebase_analytics_set_session_timeout_duration (no wrapper is required)


// Skipping function firebase_analytics_reset_analytics_data (no wrapper is required)


/**
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_analytics_get_analytics_instance_id(_callback)
{
    var __available__ = __GMFirebaseAnalytics_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAnalytics_get_dispatcher();

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

    var __return_value__ = __firebase_analytics_get_analytics_instance_id(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_analytics_get_session_id(_callback)
{
    var __available__ = __GMFirebaseAnalytics_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAnalytics_get_dispatcher();

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

    var __return_value__ = __firebase_analytics_get_session_id(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

// Skipping function firebase_analytics_notify_app_lifecycle_termination (no wrapper is required)


// Skipping function firebase_analytics_is_desktop_initialized (no wrapper is required)


// Skipping function firebase_analytics_set_desktop_debug_mode (no wrapper is required)


/**
 * @param {Function} _callback
 */
function firebase_analytics_set_log_callback(_callback)
{
    var __available__ = __GMFirebaseAnalytics_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAnalytics_get_dispatcher();

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

    var __return_value__ = __firebase_analytics_set_log_callback(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

// Skipping function firebase_analytics_initiate_on_device_conversion_measurement_email (no wrapper is required)


// Skipping function firebase_analytics_initiate_on_device_conversion_measurement_phone (no wrapper is required)


// Skipping function firebase_analytics_notify_app_lifecycle_change (no wrapper is required)


/**
 * @param {Id.Buffer} _hashed_email
 */
function firebase_analytics_initiate_on_device_conversion_measurement_hashed_email(_hashed_email)
{
    var __available__ = __GMFirebaseAnalytics_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _hashed_email, type: Buffer
    if (!buffer_exists(_hashed_email)) show_error($"{_GMFUNCTION_} :: _hashed_email expected Id.Buffer", true);
    __GMFirebaseAnalytics_queue_buffer(buffer_get_address(_hashed_email), buffer_get_size(_hashed_email));

    var __return_value__ = __firebase_analytics_initiate_on_device_conversion_measurement_hashed_email(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Id.Buffer} _hashed_phone
 */
function firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone(_hashed_phone)
{
    var __available__ = __GMFirebaseAnalytics_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _hashed_phone, type: Buffer
    if (!buffer_exists(_hashed_phone)) show_error($"{_GMFUNCTION_} :: _hashed_phone expected Id.Buffer", true);
    __GMFirebaseAnalytics_queue_buffer(buffer_get_address(_hashed_phone), buffer_get_size(_hashed_phone));

    var __return_value__ = __firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _app
 * @returns {Real}
 */
function firebase_analytics_initialize_for_app(_app)
{
    var __available__ = __GMFirebaseAnalytics_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __return_value__ = __firebase_analytics_initialize_for_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/// @ignore
function __GMFirebaseAnalytics_get_decoders()
{
    static __decoders__ = [];
    return __decoders__;
}
/// @ignore
function __GMFirebaseAnalytics_get_dispatcher()
{
    static __dispatcher__ = new __GMNativeFunctionDispatcher(__GMFirebaseAnalytics_invocation_handler, __GMFirebaseAnalytics_get_decoders());
    return __dispatcher__;
}
/// @ignore
function __GMFirebaseAnalytics_is_available()
{
    static __available__ = extension_exists("GMFirebaseAnalytics");
    return __available__;
}
