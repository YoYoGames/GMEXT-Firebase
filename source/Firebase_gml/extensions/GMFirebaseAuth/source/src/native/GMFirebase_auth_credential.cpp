// Firebase Auth - Credential value type + identity-provider factory wrappers:
// thin forwarder over GMFirebaseCore's Auth ABI.
//
// firebase::auth::Credential/PhoneAuthCredential, their registration maps,
// and the phone-auth Listener subclass now live entirely inside
// GMFirebaseCore - Auth just holds the opaque credential_ref/listener_ref
// handles GML already deals in and forwards them.
#include "GMFirebase_common.h"
#include "GMFirebase_core_auth_client.h"

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
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->credential_provider(credential_ref) : std::string();
}

bool firebase_auth_credential_is_valid(uint64_t credential_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr && api->credential_is_valid(credential_ref);
}

void firebase_auth_credential_release(uint64_t credential_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api != nullptr)
        api->credential_release(credential_ref);
}

// ============================================================
// Identity provider factories
// ============================================================

uint64_t firebase_auth_email_auth_provider_get_credential(std::string_view email, std::string_view password)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }
    return api->email_auth_provider_get_credential(email, password);
}

uint64_t firebase_auth_facebook_auth_provider_get_credential(std::string_view access_token)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }
    return api->facebook_auth_provider_get_credential(access_token);
}

void firebase_auth_game_center_auth_provider_get_credential(const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        notifyCredentialRefFailure(callback);
        return;
    }
    api->game_center_auth_provider_get_credential(callback);
}

bool firebase_auth_game_center_auth_provider_is_player_authenticated()
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr && api->game_center_auth_provider_is_player_authenticated();
}

uint64_t firebase_auth_github_auth_provider_get_credential(std::string_view token)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }
    return api->github_auth_provider_get_credential(token);
}

uint64_t firebase_auth_google_auth_provider_get_credential(std::string_view id_token, std::string_view access_token)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }
    return api->google_auth_provider_get_credential(id_token, access_token);
}

uint64_t firebase_auth_oauth_provider_get_credential(std::string_view provider_id, std::string_view id_token, std::string_view access_token)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }
    return api->oauth_provider_get_credential(provider_id, id_token, access_token);
}

uint64_t firebase_auth_oauth_provider_get_credential_with_nonce(std::string_view provider_id, std::string_view id_token, std::string_view raw_nonce, std::string_view access_token)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }
    return api->oauth_provider_get_credential_with_nonce(provider_id, id_token, raw_nonce, access_token);
}

uint64_t firebase_auth_play_games_auth_provider_get_credential(std::string_view server_auth_code)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }
    return api->play_games_auth_provider_get_credential(server_auth_code);
}

uint64_t firebase_auth_twitter_auth_provider_get_credential(std::string_view token, std::string_view secret)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }
    return api->twitter_auth_provider_get_credential(token, secret);
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
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }
    return api->phone_verify_phone_number(phone_number, timeout_ms, force_resending_token_ref,
        on_verification_completed, on_verification_failed, on_code_sent, on_timeout);
}

uint64_t firebase_auth_phone_get_credential(std::string_view verification_id, std::string_view verification_code)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }
    return api->phone_get_credential(verification_id, verification_code);
}

std::string firebase_auth_phone_credential_sms_code(uint64_t credential_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->phone_credential_sms_code(credential_ref) : std::string();
}

void firebase_auth_phone_resending_token_release(uint64_t token_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api != nullptr)
        api->phone_resending_token_release(token_ref);
}

void firebase_auth_phone_listener_release(uint64_t listener_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api != nullptr)
        api->phone_listener_release(listener_ref);
}

// ============================================================
// Provider IDs / Game Center last-result parity
// ============================================================

std::string firebase_auth_email_auth_provider_id()
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->email_auth_provider_id() : std::string();
}

std::string firebase_auth_facebook_auth_provider_id()
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->facebook_auth_provider_id() : std::string();
}

std::string firebase_auth_game_center_auth_provider_id()
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->game_center_auth_provider_id() : std::string();
}

std::string firebase_auth_github_auth_provider_id()
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->github_auth_provider_id() : std::string();
}

std::string firebase_auth_google_auth_provider_id()
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->google_auth_provider_id() : std::string();
}

std::string firebase_auth_microsoft_auth_provider_id()
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->microsoft_auth_provider_id() : std::string();
}

std::string firebase_auth_play_games_auth_provider_id()
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->play_games_auth_provider_id() : std::string();
}

std::string firebase_auth_twitter_auth_provider_id()
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->twitter_auth_provider_id() : std::string();
}

std::string firebase_auth_yahoo_auth_provider_id()
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->yahoo_auth_provider_id() : std::string();
}

void firebase_auth_game_center_auth_provider_get_credential_last_result(const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        notifyCredentialRefFailure(callback);
        return;
    }
    api->game_center_auth_provider_get_credential_last_result(callback);
}
