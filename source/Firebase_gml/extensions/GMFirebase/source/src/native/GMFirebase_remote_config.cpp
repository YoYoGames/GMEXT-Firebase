#include "GMFirebase_remote_config.h"
#include <algorithm>
#include <cmath>
#include <cstring>

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

// The four Remote Config enums mirror firebase::remote_config's. See
// GM_FB_PIN_ENUM in GMFirebase_common.h.
GM_FB_PIN_ENUM(FirebaseRemoteConfigLastFetchStatus::Success, firebase::remote_config::kLastFetchStatusSuccess);
GM_FB_PIN_ENUM(FirebaseRemoteConfigLastFetchStatus::Failure, firebase::remote_config::kLastFetchStatusFailure);
GM_FB_PIN_ENUM(FirebaseRemoteConfigLastFetchStatus::Pending, firebase::remote_config::kLastFetchStatusPending);
GM_FB_PIN_ENUM(FirebaseRemoteConfigFetchFailureReason::Invalid, firebase::remote_config::kFetchFailureReasonInvalid);
GM_FB_PIN_ENUM(FirebaseRemoteConfigFetchFailureReason::Throttled, firebase::remote_config::kFetchFailureReasonThrottled);
GM_FB_PIN_ENUM(FirebaseRemoteConfigFetchFailureReason::Error, firebase::remote_config::kFetchFailureReasonError);
GM_FB_PIN_ENUM(FirebaseRemoteConfigValueSource::StaticValue, firebase::remote_config::kValueSourceStaticValue);
GM_FB_PIN_ENUM(FirebaseRemoteConfigValueSource::RemoteValue, firebase::remote_config::kValueSourceRemoteValue);
GM_FB_PIN_ENUM(FirebaseRemoteConfigValueSource::DefaultValue, firebase::remote_config::kValueSourceDefaultValue);
GM_FB_PIN_ENUM(FirebaseRemoteConfigError::Unimplemented, firebase::remote_config::kRemoteConfigErrorUnimplemented);
GM_FB_PIN_ENUM(FirebaseRemoteConfigError::None, firebase::remote_config::kRemoteConfigErrorNone);
GM_FB_PIN_ENUM(FirebaseRemoteConfigError::ConfigUpdateStreamError, firebase::remote_config::kRemoteConfigErrorConfigUpdateStreamError);
GM_FB_PIN_ENUM(FirebaseRemoteConfigError::ConfigUpdateMessageInvalid, firebase::remote_config::kRemoteConfigErrorConfigUpdateMessageInvalid);
GM_FB_PIN_ENUM(FirebaseRemoteConfigError::ConfigUpdateNotFetched, firebase::remote_config::kRemoteConfigErrorConfigUpdateNotFetched);
GM_FB_PIN_ENUM(FirebaseRemoteConfigError::ConfigUpdateUnavailable, firebase::remote_config::kRemoteConfigErrorConfigUpdateUnavailable);

namespace
{
	firebase::remote_config::RemoteConfig* resolveRemoteConfig(uint64_t rc_ref)
	{
		firebase::remote_config::RemoteConfig* out = nullptr;
		validate_fb_ref_ptr(rc_ref, GM_FB_TYPE_REMOTE_CONFIG, firebase::remote_config::RemoteConfig, out);
		return out;
	}

	firebase::remote_config::ConfigUpdateListenerRegistration* resolveListenerReg(uint64_t reg_ref)
	{
		firebase::remote_config::ConfigUpdateListenerRegistration* out = nullptr;
		validate_fb_ref_ptr(reg_ref, GM_FB_TYPE_RC_LISTENER_REG, firebase::remote_config::ConfigUpdateListenerRegistration, out);
		return out;
	}

