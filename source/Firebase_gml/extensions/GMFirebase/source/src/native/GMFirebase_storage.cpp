#include "GMFirebase_storage.h"
#include <algorithm>
#include <cstring>
#include <iterator>
#include <memory>
#include <vector>

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

// FirebaseStorageError mirrors firebase::storage::Error, the error_code every
// reference operation's callback receives. See GM_FB_PIN_ENUM in GMFirebase_common.h.
GM_FB_PIN_ENUM(FirebaseStorageError::None, firebase::storage::kErrorNone);
GM_FB_PIN_ENUM(FirebaseStorageError::Unknown, firebase::storage::kErrorUnknown);
GM_FB_PIN_ENUM(FirebaseStorageError::ObjectNotFound, firebase::storage::kErrorObjectNotFound);
GM_FB_PIN_ENUM(FirebaseStorageError::BucketNotFound, firebase::storage::kErrorBucketNotFound);
GM_FB_PIN_ENUM(FirebaseStorageError::ProjectNotFound, firebase::storage::kErrorProjectNotFound);
GM_FB_PIN_ENUM(FirebaseStorageError::QuotaExceeded, firebase::storage::kErrorQuotaExceeded);
GM_FB_PIN_ENUM(FirebaseStorageError::Unauthenticated, firebase::storage::kErrorUnauthenticated);
GM_FB_PIN_ENUM(FirebaseStorageError::Unauthorized, firebase::storage::kErrorUnauthorized);
GM_FB_PIN_ENUM(FirebaseStorageError::RetryLimitExceeded, firebase::storage::kErrorRetryLimitExceeded);
GM_FB_PIN_ENUM(FirebaseStorageError::NonMatchingChecksum, firebase::storage::kErrorNonMatchingChecksum);
GM_FB_PIN_ENUM(FirebaseStorageError::DownloadSizeExceeded, firebase::storage::kErrorDownloadSizeExceeded);
GM_FB_PIN_ENUM(FirebaseStorageError::Cancelled, firebase::storage::kErrorCancelled);

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

// A completed GetBytes, held until the game copies it out and releases it
// (firebase_storage_download_copy / _release). The bytes are the vector the
// SDK downloaded into, shared so registering moves no data.
using StorageDownload = std::shared_ptr<std::vector<std::uint8_t>>;
std::map<uint32_t, StorageDownload> g_firebase_storage_download_map;
uint32_t g_firebase_storage_download_index = 0;

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

	StorageDownload* resolveDownload(uint64_t ref)
	{
		StorageDownload* out = nullptr;
		validate_fb_ref_map(ref, GM_FB_TYPE_STORAGE_DOWNLOAD, StorageDownload, g_firebase_storage_download_map, out);
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
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_storage: no firebase::App - call firebase_app_initialize() first");
		return 0;
	}

	firebase::storage::Storage* storage = firebase::storage::Storage::GetInstance(app);
	if (storage == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_storage: Storage::GetInstance() returned null");
		return 0;
	}

	return registerFirebasePointer(storage, GM_FB_TYPE_STORAGE);
}

uint64_t firebase_storage_get_instance_with_url(std::string_view url)
{
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_storage: no firebase::App - call firebase_app_initialize() first");
		return 0;
	}

	firebase::storage::Storage* storage = firebase::storage::Storage::GetInstance(app, std::string(url).c_str());
	if (storage == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_storage: Storage::GetInstance(url) returned null");
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

// On desktop the SDK's retry thread keeps reading the reference it was started
// on, so a ref stays registered until the callback of any operation started on
// it has fired; Android and iOS only hold the future.
void firebase_storage_ref_release(uint64_t ref)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return;
	unregisterFirebaseValue(gm_fb_ref_id(ref), g_firebase_storage_ref_map);
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

bool firebase_storage_ref_is_valid(uint64_t ref)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return false;
	return self->is_valid();
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
FirebaseError firebase_storage_ref_delete(uint64_t ref, const std::optional<GMFunction>& callback)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return FirebaseError::InvalidHandle;

	firebase::Future<void> future = self->Delete();
	if (!firebaseFutureArmed(future, "firebase_storage_ref_delete")) return FirebaseError::InvalidHandle;
	future.OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

// callback(error_code: real, error_message: string, url: string)
FirebaseError firebase_storage_ref_get_download_url(uint64_t ref, const std::optional<GMFunction>& callback)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return FirebaseError::InvalidHandle;

	firebase::Future<std::string> future = self->GetDownloadUrl();
	if (!firebaseFutureArmed(future, "firebase_storage_ref_get_download_url")) return FirebaseError::InvalidHandle;
	future.OnCompletion([callback](const firebase::Future<std::string>& f)
	{
		completeFuture(callback, f, [](const std::string& url) { return std::string_view{ url }; });
	});
	return FirebaseError::Ok;
}

