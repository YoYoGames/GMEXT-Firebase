// Firebase Auth - User wrapper functions: thin forwarder over
// GMFirebaseCore's Auth ABI.
//
// firebase::auth::User itself (the heap-allocated private copy, its
// registration under GM_FB_TYPE_AUTH_USER, and every SDK call against it) now
// lives entirely inside GMFirebaseCore - Auth just holds the opaque
// user_ref/credential_ref handles GML already deals in and forwards them.
#include "GMFirebase_common.h"
#include "GMFirebase_core_product_client.h"
#include "GMFirebase_core_auth_user_info.h"

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
    using Proc = void (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_release");
    if (proc != nullptr)
        proc(user_ref);
}

// ============================================================
// Basic properties
// ============================================================

gm_structs::FirebaseAuthUserInfo firebase_auth_user_get_info(uint64_t user_ref)
{
    gm_structs::FirebaseAuthUserInfo out{};

    // Core's real implementation returns the hand-written GMFirebaseAuthUserInfo
    // mirror (GMFirebase_core_auth_user_info.h) instead of this module's
    // generated gm_structs::FirebaseAuthUserInfo, since Core cannot depend on
    // any product module's generated code.
    using Proc = GMFirebaseAuthUserInfo (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_get_info");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return out;
    }

    GMFirebaseAuthUserInfo info = proc(user_ref);
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
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_is_valid");
    return proc != nullptr && proc(user_ref);
}

