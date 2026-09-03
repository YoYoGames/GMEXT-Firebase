// Firebase Auth - thin forwarder over GMFirebaseCore's Auth ABI.
//
// GMFirebaseAuth no longer links the Firebase C++ SDK: every SDK object
// (App/Auth/User/Credential/listeners/...) is owned and manipulated inside
// GMFirebaseCore, the only extension DLL that statically links the SDK. This
// avoids a cross-DLL crash where Firebase's own file-static registries (e.g.
// CleanupNotifier) are duplicated per-DLL, so an App* created through Core
// was never visible to Auth's independent copy of the SDK.
//
// Every exported firebase_auth_* symbol below keeps its original name and
// signature - extgen's generated stub calls it by exact name - but now just
// resolves the matching "firebase_auth_<name>" proc from GMFirebaseCore's
// generic product dispatcher and forwards its already-decoded arguments.
#include "GMFirebase_common.h"
#include "GMFirebase_core_product_client.h"

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

namespace
{
    // Not a real Firebase error code - Auth no longer includes any Firebase
    // SDK header, so this is a generic sentinel for "GMFirebaseCore couldn't
    // be reached at all" (missing DLL, ABI mismatch), mirroring the
    // "invalid handle" style errors already used throughout
    // GMFirebase_common_client.cpp.
    constexpr int kCoreUnavailableError = -1;
    const char* const kCoreUnavailableMessage = "GMFirebaseCore auth module is not available";

    void reportCoreUnavailable()
    {
        setFirebaseLastError(kCoreUnavailableError, kCoreUnavailableMessage);
    }

    void notifyUserRefFailure(const std::optional<gm::wire::GMFunction>& callback)
    {
        reportCoreUnavailable();
        if (callback)
            callback->call(static_cast<double>(kCoreUnavailableError), std::string(kCoreUnavailableMessage), std::optional<uint64_t>{});
    }
}

// ============================================================
// Auth singleton
// ============================================================

