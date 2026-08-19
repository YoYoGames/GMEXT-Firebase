#include "GMFirebase_remote_config.h"
#include <algorithm>
#include <cstring>

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

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

	void reportFutureError(int error, const char* error_message)
	{
		if (error != 0)
			setFirebaseLastError(error, error_message ? error_message : "");
	}

	FirebaseRemoteConfigInfo toGmInfo(const firebase::remote_config::ConfigInfo& info)
	{
		FirebaseRemoteConfigInfo out;
		out.fetch_time = static_cast<double>(info.fetch_time);
		out.last_fetch_status = static_cast<double>(info.last_fetch_status);
		out.last_fetch_failure_reason = static_cast<double>(info.last_fetch_failure_reason);
		out.throttled_end_time = static_cast<double>(info.throttled_end_time);
		return out;
	}

	// Pushes a vector<string> as a single top-level ArrayStream element
	// (a nested array) so the callback receives it as one argument that is
	// itself a GML array of strings.
	void pushStringVectorAsSingleArg(ArrayStream& args, const std::vector<std::string>& values)
	{
		ArrayStream nested;
		for (const std::string& s : values)
			nested.push(std::string_view{ s });
		args.push(nested);
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
		setFirebaseLastError(-1, "firebase_remote_config: no firebase::App - call firebase_app_initialize() first");
		return 0;
	}

	firebase::remote_config::RemoteConfig* rc = firebase::remote_config::RemoteConfig::GetInstance(app);
	if (rc == nullptr)
	{
		setFirebaseLastError(-1, "firebase_remote_config: RemoteConfig::GetInstance() returned null");
		return 0;
	}

	return registerFirebasePointer(rc, GM_FB_TYPE_REMOTE_CONFIG);
}

