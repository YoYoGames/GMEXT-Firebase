#include "GMFirebase_core_product_api.h"
#include <native/GMFirebaseStorageInternal_native.h>
#include <cstring>

GMFirebaseCoreProc gmfirebase_core_resolve_storage_proc(const char* symbol)
{
    if (symbol == nullptr) return nullptr;
    if (std::strcmp(symbol, "firebase_storage_get_instance") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_get_instance);
    if (std::strcmp(symbol, "firebase_storage_get_instance_with_url") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_get_instance_with_url);
    if (std::strcmp(symbol, "firebase_storage_url") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_url);
    if (std::strcmp(symbol, "firebase_storage_get_reference") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_get_reference);
    if (std::strcmp(symbol, "firebase_storage_get_reference_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_get_reference_path);
    if (std::strcmp(symbol, "firebase_storage_get_reference_from_url") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_get_reference_from_url);
    if (std::strcmp(symbol, "firebase_storage_max_download_retry_time") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_max_download_retry_time);
    if (std::strcmp(symbol, "firebase_storage_set_max_download_retry_time") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_set_max_download_retry_time);
    if (std::strcmp(symbol, "firebase_storage_max_upload_retry_time") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_max_upload_retry_time);
    if (std::strcmp(symbol, "firebase_storage_set_max_upload_retry_time") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_set_max_upload_retry_time);
    if (std::strcmp(symbol, "firebase_storage_max_operation_retry_time") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_max_operation_retry_time);
    if (std::strcmp(symbol, "firebase_storage_set_max_operation_retry_time") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_set_max_operation_retry_time);
    if (std::strcmp(symbol, "firebase_storage_use_emulator") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_use_emulator);
    if (std::strcmp(symbol, "firebase_storage_ref_child") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_ref_child);
    if (std::strcmp(symbol, "firebase_storage_ref_get_parent") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_ref_get_parent);
    if (std::strcmp(symbol, "firebase_storage_ref_bucket") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_ref_bucket);
    if (std::strcmp(symbol, "firebase_storage_ref_full_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_ref_full_path);
    if (std::strcmp(symbol, "firebase_storage_ref_name") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_ref_name);
    if (std::strcmp(symbol, "firebase_storage_ref_is_valid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_ref_is_valid);
    if (std::strcmp(symbol, "firebase_storage_ref_storage") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_ref_storage);
    if (std::strcmp(symbol, "firebase_storage_ref_delete") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_ref_delete);
    if (std::strcmp(symbol, "firebase_storage_ref_get_download_url") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_ref_get_download_url);
    if (std::strcmp(symbol, "firebase_storage_ref_get_metadata") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_ref_get_metadata);
    if (std::strcmp(symbol, "firebase_storage_ref_update_metadata") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_ref_update_metadata);
    if (std::strcmp(symbol, "firebase_storage_ref_put_bytes") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_ref_put_bytes);
    if (std::strcmp(symbol, "firebase_storage_ref_put_file") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_ref_put_file);
    if (std::strcmp(symbol, "firebase_storage_ref_get_bytes") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_ref_get_bytes);
    if (std::strcmp(symbol, "firebase_storage_ref_get_file") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_ref_get_file);
    if (std::strcmp(symbol, "firebase_storage_ref_list") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_ref_list);
    if (std::strcmp(symbol, "firebase_storage_metadata_create") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_create);
    if (std::strcmp(symbol, "firebase_storage_metadata_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_release);
    if (std::strcmp(symbol, "firebase_storage_metadata_is_valid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_is_valid);
    if (std::strcmp(symbol, "firebase_storage_metadata_bucket") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_bucket);
    if (std::strcmp(symbol, "firebase_storage_metadata_cache_control") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_cache_control);
    if (std::strcmp(symbol, "firebase_storage_metadata_set_cache_control") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_set_cache_control);
    if (std::strcmp(symbol, "firebase_storage_metadata_content_disposition") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_content_disposition);
    if (std::strcmp(symbol, "firebase_storage_metadata_set_content_disposition") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_set_content_disposition);
    if (std::strcmp(symbol, "firebase_storage_metadata_content_encoding") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_content_encoding);
    if (std::strcmp(symbol, "firebase_storage_metadata_set_content_encoding") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_set_content_encoding);
    if (std::strcmp(symbol, "firebase_storage_metadata_content_language") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_content_language);
    if (std::strcmp(symbol, "firebase_storage_metadata_set_content_language") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_set_content_language);
    if (std::strcmp(symbol, "firebase_storage_metadata_content_type") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_content_type);
    if (std::strcmp(symbol, "firebase_storage_metadata_set_content_type") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_set_content_type);
    if (std::strcmp(symbol, "firebase_storage_metadata_creation_time") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_creation_time);
    if (std::strcmp(symbol, "firebase_storage_metadata_generation") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_generation);
    if (std::strcmp(symbol, "firebase_storage_metadata_metadata_generation") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_metadata_generation);
    if (std::strcmp(symbol, "firebase_storage_metadata_name") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_name);
    if (std::strcmp(symbol, "firebase_storage_metadata_path") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_path);
    if (std::strcmp(symbol, "firebase_storage_metadata_get_reference") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_get_reference);
    if (std::strcmp(symbol, "firebase_storage_metadata_size_bytes") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_size_bytes);
    if (std::strcmp(symbol, "firebase_storage_metadata_updated_time") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_updated_time);
    if (std::strcmp(symbol, "firebase_storage_metadata_custom_metadata_count") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_custom_metadata_count);
    if (std::strcmp(symbol, "firebase_storage_metadata_custom_metadata_key_at") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_custom_metadata_key_at);
    if (std::strcmp(symbol, "firebase_storage_metadata_get_custom_metadata") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_get_custom_metadata);
    if (std::strcmp(symbol, "firebase_storage_metadata_set_custom_metadata") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_set_custom_metadata);
    if (std::strcmp(symbol, "firebase_storage_controller_create") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_controller_create);
    if (std::strcmp(symbol, "firebase_storage_controller_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_controller_release);
    if (std::strcmp(symbol, "firebase_storage_controller_is_valid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_controller_is_valid);
    if (std::strcmp(symbol, "firebase_storage_controller_pause") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_controller_pause);
    if (std::strcmp(symbol, "firebase_storage_controller_resume") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_controller_resume);
    if (std::strcmp(symbol, "firebase_storage_controller_cancel") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_controller_cancel);
    if (std::strcmp(symbol, "firebase_storage_controller_is_paused") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_controller_is_paused);
    if (std::strcmp(symbol, "firebase_storage_controller_bytes_transferred") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_controller_bytes_transferred);
    if (std::strcmp(symbol, "firebase_storage_controller_total_byte_count") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_controller_total_byte_count);
    if (std::strcmp(symbol, "firebase_storage_controller_get_reference") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_controller_get_reference);
    if (std::strcmp(symbol, "firebase_storage_list_result_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_list_result_release);
    if (std::strcmp(symbol, "firebase_storage_list_result_is_valid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_list_result_is_valid);
    if (std::strcmp(symbol, "firebase_storage_list_result_item_count") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_list_result_item_count);
    if (std::strcmp(symbol, "firebase_storage_list_result_item_at") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_list_result_item_at);
    if (std::strcmp(symbol, "firebase_storage_list_result_prefix_count") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_list_result_prefix_count);
    if (std::strcmp(symbol, "firebase_storage_list_result_prefix_at") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_list_result_prefix_at);
    if (std::strcmp(symbol, "firebase_storage_list_result_next_page_token") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_list_result_next_page_token);
    if (std::strcmp(symbol, "firebase_storage_metadata_md5_hash") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_metadata_md5_hash);
    if (std::strcmp(symbol, "firebase_storage_get_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_get_app);
    if (std::strcmp(symbol, "firebase_storage_get_instance_for_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_get_instance_for_app);
    if (std::strcmp(symbol, "firebase_storage_get_instance_for_app_url") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_storage_get_instance_for_app_url);
    return nullptr;
}
