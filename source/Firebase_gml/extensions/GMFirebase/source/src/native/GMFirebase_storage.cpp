#include "GMFirebase_storage.h"
#include <iterator>

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

// ============================================================
// Value-copy registries
// ============================================================

std::map<uint32_t, firebase::storage::StorageReference> g_firebase_storage_ref_map;
uint32_t g_firebase_storage_ref_index = 0;

std::map<uint32_t, firebase::storage::Metadata> g_firebase_storage_metadata_map;
uint32_t g_firebase_storage_metadata_index = 0;

std::map<uint32_t, firebase::storage::Controller> g_firebase_storage_controller_map;
uint32_t g_firebase_storage_controller_index = 0;

std::map<uint32_t, firebase::storage::StorageListResult> g_firebase_storage_list_result_map;
uint32_t g_firebase_storage_list_result_index = 0;

uint64_t registerStorageReference(const firebase::storage::StorageReference& ref)
{
	return packFirebaseRef(registerFirebaseValue(ref, g_firebase_storage_ref_index, g_firebase_storage_ref_map), GM_FB_TYPE_STORAGE_REF);
}

uint64_t registerStorageMetadata(const firebase::storage::Metadata& metadata)
{
	return packFirebaseRef(registerFirebaseValue(metadata, g_firebase_storage_metadata_index, g_firebase_storage_metadata_map), GM_FB_TYPE_STORAGE_METADATA);
}

uint64_t registerStorageListResult(const firebase::storage::StorageListResult& result)
{
	return packFirebaseRef(registerFirebaseValue(result, g_firebase_storage_list_result_index, g_firebase_storage_list_result_map), GM_FB_TYPE_STORAGE_LIST_RESULT);
}

namespace
{
	firebase::storage::Storage* resolveStorage(uint64_t firebase_storage_ref)
	{
		firebase::storage::Storage* storage = nullptr;
		validate_fb_ref_ptr(firebase_storage_ref, GM_FB_TYPE_STORAGE, firebase::storage::Storage, storage);
		return storage;
	}

	firebase::storage::StorageReference* resolveStorageRef(uint64_t ref)
	{
		firebase::storage::StorageReference* out = nullptr;
		validate_fb_ref_map(ref, GM_FB_TYPE_STORAGE_REF, firebase::storage::StorageReference, g_firebase_storage_ref_map, out);
		return out;
	}

	firebase::storage::Metadata* resolveMetadata(uint64_t ref)
	{
		firebase::storage::Metadata* out = nullptr;
		validate_fb_ref_map(ref, GM_FB_TYPE_STORAGE_METADATA, firebase::storage::Metadata, g_firebase_storage_metadata_map, out);
		return out;
	}

	firebase::storage::Controller* resolveController(uint64_t ref)
	{
		firebase::storage::Controller* out = nullptr;
		validate_fb_ref_map(ref, GM_FB_TYPE_STORAGE_CONTROLLER, firebase::storage::Controller, g_firebase_storage_controller_map, out);
		return out;
	}

	firebase::storage::StorageListResult* resolveListResult(uint64_t ref)
	{
		firebase::storage::StorageListResult* out = nullptr;
		validate_fb_ref_map(ref, GM_FB_TYPE_STORAGE_LIST_RESULT, firebase::storage::StorageListResult, g_firebase_storage_list_result_map, out);
		return out;
	}

	// Optional-ref-input convention: a ref value of 0 (never produced by
	// packFirebaseRef's ++index scheme for a real registration) means
	// "not provided" for the optional metadata_ref/controller_ref params on
	// PutBytes/PutFile/GetBytes/GetFile, so an intentionally-omitted optional
	// value does not fall through validate_fb_ref_map's normal rejection
	// path (which would otherwise log a spurious "invalid handle" error).
	firebase::storage::Metadata* resolveOptionalMetadata(uint64_t ref)
	{
		if (ref == 0) return nullptr;
		return resolveMetadata(ref);
	}

