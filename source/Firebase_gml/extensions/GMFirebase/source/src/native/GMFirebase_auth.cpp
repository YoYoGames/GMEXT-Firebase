// Firebase Auth - core Auth surface: singleton accessor, language/emulator
// config, sign-in/sign-up/sign-out, password reset, provider discovery, and
// the AuthStateListener/IdTokenListener add/remove pair.
//
// Every Future<T>-returning SDK call below follows the same shape: fetch the
// Auth instance, fire the call, and attach an OnCompletion lambda that (a)
// funnels the result through setFirebaseLastError() for callers polling
// firebase_last_error_code()/message(), and (b) - if a callback was supplied -
// also calls it directly with (error_code, error_message, ...results). Doing
// both means a GML caller can use whichever of the two error-reporting styles
// fits their code. GMFunction::call() is documented as thread-safe (it just
// appends to a mutex-guarded DispatchQueue), so it is called straight from
// these completion lambdas - which may run on Firebase's own worker threads -
// with no additional queueing of our own.
#include "GMFirebase_common.h"
#include "firebase/auth.h"

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

// ============================================================
// Auth singleton
// ============================================================

static firebase::auth::Auth* g_firebase_auth = nullptr;

firebase::auth::Auth* getFirebaseAuth()
{
	if (g_firebase_auth != nullptr)
		return g_firebase_auth;

	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(-1, "firebase::App is not initialized");
		return nullptr;
	}

	firebase::InitResult init_result = firebase::kInitResultSuccess;
	g_firebase_auth = firebase::auth::Auth::GetAuth(app, &init_result);

	if (g_firebase_auth == nullptr || init_result != firebase::kInitResultSuccess)
		setFirebaseLastError(static_cast<int>(init_result), "failed to initialize firebase::auth::Auth");

	return g_firebase_auth;
}

bool firebase_auth_get_auth()
{
	return getFirebaseAuth() != nullptr;
}

// ============================================================
// Language / emulator configuration
// ============================================================

std::string firebase_auth_language_code()
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return std::string();

	return auth->language_code();
}

void firebase_auth_set_language_code(std::string_view language_code)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return;

	std::string language_code_str(language_code);
	auth->set_language_code(language_code_str.c_str());
}

void firebase_auth_use_app_language()
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return;

	auth->UseAppLanguage();
}

void firebase_auth_use_emulator(std::string_view host, double port)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return;

	auth->UseEmulator(std::string(host), static_cast<uint32_t>(port));
}

// ============================================================
// Current user / sign-out
// ============================================================

std::optional<uint64_t> firebase_auth_current_user()
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return std::nullopt;

	firebase::auth::User user = auth->current_user();
	if (!user.is_valid())
		return std::nullopt;

	return wrapFirebaseUser(user);
}

void firebase_auth_sign_out()
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return;

	auth->SignOut();
}

// ============================================================
// Provider discovery
// ============================================================

void firebase_auth_fetch_providers_for_email(std::string_view email, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
	{
		if (callback)
			callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()), gm::wire::ArrayStream{});
		return;
	}

	std::string email_str(email);
	auth->FetchProvidersForEmail(email_str.c_str()).OnCompletion(
		[callback](const firebase::Future<firebase::auth::Auth::FetchProvidersResult>& f)
		{
			int code = f.error();
			const char* message = f.error_message();
			setFirebaseLastError(code, message != nullptr ? message : "");

			if (!callback)
				return;

			gm::wire::ArrayStream providers;
			if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
			{
				for (const std::string& provider_id : f.result()->providers)
					providers.push(std::string_view{ provider_id });
			}

			callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""), providers);
		});
}

// ============================================================
// Sign-in / sign-up
// ============================================================

void firebase_auth_sign_in_with_custom_token(std::string_view custom_token, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
	{
		if (callback)
			callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()), std::optional<uint64_t>{});
		return;
	}

	std::string token_str(custom_token);
	auth->SignInWithCustomToken(token_str.c_str()).OnCompletion(
		[callback](const firebase::Future<firebase::auth::AuthResult>& f)
		{
			int code = f.error();
			const char* message = f.error_message();
			setFirebaseLastError(code, message != nullptr ? message : "");

			if (!callback)
				return;

			std::optional<uint64_t> user_ref;
			if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
				user_ref = wrapFirebaseUser(f.result()->user);

			callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""), user_ref);
		});
}

