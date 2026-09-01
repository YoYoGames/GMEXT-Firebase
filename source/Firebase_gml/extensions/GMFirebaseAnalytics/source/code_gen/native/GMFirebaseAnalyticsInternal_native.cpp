// ##### extgen :: Auto-generated file do not edit!! #####

#include "GMFirebaseAnalyticsInternal_native.h"
#include "GMFirebaseAnalyticsInternal_exports.h"

using namespace gm_structs;
using namespace gm::wire::codec;

static gm::runtime::DispatchQueue __dispatch_queue;

// Internal function used for fetching dispatched function calls to GML
GMEXPORT double __EXT_NATIVE__GMFirebaseAnalytics_invocation_handler(char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferWriter __bw{ __ret_buffer, static_cast<size_t>(__ret_buffer_length) };
    return __dispatch_queue.fetch(__bw);
}

static std::queue<gm::wire::GMBuffer> __buffer_queue;

// Internal function used for queueing buffers to native code
GMEXPORT double __EXT_NATIVE__GMFirebaseAnalytics_queue_buffer(char* __arg_buffer, double __arg_buffer_length)
{
    gm::wire::GMBuffer __buff{__arg_buffer, static_cast<uint64_t>(__arg_buffer_length)};
    __buffer_queue.push(__buff);

    return 1.0;
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

GMEXPORT double __EXT_NATIVE__firebase_analytics_initialize_for_app(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app, type: UInt64
    std::uint64_t app = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_analytics_initialize_for_app(app);
    return static_cast<double>(__result);
}

