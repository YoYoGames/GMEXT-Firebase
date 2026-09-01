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
// just forwards its already-decoded arguments to
// gmfirebaseGetCoreFirestoreAPI(). DocumentSnapshot/QuerySnapshot/
// ListenerRegistration entry points live in GMFirebase_firestore_snapshot.cpp.
#include "GMFirebase_common.h"
#include "GMFirebase_core_firestore_client.h"

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
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->get_instance();
}

uint64_t firebase_firestore_get_instance_for_database(std::string_view database_name)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->get_instance_for_database(database_name);
}

std::string firebase_firestore_settings_get_host(uint64_t instance_ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->settings_get_host(instance_ref) : std::string();
}

void firebase_firestore_settings_set_host(uint64_t instance_ref, std::string_view host)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api != nullptr) api->settings_set_host(instance_ref, host);
}

bool firebase_firestore_settings_get_ssl_enabled(uint64_t instance_ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->settings_get_ssl_enabled(instance_ref);
}

void firebase_firestore_settings_set_ssl_enabled(uint64_t instance_ref, bool enabled)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api != nullptr) api->settings_set_ssl_enabled(instance_ref, enabled);
}

bool firebase_firestore_settings_get_persistence_enabled(uint64_t instance_ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->settings_get_persistence_enabled(instance_ref);
}

void firebase_firestore_settings_set_persistence_enabled(uint64_t instance_ref, bool enabled)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api != nullptr) api->settings_set_persistence_enabled(instance_ref, enabled);
}

double firebase_firestore_settings_get_cache_size_bytes(uint64_t instance_ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->settings_get_cache_size_bytes(instance_ref) : 0.0;
}

void firebase_firestore_settings_set_cache_size_bytes(uint64_t instance_ref, double bytes)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api != nullptr) api->settings_set_cache_size_bytes(instance_ref, bytes);
}

uint64_t firebase_firestore_collection(uint64_t instance_ref, std::string_view path)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->collection(instance_ref, path);
}

uint64_t firebase_firestore_document(uint64_t instance_ref, std::string_view path)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->document(instance_ref, path);
}

uint64_t firebase_firestore_collection_group(uint64_t instance_ref, std::string_view collection_id)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->collection_group(instance_ref, collection_id);
}

uint64_t firebase_firestore_batch(uint64_t instance_ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->batch(instance_ref);
}

void firebase_firestore_set_log_level(double level)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api != nullptr) api->set_log_level(level);
}

double firebase_firestore_enable_network(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return api->enable_network(instance_ref, callback);
}

double firebase_firestore_disable_network(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return api->disable_network(instance_ref, callback);
}

double firebase_firestore_terminate(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return api->terminate(instance_ref, callback);
}

double firebase_firestore_clear_persistence(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return api->clear_persistence(instance_ref, callback);
}

double firebase_firestore_wait_for_pending_writes(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return api->wait_for_pending_writes(instance_ref, callback);
}

double firebase_firestore_run_transaction(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return api->run_transaction(instance_ref, callback);
}

// ============================================================
// CollectionReference
// ============================================================

std::string firebase_firestore_collection_ref_id(uint64_t ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->collection_ref_id(ref) : std::string();
}

std::string firebase_firestore_collection_ref_path(uint64_t ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->collection_ref_path(ref) : std::string();
}

uint64_t firebase_firestore_collection_ref_parent(uint64_t ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->collection_ref_parent(ref);
}

uint64_t firebase_firestore_collection_ref_document(uint64_t ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->collection_ref_document(ref);
}

uint64_t firebase_firestore_collection_ref_document_path(uint64_t ref, std::string_view path)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->collection_ref_document_path(ref, path);
}

double firebase_firestore_collection_ref_add(uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyRefFailure(callback); return 0.0; }
    return api->collection_ref_add(ref, data, callback);
}

bool firebase_firestore_collection_ref_is_valid(uint64_t ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->collection_ref_is_valid(ref);
}

void firebase_firestore_collection_ref_release(uint64_t ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api != nullptr) api->collection_ref_release(ref);
}

// ============================================================
// DocumentReference
// ============================================================

std::string firebase_firestore_document_ref_id(uint64_t ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->document_ref_id(ref) : std::string();
}

