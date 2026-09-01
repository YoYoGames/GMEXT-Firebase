#pragma once

#include <cstdint>
#include <optional>
#include <string>
#include <string_view>

#include "core/GMExtWire.h"

#include "GMFirebase_core_api.h"

#define GMFIREBASE_CORE_FIRESTORE_ABI_VERSION 1u

// Mirrors gm_structs::FirestoreDocumentSnapshotInfo (GMFirebaseFirestore's own
// extgen-generated type) field-for-field. Core cannot depend on a product
// module's generated code, so this hand-written twin is what crosses the ABI;
// Firestore's forwarder copies the fields into the real
// gm_structs::FirestoreDocumentSnapshotInfo it hands back to its generated stub.
struct GMFirebaseFirestoreDocumentSnapshotInfo
{
    bool exists;
    std::string id;
    std::uint64_t reference;
    bool has_pending_writes;
    bool is_from_cache;
};

// Mirrors gm_structs::FirestoreQuerySnapshotInfo field-for-field.
struct GMFirebaseFirestoreQuerySnapshotInfo
{
    double size;
    bool empty;
    bool has_pending_writes;
    bool is_from_cache;
};

// Internal Core<->product-module ABI for Firestore. Unlike GMFirebaseCoreAPI
// above, this is free to take gm::wire types (GMFunction/GMValue/GMBuffer/
// DataStream) directly instead of opaque void*/uint64_t: every split
// extension DLL in this repo is built by the same toolchain, so these
// ordinary C++ classes are safe to pass across the boundary - the crash this
// ABI exists to avoid came from the Firebase C++ SDK's own per-DLL static
// state, not from sharing wire types. This struct is hand-written and
// invisible to GameMaker/extgen; it is not generated from spec.gmidl and is
// fine to edit directly.
struct GMFirebaseCoreFirestoreAPI
{
    std::uint32_t abi_version;
    std::uint32_t struct_size;

    // Instance / settings
    std::uint64_t (*get_instance)();
    std::uint64_t (*get_instance_for_database)(std::string_view database_name);
    std::string (*settings_get_host)(std::uint64_t instance_ref);
    void (*settings_set_host)(std::uint64_t instance_ref, std::string_view host);
    bool (*settings_get_ssl_enabled)(std::uint64_t instance_ref);
    void (*settings_set_ssl_enabled)(std::uint64_t instance_ref, bool enabled);
    bool (*settings_get_persistence_enabled)(std::uint64_t instance_ref);
    void (*settings_set_persistence_enabled)(std::uint64_t instance_ref, bool enabled);
    double (*settings_get_cache_size_bytes)(std::uint64_t instance_ref);
    void (*settings_set_cache_size_bytes)(std::uint64_t instance_ref, double bytes);
    std::uint64_t (*collection)(std::uint64_t instance_ref, std::string_view path);
    std::uint64_t (*document)(std::uint64_t instance_ref, std::string_view path);
    std::uint64_t (*collection_group)(std::uint64_t instance_ref, std::string_view collection_id);
    std::uint64_t (*batch)(std::uint64_t instance_ref);
    void (*set_log_level)(double level);

    // Async lifecycle ops
    double (*enable_network)(std::uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback);
    double (*disable_network)(std::uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback);
    double (*terminate)(std::uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback);
    double (*clear_persistence)(std::uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback);
    double (*wait_for_pending_writes)(std::uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback);
    double (*run_transaction)(std::uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback);

    // CollectionReference
    std::string (*collection_ref_id)(std::uint64_t ref);
    std::string (*collection_ref_path)(std::uint64_t ref);
    std::uint64_t (*collection_ref_parent)(std::uint64_t ref);
    std::uint64_t (*collection_ref_document)(std::uint64_t ref);
    std::uint64_t (*collection_ref_document_path)(std::uint64_t ref, std::string_view path);
    double (*collection_ref_add)(std::uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback);
    bool (*collection_ref_is_valid)(std::uint64_t ref);
    void (*collection_ref_release)(std::uint64_t ref);

