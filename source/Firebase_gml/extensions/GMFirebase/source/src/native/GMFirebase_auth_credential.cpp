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
    std::map<uint32_t, firebase::auth::PhoneAuthCredential> g_auth_phone_credential_map;
    uint32_t g_auth_phone_credential_index = 0;
    std::map<uint32_t, firebase::auth::PhoneAuthProvider::ForceResendingToken> g_auth_phone_resend_map;
    uint32_t g_auth_phone_resend_index = 0;

    uint64_t wrapPhoneCredential(const firebase::auth::PhoneAuthCredential& credential)
    {
        uint32_t id = registerFirebaseValue(credential, g_auth_phone_credential_index, g_auth_phone_credential_map);
        return packFirebaseRef(id, GM_FB_TYPE_AUTH_PHONE_CREDENTIAL);
    }

    firebase::auth::PhoneAuthCredential* resolvePhoneCredential(uint64_t ref)
    {
        firebase::auth::PhoneAuthCredential* out = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_AUTH_PHONE_CREDENTIAL, firebase::auth::PhoneAuthCredential, g_auth_phone_credential_map, out);
        return out;
    }

    uint64_t wrapResendToken(const firebase::auth::PhoneAuthProvider::ForceResendingToken& token)
    {
        uint32_t id = registerFirebaseValue(token, g_auth_phone_resend_index, g_auth_phone_resend_map);
        return packFirebaseRef(id, GM_FB_TYPE_AUTH_PHONE_RESEND_TOKEN);
    }

    firebase::auth::PhoneAuthProvider::ForceResendingToken* resolveResendToken(uint64_t ref)
    {
        if (ref == 0) return nullptr;
        firebase::auth::PhoneAuthProvider::ForceResendingToken* out = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_AUTH_PHONE_RESEND_TOKEN, firebase::auth::PhoneAuthProvider::ForceResendingToken, g_auth_phone_resend_map, out);
        return out;
    }

    class GMFirebasePhoneAuthListener final : public firebase::auth::PhoneAuthProvider::Listener
    {
    public:
        std::optional<gm::wire::GMFunction> on_verification_completed;
        std::optional<gm::wire::GMFunction> on_verification_failed;
        std::optional<gm::wire::GMFunction> on_code_sent;
        std::optional<gm::wire::GMFunction> on_timeout;

        GMFirebasePhoneAuthListener(const std::optional<gm::wire::GMFunction>& completed,
            const std::optional<gm::wire::GMFunction>& failed,
            const std::optional<gm::wire::GMFunction>& code_sent,
            const std::optional<gm::wire::GMFunction>& timeout)
            : on_verification_completed(completed), on_verification_failed(failed),
              on_code_sent(code_sent), on_timeout(timeout) {}

        void OnVerificationCompleted(firebase::auth::PhoneAuthCredential credential) override
        {
            if (on_verification_completed)
                on_verification_completed->call(wrapPhoneCredential(credential));
        }

        void OnVerificationFailed(const std::string& error) override
        {
            setFirebaseLastError(static_cast<int>(firebase::auth::kAuthErrorFailure), error);
            if (on_verification_failed)
                on_verification_failed->call(static_cast<double>(firebase::auth::kAuthErrorFailure), std::string_view{ error });
        }

        void OnCodeSent(const std::string& verification_id,
            const firebase::auth::PhoneAuthProvider::ForceResendingToken& force_resending_token) override
        {
            if (on_code_sent)
                on_code_sent->call(std::string_view{ verification_id }, wrapResendToken(force_resending_token));
        }

        void OnCodeAutoRetrievalTimeOut(const std::string& verification_id) override
        {
            if (on_timeout)
                on_timeout->call(std::string_view{ verification_id });
        }
    };
}

uint64_t wrapFirebaseAuthCredential(const firebase::auth::Credential& credential)
{
    uint32_t id = registerFirebaseValue(credential, g_auth_credential_index, g_auth_credential_map);
    return packFirebaseRef(id, GM_FB_TYPE_AUTH_CREDENTIAL);
}

bool resolveFirebaseAuthCredential(uint64_t ref, firebase::auth::Credential& out)
{
    if (gm_fb_ref_ext(ref) != GM_FIREBASE_EXT)
    {
        setFirebaseLastError(-1, "invalid handle");
        return false;
    }

    if (gm_fb_ref_type(ref) == GM_FB_TYPE_AUTH_CREDENTIAL)
    {
        auto it = g_auth_credential_map.find(gm_fb_ref_id(ref));
        if (it != g_auth_credential_map.end())
        {
            out = it->second;
            return true;
        }
    }
    else if (gm_fb_ref_type(ref) == GM_FB_TYPE_AUTH_PHONE_CREDENTIAL)
    {
        auto it = g_auth_phone_credential_map.find(gm_fb_ref_id(ref));
        if (it != g_auth_phone_credential_map.end())
        {
            out = static_cast<const firebase::auth::Credential&>(it->second);
            return true;
        }
    }

    setFirebaseLastError(-1, "invalid or stale auth credential handle");
    return false;
}

