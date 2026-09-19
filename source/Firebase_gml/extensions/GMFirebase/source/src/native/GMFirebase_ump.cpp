#include "GMFirebase_ump.h"

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

// The four UMP enums mirror firebase::ump's. See GM_FB_PIN_ENUM in
// GMFirebase_common.h.
GM_FB_PIN_ENUM(FirebaseUmpConsentStatus::Unknown, firebase::ump::kConsentStatusUnknown);
GM_FB_PIN_ENUM(FirebaseUmpConsentStatus::Required, firebase::ump::kConsentStatusRequired);
GM_FB_PIN_ENUM(FirebaseUmpConsentStatus::NotRequired, firebase::ump::kConsentStatusNotRequired);
GM_FB_PIN_ENUM(FirebaseUmpConsentStatus::Obtained, firebase::ump::kConsentStatusObtained);
GM_FB_PIN_ENUM(FirebaseUmpConsentFormStatus::Unknown, firebase::ump::kConsentFormStatusUnknown);
GM_FB_PIN_ENUM(FirebaseUmpConsentFormStatus::Unavailable, firebase::ump::kConsentFormStatusUnavailable);
GM_FB_PIN_ENUM(FirebaseUmpConsentFormStatus::Available, firebase::ump::kConsentFormStatusAvailable);
GM_FB_PIN_ENUM(FirebaseUmpPrivacyOptionsRequirementStatus::Unknown, firebase::ump::kPrivacyOptionsRequirementStatusUnknown);
GM_FB_PIN_ENUM(FirebaseUmpPrivacyOptionsRequirementStatus::NotRequired, firebase::ump::kPrivacyOptionsRequirementStatusNotRequired);
GM_FB_PIN_ENUM(FirebaseUmpPrivacyOptionsRequirementStatus::Required, firebase::ump::kPrivacyOptionsRequirementStatusRequired);
GM_FB_PIN_ENUM(FirebaseUmpConsentDebugGeography::Disabled, firebase::ump::kConsentDebugGeographyDisabled);
GM_FB_PIN_ENUM(FirebaseUmpConsentDebugGeography::EEA, firebase::ump::kConsentDebugGeographyEEA);
GM_FB_PIN_ENUM(FirebaseUmpConsentDebugGeography::NonEEA, firebase::ump::kConsentDebugGeographyNonEEA);

// The two callback-code enums: ConsentRequestError on request_consent_info_update,
// ConsentFormError on the four form functions.
GM_FB_PIN_ENUM(FirebaseUmpConsentRequestError::Success, firebase::ump::kConsentRequestSuccess);
GM_FB_PIN_ENUM(FirebaseUmpConsentRequestError::InvalidAppId, firebase::ump::kConsentRequestErrorInvalidAppId);
GM_FB_PIN_ENUM(FirebaseUmpConsentRequestError::Network, firebase::ump::kConsentRequestErrorNetwork);
GM_FB_PIN_ENUM(FirebaseUmpConsentRequestError::Internal, firebase::ump::kConsentRequestErrorInternal);
GM_FB_PIN_ENUM(FirebaseUmpConsentRequestError::Misconfiguration, firebase::ump::kConsentRequestErrorMisconfiguration);
GM_FB_PIN_ENUM(FirebaseUmpConsentRequestError::Unknown, firebase::ump::kConsentRequestErrorUnknown);
GM_FB_PIN_ENUM(FirebaseUmpConsentRequestError::InvalidOperation, firebase::ump::kConsentRequestErrorInvalidOperation);
GM_FB_PIN_ENUM(FirebaseUmpConsentRequestError::OperationInProgress, firebase::ump::kConsentRequestErrorOperationInProgress);
GM_FB_PIN_ENUM(FirebaseUmpConsentFormError::Success, firebase::ump::kConsentFormSuccess);
GM_FB_PIN_ENUM(FirebaseUmpConsentFormError::Timeout, firebase::ump::kConsentFormErrorTimeout);
GM_FB_PIN_ENUM(FirebaseUmpConsentFormError::Internal, firebase::ump::kConsentFormErrorInternal);
GM_FB_PIN_ENUM(FirebaseUmpConsentFormError::Unknown, firebase::ump::kConsentFormErrorUnknown);
GM_FB_PIN_ENUM(FirebaseUmpConsentFormError::Unavailable, firebase::ump::kConsentFormErrorUnavailable);
GM_FB_PIN_ENUM(FirebaseUmpConsentFormError::AlreadyUsed, firebase::ump::kConsentFormErrorAlreadyUsed);
GM_FB_PIN_ENUM(FirebaseUmpConsentFormError::InvalidOperation, firebase::ump::kConsentFormErrorInvalidOperation);
GM_FB_PIN_ENUM(FirebaseUmpConsentFormError::OperationInProgress, firebase::ump::kConsentFormErrorOperationInProgress);

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

	// The game's own parent: the activity the App was created with on Android
	// (the same object the SDK's ConsentInfo captured for itself), the
	// runner's root view controller on iOS, and the SDK's never-dereferenced
	// stub on desktop. Nothing GML-reachable can supply another one, which
	// is why the form functions take no parent parameter.
	FirebaseError resolveFormParent(firebase::ump::FormParent& out)
	{
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
		// Through uintptr_t: an integer to id cast needs no bridge under ARC,
		// a void* to id cast does.
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

// 0 with the last error set when ConsentInfo::GetInstance() fails (e.g. a
// missing dependency on Android) - the handle convention of every other
// *_get_instance in this extension.
uint64_t firebase_ump_get_instance()
{
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_ump: no firebase::App - call firebase_app_initialize() first");
		return 0;
	}

	firebase::InitResult init_result = firebase::kInitResultSuccess;
	firebase::ump::ConsentInfo* consent_info = firebase::ump::ConsentInfo::GetInstance(*app, &init_result);
	if (consent_info == nullptr || init_result != firebase::kInitResultSuccess)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, firebaseInitResultMessage("firebase_ump: ConsentInfo::GetInstance() failed", init_result));
		return 0;
	}

	return registerFirebasePointer(consent_info, GM_FB_TYPE_UMP_CONSENT_INFO);
}