    // DocumentReference
    std::string (*document_ref_id)(std::uint64_t ref);
    std::string (*document_ref_path)(std::uint64_t ref);
    std::uint64_t (*document_ref_parent)(std::uint64_t ref);
    std::uint64_t (*document_ref_collection)(std::uint64_t ref, std::string_view path);
    double (*document_ref_get)(std::uint64_t ref, double source, const std::optional<gm::wire::GMFunction>& callback);
    double (*document_ref_set)(std::uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback);
    double (*document_ref_set_merge)(std::uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback);
    double (*document_ref_set_merge_fields)(std::uint64_t ref, const gm::wire::GMValue& data, const gm::wire::GMValue& fields, const std::optional<gm::wire::GMFunction>& callback);
    double (*document_ref_update)(std::uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback);
    double (*document_ref_delete)(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback);
    std::uint64_t (*document_ref_add_snapshot_listener)(std::uint64_t ref, bool include_metadata_changes, const std::optional<gm::wire::GMFunction>& callback);
    bool (*document_ref_is_valid)(std::uint64_t ref);
    void (*document_ref_release)(std::uint64_t ref);

    // Query
    std::uint64_t (*query_where_equal_to)(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& value);
    std::uint64_t (*query_where_not_equal_to)(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& value);
    std::uint64_t (*query_where_less_than)(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& value);
    std::uint64_t (*query_where_less_than_or_equal_to)(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& value);
    std::uint64_t (*query_where_greater_than)(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& value);
    std::uint64_t (*query_where_greater_than_or_equal_to)(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& value);
    std::uint64_t (*query_where_array_contains)(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& value);
    std::uint64_t (*query_where_array_contains_any)(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& values);
    std::uint64_t (*query_where_in)(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& values);
    std::uint64_t (*query_where_not_in)(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& values);
    std::uint64_t (*query_order_by)(std::uint64_t ref, std::string_view field, double direction);
    std::uint64_t (*query_limit)(std::uint64_t ref, double limit);
    std::uint64_t (*query_limit_to_last)(std::uint64_t ref, double limit);
    std::uint64_t (*query_start_at_snapshot)(std::uint64_t ref, std::uint64_t snapshot_ref);
    std::uint64_t (*query_start_at_values)(std::uint64_t ref, const gm::wire::GMValue& values);
    std::uint64_t (*query_start_after_snapshot)(std::uint64_t ref, std::uint64_t snapshot_ref);
    std::uint64_t (*query_start_after_values)(std::uint64_t ref, const gm::wire::GMValue& values);
    std::uint64_t (*query_end_before_snapshot)(std::uint64_t ref, std::uint64_t snapshot_ref);
    std::uint64_t (*query_end_before_values)(std::uint64_t ref, const gm::wire::GMValue& values);
    std::uint64_t (*query_end_at_snapshot)(std::uint64_t ref, std::uint64_t snapshot_ref);
    std::uint64_t (*query_end_at_values)(std::uint64_t ref, const gm::wire::GMValue& values);
    double (*query_get)(std::uint64_t ref, double source, const std::optional<gm::wire::GMFunction>& callback);
    std::uint64_t (*query_add_snapshot_listener)(std::uint64_t ref, bool include_metadata_changes, const std::optional<gm::wire::GMFunction>& callback);
    bool (*query_is_valid)(std::uint64_t ref);
    void (*query_release)(std::uint64_t ref);

    // WriteBatch
    double (*write_batch_set)(std::uint64_t batch_ref, std::uint64_t document_ref, const gm::wire::GMValue& data);
    double (*write_batch_set_merge)(std::uint64_t batch_ref, std::uint64_t document_ref, const gm::wire::GMValue& data);
    double (*write_batch_set_merge_fields)(std::uint64_t batch_ref, std::uint64_t document_ref, const gm::wire::GMValue& data, const gm::wire::GMValue& fields);
    double (*write_batch_update)(std::uint64_t batch_ref, std::uint64_t document_ref, const gm::wire::GMValue& data);
    double (*write_batch_delete)(std::uint64_t batch_ref, std::uint64_t document_ref);
    double (*write_batch_commit)(std::uint64_t batch_ref, const std::optional<gm::wire::GMFunction>& callback);
    void (*write_batch_release)(std::uint64_t batch_ref);