// callback(error_code: real, error_message: string, metadata_ref: uint64)
FirebaseError firebase_storage_ref_get_metadata(uint64_t ref, const std::optional<GMFunction>& callback)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return FirebaseError::InvalidHandle;

	firebase::Future<firebase::storage::Metadata> future = self->GetMetadata();
	if (!firebaseFutureArmed(future, "firebase_storage_ref_get_metadata")) return FirebaseError::InvalidHandle;
	future.OnCompletion([callback](const firebase::Future<firebase::storage::Metadata>& f)
	{
		completeFuture(callback, f, registerStorageMetadata);
	});
	return FirebaseError::Ok;
}

// callback(error_code: real, error_message: string, metadata_ref: uint64)
FirebaseError firebase_storage_ref_update_metadata(uint64_t ref, uint64_t metadata_ref, const std::optional<GMFunction>& callback)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return FirebaseError::InvalidHandle;

	firebase::storage::Metadata* metadata = resolveMetadata(metadata_ref);
	if (metadata == nullptr) return FirebaseError::InvalidHandle;

	firebase::Future<firebase::storage::Metadata> future = self->UpdateMetadata(*metadata);
	if (!firebaseFutureArmed(future, "firebase_storage_ref_update_metadata")) return FirebaseError::InvalidHandle;
	future.OnCompletion([callback](const firebase::Future<firebase::storage::Metadata>& f)
	{
		completeFuture(callback, f, registerStorageMetadata);
	});
	return FirebaseError::Ok;
}

// callback(error_code: real, error_message: string, metadata_ref: uint64).
// metadata_ref/controller_ref: 0 means "not provided" (see
// resolveOptionalMetadata/resolveOptionalController above).
FirebaseError firebase_storage_ref_put_bytes(uint64_t ref, GMBuffer data, uint64_t metadata_ref,
	const std::optional<GMFunction>& progress_callback, uint64_t controller_ref,
	const std::optional<GMFunction>& callback)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return FirebaseError::InvalidHandle;

	firebase::storage::Metadata* metadata = resolveOptionalMetadata(metadata_ref);
	firebase::storage::Controller* controller = resolveOptionalController(controller_ref);
	GMFirebaseStorageListener* listener = makeOptionalListener(progress_callback);

	// The SDK reads the pointer for the whole transfer and copies nothing,
	// so the bytes are copied out of the GML buffer here and owned by the
	// completion lambda. Shared rather than captured by value: OnCompletion
	// takes a std::function, whose copies would move the bytes out from
	// under the pointer the SDK holds.
	const auto* p = static_cast<const std::uint8_t*>(data.data());
	auto bytes = std::make_shared<std::vector<std::uint8_t>>(p, p + data.length());

	firebase::Future<firebase::storage::Metadata> future = (metadata != nullptr)
		? self->PutBytes(bytes->data(), bytes->size(), *metadata, listener, controller)
		: self->PutBytes(bytes->data(), bytes->size(), listener, controller);

	if (!firebaseFutureArmed(future, "firebase_storage_ref_put_bytes"))
	{
		delete listener;
		return FirebaseError::InvalidHandle;
	}
	future.OnCompletion([callback, listener, bytes](const firebase::Future<firebase::storage::Metadata>& f)
	{
		delete listener;
		completeFuture(callback, f, registerStorageMetadata);
	});
	return FirebaseError::Ok;
}

// callback(error_code: real, error_message: string, metadata_ref: uint64)
FirebaseError firebase_storage_ref_put_file(uint64_t ref, std::string_view local_path, uint64_t metadata_ref,
	const std::optional<GMFunction>& progress_callback, uint64_t controller_ref,
	const std::optional<GMFunction>& callback)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return FirebaseError::InvalidHandle;

	firebase::storage::Metadata* metadata = resolveOptionalMetadata(metadata_ref);
	firebase::storage::Controller* controller = resolveOptionalController(controller_ref);
	GMFirebaseStorageListener* listener = makeOptionalListener(progress_callback);
	std::string path(local_path);

	firebase::Future<firebase::storage::Metadata> future = (metadata != nullptr)
		? self->PutFile(path.c_str(), *metadata, listener, controller)
		: self->PutFile(path.c_str(), listener, controller);

	if (!firebaseFutureArmed(future, "firebase_storage_ref_put_file"))
	{
		delete listener;
		return FirebaseError::InvalidHandle;
	}
	future.OnCompletion([callback, listener](const firebase::Future<firebase::storage::Metadata>& f)
	{
		delete listener;
		completeFuture(callback, f, registerStorageMetadata);
	});
	return FirebaseError::Ok;
}