// callback(error_code: real, error_message: string)
double firebase_remote_config_ensure_initialized(uint64_t rc_ref, const std::optional<GMFunction>& callback)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return 0.0;

	rc->EnsureInitialized().OnCompletion([callback](const firebase::Future<firebase::remote_config::ConfigInfo>& f)
	{
		reportFutureError(f.error(), f.error_message());
		if (callback.has_value())
			callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
}

// callback(error_code: real, error_message: string)
double firebase_remote_config_set_config_settings(uint64_t rc_ref, double fetch_timeout_ms, double minimum_fetch_interval_ms, const std::optional<GMFunction>& callback)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return 0.0;

	firebase::remote_config::ConfigSettings settings;
	settings.fetch_timeout_in_milliseconds = static_cast<uint64_t>(fetch_timeout_ms);
	settings.minimum_fetch_interval_in_milliseconds = static_cast<uint64_t>(minimum_fetch_interval_ms);

	rc->SetConfigSettings(settings).OnCompletion([callback](const firebase::Future<void>& f)
	{
		reportFutureError(f.error(), f.error_message());
		if (callback.has_value())
			callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
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
double firebase_remote_config_fetch(uint64_t rc_ref, const std::optional<GMFunction>& callback)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return 0.0;

	rc->Fetch().OnCompletion([callback](const firebase::Future<void>& f)
	{
		reportFutureError(f.error(), f.error_message());
		if (callback.has_value())
			callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
}

// callback(error_code: real, error_message: string)
double firebase_remote_config_fetch_with_expiration(uint64_t rc_ref, double cache_expiration_in_seconds, const std::optional<GMFunction>& callback)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return 0.0;

	rc->Fetch(static_cast<uint64_t>(cache_expiration_in_seconds)).OnCompletion([callback](const firebase::Future<void>& f)
	{
		reportFutureError(f.error(), f.error_message());
		if (callback.has_value())
			callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
}

// callback(error_code: real, error_message: string, activated: bool)
double firebase_remote_config_fetch_and_activate(uint64_t rc_ref, const std::optional<GMFunction>& callback)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return 0.0;

	rc->FetchAndActivate().OnCompletion([callback](const firebase::Future<bool>& f)
	{
		reportFutureError(f.error(), f.error_message());
		if (!callback.has_value()) return;
		bool activated = (f.error() == 0 && f.result() != nullptr) ? *f.result() : false;
		callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" }, activated);
	});
	return 1.0;
}

// callback(error_code: real, error_message: string, activated: bool)
double firebase_remote_config_activate(uint64_t rc_ref, const std::optional<GMFunction>& callback)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return 0.0;

	rc->Activate().OnCompletion([callback](const firebase::Future<bool>& f)
	{
		reportFutureError(f.error(), f.error_message());
		if (!callback.has_value()) return;
		bool activated = (f.error() == 0 && f.result() != nullptr) ? *f.result() : false;
		callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" }, activated);
	});
	return 1.0;
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
double firebase_remote_config_get_keys_by_prefix(uint64_t rc_ref, std::string_view prefix, const std::optional<GMFunction>& callback)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return 0.0;
	if (!callback.has_value()) return 1.0;

	std::vector<std::string> keys = rc->GetKeysByPrefix(std::string(prefix).c_str());
	ArrayStream args;
	pushStringVectorAsSingleArg(args, keys);
	callback->call_with_args(args);
	return 1.0;
}

// callback(keys: array of string) - single argument, a GML array.
double firebase_remote_config_get_keys(uint64_t rc_ref, const std::optional<GMFunction>& callback)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return 0.0;
	if (!callback.has_value()) return 1.0;

	std::vector<std::string> keys = rc->GetKeys();
	ArrayStream args;
	pushStringVectorAsSingleArg(args, keys);
	callback->call_with_args(args);
	return 1.0;
}

// callback(values: struct) - single argument, a GML struct with one field
// per remote config key.
double firebase_remote_config_get_all(uint64_t rc_ref, const std::optional<GMFunction>& callback)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return 0.0;
	if (!callback.has_value()) return 1.0;

	std::map<std::string, firebase::Variant> all = rc->GetAll();
	StructStream values;
	for (const auto& kv : all)
		addVariantToStruct(kv.first.c_str(), kv.second, values);

	ArrayStream args;
	args.push(values);
	callback->call_with_args(args);
	return 1.0;
}

// defaults: a GML struct - {key: value, ...} - where each value is any
// scalar/array/struct GML value; reconstructed per-key into a
// firebase::Variant via gmValueToVariant and sent as a
// ConfigKeyValueVariant array.
// callback(error_code: real, error_message: string)
double firebase_remote_config_set_defaults(uint64_t rc_ref, const GMValue& defaults, const std::optional<GMFunction>& callback)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return 0.0;

	if (!defaults.is<GMObjectView>())
	{
		setFirebaseLastError(-1, "firebase_firebase_remote_config_set_defaults: defaults must be a struct");
		return 0.0;
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
		key_storage.emplace_back(pair.first);
		value_storage.push_back(gmValueToVariant(pair.second));
	}

	std::vector<firebase::remote_config::ConfigKeyValueVariant> entries;
	entries.reserve(key_storage.size());
	for (size_t i = 0; i < key_storage.size(); ++i)
		entries.push_back({ key_storage[i].c_str(), value_storage[i] });

	rc->SetDefaults(entries.data(), entries.size()).OnCompletion([callback](const firebase::Future<void>& f)
	{
		reportFutureError(f.error(), f.error_message());
		if (callback.has_value())
			callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
}

// ============================================================
// Info
// ============================================================

FirebaseRemoteConfigInfo firebase_remote_config_get_info(uint64_t rc_ref)
{
	firebase::remote_config::RemoteConfig* rc = resolveRemoteConfig(rc_ref);
	if (rc == nullptr) return FirebaseRemoteConfigInfo{};
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

		ArrayStream args;
		args.push(static_cast<double>(error));
		args.push(std::string_view{ "" });

		ArrayStream keys;
		for (const std::string& key : update.updated_keys)
			keys.push(std::string_view{ key });
		args.push(keys);

		callback->call_with_args(args);
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
    gm::wire::DataStream remoteConfigValueInfoResult(const firebase::remote_config::ValueInfo& info, double value)
    {
        gm::wire::StructStream s;
        s.add("value", value);
        s.add("source", static_cast<double>(info.source));
        s.add("conversion_successful", info.conversion_successful);
        gm::wire::DataStream out; out << s; return out;
    }

    gm::wire::DataStream remoteConfigValueInfoResult(const firebase::remote_config::ValueInfo& info, const std::string& value)
    {
        gm::wire::StructStream s;
        s.add("value", std::string_view{ value });
        s.add("source", static_cast<double>(info.source));
        s.add("conversion_successful", info.conversion_successful);
        gm::wire::DataStream out; out << s; return out;
    }
}

double firebase_remote_config_ensure_initialized_info(uint64_t rc_ref, const std::optional<GMFunction>& callback)
{
    auto* rc = resolveRemoteConfig(rc_ref);
    if (!rc) return 0.0;
    rc->EnsureInitialized().OnCompletion([callback](const firebase::Future<firebase::remote_config::ConfigInfo>& f)
    {
        reportFutureError(f.error(), f.error_message());
        if (!callback) return;
        if (f.error() == 0 && f.result())
            callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" }, toGmInfo(*f.result()));
        else
            callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" }, std::optional<std::uint8_t>{});
    });
    return 1.0;
}

gm::wire::DataStream firebase_remote_config_get_boolean_with_info(uint64_t rc_ref, std::string_view key)
{
    auto* rc = resolveRemoteConfig(rc_ref); if (!rc) return {};
    firebase::remote_config::ValueInfo info{};
    bool value = rc->GetBoolean(std::string(key).c_str(), &info);
    gm::wire::StructStream s; s.add("value", value); s.add("source", static_cast<double>(info.source)); s.add("conversion_successful", info.conversion_successful);
    gm::wire::DataStream out; out << s; return out;
}

gm::wire::DataStream firebase_remote_config_get_long_with_info(uint64_t rc_ref, std::string_view key)
{
    auto* rc = resolveRemoteConfig(rc_ref); if (!rc) return {};
    firebase::remote_config::ValueInfo info{};
    auto value = rc->GetLong(std::string(key).c_str(), &info);
    return remoteConfigValueInfoResult(info, static_cast<double>(value));
}

gm::wire::DataStream firebase_remote_config_get_double_with_info(uint64_t rc_ref, std::string_view key)
{
    auto* rc = resolveRemoteConfig(rc_ref); if (!rc) return {};
    firebase::remote_config::ValueInfo info{};
    auto value = rc->GetDouble(std::string(key).c_str(), &info);
    return remoteConfigValueInfoResult(info, value);
}

gm::wire::DataStream firebase_remote_config_get_string_with_info(uint64_t rc_ref, std::string_view key)
{
    auto* rc = resolveRemoteConfig(rc_ref); if (!rc) return {};
    firebase::remote_config::ValueInfo info{};
    auto value = rc->GetString(std::string(key).c_str(), &info);
    return remoteConfigValueInfoResult(info, value);
}

gm::wire::DataStream firebase_remote_config_get_data_with_info(uint64_t rc_ref, std::string_view key, GMBuffer out_buffer)
{
    auto* rc = resolveRemoteConfig(rc_ref); if (!rc) return {};
    firebase::remote_config::ValueInfo info{};
    auto value = rc->GetData(std::string(key).c_str(), &info);
    size_t copied = std::min(value.size(), static_cast<size_t>(out_buffer.length()));
    if (copied) std::memcpy(out_buffer.data(), value.data(), copied);
    gm::wire::StructStream s;
    s.add("bytes_copied", static_cast<double>(copied));
    s.add("size", static_cast<double>(value.size()));
    s.add("source", static_cast<double>(info.source));
    s.add("conversion_successful", info.conversion_successful);
    gm::wire::DataStream out; out << s; return out;
}

uint64_t firebase_remote_config_get_app(uint64_t rc_ref)
{
    auto* rc = resolveRemoteConfig(rc_ref); return rc ? wrapFirebaseApp(rc->app()) : 0;
}

uint64_t firebase_remote_config_get_instance_for_app(uint64_t app_ref)
{
    auto* app = resolveFirebaseApp(app_ref); if (!app) return 0;
    auto* rc = firebase::remote_config::RemoteConfig::GetInstance(app);
    if (!rc) { setFirebaseLastError(-1, "RemoteConfig::GetInstance(app) returned null"); return 0; }
    return registerFirebasePointer(rc, GM_FB_TYPE_REMOTE_CONFIG);
}