    // FieldValue constructors
    double (*field_value_delete)();
    double (*field_value_server_timestamp)();
    double (*field_value_array_union)(const gm::wire::GMValue& values);
    double (*field_value_array_remove)(const gm::wire::GMValue& values);
    double (*field_value_increment_integer)(double value);
    double (*field_value_increment_double)(double value);
    double (*field_value_integer)(double value);
    double (*field_value_double)(double value);
    double (*field_value_timestamp)(double seconds, double nanoseconds);
    double (*field_value_geo_point)(double latitude, double longitude);
    double (*field_value_reference)(std::uint64_t document_ref);
    double (*field_value_blob)(std::string_view data);
    double (*field_value_null)();
    void (*field_value_release)(std::uint64_t ref);

    // DocumentSnapshot
    GMFirebaseFirestoreDocumentSnapshotInfo (*document_snapshot_get_info)(std::uint64_t ref);
    gm::wire::DataStream (*document_snapshot_get)(std::uint64_t ref, std::string_view field, double server_timestamp_behavior);
    gm::wire::DataStream (*document_snapshot_get_data)(std::uint64_t ref, double server_timestamp_behavior);
    void (*document_snapshot_release)(std::uint64_t ref);

    // QuerySnapshot
    GMFirebaseFirestoreQuerySnapshotInfo (*query_snapshot_get_info)(std::uint64_t ref);
    gm::wire::DataStream (*query_snapshot_documents)(std::uint64_t ref);
    gm::wire::DataStream (*query_snapshot_document_changes)(std::uint64_t ref, bool include_metadata_changes);
    void (*query_snapshot_release)(std::uint64_t ref);

    // ListenerRegistration
    void (*listener_registration_remove)(std::uint64_t ref);

    // FieldPath
    double (*field_path_create)(const gm::wire::GMValue& components);
    double (*field_path_document_id)();
    bool (*field_path_is_valid)(std::uint64_t field_path);
    std::string (*field_path_to_string)(std::uint64_t field_path);
    void (*field_path_release)(std::uint64_t field_path);

    // Filter
    double (*filter_equal_to)(std::string_view field, const gm::wire::GMValue& value);
    double (*filter_not_equal_to)(std::string_view field, const gm::wire::GMValue& value);
    double (*filter_less_than)(std::string_view field, const gm::wire::GMValue& value);
    double (*filter_less_than_or_equal_to)(std::string_view field, const gm::wire::GMValue& value);
    double (*filter_greater_than)(std::string_view field, const gm::wire::GMValue& value);
    double (*filter_greater_than_or_equal_to)(std::string_view field, const gm::wire::GMValue& value);
    double (*filter_array_contains)(std::string_view field, const gm::wire::GMValue& value);
    double (*filter_array_contains_any)(std::string_view field, const gm::wire::GMValue& values);
    double (*filter_in)(std::string_view field, const gm::wire::GMValue& values);
    double (*filter_not_in)(std::string_view field, const gm::wire::GMValue& values);
    double (*filter_equal_to_field_path)(std::uint64_t field_path, const gm::wire::GMValue& value);
    double (*filter_not_equal_to_field_path)(std::uint64_t field_path, const gm::wire::GMValue& value);
    double (*filter_less_than_field_path)(std::uint64_t field_path, const gm::wire::GMValue& value);
    double (*filter_less_than_or_equal_to_field_path)(std::uint64_t field_path, const gm::wire::GMValue& value);
    double (*filter_greater_than_field_path)(std::uint64_t field_path, const gm::wire::GMValue& value);
    double (*filter_greater_than_or_equal_to_field_path)(std::uint64_t field_path, const gm::wire::GMValue& value);
    double (*filter_array_contains_field_path)(std::uint64_t field_path, const gm::wire::GMValue& value);
    double (*filter_array_contains_any_field_path)(std::uint64_t field_path, const gm::wire::GMValue& values);
    double (*filter_in_field_path)(std::uint64_t field_path, const gm::wire::GMValue& values);
    double (*filter_not_in_field_path)(std::uint64_t field_path, const gm::wire::GMValue& values);
    double (*filter_and)(const gm::wire::GMValue& filters);
    double (*filter_or)(const gm::wire::GMValue& filters);
    void (*filter_release)(std::uint64_t filter);
    std::uint64_t (*query_where_filter)(std::uint64_t query, std::uint64_t filter);
    std::uint64_t (*query_where_equal_to_field_path)(std::uint64_t query, std::uint64_t field_path, const gm::wire::GMValue& value);
    std::uint64_t (*query_where_not_equal_to_field_path)(std::uint64_t query, std::uint64_t field_path, const gm::wire::GMValue& value);
    std::uint64_t (*query_where_less_than_field_path)(std::uint64_t query, std::uint64_t field_path, const gm::wire::GMValue& value);
    std::uint64_t (*query_where_less_than_or_equal_to_field_path)(std::uint64_t query, std::uint64_t field_path, const gm::wire::GMValue& value);
    std::uint64_t (*query_where_greater_than_field_path)(std::uint64_t query, std::uint64_t field_path, const gm::wire::GMValue& value);
    std::uint64_t (*query_where_greater_than_or_equal_to_field_path)(std::uint64_t query, std::uint64_t field_path, const gm::wire::GMValue& value);
    std::uint64_t (*query_where_array_contains_field_path)(std::uint64_t query, std::uint64_t field_path, const gm::wire::GMValue& value);
    std::uint64_t (*query_where_array_contains_any_field_path)(std::uint64_t query, std::uint64_t field_path, const gm::wire::GMValue& values);
    std::uint64_t (*query_where_in_field_path)(std::uint64_t query, std::uint64_t field_path, const gm::wire::GMValue& values);
    std::uint64_t (*query_where_not_in_field_path)(std::uint64_t query, std::uint64_t field_path, const gm::wire::GMValue& values);
    std::uint64_t (*query_order_by_field_path)(std::uint64_t query, std::uint64_t field_path, double direction);

