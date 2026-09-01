#include "GMFirebase_core_firestore_client.h"

#include <mutex>

#if defined(_WIN32)
    #define WIN32_LEAN_AND_MEAN
    #define NOMINMAX
    #include <windows.h>
#elif defined(__APPLE__)
    #include <TargetConditionals.h>
    #if !TARGET_OS_IPHONE && !TARGET_OS_TV
        #include <dlfcn.h>
    #endif
#else
    #include <dlfcn.h>
#endif

namespace
{
    using GetFirestoreApiFn = const GMFirebaseCoreFirestoreAPI* (*)();

    std::mutex g_core_firestore_api_mutex;
    const GMFirebaseCoreFirestoreAPI* g_core_firestore_api = nullptr;

    const GMFirebaseCoreFirestoreAPI* validate(const GMFirebaseCoreFirestoreAPI* api)
    {
        if (api == nullptr)
            return nullptr;
        if (api->abi_version != GMFIREBASE_CORE_FIRESTORE_ABI_VERSION)
            return nullptr;
        if (api->struct_size < sizeof(GMFirebaseCoreFirestoreAPI))
            return nullptr;

        if (api->get_instance == nullptr || api->get_instance_for_database == nullptr ||
            api->settings_get_host == nullptr || api->settings_set_host == nullptr ||
            api->settings_get_ssl_enabled == nullptr || api->settings_set_ssl_enabled == nullptr ||
            api->settings_get_persistence_enabled == nullptr || api->settings_set_persistence_enabled == nullptr ||
            api->settings_get_cache_size_bytes == nullptr || api->settings_set_cache_size_bytes == nullptr ||
            api->collection == nullptr || api->document == nullptr || api->collection_group == nullptr ||
            api->batch == nullptr || api->set_log_level == nullptr || api->enable_network == nullptr ||
            api->disable_network == nullptr || api->terminate == nullptr || api->clear_persistence == nullptr ||
            api->wait_for_pending_writes == nullptr || api->run_transaction == nullptr ||
            api->collection_ref_id == nullptr || api->collection_ref_path == nullptr ||
            api->collection_ref_parent == nullptr || api->collection_ref_document == nullptr ||
            api->collection_ref_document_path == nullptr || api->collection_ref_add == nullptr ||
            api->collection_ref_is_valid == nullptr || api->collection_ref_release == nullptr ||
            api->document_ref_id == nullptr || api->document_ref_path == nullptr ||
            api->document_ref_parent == nullptr || api->document_ref_collection == nullptr ||
            api->document_ref_get == nullptr || api->document_ref_set == nullptr ||
            api->document_ref_set_merge == nullptr || api->document_ref_set_merge_fields == nullptr ||
            api->document_ref_update == nullptr || api->document_ref_delete == nullptr ||
            api->document_ref_add_snapshot_listener == nullptr || api->document_ref_is_valid == nullptr ||
            api->document_ref_release == nullptr || api->query_where_equal_to == nullptr ||
            api->query_where_not_equal_to == nullptr || api->query_where_less_than == nullptr ||
            api->query_where_less_than_or_equal_to == nullptr || api->query_where_greater_than == nullptr ||
            api->query_where_greater_than_or_equal_to == nullptr || api->query_where_array_contains == nullptr ||
            api->query_where_array_contains_any == nullptr || api->query_where_in == nullptr ||
            api->query_where_not_in == nullptr || api->query_order_by == nullptr || api->query_limit == nullptr ||
            api->query_limit_to_last == nullptr || api->query_start_at_snapshot == nullptr ||
            api->query_start_at_values == nullptr || api->query_start_after_snapshot == nullptr ||
            api->query_start_after_values == nullptr || api->query_end_before_snapshot == nullptr ||
            api->query_end_before_values == nullptr || api->query_end_at_snapshot == nullptr ||
            api->query_end_at_values == nullptr || api->query_get == nullptr ||
            api->query_add_snapshot_listener == nullptr || api->query_is_valid == nullptr ||
            api->query_release == nullptr || api->write_batch_set == nullptr ||
            api->write_batch_set_merge == nullptr || api->write_batch_set_merge_fields == nullptr ||
            api->write_batch_update == nullptr || api->write_batch_delete == nullptr ||
            api->write_batch_commit == nullptr || api->write_batch_release == nullptr ||
            api->field_value_delete == nullptr || api->field_value_server_timestamp == nullptr ||
            api->field_value_array_union == nullptr || api->field_value_array_remove == nullptr ||
            api->field_value_increment_integer == nullptr || api->field_value_increment_double == nullptr ||
            api->field_value_integer == nullptr || api->field_value_double == nullptr ||
            api->field_value_timestamp == nullptr || api->field_value_geo_point == nullptr ||
            api->field_value_reference == nullptr || api->field_value_blob == nullptr ||
            api->field_value_null == nullptr || api->field_value_release == nullptr ||
            api->document_snapshot_get_info == nullptr || api->document_snapshot_get == nullptr ||
            api->document_snapshot_get_data == nullptr || api->document_snapshot_release == nullptr ||
            api->query_snapshot_get_info == nullptr || api->query_snapshot_documents == nullptr ||
            api->query_snapshot_document_changes == nullptr || api->query_snapshot_release == nullptr ||
            api->listener_registration_remove == nullptr || api->field_path_create == nullptr ||
            api->field_path_document_id == nullptr || api->field_path_is_valid == nullptr ||
            api->field_path_to_string == nullptr || api->field_path_release == nullptr ||
            api->filter_equal_to == nullptr || api->filter_not_equal_to == nullptr ||
            api->filter_less_than == nullptr || api->filter_less_than_or_equal_to == nullptr ||
            api->filter_greater_than == nullptr || api->filter_greater_than_or_equal_to == nullptr ||
            api->filter_array_contains == nullptr || api->filter_array_contains_any == nullptr ||
            api->filter_in == nullptr || api->filter_not_in == nullptr ||
            api->filter_equal_to_field_path == nullptr || api->filter_not_equal_to_field_path == nullptr ||
            api->filter_less_than_field_path == nullptr || api->filter_less_than_or_equal_to_field_path == nullptr ||
            api->filter_greater_than_field_path == nullptr || api->filter_greater_than_or_equal_to_field_path == nullptr ||
            api->filter_array_contains_field_path == nullptr || api->filter_array_contains_any_field_path == nullptr ||
            api->filter_in_field_path == nullptr || api->filter_not_in_field_path == nullptr ||
            api->filter_and == nullptr || api->filter_or == nullptr || api->filter_release == nullptr ||
            api->query_where_filter == nullptr || api->query_where_equal_to_field_path == nullptr ||
            api->query_where_not_equal_to_field_path == nullptr || api->query_where_less_than_field_path == nullptr ||
            api->query_where_less_than_or_equal_to_field_path == nullptr || api->query_where_greater_than_field_path == nullptr ||
            api->query_where_greater_than_or_equal_to_field_path == nullptr || api->query_where_array_contains_field_path == nullptr ||
            api->query_where_array_contains_any_field_path == nullptr || api->query_where_in_field_path == nullptr ||
            api->query_where_not_in_field_path == nullptr || api->query_order_by_field_path == nullptr ||
            api->query_count == nullptr || api->aggregate_query_get_query == nullptr ||
            api->aggregate_query_is_valid == nullptr || api->aggregate_query_get == nullptr ||
            api->aggregate_query_release == nullptr || api->aggregate_snapshot_count == nullptr ||
            api->aggregate_snapshot_get_query == nullptr || api->aggregate_snapshot_is_valid == nullptr ||
            api->aggregate_snapshot_release == nullptr || api->add_snapshots_in_sync_listener == nullptr ||
            api->load_bundle == nullptr || api->named_query == nullptr ||
            api->document_ref_set_merge_field_paths == nullptr || api->write_batch_set_merge_field_paths == nullptr ||
            api->field_value_type == nullptr || api->field_value_is_valid == nullptr ||
            api->field_value_is_null == nullptr || api->field_value_is_boolean == nullptr ||
            api->field_value_is_integer == nullptr || api->field_value_is_double == nullptr ||
            api->field_value_is_timestamp == nullptr || api->field_value_is_string == nullptr ||
            api->field_value_is_blob == nullptr || api->field_value_is_reference == nullptr ||
            api->field_value_is_geo_point == nullptr || api->field_value_is_array == nullptr ||
            api->field_value_is_map == nullptr || api->field_value_boolean_value == nullptr ||
            api->field_value_integer_value == nullptr || api->field_value_double_value == nullptr ||
            api->field_value_string_value == nullptr || api->field_value_blob_size == nullptr ||
            api->field_value_blob_copy == nullptr || api->field_value_reference_value == nullptr ||
            api->field_value_timestamp_value == nullptr || api->field_value_geo_point_value == nullptr ||
            api->field_value_array_value == nullptr || api->field_value_map_value == nullptr ||
            api->field_value_to_string == nullptr || api->query_get_firestore == nullptr ||
            api->document_ref_get_firestore == nullptr || api->document_ref_to_string == nullptr ||
            api->document_ref_update_field_paths == nullptr || api->write_batch_update_field_paths == nullptr ||
            api->write_batch_is_valid == nullptr || api->settings_to_string == nullptr ||
            api->document_snapshot_is_valid == nullptr || api->document_snapshot_to_string == nullptr ||
            api->document_snapshot_get_field_path == nullptr || api->query_snapshot_is_valid == nullptr ||
            api->query_snapshot_get_query == nullptr || api->listener_registration_is_valid == nullptr ||
            api->get_app == nullptr || api->get_instance_for_app == nullptr ||
            api->get_instance_for_app_database == nullptr || api->field_value_boolean == nullptr ||
            api->field_value_string == nullptr || api->field_value_array == nullptr ||
            api->field_value_map == nullptr || api->document_snapshot_metadata_to_string == nullptr ||
            api->query_snapshot_metadata_to_string == nullptr || api->document_snapshot_exists == nullptr ||
            api->document_snapshot_id == nullptr || api->document_snapshot_reference == nullptr ||
            api->document_snapshot_metadata_has_pending_writes == nullptr || api->document_snapshot_metadata_is_from_cache == nullptr ||
            api->query_snapshot_size == nullptr || api->query_snapshot_empty == nullptr ||
            api->query_snapshot_metadata_has_pending_writes == nullptr || api->query_snapshot_metadata_is_from_cache == nullptr)
        {
            return nullptr;
        }

        return api;
    }