std::string firebase_auth_user_uid(uint64_t user_ref)
{
    using Proc = std::string (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_uid");
    return proc != nullptr ? proc(user_ref) : std::string();
}

std::string firebase_auth_user_email(uint64_t user_ref)
{
    using Proc = std::string (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_email");
    return proc != nullptr ? proc(user_ref) : std::string();
}

std::string firebase_auth_user_display_name(uint64_t user_ref)
{
    using Proc = std::string (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_display_name");
    return proc != nullptr ? proc(user_ref) : std::string();
}

std::string firebase_auth_user_photo_url(uint64_t user_ref)
{
    using Proc = std::string (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_photo_url");
    return proc != nullptr ? proc(user_ref) : std::string();
}

std::string firebase_auth_user_provider_id(uint64_t user_ref)
{
    using Proc = std::string (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_provider_id");
    return proc != nullptr ? proc(user_ref) : std::string();
}

std::string firebase_auth_user_phone_number(uint64_t user_ref)
{
    using Proc = std::string (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_phone_number");
    return proc != nullptr ? proc(user_ref) : std::string();
}

bool firebase_auth_user_is_email_verified(uint64_t user_ref)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_is_email_verified");
    return proc != nullptr && proc(user_ref);
}

bool firebase_auth_user_is_anonymous(uint64_t user_ref)
{
    using Proc = bool (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_is_anonymous");
    return proc != nullptr && proc(user_ref);
}

double firebase_auth_user_creation_timestamp(uint64_t user_ref)
{
    using Proc = double (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_creation_timestamp");
    return proc != nullptr ? proc(user_ref) : 0.0;
}

double firebase_auth_user_last_sign_in_timestamp(uint64_t user_ref)
{
    using Proc = double (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_last_sign_in_timestamp");
    return proc != nullptr ? proc(user_ref) : 0.0;
}

// ============================================================
// Token
// ============================================================

void firebase_auth_user_get_token(uint64_t user_ref, bool force_refresh, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(uint64_t, bool, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_get_token");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        if (callback)
            callback->call(static_cast<double>(kCoreUnavailableError), std::string(kCoreUnavailableMessage), std::string());
        return;
    }

    proc(user_ref, force_refresh, callback);
}

// ============================================================
// Profile mutation
// ============================================================

void firebase_auth_user_update_password(uint64_t user_ref, std::string_view password, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(uint64_t, std::string_view, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_update_password");
    if (proc == nullptr)
    {
        notifyMessageOnly(callback);
        return;
    }

    proc(user_ref, password, callback);
}

void firebase_auth_user_update_profile(uint64_t user_ref, std::string_view display_name, std::string_view photo_url, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(uint64_t, std::string_view, std::string_view, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_update_profile");
    if (proc == nullptr)
    {
        notifyMessageOnly(callback);
        return;
    }

    proc(user_ref, display_name, photo_url, callback);
}

// ============================================================
// Email verification
// ============================================================

void firebase_auth_user_send_email_verification(uint64_t user_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_send_email_verification");
    if (proc == nullptr)
    {
        notifyMessageOnly(callback);
        return;
    }

    proc(user_ref, callback);
}

void firebase_auth_user_send_email_verification_before_updating_email(uint64_t user_ref, std::string_view new_email, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(uint64_t, std::string_view, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_send_email_verification_before_updating_email");
    if (proc == nullptr)
    {
        notifyMessageOnly(callback);
        return;
    }

    proc(user_ref, new_email, callback);
}

// ============================================================
// Reauthenticate / link / unlink
// ============================================================

void firebase_auth_user_reauthenticate(uint64_t user_ref, uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(uint64_t, uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_reauthenticate");
    if (proc == nullptr)
    {
        notifyMessageOnly(callback);
        return;
    }

    proc(user_ref, credential_ref, callback);
}

void firebase_auth_user_reauthenticate_and_retrieve_data(uint64_t user_ref, uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(uint64_t, uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_reauthenticate_and_retrieve_data");
    if (proc == nullptr)
    {
        notifyUserRefFailure(callback);
        return;
    }

    proc(user_ref, credential_ref, callback);
}

void firebase_auth_user_link_with_credential(uint64_t user_ref, uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(uint64_t, uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_link_with_credential");
    if (proc == nullptr)
    {
        notifyUserRefFailure(callback);
        return;
    }

    proc(user_ref, credential_ref, callback);
}

void firebase_auth_user_unlink(uint64_t user_ref, std::string_view provider_id, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(uint64_t, std::string_view, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_unlink");
    if (proc == nullptr)
    {
        notifyUserRefFailure(callback);
        return;
    }

    proc(user_ref, provider_id, callback);
}

// ============================================================
// Reload / delete
// ============================================================

void firebase_auth_user_reload(uint64_t user_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_reload");
    if (proc == nullptr)
    {
        notifyMessageOnly(callback);
        return;
    }

    proc(user_ref, callback);
}

void firebase_auth_user_delete(uint64_t user_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_delete");
    if (proc == nullptr)
    {
        notifyMessageOnly(callback);
        return;
    }

    proc(user_ref, callback);
}

// ============================================================
// Provider data / federated provider / phone-number operations
// ============================================================

double firebase_auth_user_provider_data_count(uint64_t user_ref)
{
    using Proc = double (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_provider_data_count");
    return proc != nullptr ? proc(user_ref) : 0.0;
}

gm::wire::DataStream firebase_auth_user_provider_data_at(uint64_t user_ref, double index)
{
    using Proc = gm::wire::DataStream (*)(uint64_t, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_provider_data_at");
    if (proc != nullptr)
        return proc(user_ref, index);

    reportCoreUnavailable();
    gm::wire::StructStream info;
    gm::wire::DataStream out;
    out << info;
    return out;
}

void firebase_auth_user_reauthenticate_with_provider(uint64_t user_ref, uint64_t provider_ref,
    const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(uint64_t, uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_reauthenticate_with_provider");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return;
    }

    proc(user_ref, provider_ref, callback);
}

void firebase_auth_user_link_with_provider(uint64_t user_ref, uint64_t provider_ref,
    const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(uint64_t, uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_link_with_provider");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return;
    }

    proc(user_ref, provider_ref, callback);
}

void firebase_auth_user_reauthenticate_and_retrieve_data_result(uint64_t user_ref, uint64_t credential_ref,
    const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(uint64_t, uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_reauthenticate_and_retrieve_data_result");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return;
    }

    proc(user_ref, credential_ref, callback);
}

void firebase_auth_user_link_with_credential_result(uint64_t user_ref, uint64_t credential_ref,
    const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(uint64_t, uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_link_with_credential_result");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return;
    }

    proc(user_ref, credential_ref, callback);
}

void firebase_auth_user_update_phone_number_credential(uint64_t user_ref, uint64_t phone_credential_ref,
    const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(uint64_t, uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_user_update_phone_number_credential");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return;
    }

    proc(user_ref, phone_credential_ref, callback);
}