	// The SDK takes these as uint64_t; a negative or non-finite double cast to
	// one is undefined behaviour and in practice lands near 2^64, which would
	// disable fetching for the whole session with nothing logged.
	bool toUnsigned64(double value, const char* function, const char* what, uint64_t& out)
	{
		if (!std::isfinite(value) || value < 0.0 || value >= 18446744073709551616.0)
		{
			setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, std::string(function) + ": " + what + " must be a non-negative number");
			return false;
		}
		out = static_cast<uint64_t>(value);
		return true;
	}

	// The config-update stream reports a bare RemoteConfigError with no text
	// of its own, so the listener names the value itself.
	const char* remoteConfigErrorMessage(firebase::remote_config::RemoteConfigError error)
	{
		switch (error)
		{
		case firebase::remote_config::kRemoteConfigErrorNone: return "";
		case firebase::remote_config::kRemoteConfigErrorUnimplemented: return "real-time config updates are not implemented on this platform";
		case firebase::remote_config::kRemoteConfigErrorConfigUpdateStreamError: return "unable to connect to the Remote Config backend";
		case firebase::remote_config::kRemoteConfigErrorConfigUpdateMessageInvalid: return "the config update message was unparsable";
		case firebase::remote_config::kRemoteConfigErrorConfigUpdateNotFetched: return "unable to fetch the latest version of the config";
		case firebase::remote_config::kRemoteConfigErrorConfigUpdateUnavailable: return "the real-time config update service is unavailable";
		default: return "unknown Remote Config error";
		}
	}

	FirebaseRemoteConfigInfo toGmInfo(const firebase::remote_config::ConfigInfo& info)
	{
		FirebaseRemoteConfigInfo out;
		out.fetch_time = static_cast<double>(info.fetch_time);
		out.last_fetch_status = static_cast<FirebaseRemoteConfigLastFetchStatus>(info.last_fetch_status);
		out.last_fetch_failure_reason = static_cast<FirebaseRemoteConfigFetchFailureReason>(info.last_fetch_failure_reason);
		out.throttled_end_time = static_cast<double>(info.throttled_end_time);
		return out;
	}

}

// ============================================================
// RemoteConfig instance
// ============================================================

uint64_t firebase_remote_config_get_instance()
{
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_remote_config: no firebase::App - call firebase_app_initialize() first");
		return 0;
	}

	firebase::remote_config::RemoteConfig* rc = firebase::remote_config::RemoteConfig::GetInstance(app);
	if (rc == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_remote_config: RemoteConfig::GetInstance() returned null");
		return 0;
	}

	return registerFirebasePointer(rc, GM_FB_TYPE_REMOTE_CONFIG);
}

// callback(error_code: real, error_message: string)
FirebaseError firebase_remote_config_ensure_initialized(uint64_t rc_ref, const std::optional<GMFunction>& callback)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return FirebaseError::InvalidHandle;

	rc->EnsureInitialized().OnCompletion([callback](const firebase::Future<firebase::remote_config::ConfigInfo>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

// callback(error_code: real, error_message: string)
FirebaseError firebase_remote_config_set_config_settings(uint64_t rc_ref, double fetch_timeout_ms, double minimum_fetch_interval_ms, const std::optional<GMFunction>& callback)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return FirebaseError::InvalidHandle;

	firebase::remote_config::ConfigSettings settings;
	if (!toUnsigned64(fetch_timeout_ms, "firebase_remote_config_set_config_settings", "fetch_timeout_ms", settings.fetch_timeout_in_milliseconds)
		|| !toUnsigned64(minimum_fetch_interval_ms, "firebase_remote_config_set_config_settings", "minimum_fetch_interval_ms", settings.minimum_fetch_interval_in_milliseconds))
		return FirebaseError::InvalidArgument;

	rc->SetConfigSettings(settings).OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

double firebase_remote_config_get_config_settings_fetch_timeout(uint64_t rc_ref)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return 0.0;
	return static_cast<double>(rc->GetConfigSettings().fetch_timeout_in_milliseconds);
}

double firebase_remote_config_get_config_settings_minimum_fetch_interval(uint64_t rc_ref)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return 0.0;
	return static_cast<double>(rc->GetConfigSettings().minimum_fetch_interval_in_milliseconds);
}

// callback(error_code: real, error_message: string)
FirebaseError firebase_remote_config_fetch(uint64_t rc_ref, const std::optional<GMFunction>& callback)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return FirebaseError::InvalidHandle;

	rc->Fetch().OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

// callback(error_code: real, error_message: string)
FirebaseError firebase_remote_config_fetch_with_expiration(uint64_t rc_ref, double cache_expiration_in_seconds, const std::optional<GMFunction>& callback)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return FirebaseError::InvalidHandle;

	uint64_t expiration_seconds = 0;
	if (!toUnsigned64(cache_expiration_in_seconds, "firebase_remote_config_fetch_with_expiration", "cache_expiration_in_seconds", expiration_seconds))
		return FirebaseError::InvalidArgument;

	rc->Fetch(expiration_seconds).OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

