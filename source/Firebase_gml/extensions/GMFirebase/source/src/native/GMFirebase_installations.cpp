#include "GMFirebase_common.h"
#include "firebase/installations.h"

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

namespace
{
	// Installations::GetInstance(app) is the SDK's per-App singleton: the same
	// pointer every call, owned by the SDK and deleted with the App, so the
	// handle is registered once (the pointer registry dedups by address) and
	// never released.
	uint64_t registerInstallations(firebase::App* app, const char* function)
	{
		// Confirmed against firebase/installations.h: GetInstance(App*) has no
		// InitResult* out-param on this SDK build, unlike some other product
		// singletons.
		firebase::installations::Installations* installations = firebase::installations::Installations::GetInstance(app);
		if (installations == nullptr)
		{
			setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, std::string(function) + ": Installations::GetInstance() returned null");
			return 0;
		}
		return registerFirebasePointer(installations, GM_FB_TYPE_INSTALLATIONS);
	}

	firebase::installations::Installations* resolveInstallations(uint64_t ref)
	{
		return static_cast<firebase::installations::Installations*>(resolveFirebasePointer(ref, GM_FB_TYPE_INSTALLATIONS));
	}
}

uint64_t firebase_installations_get_instance()
{
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_installations_get_instance: no firebase::App - call firebase_app_initialize() first");
		return 0;
	}
	return registerInstallations(app, "firebase_installations_get_instance");
}

uint64_t firebase_installations_get_instance_for_app(uint64_t app_ref)
{
	firebase::App* app = resolveFirebaseApp(app_ref);
	if (app == nullptr) return 0;
	return registerInstallations(app, "firebase_installations_get_instance_for_app");
}

uint64_t firebase_installations_get_app(uint64_t installations_ref)
{
	firebase::installations::Installations* installations = resolveInstallations(installations_ref);
	return installations ? wrapFirebaseApp(installations->app()) : 0;
}

FirebaseError firebase_installations_get_id(uint64_t installations_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::installations::Installations* installations = resolveInstallations(installations_ref);
	if (installations == nullptr) return FirebaseError::InvalidHandle;
	installations->GetId().OnCompletion([callback](const firebase::Future<std::string>& f)
	{
		completeFuture(callback, f, [](const std::string& id)
		{
			return std::string_view{ id };
		});
	});
	return FirebaseError::Ok;
}

FirebaseError firebase_installations_get_token(uint64_t installations_ref, bool force_refresh, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::installations::Installations* installations = resolveInstallations(installations_ref);
	if (installations == nullptr) return FirebaseError::InvalidHandle;
	installations->GetToken(force_refresh).OnCompletion([callback](const firebase::Future<std::string>& f)
	{
		completeFuture(callback, f, [](const std::string& token)
		{
			return std::string_view{ token };
		});
	});
	return FirebaseError::Ok;
}

FirebaseError firebase_installations_delete(uint64_t installations_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::installations::Installations* installations = resolveInstallations(installations_ref);
	if (installations == nullptr) return FirebaseError::InvalidHandle;
	installations->Delete().OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}