FirebaseUmpConsentStatus firebase_ump_get_consent_status(uint64_t consent_ref)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return FirebaseUmpConsentStatus::Unknown;
	return static_cast<FirebaseUmpConsentStatus>(consent_info->GetConsentStatus());
}

FirebaseUmpConsentFormStatus firebase_ump_get_consent_form_status(uint64_t consent_ref)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return FirebaseUmpConsentFormStatus::Unknown;
	return static_cast<FirebaseUmpConsentFormStatus>(consent_info->GetConsentFormStatus());
}

FirebaseUmpPrivacyOptionsRequirementStatus firebase_ump_get_privacy_options_requirement_status(uint64_t consent_ref)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return FirebaseUmpPrivacyOptionsRequirementStatus::Unknown;
	return static_cast<FirebaseUmpPrivacyOptionsRequirementStatus>(consent_info->GetPrivacyOptionsRequirementStatus());
}

bool firebase_ump_can_request_ads(uint64_t consent_ref)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return false;
	return consent_info->CanRequestAds();
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
FirebaseError firebase_ump_request_consent_info_update(uint64_t consent_ref, FirebaseUmpConsentDebugGeography debug_geography,
	bool tag_for_under_age_of_consent, const std::optional<std::vector<std::string_view>>& debug_device_ids,
	const std::optional<GMFunction>& callback)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return FirebaseError::InvalidHandle;

	firebase::ump::ConsentRequestParameters params;
	params.tag_for_under_age_of_consent = tag_for_under_age_of_consent;

	switch (debug_geography)
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
		completeFuture(callback, f);
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
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

// The form's parent is the game's own activity / root view controller - see
// resolveFormParent() and GMFirebase_ump.h.
// callback(error_code: real, error_message: string)
FirebaseError firebase_ump_show_consent_form(uint64_t consent_ref, const std::optional<GMFunction>& callback)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return FirebaseError::InvalidHandle;

	firebase::ump::FormParent parent;
	const FirebaseError parent_error = resolveFormParent(parent);
	if (parent_error != FirebaseError::Ok) return parent_error;
	consent_info->ShowConsentForm(parent).OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

// callback(error_code: real, error_message: string)
FirebaseError firebase_ump_load_and_show_consent_form_if_required(uint64_t consent_ref, const std::optional<GMFunction>& callback)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return FirebaseError::InvalidHandle;

	firebase::ump::FormParent parent;
	const FirebaseError parent_error = resolveFormParent(parent);
	if (parent_error != FirebaseError::Ok) return parent_error;
	consent_info->LoadAndShowConsentFormIfRequired(parent).OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

// callback(error_code: real, error_message: string)
FirebaseError firebase_ump_show_privacy_options_form(uint64_t consent_ref, const std::optional<GMFunction>& callback)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return FirebaseError::InvalidHandle;

	firebase::ump::FormParent parent;
	const FirebaseError parent_error = resolveFormParent(parent);
	if (parent_error != FirebaseError::Ok) return parent_error;
	consent_info->ShowPrivacyOptionsForm(parent).OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

uint64_t firebase_ump_get_instance_for_app(uint64_t app_ref)
{
	auto* app = resolveFirebaseApp(app_ref);
	if (!app) return 0;
	firebase::InitResult init_result = firebase::kInitResultSuccess;
	auto* consent_info = firebase::ump::ConsentInfo::GetInstance(*app, &init_result);
	if (!consent_info || init_result != firebase::kInitResultSuccess)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, firebaseInitResultMessage("UMP ConsentInfo::GetInstance(app) failed", init_result));
		return 0;
	}
	return registerFirebasePointer(consent_info, GM_FB_TYPE_UMP_CONSENT_INFO);
}
