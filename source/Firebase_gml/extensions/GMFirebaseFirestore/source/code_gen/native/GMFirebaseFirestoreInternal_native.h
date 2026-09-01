// ##### extgen :: Auto-generated file do not edit!! #####

#pragma once
#include <cstdint>
#include <string_view>
#include <vector>
#include <array>
#include <optional>
#include "core/GMExtWire.h"

namespace gm_consts
{
}


namespace gm_enums
{
    enum class FirestoreError : std::int64_t
    {
        Ok = 0,
        Cancelled = 1,
        Unknown = 2,
        InvalidArgument = 3,
        DeadlineExceeded = 4,
        NotFound = 5,
        AlreadyExists = 6,
        PermissionDenied = 7,
        ResourceExhausted = 8,
        FailedPrecondition = 9,
        Aborted = 10,
        OutOfRange = 11,
        Unimplemented = 12,
        Internal = 13,
        Unavailable = 14,
        DataLoss = 15,
        Unauthenticated = 16
    };

    enum class FirestoreSource : std::int64_t
    {
        Default = 0,
        Cache = 1,
        Server = 2
    };

    enum class FirestoreDirection : std::int64_t
    {
        Ascending = 0,
        Descending = 1
    };

    enum class FirestoreServerTimestampBehavior : std::int64_t
    {
        None = 0,
        Estimate = 1,
        Previous = 2
    };

    enum class FirestoreDocumentChangeType : std::int64_t
    {
        Added = 0,
        Modified = 1,
        Removed = 2
    };

}


namespace gm_structs
{
    struct FirestoreDocumentSnapshotInfo;
    struct FirestoreQuerySnapshotInfo;

    struct FirestoreDocumentSnapshotInfo
    {
        bool exists;
        std::string id;
        std::uint64_t reference;
        bool has_pending_writes;
        bool is_from_cache;
    };

    struct FirestoreQuerySnapshotInfo
    {
        double size;
        bool empty;
        bool has_pending_writes;
        bool is_from_cache;
    };

}

namespace gm::wire::codec
{
    template<>
    inline void writeValue<gm_structs::FirestoreDocumentSnapshotInfo>(gm::byteio::IByteWriter& _buf, const gm_structs::FirestoreDocumentSnapshotInfo& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.exists);
        gm::wire::codec::writeValue(_buf, obj.id);
        gm::wire::codec::writeValue(_buf, obj.reference);
        gm::wire::codec::writeValue(_buf, obj.has_pending_writes);
        gm::wire::codec::writeValue(_buf, obj.is_from_cache);
    }

    template<>
    inline gm_structs::FirestoreDocumentSnapshotInfo readValue<gm_structs::FirestoreDocumentSnapshotInfo>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::FirestoreDocumentSnapshotInfo obj;
        obj.exists = gm::wire::codec::readValue<bool>(_buf);
        obj.id = gm::wire::codec::readValue<std::string>(_buf);
        obj.reference = gm::wire::codec::readValue<std::uint64_t>(_buf);
        obj.has_pending_writes = gm::wire::codec::readValue<bool>(_buf);
        obj.is_from_cache = gm::wire::codec::readValue<bool>(_buf);
        return obj;
    }

    template<>
    inline void writeValue<gm_structs::FirestoreQuerySnapshotInfo>(gm::byteio::IByteWriter& _buf, const gm_structs::FirestoreQuerySnapshotInfo& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.size);
        gm::wire::codec::writeValue(_buf, obj.empty);
        gm::wire::codec::writeValue(_buf, obj.has_pending_writes);
        gm::wire::codec::writeValue(_buf, obj.is_from_cache);
    }

    template<>
    inline gm_structs::FirestoreQuerySnapshotInfo readValue<gm_structs::FirestoreQuerySnapshotInfo>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::FirestoreQuerySnapshotInfo obj;
        obj.size = gm::wire::codec::readValue<double>(_buf);
        obj.empty = gm::wire::codec::readValue<bool>(_buf);
        obj.has_pending_writes = gm::wire::codec::readValue<bool>(_buf);
        obj.is_from_cache = gm::wire::codec::readValue<bool>(_buf);
        return obj;
    }

}

