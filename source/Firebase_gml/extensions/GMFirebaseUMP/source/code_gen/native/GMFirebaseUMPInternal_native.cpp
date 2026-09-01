// ##### extgen :: Auto-generated file do not edit!! #####

#include "GMFirebaseUMPInternal_native.h"
#include "GMFirebaseUMPInternal_exports.h"

using namespace gm_structs;
using namespace gm::wire::codec;

static gm::runtime::DispatchQueue __dispatch_queue;

// Internal function used for fetching dispatched function calls to GML
GMEXPORT double __EXT_NATIVE__GMFirebaseUMP_invocation_handler(char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferWriter __bw{ __ret_buffer, static_cast<size_t>(__ret_buffer_length) };
    return __dispatch_queue.fetch(__bw);
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

