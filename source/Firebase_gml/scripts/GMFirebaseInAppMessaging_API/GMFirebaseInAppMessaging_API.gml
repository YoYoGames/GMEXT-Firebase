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

// Skipping function firebase_in_app_messaging_set_automatic_data_collection_enabled (no wrapper is required)


// Skipping function firebase_in_app_messaging_is_automatic_data_collection_enabled (no wrapper is required)


// Skipping function firebase_in_app_messaging_set_messages_suppressed (no wrapper is required)


// Skipping function firebase_in_app_messaging_are_messages_suppressed (no wrapper is required)


// Skipping function firebase_in_app_messaging_trigger_event (no wrapper is required)


/**
 * @param {Function} _callback
 */
function firebase_in_app_messaging_set_impression_callback(_callback)
{
    var __available__ = __GMFirebaseInAppMessaging_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseInAppMessaging_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
    buffer_write(__args_buffer__, buffer_u64, _callback_handle);

    var __return_value__ = __firebase_in_app_messaging_set_impression_callback(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Function} _callback
 */
function firebase_in_app_messaging_set_click_callback(_callback)
{
    var __available__ = __GMFirebaseInAppMessaging_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseInAppMessaging_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
    buffer_write(__args_buffer__, buffer_u64, _callback_handle);

    var __return_value__ = __firebase_in_app_messaging_set_click_callback(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Function} _callback
 */
function firebase_in_app_messaging_set_dismiss_callback(_callback)
{
    var __available__ = __GMFirebaseInAppMessaging_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseInAppMessaging_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
    buffer_write(__args_buffer__, buffer_u64, _callback_handle);

    var __return_value__ = __firebase_in_app_messaging_set_dismiss_callback(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Function} _callback
 */
function firebase_in_app_messaging_set_display_error_callback(_callback)
{
    var __available__ = __GMFirebaseInAppMessaging_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseInAppMessaging_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
    buffer_write(__args_buffer__, buffer_u64, _callback_handle);

    var __return_value__ = __firebase_in_app_messaging_set_display_error_callback(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

// Skipping function firebase_in_app_messaging_clear_callbacks (no wrapper is required)


/// @ignore
function __GMFirebaseInAppMessaging_get_decoders()
{
    static __decoders__ = [];
    return __decoders__;
}
/// @ignore
function __GMFirebaseInAppMessaging_get_dispatcher()
{
    static __dispatcher__ = new __GMNativeFunctionDispatcher(__GMFirebaseInAppMessaging_invocation_handler, __GMFirebaseInAppMessaging_get_decoders());
    return __dispatcher__;
}
/// @ignore
function __GMFirebaseInAppMessaging_is_available()
{
    static __available__ = extension_exists("GMFirebaseInAppMessaging");
    return __available__;
}
