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
// forwards its already-decoded arguments to gmfirebaseGetCoreAuthAPI().
#include "GMFirebase_common.h"
#include "GMFirebase_core_auth_client.h"

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
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr && api->get_auth();
}

// ============================================================
// Language / emulator configuration
// ============================================================

std::string firebase_auth_language_code()
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->language_code() : std::string();
}

void firebase_auth_set_language_code(std::string_view language_code)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api != nullptr)
        api->set_language_code(language_code);
}

void firebase_auth_use_app_language()
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api != nullptr)
        api->use_app_language();
}

void firebase_auth_use_emulator(std::string_view host, double port)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api != nullptr)
        api->use_emulator(host, port);
}

// ============================================================
// Current user / sign-out
// ============================================================

std::optional<uint64_t> firebase_auth_current_user()
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->current_user() : std::nullopt;
}

void firebase_auth_sign_out()
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api != nullptr)
        api->sign_out();
}

// ============================================================
// Provider discovery
// ============================================================

void firebase_auth_fetch_providers_for_email(std::string_view email, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        if (callback)
            callback->call(static_cast<double>(kCoreUnavailableError), std::string(kCoreUnavailableMessage), gm::wire::ArrayStream{});
        return;
    }

    api->fetch_providers_for_email(email, callback);
}

// ============================================================
// Sign-in / sign-up
// ============================================================

void firebase_auth_sign_in_with_custom_token(std::string_view custom_token, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        notifyUserRefFailure(callback);
        return;
    }

    api->sign_in_with_custom_token(custom_token, callback);
}

void firebase_auth_sign_in_with_credential(uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        notifyUserRefFailure(callback);
        return;
    }

    api->sign_in_with_credential(credential_ref, callback);
}

void firebase_auth_sign_in_and_retrieve_data_with_credential(uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        notifyUserRefFailure(callback);
        return;
    }

    api->sign_in_and_retrieve_data_with_credential(credential_ref, callback);
}

void firebase_auth_sign_in_anonymously(const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        notifyUserRefFailure(callback);
        return;
    }

    api->sign_in_anonymously(callback);
}

void firebase_auth_sign_in_with_email_and_password(std::string_view email, std::string_view password, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        notifyUserRefFailure(callback);
        return;
    }

    api->sign_in_with_email_and_password(email, password, callback);
}

void firebase_auth_create_user_with_email_and_password(std::string_view email, std::string_view password, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        notifyUserRefFailure(callback);
        return;
    }

    api->create_user_with_email_and_password(email, password, callback);
}

// ============================================================
// Password reset
// ============================================================

void firebase_auth_send_password_reset_email(std::string_view email, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        if (callback)
            callback->call(static_cast<double>(kCoreUnavailableError), std::string(kCoreUnavailableMessage));
        return;
    }

    api->send_password_reset_email(email, callback);
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
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return std::nullopt;
    }

    return api->add_state_listener(callback);
}

void firebase_auth_remove_state_listener(uint64_t listener_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api != nullptr)
        api->remove_state_listener(listener_ref);
}

std::optional<uint64_t> firebase_auth_add_id_token_listener(const gm::wire::GMFunction& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return std::nullopt;
    }

    return api->add_id_token_listener(callback);
}

void firebase_auth_remove_id_token_listener(uint64_t listener_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api != nullptr)
        api->remove_id_token_listener(listener_ref);
}

// ============================================================
// Full AuthResult materialization + Federated OAuth providers
// ============================================================

uint64_t firebase_auth_federated_oauth_provider_create(std::string_view provider_id,
    const gm::wire::GMValue& scopes, const gm::wire::GMValue& custom_parameters)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }

    return api->federated_oauth_provider_create(provider_id, scopes, custom_parameters);
}

void firebase_auth_federated_oauth_provider_set_data(uint64_t provider_ref, std::string_view provider_id,
    const gm::wire::GMValue& scopes, const gm::wire::GMValue& custom_parameters)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api != nullptr)
        api->federated_oauth_provider_set_data(provider_ref, provider_id, scopes, custom_parameters);
}

void firebase_auth_federated_oauth_provider_release(uint64_t provider_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api != nullptr)
        api->federated_oauth_provider_release(provider_ref);
}

void firebase_auth_sign_in_with_provider(uint64_t provider_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        if (callback)
            callback->call(static_cast<double>(kCoreUnavailableError), std::string_view{ kCoreUnavailableMessage }, std::optional<std::uint8_t>{});
        return;
    }

    api->sign_in_with_provider(provider_ref, callback);
}

void firebase_auth_sign_in_with_custom_token_result(std::string_view custom_token, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return;
    }

    api->sign_in_with_custom_token_result(custom_token, callback);
}

void firebase_auth_sign_in_and_retrieve_data_with_credential_result(uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return;
    }

    api->sign_in_and_retrieve_data_with_credential_result(credential_ref, callback);
}

void firebase_auth_sign_in_anonymously_result(const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return;
    }

    api->sign_in_anonymously_result(callback);
}

void firebase_auth_sign_in_with_email_and_password_result(std::string_view email, std::string_view password,
    const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return;
    }

    api->sign_in_with_email_and_password_result(email, password, callback);
}

void firebase_auth_create_user_with_email_and_password_result(std::string_view email, std::string_view password,
    const std::optional<gm::wire::GMFunction>& callback)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return;
    }

    api->create_user_with_email_and_password_result(email, password, callback);
}

// ============================================================
// Multi-instance helpers
// ============================================================

uint64_t firebase_auth_get_app()
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->get_app() : 0;
}

uint64_t firebase_auth_get_current_instance_handle()
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->get_current_instance_handle() : 0;
}

uint64_t firebase_auth_get_instance_for_app(uint64_t app_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    if (api == nullptr)
    {
        reportCoreUnavailable();
        return 0;
    }

    return api->get_instance_for_app(app_ref);
}

double firebase_auth_use_instance(uint64_t auth_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->use_instance(auth_ref) : 0.0;
}

uint64_t firebase_auth_instance_get_app(uint64_t auth_ref)
{
    const auto* api = gmfirebaseGetCoreAuthAPI();
    return api != nullptr ? api->instance_get_app(auth_ref) : 0;
}