std::string firebase_firestore_document_ref_path(uint64_t ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->document_ref_path(ref) : std::string();
}

uint64_t firebase_firestore_document_ref_parent(uint64_t ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->document_ref_parent(ref);
}

uint64_t firebase_firestore_document_ref_collection(uint64_t ref, std::string_view path)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->document_ref_collection(ref, path);
}

double firebase_firestore_document_ref_get(uint64_t ref, double source, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyRefFailure(callback); return 0.0; }
    return api->document_ref_get(ref, source, callback);
}

double firebase_firestore_document_ref_set(uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return api->document_ref_set(ref, data, callback);
}

double firebase_firestore_document_ref_set_merge(uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return api->document_ref_set_merge(ref, data, callback);
}

double firebase_firestore_document_ref_set_merge_fields(uint64_t ref, const gm::wire::GMValue& data, const gm::wire::GMValue& fields, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return api->document_ref_set_merge_fields(ref, data, fields, callback);
}

double firebase_firestore_document_ref_update(uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return api->document_ref_update(ref, data, callback);
}

double firebase_firestore_document_ref_delete(uint64_t ref, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return api->document_ref_delete(ref, callback);
}

uint64_t firebase_firestore_document_ref_add_snapshot_listener(uint64_t ref, bool include_metadata_changes, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyListenerFailure(callback); return 0; }
    return api->document_ref_add_snapshot_listener(ref, include_metadata_changes, callback);
}

bool firebase_firestore_document_ref_is_valid(uint64_t ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->document_ref_is_valid(ref);
}

void firebase_firestore_document_ref_release(uint64_t ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api != nullptr) api->document_ref_release(ref);
}

// ============================================================
// Query (also serves CollectionReference refs)
// ============================================================

uint64_t firebase_firestore_query_where_equal_to(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_where_equal_to(ref, field, value);
}

uint64_t firebase_firestore_query_where_not_equal_to(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_where_not_equal_to(ref, field, value);
}

uint64_t firebase_firestore_query_where_less_than(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_where_less_than(ref, field, value);
}

uint64_t firebase_firestore_query_where_less_than_or_equal_to(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_where_less_than_or_equal_to(ref, field, value);
}

uint64_t firebase_firestore_query_where_greater_than(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_where_greater_than(ref, field, value);
}

uint64_t firebase_firestore_query_where_greater_than_or_equal_to(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_where_greater_than_or_equal_to(ref, field, value);
}

uint64_t firebase_firestore_query_where_array_contains(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_where_array_contains(ref, field, value);
}

uint64_t firebase_firestore_query_where_array_contains_any(uint64_t ref, std::string_view field, const gm::wire::GMValue& values)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_where_array_contains_any(ref, field, values);
}

uint64_t firebase_firestore_query_where_in(uint64_t ref, std::string_view field, const gm::wire::GMValue& values)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_where_in(ref, field, values);
}

uint64_t firebase_firestore_query_where_not_in(uint64_t ref, std::string_view field, const gm::wire::GMValue& values)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_where_not_in(ref, field, values);
}

uint64_t firebase_firestore_query_order_by(uint64_t ref, std::string_view field, double direction)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_order_by(ref, field, direction);
}

uint64_t firebase_firestore_query_limit(uint64_t ref, double limit)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_limit(ref, limit);
}

uint64_t firebase_firestore_query_limit_to_last(uint64_t ref, double limit)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_limit_to_last(ref, limit);
}

uint64_t firebase_firestore_query_start_at_snapshot(uint64_t ref, uint64_t snapshot_ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_start_at_snapshot(ref, snapshot_ref);
}

uint64_t firebase_firestore_query_start_at_values(uint64_t ref, const gm::wire::GMValue& values)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_start_at_values(ref, values);
}

uint64_t firebase_firestore_query_start_after_snapshot(uint64_t ref, uint64_t snapshot_ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_start_after_snapshot(ref, snapshot_ref);
}

uint64_t firebase_firestore_query_start_after_values(uint64_t ref, const gm::wire::GMValue& values)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_start_after_values(ref, values);
}

uint64_t firebase_firestore_query_end_before_snapshot(uint64_t ref, uint64_t snapshot_ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_end_before_snapshot(ref, snapshot_ref);
}