// callback(error_code: real, error_message: string, activated: bool)
FirebaseError firebase_remote_config_fetch_and_activate(uint64_t rc_ref, const std::optional<GMFunction>& callback)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return FirebaseError::InvalidHandle;

	rc->FetchAndActivate().OnCompletion([callback](const firebase::Future<bool>& f)
	{
		completeFuture(callback, f, [](bool activated) { return activated; });
	});
	return FirebaseError::Ok;
}

// callback(error_code: real, error_message: string, activated: bool)
FirebaseError firebase_remote_config_activate(uint64_t rc_ref, const std::optional<GMFunction>& callback)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return FirebaseError::InvalidHandle;

	rc->Activate().OnCompletion([callback](const firebase::Future<bool>& f)
	{
		completeFuture(callback, f, [](bool activated) { return activated; });
	});
	return FirebaseError::Ok;
}

// ============================================================
// Parameter values
// ============================================================

double firebase_remote_config_get_boolean(uint64_t rc_ref, std::string_view key)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return 0.0;
	return rc->GetBoolean(std::string(key).c_str()) ? 1.0 : 0.0;
}

double firebase_remote_config_get_long(uint64_t rc_ref, std::string_view key)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return 0.0;
	return static_cast<double>(rc->GetLong(std::string(key).c_str()));
}

double firebase_remote_config_get_double(uint64_t rc_ref, std::string_view key)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return 0.0;
	return rc->GetDouble(std::string(key).c_str());
}

std::string firebase_remote_config_get_string(uint64_t rc_ref, std::string_view key)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return std::string();
	return rc->GetString(std::string(key).c_str());
}

double firebase_remote_config_get_data_size(uint64_t rc_ref, std::string_view key)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return 0.0;
	return static_cast<double>(rc->GetData(std::string(key).c_str()).size());
}

// Copies up to out_buffer.length() bytes into out_buffer; returns the number
// of bytes actually copied (call firebase_remote_config_get_data_size() first to
// size the buffer). Mirrors GMFirebase_storage.cpp's GetBytes convention of
// writing into a caller-supplied GML buffer rather than returning one.
double firebase_remote_config_get_data(uint64_t rc_ref, std::string_view key, GMBuffer out_buffer)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return 0.0;

	std::vector<unsigned char> data = rc->GetData(std::string(key).c_str());
	size_t to_copy = std::min(data.size(), static_cast<size_t>(out_buffer.length()));
	if (to_copy > 0)
		std::memcpy(out_buffer.data(), data.data(), to_copy);
	return static_cast<double>(to_copy);
}

// ============================================================
// Keys / defaults / GetAll
// ============================================================

// callback(keys: array of string) - single argument, a GML array.
FirebaseError firebase_remote_config_get_keys_by_prefix(uint64_t rc_ref, std::string_view prefix, const std::optional<GMFunction>& callback)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return FirebaseError::InvalidHandle;
	if (!callback.has_value()) return FirebaseError::Ok;

	callback->call(rc->GetKeysByPrefix(std::string(prefix).c_str()));
	return FirebaseError::Ok;
}

// callback(keys: array of string) - single argument, a GML array.
FirebaseError firebase_remote_config_get_keys(uint64_t rc_ref, const std::optional<GMFunction>& callback)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return FirebaseError::InvalidHandle;
	if (!callback.has_value()) return FirebaseError::Ok;

	callback->call(rc->GetKeys());
	return FirebaseError::Ok;
}

// callback(values: struct) - single argument, a GML struct with one field
// per remote config key.
FirebaseError firebase_remote_config_get_all(uint64_t rc_ref, const std::optional<GMFunction>& callback)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return FirebaseError::InvalidHandle;
	if (!callback.has_value()) return FirebaseError::Ok;

	std::map<std::string, firebase::Variant> all = rc->GetAll();
	StructStream values;
	for (const auto& kv : all)
		addVariantToStruct(kv.first.c_str(), kv.second, values);

	callback->call(values);
	return FirebaseError::Ok;
}

