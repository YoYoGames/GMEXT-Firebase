#include "GMFirebase_core_product_api.h"
#include "GMFirebase_core_firestore_impl.h"
#include <cstring>

// Resolves every "firebase_firestore_*" symbol GMFirebaseFirestore's thin
// forwarder may ask for, by exact name, to the corresponding gmfb_firestore::
// implementation living in GMFirebaseCore. Wired into
// gmfirebase_core_resolve_product_proc() centrally (see
// GMFirebase_core_product_api.cpp) for product == "firestore".
//
// Every exported symbol name below is "firebase_firestore_" + the
// gmfb_firestore:: function name, verified one-for-one against
// GMFirebaseFirestore's GMFirebase_firestore.cpp / GMFirebase_firestore_snapshot.cpp
// forwarders - no irregular names were found in this product.
GMFirebaseCoreProc gmfirebase_core_resolve_firestore_proc(const char* symbol)
{
    if (symbol == nullptr) return nullptr;

    // Instance / settings
    if (std::strcmp(symbol, "firebase_firestore_get_instance") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::get_instance);
    if (std::strcmp(symbol, "firebase_firestore_get_instance_for_database") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::get_instance_for_database);
    if (std::strcmp(symbol, "firebase_firestore_settings_get_host") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::settings_get_host);
    if (std::strcmp(symbol, "firebase_firestore_settings_set_host") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::settings_set_host);
    if (std::strcmp(symbol, "firebase_firestore_settings_get_ssl_enabled") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::settings_get_ssl_enabled);
    if (std::strcmp(symbol, "firebase_firestore_settings_set_ssl_enabled") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::settings_set_ssl_enabled);
    if (std::strcmp(symbol, "firebase_firestore_settings_get_persistence_enabled") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::settings_get_persistence_enabled);
    if (std::strcmp(symbol, "firebase_firestore_settings_set_persistence_enabled") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::settings_set_persistence_enabled);
    if (std::strcmp(symbol, "firebase_firestore_settings_get_cache_size_bytes") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::settings_get_cache_size_bytes);
    if (std::strcmp(symbol, "firebase_firestore_settings_set_cache_size_bytes") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::settings_set_cache_size_bytes);
    if (std::strcmp(symbol, "firebase_firestore_collection") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::collection);
    if (std::strcmp(symbol, "firebase_firestore_document") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document);
    if (std::strcmp(symbol, "firebase_firestore_collection_group") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::collection_group);
    if (std::strcmp(symbol, "firebase_firestore_batch") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::batch);
    if (std::strcmp(symbol, "firebase_firestore_set_log_level") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::set_log_level);

    // Async lifecycle ops
    if (std::strcmp(symbol, "firebase_firestore_enable_network") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::enable_network);
    if (std::strcmp(symbol, "firebase_firestore_disable_network") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::disable_network);
    if (std::strcmp(symbol, "firebase_firestore_terminate") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::terminate);
    if (std::strcmp(symbol, "firebase_firestore_clear_persistence") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::clear_persistence);
    if (std::strcmp(symbol, "firebase_firestore_wait_for_pending_writes") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::wait_for_pending_writes);
    if (std::strcmp(symbol, "firebase_firestore_run_transaction") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::run_transaction);

    // CollectionReference
    if (std::strcmp(symbol, "firebase_firestore_collection_ref_id") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::collection_ref_id);
    if (std::strcmp(symbol, "firebase_firestore_collection_ref_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::collection_ref_path);
    if (std::strcmp(symbol, "firebase_firestore_collection_ref_parent") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::collection_ref_parent);
    if (std::strcmp(symbol, "firebase_firestore_collection_ref_document") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::collection_ref_document);
    if (std::strcmp(symbol, "firebase_firestore_collection_ref_document_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::collection_ref_document_path);
    if (std::strcmp(symbol, "firebase_firestore_collection_ref_add") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::collection_ref_add);
    if (std::strcmp(symbol, "firebase_firestore_collection_ref_is_valid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::collection_ref_is_valid);
    if (std::strcmp(symbol, "firebase_firestore_collection_ref_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::collection_ref_release);

    // DocumentReference
    if (std::strcmp(symbol, "firebase_firestore_document_ref_id") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_ref_id);
    if (std::strcmp(symbol, "firebase_firestore_document_ref_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_ref_path);
    if (std::strcmp(symbol, "firebase_firestore_document_ref_parent") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_ref_parent);
    if (std::strcmp(symbol, "firebase_firestore_document_ref_collection") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_ref_collection);
    if (std::strcmp(symbol, "firebase_firestore_document_ref_get") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_ref_get);
    if (std::strcmp(symbol, "firebase_firestore_document_ref_set") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_ref_set);
    if (std::strcmp(symbol, "firebase_firestore_document_ref_set_merge") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_ref_set_merge);
    if (std::strcmp(symbol, "firebase_firestore_document_ref_set_merge_fields") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_ref_set_merge_fields);
    if (std::strcmp(symbol, "firebase_firestore_document_ref_update") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_ref_update);
    if (std::strcmp(symbol, "firebase_firestore_document_ref_delete") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_ref_delete);
    if (std::strcmp(symbol, "firebase_firestore_document_ref_add_snapshot_listener") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_ref_add_snapshot_listener);
    if (std::strcmp(symbol, "firebase_firestore_document_ref_is_valid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_ref_is_valid);
    if (std::strcmp(symbol, "firebase_firestore_document_ref_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_ref_release);

    // Query (also serves CollectionReference refs)
    if (std::strcmp(symbol, "firebase_firestore_query_where_equal_to") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_where_equal_to);
    if (std::strcmp(symbol, "firebase_firestore_query_where_not_equal_to") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_where_not_equal_to);
    if (std::strcmp(symbol, "firebase_firestore_query_where_less_than") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_where_less_than);
    if (std::strcmp(symbol, "firebase_firestore_query_where_less_than_or_equal_to") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_where_less_than_or_equal_to);
    if (std::strcmp(symbol, "firebase_firestore_query_where_greater_than") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_where_greater_than);
    if (std::strcmp(symbol, "firebase_firestore_query_where_greater_than_or_equal_to") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_where_greater_than_or_equal_to);
    if (std::strcmp(symbol, "firebase_firestore_query_where_array_contains") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_where_array_contains);
    if (std::strcmp(symbol, "firebase_firestore_query_where_array_contains_any") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_where_array_contains_any);
    if (std::strcmp(symbol, "firebase_firestore_query_where_in") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_where_in);
    if (std::strcmp(symbol, "firebase_firestore_query_where_not_in") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_where_not_in);
    if (std::strcmp(symbol, "firebase_firestore_query_order_by") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_order_by);
    if (std::strcmp(symbol, "firebase_firestore_query_limit") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_limit);
    if (std::strcmp(symbol, "firebase_firestore_query_limit_to_last") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_limit_to_last);
    if (std::strcmp(symbol, "firebase_firestore_query_start_at_snapshot") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_start_at_snapshot);
    if (std::strcmp(symbol, "firebase_firestore_query_start_at_values") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_start_at_values);
    if (std::strcmp(symbol, "firebase_firestore_query_start_after_snapshot") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_start_after_snapshot);
    if (std::strcmp(symbol, "firebase_firestore_query_start_after_values") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_start_after_values);
    if (std::strcmp(symbol, "firebase_firestore_query_end_before_snapshot") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_end_before_snapshot);
    if (std::strcmp(symbol, "firebase_firestore_query_end_before_values") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_end_before_values);
    if (std::strcmp(symbol, "firebase_firestore_query_end_at_snapshot") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_end_at_snapshot);
    if (std::strcmp(symbol, "firebase_firestore_query_end_at_values") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_end_at_values);
    if (std::strcmp(symbol, "firebase_firestore_query_get") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_get);
    if (std::strcmp(symbol, "firebase_firestore_query_add_snapshot_listener") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_add_snapshot_listener);
    if (std::strcmp(symbol, "firebase_firestore_query_is_valid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_is_valid);
    if (std::strcmp(symbol, "firebase_firestore_query_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_release);

    // WriteBatch
    if (std::strcmp(symbol, "firebase_firestore_write_batch_set") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::write_batch_set);
    if (std::strcmp(symbol, "firebase_firestore_write_batch_set_merge") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::write_batch_set_merge);
    if (std::strcmp(symbol, "firebase_firestore_write_batch_set_merge_fields") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::write_batch_set_merge_fields);
    if (std::strcmp(symbol, "firebase_firestore_write_batch_update") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::write_batch_update);
    if (std::strcmp(symbol, "firebase_firestore_write_batch_delete") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::write_batch_delete);
    if (std::strcmp(symbol, "firebase_firestore_write_batch_commit") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::write_batch_commit);
    if (std::strcmp(symbol, "firebase_firestore_write_batch_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::write_batch_release);

    // FieldValue constructors
    if (std::strcmp(symbol, "firebase_firestore_field_value_delete") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_delete);
    if (std::strcmp(symbol, "firebase_firestore_field_value_server_timestamp") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_server_timestamp);
    if (std::strcmp(symbol, "firebase_firestore_field_value_array_union") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_array_union);
    if (std::strcmp(symbol, "firebase_firestore_field_value_array_remove") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_array_remove);
    if (std::strcmp(symbol, "firebase_firestore_field_value_increment_integer") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_increment_integer);
    if (std::strcmp(symbol, "firebase_firestore_field_value_increment_double") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_increment_double);
    if (std::strcmp(symbol, "firebase_firestore_field_value_integer") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_integer);
    if (std::strcmp(symbol, "firebase_firestore_field_value_double") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_double);
    if (std::strcmp(symbol, "firebase_firestore_field_value_timestamp") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_timestamp);
    if (std::strcmp(symbol, "firebase_firestore_field_value_geo_point") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_geo_point);
    if (std::strcmp(symbol, "firebase_firestore_field_value_reference") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_reference);
    if (std::strcmp(symbol, "firebase_firestore_field_value_blob") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_blob);
    if (std::strcmp(symbol, "firebase_firestore_field_value_null") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_null);
    if (std::strcmp(symbol, "firebase_firestore_field_value_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_release);

    // DocumentSnapshot
    if (std::strcmp(symbol, "firebase_firestore_document_snapshot_get_info") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_snapshot_get_info);
    if (std::strcmp(symbol, "firebase_firestore_document_snapshot_get") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_snapshot_get);
    if (std::strcmp(symbol, "firebase_firestore_document_snapshot_get_data") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_snapshot_get_data);
    if (std::strcmp(symbol, "firebase_firestore_document_snapshot_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_snapshot_release);

    // QuerySnapshot
    if (std::strcmp(symbol, "firebase_firestore_query_snapshot_get_info") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_snapshot_get_info);
    if (std::strcmp(symbol, "firebase_firestore_query_snapshot_documents") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_snapshot_documents);
    if (std::strcmp(symbol, "firebase_firestore_query_snapshot_document_changes") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_snapshot_document_changes);
    if (std::strcmp(symbol, "firebase_firestore_query_snapshot_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_snapshot_release);

    // ListenerRegistration
    if (std::strcmp(symbol, "firebase_firestore_listener_registration_remove") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::listener_registration_remove);

    // FieldPath
    if (std::strcmp(symbol, "firebase_firestore_field_path_create") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_path_create);
    if (std::strcmp(symbol, "firebase_firestore_field_path_document_id") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_path_document_id);
    if (std::strcmp(symbol, "firebase_firestore_field_path_is_valid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_path_is_valid);
    if (std::strcmp(symbol, "firebase_firestore_field_path_to_string") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_path_to_string);
    if (std::strcmp(symbol, "firebase_firestore_field_path_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_path_release);

    // Filter
    if (std::strcmp(symbol, "firebase_firestore_filter_equal_to") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_equal_to);
    if (std::strcmp(symbol, "firebase_firestore_filter_not_equal_to") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_not_equal_to);
    if (std::strcmp(symbol, "firebase_firestore_filter_less_than") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_less_than);
    if (std::strcmp(symbol, "firebase_firestore_filter_less_than_or_equal_to") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_less_than_or_equal_to);
    if (std::strcmp(symbol, "firebase_firestore_filter_greater_than") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_greater_than);
    if (std::strcmp(symbol, "firebase_firestore_filter_greater_than_or_equal_to") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_greater_than_or_equal_to);
    if (std::strcmp(symbol, "firebase_firestore_filter_array_contains") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_array_contains);
    if (std::strcmp(symbol, "firebase_firestore_filter_array_contains_any") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_array_contains_any);
    if (std::strcmp(symbol, "firebase_firestore_filter_in") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_in);
    if (std::strcmp(symbol, "firebase_firestore_filter_not_in") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_not_in);
    if (std::strcmp(symbol, "firebase_firestore_filter_equal_to_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_equal_to_field_path);
    if (std::strcmp(symbol, "firebase_firestore_filter_not_equal_to_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_not_equal_to_field_path);
    if (std::strcmp(symbol, "firebase_firestore_filter_less_than_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_less_than_field_path);
    if (std::strcmp(symbol, "firebase_firestore_filter_less_than_or_equal_to_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_less_than_or_equal_to_field_path);
    if (std::strcmp(symbol, "firebase_firestore_filter_greater_than_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_greater_than_field_path);
    if (std::strcmp(symbol, "firebase_firestore_filter_greater_than_or_equal_to_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_greater_than_or_equal_to_field_path);
    if (std::strcmp(symbol, "firebase_firestore_filter_array_contains_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_array_contains_field_path);
    if (std::strcmp(symbol, "firebase_firestore_filter_array_contains_any_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_array_contains_any_field_path);
    if (std::strcmp(symbol, "firebase_firestore_filter_in_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_in_field_path);
    if (std::strcmp(symbol, "firebase_firestore_filter_not_in_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_not_in_field_path);
    if (std::strcmp(symbol, "firebase_firestore_filter_and") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_and);
    if (std::strcmp(symbol, "firebase_firestore_filter_or") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_or);
    if (std::strcmp(symbol, "firebase_firestore_filter_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::filter_release);
    if (std::strcmp(symbol, "firebase_firestore_query_where_filter") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_where_filter);
    if (std::strcmp(symbol, "firebase_firestore_query_where_equal_to_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_where_equal_to_field_path);
    if (std::strcmp(symbol, "firebase_firestore_query_where_not_equal_to_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_where_not_equal_to_field_path);
    if (std::strcmp(symbol, "firebase_firestore_query_where_less_than_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_where_less_than_field_path);
    if (std::strcmp(symbol, "firebase_firestore_query_where_less_than_or_equal_to_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_where_less_than_or_equal_to_field_path);
    if (std::strcmp(symbol, "firebase_firestore_query_where_greater_than_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_where_greater_than_field_path);
    if (std::strcmp(symbol, "firebase_firestore_query_where_greater_than_or_equal_to_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_where_greater_than_or_equal_to_field_path);
    if (std::strcmp(symbol, "firebase_firestore_query_where_array_contains_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_where_array_contains_field_path);
    if (std::strcmp(symbol, "firebase_firestore_query_where_array_contains_any_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_where_array_contains_any_field_path);
    if (std::strcmp(symbol, "firebase_firestore_query_where_in_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_where_in_field_path);
    if (std::strcmp(symbol, "firebase_firestore_query_where_not_in_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_where_not_in_field_path);
    if (std::strcmp(symbol, "firebase_firestore_query_order_by_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_order_by_field_path);

    // AggregateQuery / AggregateQuerySnapshot
    if (std::strcmp(symbol, "firebase_firestore_query_count") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_count);
    if (std::strcmp(symbol, "firebase_firestore_aggregate_query_get_query") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::aggregate_query_get_query);
    if (std::strcmp(symbol, "firebase_firestore_aggregate_query_is_valid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::aggregate_query_is_valid);
    if (std::strcmp(symbol, "firebase_firestore_aggregate_query_get") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::aggregate_query_get);
    if (std::strcmp(symbol, "firebase_firestore_aggregate_query_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::aggregate_query_release);
    if (std::strcmp(symbol, "firebase_firestore_aggregate_snapshot_count") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::aggregate_snapshot_count);
    if (std::strcmp(symbol, "firebase_firestore_aggregate_snapshot_get_query") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::aggregate_snapshot_get_query);
    if (std::strcmp(symbol, "firebase_firestore_aggregate_snapshot_is_valid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::aggregate_snapshot_is_valid);
    if (std::strcmp(symbol, "firebase_firestore_aggregate_snapshot_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::aggregate_snapshot_release);

    // Misc: snapshots-in-sync, bundles, named queries
    if (std::strcmp(symbol, "firebase_firestore_add_snapshots_in_sync_listener") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::add_snapshots_in_sync_listener);
    if (std::strcmp(symbol, "firebase_firestore_load_bundle") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::load_bundle);
    if (std::strcmp(symbol, "firebase_firestore_named_query") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::named_query);
    if (std::strcmp(symbol, "firebase_firestore_document_ref_set_merge_field_paths") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_ref_set_merge_field_paths);
    if (std::strcmp(symbol, "firebase_firestore_write_batch_set_merge_field_paths") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::write_batch_set_merge_field_paths);

    // FieldValue accessors
    if (std::strcmp(symbol, "firebase_firestore_field_value_type") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_type);
    if (std::strcmp(symbol, "firebase_firestore_field_value_is_valid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_is_valid);
    if (std::strcmp(symbol, "firebase_firestore_field_value_is_null") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_is_null);
    if (std::strcmp(symbol, "firebase_firestore_field_value_is_boolean") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_is_boolean);
    if (std::strcmp(symbol, "firebase_firestore_field_value_is_integer") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_is_integer);
    if (std::strcmp(symbol, "firebase_firestore_field_value_is_double") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_is_double);
    if (std::strcmp(symbol, "firebase_firestore_field_value_is_timestamp") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_is_timestamp);
    if (std::strcmp(symbol, "firebase_firestore_field_value_is_string") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_is_string);
    if (std::strcmp(symbol, "firebase_firestore_field_value_is_blob") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_is_blob);
    if (std::strcmp(symbol, "firebase_firestore_field_value_is_reference") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_is_reference);
    if (std::strcmp(symbol, "firebase_firestore_field_value_is_geo_point") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_is_geo_point);
    if (std::strcmp(symbol, "firebase_firestore_field_value_is_array") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_is_array);
    if (std::strcmp(symbol, "firebase_firestore_field_value_is_map") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_is_map);
    if (std::strcmp(symbol, "firebase_firestore_field_value_boolean_value") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_boolean_value);
    if (std::strcmp(symbol, "firebase_firestore_field_value_integer_value") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_integer_value);
    if (std::strcmp(symbol, "firebase_firestore_field_value_double_value") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_double_value);
    if (std::strcmp(symbol, "firebase_firestore_field_value_string_value") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_string_value);
    if (std::strcmp(symbol, "firebase_firestore_field_value_blob_size") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_blob_size);
    if (std::strcmp(symbol, "firebase_firestore_field_value_blob_copy") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_blob_copy);
    if (std::strcmp(symbol, "firebase_firestore_field_value_reference_value") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_reference_value);
    if (std::strcmp(symbol, "firebase_firestore_field_value_timestamp_value") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_timestamp_value);
    if (std::strcmp(symbol, "firebase_firestore_field_value_geo_point_value") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_geo_point_value);
    if (std::strcmp(symbol, "firebase_firestore_field_value_array_value") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_array_value);
    if (std::strcmp(symbol, "firebase_firestore_field_value_map_value") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_map_value);
    if (std::strcmp(symbol, "firebase_firestore_field_value_to_string") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_to_string);

    // Multi-instance / misc accessors
    if (std::strcmp(symbol, "firebase_firestore_query_get_firestore") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_get_firestore);
    if (std::strcmp(symbol, "firebase_firestore_document_ref_get_firestore") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_ref_get_firestore);
    if (std::strcmp(symbol, "firebase_firestore_document_ref_to_string") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_ref_to_string);
    if (std::strcmp(symbol, "firebase_firestore_document_ref_update_field_paths") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_ref_update_field_paths);
    if (std::strcmp(symbol, "firebase_firestore_write_batch_update_field_paths") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::write_batch_update_field_paths);
    if (std::strcmp(symbol, "firebase_firestore_write_batch_is_valid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::write_batch_is_valid);
    if (std::strcmp(symbol, "firebase_firestore_settings_to_string") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::settings_to_string);
    if (std::strcmp(symbol, "firebase_firestore_document_snapshot_is_valid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_snapshot_is_valid);
    if (std::strcmp(symbol, "firebase_firestore_document_snapshot_to_string") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_snapshot_to_string);
    if (std::strcmp(symbol, "firebase_firestore_document_snapshot_get_field_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_snapshot_get_field_path);
    if (std::strcmp(symbol, "firebase_firestore_query_snapshot_is_valid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_snapshot_is_valid);
    if (std::strcmp(symbol, "firebase_firestore_query_snapshot_get_query") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_snapshot_get_query);
    if (std::strcmp(symbol, "firebase_firestore_listener_registration_is_valid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::listener_registration_is_valid);
    if (std::strcmp(symbol, "firebase_firestore_get_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::get_app);
    if (std::strcmp(symbol, "firebase_firestore_get_instance_for_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::get_instance_for_app);
    if (std::strcmp(symbol, "firebase_firestore_get_instance_for_app_database") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::get_instance_for_app_database);
    if (std::strcmp(symbol, "firebase_firestore_field_value_boolean") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_boolean);
    if (std::strcmp(symbol, "firebase_firestore_field_value_string") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_string);
    if (std::strcmp(symbol, "firebase_firestore_field_value_array") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_array);
    if (std::strcmp(symbol, "firebase_firestore_field_value_map") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::field_value_map);
    if (std::strcmp(symbol, "firebase_firestore_document_snapshot_metadata_to_string") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_snapshot_metadata_to_string);
    if (std::strcmp(symbol, "firebase_firestore_query_snapshot_metadata_to_string") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_snapshot_metadata_to_string);
    if (std::strcmp(symbol, "firebase_firestore_document_snapshot_exists") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_snapshot_exists);
    if (std::strcmp(symbol, "firebase_firestore_document_snapshot_id") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_snapshot_id);
    if (std::strcmp(symbol, "firebase_firestore_document_snapshot_reference") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_snapshot_reference);
    if (std::strcmp(symbol, "firebase_firestore_document_snapshot_metadata_has_pending_writes") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_snapshot_metadata_has_pending_writes);
    if (std::strcmp(symbol, "firebase_firestore_document_snapshot_metadata_is_from_cache") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::document_snapshot_metadata_is_from_cache);
    if (std::strcmp(symbol, "firebase_firestore_query_snapshot_size") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_snapshot_size);
    if (std::strcmp(symbol, "firebase_firestore_query_snapshot_empty") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_snapshot_empty);
    if (std::strcmp(symbol, "firebase_firestore_query_snapshot_metadata_has_pending_writes") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_snapshot_metadata_has_pending_writes);
    if (std::strcmp(symbol, "firebase_firestore_query_snapshot_metadata_is_from_cache") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_firestore::query_snapshot_metadata_is_from_cache);

    return nullptr;
}