	firebase::storage::Controller* resolveOptionalController(uint64_t ref)
	{
		if (ref == 0) return nullptr;
		return resolveController(ref);
	}

	void reportFutureError(int error, const char* error_message)
	{
		if (error != 0)
			setFirebaseLastError(error, error_message ? error_message : "");
	}
}

// ============================================================
// Listener
// ============================================================

void GMFirebaseStorageListener::OnPaused(firebase::storage::Controller* controller)
{
	progress_callback.call(true,
		controller ? static_cast<double>(controller->bytes_transferred()) : 0.0,
		controller ? static_cast<double>(controller->total_byte_count()) : 0.0);
}

void GMFirebaseStorageListener::OnProgress(firebase::storage::Controller* controller)
{
	progress_callback.call(false,
		controller ? static_cast<double>(controller->bytes_transferred()) : 0.0,
		controller ? static_cast<double>(controller->total_byte_count()) : 0.0);
}

namespace
{
	// Heap-allocates a listener wrapper iff a progress callback was supplied;
	// nullptr otherwise, matching Listener*'s own optional-out-param default.
	GMFirebaseStorageListener* makeOptionalListener(const std::optional<GMFunction>& progress_callback)
	{
		if (!progress_callback.has_value()) return nullptr;
		return new GMFirebaseStorageListener(progress_callback.value());
	}
}

// ============================================================
// Storage instance
// ============================================================

uint64_t firebase_storage_get_instance()
{
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(-1, "firebase_storage: no firebase::App - call firebase_app_initialize() first");
		return 0;
	}

	firebase::storage::Storage* storage = firebase::storage::Storage::GetInstance(app);
	if (storage == nullptr)
	{
		setFirebaseLastError(-1, "firebase_storage: Storage::GetInstance() returned null");
		return 0;
	}

	return registerFirebasePointer(storage, GM_FB_TYPE_STORAGE);
}

uint64_t firebase_storage_get_instance_with_url(std::string_view url)
{
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(-1, "firebase_storage: no firebase::App - call firebase_app_initialize() first");
		return 0;
	}

	firebase::storage::Storage* storage = firebase::storage::Storage::GetInstance(app, std::string(url).c_str());
	if (storage == nullptr)
	{
		setFirebaseLastError(-1, "firebase_storage: Storage::GetInstance(url) returned null");
		return 0;
	}

	return registerFirebasePointer(storage, GM_FB_TYPE_STORAGE);
}

std::string firebase_storage_url(uint64_t firebase_storage_ref)
{
	firebase::storage::Storage* storage = resolveStorage(firebase_storage_ref);
	if (storage == nullptr) return std::string();
	return storage->url();
}

uint64_t firebase_storage_get_reference(uint64_t firebase_storage_ref)
{
	firebase::storage::Storage* storage = resolveStorage(firebase_storage_ref);
	if (storage == nullptr) return 0;
	return registerStorageReference(storage->GetReference());
}

uint64_t firebase_storage_get_reference_path(uint64_t firebase_storage_ref, std::string_view path)
{
	firebase::storage::Storage* storage = resolveStorage(firebase_storage_ref);
	if (storage == nullptr) return 0;
	return registerStorageReference(storage->GetReference(std::string(path).c_str()));
}

uint64_t firebase_storage_get_reference_from_url(uint64_t firebase_storage_ref, std::string_view url)
{
	firebase::storage::Storage* storage = resolveStorage(firebase_storage_ref);
	if (storage == nullptr) return 0;
	return registerStorageReference(storage->GetReferenceFromUrl(std::string(url).c_str()));
}

double firebase_storage_max_download_retry_time(uint64_t firebase_storage_ref)
{
	firebase::storage::Storage* storage = resolveStorage(firebase_storage_ref);
	if (storage == nullptr) return 0.0;
	return storage->max_download_retry_time();
}