    const GMFirebaseCoreFirestoreAPI* tryLoadCoreFirestoreAPI()
    {
#if defined(__APPLE__) && (TARGET_OS_IPHONE || TARGET_OS_TV)
        // Split iOS/tvOS extensions are static archives in the final GameMaker
        // Xcode target, so the linker resolves this symbol from GMFirebaseCore.
        return validate(gmfirebase_core_get_firestore_api());

#elif defined(_WIN32)
        HMODULE module = GetModuleHandleA("GMFirebaseCore.dll");
        if (module == nullptr)
            module = LoadLibraryA("GMFirebaseCore.dll");
        if (module == nullptr)
            return nullptr;

        auto getter = reinterpret_cast<GetFirestoreApiFn>(
            GetProcAddress(module, "gmfirebase_core_get_firestore_api"));
        if (getter == nullptr)
            return nullptr;
        return validate(getter());

#else
        // First try the process-wide symbol table in case GameMaker already
        // loaded Core. If not, explicitly load the sibling native library.
        auto getter = reinterpret_cast<GetFirestoreApiFn>(
            dlsym(RTLD_DEFAULT, "gmfirebase_core_get_firestore_api"));
        if (getter != nullptr)
            return validate(getter());

        const char* candidates[] = {
#if defined(__APPLE__)
            "libGMFirebaseCore.dylib",
            "GMFirebaseCore.dylib",
#else
            "libGMFirebaseCore.so",
            "GMFirebaseCore.so",
#endif
        };

        for (const char* candidate : candidates)
        {
            void* module = dlopen(candidate, RTLD_NOW | RTLD_GLOBAL);
            if (module == nullptr)
                continue;
            getter = reinterpret_cast<GetFirestoreApiFn>(
                dlsym(module, "gmfirebase_core_get_firestore_api"));
            if (getter != nullptr)
                return validate(getter());
        }
        return nullptr;
#endif
    }
}

const GMFirebaseCoreFirestoreAPI* gmfirebaseGetCoreFirestoreAPI()
{
    if (g_core_firestore_api != nullptr)
        return g_core_firestore_api;

    std::lock_guard<std::mutex> lock(g_core_firestore_api_mutex);
    if (g_core_firestore_api == nullptr)
        g_core_firestore_api = tryLoadCoreFirestoreAPI();
    return g_core_firestore_api;
}

bool gmfirebaseCoreFirestoreAvailable()
{
    return gmfirebaseGetCoreFirestoreAPI() != nullptr;
}