// The SDK writes into a buffer that must outlive the transfer, so the
// download lands in native memory of max_size bytes (an object larger than
// that fails with kErrorDownloadSizeExceeded, the SDK's own rule) and is
// handed to GML as a download handle to copy out of and release.
// callback(error_code: real, error_message: string, download_ref: uint64, size: real)
FirebaseError firebase_storage_ref_get_bytes(uint64_t ref, double max_size,
	const std::optional<GMFunction>& progress_callback, uint64_t controller_ref,
	const std::optional<GMFunction>& callback)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return FirebaseError::InvalidHandle;

	if (!(max_size >= 1.0))
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_storage_ref_get_bytes: max_size must be at least 1");
		return FirebaseError::InvalidArgument;
	}

	firebase::storage::Controller* controller = resolveOptionalController(controller_ref);
	GMFirebaseStorageListener* listener = makeOptionalListener(progress_callback);
	auto bytes = std::make_shared<std::vector<std::uint8_t>>(static_cast<size_t>(max_size));

	firebase::Future<size_t> future = self->GetBytes(bytes->data(), bytes->size(), listener, controller);
	if (!firebaseFutureArmed(future, "firebase_storage_ref_get_bytes"))
	{
		delete listener;
		return FirebaseError::InvalidHandle;
	}
	future.OnCompletion([callback, listener, bytes](const firebase::Future<size_t>& f)
	{
		delete listener;
		if (!callback.has_value()) return;

		uint64_t download_ref = 0;
		double size = 0.0;
		if (f.error() == 0 && f.result() != nullptr)
		{
			bytes->resize(*f.result());
			size = static_cast<double>(bytes->size());
			download_ref = packFirebaseRef(registerFirebaseValue(bytes, g_firebase_storage_download_index, g_firebase_storage_download_map), GM_FB_TYPE_STORAGE_DOWNLOAD);
		}
		callback->call(static_cast<double>(f.error()), futureErrorMessage(f), download_ref, size);
	});
	return FirebaseError::Ok;
}

double firebase_storage_download_copy(uint64_t download_ref, GMBuffer out_buffer)
{
	StorageDownload* self = resolveDownload(download_ref);
	if (self == nullptr) return 0.0;

	const std::vector<std::uint8_t>& bytes = **self;
	size_t n = std::min<size_t>(bytes.size(), static_cast<size_t>(out_buffer.length()));
	if (n) std::memcpy(out_buffer.data(), bytes.data(), n);
	return static_cast<double>(n);
}

void firebase_storage_download_release(uint64_t download_ref)
{
	StorageDownload* self = resolveDownload(download_ref);
	if (self == nullptr) return;
	unregisterFirebaseValue(gm_fb_ref_id(download_ref), g_firebase_storage_download_map);
}

// callback(error_code: real, error_message: string, bytes_read: real)
FirebaseError firebase_storage_ref_get_file(uint64_t ref, std::string_view local_path,
	const std::optional<GMFunction>& progress_callback, uint64_t controller_ref,
	const std::optional<GMFunction>& callback)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return FirebaseError::InvalidHandle;

	firebase::storage::Controller* controller = resolveOptionalController(controller_ref);
	GMFirebaseStorageListener* listener = makeOptionalListener(progress_callback);
	std::string path(local_path);

	firebase::Future<size_t> future = self->GetFile(path.c_str(), listener, controller);
	if (!firebaseFutureArmed(future, "firebase_storage_ref_get_file"))
	{
		delete listener;
		return FirebaseError::InvalidHandle;
	}
	future.OnCompletion([callback, listener](const firebase::Future<size_t>& f)
	{
		delete listener;
		completeFuture(callback, f, [](size_t bytes_read) { return static_cast<double>(bytes_read); });
	});
	return FirebaseError::Ok;
}