void firebase_storage_set_max_download_retry_time(uint64_t firebase_storage_ref, double seconds)
{
	firebase::storage::Storage* storage = resolveStorage(firebase_storage_ref);
	if (storage == nullptr) return;
	storage->set_max_download_retry_time(seconds);
}

double firebase_storage_max_upload_retry_time(uint64_t firebase_storage_ref)
{
	firebase::storage::Storage* storage = resolveStorage(firebase_storage_ref);
	if (storage == nullptr) return 0.0;
	return storage->max_upload_retry_time();
}

void firebase_storage_set_max_upload_retry_time(uint64_t firebase_storage_ref, double seconds)
{
	firebase::storage::Storage* storage = resolveStorage(firebase_storage_ref);
	if (storage == nullptr) return;
	storage->set_max_upload_retry_time(seconds);
}

double firebase_storage_max_operation_retry_time(uint64_t firebase_storage_ref)
{
	firebase::storage::Storage* storage = resolveStorage(firebase_storage_ref);
	if (storage == nullptr) return 0.0;
	return storage->max_operation_retry_time();
}

void firebase_storage_set_max_operation_retry_time(uint64_t firebase_storage_ref, double seconds)
{
	firebase::storage::Storage* storage = resolveStorage(firebase_storage_ref);
	if (storage == nullptr) return;
	storage->set_max_operation_retry_time(seconds);
}

void firebase_storage_use_emulator(uint64_t firebase_storage_ref, std::string_view host, double port)
{
	firebase::storage::Storage* storage = resolveStorage(firebase_storage_ref);
	if (storage == nullptr) return;
	storage->UseEmulator(std::string(host).c_str(), static_cast<int>(port));
}

// ============================================================
// StorageReference
// ============================================================

uint64_t firebase_storage_ref_child(uint64_t ref, std::string_view path)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return 0;
	return registerStorageReference(self->Child(std::string(path).c_str()));
}

uint64_t firebase_storage_ref_get_parent(uint64_t ref)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return 0;
	return registerStorageReference(self->GetParent());
}

std::string firebase_storage_ref_bucket(uint64_t ref)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return std::string();
	return self->bucket();
}

std::string firebase_storage_ref_full_path(uint64_t ref)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return std::string();
	return self->full_path();
}

std::string firebase_storage_ref_name(uint64_t ref)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return std::string();
	return self->name();
}

double firebase_storage_ref_is_valid(uint64_t ref)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return 0.0;
	return self->is_valid() ? 1.0 : 0.0;
}

uint64_t firebase_storage_ref_storage(uint64_t ref)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return 0;
	firebase::storage::Storage* storage = self->storage();
	if (storage == nullptr) return 0;
	return registerFirebasePointer(storage, GM_FB_TYPE_STORAGE);
}

// callback(error_code: real, error_message: string)
double firebase_storage_ref_delete(uint64_t ref, const std::optional<GMFunction>& callback)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return 0.0;

	self->Delete().OnCompletion([callback](const firebase::Future<void>& f)
	{
		reportFutureError(f.error(), f.error_message());
		if (callback.has_value())
			callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
}

// callback(error_code: real, error_message: string, url: string)
double firebase_storage_ref_get_download_url(uint64_t ref, const std::optional<GMFunction>& callback)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return 0.0;

	self->GetDownloadUrl().OnCompletion([callback](const firebase::Future<std::string>& f)
	{
		reportFutureError(f.error(), f.error_message());
		if (!callback.has_value()) return;
		std::string url = (f.error() == 0 && f.result() != nullptr) ? *f.result() : std::string();
		callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" }, std::string_view{ url });
	});
	return 1.0;
}

// callback(error_code: real, error_message: string, metadata_ref: uint64)
double firebase_storage_ref_get_metadata(uint64_t ref, const std::optional<GMFunction>& callback)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return 0.0;

	self->GetMetadata().OnCompletion([callback](const firebase::Future<firebase::storage::Metadata>& f)
	{
		reportFutureError(f.error(), f.error_message());
		if (!callback.has_value()) return;
		uint64_t metadata_ref = (f.error() == 0 && f.result() != nullptr) ? registerStorageMetadata(*f.result()) : 0;
		callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" }, metadata_ref);
	});
	return 1.0;
}

