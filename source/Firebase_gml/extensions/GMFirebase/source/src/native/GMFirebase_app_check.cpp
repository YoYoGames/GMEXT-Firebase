#include "GMFirebase_common.h"
#include "firebase/app_check.h"
#include "firebase/app_check/debug_provider.h"
#include "firebase/app_check/device_check_provider.h"
#include "firebase/app_check/play_integrity_provider.h"
#include "firebase/app_check/app_attest_provider.h"

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

namespace
{
	firebase::app_check::AppCheck* getAppCheckInstance()
	{
		firebase::App* app = getFirebaseApp();
		if (app == nullptr)
		{
			setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_app_check: no firebase::App - call firebase_app_initialize() first");
			return nullptr;
		}

		firebase::app_check::AppCheck* app_check = firebase::app_check::AppCheck::GetInstance(app);
		if (app_check == nullptr)
			setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_app_check: AppCheck::GetInstance() returned null");

		return app_check;
	}

	gm_structs::FirebaseAppCheckToken makeAppCheckToken(const firebase::app_check::AppCheckToken& token)
	{
		gm_structs::FirebaseAppCheckToken out;
		out.token = token.token;
		out.expire_time_millis = static_cast<double>(token.expire_time_millis);
		return out;
	}

	// Shared tail of every token Future: the token on success, undefined on
	// failure - never an empty struct.
	void completeTokenFuture(const std::optional<gm::wire::GMFunction>& callback,
		const firebase::Future<firebase::app_check::AppCheckToken>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");

		if (!callback.has_value())
			return;

		const double code = static_cast<double>(f.error());
		const std::string_view message{ f.error_message() ? f.error_message() : "" };
		if (f.error() == 0 && f.result() != nullptr)
			callback->call(code, message, makeAppCheckToken(*f.result()));
		else
			callback->call(code, message, std::optional<gm_structs::FirebaseAppCheckToken>{});
	}

	// Heap-allocated so its address can double as the GM_FB_TYPE_APPCHECK_LISTENER
	// ref payload; owns the single GMFunction it forwards token changes to.
	// Firebase calls OnAppCheckTokenChanged() on its own UI/background thread -
	// GMFunction::call() is internally mutex-guarded, so it is dispatched
	// directly with no extra synchronization here.
	class GmAppCheckListener : public firebase::app_check::AppCheckListener
	{
	public:
		explicit GmAppCheckListener(const gm::wire::GMFunction& fn) : callback(fn) {}

		void OnAppCheckTokenChanged(const firebase::app_check::AppCheckToken& token) override
		{
			callback.call(makeAppCheckToken(token));
		}

	private:
		gm::wire::GMFunction callback;
	};

	std::mutex g_app_check_listener_owner_mutex;
	std::map<firebase::app_check::AppCheckListener*, firebase::app_check::AppCheck*> g_app_check_listener_owner;

	firebase::app_check::AppCheck* resolveAppCheck(uint64_t ref)
	{
		return static_cast<firebase::app_check::AppCheck*>(resolveFirebasePointer(ref, GM_FB_TYPE_APPCHECK));
	}
}

// ============================================================
// Provider factory selection
// ============================================================
//
// firebase::App::Create() must not have run yet for SetAppCheckProviderFactory()
// to take effect on some platforms (see app_check.h), so call this before
// firebase_app_initialize(). This SDK build only ships Debug, DeviceCheck,
// PlayIntegrity and AppAttest provider factories - there is no reCAPTCHA
// factory header under firebase/app_check/ to wrap, unlike some other
// Firebase SDK surfaces (Web/Android) that expose one.
//
// The Debug provider is deliberately selectable at runtime rather than
// compiled out of release builds. This extension ships as one prebuilt binary
// that every game uses in both its development and its shipped builds, so a
// build-type guard here would remove the only way to obtain App Check tokens
// on desktop or an emulator during development. As with the Firebase Unity
// SDK, the developer chooses the Debug provider only from a development
// configuration (a configuration-scoped #macro), never in a build they ship -
// a debug token in a shipped binary is an App Check bypass.
void firebase_app_check_set_provider_factory(double provider)
{
	firebase::app_check::AppCheckProviderFactory* factory = nullptr;

	switch (static_cast<FirebaseAppCheckProvider>(static_cast<int>(provider)))
	{
	case FirebaseAppCheckProvider::Debug:
		factory = firebase::app_check::DebugAppCheckProviderFactory::GetInstance();
		break;
	case FirebaseAppCheckProvider::DeviceCheck:
		factory = firebase::app_check::DeviceCheckProviderFactory::GetInstance();
		break;
	case FirebaseAppCheckProvider::PlayIntegrity:
		factory = firebase::app_check::PlayIntegrityProviderFactory::GetInstance();
		break;
	case FirebaseAppCheckProvider::AppAttest:
		factory = firebase::app_check::AppAttestProviderFactory::GetInstance();
		break;
	default:
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_app_check_set_provider_factory: unknown provider");
		return;
	}

	firebase::app_check::AppCheck::SetAppCheckProviderFactory(factory);
}

void firebase_app_check_debug_provider_set_debug_token(std::string_view token)
{
	firebase::app_check::DebugAppCheckProviderFactory* factory = firebase::app_check::DebugAppCheckProviderFactory::GetInstance();
	if (factory == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_app_check_debug_provider_set_debug_token: DebugAppCheckProviderFactory::GetInstance() returned null");
		return;
	}
	factory->SetDebugToken(std::string(token));
}

// ============================================================
// Token auto-refresh / manual fetch
// ============================================================

