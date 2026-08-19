// ##### extgen :: Auto-generated file do not edit!! #####

#include "GMFirebaseInternal_native.h"
#include "GMFirebaseInternal_exports.h"

using namespace gm_structs;
using namespace gm::wire::codec;

static gm::runtime::DispatchQueue __dispatch_queue;

// Internal function used for fetching dispatched function calls to GML
GMEXPORT double __EXT_NATIVE__GMFirebase_invocation_handler(char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferWriter __bw{ __ret_buffer, static_cast<size_t>(__ret_buffer_length) };
    return __dispatch_queue.fetch(__bw);
}

static std::queue<gm::wire::GMBuffer> __buffer_queue;

// Internal function used for queueing buffers to native code
GMEXPORT double __EXT_NATIVE__GMFirebase_queue_buffer(char* __arg_buffer, double __arg_buffer_length)
{
    gm::wire::GMBuffer __buff{__arg_buffer, static_cast<uint64_t>(__arg_buffer_length)};
    __buffer_queue.push(__buff);

    return 1.0;
}

GMEXPORT double __EXT_NATIVE__firebase_app_initialize()
{
    auto&& __result = firebase_app_initialize();
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_app_is_initialized()
{
    auto&& __result = firebase_app_is_initialized();
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_app_get_name()
{
    static std::string __result;
    __result = firebase_app_get_name();
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_last_error_code()
{
    auto&& __result = firebase_last_error_code();
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_last_error_message()
{
    static std::string __result;
    __result = firebase_last_error_message();
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_initialize()
{
    auto&& __result = firebase_analytics_initialize();
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_terminate()
{
    firebase_analytics_terminate();
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_set_analytics_collection_enabled(double enabled)
{
    firebase_analytics_set_analytics_collection_enabled(static_cast<double>(enabled));
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_set_consent(double ad_storage, double analytics_storage, double ad_user_data, double ad_personalization)
{
    firebase_analytics_set_consent(static_cast<double>(ad_storage), static_cast<double>(analytics_storage), static_cast<double>(ad_user_data), static_cast<double>(ad_personalization));
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_log_event(char* name)
{
    firebase_analytics_log_event(name);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_log_event_string(char* name, char* parameter_name, char* parameter_value)
{
    firebase_analytics_log_event_string(name, parameter_name, parameter_value);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_log_event_number(char* name, char* parameter_name, double parameter_value)
{
    firebase_analytics_log_event_number(name, parameter_name, static_cast<double>(parameter_value));
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_log_event_params(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: name, type: String
    std::string_view name = gm::wire::codec::readValue<std::string_view>(__br);

    // field: params, type: Any
    gm::wire::GMValue params = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    firebase_analytics_log_event_params(name, params);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_set_default_event_parameters(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: params, type: Any
    gm::wire::GMValue params = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    firebase_analytics_set_default_event_parameters(params);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_log_apple_transaction(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: transaction_id, type: String
    std::string_view transaction_id = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_analytics_log_apple_transaction(transaction_id, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_set_user_property(char* name, char* value)
{
    firebase_analytics_set_user_property(name, value);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_set_user_id(char* user_id)
{
    firebase_analytics_set_user_id(user_id);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_set_session_timeout_duration(double milliseconds)
{
    firebase_analytics_set_session_timeout_duration(static_cast<double>(milliseconds));
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_reset_analytics_data()
{
    firebase_analytics_reset_analytics_data();
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_get_analytics_instance_id(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_analytics_get_analytics_instance_id(callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_get_session_id(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_analytics_get_session_id(callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_notify_app_lifecycle_termination()
{
    firebase_analytics_notify_app_lifecycle_termination();
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_is_desktop_initialized()
{
    auto&& __result = firebase_analytics_is_desktop_initialized();
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_set_desktop_debug_mode(double enabled)
{
    firebase_analytics_set_desktop_debug_mode(static_cast<double>(enabled));
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_set_log_callback(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_analytics_set_log_callback(callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_email(char* email_address)
{
    firebase_analytics_initiate_on_device_conversion_measurement_email(email_address);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_phone(char* phone_number)
{
    firebase_analytics_initiate_on_device_conversion_measurement_phone(phone_number);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_app_check_set_provider_factory(double provider)
{
    firebase_app_check_set_provider_factory(static_cast<double>(provider));
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_app_check_debug_provider_set_debug_token(char* token)
{
    firebase_app_check_debug_provider_set_debug_token(token);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_app_check_set_token_auto_refresh_enabled(double enabled)
{
    firebase_app_check_set_token_auto_refresh_enabled(static_cast<double>(enabled));
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_app_check_get_token(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: force_refresh, type: Float64
    double force_refresh = gm::wire::codec::readValue<double>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_app_check_get_token(force_refresh, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_app_check_get_limited_use_token(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_app_check_get_limited_use_token(callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_app_check_add_listener(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_app_check_add_listener(callback);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_app_check_remove_listener(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: listener_ref, type: UInt64
    std::uint64_t listener_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_app_check_remove_listener(listener_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_installations_get_id(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_installations_get_id(callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_installations_get_token(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: force_refresh, type: Float64
    double force_refresh = gm::wire::codec::readValue<double>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_installations_get_token(force_refresh, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_installations_delete(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_installations_delete(callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_auth_get_auth()
{
    auto&& __result = firebase_auth_get_auth();
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_language_code()
{
    static std::string __result;
    __result = firebase_auth_language_code();
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_auth_set_language_code(char* language_code)
{
    firebase_auth_set_language_code(language_code);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_use_app_language()
{
    firebase_auth_use_app_language();
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_use_emulator(char* host, double port)
{
    firebase_auth_use_emulator(host, static_cast<double>(port));
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_current_user(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_auth_current_user();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: optional<UInt64>
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_out()
{
    firebase_auth_sign_out();
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_fetch_providers_for_email(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: email, type: String
    std::string_view email = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_fetch_providers_for_email(email, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_in_with_custom_token(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: custom_token, type: String
    std::string_view custom_token = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_sign_in_with_custom_token(custom_token, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_in_with_credential(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: credential_ref, type: UInt64
    std::uint64_t credential_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_sign_in_with_credential(credential_ref, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_in_and_retrieve_data_with_credential(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: credential_ref, type: UInt64
    std::uint64_t credential_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_sign_in_and_retrieve_data_with_credential(credential_ref, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_in_anonymously(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_sign_in_anonymously(callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_in_with_email_and_password(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: email, type: String
    std::string_view email = gm::wire::codec::readValue<std::string_view>(__br);

    // field: password, type: String
    std::string_view password = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_sign_in_with_email_and_password(email, password, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_create_user_with_email_and_password(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: email, type: String
    std::string_view email = gm::wire::codec::readValue<std::string_view>(__br);

    // field: password, type: String
    std::string_view password = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_create_user_with_email_and_password(email, password, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_send_password_reset_email(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: email, type: String
    std::string_view email = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_send_password_reset_email(email, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_add_state_listener(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    auto&& __result = firebase_auth_add_state_listener(callback);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: optional<UInt64>
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_remove_state_listener(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: listener_ref, type: UInt64
    std::uint64_t listener_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_auth_remove_state_listener(listener_ref);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_add_id_token_listener(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    auto&& __result = firebase_auth_add_id_token_listener(callback);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: optional<UInt64>
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_remove_id_token_listener(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: listener_ref, type: UInt64
    std::uint64_t listener_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_auth_remove_id_token_listener(listener_ref);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_credential_provider(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: credential_ref, type: UInt64
    std::uint64_t credential_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_auth_credential_provider(credential_ref);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_auth_credential_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: credential_ref, type: UInt64
    std::uint64_t credential_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_credential_is_valid(credential_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_auth_credential_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: credential_ref, type: UInt64
    std::uint64_t credential_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_auth_credential_release(credential_ref);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_email_auth_provider_get_credential(char* email, char* password, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_auth_email_auth_provider_get_credential(email, password);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_facebook_auth_provider_get_credential(char* access_token, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_auth_facebook_auth_provider_get_credential(access_token);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_game_center_auth_provider_get_credential(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_game_center_auth_provider_get_credential(callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_game_center_auth_provider_is_player_authenticated()
{
    auto&& __result = firebase_auth_game_center_auth_provider_is_player_authenticated();
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_auth_github_auth_provider_get_credential(char* token, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_auth_github_auth_provider_get_credential(token);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_google_auth_provider_get_credential(char* id_token, char* access_token, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_auth_google_auth_provider_get_credential(id_token, access_token);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_oauth_provider_get_credential(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: provider_id, type: String
    std::string_view provider_id = gm::wire::codec::readValue<std::string_view>(__br);

    // field: id_token, type: String
    std::string_view id_token = gm::wire::codec::readValue<std::string_view>(__br);

    // field: access_token, type: String
    std::string_view access_token = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_auth_oauth_provider_get_credential(provider_id, id_token, access_token);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_oauth_provider_get_credential_with_nonce(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: provider_id, type: String
    std::string_view provider_id = gm::wire::codec::readValue<std::string_view>(__br);

    // field: id_token, type: String
    std::string_view id_token = gm::wire::codec::readValue<std::string_view>(__br);

    // field: raw_nonce, type: String
    std::string_view raw_nonce = gm::wire::codec::readValue<std::string_view>(__br);

    // field: access_token, type: String
    std::string_view access_token = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_auth_oauth_provider_get_credential_with_nonce(provider_id, id_token, raw_nonce, access_token);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_play_games_auth_provider_get_credential(char* server_auth_code, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_auth_play_games_auth_provider_get_credential(server_auth_code);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_twitter_auth_provider_get_credential(char* token, char* secret, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_auth_twitter_auth_provider_get_credential(token, secret);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_phone_verify_phone_number(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: phone_number, type: String
    std::string_view phone_number = gm::wire::codec::readValue<std::string_view>(__br);

    // field: timeout_ms, type: Float64
    double timeout_ms = gm::wire::codec::readValue<double>(__br);

    // field: force_resending_token, type: UInt64
    std::uint64_t force_resending_token = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: on_verification_completed, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_verification_completed = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_verification_completed = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    // field: on_verification_failed, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_verification_failed = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_verification_failed = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    // field: on_code_sent, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_code_sent = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_code_sent = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    // field: on_timeout, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_timeout = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_timeout = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_auth_phone_verify_phone_number(phone_number, timeout_ms, force_resending_token, on_verification_completed, on_verification_failed, on_code_sent, on_timeout);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_phone_get_credential(char* verification_id, char* verification_code, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_auth_phone_get_credential(verification_id, verification_code);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_phone_credential_sms_code(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: credential, type: UInt64
    std::uint64_t credential = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_auth_phone_credential_sms_code(credential);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_auth_phone_resending_token_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: token, type: UInt64
    std::uint64_t token = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_auth_phone_resending_token_release(token);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_phone_listener_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: listener, type: UInt64
    std::uint64_t listener = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_auth_phone_listener_release(listener);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_get_info(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user, type: UInt64
    std::uint64_t user = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_user_get_info(user);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: struct FirebaseAuthUserInfo
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_auth_user_release(user_ref);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_user_is_valid(user_ref);
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_user_uid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_auth_user_uid(user_ref);
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_user_email(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_auth_user_email(user_ref);
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_user_display_name(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_auth_user_display_name(user_ref);
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_user_photo_url(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_auth_user_photo_url(user_ref);
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_user_provider_id(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_auth_user_provider_id(user_ref);
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_user_phone_number(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_auth_user_phone_number(user_ref);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_is_email_verified(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_user_is_email_verified(user_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_is_anonymous(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_user_is_anonymous(user_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_creation_timestamp(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_user_creation_timestamp(user_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_last_sign_in_timestamp(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_user_last_sign_in_timestamp(user_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_get_token(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: force_refresh, type: Bool
    bool force_refresh = gm::wire::codec::readValue<bool>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_get_token(user_ref, force_refresh, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_update_password(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: password, type: String
    std::string_view password = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_update_password(user_ref, password, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_update_profile(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: display_name, type: String
    std::string_view display_name = gm::wire::codec::readValue<std::string_view>(__br);

    // field: photo_url, type: String
    std::string_view photo_url = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_update_profile(user_ref, display_name, photo_url, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_send_email_verification(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_send_email_verification(user_ref, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_send_email_verification_before_updating_email(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: new_email, type: String
    std::string_view new_email = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_send_email_verification_before_updating_email(user_ref, new_email, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_reauthenticate(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: credential_ref, type: UInt64
    std::uint64_t credential_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_reauthenticate(user_ref, credential_ref, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_reauthenticate_and_retrieve_data(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: credential_ref, type: UInt64
    std::uint64_t credential_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_reauthenticate_and_retrieve_data(user_ref, credential_ref, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_link_with_credential(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: credential_ref, type: UInt64
    std::uint64_t credential_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_link_with_credential(user_ref, credential_ref, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_unlink(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: provider_id, type: String
    std::string_view provider_id = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_unlink(user_ref, provider_id, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_reload(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_reload(user_ref, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_delete(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_delete(user_ref, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_get_instance(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_database_get_instance();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_get_instance_for_url(char* url, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_database_get_instance_for_url(url);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_database_get_url(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: db_ref, type: UInt64
    std::uint64_t db_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_database_get_url(db_ref);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_database_get_reference(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: db_ref, type: UInt64
    std::uint64_t db_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_get_reference(db_ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_get_reference_at_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: db_ref, type: UInt64
    std::uint64_t db_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: path, type: String
    std::string_view path = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_database_get_reference_at_path(db_ref, path);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_get_reference_from_url(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: db_ref, type: UInt64
    std::uint64_t db_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: url, type: String
    std::string_view url = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_database_get_reference_from_url(db_ref, url);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_go_offline(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: db_ref, type: UInt64
    std::uint64_t db_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_go_offline(db_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_go_online(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: db_ref, type: UInt64
    std::uint64_t db_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_go_online(db_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_purge_outstanding_writes(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: db_ref, type: UInt64
    std::uint64_t db_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_purge_outstanding_writes(db_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_set_persistence_enabled(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: db_ref, type: UInt64
    std::uint64_t db_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: enabled, type: Float64
    double enabled = gm::wire::codec::readValue<double>(__br);

    auto&& __result = firebase_database_set_persistence_enabled(db_ref, enabled);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_set_log_level(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: db_ref, type: UInt64
    std::uint64_t db_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: log_level, type: enum FirebaseLogLevel
    gm_enums::FirebaseLogLevel log_level = gm::wire::codec::readValue<gm_enums::FirebaseLogLevel>(__br);

    auto&& __result = firebase_database_set_log_level(db_ref, log_level);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_get_log_level(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: db_ref, type: UInt64
    std::uint64_t db_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_get_log_level(db_ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: enum FirebaseLogLevel
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_order_by_child(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: path, type: String
    std::string_view path = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_database_ref_order_by_child(ref, path);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_order_by_key(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_ref_order_by_key(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_order_by_value(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_ref_order_by_value(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_order_by_priority(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_ref_order_by_priority(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_start_at(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: order_value, type: Any
    gm::wire::GMValue order_value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_database_ref_start_at(ref, order_value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_start_at_key(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: order_value, type: Any
    gm::wire::GMValue order_value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: child_key, type: String
    std::string_view child_key = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_database_ref_start_at_key(ref, order_value, child_key);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_end_at(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: order_value, type: Any
    gm::wire::GMValue order_value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_database_ref_end_at(ref, order_value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_end_at_key(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: order_value, type: Any
    gm::wire::GMValue order_value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: child_key, type: String
    std::string_view child_key = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_database_ref_end_at_key(ref, order_value, child_key);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_equal_to(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: order_value, type: Any
    gm::wire::GMValue order_value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_database_ref_equal_to(ref, order_value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_equal_to_key(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: order_value, type: Any
    gm::wire::GMValue order_value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: child_key, type: String
    std::string_view child_key = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_database_ref_equal_to_key(ref, order_value, child_key);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_limit_to_first(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: limit, type: Float64
    double limit = gm::wire::codec::readValue<double>(__br);

    auto&& __result = firebase_database_ref_limit_to_first(ref, limit);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_limit_to_last(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: limit, type: Float64
    double limit = gm::wire::codec::readValue<double>(__br);

    auto&& __result = firebase_database_ref_limit_to_last(ref, limit);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_set_keep_synchronized(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: keep_sync, type: Float64
    double keep_sync = gm::wire::codec::readValue<double>(__br);

    auto&& __result = firebase_database_ref_set_keep_synchronized(ref, keep_sync);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_get_value(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_database_ref_get_value(ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_add_value_listener(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: on_value_changed, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_value_changed = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_value_changed = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    // field: on_cancelled, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_cancelled = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_cancelled = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_database_ref_add_value_listener(ref, on_value_changed, on_cancelled);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_remove_value_listener(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: listener_ref, type: UInt64
    std::uint64_t listener_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_ref_remove_value_listener(ref, listener_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_remove_all_value_listeners(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_ref_remove_all_value_listeners(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_add_child_listener(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: on_child_added, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_child_added = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_child_added = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    // field: on_child_changed, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_child_changed = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_child_changed = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    // field: on_child_moved, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_child_moved = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_child_moved = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    // field: on_child_removed, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_child_removed = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_child_removed = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    // field: on_cancelled, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_cancelled = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_cancelled = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_database_ref_add_child_listener(ref, on_child_added, on_child_changed, on_child_moved, on_child_removed, on_cancelled);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_remove_child_listener(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: listener_ref, type: UInt64
    std::uint64_t listener_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_ref_remove_child_listener(ref, listener_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_remove_all_child_listeners(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_ref_remove_all_child_listeners(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_order_by_child(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: path, type: String
    std::string_view path = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_database_query_order_by_child(ref, path);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_order_by_key(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_query_order_by_key(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_order_by_value(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_query_order_by_value(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_order_by_priority(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_query_order_by_priority(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_start_at(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: order_value, type: Any
    gm::wire::GMValue order_value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_database_query_start_at(ref, order_value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_start_at_key(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: order_value, type: Any
    gm::wire::GMValue order_value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: child_key, type: String
    std::string_view child_key = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_database_query_start_at_key(ref, order_value, child_key);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_end_at(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: order_value, type: Any
    gm::wire::GMValue order_value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_database_query_end_at(ref, order_value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_end_at_key(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: order_value, type: Any
    gm::wire::GMValue order_value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: child_key, type: String
    std::string_view child_key = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_database_query_end_at_key(ref, order_value, child_key);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_equal_to(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: order_value, type: Any
    gm::wire::GMValue order_value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_database_query_equal_to(ref, order_value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_equal_to_key(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: order_value, type: Any
    gm::wire::GMValue order_value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: child_key, type: String
    std::string_view child_key = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_database_query_equal_to_key(ref, order_value, child_key);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_limit_to_first(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: limit, type: Float64
    double limit = gm::wire::codec::readValue<double>(__br);

    auto&& __result = firebase_database_query_limit_to_first(ref, limit);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_limit_to_last(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: limit, type: Float64
    double limit = gm::wire::codec::readValue<double>(__br);

    auto&& __result = firebase_database_query_limit_to_last(ref, limit);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_get_reference(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_query_get_reference(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_set_keep_synchronized(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: keep_sync, type: Float64
    double keep_sync = gm::wire::codec::readValue<double>(__br);

    auto&& __result = firebase_database_query_set_keep_synchronized(ref, keep_sync);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_query_is_valid(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_get_value(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_database_query_get_value(ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_add_value_listener(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: on_value_changed, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_value_changed = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_value_changed = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    // field: on_cancelled, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_cancelled = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_cancelled = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_database_query_add_value_listener(ref, on_value_changed, on_cancelled);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_remove_value_listener(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: listener_ref, type: UInt64
    std::uint64_t listener_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_query_remove_value_listener(ref, listener_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_remove_all_value_listeners(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_query_remove_all_value_listeners(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_add_child_listener(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: on_child_added, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_child_added = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_child_added = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    // field: on_child_changed, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_child_changed = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_child_changed = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    // field: on_child_moved, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_child_moved = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_child_moved = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    // field: on_child_removed, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_child_removed = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_child_removed = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    // field: on_cancelled, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_cancelled = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_cancelled = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_database_query_add_child_listener(ref, on_child_added, on_child_changed, on_child_moved, on_child_removed, on_cancelled);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_remove_child_listener(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: listener_ref, type: UInt64
    std::uint64_t listener_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_query_remove_child_listener(ref, listener_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_remove_all_child_listeners(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_query_remove_all_child_listeners(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_query_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_query_release(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_get(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_ref_get(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: struct FirebaseDatabaseReferenceInfo
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_child(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: path, type: String
    std::string_view path = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_database_ref_child(ref, path);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_push(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_ref_push(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_go_online(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_ref_go_online(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_go_offline(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_ref_go_offline(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_set_value(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_database_ref_set_value(ref, value, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_set_priority(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: priority, type: Any
    gm::wire::GMValue priority = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_database_ref_set_priority(ref, priority, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_set_value_and_priority(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: priority, type: Any
    gm::wire::GMValue priority = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_database_ref_set_value_and_priority(ref, value, priority, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_update_children(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_database_ref_update_children(ref, values, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_remove_value(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_database_ref_remove_value(ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_run_transaction(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_database_ref_run_transaction(ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_ref_release(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_snapshot_exists(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_snapshot_exists(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_snapshot_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_snapshot_is_valid(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_snapshot_child(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: path, type: String
    std::string_view path = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_database_snapshot_child(ref, path);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_snapshot_has_child(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: path, type: String
    std::string_view path = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_database_snapshot_has_child(ref, path);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_snapshot_has_children(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_snapshot_has_children(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_snapshot_children_count(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_snapshot_children_count(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_snapshot_get_children(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_snapshot_get_children(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_database_snapshot_key(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_database_snapshot_key(ref);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_database_snapshot_get_reference(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_snapshot_get_reference(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_snapshot_get_info(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_snapshot_get_info(snapshot);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: struct FirebaseDataSnapshotInfo
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_snapshot_get_value(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_snapshot_get_value(snapshot);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_snapshot_get_priority(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_snapshot_get_priority(snapshot);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_snapshot_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_snapshot_release(snapshot);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_get_instance(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_firestore_get_instance();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_get_instance_for_database(char* database_name, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_firestore_get_instance_for_database(database_name);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_firestore_settings_get_host(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: instance_ref, type: UInt64
    std::uint64_t instance_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_firestore_settings_get_host(instance_ref);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_settings_set_host(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: instance_ref, type: UInt64
    std::uint64_t instance_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: host, type: String
    std::string_view host = gm::wire::codec::readValue<std::string_view>(__br);

    firebase_firestore_settings_set_host(instance_ref, host);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_settings_get_ssl_enabled(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: instance_ref, type: UInt64
    std::uint64_t instance_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_settings_get_ssl_enabled(instance_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_settings_set_ssl_enabled(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: instance_ref, type: UInt64
    std::uint64_t instance_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: enabled, type: Bool
    bool enabled = gm::wire::codec::readValue<bool>(__br);

    firebase_firestore_settings_set_ssl_enabled(instance_ref, enabled);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_settings_get_persistence_enabled(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: instance_ref, type: UInt64
    std::uint64_t instance_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_settings_get_persistence_enabled(instance_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_settings_set_persistence_enabled(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: instance_ref, type: UInt64
    std::uint64_t instance_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: enabled, type: Bool
    bool enabled = gm::wire::codec::readValue<bool>(__br);

    firebase_firestore_settings_set_persistence_enabled(instance_ref, enabled);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_settings_get_cache_size_bytes(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: instance_ref, type: UInt64
    std::uint64_t instance_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_settings_get_cache_size_bytes(instance_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_settings_set_cache_size_bytes(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: instance_ref, type: UInt64
    std::uint64_t instance_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: bytes, type: Float64
    double bytes = gm::wire::codec::readValue<double>(__br);

    firebase_firestore_settings_set_cache_size_bytes(instance_ref, bytes);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_collection(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: instance_ref, type: UInt64
    std::uint64_t instance_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: path, type: String
    std::string_view path = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_firestore_collection(instance_ref, path);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: instance_ref, type: UInt64
    std::uint64_t instance_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: path, type: String
    std::string_view path = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_firestore_document(instance_ref, path);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_collection_group(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: instance_ref, type: UInt64
    std::uint64_t instance_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: collection_id, type: String
    std::string_view collection_id = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_firestore_collection_group(instance_ref, collection_id);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_batch(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: instance_ref, type: UInt64
    std::uint64_t instance_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_batch(instance_ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_set_log_level(double level)
{
    firebase_firestore_set_log_level(static_cast<double>(level));
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_enable_network(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: instance_ref, type: UInt64
    std::uint64_t instance_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_enable_network(instance_ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_disable_network(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: instance_ref, type: UInt64
    std::uint64_t instance_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_disable_network(instance_ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_terminate(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: instance_ref, type: UInt64
    std::uint64_t instance_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_terminate(instance_ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_clear_persistence(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: instance_ref, type: UInt64
    std::uint64_t instance_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_clear_persistence(instance_ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_wait_for_pending_writes(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: instance_ref, type: UInt64
    std::uint64_t instance_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_wait_for_pending_writes(instance_ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_run_transaction(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: instance_ref, type: UInt64
    std::uint64_t instance_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_run_transaction(instance_ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_firestore_collection_ref_id(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_firestore_collection_ref_id(ref);
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_firestore_collection_ref_path(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_firestore_collection_ref_path(ref);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_collection_ref_parent(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_collection_ref_parent(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_collection_ref_document(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_collection_ref_document(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_collection_ref_document_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: path, type: String
    std::string_view path = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_firestore_collection_ref_document_path(ref, path);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_collection_ref_add(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: data, type: Any
    gm::wire::GMValue data = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_collection_ref_add(ref, data, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_collection_ref_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_collection_ref_is_valid(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_collection_ref_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_firestore_collection_ref_release(ref);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_firestore_document_ref_id(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_firestore_document_ref_id(ref);
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_firestore_document_ref_path(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_firestore_document_ref_path(ref);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_ref_parent(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_document_ref_parent(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_ref_collection(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: path, type: String
    std::string_view path = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_firestore_document_ref_collection(ref, path);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_ref_get(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: source, type: Float64
    double source = gm::wire::codec::readValue<double>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_document_ref_get(ref, source, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_ref_set(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: data, type: Any
    gm::wire::GMValue data = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_document_ref_set(ref, data, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_ref_set_merge(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: data, type: Any
    gm::wire::GMValue data = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_document_ref_set_merge(ref, data, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_ref_set_merge_fields(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: data, type: Any
    gm::wire::GMValue data = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: fields, type: Any
    gm::wire::GMValue fields = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_document_ref_set_merge_fields(ref, data, fields, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_ref_update(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: data, type: Any
    gm::wire::GMValue data = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_document_ref_update(ref, data, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_ref_delete(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_document_ref_delete(ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_ref_add_snapshot_listener(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: include_metadata_changes, type: Bool
    bool include_metadata_changes = gm::wire::codec::readValue<bool>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_document_ref_add_snapshot_listener(ref, include_metadata_changes, callback);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_ref_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_document_ref_is_valid(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_ref_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_firestore_document_ref_release(ref);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_where_equal_to(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_where_equal_to(ref, field, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_where_not_equal_to(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_where_not_equal_to(ref, field, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_where_less_than(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_where_less_than(ref, field, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_where_less_than_or_equal_to(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_where_less_than_or_equal_to(ref, field, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_where_greater_than(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_where_greater_than(ref, field, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_where_greater_than_or_equal_to(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_where_greater_than_or_equal_to(ref, field, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_where_array_contains(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_where_array_contains(ref, field, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_where_array_contains_any(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_where_array_contains_any(ref, field, values);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_where_in(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_where_in(ref, field, values);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_where_not_in(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_where_not_in(ref, field, values);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_order_by(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: direction, type: Float64
    double direction = gm::wire::codec::readValue<double>(__br);

    auto&& __result = firebase_firestore_query_order_by(ref, field, direction);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_limit(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: limit, type: Float64
    double limit = gm::wire::codec::readValue<double>(__br);

    auto&& __result = firebase_firestore_query_limit(ref, limit);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_limit_to_last(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: limit, type: Float64
    double limit = gm::wire::codec::readValue<double>(__br);

    auto&& __result = firebase_firestore_query_limit_to_last(ref, limit);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_start_at_snapshot(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: snapshot_ref, type: UInt64
    std::uint64_t snapshot_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_query_start_at_snapshot(ref, snapshot_ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_start_at_values(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_start_at_values(ref, values);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_start_after_snapshot(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: snapshot_ref, type: UInt64
    std::uint64_t snapshot_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_query_start_after_snapshot(ref, snapshot_ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_start_after_values(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_start_after_values(ref, values);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_end_before_snapshot(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: snapshot_ref, type: UInt64
    std::uint64_t snapshot_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_query_end_before_snapshot(ref, snapshot_ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_end_before_values(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_end_before_values(ref, values);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_end_at_snapshot(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: snapshot_ref, type: UInt64
    std::uint64_t snapshot_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_query_end_at_snapshot(ref, snapshot_ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_end_at_values(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_end_at_values(ref, values);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_get(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: source, type: Float64
    double source = gm::wire::codec::readValue<double>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_query_get(ref, source, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_add_snapshot_listener(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: include_metadata_changes, type: Bool
    bool include_metadata_changes = gm::wire::codec::readValue<bool>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_query_add_snapshot_listener(ref, include_metadata_changes, callback);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_query_is_valid(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_firestore_query_release(ref);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_write_batch_set(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: batch_ref, type: UInt64
    std::uint64_t batch_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: document_ref, type: UInt64
    std::uint64_t document_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: data, type: Any
    gm::wire::GMValue data = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_write_batch_set(batch_ref, document_ref, data);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_write_batch_set_merge(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: batch_ref, type: UInt64
    std::uint64_t batch_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: document_ref, type: UInt64
    std::uint64_t document_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: data, type: Any
    gm::wire::GMValue data = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_write_batch_set_merge(batch_ref, document_ref, data);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_write_batch_set_merge_fields(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: batch_ref, type: UInt64
    std::uint64_t batch_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: document_ref, type: UInt64
    std::uint64_t document_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: data, type: Any
    gm::wire::GMValue data = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: fields, type: Any
    gm::wire::GMValue fields = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_write_batch_set_merge_fields(batch_ref, document_ref, data, fields);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_write_batch_update(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: batch_ref, type: UInt64
    std::uint64_t batch_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: document_ref, type: UInt64
    std::uint64_t document_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: data, type: Any
    gm::wire::GMValue data = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_write_batch_update(batch_ref, document_ref, data);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_write_batch_delete(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: batch_ref, type: UInt64
    std::uint64_t batch_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: document_ref, type: UInt64
    std::uint64_t document_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_write_batch_delete(batch_ref, document_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_write_batch_commit(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: batch_ref, type: UInt64
    std::uint64_t batch_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_write_batch_commit(batch_ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_write_batch_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: batch_ref, type: UInt64
    std::uint64_t batch_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_firestore_write_batch_release(batch_ref);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_delete(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_firestore_field_value_delete();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_server_timestamp(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_firestore_field_value_server_timestamp();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_array_union(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_field_value_array_union(values);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_array_remove(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_field_value_array_remove(values);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_increment_integer(double value, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_firestore_field_value_increment_integer(static_cast<double>(value));
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_increment_double(double value, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_firestore_field_value_increment_double(static_cast<double>(value));
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_integer(double value, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_firestore_field_value_integer(static_cast<double>(value));
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_double(double value, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_firestore_field_value_double(static_cast<double>(value));
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_timestamp(double seconds, double nanoseconds, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_firestore_field_value_timestamp(static_cast<double>(seconds), static_cast<double>(nanoseconds));
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_geo_point(double latitude, double longitude, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_firestore_field_value_geo_point(static_cast<double>(latitude), static_cast<double>(longitude));
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_reference(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: document_ref, type: UInt64
    std::uint64_t document_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_reference(document_ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_blob(char* data, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_firestore_field_value_blob(data);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_null(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_firestore_field_value_null();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_firestore_field_value_release(ref);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_snapshot_get_info(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_document_snapshot_get_info(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: struct FirestoreDocumentSnapshotInfo
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_snapshot_get(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: server_timestamp_behavior, type: Float64
    double server_timestamp_behavior = gm::wire::codec::readValue<double>(__br);

    auto&& __result = firebase_firestore_document_snapshot_get(ref, field, server_timestamp_behavior);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_snapshot_get_data(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: server_timestamp_behavior, type: Float64
    double server_timestamp_behavior = gm::wire::codec::readValue<double>(__br);

    auto&& __result = firebase_firestore_document_snapshot_get_data(ref, server_timestamp_behavior);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_snapshot_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_firestore_document_snapshot_release(ref);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_snapshot_get_info(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_query_snapshot_get_info(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: struct FirestoreQuerySnapshotInfo
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_snapshot_documents(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_query_snapshot_documents(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_snapshot_document_changes(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: include_metadata_changes, type: Bool
    bool include_metadata_changes = gm::wire::codec::readValue<bool>(__br);

    auto&& __result = firebase_firestore_query_snapshot_document_changes(ref, include_metadata_changes);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_snapshot_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_firestore_query_snapshot_release(ref);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_listener_registration_remove(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_firestore_listener_registration_remove(ref);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_storage_get_instance(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_storage_get_instance();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_storage_get_instance_with_url(char* url, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_storage_get_instance_with_url(url);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_storage_url(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: storage_ref, type: UInt64
    std::uint64_t storage_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_storage_url(storage_ref);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_storage_get_reference(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: storage_ref, type: UInt64
    std::uint64_t storage_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_get_reference(storage_ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_storage_get_reference_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: storage_ref, type: UInt64
    std::uint64_t storage_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: path, type: String
    std::string_view path = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_storage_get_reference_path(storage_ref, path);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_storage_get_reference_from_url(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: storage_ref, type: UInt64
    std::uint64_t storage_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: url, type: String
    std::string_view url = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_storage_get_reference_from_url(storage_ref, url);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_storage_max_download_retry_time(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: storage_ref, type: UInt64
    std::uint64_t storage_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_max_download_retry_time(storage_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_set_max_download_retry_time(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: storage_ref, type: UInt64
    std::uint64_t storage_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: seconds, type: Float64
    double seconds = gm::wire::codec::readValue<double>(__br);

    firebase_storage_set_max_download_retry_time(storage_ref, seconds);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_storage_max_upload_retry_time(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: storage_ref, type: UInt64
    std::uint64_t storage_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_max_upload_retry_time(storage_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_set_max_upload_retry_time(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: storage_ref, type: UInt64
    std::uint64_t storage_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: seconds, type: Float64
    double seconds = gm::wire::codec::readValue<double>(__br);

    firebase_storage_set_max_upload_retry_time(storage_ref, seconds);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_storage_max_operation_retry_time(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: storage_ref, type: UInt64
    std::uint64_t storage_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_max_operation_retry_time(storage_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_set_max_operation_retry_time(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: storage_ref, type: UInt64
    std::uint64_t storage_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: seconds, type: Float64
    double seconds = gm::wire::codec::readValue<double>(__br);

    firebase_storage_set_max_operation_retry_time(storage_ref, seconds);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_storage_use_emulator(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: storage_ref, type: UInt64
    std::uint64_t storage_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: host, type: String
    std::string_view host = gm::wire::codec::readValue<std::string_view>(__br);

    // field: port, type: Float64
    double port = gm::wire::codec::readValue<double>(__br);

    firebase_storage_use_emulator(storage_ref, host, port);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_storage_ref_child(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: path, type: String
    std::string_view path = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_storage_ref_child(ref, path);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_storage_ref_get_parent(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_ref_get_parent(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_storage_ref_bucket(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_storage_ref_bucket(ref);
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_storage_ref_full_path(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_storage_ref_full_path(ref);
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_storage_ref_name(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_storage_ref_name(ref);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_storage_ref_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_ref_is_valid(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_ref_storage(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_ref_storage(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_storage_ref_delete(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_storage_ref_delete(ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_ref_get_download_url(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_storage_ref_get_download_url(ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_ref_get_metadata(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_storage_ref_get_metadata(ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_ref_update_metadata(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: metadata_ref, type: UInt64
    std::uint64_t metadata_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_storage_ref_update_metadata(ref, metadata_ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_ref_put_bytes(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: data, type: Buffer
    gm::wire::GMBuffer data = __buffer_queue.front();
    __buffer_queue.pop();

    // field: metadata_ref, type: UInt64
    std::uint64_t metadata_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: progress_callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> progress_callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        progress_callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    // field: controller_ref, type: UInt64
    std::uint64_t controller_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_storage_ref_put_bytes(ref, data, metadata_ref, progress_callback, controller_ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_ref_put_file(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: local_path, type: String
    std::string_view local_path = gm::wire::codec::readValue<std::string_view>(__br);

    // field: metadata_ref, type: UInt64
    std::uint64_t metadata_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: progress_callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> progress_callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        progress_callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    // field: controller_ref, type: UInt64
    std::uint64_t controller_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_storage_ref_put_file(ref, local_path, metadata_ref, progress_callback, controller_ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_ref_get_bytes(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: data, type: Buffer
    gm::wire::GMBuffer data = __buffer_queue.front();
    __buffer_queue.pop();

    // field: progress_callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> progress_callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        progress_callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    // field: controller_ref, type: UInt64
    std::uint64_t controller_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_storage_ref_get_bytes(ref, data, progress_callback, controller_ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_ref_get_file(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: local_path, type: String
    std::string_view local_path = gm::wire::codec::readValue<std::string_view>(__br);

    // field: progress_callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> progress_callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        progress_callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    // field: controller_ref, type: UInt64
    std::uint64_t controller_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_storage_ref_get_file(ref, local_path, progress_callback, controller_ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_ref_list(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: max_results, type: Float64
    double max_results = gm::wire::codec::readValue<double>(__br);

    // field: page_token, type: String
    std::string_view page_token = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_storage_ref_list(ref, max_results, page_token, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_metadata_create(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_storage_metadata_create();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_storage_metadata_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_metadata_release(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_metadata_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_metadata_is_valid(ref);
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_storage_metadata_bucket(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_storage_metadata_bucket(ref);
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_storage_metadata_cache_control(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_storage_metadata_cache_control(ref);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_storage_metadata_set_cache_control(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: String
    std::string_view value = gm::wire::codec::readValue<std::string_view>(__br);

    firebase_storage_metadata_set_cache_control(ref, value);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_storage_metadata_content_disposition(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_storage_metadata_content_disposition(ref);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_storage_metadata_set_content_disposition(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: String
    std::string_view value = gm::wire::codec::readValue<std::string_view>(__br);

    firebase_storage_metadata_set_content_disposition(ref, value);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_storage_metadata_content_encoding(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_storage_metadata_content_encoding(ref);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_storage_metadata_set_content_encoding(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: String
    std::string_view value = gm::wire::codec::readValue<std::string_view>(__br);

    firebase_storage_metadata_set_content_encoding(ref, value);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_storage_metadata_content_language(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_storage_metadata_content_language(ref);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_storage_metadata_set_content_language(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: String
    std::string_view value = gm::wire::codec::readValue<std::string_view>(__br);

    firebase_storage_metadata_set_content_language(ref, value);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_storage_metadata_content_type(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_storage_metadata_content_type(ref);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_storage_metadata_set_content_type(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: String
    std::string_view value = gm::wire::codec::readValue<std::string_view>(__br);

    firebase_storage_metadata_set_content_type(ref, value);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_storage_metadata_creation_time(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_metadata_creation_time(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_metadata_generation(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_metadata_generation(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_metadata_metadata_generation(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_metadata_metadata_generation(ref);
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_storage_metadata_name(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_storage_metadata_name(ref);
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_storage_metadata_path(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_storage_metadata_path(ref);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_storage_metadata_get_reference(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_metadata_get_reference(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_storage_metadata_size_bytes(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_metadata_size_bytes(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_metadata_updated_time(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_metadata_updated_time(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_metadata_custom_metadata_count(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_metadata_custom_metadata_count(ref);
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_storage_metadata_custom_metadata_key_at(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: index, type: Float64
    double index = gm::wire::codec::readValue<double>(__br);

    static std::string __result;
    __result = firebase_storage_metadata_custom_metadata_key_at(ref, index);
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_storage_metadata_get_custom_metadata(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: key, type: String
    std::string_view key = gm::wire::codec::readValue<std::string_view>(__br);

    static std::string __result;
    __result = firebase_storage_metadata_get_custom_metadata(ref, key);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_storage_metadata_set_custom_metadata(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: key, type: String
    std::string_view key = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: String
    std::string_view value = gm::wire::codec::readValue<std::string_view>(__br);

    firebase_storage_metadata_set_custom_metadata(ref, key, value);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_storage_controller_create(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_storage_controller_create();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_storage_controller_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_controller_release(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_controller_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_controller_is_valid(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_controller_pause(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_controller_pause(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_controller_resume(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_controller_resume(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_controller_cancel(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_controller_cancel(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_controller_is_paused(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_controller_is_paused(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_controller_bytes_transferred(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_controller_bytes_transferred(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_controller_total_byte_count(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_controller_total_byte_count(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_controller_get_reference(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_controller_get_reference(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_storage_list_result_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_list_result_release(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_list_result_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_list_result_is_valid(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_list_result_item_count(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_list_result_item_count(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_list_result_item_at(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: index, type: Float64
    double index = gm::wire::codec::readValue<double>(__br);

    auto&& __result = firebase_storage_list_result_item_at(ref, index);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_storage_list_result_prefix_count(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_list_result_prefix_count(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_storage_list_result_prefix_at(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: index, type: Float64
    double index = gm::wire::codec::readValue<double>(__br);

    auto&& __result = firebase_storage_list_result_prefix_at(ref, index);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_storage_list_result_next_page_token(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_storage_list_result_next_page_token(ref);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_functions_get_instance(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_functions_get_instance();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_functions_get_instance_with_region(char* region, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_functions_get_instance_with_region(region);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_functions_use_functions_emulator(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: functions_ref, type: UInt64
    std::uint64_t functions_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: origin, type: String
    std::string_view origin = gm::wire::codec::readValue<std::string_view>(__br);

    firebase_functions_use_functions_emulator(functions_ref, origin);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_functions_get_https_callable(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: functions_ref, type: UInt64
    std::uint64_t functions_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: name, type: String
    std::string_view name = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_functions_get_https_callable(functions_ref, name);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_functions_get_https_callable_with_options(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: functions_ref, type: UInt64
    std::uint64_t functions_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: name, type: String
    std::string_view name = gm::wire::codec::readValue<std::string_view>(__br);

    // field: limited_use_app_check_token, type: Float64
    double limited_use_app_check_token = gm::wire::codec::readValue<double>(__br);

    auto&& __result = firebase_functions_get_https_callable_with_options(functions_ref, name, limited_use_app_check_token);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_functions_get_https_callable_from_url(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: functions_ref, type: UInt64
    std::uint64_t functions_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: url, type: String
    std::string_view url = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_functions_get_https_callable_from_url(functions_ref, url);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_functions_get_https_callable_from_url_with_options(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: functions_ref, type: UInt64
    std::uint64_t functions_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: url, type: String
    std::string_view url = gm::wire::codec::readValue<std::string_view>(__br);

    // field: limited_use_app_check_token, type: Float64
    double limited_use_app_check_token = gm::wire::codec::readValue<double>(__br);

    auto&& __result = firebase_functions_get_https_callable_from_url_with_options(functions_ref, url, limited_use_app_check_token);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_functions_callable_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_functions_callable_is_valid(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_functions_callable_call(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_functions_callable_call(ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_functions_callable_call_with_data(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: data, type: Any
    gm::wire::GMValue data = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_functions_callable_call_with_data(ref, data, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_get_instance(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_remote_config_get_instance();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_ensure_initialized(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_remote_config_ensure_initialized(rc_ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_set_config_settings(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: fetch_timeout_ms, type: Float64
    double fetch_timeout_ms = gm::wire::codec::readValue<double>(__br);

    // field: minimum_fetch_interval_ms, type: Float64
    double minimum_fetch_interval_ms = gm::wire::codec::readValue<double>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_remote_config_set_config_settings(rc_ref, fetch_timeout_ms, minimum_fetch_interval_ms, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_get_config_settings_fetch_timeout(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_remote_config_get_config_settings_fetch_timeout(rc_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_get_config_settings_minimum_fetch_interval(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_remote_config_get_config_settings_minimum_fetch_interval(rc_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_fetch(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_remote_config_fetch(rc_ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_fetch_with_expiration(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: cache_expiration_in_seconds, type: Float64
    double cache_expiration_in_seconds = gm::wire::codec::readValue<double>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_remote_config_fetch_with_expiration(rc_ref, cache_expiration_in_seconds, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_fetch_and_activate(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_remote_config_fetch_and_activate(rc_ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_activate(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_remote_config_activate(rc_ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_get_boolean(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: key, type: String
    std::string_view key = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_remote_config_get_boolean(rc_ref, key);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_get_long(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: key, type: String
    std::string_view key = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_remote_config_get_long(rc_ref, key);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_get_double(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: key, type: String
    std::string_view key = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_remote_config_get_double(rc_ref, key);
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_remote_config_get_string(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: key, type: String
    std::string_view key = gm::wire::codec::readValue<std::string_view>(__br);

    static std::string __result;
    __result = firebase_remote_config_get_string(rc_ref, key);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_get_data_size(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: key, type: String
    std::string_view key = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_remote_config_get_data_size(rc_ref, key);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_get_data(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: key, type: String
    std::string_view key = gm::wire::codec::readValue<std::string_view>(__br);

    // field: out_buffer, type: Buffer
    gm::wire::GMBuffer out_buffer = __buffer_queue.front();
    __buffer_queue.pop();

    auto&& __result = firebase_remote_config_get_data(rc_ref, key, out_buffer);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_get_keys_by_prefix(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: prefix, type: String
    std::string_view prefix = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_remote_config_get_keys_by_prefix(rc_ref, prefix, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_get_keys(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_remote_config_get_keys(rc_ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_get_all(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_remote_config_get_all(rc_ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_set_defaults(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: defaults, type: Any
    gm::wire::GMValue defaults = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_remote_config_set_defaults(rc_ref, defaults, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_get_info(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_remote_config_get_info(rc_ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: struct FirebaseRemoteConfigInfo
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_add_config_update_listener(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_remote_config_add_config_update_listener(rc_ref, callback);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_remove_config_update_listener(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: reg_ref, type: UInt64
    std::uint64_t reg_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_remote_config_remove_config_update_listener(reg_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_initialize()
{
    auto&& __result = firebase_messaging_initialize();
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_terminate()
{
    firebase_messaging_terminate();
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_set_token_registration_on_init_enabled(double enabled)
{
    firebase_messaging_set_token_registration_on_init_enabled(static_cast<double>(enabled));
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_is_token_registration_on_init_enabled()
{
    auto&& __result = firebase_messaging_is_token_registration_on_init_enabled();
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_delivery_metrics_export_to_big_query_enabled()
{
    auto&& __result = firebase_messaging_delivery_metrics_export_to_big_query_enabled();
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_set_delivery_metrics_export_to_big_query(double enabled)
{
    firebase_messaging_set_delivery_metrics_export_to_big_query(static_cast<double>(enabled));
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_request_permission(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_messaging_request_permission(callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_get_token(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_messaging_get_token(callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_delete_token(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_messaging_delete_token(callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_subscribe(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: topic, type: String
    std::string_view topic = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_messaging_subscribe(topic, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_unsubscribe(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: topic, type: String
    std::string_view topic = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_messaging_unsubscribe(topic, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_poll_message()
{
    auto&& __result = firebase_messaging_poll_message();
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_poll_token()
{
    auto&& __result = firebase_messaging_poll_token();
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_current_token()
{
    static std::string __result;
    __result = firebase_messaging_current_token();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_from()
{
    static std::string __result;
    __result = firebase_messaging_message_from();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_to()
{
    static std::string __result;
    __result = firebase_messaging_message_to();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_collapse_key()
{
    static std::string __result;
    __result = firebase_messaging_message_collapse_key();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_message_id()
{
    static std::string __result;
    __result = firebase_messaging_message_message_id();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_message_type()
{
    static std::string __result;
    __result = firebase_messaging_message_message_type();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_priority()
{
    static std::string __result;
    __result = firebase_messaging_message_priority();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_original_priority()
{
    static std::string __result;
    __result = firebase_messaging_message_original_priority();
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_message_time_to_live()
{
    auto&& __result = firebase_messaging_message_time_to_live();
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_message_sent_time()
{
    auto&& __result = firebase_messaging_message_sent_time();
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_error()
{
    static std::string __result;
    __result = firebase_messaging_message_error();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_error_description()
{
    static std::string __result;
    __result = firebase_messaging_message_error_description();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_link()
{
    static std::string __result;
    __result = firebase_messaging_message_link();
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_message_notification_opened()
{
    auto&& __result = firebase_messaging_message_notification_opened();
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_message_data_count()
{
    auto&& __result = firebase_messaging_message_data_count();
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_data_key_at(double index)
{
    static std::string __result;
    __result = firebase_messaging_message_data_key_at(static_cast<double>(index));
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_get_data(char* key)
{
    static std::string __result;
    __result = firebase_messaging_message_get_data(key);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_message_raw_data_size()
{
    auto&& __result = firebase_messaging_message_raw_data_size();
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_message_raw_data_copy(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: out_buffer, type: Buffer
    gm::wire::GMBuffer out_buffer = __buffer_queue.front();
    __buffer_queue.pop();

    auto&& __result = firebase_messaging_message_raw_data_copy(out_buffer);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_message_has_notification()
{
    auto&& __result = firebase_messaging_message_has_notification();
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_notification_title()
{
    static std::string __result;
    __result = firebase_messaging_message_notification_title();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_notification_body()
{
    static std::string __result;
    __result = firebase_messaging_message_notification_body();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_notification_icon()
{
    static std::string __result;
    __result = firebase_messaging_message_notification_icon();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_notification_sound()
{
    static std::string __result;
    __result = firebase_messaging_message_notification_sound();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_notification_badge()
{
    static std::string __result;
    __result = firebase_messaging_message_notification_badge();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_notification_tag()
{
    static std::string __result;
    __result = firebase_messaging_message_notification_tag();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_notification_color()
{
    static std::string __result;
    __result = firebase_messaging_message_notification_color();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_notification_click_action()
{
    static std::string __result;
    __result = firebase_messaging_message_notification_click_action();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_notification_body_loc_key()
{
    static std::string __result;
    __result = firebase_messaging_message_notification_body_loc_key();
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_message_notification_body_loc_args_count()
{
    auto&& __result = firebase_messaging_message_notification_body_loc_args_count();
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_notification_body_loc_args_at(double index)
{
    static std::string __result;
    __result = firebase_messaging_message_notification_body_loc_args_at(static_cast<double>(index));
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_notification_title_loc_key()
{
    static std::string __result;
    __result = firebase_messaging_message_notification_title_loc_key();
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_message_notification_title_loc_args_count()
{
    auto&& __result = firebase_messaging_message_notification_title_loc_args_count();
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_notification_title_loc_args_at(double index)
{
    static std::string __result;
    __result = firebase_messaging_message_notification_title_loc_args_at(static_cast<double>(index));
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_messaging_message_notification_android_channel_id()
{
    static std::string __result;
    __result = firebase_messaging_message_notification_android_channel_id();
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_ump_get_instance(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_ump_get_instance();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: optional<UInt64>
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_ump_get_consent_status(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: consent_ref, type: UInt64
    std::uint64_t consent_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_ump_get_consent_status(consent_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_ump_get_consent_form_status(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: consent_ref, type: UInt64
    std::uint64_t consent_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_ump_get_consent_form_status(consent_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_ump_get_privacy_options_requirement_status(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: consent_ref, type: UInt64
    std::uint64_t consent_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_ump_get_privacy_options_requirement_status(consent_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_ump_can_request_ads(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: consent_ref, type: UInt64
    std::uint64_t consent_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_ump_can_request_ads(consent_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_ump_reset(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: consent_ref, type: UInt64
    std::uint64_t consent_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_ump_reset(consent_ref);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_ump_request_consent_info_update(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: consent_ref, type: UInt64
    std::uint64_t consent_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: debug_geography, type: Float64
    double debug_geography = gm::wire::codec::readValue<double>(__br);

    // field: tag_for_under_age_of_consent, type: Float64
    double tag_for_under_age_of_consent = gm::wire::codec::readValue<double>(__br);

    // field: debug_device_ids, type: Any
    gm::wire::GMValue debug_device_ids = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_ump_request_consent_info_update(consent_ref, debug_geography, tag_for_under_age_of_consent, debug_device_ids, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_ump_load_consent_form(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: consent_ref, type: UInt64
    std::uint64_t consent_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_ump_load_consent_form(consent_ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_ump_show_consent_form(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: consent_ref, type: UInt64
    std::uint64_t consent_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: form_parent, type: UInt64
    std::uint64_t form_parent = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_ump_show_consent_form(consent_ref, form_parent, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_ump_load_and_show_consent_form_if_required(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: consent_ref, type: UInt64
    std::uint64_t consent_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: form_parent, type: UInt64
    std::uint64_t form_parent = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_ump_load_and_show_consent_form_if_required(consent_ref, form_parent, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_ump_show_privacy_options_form(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: consent_ref, type: UInt64
    std::uint64_t consent_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: form_parent, type: UInt64
    std::uint64_t form_parent = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_ump_show_privacy_options_form(consent_ref, form_parent, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_notify_app_lifecycle_change(double state)
{
    firebase_analytics_notify_app_lifecycle_change(static_cast<double>(state));
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_hashed_email(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: hashed_email, type: Buffer
    gm::wire::GMBuffer hashed_email = __buffer_queue.front();
    __buffer_queue.pop();

    firebase_analytics_initiate_on_device_conversion_measurement_hashed_email(hashed_email);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: hashed_phone, type: Buffer
    gm::wire::GMBuffer hashed_phone = __buffer_queue.front();
    __buffer_queue.pop();

    firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone(hashed_phone);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_federated_oauth_provider_create(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: provider_id, type: String
    std::string_view provider_id = gm::wire::codec::readValue<std::string_view>(__br);

    // field: scopes, type: Any
    gm::wire::GMValue scopes = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: custom_parameters, type: Any
    gm::wire::GMValue custom_parameters = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_auth_federated_oauth_provider_create(provider_id, scopes, custom_parameters);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_federated_oauth_provider_set_data(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: provider, type: UInt64
    std::uint64_t provider = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: provider_id, type: String
    std::string_view provider_id = gm::wire::codec::readValue<std::string_view>(__br);

    // field: scopes, type: Any
    gm::wire::GMValue scopes = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: custom_parameters, type: Any
    gm::wire::GMValue custom_parameters = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    firebase_auth_federated_oauth_provider_set_data(provider, provider_id, scopes, custom_parameters);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_federated_oauth_provider_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: provider, type: UInt64
    std::uint64_t provider = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_auth_federated_oauth_provider_release(provider);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_in_with_provider(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: provider, type: UInt64
    std::uint64_t provider = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_sign_in_with_provider(provider, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_in_with_custom_token_result(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: custom_token, type: String
    std::string_view custom_token = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_sign_in_with_custom_token_result(custom_token, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_in_and_retrieve_data_with_credential_result(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: credential, type: UInt64
    std::uint64_t credential = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_sign_in_and_retrieve_data_with_credential_result(credential, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_in_anonymously_result(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_sign_in_anonymously_result(callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_in_with_email_and_password_result(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: email, type: String
    std::string_view email = gm::wire::codec::readValue<std::string_view>(__br);

    // field: password, type: String
    std::string_view password = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_sign_in_with_email_and_password_result(email, password, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_create_user_with_email_and_password_result(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: email, type: String
    std::string_view email = gm::wire::codec::readValue<std::string_view>(__br);

    // field: password, type: String
    std::string_view password = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_create_user_with_email_and_password_result(email, password, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_provider_data_count(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user, type: UInt64
    std::uint64_t user = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_user_provider_data_count(user);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_provider_data_at(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user, type: UInt64
    std::uint64_t user = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: index, type: Float64
    double index = gm::wire::codec::readValue<double>(__br);

    auto&& __result = firebase_auth_user_provider_data_at(user, index);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_reauthenticate_with_provider(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user, type: UInt64
    std::uint64_t user = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: provider, type: UInt64
    std::uint64_t provider = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_reauthenticate_with_provider(user, provider, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_link_with_provider(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user, type: UInt64
    std::uint64_t user = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: provider, type: UInt64
    std::uint64_t provider = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_link_with_provider(user, provider, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_reauthenticate_and_retrieve_data_result(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user, type: UInt64
    std::uint64_t user = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: credential, type: UInt64
    std::uint64_t credential = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_reauthenticate_and_retrieve_data_result(user, credential, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_link_with_credential_result(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user, type: UInt64
    std::uint64_t user = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: credential, type: UInt64
    std::uint64_t credential = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_link_with_credential_result(user, credential, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_update_phone_number_credential(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user, type: UInt64
    std::uint64_t user = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: phone_credential, type: UInt64
    std::uint64_t phone_credential = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_update_phone_number_credential(user, phone_credential, callback);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_database_ref_key(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_database_ref_key(ref);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_is_root(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_ref_is_root(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_ref_is_valid(ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_get_parent(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_ref_get_parent(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_get_root(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_ref_get_root(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_get_database(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_ref_get_database(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_database_ref_get_url(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_database_ref_get_url(ref);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_database_server_timestamp(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_database_server_timestamp();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_ref_on_disconnect(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: ref, type: UInt64
    std::uint64_t ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_ref_on_disconnect(ref);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_on_disconnect_cancel(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: handler, type: UInt64
    std::uint64_t handler = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_database_on_disconnect_cancel(handler, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_on_disconnect_remove_value(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: handler, type: UInt64
    std::uint64_t handler = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_database_on_disconnect_remove_value(handler, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_on_disconnect_set_value(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: handler, type: UInt64
    std::uint64_t handler = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_database_on_disconnect_set_value(handler, value, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_on_disconnect_set_value_and_priority(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: handler, type: UInt64
    std::uint64_t handler = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: priority, type: Any
    gm::wire::GMValue priority = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_database_on_disconnect_set_value_and_priority(handler, value, priority, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_on_disconnect_update_children(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: handler, type: UInt64
    std::uint64_t handler = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_database_on_disconnect_update_children(handler, values, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_database_on_disconnect_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: handler, type: UInt64
    std::uint64_t handler = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_database_on_disconnect_release(handler);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_path_create(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: components, type: Any
    gm::wire::GMValue components = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_field_path_create(components);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_path_document_id(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_firestore_field_path_document_id();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_path_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_path_is_valid(field_path);
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_firestore_field_path_to_string(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_firestore_field_path_to_string(field_path);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_path_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_firestore_field_path_release(field_path);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_equal_to(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_equal_to(field, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_not_equal_to(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_not_equal_to(field, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_less_than(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_less_than(field, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_less_than_or_equal_to(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_less_than_or_equal_to(field, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_greater_than(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_greater_than(field, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_greater_than_or_equal_to(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_greater_than_or_equal_to(field, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_array_contains(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_array_contains(field, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_array_contains_any(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_array_contains_any(field, values);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_in(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_in(field, values);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_not_in(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_not_in(field, values);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_equal_to_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_equal_to_field_path(field_path, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_not_equal_to_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_not_equal_to_field_path(field_path, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_less_than_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_less_than_field_path(field_path, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_less_than_or_equal_to_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_less_than_or_equal_to_field_path(field_path, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_greater_than_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_greater_than_field_path(field_path, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_greater_than_or_equal_to_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_greater_than_or_equal_to_field_path(field_path, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_array_contains_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_array_contains_field_path(field_path, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_array_contains_any_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_array_contains_any_field_path(field_path, values);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_in_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_in_field_path(field_path, values);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_not_in_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_not_in_field_path(field_path, values);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_and(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: filters, type: Any
    gm::wire::GMValue filters = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_and(filters);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_or(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: filters, type: Any
    gm::wire::GMValue filters = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_or(filters);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: filter, type: UInt64
    std::uint64_t filter = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_firestore_filter_release(filter);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_where_filter(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: query, type: UInt64
    std::uint64_t query = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: filter, type: UInt64
    std::uint64_t filter = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_query_where_filter(query, filter);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_where_equal_to_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: query, type: UInt64
    std::uint64_t query = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_where_equal_to_field_path(query, field_path, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_where_not_equal_to_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: query, type: UInt64
    std::uint64_t query = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_where_not_equal_to_field_path(query, field_path, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_where_less_than_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: query, type: UInt64
    std::uint64_t query = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_where_less_than_field_path(query, field_path, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_where_less_than_or_equal_to_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: query, type: UInt64
    std::uint64_t query = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_where_less_than_or_equal_to_field_path(query, field_path, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_where_greater_than_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: query, type: UInt64
    std::uint64_t query = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_where_greater_than_field_path(query, field_path, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_where_greater_than_or_equal_to_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: query, type: UInt64
    std::uint64_t query = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_where_greater_than_or_equal_to_field_path(query, field_path, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_where_array_contains_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: query, type: UInt64
    std::uint64_t query = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_where_array_contains_field_path(query, field_path, value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_where_array_contains_any_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: query, type: UInt64
    std::uint64_t query = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_where_array_contains_any_field_path(query, field_path, values);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_where_in_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: query, type: UInt64
    std::uint64_t query = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_where_in_field_path(query, field_path, values);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_where_not_in_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: query, type: UInt64
    std::uint64_t query = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_query_where_not_in_field_path(query, field_path, values);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_order_by_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: query, type: UInt64
    std::uint64_t query = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: direction, type: Float64
    double direction = gm::wire::codec::readValue<double>(__br);

    auto&& __result = firebase_firestore_query_order_by_field_path(query, field_path, direction);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_count(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: query, type: UInt64
    std::uint64_t query = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_query_count(query);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_aggregate_query_get_query(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: aggregate_query, type: UInt64
    std::uint64_t aggregate_query = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_aggregate_query_get_query(aggregate_query);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_aggregate_query_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: aggregate_query, type: UInt64
    std::uint64_t aggregate_query = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_aggregate_query_is_valid(aggregate_query);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_aggregate_query_get(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: aggregate_query, type: UInt64
    std::uint64_t aggregate_query = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: source, type: Float64
    double source = gm::wire::codec::readValue<double>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_aggregate_query_get(aggregate_query, source, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_aggregate_query_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: aggregate_query, type: UInt64
    std::uint64_t aggregate_query = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_firestore_aggregate_query_release(aggregate_query);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_aggregate_snapshot_count(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_aggregate_snapshot_count(snapshot);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_aggregate_snapshot_get_query(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_aggregate_snapshot_get_query(snapshot);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_aggregate_snapshot_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_aggregate_snapshot_is_valid(snapshot);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_aggregate_snapshot_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_firestore_aggregate_snapshot_release(snapshot);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_add_snapshots_in_sync_listener(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: firestore, type: UInt64
    std::uint64_t firestore = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_add_snapshots_in_sync_listener(firestore, callback);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_load_bundle(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: firestore, type: UInt64
    std::uint64_t firestore = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: bundle, type: Buffer
    gm::wire::GMBuffer bundle = __buffer_queue.front();
    __buffer_queue.pop();

    // field: progress_callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> progress_callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        progress_callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_load_bundle(firestore, bundle, progress_callback, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_named_query(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: firestore, type: UInt64
    std::uint64_t firestore = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: name, type: String
    std::string_view name = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_named_query(firestore, name, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_ref_set_merge_field_paths(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: document, type: UInt64
    std::uint64_t document = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: data, type: Any
    gm::wire::GMValue data = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: field_paths, type: Any
    gm::wire::GMValue field_paths = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_document_ref_set_merge_field_paths(document, data, field_paths, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_write_batch_set_merge_field_paths(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: batch, type: UInt64
    std::uint64_t batch = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: document, type: UInt64
    std::uint64_t document = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: data, type: Any
    gm::wire::GMValue data = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: field_paths, type: Any
    gm::wire::GMValue field_paths = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    firebase_firestore_write_batch_set_merge_field_paths(batch, document, data, field_paths);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_storage_metadata_md5_hash(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: metadata, type: UInt64
    std::uint64_t metadata = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_storage_metadata_md5_hash(metadata);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_ensure_initialized_info(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_remote_config_ensure_initialized_info(rc_ref, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_get_boolean_with_info(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: key, type: String
    std::string_view key = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_remote_config_get_boolean_with_info(rc_ref, key);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_get_long_with_info(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: key, type: String
    std::string_view key = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_remote_config_get_long_with_info(rc_ref, key);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_get_double_with_info(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: key, type: String
    std::string_view key = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_remote_config_get_double_with_info(rc_ref, key);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_get_string_with_info(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: key, type: String
    std::string_view key = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_remote_config_get_string_with_info(rc_ref, key);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_get_data_with_info(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: rc_ref, type: UInt64
    std::uint64_t rc_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: key, type: String
    std::string_view key = gm::wire::codec::readValue<std::string_view>(__br);

    // field: out_buffer, type: Buffer
    gm::wire::GMBuffer out_buffer = __buffer_queue.front();
    __buffer_queue.pop();

    auto&& __result = firebase_remote_config_get_data_with_info(rc_ref, key, out_buffer);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_initialize_with_options(double suppress_notification_permission_prompt)
{
    auto&& __result = firebase_messaging_initialize_with_options(static_cast<double>(suppress_notification_permission_prompt));
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_type(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_type(field_value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_is_valid(field_value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_is_null(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_is_null(field_value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_is_boolean(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_is_boolean(field_value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_is_integer(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_is_integer(field_value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_is_double(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_is_double(field_value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_is_timestamp(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_is_timestamp(field_value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_is_string(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_is_string(field_value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_is_blob(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_is_blob(field_value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_is_reference(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_is_reference(field_value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_is_geo_point(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_is_geo_point(field_value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_is_array(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_is_array(field_value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_is_map(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_is_map(field_value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_boolean_value(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_boolean_value(field_value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_integer_value(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_integer_value(field_value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_double_value(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_double_value(field_value);
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_firestore_field_value_string_value(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_firestore_field_value_string_value(field_value);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_blob_size(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_blob_size(field_value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_blob_copy(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: out_buffer, type: Buffer
    gm::wire::GMBuffer out_buffer = __buffer_queue.front();
    __buffer_queue.pop();

    auto&& __result = firebase_firestore_field_value_blob_copy(field_value, out_buffer);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_reference_value(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_reference_value(field_value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_timestamp_value(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_timestamp_value(field_value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_geo_point_value(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_geo_point_value(field_value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_array_value(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_array_value(field_value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_map_value(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_map_value(field_value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_firestore_field_value_to_string(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_value, type: UInt64
    std::uint64_t field_value = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_firestore_field_value_to_string(field_value);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_get_firestore(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: query, type: UInt64
    std::uint64_t query = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_query_get_firestore(query);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_ref_get_firestore(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: document, type: UInt64
    std::uint64_t document = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_document_ref_get_firestore(document);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_firestore_document_ref_to_string(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: document, type: UInt64
    std::uint64_t document = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_firestore_document_ref_to_string(document);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_ref_update_field_paths(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: document, type: UInt64
    std::uint64_t document = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: entries, type: Any
    gm::wire::GMValue entries = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_firestore_document_ref_update_field_paths(document, entries, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_write_batch_update_field_paths(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: batch, type: UInt64
    std::uint64_t batch = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: document, type: UInt64
    std::uint64_t document = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: entries, type: Any
    gm::wire::GMValue entries = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_write_batch_update_field_paths(batch, document, entries);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_write_batch_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: batch, type: UInt64
    std::uint64_t batch = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_write_batch_is_valid(batch);
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_firestore_settings_to_string(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: firestore, type: UInt64
    std::uint64_t firestore = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_firestore_settings_to_string(firestore);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_snapshot_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_document_snapshot_is_valid(snapshot);
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_firestore_document_snapshot_to_string(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_firestore_document_snapshot_to_string(snapshot);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_snapshot_get_field_path(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: server_timestamp_behavior, type: Float64
    double server_timestamp_behavior = gm::wire::codec::readValue<double>(__br);

    auto&& __result = firebase_firestore_document_snapshot_get_field_path(snapshot, field_path, server_timestamp_behavior);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_snapshot_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_query_snapshot_is_valid(snapshot);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_snapshot_get_query(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_query_snapshot_get_query(snapshot);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_listener_registration_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: listener, type: UInt64
    std::uint64_t listener = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_listener_registration_is_valid(listener);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_app_get_default_handle(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_app_get_default_handle();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_app_get_instance(char* name, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_app_get_instance(name);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_app_get_apps(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_app_get_apps();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_app_initialize_with_options(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: options, type: Any
    gm::wire::GMValue options = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: name, type: String
    std::string_view name = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_app_initialize_with_options(options, name);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_app_initialize_from_json(char* json_config, char* name, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_app_initialize_from_json(json_config, name);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_app_handle_get_name(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app, type: UInt64
    std::uint64_t app = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_app_handle_get_name(app);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_app_handle_get_options(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app, type: UInt64
    std::uint64_t app = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_app_handle_get_options(app);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_app_get_default_options(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_app_get_default_options();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_app_release_handle(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app, type: UInt64
    std::uint64_t app = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_app_release_handle(app);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_set_log_level(double level)
{
    firebase_set_log_level(static_cast<double>(level));
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_get_log_level()
{
    auto&& __result = firebase_get_log_level();
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_auth_get_app(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_auth_get_app();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_get_app(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: database, type: UInt64
    std::uint64_t database = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_get_app(database);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_get_instance_for_app(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app, type: UInt64
    std::uint64_t app = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_database_get_instance_for_app(app);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_database_get_instance_for_app_url(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app, type: UInt64
    std::uint64_t app = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: url, type: String
    std::string_view url = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_database_get_instance_for_app_url(app, url);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_get_app(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: firestore, type: UInt64
    std::uint64_t firestore = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_get_app(firestore);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_get_instance_for_app(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app, type: UInt64
    std::uint64_t app = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_get_instance_for_app(app);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_get_instance_for_app_database(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app, type: UInt64
    std::uint64_t app = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: database_id, type: String
    std::string_view database_id = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_firestore_get_instance_for_app_database(app, database_id);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_storage_get_app(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: storage, type: UInt64
    std::uint64_t storage = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_get_app(storage);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_storage_get_instance_for_app(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app, type: UInt64
    std::uint64_t app = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_storage_get_instance_for_app(app);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_storage_get_instance_for_app_url(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app, type: UInt64
    std::uint64_t app = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: url, type: String
    std::string_view url = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_storage_get_instance_for_app_url(app, url);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_functions_get_app(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: functions, type: UInt64
    std::uint64_t functions = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_functions_get_app(functions);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_functions_callable_get_functions(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callable, type: UInt64
    std::uint64_t callable = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_functions_callable_get_functions(callable);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_functions_get_instance_for_app(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app, type: UInt64
    std::uint64_t app = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_functions_get_instance_for_app(app);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_functions_get_instance_for_app_region(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app, type: UInt64
    std::uint64_t app = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: region, type: String
    std::string_view region = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_functions_get_instance_for_app_region(app, region);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_installations_get_app(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_installations_get_app();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_get_app(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: remote_config, type: UInt64
    std::uint64_t remote_config = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_remote_config_get_app(remote_config);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_app_check_get_app(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_app_check_get_app();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_boolean(double value, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_firestore_field_value_boolean(static_cast<bool>(value));
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_string(char* value, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_firestore_field_value_string(value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_array(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_field_value_array(value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_map(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_field_value_map(value);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_remote_config_get_instance_for_app(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app, type: UInt64
    std::uint64_t app = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_remote_config_get_instance_for_app(app);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_analytics_initialize_for_app(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app, type: UInt64
    std::uint64_t app = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_analytics_initialize_for_app(app);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_initialize_for_app(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app, type: UInt64
    std::uint64_t app = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_messaging_initialize_for_app(app);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_messaging_initialize_for_app_with_options(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app, type: UInt64
    std::uint64_t app = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: suppress_notification_permission_prompt, type: Float64
    double suppress_notification_permission_prompt = gm::wire::codec::readValue<double>(__br);

    auto&& __result = firebase_messaging_initialize_for_app_with_options(app, suppress_notification_permission_prompt);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_ump_get_instance_for_app(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app, type: UInt64
    std::uint64_t app = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_ump_get_instance_for_app(app);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: optional<UInt64>
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_get_current_instance_handle(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_auth_get_current_instance_handle();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_get_instance_for_app(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app, type: UInt64
    std::uint64_t app = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_get_instance_for_app(app);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_use_instance(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: auth, type: UInt64
    std::uint64_t auth = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_use_instance(auth);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_auth_instance_get_app(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: auth, type: UInt64
    std::uint64_t auth = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_instance_get_app(auth);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_installations_get_instance_handle(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_installations_get_instance_handle();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_installations_get_instance_for_app(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app, type: UInt64
    std::uint64_t app = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_installations_get_instance_for_app(app);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_installations_instance_get_app(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: installations, type: UInt64
    std::uint64_t installations = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_installations_instance_get_app(installations);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_installations_instance_get_id(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: installations, type: UInt64
    std::uint64_t installations = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_installations_instance_get_id(installations, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_installations_instance_get_token(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: installations, type: UInt64
    std::uint64_t installations = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: force_refresh, type: Bool
    bool force_refresh = gm::wire::codec::readValue<bool>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_installations_instance_get_token(installations, force_refresh, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_installations_instance_delete(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: installations, type: UInt64
    std::uint64_t installations = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_installations_instance_delete(installations, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_app_check_get_instance_handle(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_app_check_get_instance_handle();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_app_check_get_instance_for_app(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app, type: UInt64
    std::uint64_t app = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_app_check_get_instance_for_app(app);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_app_check_instance_get_app(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app_check, type: UInt64
    std::uint64_t app_check = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_app_check_instance_get_app(app_check);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_app_check_instance_set_token_auto_refresh_enabled(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app_check, type: UInt64
    std::uint64_t app_check = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: enabled, type: Bool
    bool enabled = gm::wire::codec::readValue<bool>(__br);

    firebase_app_check_instance_set_token_auto_refresh_enabled(app_check, enabled);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_app_check_instance_get_token(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app_check, type: UInt64
    std::uint64_t app_check = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: force_refresh, type: Bool
    bool force_refresh = gm::wire::codec::readValue<bool>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_app_check_instance_get_token(app_check, force_refresh, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_app_check_instance_get_limited_use_token(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app_check, type: UInt64
    std::uint64_t app_check = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_app_check_instance_get_limited_use_token(app_check, callback);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_app_check_instance_add_listener(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app_check, type: UInt64
    std::uint64_t app_check = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_app_check_instance_add_listener(app_check, callback);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_firestore_document_snapshot_metadata_to_string(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_firestore_document_snapshot_metadata_to_string(snapshot);
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_firestore_query_snapshot_metadata_to_string(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_firestore_query_snapshot_metadata_to_string(snapshot);
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_get_sdk_version()
{
    static std::string __result;
    __result = firebase_get_sdk_version();
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_snapshot_exists(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_document_snapshot_exists(snapshot);
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_firestore_document_snapshot_id(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_firestore_document_snapshot_id(snapshot);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_snapshot_reference(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_document_snapshot_reference(snapshot);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_snapshot_metadata_has_pending_writes(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_document_snapshot_metadata_has_pending_writes(snapshot);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_document_snapshot_metadata_is_from_cache(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_document_snapshot_metadata_is_from_cache(snapshot);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_snapshot_size(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_query_snapshot_size(snapshot);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_snapshot_empty(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_query_snapshot_empty(snapshot);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_snapshot_metadata_has_pending_writes(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_query_snapshot_metadata_has_pending_writes(snapshot);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_query_snapshot_metadata_is_from_cache(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: snapshot, type: UInt64
    std::uint64_t snapshot = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_query_snapshot_metadata_is_from_cache(snapshot);
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_email_auth_provider_id()
{
    static std::string __result;
    __result = firebase_auth_email_auth_provider_id();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_facebook_auth_provider_id()
{
    static std::string __result;
    __result = firebase_auth_facebook_auth_provider_id();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_game_center_auth_provider_id()
{
    static std::string __result;
    __result = firebase_auth_game_center_auth_provider_id();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_github_auth_provider_id()
{
    static std::string __result;
    __result = firebase_auth_github_auth_provider_id();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_google_auth_provider_id()
{
    static std::string __result;
    __result = firebase_auth_google_auth_provider_id();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_microsoft_auth_provider_id()
{
    static std::string __result;
    __result = firebase_auth_microsoft_auth_provider_id();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_play_games_auth_provider_id()
{
    static std::string __result;
    __result = firebase_auth_play_games_auth_provider_id();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_twitter_auth_provider_id()
{
    static std::string __result;
    __result = firebase_auth_twitter_auth_provider_id();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_yahoo_auth_provider_id()
{
    static std::string __result;
    __result = firebase_auth_yahoo_auth_provider_id();
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_auth_game_center_auth_provider_get_credential_last_result(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_game_center_auth_provider_get_credential_last_result(callback);
    return 0;
}