// callback(error_code: real, error_message: string, metadata_ref: uint64)
double firebase_storage_ref_update_metadata(uint64_t ref, uint64_t metadata_ref, const std::optional<GMFunction>& callback)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return 0.0;

	firebase::storage::Metadata* metadata = resolveMetadata(metadata_ref);
	if (metadata == nullptr) return 0.0;

	self->UpdateMetadata(*metadata).OnCompletion([callback](const firebase::Future<firebase::storage::Metadata>& f)
	{
		reportFutureError(f.error(), f.error_message());
		if (!callback.has_value()) return;
		uint64_t out_ref = (f.error() == 0 && f.result() != nullptr) ? registerStorageMetadata(*f.result()) : 0;
		callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" }, out_ref);
	});
	return 1.0;
}

// callback(error_code: real, error_message: string, metadata_ref: uint64).
// metadata_ref/controller_ref: 0 means "not provided" (see
// resolveOptionalMetadata/resolveOptionalController above).
double firebase_storage_ref_put_bytes(uint64_t ref, GMBuffer data, uint64_t metadata_ref,
	const std::optional<GMFunction>& progress_callback, uint64_t controller_ref,
	const std::optional<GMFunction>& callback)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return 0.0;

	firebase::storage::Metadata* metadata = resolveOptionalMetadata(metadata_ref);
	firebase::storage::Controller* controller = resolveOptionalController(controller_ref);
	GMFirebaseStorageListener* listener = makeOptionalListener(progress_callback);

	firebase::Future<firebase::storage::Metadata> future = (metadata != nullptr)
		? self->PutBytes(data.data(), data.length(), *metadata, listener, controller)
		: self->PutBytes(data.data(), data.length(), listener, controller);

	future.OnCompletion([callback, listener](const firebase::Future<firebase::storage::Metadata>& f)
	{
		reportFutureError(f.error(), f.error_message());
		delete listener;
		if (!callback.has_value()) return;
		uint64_t out_ref = (f.error() == 0 && f.result() != nullptr) ? registerStorageMetadata(*f.result()) : 0;
		callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" }, out_ref);
	});
	return 1.0;
}

// callback(error_code: real, error_message: string, metadata_ref: uint64)
double firebase_storage_ref_put_file(uint64_t ref, std::string_view local_path, uint64_t metadata_ref,
	const std::optional<GMFunction>& progress_callback, uint64_t controller_ref,
	const std::optional<GMFunction>& callback)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return 0.0;

	firebase::storage::Metadata* metadata = resolveOptionalMetadata(metadata_ref);
	firebase::storage::Controller* controller = resolveOptionalController(controller_ref);
	GMFirebaseStorageListener* listener = makeOptionalListener(progress_callback);
	std::string path(local_path);

	firebase::Future<firebase::storage::Metadata> future = (metadata != nullptr)
		? self->PutFile(path.c_str(), *metadata, listener, controller)
		: self->PutFile(path.c_str(), listener, controller);

	future.OnCompletion([callback, listener](const firebase::Future<firebase::storage::Metadata>& f)
	{
		reportFutureError(f.error(), f.error_message());
		delete listener;
		if (!callback.has_value()) return;
		uint64_t out_ref = (f.error() == 0 && f.result() != nullptr) ? registerStorageMetadata(*f.result()) : 0;
		callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" }, out_ref);
	});
	return 1.0;
}