uint64_t firebase_firestore_query_end_before_values(uint64_t ref, const gm::wire::GMValue& values)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_end_before_values(ref, values);
}

uint64_t firebase_firestore_query_end_at_snapshot(uint64_t ref, uint64_t snapshot_ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_end_at_snapshot(ref, snapshot_ref);
}

uint64_t firebase_firestore_query_end_at_values(uint64_t ref, const gm::wire::GMValue& values)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_end_at_values(ref, values);
}

double firebase_firestore_query_get(uint64_t ref, double source, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyRefFailure(callback); return 0.0; }
    return api->query_get(ref, source, callback);
}

uint64_t firebase_firestore_query_add_snapshot_listener(uint64_t ref, bool include_metadata_changes, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyListenerFailure(callback); return 0; }
    return api->query_add_snapshot_listener(ref, include_metadata_changes, callback);
}

bool firebase_firestore_query_is_valid(uint64_t ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->query_is_valid(ref);
}

void firebase_firestore_query_release(uint64_t ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api != nullptr) api->query_release(ref);
}

// ============================================================
// WriteBatch
// ============================================================

double firebase_firestore_write_batch_set(uint64_t batch_ref, uint64_t document_ref, const gm::wire::GMValue& data)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->write_batch_set(batch_ref, document_ref, data);
}

double firebase_firestore_write_batch_set_merge(uint64_t batch_ref, uint64_t document_ref, const gm::wire::GMValue& data)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->write_batch_set_merge(batch_ref, document_ref, data);
}

double firebase_firestore_write_batch_set_merge_fields(uint64_t batch_ref, uint64_t document_ref, const gm::wire::GMValue& data, const gm::wire::GMValue& fields)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->write_batch_set_merge_fields(batch_ref, document_ref, data, fields);
}

double firebase_firestore_write_batch_update(uint64_t batch_ref, uint64_t document_ref, const gm::wire::GMValue& data)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->write_batch_update(batch_ref, document_ref, data);
}

double firebase_firestore_write_batch_delete(uint64_t batch_ref, uint64_t document_ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->write_batch_delete(batch_ref, document_ref);
}

double firebase_firestore_write_batch_commit(uint64_t batch_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return api->write_batch_commit(batch_ref, callback);
}

void firebase_firestore_write_batch_release(uint64_t batch_ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api != nullptr) api->write_batch_release(batch_ref);
}

// ============================================================
// FieldValue sentinels + explicit-typed value constructors
// ============================================================

double firebase_firestore_field_value_delete()
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->field_value_delete();
}

double firebase_firestore_field_value_server_timestamp()
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->field_value_server_timestamp();
}

double firebase_firestore_field_value_array_union(const gm::wire::GMValue& values)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->field_value_array_union(values);
}

double firebase_firestore_field_value_array_remove(const gm::wire::GMValue& values)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->field_value_array_remove(values);
}

double firebase_firestore_field_value_increment_integer(double value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->field_value_increment_integer(value);
}

double firebase_firestore_field_value_increment_double(double value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->field_value_increment_double(value);
}

double firebase_firestore_field_value_integer(double value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->field_value_integer(value);
}

double firebase_firestore_field_value_double(double value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->field_value_double(value);
}

double firebase_firestore_field_value_timestamp(double seconds, double nanoseconds)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->field_value_timestamp(seconds, nanoseconds);
}

double firebase_firestore_field_value_geo_point(double latitude, double longitude)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->field_value_geo_point(latitude, longitude);
}

double firebase_firestore_field_value_reference(uint64_t document_ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->field_value_reference(document_ref);
}

double firebase_firestore_field_value_blob(std::string_view data)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->field_value_blob(data);
}

double firebase_firestore_field_value_null()
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->field_value_null();
}

void firebase_firestore_field_value_release(uint64_t ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api != nullptr) api->field_value_release(ref);
}

// ============================================================
// FieldPath
// ============================================================

double firebase_firestore_field_path_create(const gm::wire::GMValue& components)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->field_path_create(components);
}

double firebase_firestore_field_path_document_id()
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->field_path_document_id();
}

bool firebase_firestore_field_path_is_valid(uint64_t field_path)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->field_path_is_valid(field_path);
}