// page_token: pass an empty string for "first page".
// callback(error_code: real, error_message: string, list_result_ref: uint64)
FirebaseError firebase_storage_ref_list(uint64_t ref, double max_results, std::string_view page_token, const std::optional<GMFunction>& callback)
{
	firebase::storage::StorageReference* self = resolveStorageRef(ref);
	if (self == nullptr) return FirebaseError::InvalidHandle;

	std::string token(page_token);
	const char* token_ptr = token.empty() ? nullptr : token.c_str();

	firebase::Future<firebase::storage::StorageListResult> future = self->List(static_cast<int>(max_results), token_ptr);
	if (!firebaseFutureArmed(future, "firebase_storage_ref_list")) return FirebaseError::InvalidHandle;
	future.OnCompletion([callback](const firebase::Future<firebase::storage::StorageListResult>& f)
	{
		completeFuture(callback, f, registerStorageListResult);
	});
	return FirebaseError::Ok;
}

// ============================================================
// Metadata
// ============================================================

uint64_t firebase_storage_metadata_create()
{
	return registerStorageMetadata(firebase::storage::Metadata());
}

void firebase_storage_metadata_release(uint64_t ref)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return;
	unregisterFirebaseValue(gm_fb_ref_id(ref), g_firebase_storage_metadata_map);
}

bool firebase_storage_metadata_is_valid(uint64_t ref)
{
	firebase::storage::Metadata* self = resolveMetadata(ref);
	if (self == nullptr) return false;
	return self->is_valid();
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

void firebase_storage_controller_release(uint64_t ref)
{
	firebase::storage::Controller* self = resolveController(ref);
	if (self == nullptr) return;
	unregisterFirebaseValue(gm_fb_ref_id(ref), g_firebase_storage_controller_map);
}

bool firebase_storage_controller_is_valid(uint64_t ref)
{
	firebase::storage::Controller* self = resolveController(ref);
	if (self == nullptr) return false;
	return self->is_valid();
}

bool firebase_storage_controller_pause(uint64_t ref)
{
	firebase::storage::Controller* self = resolveController(ref);
	if (self == nullptr) return false;
	return self->Pause();
}

bool firebase_storage_controller_resume(uint64_t ref)
{
	firebase::storage::Controller* self = resolveController(ref);
	if (self == nullptr) return false;
	return self->Resume();
}

bool firebase_storage_controller_cancel(uint64_t ref)
{
	firebase::storage::Controller* self = resolveController(ref);
	if (self == nullptr) return false;
	return self->Cancel();
}

bool firebase_storage_controller_is_paused(uint64_t ref)
{
	firebase::storage::Controller* self = resolveController(ref);
	if (self == nullptr) return false;
	return self->is_paused();
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

void firebase_storage_list_result_release(uint64_t ref)
{
	firebase::storage::StorageListResult* self = resolveListResult(ref);
	if (self == nullptr) return;
	unregisterFirebaseValue(gm_fb_ref_id(ref), g_firebase_storage_list_result_map);
}

bool firebase_storage_list_result_is_valid(uint64_t ref)
{
	firebase::storage::StorageListResult* self = resolveListResult(ref);
	if (self == nullptr) return false;
	return self->is_valid();
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

std::string firebase_storage_metadata_md5_hash(uint64_t ref)
{
    firebase::storage::Metadata* metadata = resolveMetadata(ref);
    if (metadata == nullptr) return std::string();
    const char* value = metadata->md5_hash();
    return value ? std::string(value) : std::string();
}

uint64_t firebase_storage_get_app(uint64_t storage_ref)
{
    auto* storage = resolveStorage(storage_ref); return storage ? wrapFirebaseApp(storage->app()) : 0;
}

uint64_t firebase_storage_get_instance_for_app(uint64_t app_ref)
{
    auto* app = resolveFirebaseApp(app_ref); if (!app) return 0;
    firebase::InitResult result = firebase::kInitResultSuccess;
    auto* storage = firebase::storage::Storage::GetInstance(app, &result);
    if (!storage || result != firebase::kInitResultSuccess) { setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, firebaseInitResultMessage("failed to get Storage instance for app", result)); return 0; }
    return registerFirebasePointer(storage, GM_FB_TYPE_STORAGE);
}

uint64_t firebase_storage_get_instance_for_app_url(uint64_t app_ref, std::string_view url)
{
    auto* app = resolveFirebaseApp(app_ref); if (!app) return 0;
    std::string u(url); firebase::InitResult result = firebase::kInitResultSuccess;
    auto* storage = firebase::storage::Storage::GetInstance(app, u.c_str(), &result);
    if (!storage || result != firebase::kInitResultSuccess) { setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, firebaseInitResultMessage("failed to get Storage instance for app/url", result)); return 0; }
    return registerFirebasePointer(storage, GM_FB_TYPE_STORAGE);
}