// data: a GML buffer pre-sized to the maximum number of bytes to download;
// the SDK writes directly into it (Storage::GetBytes(void* buffer,
// buffer_size, ...) convention - no separate copy step needed).
// callback(error_code: real, error_message: string, bytes_read: real)
double firebase_storage_ref_get_bytes(uint64_t ref, GMBuffer data,
	const std::optional<GMFunction>& progress_callback, uint64_t controller_ref,
	const std::optional<GMFunction>& callback)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return 0.0;

	firebase::storage::Controller* controller = resolveOptionalController(controller_ref);
	GMFirebaseStorageListener* listener = makeOptionalListener(progress_callback);

	self->GetBytes(data.data(), data.length(), listener, controller)
		.OnCompletion([callback, listener](const firebase::Future<size_t>& f)
	{
		reportFutureError(f.error(), f.error_message());
		delete listener;
		if (!callback.has_value()) return;
		double bytes_read = (f.error() == 0 && f.result() != nullptr) ? static_cast<double>(*f.result()) : 0.0;
		callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" }, bytes_read);
	});
	return 1.0;
}

// callback(error_code: real, error_message: string, bytes_read: real)
double firebase_storage_ref_get_file(uint64_t ref, std::string_view local_path,
	const std::optional<GMFunction>& progress_callback, uint64_t controller_ref,
	const std::optional<GMFunction>& callback)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return 0.0;

	firebase::storage::Controller* controller = resolveOptionalController(controller_ref);
	GMFirebaseStorageListener* listener = makeOptionalListener(progress_callback);
	std::string path(local_path);

	self->GetFile(path.c_str(), listener, controller)
		.OnCompletion([callback, listener](const firebase::Future<size_t>& f)
	{
		reportFutureError(f.error(), f.error_message());
		delete listener;
		if (!callback.has_value()) return;
		double bytes_read = (f.error() == 0 && f.result() != nullptr) ? static_cast<double>(*f.result()) : 0.0;
		callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" }, bytes_read);
	});
	return 1.0;
}

// page_token: pass an empty string for "first page".
// callback(error_code: real, error_message: string, list_result_ref: uint64)
double firebase_storage_ref_list(uint64_t ref, double max_results, std::string_view page_token, const std::optional<GMFunction>& callback)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return 0.0;

	std::string token(page_token);
	const char* token_ptr = token.empty() ? nullptr : token.c_str();

	self->List(static_cast<int>(max_results), token_ptr)
		.OnCompletion([callback](const firebase::Future<firebase::storage::StorageListResult>& f)
	{
		reportFutureError(f.error(), f.error_message());
		if (!callback.has_value()) return;
		uint64_t out_ref = (f.error() == 0 && f.result() != nullptr) ? registerStorageListResult(*f.result()) : 0;
		callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" }, out_ref);
	});
	return 1.0;
}

// ============================================================
// Metadata
// ============================================================

uint64_t firebase_storage_metadata_create()
{
	return registerStorageMetadata(firebase::storage::Metadata());
}

double firebase_storage_metadata_release(uint64_t ref)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return 0.0;
	return unregisterFirebaseValue(gm_fb_ref_id(ref), g_firebase_storage_metadata_map) ? 1.0 : 0.0;
}

double firebase_storage_metadata_is_valid(uint64_t ref)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return 0.0;
	return self->is_valid() ? 1.0 : 0.0;
}

std::string firebase_storage_metadata_bucket(uint64_t ref)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return std::string();
	const char* value = self->bucket();
	return value ? std::string(value) : std::string();
}

std::string firebase_storage_metadata_cache_control(uint64_t ref)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return std::string();
	const char* value = self->cache_control();
	return value ? std::string(value) : std::string();
}

void firebase_storage_metadata_set_cache_control(uint64_t ref, std::string_view value)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return;
	self->set_cache_control(std::string(value).c_str());
}

std::string firebase_storage_metadata_content_disposition(uint64_t ref)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return std::string();
	const char* value = self->content_disposition();
	return value ? std::string(value) : std::string();
}

void firebase_storage_metadata_set_content_disposition(uint64_t ref, std::string_view value)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return;
	self->set_content_disposition(std::string(value).c_str());
}