std::string firebase_firestore_field_path_to_string(uint64_t field_path)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->field_path_to_string(field_path) : std::string();
}

void firebase_firestore_field_path_release(uint64_t field_path)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api != nullptr) api->field_path_release(field_path);
}

// ============================================================
// Filter
// ============================================================

double firebase_firestore_filter_equal_to(std::string_view field, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_equal_to(field, value);
}

double firebase_firestore_filter_not_equal_to(std::string_view field, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_not_equal_to(field, value);
}

double firebase_firestore_filter_less_than(std::string_view field, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_less_than(field, value);
}

double firebase_firestore_filter_less_than_or_equal_to(std::string_view field, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_less_than_or_equal_to(field, value);
}

double firebase_firestore_filter_greater_than(std::string_view field, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_greater_than(field, value);
}

double firebase_firestore_filter_greater_than_or_equal_to(std::string_view field, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_greater_than_or_equal_to(field, value);
}

double firebase_firestore_filter_array_contains(std::string_view field, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_array_contains(field, value);
}

double firebase_firestore_filter_array_contains_any(std::string_view field, const gm::wire::GMValue& values)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_array_contains_any(field, values);
}

double firebase_firestore_filter_in(std::string_view field, const gm::wire::GMValue& values)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_in(field, values);
}

double firebase_firestore_filter_not_in(std::string_view field, const gm::wire::GMValue& values)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_not_in(field, values);
}

double firebase_firestore_filter_equal_to_field_path(uint64_t field_path, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_equal_to_field_path(field_path, value);
}

double firebase_firestore_filter_not_equal_to_field_path(uint64_t field_path, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_not_equal_to_field_path(field_path, value);
}

double firebase_firestore_filter_less_than_field_path(uint64_t field_path, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_less_than_field_path(field_path, value);
}

double firebase_firestore_filter_less_than_or_equal_to_field_path(uint64_t field_path, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_less_than_or_equal_to_field_path(field_path, value);
}

double firebase_firestore_filter_greater_than_field_path(uint64_t field_path, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_greater_than_field_path(field_path, value);
}

double firebase_firestore_filter_greater_than_or_equal_to_field_path(uint64_t field_path, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_greater_than_or_equal_to_field_path(field_path, value);
}

double firebase_firestore_filter_array_contains_field_path(uint64_t field_path, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_array_contains_field_path(field_path, value);
}

double firebase_firestore_filter_array_contains_any_field_path(uint64_t field_path, const gm::wire::GMValue& values)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_array_contains_any_field_path(field_path, values);
}

double firebase_firestore_filter_in_field_path(uint64_t field_path, const gm::wire::GMValue& values)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_in_field_path(field_path, values);
}

double firebase_firestore_filter_not_in_field_path(uint64_t field_path, const gm::wire::GMValue& values)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_not_in_field_path(field_path, values);
}

double firebase_firestore_filter_and(const gm::wire::GMValue& filters)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_and(filters);
}

double firebase_firestore_filter_or(const gm::wire::GMValue& filters)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->filter_or(filters);
}

void firebase_firestore_filter_release(uint64_t filter)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api != nullptr) api->filter_release(filter);
}

uint64_t firebase_firestore_query_where_filter(uint64_t query, uint64_t filter)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_where_filter(query, filter);
}

uint64_t firebase_firestore_query_where_equal_to_field_path(uint64_t query, uint64_t field_path, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_where_equal_to_field_path(query, field_path, value);
}

uint64_t firebase_firestore_query_where_not_equal_to_field_path(uint64_t query, uint64_t field_path, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_where_not_equal_to_field_path(query, field_path, value);
}

uint64_t firebase_firestore_query_where_less_than_field_path(uint64_t query, uint64_t field_path, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_where_less_than_field_path(query, field_path, value);
}

uint64_t firebase_firestore_query_where_less_than_or_equal_to_field_path(uint64_t query, uint64_t field_path, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_where_less_than_or_equal_to_field_path(query, field_path, value);
}

uint64_t firebase_firestore_query_where_greater_than_field_path(uint64_t query, uint64_t field_path, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_where_greater_than_field_path(query, field_path, value);
}

