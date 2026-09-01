// ##### extgen :: Auto-generated file do not edit!! #####

#include "GMFirebaseCoreInternal_native.h"
#include "GMFirebaseCoreInternal_exports.h"

using namespace gm_structs;
using namespace gm::wire::codec;

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

GMEXPORT char* __EXT_NATIVE__firebase_get_sdk_version()
{
    static std::string __result;
    __result = firebase_get_sdk_version();
    return (char*)__result.c_str();
}