std::string firebase_storage_metadata_content_encoding(uint64_t ref)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return std::string();
	const char* value = self->content_encoding();
	return value ? std::string(value) : std::string();
}

void firebase_storage_metadata_set_content_encoding(uint64_t ref, std::string_view value)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return;
	self->set_content_encoding(std::string(value).c_str());
}

std::string firebase_storage_metadata_content_language(uint64_t ref)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return std::string();
	const char* value = self->content_language();
	return value ? std::string(value) : std::string();
}

void firebase_storage_metadata_set_content_language(uint64_t ref, std::string_view value)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return;
	self->set_content_language(std::string(value).c_str());
}

std::string firebase_storage_metadata_content_type(uint64_t ref)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return std::string();
	const char* value = self->content_type();
	return value ? std::string(value) : std::string();
}

void firebase_storage_metadata_set_content_type(uint64_t ref, std::string_view value)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return;
	self->set_content_type(std::string(value).c_str());
}

double firebase_storage_metadata_creation_time(uint64_t ref)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return 0.0;
	return static_cast<double>(self->creation_time());
}

double firebase_storage_metadata_generation(uint64_t ref)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return 0.0;
	return static_cast<double>(self->generation());
}

double firebase_storage_metadata_metadata_generation(uint64_t ref)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return 0.0;
	return static_cast<double>(self->metadata_generation());
}

std::string firebase_storage_metadata_name(uint64_t ref)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return std::string();
	const char* value = self->name();
	return value ? std::string(value) : std::string();
}

std::string firebase_storage_metadata_path(uint64_t ref)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return std::string();
	const char* value = self->path();
	return value ? std::string(value) : std::string();
}

uint64_t firebase_storage_metadata_get_reference(uint64_t ref)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return 0;
	return registerStorageReference(self->GetReference());
}

double firebase_storage_metadata_size_bytes(uint64_t ref)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return 0.0;
	return static_cast<double>(self->size_bytes());
}

double firebase_storage_metadata_updated_time(uint64_t ref)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return 0.0;
	return static_cast<double>(self->updated_time());
}

double firebase_storage_metadata_custom_metadata_count(uint64_t ref)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return 0.0;
	std::map<std::string, std::string>* custom = self->custom_metadata();
	return custom ? static_cast<double>(custom->size()) : 0.0;
}

std::string firebase_storage_metadata_custom_metadata_key_at(uint64_t ref, double index)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return std::string();
	std::map<std::string, std::string>* custom = self->custom_metadata();
	if (custom == nullptr) return std::string();

	size_t i = static_cast<size_t>(index);
	if (i >= custom->size()) return std::string();

	auto it = custom->begin();
	std::advance(it, i);
	return it->first;
}

std::string firebase_storage_metadata_get_custom_metadata(uint64_t ref, std::string_view key)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return std::string();
	std::map<std::string, std::string>* custom = self->custom_metadata();
	if (custom == nullptr) return std::string();

	auto it = custom->find(std::string(key));
	return it != custom->end() ? it->second : std::string();
}

void firebase_storage_metadata_set_custom_metadata(uint64_t ref, std::string_view key, std::string_view value)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return;
	std::map<std::string, std::string>* custom = self->custom_metadata();
	if (custom == nullptr) return;
	(*custom)[std::string(key)] = std::string(value);
}

// ============================================================
// Controller
// ============================================================

uint64_t firebase_storage_controller_create()
{
	return packFirebaseRef(registerFirebaseValue(firebase::storage::Controller(), g_firebase_storage_controller_index, g_firebase_storage_controller_map), GM_FB_TYPE_STORAGE_CONTROLLER);
}

double firebase_storage_controller_release(uint64_t ref)
{
	firebase::storage::Controller* self = resolveController(ref);
	if (self == nullptr) return 0.0;
	return unregisterFirebaseValue(gm_fb_ref_id(ref), g_firebase_storage_controller_map) ? 1.0 : 0.0;
}