// defaults: a GML struct - {key: value, ...} - where each value is a real,
// string or bool; reconstructed per-key into a firebase::Variant via
// gmValueToVariant and sent as a ConfigKeyValueVariant array. The SDK does
// not accept aggregate Variants here (remote_config.h, SetDefaults), so an
// array, struct or undefined value is rejected before the call.
// callback(error_code: real, error_message: string)
FirebaseError firebase_remote_config_set_defaults(uint64_t rc_ref, const GMValue& defaults, const std::optional<GMFunction>& callback)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return FirebaseError::InvalidHandle;

	if (!defaults.is<GMObjectView>())
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_remote_config_set_defaults: defaults must be a struct");
		return FirebaseError::InvalidArgument;
	}

	GMObjectView view = defaults.as<GMObjectView>();

	// ConfigKeyValueVariant stores a `const char*` key, so the backing
	// std::string for each key must outlive the SetDefaults() call below.
	std::vector<std::string> key_storage;
	std::vector<firebase::Variant> value_storage;
	key_storage.reserve(view.size());
	value_storage.reserve(view.size());

	for (const auto& pair : view)
	{
		firebase::Variant variant = gmValueToVariant(pair.second);
		if (variant.is_container_type() || variant.is_null())
		{
			setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_remote_config_set_defaults: value for key '" + std::string(pair.first) + "' must be a bool, number or string");
			return FirebaseError::InvalidArgument;
		}
		key_storage.emplace_back(pair.first);
		value_storage.push_back(std::move(variant));
	}

	std::vector<firebase::remote_config::ConfigKeyValueVariant> entries;
	entries.reserve(key_storage.size());
	for (size_t i = 0; i < key_storage.size(); ++i)
		entries.push_back({ key_storage[i].c_str(), value_storage[i] });

	rc->SetDefaults(entries.data(), entries.size()).OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

// ============================================================
// Info
// ============================================================

FirebaseRemoteConfigInfo firebase_remote_config_get_info(uint64_t rc_ref)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr)
	{
		// A zero-initialised struct would read as kLastFetchStatusSuccess.
		FirebaseRemoteConfigInfo failed{};
		failed.last_fetch_status = FirebaseRemoteConfigLastFetchStatus::Failure;
		failed.last_fetch_failure_reason = FirebaseRemoteConfigFetchFailureReason::Error;
		return failed;
	}
	return toGmInfo(rc->GetInfo());
}

// ============================================================
// Real-time config update listener
// ============================================================

// callback(error_code: real, error_message: string, updated_keys: array of string)
uint64_t firebase_remote_config_add_config_update_listener(uint64_t rc_ref, const std::optional<GMFunction>& callback)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return 0;

	firebase::remote_config::ConfigUpdateListenerRegistration registration = rc->AddOnConfigUpdateListener(
		[callback](firebase::remote_config::ConfigUpdate&& update, firebase::remote_config::RemoteConfigError error)
	{
		if (!callback.has_value()) return;
		const char* message = remoteConfigErrorMessage(error);
		callback->call(static_cast<double>(error), std::string_view{ message }, update.updated_keys);
	});

	auto* boxed = new firebase::remote_config::ConfigUpdateListenerRegistration(std::move(registration));
	return registerFirebasePointer(boxed, GM_FB_TYPE_RC_LISTENER_REG);
}

double firebase_remote_config_remove_config_update_listener(uint64_t reg_ref)
{
	firebase::remote_config::ConfigUpdateListenerRegistration* reg = resolveListenerReg(reg_ref);
	if (reg == nullptr) return 0.0;

	reg->Remove();
	reg = static_cast<firebase::remote_config::ConfigUpdateListenerRegistration*>(unregisterFirebasePointer(reg_ref, GM_FB_TYPE_RC_LISTENER_REG));
	delete reg;
	return 1.0;
}

// ============================================================
// ValueInfo / initialized-result completeness helpers
// ============================================================

namespace
{
    // Every FirebaseRemoteConfig*Info carries the SDK's ValueInfo the same way.
    template<class Info>
    void fillValueInfo(Info& out, const firebase::remote_config::ValueInfo& info)
    {
        out.source = static_cast<gm_enums::FirebaseRemoteConfigValueSource>(info.source);
        out.conversion_successful = info.conversion_successful;
    }
}