void firebase_app_check_set_token_auto_refresh_enabled(double enabled)
{
	firebase::app_check::AppCheck* app_check = getAppCheckInstance();
	if (app_check == nullptr) return;
	app_check->SetTokenAutoRefreshEnabled(enabled >= 0.5);
}

FirebaseError firebase_app_check_get_token(double force_refresh, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::app_check::AppCheck* app_check = getAppCheckInstance();
	if (app_check == nullptr) return FirebaseError::NotInitialized;

	firebase::Future<firebase::app_check::AppCheckToken> future = app_check->GetAppCheckToken(force_refresh >= 0.5);
	future.OnCompletion([callback](const firebase::Future<firebase::app_check::AppCheckToken>& f)
	{
		completeTokenFuture(callback, f);
	});
	return FirebaseError::Ok;
}

FirebaseError firebase_app_check_get_limited_use_token(const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::app_check::AppCheck* app_check = getAppCheckInstance();
	if (app_check == nullptr) return FirebaseError::NotInitialized;

	firebase::Future<firebase::app_check::AppCheckToken> future = app_check->GetLimitedUseAppCheckToken();
	future.OnCompletion([callback](const firebase::Future<firebase::app_check::AppCheckToken>& f)
	{
		completeTokenFuture(callback, f);
	});
	return FirebaseError::Ok;
}

// ============================================================
// Listener
// ============================================================

uint64_t firebase_app_check_add_listener(const std::optional<gm::wire::GMFunction>& callback)
{
	if (!callback.has_value())
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_app_check_add_listener: a callback is required");
		return 0;
	}

	firebase::app_check::AppCheck* app_check = getAppCheckInstance();
	if (app_check == nullptr) return 0;

	GmAppCheckListener* listener = new GmAppCheckListener(callback.value());
	app_check->AddAppCheckListener(listener);
	{ std::lock_guard<std::mutex> lock(g_app_check_listener_owner_mutex); g_app_check_listener_owner[listener] = app_check; }

	return registerFirebasePointer(listener, GM_FB_TYPE_APPCHECK_LISTENER);
}

double firebase_app_check_remove_listener(uint64_t listener_ref)
{
	firebase::app_check::AppCheckListener* listener = nullptr;
	validate_fb_ref_ptr(listener_ref, GM_FB_TYPE_APPCHECK_LISTENER, firebase::app_check::AppCheckListener, listener);
	if (listener == nullptr) return 0.0;

	firebase::app_check::AppCheck* app_check = nullptr;
	{
		std::lock_guard<std::mutex> lock(g_app_check_listener_owner_mutex);
		auto it = g_app_check_listener_owner.find(listener);
		if (it != g_app_check_listener_owner.end()) { app_check = it->second; g_app_check_listener_owner.erase(it); }
	}
	if (app_check != nullptr) app_check->RemoveAppCheckListener(listener);

	listener = static_cast<firebase::app_check::AppCheckListener*>(unregisterFirebasePointer(listener_ref, GM_FB_TYPE_APPCHECK_LISTENER));
	delete listener;
	return 1.0;
}

uint64_t firebase_app_check_get_app()
{
    auto* app_check = getAppCheckInstance(); return app_check ? wrapFirebaseApp(app_check->app()) : 0;
}

uint64_t firebase_app_check_get_instance_handle()
{
    auto* instance = getAppCheckInstance(); return instance ? registerFirebasePointer(instance, GM_FB_TYPE_APPCHECK) : 0;
}

uint64_t firebase_app_check_get_instance_for_app(uint64_t app_ref)
{
    auto* app = resolveFirebaseApp(app_ref); if (!app) return 0;
    auto* instance = firebase::app_check::AppCheck::GetInstance(app);
    if (!instance) { setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "AppCheck::GetInstance(app) returned null"); return 0; }
    return registerFirebasePointer(instance, GM_FB_TYPE_APPCHECK);
}

uint64_t firebase_app_check_instance_get_app(uint64_t instance_ref)
{
    auto* instance = resolveAppCheck(instance_ref); return instance ? wrapFirebaseApp(instance->app()) : 0;
}

void firebase_app_check_instance_set_token_auto_refresh_enabled(uint64_t instance_ref, bool enabled)
{
    auto* instance = resolveAppCheck(instance_ref); if (instance) instance->SetTokenAutoRefreshEnabled(enabled);
}

FirebaseError firebase_app_check_instance_get_token(uint64_t instance_ref, bool force_refresh, const std::optional<gm::wire::GMFunction>& callback)
{
    auto* instance = resolveAppCheck(instance_ref); if (!instance) return FirebaseError::InvalidHandle;
    instance->GetAppCheckToken(force_refresh).OnCompletion([callback](const firebase::Future<firebase::app_check::AppCheckToken>& f){
        completeTokenFuture(callback, f);
    }); return FirebaseError::Ok;
}

FirebaseError firebase_app_check_instance_get_limited_use_token(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    auto* instance = resolveAppCheck(instance_ref); if (!instance) return FirebaseError::InvalidHandle;
    instance->GetLimitedUseAppCheckToken().OnCompletion([callback](const firebase::Future<firebase::app_check::AppCheckToken>& f){
        completeTokenFuture(callback, f);
    }); return FirebaseError::Ok;
}

uint64_t firebase_app_check_instance_add_listener(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    auto* instance = resolveAppCheck(instance_ref);
    if (!instance || !callback) { if(!callback) setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "App Check listener callback is required"); return 0; }
    auto* listener = new GmAppCheckListener(*callback); instance->AddAppCheckListener(listener);
    { std::lock_guard<std::mutex> lock(g_app_check_listener_owner_mutex); g_app_check_listener_owner[listener] = instance; }
    return registerFirebasePointer(listener, GM_FB_TYPE_APPCHECK_LISTENER);
}
