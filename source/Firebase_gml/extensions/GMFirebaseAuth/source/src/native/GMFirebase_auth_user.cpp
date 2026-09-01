// Firebase Auth - User wrapper functions: thin forwarder over
// GMFirebaseCore's Auth ABI.
//
// firebase::auth::User itself (the heap-allocated private copy, its
// registration under GM_FB_TYPE_AUTH_USER, and every SDK call against it) now
// lives entirely inside GMFirebaseCore - Auth just holds the opaque
// user_ref/credential_ref handles GML already deals in and forwards them.
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

    void notifyMessageOnly(const std::optional<gm::wire::GMFunction>& callback)
    {
        reportCoreUnavailable();
        if (callback)
            callback->call(static_cast<double>(kCoreUnavailableError), std::string(kCoreUnavailableMessage));
    }

    void notifyUserRefFailure(const std::optional<gm::wire::GMFunction>& callback)
    {
        reportCoreUnavailable();
        if (callback)
            callback->call(static_cast<double>(kCoreUnavailableError), std::string(kCoreUnavailableMessage), std::optional<uint64_t>{});
    }
}

void firebase_auth_user_release(uint64_t user_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api != nullptr)
        api->user_release(user_ref);
}

// ============================================================
// Basic properties
// ============================================================

gm_structs::FirebaseAuthUserInfo firebase_auth_user_get_info(uint64_t user_ref)
{
    gm_structs::FirebaseAuthUserInfo out{};
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return out;
    }

    GMFirebaseAuthUserInfo info = api->user_get_info(user_ref);
    out.uid = info.uid;
    out.email = info.email;
    out.display_name = info.display_name;
    out.photo_url = info.photo_url;
    out.provider_id = info.provider_id;
    out.phone_number = info.phone_number;
    out.is_email_verified = info.is_email_verified;
    out.is_anonymous = info.is_anonymous;
    out.is_valid = info.is_valid;
    out.creation_timestamp = info.creation_timestamp;
    out.last_sign_in_timestamp = info.last_sign_in_timestamp;
    return out;
}

bool firebase_auth_user_is_valid(uint64_t user_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr && api->user_is_valid(user_ref);
}

std::string firebase_auth_user_uid(uint64_t user_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->user_uid(user_ref) : std::string();
}

std::string firebase_auth_user_email(uint64_t user_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->user_email(user_ref) : std::string();
}

std::string firebase_auth_user_display_name(uint64_t user_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->user_display_name(user_ref) : std::string();
}

std::string firebase_auth_user_photo_url(uint64_t user_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->user_photo_url(user_ref) : std::string();
}

std::string firebase_auth_user_provider_id(uint64_t user_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->user_provider_id(user_ref) : std::string();
}

std::string firebase_auth_user_phone_number(uint64_t user_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->user_phone_number(user_ref) : std::string();
}

bool firebase_auth_user_is_email_verified(uint64_t user_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr && api->user_is_email_verified(user_ref);
}

bool firebase_auth_user_is_anonymous(uint64_t user_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr && api->user_is_anonymous(user_ref);
}

double firebase_auth_user_creation_timestamp(uint64_t user_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->user_creation_timestamp(user_ref) : 0.0;
}

double firebase_auth_user_last_sign_in_timestamp(uint64_t user_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->user_last_sign_in_timestamp(user_ref) : 0.0;
}

// ============================================================
// Token
// ============================================================

void firebase_auth_user_get_token(uint64_t user_ref, bool force_refresh, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        if (callback)
            callback->call(static_cast<double>(kCoreUnavailableError), std::string(kCoreUnavailableMessage), std::string());
        return;
    }

    api->user_get_token(user_ref, force_refresh, callback);
}

// ============================================================
// Profile mutation
// ============================================================

void firebase_auth_user_update_password(uint64_t user_ref, std::string_view password, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        notifyMessageOnly(callback);
        return;
    }

    api->user_update_password(user_ref, password, callback);
}

void firebase_auth_user_update_profile(uint64_t user_ref, std::string_view display_name, std::string_view photo_url, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        notifyMessageOnly(callback);
        return;
    }

    api->user_update_profile(user_ref, display_name, photo_url, callback);
}

// ============================================================
// Email verification
// ============================================================

void firebase_auth_user_send_email_verification(uint64_t user_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        notifyMessageOnly(callback);
        return;
    }

    api->user_send_email_verification(user_ref, callback);
}

void firebase_auth_user_send_email_verification_before_updating_email(uint64_t user_ref, std::string_view new_email, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        notifyMessageOnly(callback);
        return;
    }

    api->user_send_email_verification_before_updating_email(user_ref, new_email, callback);
}

// ============================================================
// Reauthenticate / link / unlink
// ============================================================

void firebase_auth_user_reauthenticate(uint64_t user_ref, uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        notifyMessageOnly(callback);
        return;
    }

    api->user_reauthenticate(user_ref, credential_ref, callback);
}

void firebase_auth_user_reauthenticate_and_retrieve_data(uint64_t user_ref, uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        notifyUserRefFailure(callback);
        return;
    }

    api->user_reauthenticate_and_retrieve_data(user_ref, credential_ref, callback);
}

void firebase_auth_user_link_with_credential(uint64_t user_ref, uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        notifyUserRefFailure(callback);
        return;
    }

    api->user_link_with_credential(user_ref, credential_ref, callback);
}

void firebase_auth_user_unlink(uint64_t user_ref, std::string_view provider_id, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        notifyUserRefFailure(callback);
        return;
    }

    api->user_unlink(user_ref, provider_id, callback);
}

// ============================================================
// Reload / delete
// ============================================================

void firebase_auth_user_reload(uint64_t user_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        notifyMessageOnly(callback);
        return;
    }

    api->user_reload(user_ref, callback);
}

void firebase_auth_user_delete(uint64_t user_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        notifyMessageOnly(callback);
        return;
    }

    api->user_delete(user_ref, callback);
}

// ============================================================
// Provider data / federated provider / phone-number operations
// ============================================================

double firebase_auth_user_provider_data_count(uint64_t user_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->user_provider_data_count(user_ref) : 0.0;
}

gm::wire::DataStream firebase_auth_user_provider_data_at(uint64_t user_ref, double index)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api != nullptr)
        return api->user_provider_data_at(user_ref, index);

    reportCoreUnavailable();
    gm::wire::StructStream info;
    gm::wire::DataStream out;
    out << info;
    return out;
}

void firebase_auth_user_reauthenticate_with_provider(uint64_t user_ref, uint64_t provider_ref,
    const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return;
    }

    api->user_reauthenticate_with_provider(user_ref, provider_ref, callback);
}

void firebase_auth_user_link_with_provider(uint64_t user_ref, uint64_t provider_ref,
    const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return;
    }

    api->user_link_with_provider(user_ref, provider_ref, callback);
}

void firebase_auth_user_reauthenticate_and_retrieve_data_result(uint64_t user_ref, uint64_t credential_ref,
    const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return;
    }

    api->user_reauthenticate_and_retrieve_data_result(user_ref, credential_ref, callback);
}

void firebase_auth_user_link_with_credential_result(uint64_t user_ref, uint64_t credential_ref,
    const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return;
    }

    api->user_link_with_credential_result(user_ref, credential_ref, callback);
}

void firebase_auth_user_update_phone_number_credential(uint64_t user_ref, uint64_t phone_credential_ref,
    const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return;
    }

    api->user_update_phone_number_credential(user_ref, phone_credential_ref, callback);
}
