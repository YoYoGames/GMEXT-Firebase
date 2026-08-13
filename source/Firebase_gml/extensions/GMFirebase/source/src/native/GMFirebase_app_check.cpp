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
			setFirebaseLastError(-1, "firebase_app_check: no firebase::App - call firebase_app_initialize() first");
			return nullptr;
		}

		firebase::app_check::AppCheck* app_check = firebase::app_check::AppCheck::GetInstance(app);
		if (app_check == nullptr)
			setFirebaseLastError(-1, "firebase_app_check: AppCheck::GetInstance() returned null");

		return app_check;
	}

	void pushTokenStruct(const firebase::app_check::AppCheckToken& token, gm::wire::StructStream& out)
	{
		out.add("token", std::string_view{ token.token });
		out.add("expire_time_millis", static_cast<double>(token.expire_time_millis));
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
			gm::wire::StructStream token_struct;
			pushTokenStruct(token, token_struct);
			callback.call(token_struct);
		}

	private:
		gm::wire::GMFunction callback;
	};
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
void firebase_app_check_set_provider_factory(double provider)
{
	firebase::app_check::AppCheckProviderFactory* factory = nullptr;

	switch (static_cast<int>(provider))
	{
	case 0: // Debug
		factory = firebase::app_check::DebugAppCheckProviderFactory::GetInstance();
		break;
	case 1: // DeviceCheck
		factory = firebase::app_check::DeviceCheckProviderFactory::GetInstance();
		break;
	case 2: // PlayIntegrity
		factory = firebase::app_check::PlayIntegrityProviderFactory::GetInstance();
		break;
	case 3: // AppAttest
		factory = firebase::app_check::AppAttestProviderFactory::GetInstance();
		break;
	default:
		setFirebaseLastError(-1, "firebase_app_check_set_provider_factory: unknown provider");
		return;
	}

	firebase::app_check::AppCheck::SetAppCheckProviderFactory(factory);
}

void firebase_app_check_debug_provider_set_debug_token(std::string_view token)
{
	firebase::app_check::DebugAppCheckProviderFactory* factory = firebase::app_check::DebugAppCheckProviderFactory::GetInstance();
	if (factory == nullptr)
	{
		setFirebaseLastError(-1, "firebase_app_check_debug_provider_set_debug_token: DebugAppCheckProviderFactory::GetInstance() returned null");
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

double firebase_app_check_get_token(double force_refresh, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::app_check::AppCheck* app_check = getAppCheckInstance();
	if (app_check == nullptr) return 0.0;

	firebase::Future<firebase::app_check::AppCheckToken> future = app_check->GetAppCheckToken(force_refresh >= 0.5);
	future.OnCompletion([callback](const firebase::Future<firebase::app_check::AppCheckToken>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");

		if (!callback.has_value())
			return;

		gm::wire::StructStream token_struct;
		if (f.error() == 0 && f.result() != nullptr)
			pushTokenStruct(*f.result(), token_struct);

		callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" }, token_struct);
	});
	return 1.0;
}

double firebase_app_check_get_limited_use_token(const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::app_check::AppCheck* app_check = getAppCheckInstance();
	if (app_check == nullptr) return 0.0;

	firebase::Future<firebase::app_check::AppCheckToken> future = app_check->GetLimitedUseAppCheckToken();
	future.OnCompletion([callback](const firebase::Future<firebase::app_check::AppCheckToken>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");

		if (!callback.has_value())
			return;

		gm::wire::StructStream token_struct;
		if (f.error() == 0 && f.result() != nullptr)
			pushTokenStruct(*f.result(), token_struct);

		callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" }, token_struct);
	});
	return 1.0;
}

// ============================================================
// Listener
// ============================================================

uint64_t firebase_app_check_add_listener(const std::optional<gm::wire::GMFunction>& callback)
{
	if (!callback.has_value())
	{
		setFirebaseLastError(-1, "firebase_app_check_add_listener: a callback is required");
		return 0;
	}

	firebase::app_check::AppCheck* app_check = getAppCheckInstance();
	if (app_check == nullptr) return 0;

	GmAppCheckListener* listener = new GmAppCheckListener(callback.value());
	app_check->AddAppCheckListener(listener);

	uint32_t id = static_cast<uint32_t>(reinterpret_cast<uintptr_t>(listener) & 0xFFFFFFFFu);
	return packFirebaseRef(id, GM_FB_TYPE_APPCHECK_LISTENER);
}

double firebase_app_check_remove_listener(uint64_t listener_ref)
{
	firebase::app_check::AppCheckListener* listener = nullptr;
	validate_fb_ref_ptr(listener_ref, GM_FB_TYPE_APPCHECK_LISTENER, firebase::app_check::AppCheckListener, listener);
	if (listener == nullptr) return 0.0;

	firebase::app_check::AppCheck* app_check = getAppCheckInstance();
	if (app_check != nullptr)
		app_check->RemoveAppCheckListener(listener);

	delete listener;
	return 1.0;
}
