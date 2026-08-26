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

// Skipping function firebase_crashlytics_set_collection_enabled (no wrapper is required)


// Skipping function firebase_crashlytics_is_collection_enabled (no wrapper is required)


// Skipping function firebase_crashlytics_did_crash_on_previous_execution (no wrapper is required)


// Skipping function firebase_crashlytics_log (no wrapper is required)


// Skipping function firebase_crashlytics_set_user_id (no wrapper is required)


// Skipping function firebase_crashlytics_set_custom_key_string (no wrapper is required)


// Skipping function firebase_crashlytics_set_custom_key_real (no wrapper is required)


// Skipping function firebase_crashlytics_set_custom_key_bool (no wrapper is required)


// Skipping function firebase_crashlytics_record_error (no wrapper is required)


/**
 * @param {Function} _callback
 */
function firebase_crashlytics_check_for_unsent_reports(_callback)
{
    var __available__ = __GMFirebaseCrashlytics_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseCrashlytics_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
    buffer_write(__args_buffer__, buffer_u64, _callback_handle);

    var __return_value__ = __firebase_crashlytics_check_for_unsent_reports(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

// Skipping function firebase_crashlytics_send_unsent_reports (no wrapper is required)


// Skipping function firebase_crashlytics_delete_unsent_reports (no wrapper is required)


// Skipping function firebase_crashlytics_test_crash (no wrapper is required)


/// @ignore
function __GMFirebaseCrashlytics_get_decoders()
{
    static __decoders__ = [];
    return __decoders__;
}
/// @ignore
function __GMFirebaseCrashlytics_get_dispatcher()
{
    static __dispatcher__ = new __GMNativeFunctionDispatcher(__GMFirebaseCrashlytics_invocation_handler, __GMFirebaseCrashlytics_get_decoders());
    return __dispatcher__;
}
/// @ignore
function __GMFirebaseCrashlytics_is_available()
{
    static __available__ = extension_exists("GMFirebaseCrashlytics");
    return __available__;
}