double firebase_storage_controller_is_valid(uint64_t ref)
{
	firebase::storage::Controller* self = resolveController(ref);
	if (self == nullptr) return 0.0;
	return self->is_valid() ? 1.0 : 0.0;
}

double firebase_storage_controller_pause(uint64_t ref)
{
	firebase::storage::Controller* self = resolveController(ref);
	if (self == nullptr) return 0.0;
	return self->Pause() ? 1.0 : 0.0;
}

double firebase_storage_controller_resume(uint64_t ref)
{
	firebase::storage::Controller* self = resolveController(ref);
	if (self == nullptr) return 0.0;
	return self->Resume() ? 1.0 : 0.0;
}

double firebase_storage_controller_cancel(uint64_t ref)
{
	firebase::storage::Controller* self = resolveController(ref);
	if (self == nullptr) return 0.0;
	return self->Cancel() ? 1.0 : 0.0;
}

double firebase_storage_controller_is_paused(uint64_t ref)
{
	firebase::storage::Controller* self = resolveController(ref);
	if (self == nullptr) return 0.0;
	return self->is_paused() ? 1.0 : 0.0;
}

double firebase_storage_controller_bytes_transferred(uint64_t ref)
{
	firebase::storage::Controller* self = resolveController(ref);
	if (self == nullptr) return 0.0;
	return static_cast<double>(self->bytes_transferred());
}

double firebase_storage_controller_total_byte_count(uint64_t ref)
{
	firebase::storage::Controller* self = resolveController(ref);
	if (self == nullptr) return 0.0;
	return static_cast<double>(self->total_byte_count());
}

uint64_t firebase_storage_controller_get_reference(uint64_t ref)
{
	firebase::storage::Controller* self = resolveController(ref);
	if (self == nullptr) return 0;
	return registerStorageReference(self->GetReference());
}

// ============================================================
// StorageListResult
// ============================================================

double firebase_storage_list_result_release(uint64_t ref)
{
	firebase::storage::StorageListResult* self = resolveListResult(ref);
	if (self == nullptr) return 0.0;
	return unregisterFirebaseValue(gm_fb_ref_id(ref), g_firebase_storage_list_result_map) ? 1.0 : 0.0;
}

double firebase_storage_list_result_is_valid(uint64_t ref)
{
	firebase::storage::StorageListResult* self = resolveListResult(ref);
	if (self == nullptr) return 0.0;
	return self->is_valid() ? 1.0 : 0.0;
}

double firebase_storage_list_result_item_count(uint64_t ref)
{
	firebase::storage::StorageListResult* self = resolveListResult(ref);
	if (self == nullptr) return 0.0;
	return static_cast<double>(self->items().size());
}

uint64_t firebase_storage_list_result_item_at(uint64_t ref, double index)
{
	firebase::storage::StorageListResult* self = resolveListResult(ref);
	if (self == nullptr) return 0;
	const std::vector<firebase::storage::StorageReference>& items = self->items();
	size_t i = static_cast<size_t>(index);
	if (i >= items.size()) return 0;
	return registerStorageReference(items[i]);
}

double firebase_storage_list_result_prefix_count(uint64_t ref)
{
	firebase::storage::StorageListResult* self = resolveListResult(ref);
	if (self == nullptr) return 0.0;
	return static_cast<double>(self->prefixes().size());
}

uint64_t firebase_storage_list_result_prefix_at(uint64_t ref, double index)
{
	firebase::storage::StorageListResult* self = resolveListResult(ref);
	if (self == nullptr) return 0;
	const std::vector<firebase::storage::StorageReference>& prefixes = self->prefixes();
	size_t i = static_cast<size_t>(index);
	if (i >= prefixes.size()) return 0;
	return registerStorageReference(prefixes[i]);
}

std::string firebase_storage_list_result_next_page_token(uint64_t ref)
{
	firebase::storage::StorageListResult* self = resolveListResult(ref);
	if (self == nullptr) return std::string();
	return self->next_page_token();
}
