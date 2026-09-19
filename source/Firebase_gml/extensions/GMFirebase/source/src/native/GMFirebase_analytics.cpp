#include "GMFirebase_common.h"
#include "firebase/analytics.h"
#include <mutex>

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

namespace
{
	// firebase::analytics::Initialize() returns void and the SDK exposes no
	// IsInitialized(), so the module tracks it. Every other analytics entry
	// point asserts on it inside the SDK - LogAssert(), which aborts the
	// process - so a call before initialize has to be rejected here. This is
	// the exact path of the 2026-08-25 device crash in LogEvent().
	bool g_analytics_initialized = false;

	bool analyticsReady(const char* function)
	{
		if (g_analytics_initialized) return true;
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, std::string(function) + ": call firebase_analytics_initialize() first");
		return false;
	}

	// Converts the FirebaseAnalyticsParameter[] argument (name plus a dynamic
	// value, mirroring firebase::analytics::Parameter) into a Parameter vector
	// for the LogEvent/SetDefaultEventParameters overloads that take an
	// arbitrary parameter list. `name_storage` must outlive `out` - Parameter's (const char*,
	// Variant) constructor stores the name pointer verbatim rather than
	// copying it, so the owning strings are kept alive in a sibling vector
	// reserved up-front to its final size so no reallocation ever invalidates
	// a pointer already handed to `out`.
	void gmToAnalyticsParameters(const std::vector<gm_structs::FirebaseAnalyticsParameter>& params,
		std::vector<std::string>& name_storage,
		std::vector<firebase::analytics::Parameter>& out)
	{
		name_storage.reserve(name_storage.size() + params.size());
		out.reserve(out.size() + params.size());

		for (const gm_structs::FirebaseAnalyticsParameter& p : params)
		{
			if (p.name.empty())
				continue;

			name_storage.push_back(p.name);
			out.emplace_back(name_storage.back().c_str(), gmValueToVariant(gmValueView(p.value)));
		}
	}
}

// ============================================================
// Lifecycle
// ============================================================

bool firebase_analytics_initialize()
{
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_analytics_initialize: no firebase::App - call firebase_app_initialize() first");
		return false;
	}

	firebase::analytics::Initialize(*app);
	g_analytics_initialized = true;
	return true;
}

void firebase_analytics_terminate()
{
	if (!g_analytics_initialized) return;
	firebase::analytics::Terminate();
	g_analytics_initialized = false;
}

// ============================================================
// Collection / Consent
// ============================================================

void firebase_analytics_set_analytics_collection_enabled(bool enabled)
{
	if (!analyticsReady("firebase_analytics_set_analytics_collection_enabled")) return;
	firebase::analytics::SetAnalyticsCollectionEnabled(enabled);
}

// Mirrors the legacy FirebaseAnalytics_SetConsent(adsConsent, analyticsConsent,
// adUserDataConsent, adPersonalizationConsent) contract exactly: four fixed
// real (truthy >= 0.5) params, all four consent types always included in the
// settings map with no "omit to leave unchanged" semantics.
void firebase_analytics_set_consent(bool ad_storage, bool analytics_storage,
	bool ad_user_data, bool ad_personalization)
{
	if (!analyticsReady("firebase_analytics_set_consent")) return;
	using firebase::analytics::ConsentType;
	using firebase::analytics::ConsentStatus;

	std::map<ConsentType, ConsentStatus> settings;
	settings[firebase::analytics::kConsentTypeAdStorage] =
		ad_storage ? firebase::analytics::kConsentStatusGranted : firebase::analytics::kConsentStatusDenied;
	settings[firebase::analytics::kConsentTypeAnalyticsStorage] =
		analytics_storage ? firebase::analytics::kConsentStatusGranted : firebase::analytics::kConsentStatusDenied;
	settings[firebase::analytics::kConsentTypeAdUserData] =
		ad_user_data ? firebase::analytics::kConsentStatusGranted : firebase::analytics::kConsentStatusDenied;
	settings[firebase::analytics::kConsentTypeAdPersonalization] =
		ad_personalization ? firebase::analytics::kConsentStatusGranted : firebase::analytics::kConsentStatusDenied;

	firebase::analytics::SetConsent(settings);
}

// ============================================================
// Events
// ============================================================

void firebase_analytics_log_event(std::string_view name)
{
	if (!analyticsReady("firebase_analytics_log_event")) return;
	firebase::analytics::LogEvent(std::string(name).c_str());
}

void firebase_analytics_log_event_string(std::string_view name, std::string_view parameter_name, std::string_view parameter_value)
{
	if (!analyticsReady("firebase_analytics_log_event_string")) return;
	firebase::analytics::LogEvent(std::string(name).c_str(), std::string(parameter_name).c_str(), std::string(parameter_value).c_str());
}

