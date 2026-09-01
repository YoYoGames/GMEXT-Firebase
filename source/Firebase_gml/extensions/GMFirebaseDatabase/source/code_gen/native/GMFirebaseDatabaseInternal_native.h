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
    enum class FirebaseLogLevel : std::int64_t
    {
        Verbose = 0,
        Debug = 1,
        Info = 2,
        Warning = 3,
        Error = 4,
        Assert = 5
    };

    enum class FirebaseDatabaseError : std::int64_t
    {
        None = 0,
        Disconnected = 1,
        ExpiredToken = 2,
        InvalidToken = 3,
        MaxRetries = 4,
        NetworkError = 5,
        OperationFailed = 6,
        OverriddenBySet = 7,
        PermissionDenied = 8,
        Unavailable = 9,
        UnknownError = 10,
        WriteCanceled = 11,
        InvalidVariantType = 12,
        ConflictingOperationInProgress = 13,
        TransactionAbortedByUser = 14
    };

}


namespace gm_structs
{
    struct FirebaseDatabaseReferenceInfo;
    struct FirebaseDataSnapshotInfo;

    struct FirebaseDatabaseReferenceInfo
    {
        std::string key;
        bool is_root;
        bool is_valid;
        std::uint64_t reference;
        std::uint64_t parent;
        std::uint64_t root;
        std::uint64_t database;
        std::string url;
    };

    struct FirebaseDataSnapshotInfo
    {
        std::string key;
        bool exists;
        bool is_valid;
        bool has_children;
        double children_count;
        std::uint64_t reference;
    };

}

namespace gm::wire::codec
{
    template<>
    inline void writeValue<gm_structs::FirebaseDatabaseReferenceInfo>(gm::byteio::IByteWriter& _buf, const gm_structs::FirebaseDatabaseReferenceInfo& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.key);
        gm::wire::codec::writeValue(_buf, obj.is_root);
        gm::wire::codec::writeValue(_buf, obj.is_valid);
        gm::wire::codec::writeValue(_buf, obj.reference);
        gm::wire::codec::writeValue(_buf, obj.parent);
        gm::wire::codec::writeValue(_buf, obj.root);
        gm::wire::codec::writeValue(_buf, obj.database);
        gm::wire::codec::writeValue(_buf, obj.url);
    }

    template<>
    inline gm_structs::FirebaseDatabaseReferenceInfo readValue<gm_structs::FirebaseDatabaseReferenceInfo>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::FirebaseDatabaseReferenceInfo obj;
        obj.key = gm::wire::codec::readValue<std::string>(_buf);
        obj.is_root = gm::wire::codec::readValue<bool>(_buf);
        obj.is_valid = gm::wire::codec::readValue<bool>(_buf);
        obj.reference = gm::wire::codec::readValue<std::uint64_t>(_buf);
        obj.parent = gm::wire::codec::readValue<std::uint64_t>(_buf);
        obj.root = gm::wire::codec::readValue<std::uint64_t>(_buf);
        obj.database = gm::wire::codec::readValue<std::uint64_t>(_buf);
        obj.url = gm::wire::codec::readValue<std::string>(_buf);
        return obj;
    }

    template<>
    inline void writeValue<gm_structs::FirebaseDataSnapshotInfo>(gm::byteio::IByteWriter& _buf, const gm_structs::FirebaseDataSnapshotInfo& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.key);
        gm::wire::codec::writeValue(_buf, obj.exists);
        gm::wire::codec::writeValue(_buf, obj.is_valid);
        gm::wire::codec::writeValue(_buf, obj.has_children);
        gm::wire::codec::writeValue(_buf, obj.children_count);
        gm::wire::codec::writeValue(_buf, obj.reference);
    }

    template<>
    inline gm_structs::FirebaseDataSnapshotInfo readValue<gm_structs::FirebaseDataSnapshotInfo>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::FirebaseDataSnapshotInfo obj;
        obj.key = gm::wire::codec::readValue<std::string>(_buf);
        obj.exists = gm::wire::codec::readValue<bool>(_buf);
        obj.is_valid = gm::wire::codec::readValue<bool>(_buf);
        obj.has_children = gm::wire::codec::readValue<bool>(_buf);
        obj.children_count = gm::wire::codec::readValue<double>(_buf);
        obj.reference = gm::wire::codec::readValue<std::uint64_t>(_buf);
        return obj;
    }

}

namespace gm::wire::details
{
    template<>
    struct gm_struct_traits<gm_structs::FirebaseDatabaseReferenceInfo>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 0;
    };

    template<>
    struct gm_struct_traits<gm_structs::FirebaseDataSnapshotInfo>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 1;
    };

}

