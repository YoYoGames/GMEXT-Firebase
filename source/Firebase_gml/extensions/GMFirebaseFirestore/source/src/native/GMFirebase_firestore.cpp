// Cloud Firestore - thin forwarder over GMFirebaseCore's Firestore ABI.
//
// GMFirebaseFirestore no longer links the Firebase C++ SDK: every SDK object
// (Firestore/CollectionReference/DocumentReference/Query/WriteBatch/
// FieldValue/FieldPath/Filter/AggregateQuery/AggregateQuerySnapshot/...) is
// owned and manipulated inside GMFirebaseCore, the only extension DLL that
// statically links the SDK. This avoids a cross-DLL crash where Firebase's
// own file-static registries (e.g. CleanupNotifier) are duplicated per-DLL.
//
// Every exported firebase_firestore_* symbol below keeps its original name
// and signature - extgen's generated stub calls it by exact name - but now
// just forwards its already-decoded arguments to GMFirebaseCore's generic
// proc resolver (gmfirebaseGetCoreProductProcAs<Proc>("firestore", "...")).
// DocumentSnapshot/QuerySnapshot/ListenerRegistration entry points live in
// GMFirebase_firestore_snapshot.cpp.
#include "GMFirebase_common.h"
#include "GMFirebase_core_product_client.h"

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

namespace
{
    // Not a real Firebase error code - Firestore no longer includes any
    // Firebase SDK header, so this is a generic sentinel for "GMFirebaseCore
    // couldn't be reached at all" (missing DLL, ABI mismatch), mirroring the
    // "invalid handle" style errors already used throughout
    // GMFirebase_common_client.cpp.
    constexpr int kCoreUnavailableError = -1;
    const char* const kCoreUnavailableMessage = "GMFirebaseCore firestore module is not available";

    void reportCoreUnavailable()
    {
        setFirebaseLastError(kCoreUnavailableError, kCoreUnavailableMessage);
    }

    // For async ops whose success callback is (error, message).
    void notifyVoidFailure(const std::optional<gm::wire::GMFunction>& callback)
    {
        reportCoreUnavailable();
        if (callback)
            callback->call(static_cast<double>(kCoreUnavailableError), std::string_view{ kCoreUnavailableMessage });
    }

    // For async ops whose success callback is (error, message, optional<uint64_t> ref).
    void notifyRefFailure(const std::optional<gm::wire::GMFunction>& callback)
    {
        reportCoreUnavailable();
        if (callback)
            callback->call(static_cast<double>(kCoreUnavailableError), std::string_view{ kCoreUnavailableMessage }, std::optional<uint64_t>{});
    }

    // For add_snapshot_listener-style calls whose callback is (error, message, uint64_t ref=0).
    void notifyListenerFailure(const std::optional<gm::wire::GMFunction>& callback)
    {
        reportCoreUnavailable();
        if (callback)
            callback->call(static_cast<double>(kCoreUnavailableError), std::string_view{ kCoreUnavailableMessage }, static_cast<uint64_t>(0));
    }

    // For load_bundle's terminal callback: (error, message, <progress struct or undefined>).
    void notifyLoadBundleFailure(const std::optional<gm::wire::GMFunction>& callback)
    {
        reportCoreUnavailable();
        if (callback)
            callback->call(static_cast<double>(kCoreUnavailableError), std::string_view{ kCoreUnavailableMessage }, std::optional<std::uint8_t>{});
    }
}

// ============================================================
// Firestore instance / settings / lifecycle
// ============================================================

