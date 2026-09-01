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

// Skipping function firebase_messaging_initialize (no wrapper is required)


// Skipping function firebase_messaging_terminate (no wrapper is required)


// Skipping function firebase_messaging_set_token_registration_on_init_enabled (no wrapper is required)


// Skipping function firebase_messaging_is_token_registration_on_init_enabled (no wrapper is required)


// Skipping function firebase_messaging_delivery_metrics_export_to_big_query_enabled (no wrapper is required)


// Skipping function firebase_messaging_set_delivery_metrics_export_to_big_query (no wrapper is required)


/**
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_messaging_request_permission(_callback)
{
    var __available__ = __GMFirebaseMessaging_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseMessaging_get_dispatcher();

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

    var __return_value__ = __firebase_messaging_request_permission(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_messaging_get_token(_callback)
{
    var __available__ = __GMFirebaseMessaging_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseMessaging_get_dispatcher();

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

    var __return_value__ = __firebase_messaging_get_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_messaging_delete_token(_callback)
{
    var __available__ = __GMFirebaseMessaging_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseMessaging_get_dispatcher();

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

    var __return_value__ = __firebase_messaging_delete_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _topic
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_messaging_subscribe(_topic, _callback)
{
    var __available__ = __GMFirebaseMessaging_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseMessaging_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _topic, type: String
    if (!is_string(_topic)) show_error($"{_GMFUNCTION_} :: _topic expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_topic));
    buffer_write(__args_buffer__, buffer_string, _topic);

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

    var __return_value__ = __firebase_messaging_subscribe(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _topic
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_messaging_unsubscribe(_topic, _callback)
{
    var __available__ = __GMFirebaseMessaging_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseMessaging_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _topic, type: String
    if (!is_string(_topic)) show_error($"{_GMFUNCTION_} :: _topic expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_topic));
    buffer_write(__args_buffer__, buffer_string, _topic);

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

    var __return_value__ = __firebase_messaging_unsubscribe(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

// Skipping function firebase_messaging_poll_message (no wrapper is required)


// Skipping function firebase_messaging_poll_token (no wrapper is required)


// Skipping function firebase_messaging_current_token (no wrapper is required)


// Skipping function firebase_messaging_message_from (no wrapper is required)


// Skipping function firebase_messaging_message_to (no wrapper is required)


// Skipping function firebase_messaging_message_collapse_key (no wrapper is required)


// Skipping function firebase_messaging_message_message_id (no wrapper is required)


// Skipping function firebase_messaging_message_message_type (no wrapper is required)


// Skipping function firebase_messaging_message_priority (no wrapper is required)


// Skipping function firebase_messaging_message_original_priority (no wrapper is required)


// Skipping function firebase_messaging_message_time_to_live (no wrapper is required)


// Skipping function firebase_messaging_message_sent_time (no wrapper is required)


// Skipping function firebase_messaging_message_error (no wrapper is required)


// Skipping function firebase_messaging_message_error_description (no wrapper is required)


// Skipping function firebase_messaging_message_link (no wrapper is required)


// Skipping function firebase_messaging_message_notification_opened (no wrapper is required)


// Skipping function firebase_messaging_message_data_count (no wrapper is required)


// Skipping function firebase_messaging_message_data_key_at (no wrapper is required)


// Skipping function firebase_messaging_message_get_data (no wrapper is required)


// Skipping function firebase_messaging_message_raw_data_size (no wrapper is required)


/**
 * @param {Id.Buffer} _out_buffer
 * @returns {Real}
 */
function firebase_messaging_message_raw_data_copy(_out_buffer)
{
    var __available__ = __GMFirebaseMessaging_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _out_buffer, type: Buffer
    if (!buffer_exists(_out_buffer)) show_error($"{_GMFUNCTION_} :: _out_buffer expected Id.Buffer", true);
    __GMFirebaseMessaging_queue_buffer(buffer_get_address(_out_buffer), buffer_get_size(_out_buffer));

    var __return_value__ = __firebase_messaging_message_raw_data_copy(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

// Skipping function firebase_messaging_message_has_notification (no wrapper is required)


// Skipping function firebase_messaging_message_notification_title (no wrapper is required)


// Skipping function firebase_messaging_message_notification_body (no wrapper is required)


// Skipping function firebase_messaging_message_notification_icon (no wrapper is required)


// Skipping function firebase_messaging_message_notification_sound (no wrapper is required)


// Skipping function firebase_messaging_message_notification_badge (no wrapper is required)


// Skipping function firebase_messaging_message_notification_tag (no wrapper is required)


// Skipping function firebase_messaging_message_notification_color (no wrapper is required)


// Skipping function firebase_messaging_message_notification_click_action (no wrapper is required)


// Skipping function firebase_messaging_message_notification_body_loc_key (no wrapper is required)


// Skipping function firebase_messaging_message_notification_body_loc_args_count (no wrapper is required)


// Skipping function firebase_messaging_message_notification_body_loc_args_at (no wrapper is required)


// Skipping function firebase_messaging_message_notification_title_loc_key (no wrapper is required)


// Skipping function firebase_messaging_message_notification_title_loc_args_count (no wrapper is required)


// Skipping function firebase_messaging_message_notification_title_loc_args_at (no wrapper is required)


// Skipping function firebase_messaging_message_notification_android_channel_id (no wrapper is required)


// Skipping function firebase_messaging_initialize_with_options (no wrapper is required)


/**
 * @param {Real} _app
 * @returns {Real}
 */
function firebase_messaging_initialize_for_app(_app)
{
    var __available__ = __GMFirebaseMessaging_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __return_value__ = __firebase_messaging_initialize_for_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _app
 * @param {Real} _suppress_notification_permission_prompt
 * @returns {Real}
 */
function firebase_messaging_initialize_for_app_with_options(_app, _suppress_notification_permission_prompt)
{
    var __available__ = __GMFirebaseMessaging_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    // param: _suppress_notification_permission_prompt, type: Float64
    if (!is_numeric(_suppress_notification_permission_prompt)) show_error($"{_GMFUNCTION_} :: _suppress_notification_permission_prompt expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _suppress_notification_permission_prompt);

    var __return_value__ = __firebase_messaging_initialize_for_app_with_options(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/// @ignore
function __GMFirebaseMessaging_get_decoders()
{
    static __decoders__ = [];
    return __decoders__;
}
/// @ignore
function __GMFirebaseMessaging_get_dispatcher()
{
    static __dispatcher__ = new __GMNativeFunctionDispatcher(__GMFirebaseMessaging_invocation_handler, __GMFirebaseMessaging_get_decoders());
    return __dispatcher__;
}
/// @ignore
function __GMFirebaseMessaging_is_available()
{
    static __available__ = extension_exists("GMFirebaseMessaging");
    return __available__;
}