std::uint64_t firebase_database_get_instance();
std::uint64_t firebase_database_get_instance_for_url(std::string_view url);
std::string firebase_database_get_url(std::uint64_t db_ref);
std::uint64_t firebase_database_get_reference(std::uint64_t db_ref);
std::uint64_t firebase_database_get_reference_at_path(std::uint64_t db_ref, std::string_view path);
std::uint64_t firebase_database_get_reference_from_url(std::uint64_t db_ref, std::string_view url);
double firebase_database_go_offline(std::uint64_t db_ref);
double firebase_database_go_online(std::uint64_t db_ref);
double firebase_database_purge_outstanding_writes(std::uint64_t db_ref);
double firebase_database_set_persistence_enabled(std::uint64_t db_ref, double enabled);
double firebase_database_set_log_level(std::uint64_t db_ref, gm_enums::FirebaseLogLevel log_level);
gm_enums::FirebaseLogLevel firebase_database_get_log_level(std::uint64_t db_ref);
std::uint64_t firebase_database_ref_order_by_child(std::uint64_t ref, std::string_view path);
std::uint64_t firebase_database_ref_order_by_key(std::uint64_t ref);
std::uint64_t firebase_database_ref_order_by_value(std::uint64_t ref);
std::uint64_t firebase_database_ref_order_by_priority(std::uint64_t ref);
std::uint64_t firebase_database_ref_start_at(std::uint64_t ref, const gm::wire::GMValue& order_value);
std::uint64_t firebase_database_ref_start_at_key(std::uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key);
std::uint64_t firebase_database_ref_end_at(std::uint64_t ref, const gm::wire::GMValue& order_value);
std::uint64_t firebase_database_ref_end_at_key(std::uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key);
std::uint64_t firebase_database_ref_equal_to(std::uint64_t ref, const gm::wire::GMValue& order_value);
std::uint64_t firebase_database_ref_equal_to_key(std::uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key);
std::uint64_t firebase_database_ref_limit_to_first(std::uint64_t ref, double limit);
std::uint64_t firebase_database_ref_limit_to_last(std::uint64_t ref, double limit);
double firebase_database_ref_set_keep_synchronized(std::uint64_t ref, double keep_sync);
double firebase_database_ref_get_value(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback);
std::uint64_t firebase_database_ref_add_value_listener(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& on_value_changed, const std::optional<gm::wire::GMFunction>& on_cancelled);
double firebase_database_ref_remove_value_listener(std::uint64_t ref, std::uint64_t listener_ref);
double firebase_database_ref_remove_all_value_listeners(std::uint64_t ref);
std::uint64_t firebase_database_ref_add_child_listener(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& on_child_added, const std::optional<gm::wire::GMFunction>& on_child_changed, const std::optional<gm::wire::GMFunction>& on_child_moved, const std::optional<gm::wire::GMFunction>& on_child_removed, const std::optional<gm::wire::GMFunction>& on_cancelled);
double firebase_database_ref_remove_child_listener(std::uint64_t ref, std::uint64_t listener_ref);
double firebase_database_ref_remove_all_child_listeners(std::uint64_t ref);
std::uint64_t firebase_database_query_order_by_child(std::uint64_t ref, std::string_view path);
std::uint64_t firebase_database_query_order_by_key(std::uint64_t ref);
std::uint64_t firebase_database_query_order_by_value(std::uint64_t ref);
std::uint64_t firebase_database_query_order_by_priority(std::uint64_t ref);
std::uint64_t firebase_database_query_start_at(std::uint64_t ref, const gm::wire::GMValue& order_value);
std::uint64_t firebase_database_query_start_at_key(std::uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key);
std::uint64_t firebase_database_query_end_at(std::uint64_t ref, const gm::wire::GMValue& order_value);
std::uint64_t firebase_database_query_end_at_key(std::uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key);
std::uint64_t firebase_database_query_equal_to(std::uint64_t ref, const gm::wire::GMValue& order_value);
std::uint64_t firebase_database_query_equal_to_key(std::uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key);
std::uint64_t firebase_database_query_limit_to_first(std::uint64_t ref, double limit);
std::uint64_t firebase_database_query_limit_to_last(std::uint64_t ref, double limit);
std::uint64_t firebase_database_query_get_reference(std::uint64_t ref);
double firebase_database_query_set_keep_synchronized(std::uint64_t ref, double keep_sync);
double firebase_database_query_is_valid(std::uint64_t ref);
double firebase_database_query_get_value(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback);
std::uint64_t firebase_database_query_add_value_listener(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& on_value_changed, const std::optional<gm::wire::GMFunction>& on_cancelled);
double firebase_database_query_remove_value_listener(std::uint64_t ref, std::uint64_t listener_ref);
double firebase_database_query_remove_all_value_listeners(std::uint64_t ref);
std::uint64_t firebase_database_query_add_child_listener(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& on_child_added, const std::optional<gm::wire::GMFunction>& on_child_changed, const std::optional<gm::wire::GMFunction>& on_child_moved, const std::optional<gm::wire::GMFunction>& on_child_removed, const std::optional<gm::wire::GMFunction>& on_cancelled);
double firebase_database_query_remove_child_listener(std::uint64_t ref, std::uint64_t listener_ref);
double firebase_database_query_remove_all_child_listeners(std::uint64_t ref);
double firebase_database_query_release(std::uint64_t ref);
gm_structs::FirebaseDatabaseReferenceInfo firebase_database_ref_get(std::uint64_t ref);
std::uint64_t firebase_database_ref_child(std::uint64_t ref, std::string_view path);
std::uint64_t firebase_database_ref_push(std::uint64_t ref);
double firebase_database_ref_go_online(std::uint64_t ref);
double firebase_database_ref_go_offline(std::uint64_t ref);
double firebase_database_ref_set_value(std::uint64_t ref, const gm::wire::GMValue& value, const std::optional<gm::wire::GMFunction>& callback);
double firebase_database_ref_set_priority(std::uint64_t ref, const gm::wire::GMValue& priority, const std::optional<gm::wire::GMFunction>& callback);
double firebase_database_ref_set_value_and_priority(std::uint64_t ref, const gm::wire::GMValue& value, const gm::wire::GMValue& priority, const std::optional<gm::wire::GMFunction>& callback);
double firebase_database_ref_update_children(std::uint64_t ref, const gm::wire::GMValue& values, const std::optional<gm::wire::GMFunction>& callback);
double firebase_database_ref_remove_value(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_database_ref_run_transaction(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_database_ref_release(std::uint64_t ref);
double firebase_database_snapshot_exists(std::uint64_t ref);
double firebase_database_snapshot_is_valid(std::uint64_t ref);
std::uint64_t firebase_database_snapshot_child(std::uint64_t ref, std::string_view path);
double firebase_database_snapshot_has_child(std::uint64_t ref, std::string_view path);
double firebase_database_snapshot_has_children(std::uint64_t ref);
double firebase_database_snapshot_children_count(std::uint64_t ref);
gm::wire::DataStream firebase_database_snapshot_get_children(std::uint64_t ref);
std::string firebase_database_snapshot_key(std::uint64_t ref);
std::uint64_t firebase_database_snapshot_get_reference(std::uint64_t ref);
gm_structs::FirebaseDataSnapshotInfo firebase_database_snapshot_get_info(std::uint64_t snapshot);
gm::wire::DataStream firebase_database_snapshot_get_value(std::uint64_t snapshot);
gm::wire::DataStream firebase_database_snapshot_get_priority(std::uint64_t snapshot);
double firebase_database_snapshot_release(std::uint64_t snapshot);
std::string firebase_database_ref_key(std::uint64_t ref);
double firebase_database_ref_is_root(std::uint64_t ref);
double firebase_database_ref_is_valid(std::uint64_t ref);
std::uint64_t firebase_database_ref_get_parent(std::uint64_t ref);
std::uint64_t firebase_database_ref_get_root(std::uint64_t ref);
std::uint64_t firebase_database_ref_get_database(std::uint64_t ref);
std::string firebase_database_ref_get_url(std::uint64_t ref);
gm::wire::DataStream firebase_database_server_timestamp();
std::uint64_t firebase_database_ref_on_disconnect(std::uint64_t ref);
double firebase_database_on_disconnect_cancel(std::uint64_t handler, const std::optional<gm::wire::GMFunction>& callback);
double firebase_database_on_disconnect_remove_value(std::uint64_t handler, const std::optional<gm::wire::GMFunction>& callback);
double firebase_database_on_disconnect_set_value(std::uint64_t handler, const gm::wire::GMValue& value, const std::optional<gm::wire::GMFunction>& callback);
double firebase_database_on_disconnect_set_value_and_priority(std::uint64_t handler, const gm::wire::GMValue& value, const gm::wire::GMValue& priority, const std::optional<gm::wire::GMFunction>& callback);
double firebase_database_on_disconnect_update_children(std::uint64_t handler, const gm::wire::GMValue& values, const std::optional<gm::wire::GMFunction>& callback);
void firebase_database_on_disconnect_release(std::uint64_t handler);
std::uint64_t firebase_database_get_app(std::uint64_t database);
std::uint64_t firebase_database_get_instance_for_app(std::uint64_t app);
std::uint64_t firebase_database_get_instance_for_app_url(std::uint64_t app, std::string_view url);
