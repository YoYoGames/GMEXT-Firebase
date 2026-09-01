#include <native/GMFirebaseAnalyticsInternal_native.h>
#include "GMFirebase_common.h"
#include "firebase/analytics.h"

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

namespace
{
	// GML has no separate boolean wire type - every "flag" parameter crosses
	// as a real, following the same >=0.5 truthy convention the legacy
	// (YYFirebaseAnalytics) extension used for FirebaseAnalytics_SetConsent.
	bool gmTruthy(double value)
	{
		return value >= 0.5;
	}

	// Decodes a params: gmval argument shaped as an array of
	// {name: string, value: <real|string|bool|array|struct>} entries into a
	// firebase::analytics::Parameter vector, for the LogEvent/
	// SetDefaultEventParameters overloads that take an arbitrary parameter
	// list. `name_storage` must outlive `out` - Parameter's (const char*,
	// Variant) constructor stores the name pointer verbatim rather than
	// copying it, so the owning strings are kept alive in a sibling vector
	// reserved up-front to its final size so no reallocation ever invalidates
	// a pointer already handed to `out`.
	void gmValueToAnalyticsParameters(const gm::wire::GMValue& value,
		std::vector<std::string>& name_storage,
		std::vector<firebase::analytics::Parameter>& out)
	{
		using gm::wire::GMArrayView;
		using gm::wire::GMObjectView;

		if (!value.is<GMArrayView>())
			return;

		auto view = value.as<GMArrayView>();
		name_storage.reserve(name_storage.size() + view.size());
		out.reserve(out.size() + view.size());

		for (const auto& element : view)
		{
			if (!element.is<GMObjectView>())
				continue;

			auto obj = element.as<GMObjectView>();
			std::string_view name_view;
			bool has_name = false;
			firebase::Variant variant_value = firebase::Variant::Null();

			for (const auto& pair : obj)
			{
				if (pair.first == "name" && pair.second.is<std::string_view>())
				{
					name_view = pair.second.as<std::string_view>();
					has_name = true;
				}
				else if (pair.first == "value")
				{
					variant_value = gmValueToVariant(pair.second);
				}
			}

			if (!has_name || name_view.empty())
				continue;

			name_storage.emplace_back(name_view);
			out.emplace_back(name_storage.back().c_str(), variant_value);
		}
	}
}

// ============================================================
// Lifecycle
// ============================================================

double firebase_analytics_initialize()
{
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(-1, "firebase_analytics_initialize: no firebase::App - call firebase_app_initialize() first");
		return 0.0;
	}

	firebase::analytics::Initialize(*app);
	return 1.0;
}

void firebase_analytics_terminate()
{
	firebase::analytics::Terminate();
}

// ============================================================
// Collection / Consent
// ============================================================

void firebase_analytics_set_analytics_collection_enabled(double enabled)
{
	firebase::analytics::SetAnalyticsCollectionEnabled(gmTruthy(enabled));
}

// Mirrors the legacy FirebaseAnalytics_SetConsent(adsConsent, analyticsConsent,
// adUserDataConsent, adPersonalizationConsent) contract exactly: four fixed
// real (truthy >= 0.5) params, all four consent types always included in the
// settings map with no "omit to leave unchanged" semantics.
void firebase_analytics_set_consent(double ad_storage, double analytics_storage,
	double ad_user_data, double ad_personalization)
{
	using firebase::analytics::ConsentType;
	using firebase::analytics::ConsentStatus;

	std::map<ConsentType, ConsentStatus> settings;
	settings[firebase::analytics::kConsentTypeAdStorage] =
		gmTruthy(ad_storage) ? firebase::analytics::kConsentStatusGranted : firebase::analytics::kConsentStatusDenied;
	settings[firebase::analytics::kConsentTypeAnalyticsStorage] =
		gmTruthy(analytics_storage) ? firebase::analytics::kConsentStatusGranted : firebase::analytics::kConsentStatusDenied;
	settings[firebase::analytics::kConsentTypeAdUserData] =
		gmTruthy(ad_user_data) ? firebase::analytics::kConsentStatusGranted : firebase::analytics::kConsentStatusDenied;
	settings[firebase::analytics::kConsentTypeAdPersonalization] =
		gmTruthy(ad_personalization) ? firebase::analytics::kConsentStatusGranted : firebase::analytics::kConsentStatusDenied;

	firebase::analytics::SetConsent(settings);
}

// ============================================================
// Events
// ============================================================

void firebase_analytics_log_event(std::string_view name)
{
	firebase::analytics::LogEvent(std::string(name).c_str());
}

void firebase_analytics_log_event_string(std::string_view name, std::string_view parameter_name, std::string_view parameter_value)
{
	firebase::analytics::LogEvent(std::string(name).c_str(), std::string(parameter_name).c_str(), std::string(parameter_value).c_str());
}

void firebase_analytics_log_event_number(std::string_view name, std::string_view parameter_name, double parameter_value)
{
	firebase::analytics::LogEvent(std::string(name).c_str(), std::string(parameter_name).c_str(), parameter_value);
}