    // AggregateQuery / AggregateQuerySnapshot
    std::uint64_t (*query_count)(std::uint64_t query);
    std::uint64_t (*aggregate_query_get_query)(std::uint64_t aggregate_query);
    bool (*aggregate_query_is_valid)(std::uint64_t aggregate_query);
    double (*aggregate_query_get)(std::uint64_t aggregate_query, double source, const std::optional<gm::wire::GMFunction>& callback);
    void (*aggregate_query_release)(std::uint64_t aggregate_query);
    double (*aggregate_snapshot_count)(std::uint64_t snapshot);
    std::uint64_t (*aggregate_snapshot_get_query)(std::uint64_t snapshot);
    bool (*aggregate_snapshot_is_valid)(std::uint64_t snapshot);
    void (*aggregate_snapshot_release)(std::uint64_t snapshot);

    // Misc: snapshots-in-sync, bundles, named queries
    std::uint64_t (*add_snapshots_in_sync_listener)(std::uint64_t firestore, const std::optional<gm::wire::GMFunction>& callback);
    double (*load_bundle)(std::uint64_t firestore, gm::wire::GMBuffer bundle, const std::optional<gm::wire::GMFunction>& progress_callback, const std::optional<gm::wire::GMFunction>& callback);
    double (*named_query)(std::uint64_t firestore, std::string_view name, const std::optional<gm::wire::GMFunction>& callback);
    double (*document_ref_set_merge_field_paths)(std::uint64_t document, const gm::wire::GMValue& data, const gm::wire::GMValue& field_paths, const std::optional<gm::wire::GMFunction>& callback);
    void (*write_batch_set_merge_field_paths)(std::uint64_t batch, std::uint64_t document, const gm::wire::GMValue& data, const gm::wire::GMValue& field_paths);

