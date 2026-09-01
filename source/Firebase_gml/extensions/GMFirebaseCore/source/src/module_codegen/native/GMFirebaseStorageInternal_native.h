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
}


namespace gm_structs
{

}

namespace gm::wire::codec
{
}

namespace gm::wire::details
{
}

std::uint64_t firebase_storage_get_instance();
std::uint64_t firebase_storage_get_instance_with_url(std::string_view url);
std::string firebase_storage_url(std::uint64_t storage_ref);
std::uint64_t firebase_storage_get_reference(std::uint64_t storage_ref);
std::uint64_t firebase_storage_get_reference_path(std::uint64_t storage_ref, std::string_view path);
std::uint64_t firebase_storage_get_reference_from_url(std::uint64_t storage_ref, std::string_view url);
double firebase_storage_max_download_retry_time(std::uint64_t storage_ref);
void firebase_storage_set_max_download_retry_time(std::uint64_t storage_ref, double seconds);
double firebase_storage_max_upload_retry_time(std::uint64_t storage_ref);
void firebase_storage_set_max_upload_retry_time(std::uint64_t storage_ref, double seconds);
double firebase_storage_max_operation_retry_time(std::uint64_t storage_ref);
void firebase_storage_set_max_operation_retry_time(std::uint64_t storage_ref, double seconds);
void firebase_storage_use_emulator(std::uint64_t storage_ref, std::string_view host, double port);
std::uint64_t firebase_storage_ref_child(std::uint64_t ref, std::string_view path);
std::uint64_t firebase_storage_ref_get_parent(std::uint64_t ref);
std::string firebase_storage_ref_bucket(std::uint64_t ref);
std::string firebase_storage_ref_full_path(std::uint64_t ref);
std::string firebase_storage_ref_name(std::uint64_t ref);
double firebase_storage_ref_is_valid(std::uint64_t ref);
std::uint64_t firebase_storage_ref_storage(std::uint64_t ref);
double firebase_storage_ref_delete(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_storage_ref_get_download_url(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_storage_ref_get_metadata(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_storage_ref_update_metadata(std::uint64_t ref, std::uint64_t metadata_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_storage_ref_put_bytes(std::uint64_t ref, gm::wire::GMBuffer data, std::uint64_t metadata_ref, const std::optional<gm::wire::GMFunction>& progress_callback, std::uint64_t controller_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_storage_ref_put_file(std::uint64_t ref, std::string_view local_path, std::uint64_t metadata_ref, const std::optional<gm::wire::GMFunction>& progress_callback, std::uint64_t controller_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_storage_ref_get_bytes(std::uint64_t ref, gm::wire::GMBuffer data, const std::optional<gm::wire::GMFunction>& progress_callback, std::uint64_t controller_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_storage_ref_get_file(std::uint64_t ref, std::string_view local_path, const std::optional<gm::wire::GMFunction>& progress_callback, std::uint64_t controller_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_storage_ref_list(std::uint64_t ref, double max_results, std::string_view page_token, const std::optional<gm::wire::GMFunction>& callback);
std::uint64_t firebase_storage_metadata_create();
double firebase_storage_metadata_release(std::uint64_t ref);
double firebase_storage_metadata_is_valid(std::uint64_t ref);
std::string firebase_storage_metadata_bucket(std::uint64_t ref);
std::string firebase_storage_metadata_cache_control(std::uint64_t ref);
void firebase_storage_metadata_set_cache_control(std::uint64_t ref, std::string_view value);
std::string firebase_storage_metadata_content_disposition(std::uint64_t ref);
void firebase_storage_metadata_set_content_disposition(std::uint64_t ref, std::string_view value);
std::string firebase_storage_metadata_content_encoding(std::uint64_t ref);
void firebase_storage_metadata_set_content_encoding(std::uint64_t ref, std::string_view value);
std::string firebase_storage_metadata_content_language(std::uint64_t ref);
void firebase_storage_metadata_set_content_language(std::uint64_t ref, std::string_view value);
std::string firebase_storage_metadata_content_type(std::uint64_t ref);
void firebase_storage_metadata_set_content_type(std::uint64_t ref, std::string_view value);
double firebase_storage_metadata_creation_time(std::uint64_t ref);
double firebase_storage_metadata_generation(std::uint64_t ref);
double firebase_storage_metadata_metadata_generation(std::uint64_t ref);
std::string firebase_storage_metadata_name(std::uint64_t ref);
std::string firebase_storage_metadata_path(std::uint64_t ref);
std::uint64_t firebase_storage_metadata_get_reference(std::uint64_t ref);
double firebase_storage_metadata_size_bytes(std::uint64_t ref);
double firebase_storage_metadata_updated_time(std::uint64_t ref);
double firebase_storage_metadata_custom_metadata_count(std::uint64_t ref);
std::string firebase_storage_metadata_custom_metadata_key_at(std::uint64_t ref, double index);
std::string firebase_storage_metadata_get_custom_metadata(std::uint64_t ref, std::string_view key);
void firebase_storage_metadata_set_custom_metadata(std::uint64_t ref, std::string_view key, std::string_view value);
std::uint64_t firebase_storage_controller_create();
double firebase_storage_controller_release(std::uint64_t ref);
double firebase_storage_controller_is_valid(std::uint64_t ref);
double firebase_storage_controller_pause(std::uint64_t ref);
double firebase_storage_controller_resume(std::uint64_t ref);
double firebase_storage_controller_cancel(std::uint64_t ref);
double firebase_storage_controller_is_paused(std::uint64_t ref);
double firebase_storage_controller_bytes_transferred(std::uint64_t ref);
double firebase_storage_controller_total_byte_count(std::uint64_t ref);
std::uint64_t firebase_storage_controller_get_reference(std::uint64_t ref);
double firebase_storage_list_result_release(std::uint64_t ref);
double firebase_storage_list_result_is_valid(std::uint64_t ref);
double firebase_storage_list_result_item_count(std::uint64_t ref);
std::uint64_t firebase_storage_list_result_item_at(std::uint64_t ref, double index);
double firebase_storage_list_result_prefix_count(std::uint64_t ref);
std::uint64_t firebase_storage_list_result_prefix_at(std::uint64_t ref, double index);
std::string firebase_storage_list_result_next_page_token(std::uint64_t ref);
std::string firebase_storage_metadata_md5_hash(std::uint64_t metadata);
std::uint64_t firebase_storage_get_app(std::uint64_t storage);
std::uint64_t firebase_storage_get_instance_for_app(std::uint64_t app);
std::uint64_t firebase_storage_get_instance_for_app_url(std::uint64_t app, std::string_view url);
