// Firebase Auth - Credential value type + identity-provider factory wrappers:
// thin forwarder over GMFirebaseCore's Auth ABI.
//
// firebase::auth::Credential/PhoneAuthCredential, their registration maps,
// and the phone-auth Listener subclass now live entirely inside
// GMFirebaseCore - Auth just holds the opaque credential_ref/listener_ref
// handles GML already deals in and forwards them.
#include "GMFirebase_common.h"
#include "GMFirebase_core_product_client.h"

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

namespace
{
    constexpr int kCoreUnavailableError = -1;
    const char* const kCoreUnavailableMessage = "GMFirebaseCore auth module is not available";

    void reportCoreUnavailable()
    {
        setFirebaseLastError(kCoreUnavailableError, kCoreUnavailableMessage);
    }

    void notifyCredentialRefFailure(const std::optional<gm::wire::GMFunction>& callback)
    {
        reportCoreUnavailable();
        if (callback)
            callback->call(static_cast<double>(kCoreUnavailableError), std::string(kCoreUnavailableMessage), std::optional<uint64_t>{});
    }
}

// ============================================================
// Credential (generic accessors)
// ============================================================

std::string firebase_auth_credential_provider(uint64_t credential_ref)
{
    using Proc = std::string (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_credential_provider");
    return proc != nullptr ? proc(credential_ref) : std::string();
}

bool firebase_auth_credential_is_valid(uint64_t credential_ref)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_credential_is_valid");
    return proc != nullptr && proc(credential_ref);
}

void firebase_auth_credential_release(uint64_t credential_ref)
{
    using Proc = void (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_credential_release");
    if (proc != nullptr)
        proc(credential_ref);
}

// ============================================================
// Identity provider factories
// ============================================================

uint64_t firebase_auth_email_auth_provider_get_credential(std::string_view email, std::string_view password)
{
    using Proc = uint64_t (*)(std::string_view, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_email_auth_provider_get_credential");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }
    return proc(email, password);
}

uint64_t firebase_auth_facebook_auth_provider_get_credential(std::string_view access_token)
{
    using Proc = uint64_t (*)(std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_facebook_auth_provider_get_credential");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }
    return proc(access_token);
}

void firebase_auth_game_center_auth_provider_get_credential(const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_game_center_auth_provider_get_credential");
    if (proc == nullptr)
    {
        notifyCredentialRefFailure(callback);
        return;
    }
    proc(callback);
}

bool firebase_auth_game_center_auth_provider_is_player_authenticated()
{
    using Proc = bool (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_game_center_auth_provider_is_player_authenticated");
    return proc != nullptr && proc();
}

uint64_t firebase_auth_github_auth_provider_get_credential(std::string_view token)
{
    using Proc = uint64_t (*)(std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_github_auth_provider_get_credential");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }
    return proc(token);
}

uint64_t firebase_auth_google_auth_provider_get_credential(std::string_view id_token, std::string_view access_token)
{
    using Proc = uint64_t (*)(std::string_view, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_google_auth_provider_get_credential");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }
    return proc(id_token, access_token);
}

uint64_t firebase_auth_oauth_provider_get_credential(std::string_view provider_id, std::string_view id_token, std::string_view access_token)
{
    using Proc = uint64_t (*)(std::string_view, std::string_view, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_oauth_provider_get_credential");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }
    return proc(provider_id, id_token, access_token);
}

uint64_t firebase_auth_oauth_provider_get_credential_with_nonce(std::string_view provider_id, std::string_view id_token, std::string_view raw_nonce, std::string_view access_token)
{
    using Proc = uint64_t (*)(std::string_view, std::string_view, std::string_view, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_oauth_provider_get_credential_with_nonce");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }
    return proc(provider_id, id_token, raw_nonce, access_token);
}

uint64_t firebase_auth_play_games_auth_provider_get_credential(std::string_view server_auth_code)
{
    using Proc = uint64_t (*)(std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_play_games_auth_provider_get_credential");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }
    return proc(server_auth_code);
}

uint64_t firebase_auth_twitter_auth_provider_get_credential(std::string_view token, std::string_view secret)
{
    using Proc = uint64_t (*)(std::string_view, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_twitter_auth_provider_get_credential");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }
    return proc(token, secret);
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
    using Proc = uint64_t (*)(std::string_view, double, uint64_t,
        const std::optional<gm::wire::GMFunction>&,
        const std::optional<gm::wire::GMFunction>&,
        const std::optional<gm::wire::GMFunction>&,
        const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_phone_verify_phone_number");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }
    return proc(phone_number, timeout_ms, force_resending_token_ref,
        on_verification_completed, on_verification_failed, on_code_sent, on_timeout);
}

uint64_t firebase_auth_phone_get_credential(std::string_view verification_id, std::string_view verification_code)
{
    using Proc = uint64_t (*)(std::string_view, std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_phone_get_credential");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }
    return proc(verification_id, verification_code);
}

std::string firebase_auth_phone_credential_sms_code(uint64_t credential_ref)
{
    using Proc = std::string (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_phone_credential_sms_code");
    return proc != nullptr ? proc(credential_ref) : std::string();
}

void firebase_auth_phone_resending_token_release(uint64_t token_ref)
{
    using Proc = void (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_phone_resending_token_release");
    if (proc != nullptr)
        proc(token_ref);
}

void firebase_auth_phone_listener_release(uint64_t listener_ref)
{
    using Proc = void (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_phone_listener_release");
    if (proc != nullptr)
        proc(listener_ref);
}

// ============================================================
// Provider IDs / Game Center last-result parity
// ============================================================

std::string firebase_auth_email_auth_provider_id()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_email_auth_provider_id");
    return proc != nullptr ? proc() : std::string();
}

std::string firebase_auth_facebook_auth_provider_id()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_facebook_auth_provider_id");
    return proc != nullptr ? proc() : std::string();
}

std::string firebase_auth_game_center_auth_provider_id()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_game_center_auth_provider_id");
    return proc != nullptr ? proc() : std::string();
}

std::string firebase_auth_github_auth_provider_id()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_github_auth_provider_id");
    return proc != nullptr ? proc() : std::string();
}

std::string firebase_auth_google_auth_provider_id()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_google_auth_provider_id");
    return proc != nullptr ? proc() : std::string();
}

std::string firebase_auth_microsoft_auth_provider_id()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_microsoft_auth_provider_id");
    return proc != nullptr ? proc() : std::string();
}

std::string firebase_auth_play_games_auth_provider_id()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_play_games_auth_provider_id");
    return proc != nullptr ? proc() : std::string();
}

std::string firebase_auth_twitter_auth_provider_id()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_twitter_auth_provider_id");
    return proc != nullptr ? proc() : std::string();
}

std::string firebase_auth_yahoo_auth_provider_id()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_yahoo_auth_provider_id");
    return proc != nullptr ? proc() : std::string();
}

void firebase_auth_game_center_auth_provider_get_credential_last_result(const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_game_center_auth_provider_get_credential_last_result");
    if (proc == nullptr)
    {
        notifyCredentialRefFailure(callback);
        return;
    }
    proc(callback);
}
