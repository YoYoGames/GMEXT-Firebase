#include "GMFirebase_core_product_api.h"
#include <native/GMFirebaseDatabaseInternal_native.h>
#include <cstring>

GMFirebaseCoreProc gmfirebase_core_resolve_database_proc(const char* symbol)
{
    if (symbol == nullptr) return nullptr;
    if (std::strcmp(symbol, "firebase_database_get_instance") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_get_instance);
    if (std::strcmp(symbol, "firebase_database_get_instance_for_url") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_get_instance_for_url);
    if (std::strcmp(symbol, "firebase_database_get_url") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_get_url);
    if (std::strcmp(symbol, "firebase_database_get_reference") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_get_reference);
    if (std::strcmp(symbol, "firebase_database_get_reference_at_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_get_reference_at_path);
    if (std::strcmp(symbol, "firebase_database_get_reference_from_url") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_get_reference_from_url);
    if (std::strcmp(symbol, "firebase_database_go_offline") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_go_offline);
    if (std::strcmp(symbol, "firebase_database_go_online") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_go_online);
    if (std::strcmp(symbol, "firebase_database_purge_outstanding_writes") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_purge_outstanding_writes);
    if (std::strcmp(symbol, "firebase_database_set_persistence_enabled") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_set_persistence_enabled);
    if (std::strcmp(symbol, "firebase_database_set_log_level") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_set_log_level);
    if (std::strcmp(symbol, "firebase_database_get_log_level") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_get_log_level);
    if (std::strcmp(symbol, "firebase_database_ref_order_by_child") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_order_by_child);
    if (std::strcmp(symbol, "firebase_database_ref_order_by_key") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_order_by_key);
    if (std::strcmp(symbol, "firebase_database_ref_order_by_value") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_order_by_value);
    if (std::strcmp(symbol, "firebase_database_ref_order_by_priority") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_order_by_priority);
    if (std::strcmp(symbol, "firebase_database_ref_start_at") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_start_at);
    if (std::strcmp(symbol, "firebase_database_ref_start_at_key") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_start_at_key);
    if (std::strcmp(symbol, "firebase_database_ref_end_at") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_end_at);
    if (std::strcmp(symbol, "firebase_database_ref_end_at_key") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_end_at_key);
    if (std::strcmp(symbol, "firebase_database_ref_equal_to") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_equal_to);
    if (std::strcmp(symbol, "firebase_database_ref_equal_to_key") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_equal_to_key);
    if (std::strcmp(symbol, "firebase_database_ref_limit_to_first") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_limit_to_first);
    if (std::strcmp(symbol, "firebase_database_ref_limit_to_last") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_limit_to_last);
    if (std::strcmp(symbol, "firebase_database_ref_set_keep_synchronized") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_set_keep_synchronized);
    if (std::strcmp(symbol, "firebase_database_ref_get_value") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_get_value);
    if (std::strcmp(symbol, "firebase_database_ref_add_value_listener") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_add_value_listener);
    if (std::strcmp(symbol, "firebase_database_ref_remove_value_listener") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_remove_value_listener);
    if (std::strcmp(symbol, "firebase_database_ref_remove_all_value_listeners") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_remove_all_value_listeners);
    if (std::strcmp(symbol, "firebase_database_ref_add_child_listener") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_add_child_listener);
    if (std::strcmp(symbol, "firebase_database_ref_remove_child_listener") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_remove_child_listener);
    if (std::strcmp(symbol, "firebase_database_ref_remove_all_child_listeners") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_remove_all_child_listeners);
    if (std::strcmp(symbol, "firebase_database_query_order_by_child") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_order_by_child);
    if (std::strcmp(symbol, "firebase_database_query_order_by_key") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_order_by_key);
    if (std::strcmp(symbol, "firebase_database_query_order_by_value") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_order_by_value);
    if (std::strcmp(symbol, "firebase_database_query_order_by_priority") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_order_by_priority);
    if (std::strcmp(symbol, "firebase_database_query_start_at") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_start_at);
    if (std::strcmp(symbol, "firebase_database_query_start_at_key") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_start_at_key);
    if (std::strcmp(symbol, "firebase_database_query_end_at") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_end_at);
    if (std::strcmp(symbol, "firebase_database_query_end_at_key") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_end_at_key);
    if (std::strcmp(symbol, "firebase_database_query_equal_to") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_equal_to);
    if (std::strcmp(symbol, "firebase_database_query_equal_to_key") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_equal_to_key);
    if (std::strcmp(symbol, "firebase_database_query_limit_to_first") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_limit_to_first);
    if (std::strcmp(symbol, "firebase_database_query_limit_to_last") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_limit_to_last);
    if (std::strcmp(symbol, "firebase_database_query_get_reference") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_get_reference);
    if (std::strcmp(symbol, "firebase_database_query_set_keep_synchronized") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_set_keep_synchronized);
    if (std::strcmp(symbol, "firebase_database_query_is_valid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_is_valid);
    if (std::strcmp(symbol, "firebase_database_query_get_value") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_get_value);
    if (std::strcmp(symbol, "firebase_database_query_add_value_listener") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_add_value_listener);
    if (std::strcmp(symbol, "firebase_database_query_remove_value_listener") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_remove_value_listener);
    if (std::strcmp(symbol, "firebase_database_query_remove_all_value_listeners") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_remove_all_value_listeners);
    if (std::strcmp(symbol, "firebase_database_query_add_child_listener") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_add_child_listener);
    if (std::strcmp(symbol, "firebase_database_query_remove_child_listener") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_remove_child_listener);
    if (std::strcmp(symbol, "firebase_database_query_remove_all_child_listeners") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_remove_all_child_listeners);
    if (std::strcmp(symbol, "firebase_database_query_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_query_release);
    if (std::strcmp(symbol, "firebase_database_ref_get") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_get);
    if (std::strcmp(symbol, "firebase_database_ref_child") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_child);
    if (std::strcmp(symbol, "firebase_database_ref_push") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_push);
    if (std::strcmp(symbol, "firebase_database_ref_go_online") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_go_online);
    if (std::strcmp(symbol, "firebase_database_ref_go_offline") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_go_offline);
    if (std::strcmp(symbol, "firebase_database_ref_set_value") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_set_value);
    if (std::strcmp(symbol, "firebase_database_ref_set_priority") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_set_priority);
    if (std::strcmp(symbol, "firebase_database_ref_set_value_and_priority") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_set_value_and_priority);
    if (std::strcmp(symbol, "firebase_database_ref_update_children") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_update_children);
    if (std::strcmp(symbol, "firebase_database_ref_remove_value") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_remove_value);
    if (std::strcmp(symbol, "firebase_database_ref_run_transaction") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_run_transaction);
    if (std::strcmp(symbol, "firebase_database_ref_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_release);
    if (std::strcmp(symbol, "firebase_database_snapshot_exists") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_snapshot_exists);
    if (std::strcmp(symbol, "firebase_database_snapshot_is_valid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_snapshot_is_valid);
    if (std::strcmp(symbol, "firebase_database_snapshot_child") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_snapshot_child);
    if (std::strcmp(symbol, "firebase_database_snapshot_has_child") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_snapshot_has_child);
    if (std::strcmp(symbol, "firebase_database_snapshot_has_children") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_snapshot_has_children);
    if (std::strcmp(symbol, "firebase_database_snapshot_children_count") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_snapshot_children_count);
    if (std::strcmp(symbol, "firebase_database_snapshot_get_children") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_snapshot_get_children);
    if (std::strcmp(symbol, "firebase_database_snapshot_key") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_snapshot_key);
    if (std::strcmp(symbol, "firebase_database_snapshot_get_reference") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_snapshot_get_reference);
    if (std::strcmp(symbol, "firebase_database_snapshot_get_info") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_snapshot_get_info);
    if (std::strcmp(symbol, "firebase_database_snapshot_get_value") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_snapshot_get_value);
    if (std::strcmp(symbol, "firebase_database_snapshot_get_priority") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_snapshot_get_priority);
    if (std::strcmp(symbol, "firebase_database_snapshot_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_snapshot_release);
    if (std::strcmp(symbol, "firebase_database_ref_key") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_key);
    if (std::strcmp(symbol, "firebase_database_ref_is_root") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_is_root);
    if (std::strcmp(symbol, "firebase_database_ref_is_valid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_is_valid);
    if (std::strcmp(symbol, "firebase_database_ref_get_parent") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_get_parent);
    if (std::strcmp(symbol, "firebase_database_ref_get_root") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_get_root);
    if (std::strcmp(symbol, "firebase_database_ref_get_database") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_get_database);
    if (std::strcmp(symbol, "firebase_database_ref_get_url") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_get_url);
    if (std::strcmp(symbol, "firebase_database_server_timestamp") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_server_timestamp);
    if (std::strcmp(symbol, "firebase_database_ref_on_disconnect") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_ref_on_disconnect);
    if (std::strcmp(symbol, "firebase_database_on_disconnect_cancel") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_on_disconnect_cancel);
    if (std::strcmp(symbol, "firebase_database_on_disconnect_remove_value") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_on_disconnect_remove_value);
    if (std::strcmp(symbol, "firebase_database_on_disconnect_set_value") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_on_disconnect_set_value);
    if (std::strcmp(symbol, "firebase_database_on_disconnect_set_value_and_priority") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_on_disconnect_set_value_and_priority);
    if (std::strcmp(symbol, "firebase_database_on_disconnect_update_children") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_on_disconnect_update_children);
    if (std::strcmp(symbol, "firebase_database_on_disconnect_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_on_disconnect_release);
    if (std::strcmp(symbol, "firebase_database_get_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_get_app);
    if (std::strcmp(symbol, "firebase_database_get_instance_for_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_get_instance_for_app);
    if (std::strcmp(symbol, "firebase_database_get_instance_for_app_url") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_database_get_instance_for_app_url);
    return nullptr;
}