void firebase_auth_sign_in_with_credential(uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	firebase::auth::Credential* credential = nullptr;
	validate_fb_ref_map(credential_ref, GM_FB_TYPE_AUTH_CREDENTIAL, firebase::auth::Credential, g_auth_credential_map, credential);

	if (auth == nullptr || credential == nullptr)
	{
		if (callback)
			callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()), std::optional<uint64_t>{});
		return;
	}

	auth->SignInWithCredential(*credential).OnCompletion(
		[callback](const firebase::Future<firebase::auth::User>& f)
		{
			int code = f.error();
			const char* message = f.error_message();
			setFirebaseLastError(code, message != nullptr ? message : "");

			if (!callback)
				return;

			std::optional<uint64_t> user_ref;
			if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
				user_ref = wrapFirebaseUser(*f.result());

			callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""), user_ref);
		});
}

void firebase_auth_sign_in_and_retrieve_data_with_credential(uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	firebase::auth::Credential* credential = nullptr;
	validate_fb_ref_map(credential_ref, GM_FB_TYPE_AUTH_CREDENTIAL, firebase::auth::Credential, g_auth_credential_map, credential);

	if (auth == nullptr || credential == nullptr)
	{
		if (callback)
			callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()), std::optional<uint64_t>{});
		return;
	}

	auth->SignInAndRetrieveDataWithCredential(*credential).OnCompletion(
		[callback](const firebase::Future<firebase::auth::AuthResult>& f)
		{
			int code = f.error();
			const char* message = f.error_message();
			setFirebaseLastError(code, message != nullptr ? message : "");

			if (!callback)
				return;

			std::optional<uint64_t> user_ref;
			if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
				user_ref = wrapFirebaseUser(f.result()->user);

			callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""), user_ref);
		});
}

void firebase_auth_sign_in_anonymously(const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
	{
		if (callback)
			callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()), std::optional<uint64_t>{});
		return;
	}

	auth->SignInAnonymously().OnCompletion(
		[callback](const firebase::Future<firebase::auth::AuthResult>& f)
		{
			int code = f.error();
			const char* message = f.error_message();
			setFirebaseLastError(code, message != nullptr ? message : "");

			if (!callback)
				return;

			std::optional<uint64_t> user_ref;
			if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
				user_ref = wrapFirebaseUser(f.result()->user);

			callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""), user_ref);
		});
}

void firebase_auth_sign_in_with_email_and_password(std::string_view email, std::string_view password, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
	{
		if (callback)
			callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()), std::optional<uint64_t>{});
		return;
	}

	std::string email_str(email);
	std::string password_str(password);
	auth->SignInWithEmailAndPassword(email_str.c_str(), password_str.c_str()).OnCompletion(
		[callback](const firebase::Future<firebase::auth::AuthResult>& f)
		{
			int code = f.error();
			const char* message = f.error_message();
			setFirebaseLastError(code, message != nullptr ? message : "");

			if (!callback)
				return;

			std::optional<uint64_t> user_ref;
			if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
				user_ref = wrapFirebaseUser(f.result()->user);

			callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""), user_ref);
		});
}

void firebase_auth_create_user_with_email_and_password(std::string_view email, std::string_view password, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
	{
		if (callback)
			callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()), std::optional<uint64_t>{});
		return;
	}

	std::string email_str(email);
	std::string password_str(password);
	auth->CreateUserWithEmailAndPassword(email_str.c_str(), password_str.c_str()).OnCompletion(
		[callback](const firebase::Future<firebase::auth::AuthResult>& f)
		{
			int code = f.error();
			const char* message = f.error_message();
			setFirebaseLastError(code, message != nullptr ? message : "");

			if (!callback)
				return;

			std::optional<uint64_t> user_ref;
			if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
				user_ref = wrapFirebaseUser(f.result()->user);

			callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""), user_ref);
		});
}

// ============================================================
// Password reset
// ============================================================

