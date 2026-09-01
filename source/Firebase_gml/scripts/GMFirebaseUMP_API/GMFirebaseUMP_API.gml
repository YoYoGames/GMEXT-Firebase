// ##### extgen :: Auto-generated file do not edit!! #####

// #####################################################################
// # Macros
// #####################################################################

// #####################################################################
// # Enums
// #####################################################################

enum FirebaseUmpConsentStatus
{
    Unknown = 0,
    Required = 1,
    NotRequired = 2,
    Obtained = 3
}

enum FirebaseUmpConsentFormStatus
{
    Unknown = 0,
    Unavailable = 1,
    Available = 2
}

enum FirebaseUmpPrivacyOptionsRequirementStatus
{
    Unknown = 0,
    NotRequired = 1,
    Required = 2
}

enum FirebaseUmpConsentDebugGeography
{
    Disabled = 0,
    EEA = 1,
    NonEEA = 2
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

/**
 * @returns {Real}
 */
function firebase_ump_get_instance()
{
    var __available__ = __GMFirebaseUMP_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_ump_get_instance(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = buffer_read(__ret_buffer__, buffer_u64);
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

/**
 * @param {Real} _consent_ref
 * @returns {Real}
 */
function firebase_ump_get_consent_status(_consent_ref)
{
    var __available__ = __GMFirebaseUMP_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    var __return_value__ = __firebase_ump_get_consent_status(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _consent_ref
 * @returns {Real}
 */
function firebase_ump_get_consent_form_status(_consent_ref)
{
    var __available__ = __GMFirebaseUMP_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    var __return_value__ = __firebase_ump_get_consent_form_status(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _consent_ref
 * @returns {Real}
 */
function firebase_ump_get_privacy_options_requirement_status(_consent_ref)
{
    var __available__ = __GMFirebaseUMP_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    var __return_value__ = __firebase_ump_get_privacy_options_requirement_status(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _consent_ref
 * @returns {Real}
 */
function firebase_ump_can_request_ads(_consent_ref)
{
    var __available__ = __GMFirebaseUMP_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    var __return_value__ = __firebase_ump_can_request_ads(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _consent_ref
 */
function firebase_ump_reset(_consent_ref)
{
    var __available__ = __GMFirebaseUMP_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    var __return_value__ = __firebase_ump_reset(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _consent_ref
 * @param {Real} _debug_geography
 * @param {Real} _tag_for_under_age_of_consent
 * @param {Any} _debug_device_ids
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_ump_request_consent_info_update(_consent_ref, _debug_geography, _tag_for_under_age_of_consent, _debug_device_ids, _callback)
{
    var __available__ = __GMFirebaseUMP_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseUMP_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    // param: _debug_geography, type: Float64
    if (!is_numeric(_debug_geography)) show_error($"{_GMFUNCTION_} :: _debug_geography expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _debug_geography);

    // param: _tag_for_under_age_of_consent, type: Float64
    if (!is_numeric(_tag_for_under_age_of_consent)) show_error($"{_GMFUNCTION_} :: _tag_for_under_age_of_consent expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _tag_for_under_age_of_consent);

    // param: _debug_device_ids, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _debug_device_ids);

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

    var __return_value__ = __firebase_ump_request_consent_info_update(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _consent_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_ump_load_consent_form(_consent_ref, _callback)
{
    var __available__ = __GMFirebaseUMP_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseUMP_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

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

    var __return_value__ = __firebase_ump_load_consent_form(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _consent_ref
 * @param {Real} _form_parent
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_ump_show_consent_form(_consent_ref, _form_parent, _callback)
{
    var __available__ = __GMFirebaseUMP_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseUMP_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    // param: _form_parent, type: UInt64
    if (!is_numeric(_form_parent)) show_error($"{_GMFUNCTION_} :: _form_parent expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _form_parent);

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

    var __return_value__ = __firebase_ump_show_consent_form(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _consent_ref
 * @param {Real} _form_parent
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_ump_load_and_show_consent_form_if_required(_consent_ref, _form_parent, _callback)
{
    var __available__ = __GMFirebaseUMP_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseUMP_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    // param: _form_parent, type: UInt64
    if (!is_numeric(_form_parent)) show_error($"{_GMFUNCTION_} :: _form_parent expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _form_parent);

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

    var __return_value__ = __firebase_ump_load_and_show_consent_form_if_required(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _consent_ref
 * @param {Real} _form_parent
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_ump_show_privacy_options_form(_consent_ref, _form_parent, _callback)
{
    var __available__ = __GMFirebaseUMP_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseUMP_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    // param: _form_parent, type: UInt64
    if (!is_numeric(_form_parent)) show_error($"{_GMFUNCTION_} :: _form_parent expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _form_parent);

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

    var __return_value__ = __firebase_ump_show_privacy_options_form(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _app
 * @returns {Real}
 */
function firebase_ump_get_instance_for_app(_app)
{
    var __available__ = __GMFirebaseUMP_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_ump_get_instance_for_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = buffer_read(__ret_buffer__, buffer_u64);
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

/// @ignore
function __GMFirebaseUMP_get_decoders()
{
    static __decoders__ = [];
    return __decoders__;
}
/// @ignore
function __GMFirebaseUMP_get_dispatcher()
{
    static __dispatcher__ = new __GMNativeFunctionDispatcher(__GMFirebaseUMP_invocation_handler, __GMFirebaseUMP_get_decoders());
    return __dispatcher__;
}
/// @ignore
function __GMFirebaseUMP_is_available()
{
    static __available__ = extension_exists("GMFirebaseUMP");
    return __available__;
}
