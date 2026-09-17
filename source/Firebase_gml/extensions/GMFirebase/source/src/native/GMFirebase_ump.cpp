#include "GMFirebase_ump.h"
#include <climits>
#include <cmath>

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

#if FIREBASE_PLATFORM_IOS
// Defined in src/ios/GMFirebase_ios.mm: the runner's root view controller.
extern "C" void* gmFirebaseIosRootViewController(void);
#endif

namespace
{
	firebase::ump::ConsentInfo* resolveConsentInfo(uint64_t ref)
	{
		firebase::ump::ConsentInfo* out = nullptr;
		validate_fb_ref_ptr(ref, GM_FB_TYPE_UMP_CONSENT_INFO, firebase::ump::ConsentInfo, out);
		return out;
	}

	void reportFutureError(int error, const char* error_message)
	{
		if (error != 0)
			setFirebaseLastError(error, error_message ? error_message : "");
	}

	void invokeVoidCallback(const std::optional<GMFunction>& callback, const firebase::Future<void>& f)
	{
		if (callback.has_value())
			callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" });
	}

	// A non-zero form_parent is a caller-supplied platform handle and is used
	// as-is. Zero means "use the game's own parent": the activity the App was
	// created with on Android (the same object the SDK's ConsentInfo captured
	// for itself), the runner's root view controller on iOS, and the SDK's
	// never-dereferenced stub on desktop. Nothing GML-reachable could supply a
	// real parent before this, so the forms could never be shown.
	FirebaseError resolveFormParent(uint64_t form_parent, firebase::ump::FormParent& out)
	{
		if (form_parent != 0)
		{
			out = reinterpret_cast<firebase::ump::FormParent>(static_cast<uintptr_t>(form_parent));
			return FirebaseError::Ok;
		}

#if FIREBASE_PLATFORM_ANDROID
		firebase::App* app = getFirebaseApp();
		if (app == nullptr)
		{
			setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_ump: no firebase::App - call firebase_app_initialize() first");
			return FirebaseError::NotInitialized;
		}
		out = app->activity();
		return FirebaseError::Ok;
#elif FIREBASE_PLATFORM_IOS
		// Through uintptr_t like the caller-supplied path above: an integer to
		// id cast needs no bridge under ARC, a void* to id cast does.
		out = reinterpret_cast<firebase::ump::FormParent>(reinterpret_cast<uintptr_t>(gmFirebaseIosRootViewController()));
		if (out == nullptr)
		{
			setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_ump: the runner has no root view controller yet");
			return FirebaseError::NotInitialized;
		}
		return FirebaseError::Ok;
#else
		out = nullptr;
		return FirebaseError::Ok;
#endif
	}
}

// ============================================================
// ConsentInfo instance
// ============================================================

// Nullable: ConsentInfo::GetInstance() can fail (e.g. missing dependency on
// Android), in which case GML gets back "no value" rather than a ref.
std::optional<uint64_t> firebase_ump_get_instance()
{
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_ump: no firebase::App - call firebase_app_initialize() first");
		return std::nullopt;
	}

	firebase::InitResult init_result = firebase::kInitResultSuccess;
	firebase::ump::ConsentInfo* consent_info = firebase::ump::ConsentInfo::GetInstance(*app, &init_result);
	if (consent_info == nullptr || init_result != firebase::kInitResultSuccess)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, firebaseInitResultMessage("firebase_ump: ConsentInfo::GetInstance() failed", init_result));
		return std::nullopt;
	}

	return registerFirebasePointer(consent_info, GM_FB_TYPE_UMP_CONSENT_INFO);
}

double firebase_ump_get_consent_status(uint64_t consent_ref)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return static_cast<double>(firebase::ump::kConsentStatusUnknown);
	return static_cast<double>(consent_info->GetConsentStatus());
}

double firebase_ump_get_consent_form_status(uint64_t consent_ref)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return static_cast<double>(firebase::ump::kConsentFormStatusUnknown);
	return static_cast<double>(consent_info->GetConsentFormStatus());
}

double firebase_ump_get_privacy_options_requirement_status(uint64_t consent_ref)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return static_cast<double>(firebase::ump::kPrivacyOptionsRequirementStatusUnknown);
	return static_cast<double>(consent_info->GetPrivacyOptionsRequirementStatus());
}

double firebase_ump_can_request_ads(uint64_t consent_ref)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return 0.0;
	return consent_info->CanRequestAds() ? 1.0 : 0.0;
}

void firebase_ump_reset(uint64_t consent_ref)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return;
	consent_info->Reset();
}