bool firebase_auth_get_auth()
{
    using Proc = bool (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_get_auth");
    return proc != nullptr && proc();
}

// ============================================================
// Language / emulator configuration
// ============================================================

std::string firebase_auth_language_code()
{
    using Proc = std::string (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_language_code");
    return proc != nullptr ? proc() : std::string();
}

void firebase_auth_set_language_code(std::string_view language_code)
{
    using Proc = void (*)(std::string_view);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_set_language_code");
    if (proc != nullptr)
        proc(language_code);
}

void firebase_auth_use_app_language()
{
    using Proc = void (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_use_app_language");
    if (proc != nullptr)
        proc();
}

void firebase_auth_use_emulator(std::string_view host, double port)
{
    using Proc = void (*)(std::string_view, double);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_use_emulator");
    if (proc != nullptr)
        proc(host, port);
}

// ============================================================
// Current user / sign-out
// ============================================================

std::optional<uint64_t> firebase_auth_current_user()
{
    using Proc = std::optional<uint64_t> (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_current_user");
    return proc != nullptr ? proc() : std::nullopt;
}

void firebase_auth_sign_out()
{
    using Proc = void (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_sign_out");
    if (proc != nullptr)
        proc();
}

// ============================================================
// Provider discovery
// ============================================================

void firebase_auth_fetch_providers_for_email(std::string_view email, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(std::string_view, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_fetch_providers_for_email");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        if (callback)
            callback->call(static_cast<double>(kCoreUnavailableError), std::string(kCoreUnavailableMessage), gm::wire::ArrayStream{});
        return;
    }

    proc(email, callback);
}

// ============================================================
// Sign-in / sign-up
// ============================================================

void firebase_auth_sign_in_with_custom_token(std::string_view custom_token, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(std::string_view, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_sign_in_with_custom_token");
    if (proc == nullptr)
    {
        notifyUserRefFailure(callback);
        return;
    }

    proc(custom_token, callback);
}

void firebase_auth_sign_in_with_credential(uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_sign_in_with_credential");
    if (proc == nullptr)
    {
        notifyUserRefFailure(callback);
        return;
    }

    proc(credential_ref, callback);
}

void firebase_auth_sign_in_and_retrieve_data_with_credential(uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_sign_in_and_retrieve_data_with_credential");
    if (proc == nullptr)
    {
        notifyUserRefFailure(callback);
        return;
    }

    proc(credential_ref, callback);
}

void firebase_auth_sign_in_anonymously(const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_sign_in_anonymously");
    if (proc == nullptr)
    {
        notifyUserRefFailure(callback);
        return;
    }

    proc(callback);
}

void firebase_auth_sign_in_with_email_and_password(std::string_view email, std::string_view password, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(std::string_view, std::string_view, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_sign_in_with_email_and_password");
    if (proc == nullptr)
    {
        notifyUserRefFailure(callback);
        return;
    }

    proc(email, password, callback);
}

void firebase_auth_create_user_with_email_and_password(std::string_view email, std::string_view password, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(std::string_view, std::string_view, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_create_user_with_email_and_password");
    if (proc == nullptr)
    {
        notifyUserRefFailure(callback);
        return;
    }

    proc(email, password, callback);
}

// ============================================================
// Password reset
// ============================================================

void firebase_auth_send_password_reset_email(std::string_view email, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(std::string_view, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_send_password_reset_email");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        if (callback)
            callback->call(static_cast<double>(kCoreUnavailableError), std::string(kCoreUnavailableMessage));
        return;
    }

    proc(email, callback);
}

// ============================================================
// AuthStateListener / IdTokenListener
// ============================================================
// The listener objects themselves (GmAuthStateListener/GmIdTokenListener) now
// live entirely inside GMFirebaseCore, registered against Core's own pointer
// registry - Auth just passes the callback through and gets back an opaque
// handle.

std::optional<uint64_t> firebase_auth_add_state_listener(const gm::wire::GMFunction& callback)
{
    using Proc = std::optional<uint64_t> (*)(const gm::wire::GMFunction&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_add_state_listener");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return std::nullopt;
    }

    return proc(callback);
}

void firebase_auth_remove_state_listener(uint64_t listener_ref)
{
    using Proc = void (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_remove_state_listener");
    if (proc != nullptr)
        proc(listener_ref);
}

std::optional<uint64_t> firebase_auth_add_id_token_listener(const gm::wire::GMFunction& callback)
{
    using Proc = std::optional<uint64_t> (*)(const gm::wire::GMFunction&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_add_id_token_listener");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return std::nullopt;
    }

    return proc(callback);
}

void firebase_auth_remove_id_token_listener(uint64_t listener_ref)
{
    using Proc = void (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_remove_id_token_listener");
    if (proc != nullptr)
        proc(listener_ref);
}

// ============================================================
// Full AuthResult materialization + Federated OAuth providers
// ============================================================

uint64_t firebase_auth_federated_oauth_provider_create(std::string_view provider_id,
    const gm::wire::GMValue& scopes, const gm::wire::GMValue& custom_parameters)
{
    using Proc = uint64_t (*)(std::string_view, const gm::wire::GMValue&, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_federated_oauth_provider_create");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }

    return proc(provider_id, scopes, custom_parameters);
}

void firebase_auth_federated_oauth_provider_set_data(uint64_t provider_ref, std::string_view provider_id,
    const gm::wire::GMValue& scopes, const gm::wire::GMValue& custom_parameters)
{
    using Proc = void (*)(uint64_t, std::string_view, const gm::wire::GMValue&, const gm::wire::GMValue&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_federated_oauth_provider_set_data");
    if (proc != nullptr)
        proc(provider_ref, provider_id, scopes, custom_parameters);
}

void firebase_auth_federated_oauth_provider_release(uint64_t provider_ref)
{
    using Proc = void (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_federated_oauth_provider_release");
    if (proc != nullptr)
        proc(provider_ref);
}

void firebase_auth_sign_in_with_provider(uint64_t provider_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_sign_in_with_provider");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        if (callback)
            callback->call(static_cast<double>(kCoreUnavailableError), std::string_view{ kCoreUnavailableMessage }, std::optional<std::uint8_t>{});
        return;
    }

    proc(provider_ref, callback);
}

void firebase_auth_sign_in_with_custom_token_result(std::string_view custom_token, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(std::string_view, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_sign_in_with_custom_token_result");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return;
    }

    proc(custom_token, callback);
}

void firebase_auth_sign_in_and_retrieve_data_with_credential_result(uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(uint64_t, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_sign_in_and_retrieve_data_with_credential_result");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return;
    }

    proc(credential_ref, callback);
}

void firebase_auth_sign_in_anonymously_result(const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_sign_in_anonymously_result");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return;
    }

    proc(callback);
}

void firebase_auth_sign_in_with_email_and_password_result(std::string_view email, std::string_view password,
    const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(std::string_view, std::string_view, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_sign_in_with_email_and_password_result");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return;
    }

    proc(email, password, callback);
}

void firebase_auth_create_user_with_email_and_password_result(std::string_view email, std::string_view password,
    const std::optional<gm::wire::GMFunction>& callback)
{
    using Proc = void (*)(std::string_view, std::string_view, const std::optional<gm::wire::GMFunction>&);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_create_user_with_email_and_password_result");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return;
    }

    proc(email, password, callback);
}

// ============================================================
// Multi-instance helpers
// ============================================================

uint64_t firebase_auth_get_app()
{
    using Proc = uint64_t (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_get_app");
    return proc != nullptr ? proc() : 0;
}

uint64_t firebase_auth_get_current_instance_handle()
{
    using Proc = uint64_t (*)();
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_get_current_instance_handle");
    return proc != nullptr ? proc() : 0;
}

uint64_t firebase_auth_get_instance_for_app(uint64_t app_ref)
{
    using Proc = uint64_t (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_get_instance_for_app");
    if (proc == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }

    return proc(app_ref);
}

double firebase_auth_use_instance(uint64_t auth_ref)
{
    using Proc = double (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_use_instance");
    return proc != nullptr ? proc(auth_ref) : 0.0;
}

uint64_t firebase_auth_instance_get_app(uint64_t auth_ref)
{
    using Proc = uint64_t (*)(uint64_t);
    const Proc proc = gmfirebaseGetCoreProductProcAs<Proc>("auth", "firebase_auth_instance_get_app");
    return proc != nullptr ? proc(auth_ref) : 0;
}