    // FieldValue accessors
    double (*field_value_type)(std::uint64_t field_value);
    bool (*field_value_is_valid)(std::uint64_t field_value);
    bool (*field_value_is_null)(std::uint64_t field_value);
    bool (*field_value_is_boolean)(std::uint64_t field_value);
    bool (*field_value_is_integer)(std::uint64_t field_value);
    bool (*field_value_is_double)(std::uint64_t field_value);
    bool (*field_value_is_timestamp)(std::uint64_t field_value);
    bool (*field_value_is_string)(std::uint64_t field_value);
    bool (*field_value_is_blob)(std::uint64_t field_value);
    bool (*field_value_is_reference)(std::uint64_t field_value);
    bool (*field_value_is_geo_point)(std::uint64_t field_value);
    bool (*field_value_is_array)(std::uint64_t field_value);
    bool (*field_value_is_map)(std::uint64_t field_value);
    bool (*field_value_boolean_value)(std::uint64_t field_value);
    double (*field_value_integer_value)(std::uint64_t field_value);
    double (*field_value_double_value)(std::uint64_t field_value);
    std::string (*field_value_string_value)(std::uint64_t field_value);
    double (*field_value_blob_size)(std::uint64_t field_value);
    double (*field_value_blob_copy)(std::uint64_t field_value, gm::wire::GMBuffer out_buffer);
    std::uint64_t (*field_value_reference_value)(std::uint64_t field_value);
    gm::wire::DataStream (*field_value_timestamp_value)(std::uint64_t field_value);
    gm::wire::DataStream (*field_value_geo_point_value)(std::uint64_t field_value);
    gm::wire::DataStream (*field_value_array_value)(std::uint64_t field_value);
    gm::wire::DataStream (*field_value_map_value)(std::uint64_t field_value);
    std::string (*field_value_to_string)(std::uint64_t field_value);

    // Multi-instance / misc accessors
    std::uint64_t (*query_get_firestore)(std::uint64_t query);
    std::uint64_t (*document_ref_get_firestore)(std::uint64_t document);
    std::string (*document_ref_to_string)(std::uint64_t document);
    double (*document_ref_update_field_paths)(std::uint64_t document, const gm::wire::GMValue& entries, const std::optional<gm::wire::GMFunction>& callback);
    double (*write_batch_update_field_paths)(std::uint64_t batch, std::uint64_t document, const gm::wire::GMValue& entries);
    bool (*write_batch_is_valid)(std::uint64_t batch);
    std::string (*settings_to_string)(std::uint64_t firestore);
    bool (*document_snapshot_is_valid)(std::uint64_t snapshot);
    std::string (*document_snapshot_to_string)(std::uint64_t snapshot);
    gm::wire::DataStream (*document_snapshot_get_field_path)(std::uint64_t snapshot, std::uint64_t field_path, double server_timestamp_behavior);
    bool (*query_snapshot_is_valid)(std::uint64_t snapshot);
    std::uint64_t (*query_snapshot_get_query)(std::uint64_t snapshot);
    bool (*listener_registration_is_valid)(std::uint64_t listener);
    std::uint64_t (*get_app)(std::uint64_t firestore);
    std::uint64_t (*get_instance_for_app)(std::uint64_t app);
    std::uint64_t (*get_instance_for_app_database)(std::uint64_t app, std::string_view database_id);
    double (*field_value_boolean)(bool value);
    double (*field_value_string)(std::string_view value);
    double (*field_value_array)(const gm::wire::GMValue& value);
    double (*field_value_map)(const gm::wire::GMValue& value);
    std::string (*document_snapshot_metadata_to_string)(std::uint64_t snapshot);
    std::string (*query_snapshot_metadata_to_string)(std::uint64_t snapshot);
    bool (*document_snapshot_exists)(std::uint64_t snapshot);
    std::string (*document_snapshot_id)(std::uint64_t snapshot);
    std::uint64_t (*document_snapshot_reference)(std::uint64_t snapshot);
    bool (*document_snapshot_metadata_has_pending_writes)(std::uint64_t snapshot);
    bool (*document_snapshot_metadata_is_from_cache)(std::uint64_t snapshot);
    double (*query_snapshot_size)(std::uint64_t snapshot);
    bool (*query_snapshot_empty)(std::uint64_t snapshot);
    bool (*query_snapshot_metadata_has_pending_writes)(std::uint64_t snapshot);
    bool (*query_snapshot_metadata_is_from_cache)(std::uint64_t snapshot);
};

extern "C" GMFIREBASE_CORE_EXPORT
const GMFirebaseCoreFirestoreAPI* gmfirebase_core_get_firestore_api();