uint64_t firebase_firestore_get_instance()
{
    using Proc = uint64_t (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_get_instance");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc();
}

uint64_t firebase_firestore_get_instance_for_database(std::string_view database_name)
{
    using Proc = uint64_t (*)(std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_get_instance_for_database");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(database_name);
}

std::string firebase_firestore_settings_get_host(uint64_t instance_ref)
{
    using Proc = std::string (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_settings_get_host");
    return proc != nullptr ? proc(instance_ref) : std::string();
}

void firebase_firestore_settings_set_host(uint64_t instance_ref, std::string_view host)
{
    using Proc = void (*)(uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_settings_set_host");
    if (proc != nullptr) proc(instance_ref, host);
}

bool firebase_firestore_settings_get_ssl_enabled(uint64_t instance_ref)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_settings_get_ssl_enabled");
    return proc != nullptr && proc(instance_ref);
}

void firebase_firestore_settings_set_ssl_enabled(uint64_t instance_ref, bool enabled)
{
    using Proc = void (*)(uint64_t, bool);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_settings_set_ssl_enabled");
    if (proc != nullptr) proc(instance_ref, enabled);
}

bool firebase_firestore_settings_get_persistence_enabled(uint64_t instance_ref)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_settings_get_persistence_enabled");
    return proc != nullptr && proc(instance_ref);
}

void firebase_firestore_settings_set_persistence_enabled(uint64_t instance_ref, bool enabled)
{
    using Proc = void (*)(uint64_t, bool);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_settings_set_persistence_enabled");
    if (proc != nullptr) proc(instance_ref, enabled);
}

double firebase_firestore_settings_get_cache_size_bytes(uint64_t instance_ref)
{
    using Proc = double (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_settings_get_cache_size_bytes");
    return proc != nullptr ? proc(instance_ref) : 0.0;
}

void firebase_firestore_settings_set_cache_size_bytes(uint64_t instance_ref, double bytes)
{
    using Proc = void (*)(uint64_t, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_settings_set_cache_size_bytes");
    if (proc != nullptr) proc(instance_ref, bytes);
}

uint64_t firebase_firestore_collection(uint64_t instance_ref, std::string_view path)
{
    using Proc = uint64_t (*)(uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_collection");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(instance_ref, path);
}

uint64_t firebase_firestore_document(uint64_t instance_ref, std::string_view path)
{
    using Proc = uint64_t (*)(uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_document");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(instance_ref, path);
}

uint64_t firebase_firestore_collection_group(uint64_t instance_ref, std::string_view collection_id)
{
    using Proc = uint64_t (*)(uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_collection_group");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(instance_ref, collection_id);
}

uint64_t firebase_firestore_batch(uint64_t instance_ref)
{
    using Proc = uint64_t (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_batch");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(instance_ref);
}

void firebase_firestore_set_log_level(double level)
{
    using Proc = void (*)(double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_set_log_level");
    if (proc != nullptr) proc(level);
}

double firebase_firestore_enable_network(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_enable_network");
    if (proc == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return proc(instance_ref, callback);
}

double firebase_firestore_disable_network(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_disable_network");
    if (proc == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return proc(instance_ref, callback);
}

double firebase_firestore_terminate(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_terminate");
    if (proc == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return proc(instance_ref, callback);
}

double firebase_firestore_clear_persistence(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_clear_persistence");
    if (proc == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return proc(instance_ref, callback);
}

double firebase_firestore_wait_for_pending_writes(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_wait_for_pending_writes");
    if (proc == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return proc(instance_ref, callback);
}

double firebase_firestore_run_transaction(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_run_transaction");
    if (proc == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return proc(instance_ref, callback);
}

// ============================================================
// CollectionReference
// ============================================================

std::string firebase_firestore_collection_ref_id(uint64_t ref)
{
    using Proc = std::string (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_collection_ref_id");
    return proc != nullptr ? proc(ref) : std::string();
}

std::string firebase_firestore_collection_ref_path(uint64_t ref)
{
    using Proc = std::string (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_collection_ref_path");
    return proc != nullptr ? proc(ref) : std::string();
}

uint64_t firebase_firestore_collection_ref_parent(uint64_t ref)
{
    using Proc = uint64_t (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_collection_ref_parent");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref);
}

uint64_t firebase_firestore_collection_ref_document(uint64_t ref)
{
    using Proc = uint64_t (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_collection_ref_document");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref);
}

uint64_t firebase_firestore_collection_ref_document_path(uint64_t ref, std::string_view path)
{
    using Proc = uint64_t (*)(uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_collection_ref_document_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, path);
}

double firebase_firestore_collection_ref_add(uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(uint64_t, const gm::wire::GMValue&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_collection_ref_add");
    if (proc == nullptr) { notifyRefFailure(callback); return 0.0; }
    return proc(ref, data, callback);
}

bool firebase_firestore_collection_ref_is_valid(uint64_t ref)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_collection_ref_is_valid");
    return proc != nullptr && proc(ref);
}

void firebase_firestore_collection_ref_release(uint64_t ref)
{
    using Proc = void (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_collection_ref_release");
    if (proc != nullptr) proc(ref);
}

// ============================================================
// DocumentReference
// ============================================================

std::string firebase_firestore_document_ref_id(uint64_t ref)
{
    using Proc = std::string (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_document_ref_id");
    return proc != nullptr ? proc(ref) : std::string();
}

std::string firebase_firestore_document_ref_path(uint64_t ref)
{
    using Proc = std::string (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_document_ref_path");
    return proc != nullptr ? proc(ref) : std::string();
}

uint64_t firebase_firestore_document_ref_parent(uint64_t ref)
{
    using Proc = uint64_t (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_document_ref_parent");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref);
}

uint64_t firebase_firestore_document_ref_collection(uint64_t ref, std::string_view path)
{
    using Proc = uint64_t (*)(uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_document_ref_collection");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, path);
}

double firebase_firestore_document_ref_get(uint64_t ref, double source, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(uint64_t, double, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_document_ref_get");
    if (proc == nullptr) { notifyRefFailure(callback); return 0.0; }
    return proc(ref, source, callback);
}

double firebase_firestore_document_ref_set(uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(uint64_t, const gm::wire::GMValue&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_document_ref_set");
    if (proc == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return proc(ref, data, callback);
}

double firebase_firestore_document_ref_set_merge(uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(uint64_t, const gm::wire::GMValue&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_document_ref_set_merge");
    if (proc == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return proc(ref, data, callback);
}

double firebase_firestore_document_ref_set_merge_fields(uint64_t ref, const gm::wire::GMValue& data, const gm::wire::GMValue& fields, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(uint64_t, const gm::wire::GMValue&, const gm::wire::GMValue&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_document_ref_set_merge_fields");
    if (proc == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return proc(ref, data, fields, callback);
}

double firebase_firestore_document_ref_update(uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(uint64_t, const gm::wire::GMValue&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_document_ref_update");
    if (proc == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return proc(ref, data, callback);
}

double firebase_firestore_document_ref_delete(uint64_t ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_document_ref_delete");
    if (proc == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return proc(ref, callback);
}

uint64_t firebase_firestore_document_ref_add_snapshot_listener(uint64_t ref, bool include_metadata_changes, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = uint64_t (*)(uint64_t, bool, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_document_ref_add_snapshot_listener");
    if (proc == nullptr) { notifyListenerFailure(callback); return 0; }
    return proc(ref, include_metadata_changes, callback);
}

bool firebase_firestore_document_ref_is_valid(uint64_t ref)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_document_ref_is_valid");
    return proc != nullptr && proc(ref);
}

void firebase_firestore_document_ref_release(uint64_t ref)
{
    using Proc = void (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_document_ref_release");
    if (proc != nullptr) proc(ref);
}

// ============================================================
// Query (also serves CollectionReference refs)
// ============================================================

uint64_t firebase_firestore_query_where_equal_to(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
{
    using Proc = uint64_t (*)(uint64_t, std::string_view, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_where_equal_to");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, field, value);
}

uint64_t firebase_firestore_query_where_not_equal_to(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
{
    using Proc = uint64_t (*)(uint64_t, std::string_view, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_where_not_equal_to");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, field, value);
}

uint64_t firebase_firestore_query_where_less_than(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
{
    using Proc = uint64_t (*)(uint64_t, std::string_view, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_where_less_than");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, field, value);
}

uint64_t firebase_firestore_query_where_less_than_or_equal_to(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
{
    using Proc = uint64_t (*)(uint64_t, std::string_view, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_where_less_than_or_equal_to");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, field, value);
}

uint64_t firebase_firestore_query_where_greater_than(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
{
    using Proc = uint64_t (*)(uint64_t, std::string_view, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_where_greater_than");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, field, value);
}

uint64_t firebase_firestore_query_where_greater_than_or_equal_to(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
{
    using Proc = uint64_t (*)(uint64_t, std::string_view, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_where_greater_than_or_equal_to");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, field, value);
}

uint64_t firebase_firestore_query_where_array_contains(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
{
    using Proc = uint64_t (*)(uint64_t, std::string_view, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_where_array_contains");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, field, value);
}

uint64_t firebase_firestore_query_where_array_contains_any(uint64_t ref, std::string_view field, const gm::wire::GMValue& values)
{
    using Proc = uint64_t (*)(uint64_t, std::string_view, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_where_array_contains_any");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, field, values);
}

uint64_t firebase_firestore_query_where_in(uint64_t ref, std::string_view field, const gm::wire::GMValue& values)
{
    using Proc = uint64_t (*)(uint64_t, std::string_view, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_where_in");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, field, values);
}

uint64_t firebase_firestore_query_where_not_in(uint64_t ref, std::string_view field, const gm::wire::GMValue& values)
{
    using Proc = uint64_t (*)(uint64_t, std::string_view, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_where_not_in");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, field, values);
}

uint64_t firebase_firestore_query_order_by(uint64_t ref, std::string_view field, double direction)
{
    using Proc = uint64_t (*)(uint64_t, std::string_view, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_order_by");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, field, direction);
}

uint64_t firebase_firestore_query_limit(uint64_t ref, double limit)
{
    using Proc = uint64_t (*)(uint64_t, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_limit");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, limit);
}

uint64_t firebase_firestore_query_limit_to_last(uint64_t ref, double limit)
{
    using Proc = uint64_t (*)(uint64_t, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_limit_to_last");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, limit);
}

uint64_t firebase_firestore_query_start_at_snapshot(uint64_t ref, uint64_t snapshot_ref)
{
    using Proc = uint64_t (*)(uint64_t, uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_start_at_snapshot");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, snapshot_ref);
}

uint64_t firebase_firestore_query_start_at_values(uint64_t ref, const gm::wire::GMValue& values)
{
    using Proc = uint64_t (*)(uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_start_at_values");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, values);
}

uint64_t firebase_firestore_query_start_after_snapshot(uint64_t ref, uint64_t snapshot_ref)
{
    using Proc = uint64_t (*)(uint64_t, uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_start_after_snapshot");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, snapshot_ref);
}

uint64_t firebase_firestore_query_start_after_values(uint64_t ref, const gm::wire::GMValue& values)
{
    using Proc = uint64_t (*)(uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_start_after_values");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, values);
}

uint64_t firebase_firestore_query_end_before_snapshot(uint64_t ref, uint64_t snapshot_ref)
{
    using Proc = uint64_t (*)(uint64_t, uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_end_before_snapshot");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, snapshot_ref);
}

uint64_t firebase_firestore_query_end_before_values(uint64_t ref, const gm::wire::GMValue& values)
{
    using Proc = uint64_t (*)(uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_end_before_values");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, values);
}

uint64_t firebase_firestore_query_end_at_snapshot(uint64_t ref, uint64_t snapshot_ref)
{
    using Proc = uint64_t (*)(uint64_t, uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_end_at_snapshot");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, snapshot_ref);
}

uint64_t firebase_firestore_query_end_at_values(uint64_t ref, const gm::wire::GMValue& values)
{
    using Proc = uint64_t (*)(uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_end_at_values");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(ref, values);
}

double firebase_firestore_query_get(uint64_t ref, double source, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(uint64_t, double, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_get");
    if (proc == nullptr) { notifyRefFailure(callback); return 0.0; }
    return proc(ref, source, callback);
}

uint64_t firebase_firestore_query_add_snapshot_listener(uint64_t ref, bool include_metadata_changes, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = uint64_t (*)(uint64_t, bool, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_add_snapshot_listener");
    if (proc == nullptr) { notifyListenerFailure(callback); return 0; }
    return proc(ref, include_metadata_changes, callback);
}

bool firebase_firestore_query_is_valid(uint64_t ref)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_is_valid");
    return proc != nullptr && proc(ref);
}

void firebase_firestore_query_release(uint64_t ref)
{
    using Proc = void (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_release");
    if (proc != nullptr) proc(ref);
}

// ============================================================
// WriteBatch
// ============================================================

double firebase_firestore_write_batch_set(uint64_t batch_ref, uint64_t document_ref, const gm::wire::GMValue& data)
{
    using Proc = double (*)(uint64_t, uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_write_batch_set");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(batch_ref, document_ref, data);
}

double firebase_firestore_write_batch_set_merge(uint64_t batch_ref, uint64_t document_ref, const gm::wire::GMValue& data)
{
    using Proc = double (*)(uint64_t, uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_write_batch_set_merge");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(batch_ref, document_ref, data);
}

double firebase_firestore_write_batch_set_merge_fields(uint64_t batch_ref, uint64_t document_ref, const gm::wire::GMValue& data, const gm::wire::GMValue& fields)
{
    using Proc = double (*)(uint64_t, uint64_t, const gm::wire::GMValue&, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_write_batch_set_merge_fields");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(batch_ref, document_ref, data, fields);
}

double firebase_firestore_write_batch_update(uint64_t batch_ref, uint64_t document_ref, const gm::wire::GMValue& data)
{
    using Proc = double (*)(uint64_t, uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_write_batch_update");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(batch_ref, document_ref, data);
}

double firebase_firestore_write_batch_delete(uint64_t batch_ref, uint64_t document_ref)
{
    using Proc = double (*)(uint64_t, uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_write_batch_delete");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(batch_ref, document_ref);
}

double firebase_firestore_write_batch_commit(uint64_t batch_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_write_batch_commit");
    if (proc == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return proc(batch_ref, callback);
}

void firebase_firestore_write_batch_release(uint64_t batch_ref)
{
    using Proc = void (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_write_batch_release");
    if (proc != nullptr) proc(batch_ref);
}

// ============================================================
// FieldValue sentinels + explicit-typed value constructors
// ============================================================

double firebase_firestore_field_value_delete()
{
    using Proc = double (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_delete");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc();
}

double firebase_firestore_field_value_server_timestamp()
{
    using Proc = double (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_server_timestamp");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc();
}

double firebase_firestore_field_value_array_union(const gm::wire::GMValue& values)
{
    using Proc = double (*)(const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_array_union");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(values);
}

double firebase_firestore_field_value_array_remove(const gm::wire::GMValue& values)
{
    using Proc = double (*)(const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_array_remove");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(values);
}

double firebase_firestore_field_value_increment_integer(double value)
{
    using Proc = double (*)(double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_increment_integer");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(value);
}

double firebase_firestore_field_value_increment_double(double value)
{
    using Proc = double (*)(double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_increment_double");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(value);
}

double firebase_firestore_field_value_integer(double value)
{
    using Proc = double (*)(double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_integer");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(value);
}

double firebase_firestore_field_value_double(double value)
{
    using Proc = double (*)(double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_double");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(value);
}

double firebase_firestore_field_value_timestamp(double seconds, double nanoseconds)
{
    using Proc = double (*)(double, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_timestamp");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(seconds, nanoseconds);
}

double firebase_firestore_field_value_geo_point(double latitude, double longitude)
{
    using Proc = double (*)(double, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_geo_point");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(latitude, longitude);
}

double firebase_firestore_field_value_reference(uint64_t document_ref)
{
    using Proc = double (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_reference");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(document_ref);
}

double firebase_firestore_field_value_blob(std::string_view data)
{
    using Proc = double (*)(std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_blob");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(data);
}

double firebase_firestore_field_value_null()
{
    using Proc = double (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_null");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc();
}

void firebase_firestore_field_value_release(uint64_t ref)
{
    using Proc = void (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_release");
    if (proc != nullptr) proc(ref);
}

// ============================================================
// FieldPath
// ============================================================

double firebase_firestore_field_path_create(const gm::wire::GMValue& components)
{
    using Proc = double (*)(const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_path_create");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(components);
}

double firebase_firestore_field_path_document_id()
{
    using Proc = double (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_path_document_id");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc();
}

bool firebase_firestore_field_path_is_valid(uint64_t field_path)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_path_is_valid");
    return proc != nullptr && proc(field_path);
}

std::string firebase_firestore_field_path_to_string(uint64_t field_path)
{
    using Proc = std::string (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_path_to_string");
    return proc != nullptr ? proc(field_path) : std::string();
}

void firebase_firestore_field_path_release(uint64_t field_path)
{
    using Proc = void (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_path_release");
    if (proc != nullptr) proc(field_path);
}

// ============================================================
// Filter
// ============================================================

double firebase_firestore_filter_equal_to(std::string_view field, const gm::wire::GMValue& value)
{
    using Proc = double (*)(std::string_view, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_equal_to");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(field, value);
}

double firebase_firestore_filter_not_equal_to(std::string_view field, const gm::wire::GMValue& value)
{
    using Proc = double (*)(std::string_view, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_not_equal_to");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(field, value);
}

double firebase_firestore_filter_less_than(std::string_view field, const gm::wire::GMValue& value)
{
    using Proc = double (*)(std::string_view, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_less_than");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(field, value);
}

double firebase_firestore_filter_less_than_or_equal_to(std::string_view field, const gm::wire::GMValue& value)
{
    using Proc = double (*)(std::string_view, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_less_than_or_equal_to");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(field, value);
}

double firebase_firestore_filter_greater_than(std::string_view field, const gm::wire::GMValue& value)
{
    using Proc = double (*)(std::string_view, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_greater_than");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(field, value);
}

double firebase_firestore_filter_greater_than_or_equal_to(std::string_view field, const gm::wire::GMValue& value)
{
    using Proc = double (*)(std::string_view, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_greater_than_or_equal_to");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(field, value);
}

double firebase_firestore_filter_array_contains(std::string_view field, const gm::wire::GMValue& value)
{
    using Proc = double (*)(std::string_view, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_array_contains");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(field, value);
}

double firebase_firestore_filter_array_contains_any(std::string_view field, const gm::wire::GMValue& values)
{
    using Proc = double (*)(std::string_view, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_array_contains_any");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(field, values);
}

double firebase_firestore_filter_in(std::string_view field, const gm::wire::GMValue& values)
{
    using Proc = double (*)(std::string_view, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_in");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(field, values);
}

double firebase_firestore_filter_not_in(std::string_view field, const gm::wire::GMValue& values)
{
    using Proc = double (*)(std::string_view, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_not_in");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(field, values);
}

double firebase_firestore_filter_equal_to_field_path(uint64_t field_path, const gm::wire::GMValue& value)
{
    using Proc = double (*)(uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_equal_to_field_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(field_path, value);
}

double firebase_firestore_filter_not_equal_to_field_path(uint64_t field_path, const gm::wire::GMValue& value)
{
    using Proc = double (*)(uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_not_equal_to_field_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(field_path, value);
}

double firebase_firestore_filter_less_than_field_path(uint64_t field_path, const gm::wire::GMValue& value)
{
    using Proc = double (*)(uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_less_than_field_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(field_path, value);
}

double firebase_firestore_filter_less_than_or_equal_to_field_path(uint64_t field_path, const gm::wire::GMValue& value)
{
    using Proc = double (*)(uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_less_than_or_equal_to_field_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(field_path, value);
}

double firebase_firestore_filter_greater_than_field_path(uint64_t field_path, const gm::wire::GMValue& value)
{
    using Proc = double (*)(uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_greater_than_field_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(field_path, value);
}

double firebase_firestore_filter_greater_than_or_equal_to_field_path(uint64_t field_path, const gm::wire::GMValue& value)
{
    using Proc = double (*)(uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_greater_than_or_equal_to_field_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(field_path, value);
}

double firebase_firestore_filter_array_contains_field_path(uint64_t field_path, const gm::wire::GMValue& value)
{
    using Proc = double (*)(uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_array_contains_field_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(field_path, value);
}

double firebase_firestore_filter_array_contains_any_field_path(uint64_t field_path, const gm::wire::GMValue& values)
{
    using Proc = double (*)(uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_array_contains_any_field_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(field_path, values);
}

double firebase_firestore_filter_in_field_path(uint64_t field_path, const gm::wire::GMValue& values)
{
    using Proc = double (*)(uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_in_field_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(field_path, values);
}

double firebase_firestore_filter_not_in_field_path(uint64_t field_path, const gm::wire::GMValue& values)
{
    using Proc = double (*)(uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_not_in_field_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(field_path, values);
}

double firebase_firestore_filter_and(const gm::wire::GMValue& filters)
{
    using Proc = double (*)(const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_and");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(filters);
}

double firebase_firestore_filter_or(const gm::wire::GMValue& filters)
{
    using Proc = double (*)(const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_or");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(filters);
}

void firebase_firestore_filter_release(uint64_t filter)
{
    using Proc = void (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_filter_release");
    if (proc != nullptr) proc(filter);
}

uint64_t firebase_firestore_query_where_filter(uint64_t query, uint64_t filter)
{
    using Proc = uint64_t (*)(uint64_t, uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_where_filter");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(query, filter);
}

uint64_t firebase_firestore_query_where_equal_to_field_path(uint64_t query, uint64_t field_path, const gm::wire::GMValue& value)
{
    using Proc = uint64_t (*)(uint64_t, uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_where_equal_to_field_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(query, field_path, value);
}

uint64_t firebase_firestore_query_where_not_equal_to_field_path(uint64_t query, uint64_t field_path, const gm::wire::GMValue& value)
{
    using Proc = uint64_t (*)(uint64_t, uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_where_not_equal_to_field_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(query, field_path, value);
}

uint64_t firebase_firestore_query_where_less_than_field_path(uint64_t query, uint64_t field_path, const gm::wire::GMValue& value)
{
    using Proc = uint64_t (*)(uint64_t, uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_where_less_than_field_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(query, field_path, value);
}

uint64_t firebase_firestore_query_where_less_than_or_equal_to_field_path(uint64_t query, uint64_t field_path, const gm::wire::GMValue& value)
{
    using Proc = uint64_t (*)(uint64_t, uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_where_less_than_or_equal_to_field_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(query, field_path, value);
}

uint64_t firebase_firestore_query_where_greater_than_field_path(uint64_t query, uint64_t field_path, const gm::wire::GMValue& value)
{
    using Proc = uint64_t (*)(uint64_t, uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_where_greater_than_field_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(query, field_path, value);
}

uint64_t firebase_firestore_query_where_greater_than_or_equal_to_field_path(uint64_t query, uint64_t field_path, const gm::wire::GMValue& value)
{
    using Proc = uint64_t (*)(uint64_t, uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_where_greater_than_or_equal_to_field_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(query, field_path, value);
}

uint64_t firebase_firestore_query_where_array_contains_field_path(uint64_t query, uint64_t field_path, const gm::wire::GMValue& value)
{
    using Proc = uint64_t (*)(uint64_t, uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_where_array_contains_field_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(query, field_path, value);
}

uint64_t firebase_firestore_query_where_array_contains_any_field_path(uint64_t query, uint64_t field_path, const gm::wire::GMValue& values)
{
    using Proc = uint64_t (*)(uint64_t, uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_where_array_contains_any_field_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(query, field_path, values);
}

uint64_t firebase_firestore_query_where_in_field_path(uint64_t query, uint64_t field_path, const gm::wire::GMValue& values)
{
    using Proc = uint64_t (*)(uint64_t, uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_where_in_field_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(query, field_path, values);
}

uint64_t firebase_firestore_query_where_not_in_field_path(uint64_t query, uint64_t field_path, const gm::wire::GMValue& values)
{
    using Proc = uint64_t (*)(uint64_t, uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_where_not_in_field_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(query, field_path, values);
}

uint64_t firebase_firestore_query_order_by_field_path(uint64_t query, uint64_t field_path, double direction)
{
    using Proc = uint64_t (*)(uint64_t, uint64_t, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_order_by_field_path");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(query, field_path, direction);
}

// ============================================================
// AggregateQuery / AggregateQuerySnapshot
// ============================================================

uint64_t firebase_firestore_query_count(uint64_t query)
{
    using Proc = uint64_t (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_count");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(query);
}

uint64_t firebase_firestore_aggregate_query_get_query(uint64_t aggregate_query)
{
    using Proc = uint64_t (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_aggregate_query_get_query");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(aggregate_query);
}

bool firebase_firestore_aggregate_query_is_valid(uint64_t aggregate_query)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_aggregate_query_is_valid");
    return proc != nullptr && proc(aggregate_query);
}

double firebase_firestore_aggregate_query_get(uint64_t aggregate_query, double source, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(uint64_t, double, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_aggregate_query_get");
    if (proc == nullptr) { notifyRefFailure(callback); return 0.0; }
    return proc(aggregate_query, source, callback);
}

void firebase_firestore_aggregate_query_release(uint64_t aggregate_query)
{
    using Proc = void (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_aggregate_query_release");
    if (proc != nullptr) proc(aggregate_query);
}

double firebase_firestore_aggregate_snapshot_count(uint64_t snapshot)
{
    using Proc = double (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_aggregate_snapshot_count");
    return proc != nullptr ? proc(snapshot) : 0.0;
}

uint64_t firebase_firestore_aggregate_snapshot_get_query(uint64_t snapshot)
{
    using Proc = uint64_t (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_aggregate_snapshot_get_query");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(snapshot);
}

bool firebase_firestore_aggregate_snapshot_is_valid(uint64_t snapshot)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_aggregate_snapshot_is_valid");
    return proc != nullptr && proc(snapshot);
}

void firebase_firestore_aggregate_snapshot_release(uint64_t snapshot)
{
    using Proc = void (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_aggregate_snapshot_release");
    if (proc != nullptr) proc(snapshot);
}

// ============================================================
// Misc: snapshots-in-sync, bundles, named queries
// ============================================================

uint64_t firebase_firestore_add_snapshots_in_sync_listener(uint64_t firestore, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = uint64_t (*)(uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_add_snapshots_in_sync_listener");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(firestore, callback);
}

double firebase_firestore_load_bundle(uint64_t firestore, gm::wire::GMBuffer bundle, const std::optional<gm::wire::GMFunction>& progress_callback, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(uint64_t, gm::wire::GMBuffer, const std::optional<gm::wire::GMFunction>&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_load_bundle");
    if (proc == nullptr) { notifyLoadBundleFailure(callback); return 0.0; }
    return proc(firestore, bundle, progress_callback, callback);
}

double firebase_firestore_named_query(uint64_t firestore, std::string_view name, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(uint64_t, std::string_view, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_named_query");
    if (proc == nullptr) { notifyRefFailure(callback); return 0.0; }
    return proc(firestore, name, callback);
}

double firebase_firestore_document_ref_set_merge_field_paths(uint64_t document, const gm::wire::GMValue& data, const gm::wire::GMValue& field_paths, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(uint64_t, const gm::wire::GMValue&, const gm::wire::GMValue&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_document_ref_set_merge_field_paths");
    if (proc == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return proc(document, data, field_paths, callback);
}

void firebase_firestore_write_batch_set_merge_field_paths(uint64_t batch, uint64_t document, const gm::wire::GMValue& data, const gm::wire::GMValue& field_paths)
{
    using Proc = void (*)(uint64_t, uint64_t, const gm::wire::GMValue&, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_write_batch_set_merge_field_paths");
    if (proc != nullptr) proc(batch, document, data, field_paths);
}

// ============================================================
// FieldValue accessors
// ============================================================

double firebase_firestore_field_value_type(uint64_t field_value)
{
    using Proc = double (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_type");
    return proc != nullptr ? proc(field_value) : -1.0;
}

bool firebase_firestore_field_value_is_valid(uint64_t field_value)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_is_valid");
    return proc != nullptr && proc(field_value);
}

bool firebase_firestore_field_value_is_null(uint64_t field_value)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_is_null");
    return proc != nullptr && proc(field_value);
}

bool firebase_firestore_field_value_is_boolean(uint64_t field_value)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_is_boolean");
    return proc != nullptr && proc(field_value);
}

bool firebase_firestore_field_value_is_integer(uint64_t field_value)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_is_integer");
    return proc != nullptr && proc(field_value);
}

bool firebase_firestore_field_value_is_double(uint64_t field_value)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_is_double");
    return proc != nullptr && proc(field_value);
}

bool firebase_firestore_field_value_is_timestamp(uint64_t field_value)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_is_timestamp");
    return proc != nullptr && proc(field_value);
}

bool firebase_firestore_field_value_is_string(uint64_t field_value)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_is_string");
    return proc != nullptr && proc(field_value);
}

bool firebase_firestore_field_value_is_blob(uint64_t field_value)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_is_blob");
    return proc != nullptr && proc(field_value);
}

bool firebase_firestore_field_value_is_reference(uint64_t field_value)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_is_reference");
    return proc != nullptr && proc(field_value);
}

bool firebase_firestore_field_value_is_geo_point(uint64_t field_value)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_is_geo_point");
    return proc != nullptr && proc(field_value);
}

bool firebase_firestore_field_value_is_array(uint64_t field_value)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_is_array");
    return proc != nullptr && proc(field_value);
}

bool firebase_firestore_field_value_is_map(uint64_t field_value)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_is_map");
    return proc != nullptr && proc(field_value);
}

bool firebase_firestore_field_value_boolean_value(uint64_t field_value)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_boolean_value");
    return proc != nullptr && proc(field_value);
}

double firebase_firestore_field_value_integer_value(uint64_t field_value)
{
    using Proc = double (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_integer_value");
    return proc != nullptr ? proc(field_value) : 0.0;
}

double firebase_firestore_field_value_double_value(uint64_t field_value)
{
    using Proc = double (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_double_value");
    return proc != nullptr ? proc(field_value) : 0.0;
}

std::string firebase_firestore_field_value_string_value(uint64_t field_value)
{
    using Proc = std::string (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_string_value");
    return proc != nullptr ? proc(field_value) : std::string();
}

double firebase_firestore_field_value_blob_size(uint64_t field_value)
{
    using Proc = double (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_blob_size");
    return proc != nullptr ? proc(field_value) : 0.0;
}

double firebase_firestore_field_value_blob_copy(uint64_t field_value, gm::wire::GMBuffer out_buffer)
{
    using Proc = double (*)(uint64_t, gm::wire::GMBuffer);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_blob_copy");
    return proc != nullptr ? proc(field_value, out_buffer) : 0.0;
}

uint64_t firebase_firestore_field_value_reference_value(uint64_t field_value)
{
    using Proc = uint64_t (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_reference_value");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(field_value);
}

gm::wire::DataStream firebase_firestore_field_value_timestamp_value(uint64_t field_value)
{
    using Proc = gm::wire::DataStream (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_timestamp_value");
    return proc != nullptr ? proc(field_value) : gm::wire::DataStream();
}

gm::wire::DataStream firebase_firestore_field_value_geo_point_value(uint64_t field_value)
{
    using Proc = gm::wire::DataStream (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_geo_point_value");
    return proc != nullptr ? proc(field_value) : gm::wire::DataStream();
}

gm::wire::DataStream firebase_firestore_field_value_array_value(uint64_t field_value)
{
    using Proc = gm::wire::DataStream (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_array_value");
    return proc != nullptr ? proc(field_value) : gm::wire::DataStream();
}

gm::wire::DataStream firebase_firestore_field_value_map_value(uint64_t field_value)
{
    using Proc = gm::wire::DataStream (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_map_value");
    return proc != nullptr ? proc(field_value) : gm::wire::DataStream();
}

std::string firebase_firestore_field_value_to_string(uint64_t field_value)
{
    using Proc = std::string (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_to_string");
    return proc != nullptr ? proc(field_value) : std::string();
}

double firebase_firestore_field_value_boolean(bool value)
{
    using Proc = double (*)(bool);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_boolean");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(value);
}

double firebase_firestore_field_value_string(std::string_view value)
{
    using Proc = double (*)(std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_string");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(value);
}

double firebase_firestore_field_value_array(const gm::wire::GMValue& value)
{
    using Proc = double (*)(const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_array");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(value);
}

double firebase_firestore_field_value_map(const gm::wire::GMValue& value)
{
    using Proc = double (*)(const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_field_value_map");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(value);
}

// ============================================================
// Multi-instance / misc accessors
// ============================================================

uint64_t firebase_firestore_query_get_firestore(uint64_t query)
{
    using Proc = uint64_t (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_query_get_firestore");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(query);
}

uint64_t firebase_firestore_document_ref_get_firestore(uint64_t document)
{
    using Proc = uint64_t (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_document_ref_get_firestore");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(document);
}

std::string firebase_firestore_document_ref_to_string(uint64_t document)
{
    using Proc = std::string (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_document_ref_to_string");
    return proc != nullptr ? proc(document) : std::string();
}

double firebase_firestore_document_ref_update_field_paths(uint64_t document, const gm::wire::GMValue& entries, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(uint64_t, const gm::wire::GMValue&, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_document_ref_update_field_paths");
    if (proc == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return proc(document, entries, callback);
}

double firebase_firestore_write_batch_update_field_paths(uint64_t batch, uint64_t document, const gm::wire::GMValue& entries)
{
    using Proc = double (*)(uint64_t, uint64_t, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_write_batch_update_field_paths");
    if (proc == nullptr) { reportCoreUnavailable(); return 0.0; }
    return proc(batch, document, entries);
}

bool firebase_firestore_write_batch_is_valid(uint64_t batch)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_write_batch_is_valid");
    return proc != nullptr && proc(batch);
}

std::string firebase_firestore_settings_to_string(uint64_t firestore)
{
    using Proc = std::string (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_settings_to_string");
    return proc != nullptr ? proc(firestore) : std::string();
}

uint64_t firebase_firestore_get_app(uint64_t firestore)
{
    using Proc = uint64_t (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_get_app");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(firestore);
}

uint64_t firebase_firestore_get_instance_for_app(uint64_t app)
{
    using Proc = uint64_t (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_get_instance_for_app");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(app);
}

uint64_t firebase_firestore_get_instance_for_app_database(uint64_t app, std::string_view database_id)
{
    using Proc = uint64_t (*)(uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("firestore", "firebase_firestore_get_instance_for_app_database");
    if (proc == nullptr) { reportCoreUnavailable(); return 0; }
    return proc(app, database_id);
}
