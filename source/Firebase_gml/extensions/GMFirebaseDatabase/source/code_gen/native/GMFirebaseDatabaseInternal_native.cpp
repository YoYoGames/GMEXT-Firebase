// ##### extgen :: Auto-generated file do not edit!! #####

#include "GMFirebaseDatabaseInternal_native.h"
#include "GMFirebaseDatabaseInternal_exports.h"

using namespace gm_structs;
using namespace gm::wire::codec;

static gm::runtime::DispatchQueue __dispatch_queue;

// Internal function used for fetching dispatched function calls to GML
GMEXPORT double __EXT_NATIVE__GMFirebaseDatabase_invocation_handler(char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferWriter __bw{ __ret_buffer, static_cast<size_t>(__ret_buffer_length) };
    return __dispatch_queue.fetch(__bw);
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