FirebaseError firebase_remote_config_ensure_initialized_info(uint64_t rc_ref, const std::optional<GMFunction>& callback)
{
    auto* rc = resolveRemoteConfig(rc_ref);
    if (!rc) return FirebaseError::InvalidHandle;
    rc->EnsureInitialized().OnCompletion([callback](const firebase::Future<firebase::remote_config::ConfigInfo>& f)
    {
        completeFuture(callback, f, [](const firebase::remote_config::ConfigInfo& info) -> std::optional<FirebaseRemoteConfigInfo>
        {
            return toGmInfo(info);
        });
    });
    return FirebaseError::Ok;
}

std::optional<gm_structs::FirebaseRemoteConfigBooleanInfo> firebase_remote_config_get_boolean_with_info(uint64_t rc_ref, std::string_view key)
{
    auto* rc = resolveRemoteConfig(rc_ref); if (!rc) return std::nullopt;
    firebase::remote_config::ValueInfo info{};
    gm_structs::FirebaseRemoteConfigBooleanInfo out;
    out.value = rc->GetBoolean(std::string(key).c_str(), &info);
    fillValueInfo(out, info);
    return out;
}

std::optional<gm_structs::FirebaseRemoteConfigLongInfo> firebase_remote_config_get_long_with_info(uint64_t rc_ref, std::string_view key)
{
    auto* rc = resolveRemoteConfig(rc_ref); if (!rc) return std::nullopt;
    firebase::remote_config::ValueInfo info{};
    gm_structs::FirebaseRemoteConfigLongInfo out;
    out.value = static_cast<double>(rc->GetLong(std::string(key).c_str(), &info));
    fillValueInfo(out, info);
    return out;
}

std::optional<gm_structs::FirebaseRemoteConfigDoubleInfo> firebase_remote_config_get_double_with_info(uint64_t rc_ref, std::string_view key)
{
    auto* rc = resolveRemoteConfig(rc_ref); if (!rc) return std::nullopt;
    firebase::remote_config::ValueInfo info{};
    gm_structs::FirebaseRemoteConfigDoubleInfo out;
    out.value = rc->GetDouble(std::string(key).c_str(), &info);
    fillValueInfo(out, info);
    return out;
}

std::optional<gm_structs::FirebaseRemoteConfigStringInfo> firebase_remote_config_get_string_with_info(uint64_t rc_ref, std::string_view key)
{
    auto* rc = resolveRemoteConfig(rc_ref); if (!rc) return std::nullopt;
    firebase::remote_config::ValueInfo info{};
    gm_structs::FirebaseRemoteConfigStringInfo out;
    out.value = rc->GetString(std::string(key).c_str(), &info);
    fillValueInfo(out, info);
    return out;
}

std::optional<gm_structs::FirebaseRemoteConfigDataInfo> firebase_remote_config_get_data_with_info(uint64_t rc_ref, std::string_view key, GMBuffer out_buffer)
{
    auto* rc = resolveRemoteConfig(rc_ref); if (!rc) return std::nullopt;
    firebase::remote_config::ValueInfo info{};
    auto value = rc->GetData(std::string(key).c_str(), &info);
    size_t copied = std::min(value.size(), static_cast<size_t>(out_buffer.length()));
    if (copied) std::memcpy(out_buffer.data(), value.data(), copied);
    gm_structs::FirebaseRemoteConfigDataInfo out;
    out.bytes_copied = static_cast<double>(copied);
    out.size = static_cast<double>(value.size());
    fillValueInfo(out, info);
    return out;
}

uint64_t firebase_remote_config_get_app(uint64_t rc_ref)
{
    auto* rc = resolveRemoteConfig(rc_ref); return rc ? wrapFirebaseApp(rc->app()) : 0;
}

uint64_t firebase_remote_config_get_instance_for_app(uint64_t app_ref)
{
    auto* app = resolveFirebaseApp(app_ref); if (!app) return 0;
    auto* rc = firebase::remote_config::RemoteConfig::GetInstance(app);
    if (!rc) { setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "RemoteConfig::GetInstance(app) returned null"); return 0; }
    return registerFirebasePointer(rc, GM_FB_TYPE_REMOTE_CONFIG);
}
