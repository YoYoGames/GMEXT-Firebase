// Firebase Auth - Credential value type + identity-provider factory wrappers.
//
// firebase::auth::Credential (and the PhoneAuthCredential subclass) are cheap
// copyable value objects with no address of their own, so - like every other
// value-typed Firebase reference in this extension - they live in a
// registration map keyed by GM_FB_TYPE_AUTH_CREDENTIAL. Unlike the other
// per-module maps in this extension, this one is declared `extern` in
// GMFirebase_common.h instead of file-static, because GMFirebase_auth.cpp and
// GMFirebase_auth_user.cpp both need to resolve credential refs supplied by
// GML as sign-in/link/reauthenticate inputs (see that header for the longer
// explanation).
#include "GMFirebase_common.h"
#include "firebase/auth.h"

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

// Definition of the extern registry declared in GMFirebase_common.h.
std::map<uint32_t, firebase::auth::Credential> g_auth_credential_map;
uint32_t g_auth_credential_index = 0;

namespace
{
	uint64_t wrapCredential(firebase::auth::Credential credential)
	{
		uint32_t id = registerFirebaseValue(std::move(credential), g_auth_credential_index, g_auth_credential_map);
		return packFirebaseRef(id, GM_FB_TYPE_AUTH_CREDENTIAL);
	}
}

// ============================================================
// Credential (generic accessors)
// ============================================================

std::string firebase_auth_credential_provider(uint64_t credential_ref)
{
	firebase::auth::Credential* credential = nullptr;
	validate_fb_ref_map(credential_ref, GM_FB_TYPE_AUTH_CREDENTIAL, firebase::auth::Credential, g_auth_credential_map, credential);
	if (credential == nullptr)
		return std::string();

	return credential->provider();
}

bool firebase_auth_credential_is_valid(uint64_t credential_ref)
{
	firebase::auth::Credential* credential = nullptr;
	validate_fb_ref_map(credential_ref, GM_FB_TYPE_AUTH_CREDENTIAL, firebase::auth::Credential, g_auth_credential_map, credential);
	if (credential == nullptr)
		return false;

	return credential->is_valid();
}

void firebase_auth_credential_release(uint64_t credential_ref)
{
	if (gm_fb_ref_ext(credential_ref) != GM_FIREBASE_EXT || gm_fb_ref_type(credential_ref) != GM_FB_TYPE_AUTH_CREDENTIAL)
	{
		setFirebaseLastError(-1, "invalid handle");
		return;
	}

	unregisterFirebaseValue(gm_fb_ref_id(credential_ref), g_auth_credential_map);
}

// ============================================================
// Identity provider factories
// ============================================================
// Every one of these is a synchronous, purely local value construction (no
// network round-trip), except GameCenterAuthProvider::GetCredential, which
// talks to the local GameCenter session and is genuinely async.

uint64_t firebase_auth_email_auth_provider_get_credential(std::string_view email, std::string_view password)
{
	std::string email_str(email);
	std::string password_str(password);
	return wrapCredential(firebase::auth::EmailAuthProvider::GetCredential(email_str.c_str(), password_str.c_str()));
}

uint64_t firebase_auth_facebook_auth_provider_get_credential(std::string_view access_token)
{
	std::string token_str(access_token);
	return wrapCredential(firebase::auth::FacebookAuthProvider::GetCredential(token_str.c_str()));
}

void firebase_auth_game_center_auth_provider_get_credential(const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::auth::GameCenterAuthProvider::GetCredential().OnCompletion(
		[callback](const firebase::Future<firebase::auth::Credential>& f)
		{
			int code = f.error();
			const char* message = f.error_message();
			setFirebaseLastError(code, message != nullptr ? message : "");

			if (!callback)
				return;

			std::optional<uint64_t> credential_ref;
			if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
				credential_ref = wrapCredential(*f.result());

			callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""), credential_ref);
		});
}

bool firebase_auth_game_center_auth_provider_is_player_authenticated()
{
	return firebase::auth::GameCenterAuthProvider::IsPlayerAuthenticated();
}

uint64_t firebase_auth_github_auth_provider_get_credential(std::string_view token)
{
	std::string token_str(token);
	return wrapCredential(firebase::auth::GitHubAuthProvider::GetCredential(token_str.c_str()));
}

uint64_t firebase_auth_google_auth_provider_get_credential(std::string_view id_token, std::string_view access_token)
{
	std::string id_token_str(id_token);
	std::string access_token_str(access_token);
	return wrapCredential(firebase::auth::GoogleAuthProvider::GetCredential(id_token_str.c_str(), access_token_str.c_str()));
}

uint64_t firebase_auth_oauth_provider_get_credential(std::string_view provider_id, std::string_view id_token, std::string_view access_token)
{
	std::string provider_id_str(provider_id);
	std::string id_token_str(id_token);
	std::string access_token_str(access_token);
	return wrapCredential(firebase::auth::OAuthProvider::GetCredential(provider_id_str.c_str(), id_token_str.c_str(), access_token_str.c_str()));
}

uint64_t firebase_auth_oauth_provider_get_credential_with_nonce(std::string_view provider_id, std::string_view id_token, std::string_view raw_nonce, std::string_view access_token)
{
	std::string provider_id_str(provider_id);
	std::string id_token_str(id_token);
	std::string raw_nonce_str(raw_nonce);
	std::string access_token_str(access_token);
	return wrapCredential(firebase::auth::OAuthProvider::GetCredential(provider_id_str.c_str(), id_token_str.c_str(), raw_nonce_str.c_str(), access_token_str.c_str()));
}

uint64_t firebase_auth_play_games_auth_provider_get_credential(std::string_view server_auth_code)
{
	std::string code_str(server_auth_code);
	return wrapCredential(firebase::auth::PlayGamesAuthProvider::GetCredential(code_str.c_str()));
}

uint64_t firebase_auth_twitter_auth_provider_get_credential(std::string_view token, std::string_view secret)
{
	std::string token_str(token);
	std::string secret_str(secret);
	return wrapCredential(firebase::auth::TwitterAuthProvider::GetCredential(token_str.c_str(), secret_str.c_str()));
}

// ============================================================
// Phone Auth - deliberate stub for this pass
// ============================================================
// PhoneAuthProvider::VerifyPhoneNumber() drives a platform-native UI flow
// (reCAPTCHA on iOS/Web, the SMS retriever on Android) through a
// PhoneAuthProvider::Listener with OnCodeSent/OnVerificationCompleted/
// OnVerificationFailed/OnCodeAutoRetrievalTimeOut virtuals, plus a
// ForceResendingToken you must keep alive across a possible resend. Wiring
// that up correctly (including surfacing a captcha/SMS UI on mobile) is a
// substantial, platform-specific piece of work of its own and was explicitly
// scoped out of this pass. What's here is just enough of a handle for GML
// code to call and receive a clear, typed "not implemented yet" error rather
// than a missing function - not a working phone sign-in flow.
double firebase_auth_phone_verify_phone_number(std::string_view phone_number, double timeout_ms)
{
	(void)phone_number;
	(void)timeout_ms;

	const int code = firebase::auth::kAuthErrorUnimplemented;
	setFirebaseLastError(code, "Phone number verification is not implemented in this build of GMFirebase yet.");
	return static_cast<double>(code);
}