namespace gm::wire::details
{
    template<>
    struct gm_struct_traits<gm_structs::FirestoreDocumentSnapshotInfo>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 0;
    };

    template<>
    struct gm_struct_traits<gm_structs::FirestoreQuerySnapshotInfo>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 1;
    };

}

std::uint64_t firebase_firestore_get_instance();
std::uint64_t firebase_firestore_get_instance_for_database(std::string_view database_name);
std::string firebase_firestore_settings_get_host(std::uint64_t instance_ref);
void firebase_firestore_settings_set_host(std::uint64_t instance_ref, std::string_view host);
bool firebase_firestore_settings_get_ssl_enabled(std::uint64_t instance_ref);
void firebase_firestore_settings_set_ssl_enabled(std::uint64_t instance_ref, bool enabled);
bool firebase_firestore_settings_get_persistence_enabled(std::uint64_t instance_ref);
void firebase_firestore_settings_set_persistence_enabled(std::uint64_t instance_ref, bool enabled);
double firebase_firestore_settings_get_cache_size_bytes(std::uint64_t instance_ref);
void firebase_firestore_settings_set_cache_size_bytes(std::uint64_t instance_ref, double bytes);
std::uint64_t firebase_firestore_collection(std::uint64_t instance_ref, std::string_view path);
std::uint64_t firebase_firestore_document(std::uint64_t instance_ref, std::string_view path);
std::uint64_t firebase_firestore_collection_group(std::uint64_t instance_ref, std::string_view collection_id);
std::uint64_t firebase_firestore_batch(std::uint64_t instance_ref);
void firebase_firestore_set_log_level(double level);
double firebase_firestore_enable_network(std::uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_disable_network(std::uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_terminate(std::uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_clear_persistence(std::uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_wait_for_pending_writes(std::uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_run_transaction(std::uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback);
std::string firebase_firestore_collection_ref_id(std::uint64_t ref);
std::string firebase_firestore_collection_ref_path(std::uint64_t ref);
std::uint64_t firebase_firestore_collection_ref_parent(std::uint64_t ref);
std::uint64_t firebase_firestore_collection_ref_document(std::uint64_t ref);
std::uint64_t firebase_firestore_collection_ref_document_path(std::uint64_t ref, std::string_view path);
double firebase_firestore_collection_ref_add(std::uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback);
bool firebase_firestore_collection_ref_is_valid(std::uint64_t ref);
void firebase_firestore_collection_ref_release(std::uint64_t ref);
std::string firebase_firestore_document_ref_id(std::uint64_t ref);
std::string firebase_firestore_document_ref_path(std::uint64_t ref);
std::uint64_t firebase_firestore_document_ref_parent(std::uint64_t ref);
std::uint64_t firebase_firestore_document_ref_collection(std::uint64_t ref, std::string_view path);
double firebase_firestore_document_ref_get(std::uint64_t ref, double source, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_document_ref_set(std::uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_document_ref_set_merge(std::uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_document_ref_set_merge_fields(std::uint64_t ref, const gm::wire::GMValue& data, const gm::wire::GMValue& fields, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_document_ref_update(std::uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_document_ref_delete(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback);
std::uint64_t firebase_firestore_document_ref_add_snapshot_listener(std::uint64_t ref, bool include_metadata_changes, const std::optional<gm::wire::GMFunction>& callback);
bool firebase_firestore_document_ref_is_valid(std::uint64_t ref);
void firebase_firestore_document_ref_release(std::uint64_t ref);
std::uint64_t firebase_firestore_query_where_equal_to(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& value);
std::uint64_t firebase_firestore_query_where_not_equal_to(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& value);
std::uint64_t firebase_firestore_query_where_less_than(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& value);
std::uint64_t firebase_firestore_query_where_less_than_or_equal_to(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& value);
std::uint64_t firebase_firestore_query_where_greater_than(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& value);
std::uint64_t firebase_firestore_query_where_greater_than_or_equal_to(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& value);
std::uint64_t firebase_firestore_query_where_array_contains(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& value);
std::uint64_t firebase_firestore_query_where_array_contains_any(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& values);
std::uint64_t firebase_firestore_query_where_in(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& values);
std::uint64_t firebase_firestore_query_where_not_in(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& values);
std::uint64_t firebase_firestore_query_order_by(std::uint64_t ref, std::string_view field, double direction);
std::uint64_t firebase_firestore_query_limit(std::uint64_t ref, double limit);
std::uint64_t firebase_firestore_query_limit_to_last(std::uint64_t ref, double limit);
std::uint64_t firebase_firestore_query_start_at_snapshot(std::uint64_t ref, std::uint64_t snapshot_ref);
std::uint64_t firebase_firestore_query_start_at_values(std::uint64_t ref, const gm::wire::GMValue& values);
std::uint64_t firebase_firestore_query_start_after_snapshot(std::uint64_t ref, std::uint64_t snapshot_ref);
std::uint64_t firebase_firestore_query_start_after_values(std::uint64_t ref, const gm::wire::GMValue& values);
std::uint64_t firebase_firestore_query_end_before_snapshot(std::uint64_t ref, std::uint64_t snapshot_ref);
std::uint64_t firebase_firestore_query_end_before_values(std::uint64_t ref, const gm::wire::GMValue& values);
std::uint64_t firebase_firestore_query_end_at_snapshot(std::uint64_t ref, std::uint64_t snapshot_ref);
std::uint64_t firebase_firestore_query_end_at_values(std::uint64_t ref, const gm::wire::GMValue& values);
double firebase_firestore_query_get(std::uint64_t ref, double source, const std::optional<gm::wire::GMFunction>& callback);
std::uint64_t firebase_firestore_query_add_snapshot_listener(std::uint64_t ref, bool include_metadata_changes, const std::optional<gm::wire::GMFunction>& callback);
bool firebase_firestore_query_is_valid(std::uint64_t ref);
void firebase_firestore_query_release(std::uint64_t ref);
double firebase_firestore_write_batch_set(std::uint64_t batch_ref, std::uint64_t document_ref, const gm::wire::GMValue& data);
double firebase_firestore_write_batch_set_merge(std::uint64_t batch_ref, std::uint64_t document_ref, const gm::wire::GMValue& data);
double firebase_firestore_write_batch_set_merge_fields(std::uint64_t batch_ref, std::uint64_t document_ref, const gm::wire::GMValue& data, const gm::wire::GMValue& fields);
double firebase_firestore_write_batch_update(std::uint64_t batch_ref, std::uint64_t document_ref, const gm::wire::GMValue& data);
double firebase_firestore_write_batch_delete(std::uint64_t batch_ref, std::uint64_t document_ref);
double firebase_firestore_write_batch_commit(std::uint64_t batch_ref, const std::optional<gm::wire::GMFunction>& callback);
void firebase_firestore_write_batch_release(std::uint64_t batch_ref);
double firebase_firestore_field_value_delete();
double firebase_firestore_field_value_server_timestamp();
double firebase_firestore_field_value_array_union(const gm::wire::GMValue& values);
double firebase_firestore_field_value_array_remove(const gm::wire::GMValue& values);
double firebase_firestore_field_value_increment_integer(double value);
double firebase_firestore_field_value_increment_double(double value);
double firebase_firestore_field_value_integer(double value);
double firebase_firestore_field_value_double(double value);
double firebase_firestore_field_value_timestamp(double seconds, double nanoseconds);
double firebase_firestore_field_value_geo_point(double latitude, double longitude);
double firebase_firestore_field_value_reference(std::uint64_t document_ref);
double firebase_firestore_field_value_blob(std::string_view data);
double firebase_firestore_field_value_null();
void firebase_firestore_field_value_release(std::uint64_t ref);
gm_structs::FirestoreDocumentSnapshotInfo firebase_firestore_document_snapshot_get_info(std::uint64_t ref);
gm::wire::DataStream firebase_firestore_document_snapshot_get(std::uint64_t ref, std::string_view field, double server_timestamp_behavior);
gm::wire::DataStream firebase_firestore_document_snapshot_get_data(std::uint64_t ref, double server_timestamp_behavior);
void firebase_firestore_document_snapshot_release(std::uint64_t ref);
gm_structs::FirestoreQuerySnapshotInfo firebase_firestore_query_snapshot_get_info(std::uint64_t ref);
gm::wire::DataStream firebase_firestore_query_snapshot_documents(std::uint64_t ref);
gm::wire::DataStream firebase_firestore_query_snapshot_document_changes(std::uint64_t ref, bool include_metadata_changes);
void firebase_firestore_query_snapshot_release(std::uint64_t ref);
void firebase_firestore_listener_registration_remove(std::uint64_t ref);
double firebase_firestore_field_path_create(const gm::wire::GMValue& components);
double firebase_firestore_field_path_document_id();
bool firebase_firestore_field_path_is_valid(std::uint64_t field_path);
std::string firebase_firestore_field_path_to_string(std::uint64_t field_path);
void firebase_firestore_field_path_release(std::uint64_t field_path);
double firebase_firestore_filter_equal_to(std::string_view field, const gm::wire::GMValue& value);
double firebase_firestore_filter_not_equal_to(std::string_view field, const gm::wire::GMValue& value);
double firebase_firestore_filter_less_than(std::string_view field, const gm::wire::GMValue& value);
double firebase_firestore_filter_less_than_or_equal_to(std::string_view field, const gm::wire::GMValue& value);
double firebase_firestore_filter_greater_than(std::string_view field, const gm::wire::GMValue& value);
double firebase_firestore_filter_greater_than_or_equal_to(std::string_view field, const gm::wire::GMValue& value);
double firebase_firestore_filter_array_contains(std::string_view field, const gm::wire::GMValue& value);
double firebase_firestore_filter_array_contains_any(std::string_view field, const gm::wire::GMValue& values);
double firebase_firestore_filter_in(std::string_view field, const gm::wire::GMValue& values);
double firebase_firestore_filter_not_in(std::string_view field, const gm::wire::GMValue& values);
double firebase_firestore_filter_equal_to_field_path(std::uint64_t field_path, const gm::wire::GMValue& value);
double firebase_firestore_filter_not_equal_to_field_path(std::uint64_t field_path, const gm::wire::GMValue& value);
double firebase_firestore_filter_less_than_field_path(std::uint64_t field_path, const gm::wire::GMValue& value);
double firebase_firestore_filter_less_than_or_equal_to_field_path(std::uint64_t field_path, const gm::wire::GMValue& value);
double firebase_firestore_filter_greater_than_field_path(std::uint64_t field_path, const gm::wire::GMValue& value);
double firebase_firestore_filter_greater_than_or_equal_to_field_path(std::uint64_t field_path, const gm::wire::GMValue& value);
double firebase_firestore_filter_array_contains_field_path(std::uint64_t field_path, const gm::wire::GMValue& value);
double firebase_firestore_filter_array_contains_any_field_path(std::uint64_t field_path, const gm::wire::GMValue& values);
double firebase_firestore_filter_in_field_path(std::uint64_t field_path, const gm::wire::GMValue& values);
double firebase_firestore_filter_not_in_field_path(std::uint64_t field_path, const gm::wire::GMValue& values);
double firebase_firestore_filter_and(const gm::wire::GMValue& filters);
double firebase_firestore_filter_or(const gm::wire::GMValue& filters);
void firebase_firestore_filter_release(std::uint64_t filter);
std::uint64_t firebase_firestore_query_where_filter(std::uint64_t query, std::uint64_t filter);
std::uint64_t firebase_firestore_query_where_equal_to_field_path(std::uint64_t query, std::uint64_t field_path, const gm::wire::GMValue& value);
std::uint64_t firebase_firestore_query_where_not_equal_to_field_path(std::uint64_t query, std::uint64_t field_path, const gm::wire::GMValue& value);
std::uint64_t firebase_firestore_query_where_less_than_field_path(std::uint64_t query, std::uint64_t field_path, const gm::wire::GMValue& value);
std::uint64_t firebase_firestore_query_where_less_than_or_equal_to_field_path(std::uint64_t query, std::uint64_t field_path, const gm::wire::GMValue& value);
std::uint64_t firebase_firestore_query_where_greater_than_field_path(std::uint64_t query, std::uint64_t field_path, const gm::wire::GMValue& value);
std::uint64_t firebase_firestore_query_where_greater_than_or_equal_to_field_path(std::uint64_t query, std::uint64_t field_path, const gm::wire::GMValue& value);
std::uint64_t firebase_firestore_query_where_array_contains_field_path(std::uint64_t query, std::uint64_t field_path, const gm::wire::GMValue& value);
std::uint64_t firebase_firestore_query_where_array_contains_any_field_path(std::uint64_t query, std::uint64_t field_path, const gm::wire::GMValue& values);
std::uint64_t firebase_firestore_query_where_in_field_path(std::uint64_t query, std::uint64_t field_path, const gm::wire::GMValue& values);
std::uint64_t firebase_firestore_query_where_not_in_field_path(std::uint64_t query, std::uint64_t field_path, const gm::wire::GMValue& values);
std::uint64_t firebase_firestore_query_order_by_field_path(std::uint64_t query, std::uint64_t field_path, double direction);
std::uint64_t firebase_firestore_query_count(std::uint64_t query);
std::uint64_t firebase_firestore_aggregate_query_get_query(std::uint64_t aggregate_query);
bool firebase_firestore_aggregate_query_is_valid(std::uint64_t aggregate_query);
double firebase_firestore_aggregate_query_get(std::uint64_t aggregate_query, double source, const std::optional<gm::wire::GMFunction>& callback);
void firebase_firestore_aggregate_query_release(std::uint64_t aggregate_query);
double firebase_firestore_aggregate_snapshot_count(std::uint64_t snapshot);
std::uint64_t firebase_firestore_aggregate_snapshot_get_query(std::uint64_t snapshot);
bool firebase_firestore_aggregate_snapshot_is_valid(std::uint64_t snapshot);
void firebase_firestore_aggregate_snapshot_release(std::uint64_t snapshot);
std::uint64_t firebase_firestore_add_snapshots_in_sync_listener(std::uint64_t firestore, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_load_bundle(std::uint64_t firestore, gm::wire::GMBuffer bundle, const std::optional<gm::wire::GMFunction>& progress_callback, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_named_query(std::uint64_t firestore, std::string_view name, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_document_ref_set_merge_field_paths(std::uint64_t document, const gm::wire::GMValue& data, const gm::wire::GMValue& field_paths, const std::optional<gm::wire::GMFunction>& callback);
void firebase_firestore_write_batch_set_merge_field_paths(std::uint64_t batch, std::uint64_t document, const gm::wire::GMValue& data, const gm::wire::GMValue& field_paths);
double firebase_firestore_field_value_type(std::uint64_t field_value);
bool firebase_firestore_field_value_is_valid(std::uint64_t field_value);
bool firebase_firestore_field_value_is_null(std::uint64_t field_value);
bool firebase_firestore_field_value_is_boolean(std::uint64_t field_value);
bool firebase_firestore_field_value_is_integer(std::uint64_t field_value);
bool firebase_firestore_field_value_is_double(std::uint64_t field_value);
bool firebase_firestore_field_value_is_timestamp(std::uint64_t field_value);
bool firebase_firestore_field_value_is_string(std::uint64_t field_value);
bool firebase_firestore_field_value_is_blob(std::uint64_t field_value);
bool firebase_firestore_field_value_is_reference(std::uint64_t field_value);
bool firebase_firestore_field_value_is_geo_point(std::uint64_t field_value);
bool firebase_firestore_field_value_is_array(std::uint64_t field_value);
bool firebase_firestore_field_value_is_map(std::uint64_t field_value);
bool firebase_firestore_field_value_boolean_value(std::uint64_t field_value);
double firebase_firestore_field_value_integer_value(std::uint64_t field_value);
double firebase_firestore_field_value_double_value(std::uint64_t field_value);
std::string firebase_firestore_field_value_string_value(std::uint64_t field_value);
double firebase_firestore_field_value_blob_size(std::uint64_t field_value);
double firebase_firestore_field_value_blob_copy(std::uint64_t field_value, gm::wire::GMBuffer out_buffer);
std::uint64_t firebase_firestore_field_value_reference_value(std::uint64_t field_value);
gm::wire::DataStream firebase_firestore_field_value_timestamp_value(std::uint64_t field_value);
gm::wire::DataStream firebase_firestore_field_value_geo_point_value(std::uint64_t field_value);
gm::wire::DataStream firebase_firestore_field_value_array_value(std::uint64_t field_value);
gm::wire::DataStream firebase_firestore_field_value_map_value(std::uint64_t field_value);
std::string firebase_firestore_field_value_to_string(std::uint64_t field_value);
std::uint64_t firebase_firestore_query_get_firestore(std::uint64_t query);
std::uint64_t firebase_firestore_document_ref_get_firestore(std::uint64_t document);
std::string firebase_firestore_document_ref_to_string(std::uint64_t document);
double firebase_firestore_document_ref_update_field_paths(std::uint64_t document, const gm::wire::GMValue& entries, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_write_batch_update_field_paths(std::uint64_t batch, std::uint64_t document, const gm::wire::GMValue& entries);
bool firebase_firestore_write_batch_is_valid(std::uint64_t batch);
std::string firebase_firestore_settings_to_string(std::uint64_t firestore);
bool firebase_firestore_document_snapshot_is_valid(std::uint64_t snapshot);
std::string firebase_firestore_document_snapshot_to_string(std::uint64_t snapshot);
gm::wire::DataStream firebase_firestore_document_snapshot_get_field_path(std::uint64_t snapshot, std::uint64_t field_path, double server_timestamp_behavior);
bool firebase_firestore_query_snapshot_is_valid(std::uint64_t snapshot);
std::uint64_t firebase_firestore_query_snapshot_get_query(std::uint64_t snapshot);
bool firebase_firestore_listener_registration_is_valid(std::uint64_t listener);
std::uint64_t firebase_firestore_get_app(std::uint64_t firestore);
std::uint64_t firebase_firestore_get_instance_for_app(std::uint64_t app);
std::uint64_t firebase_firestore_get_instance_for_app_database(std::uint64_t app, std::string_view database_id);
double firebase_firestore_field_value_boolean(bool value);
double firebase_firestore_field_value_string(std::string_view value);
double firebase_firestore_field_value_array(const gm::wire::GMValue& value);
double firebase_firestore_field_value_map(const gm::wire::GMValue& value);
std::string firebase_firestore_document_snapshot_metadata_to_string(std::uint64_t snapshot);
std::string firebase_firestore_query_snapshot_metadata_to_string(std::uint64_t snapshot);
bool firebase_firestore_document_snapshot_exists(std::uint64_t snapshot);
std::string firebase_firestore_document_snapshot_id(std::uint64_t snapshot);
std::uint64_t firebase_firestore_document_snapshot_reference(std::uint64_t snapshot);
bool firebase_firestore_document_snapshot_metadata_has_pending_writes(std::uint64_t snapshot);
bool firebase_firestore_document_snapshot_metadata_is_from_cache(std::uint64_t snapshot);
double firebase_firestore_query_snapshot_size(std::uint64_t snapshot);
bool firebase_firestore_query_snapshot_empty(std::uint64_t snapshot);
bool firebase_firestore_query_snapshot_metadata_has_pending_writes(std::uint64_t snapshot);
bool firebase_firestore_query_snapshot_metadata_is_from_cache(std::uint64_t snapshot);
