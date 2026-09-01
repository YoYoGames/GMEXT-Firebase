// ##### extgen :: Auto-generated file do not edit!! #####

#include "GMFirebaseAppCheckInternal_native.h"
#include "GMFirebaseAppCheckInternal_exports.h"

using namespace gm_structs;
using namespace gm::wire::codec;

static gm::runtime::DispatchQueue __dispatch_queue;

// Internal function used for fetching dispatched function calls to GML
GMEXPORT double __EXT_NATIVE__GMFirebaseAppCheck_invocation_handler(char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferWriter __bw{ __ret_buffer, static_cast<size_t>(__ret_buffer_length) };
    return __dispatch_queue.fetch(__bw);
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

GMEXPORT double __EXT_NATIVE__firebase_app_check_get_app(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_app_check_get_app();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
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