void firebase_auth_send_password_reset_email(std::string_view email, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
	{
		if (callback)
			callback->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string(firebase_last_error_message()));
		return;
	}

	std::string email_str(email);
	auth->SendPasswordResetEmail(email_str.c_str()).OnCompletion(
		[callback](const firebase::Future<void>& f)
		{
			int code = f.error();
			const char* message = f.error_message();
			setFirebaseLastError(code, message != nullptr ? message : "");

			if (callback)
				callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""));
		});
}

// ============================================================
// AuthStateListener / IdTokenListener
// ============================================================
// Each listener is a small heap-allocated subclass that owns its own
// gm::wire::GMFunction. Its heap address is the ref GML gets back (packed
// under GM_FB_TYPE_AUTH_STATE_LISTENER/GM_FB_TYPE_AUTH_ID_TOKEN_LISTENER); the
// remove function looks it back up via validate_fb_ref_ptr, unregisters it
// from Auth, and deletes it. No shared global map/mutex is needed - the
// pointer itself is the identity, exactly like FMOD's own SDK-owned handles.

namespace
{
	class GmAuthStateListener : public firebase::auth::AuthStateListener
	{
	public:
		explicit GmAuthStateListener(gm::wire::GMFunction callback) : callback_(std::move(callback)) {}

		void OnAuthStateChanged(firebase::auth::Auth* auth) override
		{
			std::optional<uint64_t> user_ref;
			if (auth != nullptr)
			{
				firebase::auth::User user = auth->current_user();
				if (user.is_valid())
					user_ref = wrapFirebaseUser(user);
			}

			callback_.call(user_ref);
		}

	private:
		gm::wire::GMFunction callback_;
	};

	class GmIdTokenListener : public firebase::auth::IdTokenListener
	{
	public:
		explicit GmIdTokenListener(gm::wire::GMFunction callback) : callback_(std::move(callback)) {}

		void OnIdTokenChanged(firebase::auth::Auth* auth) override
		{
			std::optional<uint64_t> user_ref;
			if (auth != nullptr)
			{
				firebase::auth::User user = auth->current_user();
				if (user.is_valid())
					user_ref = wrapFirebaseUser(user);
			}

			callback_.call(user_ref);
		}

	private:
		gm::wire::GMFunction callback_;
	};
}

std::optional<uint64_t> firebase_auth_add_state_listener(const gm::wire::GMFunction& callback)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return std::nullopt;

	GmAuthStateListener* listener = new GmAuthStateListener(callback);
	auth->AddAuthStateListener(listener);

	return packFirebaseRef(static_cast<uint32_t>(reinterpret_cast<uintptr_t>(listener)), GM_FB_TYPE_AUTH_STATE_LISTENER);
}

void firebase_auth_remove_state_listener(uint64_t listener_ref)
{
	GmAuthStateListener* listener = nullptr;
	validate_fb_ref_ptr(listener_ref, GM_FB_TYPE_AUTH_STATE_LISTENER, GmAuthStateListener, listener);
	if (listener == nullptr)
		return;

	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth != nullptr)
		auth->RemoveAuthStateListener(listener);

	delete listener;
}

std::optional<uint64_t> firebase_auth_add_id_token_listener(const gm::wire::GMFunction& callback)
{
	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth == nullptr)
		return std::nullopt;

	GmIdTokenListener* listener = new GmIdTokenListener(callback);
	auth->AddIdTokenListener(listener);

	return packFirebaseRef(static_cast<uint32_t>(reinterpret_cast<uintptr_t>(listener)), GM_FB_TYPE_AUTH_ID_TOKEN_LISTENER);
}

void firebase_auth_remove_id_token_listener(uint64_t listener_ref)
{
	GmIdTokenListener* listener = nullptr;
	validate_fb_ref_ptr(listener_ref, GM_FB_TYPE_AUTH_ID_TOKEN_LISTENER, GmIdTokenListener, listener);
	if (listener == nullptr)
		return;

	firebase::auth::Auth* auth = getFirebaseAuth();
	if (auth != nullptr)
		auth->RemoveIdTokenListener(listener);

	delete listener;
}