uint64_t firebase_firestore_query_where_greater_than_or_equal_to_field_path(uint64_t query, uint64_t field_path, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_where_greater_than_or_equal_to_field_path(query, field_path, value);
}

uint64_t firebase_firestore_query_where_array_contains_field_path(uint64_t query, uint64_t field_path, const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_where_array_contains_field_path(query, field_path, value);
}

uint64_t firebase_firestore_query_where_array_contains_any_field_path(uint64_t query, uint64_t field_path, const gm::wire::GMValue& values)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_where_array_contains_any_field_path(query, field_path, values);
}

uint64_t firebase_firestore_query_where_in_field_path(uint64_t query, uint64_t field_path, const gm::wire::GMValue& values)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_where_in_field_path(query, field_path, values);
}

uint64_t firebase_firestore_query_where_not_in_field_path(uint64_t query, uint64_t field_path, const gm::wire::GMValue& values)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_where_not_in_field_path(query, field_path, values);
}

uint64_t firebase_firestore_query_order_by_field_path(uint64_t query, uint64_t field_path, double direction)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_order_by_field_path(query, field_path, direction);
}

// ============================================================
// AggregateQuery / AggregateQuerySnapshot
// ============================================================

uint64_t firebase_firestore_query_count(uint64_t query)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_count(query);
}

uint64_t firebase_firestore_aggregate_query_get_query(uint64_t aggregate_query)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->aggregate_query_get_query(aggregate_query);
}

bool firebase_firestore_aggregate_query_is_valid(uint64_t aggregate_query)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->aggregate_query_is_valid(aggregate_query);
}

double firebase_firestore_aggregate_query_get(uint64_t aggregate_query, double source, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyRefFailure(callback); return 0.0; }
    return api->aggregate_query_get(aggregate_query, source, callback);
}

void firebase_firestore_aggregate_query_release(uint64_t aggregate_query)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api != nullptr) api->aggregate_query_release(aggregate_query);
}

double firebase_firestore_aggregate_snapshot_count(uint64_t snapshot)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->aggregate_snapshot_count(snapshot) : 0.0;
}

uint64_t firebase_firestore_aggregate_snapshot_get_query(uint64_t snapshot)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->aggregate_snapshot_get_query(snapshot);
}

bool firebase_firestore_aggregate_snapshot_is_valid(uint64_t snapshot)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->aggregate_snapshot_is_valid(snapshot);
}

void firebase_firestore_aggregate_snapshot_release(uint64_t snapshot)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api != nullptr) api->aggregate_snapshot_release(snapshot);
}

// ============================================================
// Misc: snapshots-in-sync, bundles, named queries
// ============================================================

uint64_t firebase_firestore_add_snapshots_in_sync_listener(uint64_t firestore, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->add_snapshots_in_sync_listener(firestore, callback);
}

double firebase_firestore_load_bundle(uint64_t firestore, gm::wire::GMBuffer bundle, const std::optional<gm::wire::GMFunction>& progress_callback, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyLoadBundleFailure(callback); return 0.0; }
    return api->load_bundle(firestore, bundle, progress_callback, callback);
}

double firebase_firestore_named_query(uint64_t firestore, std::string_view name, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyRefFailure(callback); return 0.0; }
    return api->named_query(firestore, name, callback);
}

double firebase_firestore_document_ref_set_merge_field_paths(uint64_t document, const gm::wire::GMValue& data, const gm::wire::GMValue& field_paths, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return api->document_ref_set_merge_field_paths(document, data, field_paths, callback);
}

void firebase_firestore_write_batch_set_merge_field_paths(uint64_t batch, uint64_t document, const gm::wire::GMValue& data, const gm::wire::GMValue& field_paths)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api != nullptr) api->write_batch_set_merge_field_paths(batch, document, data, field_paths);
}

// ============================================================
// FieldValue accessors
// ============================================================

double firebase_firestore_field_value_type(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->field_value_type(field_value) : -1.0;
}

bool firebase_firestore_field_value_is_valid(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->field_value_is_valid(field_value);
}

bool firebase_firestore_field_value_is_null(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->field_value_is_null(field_value);
}

bool firebase_firestore_field_value_is_boolean(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->field_value_is_boolean(field_value);
}

