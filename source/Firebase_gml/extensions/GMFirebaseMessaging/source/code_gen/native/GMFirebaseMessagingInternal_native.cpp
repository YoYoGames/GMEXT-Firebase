// ##### extgen :: Auto-generated file do not edit!! #####

#include "GMFirebaseMessagingInternal_native.h"
#include "GMFirebaseMessagingInternal_exports.h"

using namespace gm_structs;
using namespace gm::wire::codec;

static gm::runtime::DispatchQueue __dispatch_queue;

// Internal function used for fetching dispatched function calls to GML
GMEXPORT double __EXT_NATIVE__GMFirebaseMessaging_invocation_handler(char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferWriter __bw{ __ret_buffer, static_cast<size_t>(__ret_buffer_length) };
    return __dispatch_queue.fetch(__bw);
}

static std::queue<gm::wire::GMBuffer> __buffer_queue;

// Internal function used for queueing buffers to native code
GMEXPORT double __EXT_NATIVE__GMFirebaseMessaging_queue_buffer(char* __arg_buffer, double __arg_buffer_length)
{
    gm::wire::GMBuffer __buff{__arg_buffer, static_cast<uint64_t>(__arg_buffer_length)};
    __buffer_queue.push(__buff);

    return 1.0;
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

GMEXPORT double __EXT_NATIVE__firebase_messaging_initialize_with_options(double suppress_notification_permission_prompt)
{
    auto&& __result = firebase_messaging_initialize_with_options(static_cast<double>(suppress_notification_permission_prompt));
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

