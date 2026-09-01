// ##### extgen :: Auto-generated file do not edit!! #####

#include "GMFirebaseRemoteConfigInternal_native.h"
#include "GMFirebaseRemoteConfigInternal_exports.h"

using namespace gm_structs;
using namespace gm::wire::codec;

static gm::runtime::DispatchQueue __dispatch_queue;

// Internal function used for fetching dispatched function calls to GML
GMEXPORT double __EXT_NATIVE__GMFirebaseRemoteConfig_invocation_handler(char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferWriter __bw{ __ret_buffer, static_cast<size_t>(__ret_buffer_length) };
    return __dispatch_queue.fetch(__bw);
}

static std::queue<gm::wire::GMBuffer> __buffer_queue;

// Internal function used for queueing buffers to native code
GMEXPORT double __EXT_NATIVE__GMFirebaseRemoteConfig_queue_buffer(char* __arg_buffer, double __arg_buffer_length)
{
    gm::wire::GMBuffer __buff{__arg_buffer, static_cast<uint64_t>(__arg_buffer_length)};
    __buffer_queue.push(__buff);

    return 1.0;
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