bool firebase_firestore_field_value_is_integer(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->field_value_is_integer(field_value);
}

bool firebase_firestore_field_value_is_double(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->field_value_is_double(field_value);
}

bool firebase_firestore_field_value_is_timestamp(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->field_value_is_timestamp(field_value);
}

bool firebase_firestore_field_value_is_string(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->field_value_is_string(field_value);
}

bool firebase_firestore_field_value_is_blob(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->field_value_is_blob(field_value);
}

bool firebase_firestore_field_value_is_reference(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->field_value_is_reference(field_value);
}

bool firebase_firestore_field_value_is_geo_point(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->field_value_is_geo_point(field_value);
}

bool firebase_firestore_field_value_is_array(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->field_value_is_array(field_value);
}

bool firebase_firestore_field_value_is_map(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->field_value_is_map(field_value);
}

bool firebase_firestore_field_value_boolean_value(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->field_value_boolean_value(field_value);
}

double firebase_firestore_field_value_integer_value(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->field_value_integer_value(field_value) : 0.0;
}

double firebase_firestore_field_value_double_value(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->field_value_double_value(field_value) : 0.0;
}

std::string firebase_firestore_field_value_string_value(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->field_value_string_value(field_value) : std::string();
}

double firebase_firestore_field_value_blob_size(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->field_value_blob_size(field_value) : 0.0;
}

double firebase_firestore_field_value_blob_copy(uint64_t field_value, gm::wire::GMBuffer out_buffer)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->field_value_blob_copy(field_value, out_buffer) : 0.0;
}

uint64_t firebase_firestore_field_value_reference_value(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->field_value_reference_value(field_value);
}

gm::wire::DataStream firebase_firestore_field_value_timestamp_value(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->field_value_timestamp_value(field_value) : gm::wire::DataStream();
}

gm::wire::DataStream firebase_firestore_field_value_geo_point_value(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->field_value_geo_point_value(field_value) : gm::wire::DataStream();
}

gm::wire::DataStream firebase_firestore_field_value_array_value(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->field_value_array_value(field_value) : gm::wire::DataStream();
}

gm::wire::DataStream firebase_firestore_field_value_map_value(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->field_value_map_value(field_value) : gm::wire::DataStream();
}

std::string firebase_firestore_field_value_to_string(uint64_t field_value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->field_value_to_string(field_value) : std::string();
}

double firebase_firestore_field_value_boolean(bool value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->field_value_boolean(value);
}

double firebase_firestore_field_value_string(std::string_view value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->field_value_string(value);
}

double firebase_firestore_field_value_array(const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->field_value_array(value);
}

double firebase_firestore_field_value_map(const gm::wire::GMValue& value)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->field_value_map(value);
}

// ============================================================
// Multi-instance / misc accessors
// ============================================================

uint64_t firebase_firestore_query_get_firestore(uint64_t query)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_get_firestore(query);
}

uint64_t firebase_firestore_document_ref_get_firestore(uint64_t document)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->document_ref_get_firestore(document);
}

std::string firebase_firestore_document_ref_to_string(uint64_t document)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->document_ref_to_string(document) : std::string();
}

double firebase_firestore_document_ref_update_field_paths(uint64_t document, const gm::wire::GMValue& entries, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { notifyVoidFailure(callback); return 0.0; }
    return api->document_ref_update_field_paths(document, entries, callback);
}

double firebase_firestore_write_batch_update_field_paths(uint64_t batch, uint64_t document, const gm::wire::GMValue& entries)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0.0; }
    return api->write_batch_update_field_paths(batch, document, entries);
}

bool firebase_firestore_write_batch_is_valid(uint64_t batch)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->write_batch_is_valid(batch);
}

std::string firebase_firestore_settings_to_string(uint64_t firestore)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->settings_to_string(firestore) : std::string();
}

uint64_t firebase_firestore_get_app(uint64_t firestore)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->get_app(firestore);
}

uint64_t firebase_firestore_get_instance_for_app(uint64_t app)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->get_instance_for_app(app);
}

uint64_t firebase_firestore_get_instance_for_app_database(uint64_t app, std::string_view database_id)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->get_instance_for_app_database(app, database_id);
}