// params: array of {name: string, value: gmval}, see gmValueToAnalyticsParameters().
void firebase_analytics_log_event_params(std::string_view name, const gm::wire::GMValue& params)
{
	std::vector<std::string> name_storage;
	std::vector<firebase::analytics::Parameter> parameters;
	gmValueToAnalyticsParameters(params, name_storage, parameters);
	firebase::analytics::LogEvent(std::string(name).c_str(), parameters);
}

void firebase_analytics_set_default_event_parameters(const gm::wire::GMValue& params)
{
	std::vector<std::string> name_storage;
	std::vector<firebase::analytics::Parameter> parameters;
	gmValueToAnalyticsParameters(params, name_storage, parameters);
	firebase::analytics::SetDefaultEventParameters(parameters);
}

double firebase_analytics_log_apple_transaction(std::string_view transaction_id, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::Future<void> future = firebase::analytics::LogAppleTransaction(std::string(transaction_id).c_str());
	future.OnCompletion([callback](const firebase::Future<void>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");

		if (callback.has_value())
			callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
}

// ============================================================
// User properties
// ============================================================

void firebase_analytics_set_user_property(std::string_view name, std::string_view value)
{
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
	firebase::analytics::SetSessionTimeoutDuration(static_cast<int64_t>(milliseconds));
}

void firebase_analytics_reset_analytics_data()
{
	firebase::analytics::ResetAnalyticsData();
}

// ============================================================
// Async getters
// ============================================================

double firebase_analytics_get_analytics_instance_id(const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::Future<std::string> future = firebase::analytics::GetAnalyticsInstanceId();
	future.OnCompletion([callback](const firebase::Future<std::string>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");

		if (!callback.has_value())
			return;

		std::string_view id = (f.error() == 0 && f.result() != nullptr) ? std::string_view{ *f.result() } : std::string_view{};
		callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" }, id);
	});
	return 1.0;
}

double firebase_analytics_get_session_id(const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::Future<int64_t> future = firebase::analytics::GetSessionId();
	future.OnCompletion([callback](const firebase::Future<int64_t>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");

		if (!callback.has_value())
			return;

		double session_id = (f.error() == 0 && f.result() != nullptr) ? static_cast<double>(*f.result()) : 0.0;
		callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" }, session_id);
	});
	return 1.0;
}

// ============================================================
// Desktop-only diagnostics (no-ops on iOS/Android, per firebase/analytics.h)
// ============================================================

void firebase_analytics_notify_app_lifecycle_termination()
{
	firebase::analytics::NotifyAppLifecycleChange(firebase::analytics::kTermination);
}

double firebase_analytics_is_desktop_initialized()
{
	return firebase::analytics::IsDesktopInitialized() ? 1.0 : 0.0;
}

void firebase_analytics_set_desktop_debug_mode(double enabled)
{
	firebase::analytics::SetDesktopDebugMode(gmTruthy(enabled));
}

// ============================================================
// Logging
// ============================================================

namespace
{
	std::optional<gm::wire::GMFunction> g_analytics_log_callback;

	void CALLBACK_firebase_analytics_log(firebase::LogLevel level, const char* message)
	{
		if (g_analytics_log_callback.has_value())
			g_analytics_log_callback->call((double)level, std::string_view{ message != nullptr ? message : "" });
	}
}

void firebase_analytics_set_log_callback(const std::optional<gm::wire::GMFunction>& callback)
{
	g_analytics_log_callback = callback;
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
	firebase::analytics::InitiateOnDeviceConversionMeasurementWithEmailAddress(std::string(email_address).c_str());
}

void firebase_analytics_initiate_on_device_conversion_measurement_phone(std::string_view phone_number)
{
	firebase::analytics::InitiateOnDeviceConversionMeasurementWithPhoneNumber(std::string(phone_number).c_str());
}

// ============================================================
// Firebase C++ 13.11 completeness additions
// ============================================================

void firebase_analytics_notify_app_lifecycle_change(double state)
{
    firebase::analytics::NotifyAppLifecycleChange(
        static_cast<firebase::analytics::AppLifecycleState>(static_cast<int>(state)));
}

void firebase_analytics_initiate_on_device_conversion_measurement_hashed_email(GMBuffer hashed_email)
{
    const auto* begin = static_cast<const unsigned char*>(hashed_email.data());
    std::vector<unsigned char> bytes(begin, begin + hashed_email.length());
    firebase::analytics::InitiateOnDeviceConversionMeasurementWithHashedEmailAddress(std::move(bytes));
}

void firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone(GMBuffer hashed_phone)
{
    const auto* begin = static_cast<const unsigned char*>(hashed_phone.data());
    std::vector<unsigned char> bytes(begin, begin + hashed_phone.length());
    firebase::analytics::InitiateOnDeviceConversionMeasurementWithHashedPhoneNumber(std::move(bytes));
}

double firebase_analytics_initialize_for_app(uint64_t app_ref)
{
    auto* app = resolveFirebaseApp(app_ref); if (!app) return 0.0;
    firebase::analytics::Initialize(*app); return 1.0;
}