// debug_device_ids: a GML array of strings (may be `undefined`/omitted -
// treated as empty); anything else is rejected, because a dropped id is what
// makes debug_geography silently not apply on a real device.
// callback(error_code: real, error_message: string)
FirebaseError firebase_ump_request_consent_info_update(uint64_t consent_ref, double debug_geography,
	double tag_for_under_age_of_consent, const std::optional<std::vector<std::string_view>>& debug_device_ids,
	const std::optional<GMFunction>& callback)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return FirebaseError::InvalidHandle;

	firebase::ump::ConsentRequestParameters params;
	params.tag_for_under_age_of_consent = (tag_for_under_age_of_consent >= 0.5);

	// Only an integral value in int range may reach the cast; the switch's
	// default then rejects anything outside the enum.
	const bool geography_is_integral = std::isfinite(debug_geography) && debug_geography >= 0.0
		&& debug_geography <= static_cast<double>(INT_MAX) && debug_geography == std::floor(debug_geography);
	switch (static_cast<FirebaseUmpConsentDebugGeography>(geography_is_integral ? static_cast<int>(debug_geography) : -1))
	{
	case FirebaseUmpConsentDebugGeography::Disabled: params.debug_settings.debug_geography = firebase::ump::kConsentDebugGeographyDisabled; break;
	case FirebaseUmpConsentDebugGeography::EEA: params.debug_settings.debug_geography = firebase::ump::kConsentDebugGeographyEEA; break;
	case FirebaseUmpConsentDebugGeography::NonEEA: params.debug_settings.debug_geography = firebase::ump::kConsentDebugGeographyNonEEA; break;
	default:
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_ump_request_consent_info_update: debug_geography must be a FirebaseUmpConsentDebugGeography value");
		return FirebaseError::InvalidArgument;
	}

	// string[]? - the generated wrapper has already rejected anything that is
	// not an array of strings or undefined.
	if (debug_device_ids)
	{
		for (std::string_view id : *debug_device_ids)
			params.debug_settings.debug_device_ids.emplace_back(id);
	}

	consent_info->RequestConsentInfoUpdate(params).OnCompletion([callback](const firebase::Future<void>& f)
	{
		reportFutureError(f.error(), f.error_message());
		invokeVoidCallback(callback, f);
	});
	return FirebaseError::Ok;
}

// callback(error_code: real, error_message: string)
FirebaseError firebase_ump_load_consent_form(uint64_t consent_ref, const std::optional<GMFunction>& callback)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return FirebaseError::InvalidHandle;

	consent_info->LoadConsentForm().OnCompletion([callback](const firebase::Future<void>& f)
	{
		reportFutureError(f.error(), f.error_message());
		invokeVoidCallback(callback, f);
	});
	return FirebaseError::Ok;
}

// form_parent: 0 for the game's own activity / root view controller, or a
// caller-supplied platform handle (jobject/id cast to uint64) - see
// resolveFormParent() and GMFirebase_ump.h.
// callback(error_code: real, error_message: string)
FirebaseError firebase_ump_show_consent_form(uint64_t consent_ref, uint64_t form_parent, const std::optional<GMFunction>& callback)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return FirebaseError::InvalidHandle;

	firebase::ump::FormParent parent;
	const FirebaseError parent_error = resolveFormParent(form_parent, parent);
	if (parent_error != FirebaseError::Ok) return parent_error;
	consent_info->ShowConsentForm(parent).OnCompletion([callback](const firebase::Future<void>& f)
	{
		reportFutureError(f.error(), f.error_message());
		invokeVoidCallback(callback, f);
	});
	return FirebaseError::Ok;
}

// callback(error_code: real, error_message: string)
FirebaseError firebase_ump_load_and_show_consent_form_if_required(uint64_t consent_ref, uint64_t form_parent, const std::optional<GMFunction>& callback)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return FirebaseError::InvalidHandle;

	firebase::ump::FormParent parent;
	const FirebaseError parent_error = resolveFormParent(form_parent, parent);
	if (parent_error != FirebaseError::Ok) return parent_error;
	consent_info->LoadAndShowConsentFormIfRequired(parent).OnCompletion([callback](const firebase::Future<void>& f)
	{
		reportFutureError(f.error(), f.error_message());
		invokeVoidCallback(callback, f);
	});
	return FirebaseError::Ok;
}

// callback(error_code: real, error_message: string)
FirebaseError firebase_ump_show_privacy_options_form(uint64_t consent_ref, uint64_t form_parent, const std::optional<GMFunction>& callback)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return FirebaseError::InvalidHandle;

	firebase::ump::FormParent parent;
	const FirebaseError parent_error = resolveFormParent(form_parent, parent);
	if (parent_error != FirebaseError::Ok) return parent_error;
	consent_info->ShowPrivacyOptionsForm(parent).OnCompletion([callback](const firebase::Future<void>& f)
	{
		reportFutureError(f.error(), f.error_message());
		invokeVoidCallback(callback, f);
	});
	return FirebaseError::Ok;
}

std::optional<uint64_t> firebase_ump_get_instance_for_app(uint64_t app_ref)
{
    auto* app = resolveFirebaseApp(app_ref); if (!app) return std::nullopt;
    firebase::InitResult init_result = firebase::kInitResultSuccess;
    auto* consent_info = firebase::ump::ConsentInfo::GetInstance(*app, &init_result);
    if (!consent_info || init_result != firebase::kInitResultSuccess)
    {
        setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, firebaseInitResultMessage("UMP ConsentInfo::GetInstance(app) failed", init_result));
        return std::nullopt;
    }
    return registerFirebasePointer(consent_info, GM_FB_TYPE_UMP_CONSENT_INFO);
}