// ============================================================
// Credential (generic accessors)
// ============================================================

std::string firebase_auth_credential_provider(uint64_t credential_ref)
{
    firebase::auth::Credential credential;
    if (!resolveFirebaseAuthCredential(credential_ref, credential))
        return std::string();
    return credential.provider();
}

bool firebase_auth_credential_is_valid(uint64_t credential_ref)
{
    firebase::auth::Credential credential;
    return resolveFirebaseAuthCredential(credential_ref, credential) && credential.is_valid();
}

void firebase_auth_credential_release(uint64_t credential_ref)
{
    if (gm_fb_ref_ext(credential_ref) != GM_FIREBASE_EXT)
    {
        setFirebaseLastError(-1, "invalid handle");
        return;
    }

    if (gm_fb_ref_type(credential_ref) == GM_FB_TYPE_AUTH_CREDENTIAL)
        unregisterFirebaseValue(gm_fb_ref_id(credential_ref), g_auth_credential_map);
    else if (gm_fb_ref_type(credential_ref) == GM_FB_TYPE_AUTH_PHONE_CREDENTIAL)
        unregisterFirebaseValue(gm_fb_ref_id(credential_ref), g_auth_phone_credential_map);
    else
        setFirebaseLastError(-1, "invalid credential handle");
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
	return wrapFirebaseAuthCredential(firebase::auth::EmailAuthProvider::GetCredential(email_str.c_str(), password_str.c_str()));
}

uint64_t firebase_auth_facebook_auth_provider_get_credential(std::string_view access_token)
{
	std::string token_str(access_token);
	return wrapFirebaseAuthCredential(firebase::auth::FacebookAuthProvider::GetCredential(token_str.c_str()));
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
				credential_ref = wrapFirebaseAuthCredential(*f.result());

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
	return wrapFirebaseAuthCredential(firebase::auth::GitHubAuthProvider::GetCredential(token_str.c_str()));
}

uint64_t firebase_auth_google_auth_provider_get_credential(std::string_view id_token, std::string_view access_token)
{
	std::string id_token_str(id_token);
	std::string access_token_str(access_token);
	return wrapFirebaseAuthCredential(firebase::auth::GoogleAuthProvider::GetCredential(id_token_str.c_str(), access_token_str.c_str()));
}

uint64_t firebase_auth_oauth_provider_get_credential(std::string_view provider_id, std::string_view id_token, std::string_view access_token)
{
	std::string provider_id_str(provider_id);
	std::string id_token_str(id_token);
	std::string access_token_str(access_token);
	return wrapFirebaseAuthCredential(firebase::auth::OAuthProvider::GetCredential(provider_id_str.c_str(), id_token_str.c_str(), access_token_str.c_str()));
}

uint64_t firebase_auth_oauth_provider_get_credential_with_nonce(std::string_view provider_id, std::string_view id_token, std::string_view raw_nonce, std::string_view access_token)
{
	std::string provider_id_str(provider_id);
	std::string id_token_str(id_token);
	std::string raw_nonce_str(raw_nonce);
	std::string access_token_str(access_token);
	return wrapFirebaseAuthCredential(firebase::auth::OAuthProvider::GetCredential(provider_id_str.c_str(), id_token_str.c_str(), raw_nonce_str.c_str(), access_token_str.c_str()));
}

uint64_t firebase_auth_play_games_auth_provider_get_credential(std::string_view server_auth_code)
{
	std::string code_str(server_auth_code);
	return wrapFirebaseAuthCredential(firebase::auth::PlayGamesAuthProvider::GetCredential(code_str.c_str()));
}

uint64_t firebase_auth_twitter_auth_provider_get_credential(std::string_view token, std::string_view secret)
{
	std::string token_str(token);
	std::string secret_str(secret);
	return wrapFirebaseAuthCredential(firebase::auth::TwitterAuthProvider::GetCredential(token_str.c_str(), secret_str.c_str()));
}

// ============================================================
// Phone Auth
// ============================================================

