#include "GMFirebase_common.h"
#include "firebase/installations.h"

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

namespace
{
	firebase::installations::Installations* getInstallationsInstance()
	{
		firebase::App* app = getFirebaseApp();
		if (app == nullptr)
		{
			setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_installations: no firebase::App - call firebase_app_initialize() first");
			return nullptr;
		}

		// Confirmed against firebase/installations.h: GetInstance(App*) has no
		// InitResult* out-param on this SDK build, unlike some other product
		// singletons.
		firebase::installations::Installations* installations = firebase::installations::Installations::GetInstance(app);
		if (installations == nullptr)
			setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_installations: Installations::GetInstance() returned null");

		return installations;
	}

	firebase::installations::Installations* resolveInstallations(uint64_t ref)
	{
		return static_cast<firebase::installations::Installations*>(resolveFirebasePointer(ref, GM_FB_TYPE_INSTALLATIONS));
	}

	// One implementation per operation, shared by the default-instance entry
	// points and the handle-based *_instance_* ones. The caller has already
	// resolved `installations` and returned its own code if that failed.
	FirebaseError installationsGetId(firebase::installations::Installations* installations, const std::optional<gm::wire::GMFunction>& callback)
	{
		installations->GetId().OnCompletion([callback](const firebase::Future<std::string>& f)
		{
			if (!callback.has_value())
				return;

			std::string_view id = (f.error() == 0 && f.result() != nullptr) ? std::string_view{ *f.result() } : std::string_view{};
			callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" }, id);
		});
		return FirebaseError::Ok;
	}

	FirebaseError installationsGetToken(firebase::installations::Installations* installations, bool force_refresh, const std::optional<gm::wire::GMFunction>& callback)
	{
		installations->GetToken(force_refresh).OnCompletion([callback](const firebase::Future<std::string>& f)
		{
			if (!callback.has_value())
				return;

			std::string_view token = (f.error() == 0 && f.result() != nullptr) ? std::string_view{ *f.result() } : std::string_view{};
			callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" }, token);
		});
		return FirebaseError::Ok;
	}

	FirebaseError installationsDelete(firebase::installations::Installations* installations, const std::optional<gm::wire::GMFunction>& callback)
	{
		installations->Delete().OnCompletion([callback](const firebase::Future<void>& f)
		{
			if (callback.has_value())
				callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
		});
		return FirebaseError::Ok;
	}
}

FirebaseError firebase_installations_get_id(const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::installations::Installations* installations = getInstallationsInstance();
	if (installations == nullptr) return FirebaseError::NotInitialized;
	return installationsGetId(installations, callback);
}

FirebaseError firebase_installations_get_token(double force_refresh, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::installations::Installations* installations = getInstallationsInstance();
	if (installations == nullptr) return FirebaseError::NotInitialized;
	return installationsGetToken(installations, force_refresh >= 0.5, callback);
}

FirebaseError firebase_installations_delete(const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::installations::Installations* installations = getInstallationsInstance();
	if (installations == nullptr) return FirebaseError::NotInitialized;
	return installationsDelete(installations, callback);
}

uint64_t firebase_installations_get_app()
{
    auto* installations = getInstallationsInstance();
    return installations ? wrapFirebaseApp(installations->app()) : 0;
}

uint64_t firebase_installations_get_instance_handle()
{
    auto* instance = getInstallationsInstance();
    return instance ? registerFirebasePointer(instance, GM_FB_TYPE_INSTALLATIONS) : 0;
}

uint64_t firebase_installations_get_instance_for_app(uint64_t app_ref)
{
    auto* app = resolveFirebaseApp(app_ref); if (!app) return 0;
    auto* instance = firebase::installations::Installations::GetInstance(app);
    if (!instance) { setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "Installations::GetInstance(app) returned null"); return 0; }
    return registerFirebasePointer(instance, GM_FB_TYPE_INSTALLATIONS);
}

uint64_t firebase_installations_instance_get_app(uint64_t instance_ref)
{
    auto* instance = resolveInstallations(instance_ref); return instance ? wrapFirebaseApp(instance->app()) : 0;
}

FirebaseError firebase_installations_instance_get_id(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    auto* instance = resolveInstallations(instance_ref); if (!instance) return FirebaseError::InvalidHandle;
    return installationsGetId(instance, callback);
}

FirebaseError firebase_installations_instance_get_token(uint64_t instance_ref, bool force_refresh, const std::optional<gm::wire::GMFunction>& callback)
{
    auto* instance = resolveInstallations(instance_ref); if (!instance) return FirebaseError::InvalidHandle;
    return installationsGetToken(instance, force_refresh, callback);
}

FirebaseError firebase_installations_instance_delete(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    auto* instance = resolveInstallations(instance_ref); if (!instance) return FirebaseError::InvalidHandle;
    return installationsDelete(instance, callback);
}