void firebase_analytics_log_event_number(std::string_view name, std::string_view parameter_name, double parameter_value)
{
	if (!analyticsReady("firebase_analytics_log_event_number")) return;
	firebase::analytics::LogEvent(std::string(name).c_str(), std::string(parameter_name).c_str(), parameter_value);
}

void firebase_analytics_log_event_params(std::string_view name, const std::vector<gm_structs::FirebaseAnalyticsParameter>& params)
{
	if (!analyticsReady("firebase_analytics_log_event_params")) return;
	std::vector<std::string> name_storage;
	std::vector<firebase::analytics::Parameter> parameters;
	gmToAnalyticsParameters(params, name_storage, parameters);
	firebase::analytics::LogEvent(std::string(name).c_str(), parameters);
}

void firebase_analytics_set_default_event_parameters(const std::vector<gm_structs::FirebaseAnalyticsParameter>& params)
{
	if (!analyticsReady("firebase_analytics_set_default_event_parameters")) return;
	std::vector<std::string> name_storage;
	std::vector<firebase::analytics::Parameter> parameters;
	gmToAnalyticsParameters(params, name_storage, parameters);
	firebase::analytics::SetDefaultEventParameters(parameters);
}

FirebaseError firebase_analytics_log_apple_transaction(std::string_view transaction_id, const std::optional<gm::wire::GMFunction>& callback)
{
	if (!analyticsReady("firebase_analytics_log_apple_transaction"))
		return FirebaseError::NotInitialized;

	firebase::Future<void> future = firebase::analytics::LogAppleTransaction(std::string(transaction_id).c_str());
	future.OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

// ============================================================
// User properties
// ============================================================

void firebase_analytics_set_user_property(std::string_view name, std::string_view value)
{
	if (!analyticsReady("firebase_analytics_set_user_property")) return;
	// SetUserProperty(name, nullptr) removes the property; an empty GML
	// string is the closest reachable equivalent from script code, so map it
	// to nullptr rather than an empty C string.
	std::string name_str(name);
	if (value.empty())
	{
		firebase::analytics::SetUserProperty(name_str.c_str(), nullptr);
		return;
	}
	std::string value_str(value);
	firebase::analytics::SetUserProperty(name_str.c_str(), value_str.c_str());
}

void firebase_analytics_set_user_id(std::string_view user_id)
{
	if (!analyticsReady("firebase_analytics_set_user_id")) return;
	if (user_id.empty())
	{
		firebase::analytics::SetUserId(nullptr);
		return;
	}
	std::string user_id_str(user_id);
	firebase::analytics::SetUserId(user_id_str.c_str());
}

void firebase_analytics_set_session_timeout_duration(double milliseconds)
{
	if (!analyticsReady("firebase_analytics_set_session_timeout_duration")) return;
	firebase::analytics::SetSessionTimeoutDuration(static_cast<int64_t>(milliseconds));
}

void firebase_analytics_reset_analytics_data()
{
	if (!analyticsReady("firebase_analytics_reset_analytics_data")) return;
	firebase::analytics::ResetAnalyticsData();
}

// ============================================================
// Async getters
// ============================================================

FirebaseError firebase_analytics_get_analytics_instance_id(const std::optional<gm::wire::GMFunction>& callback)
{
	if (!analyticsReady("firebase_analytics_get_analytics_instance_id"))
		return FirebaseError::NotInitialized;

	firebase::Future<std::string> future = firebase::analytics::GetAnalyticsInstanceId();
	future.OnCompletion([callback](const firebase::Future<std::string>& f)
	{
		completeFuture(callback, f, [](const std::string& id)
		{
			return std::string_view{ id };
		});
	});
	return FirebaseError::Ok;
}

FirebaseError firebase_analytics_get_session_id(const std::optional<gm::wire::GMFunction>& callback)
{
	if (!analyticsReady("firebase_analytics_get_session_id"))
		return FirebaseError::NotInitialized;

	firebase::Future<int64_t> future = firebase::analytics::GetSessionId();
	future.OnCompletion([callback](const firebase::Future<int64_t>& f)
	{
		completeFuture(callback, f, [](int64_t session_id)
		{
			return static_cast<double>(session_id);
		});
	});
	return FirebaseError::Ok;
}

// ============================================================
// Desktop-only diagnostics (no-ops on iOS/Android, per firebase/analytics.h)
// ============================================================

void firebase_analytics_notify_app_lifecycle_termination()
{
	if (!analyticsReady("firebase_analytics_notify_app_lifecycle_termination")) return;
	firebase::analytics::NotifyAppLifecycleChange(firebase::analytics::kTermination);
}

bool firebase_analytics_is_desktop_initialized()
{
	if (!analyticsReady("firebase_analytics_is_desktop_initialized")) return false;
	return firebase::analytics::IsDesktopInitialized();
}

void firebase_analytics_set_desktop_debug_mode(bool enabled)
{
	if (!analyticsReady("firebase_analytics_set_desktop_debug_mode")) return;
	firebase::analytics::SetDesktopDebugMode(enabled);
}

// ============================================================
// Logging
// ============================================================

namespace
{
	// Written from the GML thread, read from whichever thread the SDK logs
	// on. The callback copies the function out under the lock and calls it
	// outside, so a reassignment never races the call and the call never
	// holds the lock.
	std::mutex g_analytics_log_mutex;
	std::optional<gm::wire::GMFunction> g_analytics_log_callback;

	void CALLBACK_firebase_analytics_log(firebase::LogLevel level, const char* message)
	{
		std::optional<gm::wire::GMFunction> callback;
		{
			std::lock_guard<std::mutex> lock(g_analytics_log_mutex);
			callback = g_analytics_log_callback;
		}
		if (callback.has_value())
			callback->call((double)level, std::string_view{ message != nullptr ? message : "" });
	}
}

void firebase_analytics_set_log_callback(const std::optional<gm::wire::GMFunction>& callback)
{
	if (!analyticsReady("firebase_analytics_set_log_callback")) return;
	{
		std::lock_guard<std::mutex> lock(g_analytics_log_mutex);
		g_analytics_log_callback = callback;
	}
	if (callback.has_value())
		firebase::analytics::SetLogCallback(CALLBACK_firebase_analytics_log);
	else
		firebase::analytics::SetLogCallback(nullptr);
}

// ============================================================
// On-device conversion measurement (iOS/tvOS only, no-op elsewhere)
// ============================================================

void firebase_analytics_initiate_on_device_conversion_measurement_email(std::string_view email_address)
{
	if (!analyticsReady("firebase_analytics_initiate_on_device_conversion_measurement_email")) return;
	firebase::analytics::InitiateOnDeviceConversionMeasurementWithEmailAddress(std::string(email_address).c_str());
}

void firebase_analytics_initiate_on_device_conversion_measurement_phone(std::string_view phone_number)
{
	if (!analyticsReady("firebase_analytics_initiate_on_device_conversion_measurement_phone")) return;
	firebase::analytics::InitiateOnDeviceConversionMeasurementWithPhoneNumber(std::string(phone_number).c_str());
}

// ============================================================
// Firebase C++ 13.11 completeness additions
// ============================================================

// FirebaseAnalyticsAppLifecycleState mirrors firebase::analytics::AppLifecycleState.
// See GM_FB_PIN_ENUM in GMFirebase_common.h.
GM_FB_PIN_ENUM(FirebaseAnalyticsAppLifecycleState::Unknown, firebase::analytics::kUnknown);
GM_FB_PIN_ENUM(FirebaseAnalyticsAppLifecycleState::Termination, firebase::analytics::kTermination);

static bool toSdkAppLifecycleState(FirebaseAnalyticsAppLifecycleState state, firebase::analytics::AppLifecycleState& out)
{
	switch (state)
	{
	case FirebaseAnalyticsAppLifecycleState::Unknown: out = firebase::analytics::kUnknown; return true;
	case FirebaseAnalyticsAppLifecycleState::Termination: out = firebase::analytics::kTermination; return true;
	default: return false;
	}
}

void firebase_analytics_notify_app_lifecycle_change(FirebaseAnalyticsAppLifecycleState state)
{
	if (!analyticsReady("firebase_analytics_notify_app_lifecycle_change")) return;
	firebase::analytics::AppLifecycleState sdk_state;
	if (!toSdkAppLifecycleState(state, sdk_state))
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_analytics_notify_app_lifecycle_change: state must be a FirebaseAnalyticsAppLifecycleState value");
		return;
	}
	firebase::analytics::NotifyAppLifecycleChange(sdk_state);
}

void firebase_analytics_initiate_on_device_conversion_measurement_hashed_email(GMBuffer hashed_email)
{
	if (!analyticsReady("firebase_analytics_initiate_on_device_conversion_measurement_hashed_email")) return;
	const auto* begin = static_cast<const unsigned char*>(hashed_email.data());
	std::vector<unsigned char> bytes(begin, begin + hashed_email.length());
	firebase::analytics::InitiateOnDeviceConversionMeasurementWithHashedEmailAddress(std::move(bytes));
}

void firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone(GMBuffer hashed_phone)
{
	if (!analyticsReady("firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone")) return;
	const auto* begin = static_cast<const unsigned char*>(hashed_phone.data());
	std::vector<unsigned char> bytes(begin, begin + hashed_phone.length());
	firebase::analytics::InitiateOnDeviceConversionMeasurementWithHashedPhoneNumber(std::move(bytes));
}

bool firebase_analytics_initialize_for_app(uint64_t app_ref)
{
	auto* app = resolveFirebaseApp(app_ref);
	if (!app) return false;
	firebase::analytics::Initialize(*app);
	g_analytics_initialized = true;
	return true;
}