uint64_t firebase_auth_phone_verify_phone_number(std::string_view phone_number, double timeout_ms,
    uint64_t force_resending_token_ref,
    const std::optional<gm::wire::GMFunction>& on_verification_completed,
    const std::optional<gm::wire::GMFunction>& on_verification_failed,
    const std::optional<gm::wire::GMFunction>& on_code_sent,
    const std::optional<gm::wire::GMFunction>& on_timeout)
{
    firebase::auth::Auth* auth = getFirebaseAuth();
    if (auth == nullptr) return 0;

    auto* listener = new GMFirebasePhoneAuthListener(on_verification_completed, on_verification_failed, on_code_sent, on_timeout);
    uint64_t listener_ref = registerFirebasePointer(listener, GM_FB_TYPE_AUTH_PHONE_LISTENER);
    if (listener_ref == 0)
    {
        delete listener;
        return 0;
    }

    firebase::auth::PhoneAuthOptions options;
    options.phone_number = std::string(phone_number);
    options.timeout_milliseconds = timeout_ms <= 0.0 ? 0u : static_cast<uint32_t>(timeout_ms);
    options.ui_parent = nullptr; // Firebase uses the App's default Activity/UIView on mobile.
    options.force_resending_token = resolveResendToken(force_resending_token_ref);
    if (force_resending_token_ref != 0 && options.force_resending_token == nullptr)
    {
        unregisterFirebasePointer(listener_ref, GM_FB_TYPE_AUTH_PHONE_LISTENER);
        delete listener;
        return 0;
    }

    firebase::auth::PhoneAuthProvider::GetInstance(auth).VerifyPhoneNumber(options, listener);
    return listener_ref;
}

uint64_t firebase_auth_phone_get_credential(std::string_view verification_id, std::string_view verification_code)
{
    firebase::auth::Auth* auth = getFirebaseAuth();
    if (auth == nullptr) return 0;
    std::string id(verification_id), code(verification_code);
    return wrapPhoneCredential(firebase::auth::PhoneAuthProvider::GetInstance(auth).GetCredential(id.c_str(), code.c_str()));
}

std::string firebase_auth_phone_credential_sms_code(uint64_t credential_ref)
{
    auto* credential = resolvePhoneCredential(credential_ref);
    return credential ? credential->sms_code() : std::string();
}

void firebase_auth_phone_resending_token_release(uint64_t token_ref)
{
    if (gm_fb_ref_ext(token_ref) != GM_FIREBASE_EXT || gm_fb_ref_type(token_ref) != GM_FB_TYPE_AUTH_PHONE_RESEND_TOKEN)
    {
        setFirebaseLastError(-1, "invalid phone resend token handle");
        return;
    }
    unregisterFirebaseValue(gm_fb_ref_id(token_ref), g_auth_phone_resend_map);
}

void firebase_auth_phone_listener_release(uint64_t listener_ref)
{
    auto* listener = static_cast<GMFirebasePhoneAuthListener*>(unregisterFirebasePointer(listener_ref, GM_FB_TYPE_AUTH_PHONE_LISTENER));
    delete listener;
}

// Used by User::UpdatePhoneNumberCredential without exposing the private map.
bool firebase_auth_resolve_phone_credential(uint64_t credential_ref, firebase::auth::PhoneAuthCredential& out)
{
    auto* credential = resolvePhoneCredential(credential_ref);
    if (!credential) return false;
    out = *credential;
    return true;
}

// ============================================================
// Provider IDs / Game Center last-result parity
// ============================================================

std::string firebase_auth_email_auth_provider_id() { return firebase::auth::EmailAuthProvider::kProviderId; }
std::string firebase_auth_facebook_auth_provider_id() { return firebase::auth::FacebookAuthProvider::kProviderId; }
std::string firebase_auth_game_center_auth_provider_id() { return firebase::auth::GameCenterAuthProvider::kProviderId; }
std::string firebase_auth_github_auth_provider_id() { return firebase::auth::GitHubAuthProvider::kProviderId; }
std::string firebase_auth_google_auth_provider_id() { return firebase::auth::GoogleAuthProvider::kProviderId; }
std::string firebase_auth_microsoft_auth_provider_id() { return firebase::auth::MicrosoftAuthProvider::kProviderId; }
std::string firebase_auth_play_games_auth_provider_id() { return firebase::auth::PlayGamesAuthProvider::kProviderId; }
std::string firebase_auth_twitter_auth_provider_id() { return firebase::auth::TwitterAuthProvider::kProviderId; }
std::string firebase_auth_yahoo_auth_provider_id() { return firebase::auth::YahooAuthProvider::kProviderId; }

void firebase_auth_game_center_auth_provider_get_credential_last_result(const std::optional<gm::wire::GMFunction>& callback)
{
    firebase::auth::GameCenterAuthProvider::GetCredentialLastResult().OnCompletion(
        [callback](const firebase::Future<firebase::auth::Credential>& f)
        {
            const int code = f.error();
            const char* message = f.error_message();
            setFirebaseLastError(code, message != nullptr ? message : "");
            if (!callback) return;

            std::optional<uint64_t> credential_ref;
            if (code == firebase::auth::kAuthErrorNone && f.result() != nullptr)
                credential_ref = wrapFirebaseAuthCredential(*f.result());
            callback->call(static_cast<double>(code), std::string(message != nullptr ? message : ""), credential_ref);
        });
}
