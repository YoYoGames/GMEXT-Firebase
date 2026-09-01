// ##### extgen :: Auto-generated file do not edit!! #####

#include "GMFirebaseFirestoreInternal_native.h"
#include "GMFirebaseFirestoreInternal_exports.h"

using namespace gm_structs;
using namespace gm::wire::codec;

static gm::runtime::DispatchQueue __dispatch_queue;

// Internal function used for fetching dispatched function calls to GML
GMEXPORT double __EXT_NATIVE__GMFirebaseFirestore_invocation_handler(char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferWriter __bw{ __ret_buffer, static_cast<size_t>(__ret_buffer_length) };
    return __dispatch_queue.fetch(__bw);
}

static std::queue<gm::wire::GMBuffer> __buffer_queue;

// Internal function used for queueing buffers to native code
GMEXPORT double __EXT_NATIVE__GMFirebaseFirestore_queue_buffer(char* __arg_buffer, double __arg_buffer_length)
{
    gm::wire::GMBuffer __buff{__arg_buffer, static_cast<uint64_t>(__arg_buffer_length)};
    __buffer_queue.push(__buff);

    return 1.0;
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

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_delete()
{
    auto&& __result = firebase_firestore_field_value_delete();
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_server_timestamp()
{
    auto&& __result = firebase_firestore_field_value_server_timestamp();
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_array_union(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_field_value_array_union(values);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_array_remove(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_field_value_array_remove(values);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_increment_integer(double value)
{
    auto&& __result = firebase_firestore_field_value_increment_integer(static_cast<double>(value));
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_increment_double(double value)
{
    auto&& __result = firebase_firestore_field_value_increment_double(static_cast<double>(value));
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_integer(double value)
{
    auto&& __result = firebase_firestore_field_value_integer(static_cast<double>(value));
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_double(double value)
{
    auto&& __result = firebase_firestore_field_value_double(static_cast<double>(value));
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_timestamp(double seconds, double nanoseconds)
{
    auto&& __result = firebase_firestore_field_value_timestamp(static_cast<double>(seconds), static_cast<double>(nanoseconds));
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_geo_point(double latitude, double longitude)
{
    auto&& __result = firebase_firestore_field_value_geo_point(static_cast<double>(latitude), static_cast<double>(longitude));
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_reference(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: document_ref, type: UInt64
    std::uint64_t document_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_firestore_field_value_reference(document_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_blob(char* data)
{
    auto&& __result = firebase_firestore_field_value_blob(data);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_null()
{
    auto&& __result = firebase_firestore_field_value_null();
    return static_cast<double>(__result);
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

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_path_create(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: components, type: Any
    gm::wire::GMValue components = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_field_path_create(components);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_path_document_id()
{
    auto&& __result = firebase_firestore_field_path_document_id();
    return static_cast<double>(__result);
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

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_equal_to(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_equal_to(field, value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_not_equal_to(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_not_equal_to(field, value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_less_than(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_less_than(field, value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_less_than_or_equal_to(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_less_than_or_equal_to(field, value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_greater_than(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_greater_than(field, value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_greater_than_or_equal_to(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_greater_than_or_equal_to(field, value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_array_contains(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_array_contains(field, value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_array_contains_any(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_array_contains_any(field, values);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_in(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_in(field, values);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_not_in(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field, type: String
    std::string_view field = gm::wire::codec::readValue<std::string_view>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_not_in(field, values);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_equal_to_field_path(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_equal_to_field_path(field_path, value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_not_equal_to_field_path(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_not_equal_to_field_path(field_path, value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_less_than_field_path(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_less_than_field_path(field_path, value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_less_than_or_equal_to_field_path(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_less_than_or_equal_to_field_path(field_path, value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_greater_than_field_path(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_greater_than_field_path(field_path, value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_greater_than_or_equal_to_field_path(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_greater_than_or_equal_to_field_path(field_path, value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_array_contains_field_path(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_array_contains_field_path(field_path, value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_array_contains_any_field_path(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_array_contains_any_field_path(field_path, values);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_in_field_path(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_in_field_path(field_path, values);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_not_in_field_path(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: field_path, type: UInt64
    std::uint64_t field_path = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: values, type: Any
    gm::wire::GMValue values = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_not_in_field_path(field_path, values);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_and(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: filters, type: Any
    gm::wire::GMValue filters = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_and(filters);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_filter_or(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: filters, type: Any
    gm::wire::GMValue filters = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_filter_or(filters);
    return static_cast<double>(__result);
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

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_boolean(double value)
{
    auto&& __result = firebase_firestore_field_value_boolean(static_cast<bool>(value));
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_string(char* value)
{
    auto&& __result = firebase_firestore_field_value_string(value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_array(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_field_value_array(value);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_firestore_field_value_map(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: value, type: Any
    gm::wire::GMValue value = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_firestore_field_value_map(value);
    return static_cast<double>(__result);
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

