#include "GMFirebase_ump.h"

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

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
		setFirebaseLastError(-1, "firebase_ump: no firebase::App - call firebase_app_initialize() first");
		return std::nullopt;
	}

	firebase::InitResult init_result = firebase::kInitResultSuccess;
	firebase::ump::ConsentInfo* consent_info = firebase::ump::ConsentInfo::GetInstance(*app, &init_result);
	if (consent_info == nullptr || init_result != firebase::kInitResultSuccess)
	{
		setFirebaseLastError(static_cast<int>(init_result), "firebase_ump: ConsentInfo::GetInstance() failed");
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
// treated as empty). callback(error_code: real, error_message: string)
double firebase_ump_request_consent_info_update(uint64_t consent_ref, double debug_geography,
	double tag_for_under_age_of_consent, const GMValue& debug_device_ids,
	const std::optional<GMFunction>& callback)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return 0.0;

	firebase::ump::ConsentRequestParameters params;
	params.tag_for_under_age_of_consent = (tag_for_under_age_of_consent >= 0.5);
	params.debug_settings.debug_geography = static_cast<firebase::ump::ConsentDebugGeography>(static_cast<int>(debug_geography));

	if (debug_device_ids.is<GMArrayView>())
	{
		GMArrayView view = debug_device_ids.as<GMArrayView>();
		for (const auto& element : view)
		{
			if (element.is<std::string_view>())
				params.debug_settings.debug_device_ids.push_back(std::string(element.as<std::string_view>()));
		}
	}

	consent_info->RequestConsentInfoUpdate(params).OnCompletion([callback](const firebase::Future<void>& f)
	{
		reportFutureError(f.error(), f.error_message());
		invokeVoidCallback(callback, f);
	});
	return 1.0;
}

// callback(error_code: real, error_message: string)
double firebase_ump_load_consent_form(uint64_t consent_ref, const std::optional<GMFunction>& callback)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return 0.0;

	consent_info->LoadConsentForm().OnCompletion([callback](const firebase::Future<void>& f)
	{
		reportFutureError(f.error(), f.error_message());
		invokeVoidCallback(callback, f);
	});
	return 1.0;
}

// form_parent: opaque platform form-parent handle (jobject/id/void* cast to
// uint64) - see GMFirebase_ump.h. Pass 0 on desktop.
// callback(error_code: real, error_message: string)
double firebase_ump_show_consent_form(uint64_t consent_ref, uint64_t form_parent, const std::optional<GMFunction>& callback)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return 0.0;

	firebase::ump::FormParent parent = reinterpret_cast<firebase::ump::FormParent>(static_cast<uintptr_t>(form_parent));
	consent_info->ShowConsentForm(parent).OnCompletion([callback](const firebase::Future<void>& f)
	{
		reportFutureError(f.error(), f.error_message());
		invokeVoidCallback(callback, f);
	});
	return 1.0;
}

// callback(error_code: real, error_message: string)
double firebase_ump_load_and_show_consent_form_if_required(uint64_t consent_ref, uint64_t form_parent, const std::optional<GMFunction>& callback)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return 0.0;

	firebase::ump::FormParent parent = reinterpret_cast<firebase::ump::FormParent>(static_cast<uintptr_t>(form_parent));
	consent_info->LoadAndShowConsentFormIfRequired(parent).OnCompletion([callback](const firebase::Future<void>& f)
	{
		reportFutureError(f.error(), f.error_message());
		invokeVoidCallback(callback, f);
	});
	return 1.0;
}

// callback(error_code: real, error_message: string)
double firebase_ump_show_privacy_options_form(uint64_t consent_ref, uint64_t form_parent, const std::optional<GMFunction>& callback)
{
	firebase::ump::ConsentInfo* consent_info = resolveConsentInfo(consent_ref);
	if (consent_info == nullptr) return 0.0;

	firebase::ump::FormParent parent = reinterpret_cast<firebase::ump::FormParent>(static_cast<uintptr_t>(form_parent));
	consent_info->ShowPrivacyOptionsForm(parent).OnCompletion([callback](const firebase::Future<void>& f)
	{
		reportFutureError(f.error(), f.error_message());
		invokeVoidCallback(callback, f);
	});
	return 1.0;
}

std::optional<uint64_t> firebase_ump_get_instance_for_app(uint64_t app_ref)
{
    auto* app = resolveFirebaseApp(app_ref); if (!app) return std::nullopt;
    firebase::InitResult init_result = firebase::kInitResultSuccess;
    auto* consent_info = firebase::ump::ConsentInfo::GetInstance(*app, &init_result);
    if (!consent_info || init_result != firebase::kInitResultSuccess)
    {
        setFirebaseLastError(static_cast<int>(init_result), "UMP ConsentInfo::GetInstance(app) failed");
        return std::nullopt;
    }
    return registerFirebasePointer(consent_info, GM_FB_TYPE_UMP_CONSENT_INFO);
}
