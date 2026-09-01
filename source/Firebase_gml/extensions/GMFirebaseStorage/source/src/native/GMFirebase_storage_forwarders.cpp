#include <native/GMFirebaseStorageInternal_native.h>
#include "GMFirebase_core_product_client.h"

// Auto-generated thin forwarders. Firebase SDK code executes only in
// GMFirebaseCore; this DLL retains the original ExtGen-facing symbols.

std::uint64_t firebase_storage_get_instance()
{
    using Proc = std::uint64_t (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_get_instance");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc();
}

std::uint64_t firebase_storage_get_instance_with_url(std::string_view url)
{
    using Proc = std::uint64_t (*)(std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_get_instance_with_url");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(url);
}

std::string firebase_storage_url(std::uint64_t storage_ref)
{
    using Proc = std::string (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_url");
    if (proc == nullptr)
        return std::string{};
    return proc(storage_ref);
}

std::uint64_t firebase_storage_get_reference(std::uint64_t storage_ref)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_get_reference");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(storage_ref);
}

std::uint64_t firebase_storage_get_reference_path(std::uint64_t storage_ref, std::string_view path)
{
    using Proc = std::uint64_t (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_get_reference_path");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(storage_ref, path);
}

std::uint64_t firebase_storage_get_reference_from_url(std::uint64_t storage_ref, std::string_view url)
{
    using Proc = std::uint64_t (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_get_reference_from_url");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(storage_ref, url);
}

double firebase_storage_max_download_retry_time(std::uint64_t storage_ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_max_download_retry_time");
    if (proc == nullptr)
        return double{};
    return proc(storage_ref);
}

void firebase_storage_set_max_download_retry_time(std::uint64_t storage_ref, double seconds)
{
    using Proc = void (*)(std::uint64_t, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_set_max_download_retry_time");
    if (proc == nullptr)
        return;
    proc(storage_ref, seconds);
}

double firebase_storage_max_upload_retry_time(std::uint64_t storage_ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_max_upload_retry_time");
    if (proc == nullptr)
        return double{};
    return proc(storage_ref);
}

void firebase_storage_set_max_upload_retry_time(std::uint64_t storage_ref, double seconds)
{
    using Proc = void (*)(std::uint64_t, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_set_max_upload_retry_time");
    if (proc == nullptr)
        return;
    proc(storage_ref, seconds);
}

double firebase_storage_max_operation_retry_time(std::uint64_t storage_ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_max_operation_retry_time");
    if (proc == nullptr)
        return double{};
    return proc(storage_ref);
}

void firebase_storage_set_max_operation_retry_time(std::uint64_t storage_ref, double seconds)
{
    using Proc = void (*)(std::uint64_t, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_set_max_operation_retry_time");
    if (proc == nullptr)
        return;
    proc(storage_ref, seconds);
}

void firebase_storage_use_emulator(std::uint64_t storage_ref, std::string_view host, double port)
{
    using Proc = void (*)(std::uint64_t, std::string_view, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_use_emulator");
    if (proc == nullptr)
        return;
    proc(storage_ref, host, port);
}

std::uint64_t firebase_storage_ref_child(std::uint64_t ref, std::string_view path)
{
    using Proc = std::uint64_t (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_ref_child");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, path);
}

std::uint64_t firebase_storage_ref_get_parent(std::uint64_t ref)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_ref_get_parent");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref);
}

std::string firebase_storage_ref_bucket(std::uint64_t ref)
{
    using Proc = std::string (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_ref_bucket");
    if (proc == nullptr)
        return std::string{};
    return proc(ref);
}

std::string firebase_storage_ref_full_path(std::uint64_t ref)
{
    using Proc = std::string (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_ref_full_path");
    if (proc == nullptr)
        return std::string{};
    return proc(ref);
}

std::string firebase_storage_ref_name(std::uint64_t ref)
{
    using Proc = std::string (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_ref_name");
    if (proc == nullptr)
        return std::string{};
    return proc(ref);
}

double firebase_storage_ref_is_valid(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_ref_is_valid");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

std::uint64_t firebase_storage_ref_storage(std::uint64_t ref)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_ref_storage");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref);
}

double firebase_storage_ref_delete(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_ref_delete");
    if (proc == nullptr)
        return double{};
    return proc(ref, callback);
}

double firebase_storage_ref_get_download_url(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_ref_get_download_url");
    if (proc == nullptr)
        return double{};
    return proc(ref, callback);
}

double firebase_storage_ref_get_metadata(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_ref_get_metadata");
    if (proc == nullptr)
        return double{};
    return proc(ref, callback);
}

double firebase_storage_ref_update_metadata(std::uint64_t ref, std::uint64_t metadata_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_ref_update_metadata");
    if (proc == nullptr)
        return double{};
    return proc(ref, metadata_ref, callback);
}

double firebase_storage_ref_put_bytes(std::uint64_t ref, gm::wire::GMBuffer data, std::uint64_t metadata_ref, const std::optional<gm::wire::GMFunction>& progress_callback, std::uint64_t controller_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, gm::wire::GMBuffer, std::uint64_t, const std::optional<gm::wire::GMFunction>&, std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_ref_put_bytes");
    if (proc == nullptr)
        return double{};
    return proc(ref, data, metadata_ref, progress_callback, controller_ref, callback);
}

double firebase_storage_ref_put_file(std::uint64_t ref, std::string_view local_path, std::uint64_t metadata_ref, const std::optional<gm::wire::GMFunction>& progress_callback, std::uint64_t controller_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, std::string_view, std::uint64_t, const std::optional<gm::wire::GMFunction>&, std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_ref_put_file");
    if (proc == nullptr)
        return double{};
    return proc(ref, local_path, metadata_ref, progress_callback, controller_ref, callback);
}

double firebase_storage_ref_get_bytes(std::uint64_t ref, gm::wire::GMBuffer data, const std::optional<gm::wire::GMFunction>& progress_callback, std::uint64_t controller_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, gm::wire::GMBuffer, const std::optional<gm::wire::GMFunction>&, std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_ref_get_bytes");
    if (proc == nullptr)
        return double{};
    return proc(ref, data, progress_callback, controller_ref, callback);
}

double firebase_storage_ref_get_file(std::uint64_t ref, std::string_view local_path, const std::optional<gm::wire::GMFunction>& progress_callback, std::uint64_t controller_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, std::string_view, const std::optional<gm::wire::GMFunction>&, std::uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_ref_get_file");
    if (proc == nullptr)
        return double{};
    return proc(ref, local_path, progress_callback, controller_ref, callback);
}

double firebase_storage_ref_list(std::uint64_t ref, double max_results, std::string_view page_token, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = double (*)(std::uint64_t, double, std::string_view, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_ref_list");
    if (proc == nullptr)
        return double{};
    return proc(ref, max_results, page_token, callback);
}

std::uint64_t firebase_storage_metadata_create()
{
    using Proc = std::uint64_t (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_create");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc();
}

double firebase_storage_metadata_release(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_release");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_storage_metadata_is_valid(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_is_valid");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

std::string firebase_storage_metadata_bucket(std::uint64_t ref)
{
    using Proc = std::string (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_bucket");
    if (proc == nullptr)
        return std::string{};
    return proc(ref);
}

std::string firebase_storage_metadata_cache_control(std::uint64_t ref)
{
    using Proc = std::string (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_cache_control");
    if (proc == nullptr)
        return std::string{};
    return proc(ref);
}

void firebase_storage_metadata_set_cache_control(std::uint64_t ref, std::string_view value)
{
    using Proc = void (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_set_cache_control");
    if (proc == nullptr)
        return;
    proc(ref, value);
}

std::string firebase_storage_metadata_content_disposition(std::uint64_t ref)
{
    using Proc = std::string (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_content_disposition");
    if (proc == nullptr)
        return std::string{};
    return proc(ref);
}

void firebase_storage_metadata_set_content_disposition(std::uint64_t ref, std::string_view value)
{
    using Proc = void (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_set_content_disposition");
    if (proc == nullptr)
        return;
    proc(ref, value);
}

std::string firebase_storage_metadata_content_encoding(std::uint64_t ref)
{
    using Proc = std::string (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_content_encoding");
    if (proc == nullptr)
        return std::string{};
    return proc(ref);
}

void firebase_storage_metadata_set_content_encoding(std::uint64_t ref, std::string_view value)
{
    using Proc = void (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_set_content_encoding");
    if (proc == nullptr)
        return;
    proc(ref, value);
}

std::string firebase_storage_metadata_content_language(std::uint64_t ref)
{
    using Proc = std::string (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_content_language");
    if (proc == nullptr)
        return std::string{};
    return proc(ref);
}

void firebase_storage_metadata_set_content_language(std::uint64_t ref, std::string_view value)
{
    using Proc = void (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_set_content_language");
    if (proc == nullptr)
        return;
    proc(ref, value);
}

std::string firebase_storage_metadata_content_type(std::uint64_t ref)
{
    using Proc = std::string (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_content_type");
    if (proc == nullptr)
        return std::string{};
    return proc(ref);
}

void firebase_storage_metadata_set_content_type(std::uint64_t ref, std::string_view value)
{
    using Proc = void (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_set_content_type");
    if (proc == nullptr)
        return;
    proc(ref, value);
}

double firebase_storage_metadata_creation_time(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_creation_time");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_storage_metadata_generation(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_generation");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_storage_metadata_metadata_generation(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_metadata_generation");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

std::string firebase_storage_metadata_name(std::uint64_t ref)
{
    using Proc = std::string (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_name");
    if (proc == nullptr)
        return std::string{};
    return proc(ref);
}

std::string firebase_storage_metadata_path(std::uint64_t ref)
{
    using Proc = std::string (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_path");
    if (proc == nullptr)
        return std::string{};
    return proc(ref);
}

std::uint64_t firebase_storage_metadata_get_reference(std::uint64_t ref)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_get_reference");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref);
}

double firebase_storage_metadata_size_bytes(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_size_bytes");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_storage_metadata_updated_time(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_updated_time");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_storage_metadata_custom_metadata_count(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_custom_metadata_count");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

std::string firebase_storage_metadata_custom_metadata_key_at(std::uint64_t ref, double index)
{
    using Proc = std::string (*)(std::uint64_t, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_custom_metadata_key_at");
    if (proc == nullptr)
        return std::string{};
    return proc(ref, index);
}

std::string firebase_storage_metadata_get_custom_metadata(std::uint64_t ref, std::string_view key)
{
    using Proc = std::string (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_get_custom_metadata");
    if (proc == nullptr)
        return std::string{};
    return proc(ref, key);
}

void firebase_storage_metadata_set_custom_metadata(std::uint64_t ref, std::string_view key, std::string_view value)
{
    using Proc = void (*)(std::uint64_t, std::string_view, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_set_custom_metadata");
    if (proc == nullptr)
        return;
    proc(ref, key, value);
}

std::uint64_t firebase_storage_controller_create()
{
    using Proc = std::uint64_t (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_controller_create");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc();
}

double firebase_storage_controller_release(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_controller_release");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_storage_controller_is_valid(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_controller_is_valid");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_storage_controller_pause(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_controller_pause");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_storage_controller_resume(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_controller_resume");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_storage_controller_cancel(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_controller_cancel");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_storage_controller_is_paused(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_controller_is_paused");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_storage_controller_bytes_transferred(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_controller_bytes_transferred");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_storage_controller_total_byte_count(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_controller_total_byte_count");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

std::uint64_t firebase_storage_controller_get_reference(std::uint64_t ref)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_controller_get_reference");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref);
}

double firebase_storage_list_result_release(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_list_result_release");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_storage_list_result_is_valid(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_list_result_is_valid");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

double firebase_storage_list_result_item_count(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_list_result_item_count");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

std::uint64_t firebase_storage_list_result_item_at(std::uint64_t ref, double index)
{
    using Proc = std::uint64_t (*)(std::uint64_t, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_list_result_item_at");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, index);
}

double firebase_storage_list_result_prefix_count(std::uint64_t ref)
{
    using Proc = double (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_list_result_prefix_count");
    if (proc == nullptr)
        return double{};
    return proc(ref);
}

std::uint64_t firebase_storage_list_result_prefix_at(std::uint64_t ref, double index)
{
    using Proc = std::uint64_t (*)(std::uint64_t, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_list_result_prefix_at");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(ref, index);
}

std::string firebase_storage_list_result_next_page_token(std::uint64_t ref)
{
    using Proc = std::string (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_list_result_next_page_token");
    if (proc == nullptr)
        return std::string{};
    return proc(ref);
}

std::string firebase_storage_metadata_md5_hash(std::uint64_t metadata)
{
    using Proc = std::string (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_metadata_md5_hash");
    if (proc == nullptr)
        return std::string{};
    return proc(metadata);
}

std::uint64_t firebase_storage_get_app(std::uint64_t storage)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_get_app");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(storage);
}

std::uint64_t firebase_storage_get_instance_for_app(std::uint64_t app)
{
    using Proc = std::uint64_t (*)(std::uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_get_instance_for_app");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(app);
}

std::uint64_t firebase_storage_get_instance_for_app_url(std::uint64_t app, std::string_view url)
{
    using Proc = std::uint64_t (*)(std::uint64_t, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("storage", "firebase_storage_get_instance_for_app_url");
    if (proc == nullptr)
        return std::uint64_t{};
    return proc(app, url);
}
