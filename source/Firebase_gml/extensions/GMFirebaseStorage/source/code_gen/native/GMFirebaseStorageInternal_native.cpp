// ##### extgen :: Auto-generated file do not edit!! #####

#include "GMFirebaseStorageInternal_native.h"
#include "GMFirebaseStorageInternal_exports.h"

using namespace gm_structs;
using namespace gm::wire::codec;

static gm::runtime::DispatchQueue __dispatch_queue;

// Internal function used for fetching dispatched function calls to GML
GMEXPORT double __EXT_NATIVE__GMFirebaseStorage_invocation_handler(char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferWriter __bw{ __ret_buffer, static_cast<size_t>(__ret_buffer_length) };
    return __dispatch_queue.fetch(__bw);
}

static std::queue<gm::wire::GMBuffer> __buffer_queue;

// Internal function used for queueing buffers to native code
GMEXPORT double __EXT_NATIVE__GMFirebaseStorage_queue_buffer(char* __arg_buffer, double __arg_buffer_length)
{
    gm::wire::GMBuffer __buff{__arg_buffer, static_cast<uint64_t>(__arg_buffer_length)};
    __buffer_queue.push(__buff);

    return 1.0;
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

GMEXPORT char* __EXT_NATIVE__firebase_storage_metadata_md5_hash(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: metadata, type: UInt64
    std::uint64_t metadata = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_storage_metadata_md5_hash(metadata);
    return (char*)__result.c_str();
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

