#pragma once

// Internal (non-exported) declarations shared by the three Core-side Auth
// implementation files (GMFirebase_core_auth.cpp / _user.cpp / _credential.cpp)
// and exposed to GMFirebaseAuth's forwarders through the generic proc
// resolver in GMFirebase_core_auth_resolver.cpp. This mirrors the split that
// used to exist per source file in GMFirebaseAuth, now living inside
// GMFirebaseCore since Auth no longer links the Firebase SDK.
// Hand-written, not generated - fine to edit directly.

#include "GMFirebase_core_auth_user_info.h"
#include "core/GMExtWire.h"

#include <cstdint>
#include <optional>
#include <string>
#include <string_view>

namespace firebase
{
    class App;
    namespace auth
    {
        class Auth;
        class User;
        class Credential;
        class PhoneAuthCredential;
        struct AuthResult;
    }
}

namespace gmfb_auth
{
    // ---- Cross-file plumbing (was GMFirebase_common.h's "Auth - shared
    // cross-file plumbing" section in GMFirebaseAuth) ----

    // Lazily-created Auth singleton for the default App, mirroring g_firebase_app
    // in GMFirebase_common.cpp. Defined in GMFirebase_core_auth.cpp.
    firebase::auth::Auth* getAuth();

    // firebase::auth::User has no stable address of its own - every accessor
    // hands it back by value - so this heap-allocates a private copy registered
    // under GM_FB_TYPE_AUTH_USER. Defined in GMFirebase_core_auth_user.cpp.
    std::uint64_t wrapUser(const firebase::auth::User& user);

    // GM_FB_TYPE_AUTH_CREDENTIAL / GM_FB_TYPE_AUTH_PHONE_CREDENTIAL registries.
    // Defined in GMFirebase_core_auth_credential.cpp.
    std::uint64_t wrapCredential(const firebase::auth::Credential& credential);
    bool resolveCredential(std::uint64_t ref, firebase::auth::Credential& out);
    bool resolvePhoneCredentialForUser(std::uint64_t ref, firebase::auth::PhoneAuthCredential& out);

    // Builds the full AuthResult struct (user/credential/provider_id/user_name/
    // updated_credential/profile) shared by the *_result and *_with_provider
    // families. Defined in GMFirebase_core_auth.cpp.
    gm::wire::StructStream makeAuthResultStruct(const firebase::auth::AuthResult& result);

    // ---- Exposed via gmfirebase_core_resolve_auth_proc() ----
    // One function per resolvable "firebase_auth_<name>" symbol, same name and
    // signature, so GMFirebase_core_auth_resolver.cpp can hand its address
    // straight back with no adapters. Only user_get_info's return type differs
    // from the corresponding GML-facing declaration: it returns the
    // hand-written GMFirebaseAuthUserInfo mirror (declared in
    // GMFirebase_core_auth_user_info.h) instead of Auth's generated
    // gm_structs::FirebaseAuthUserInfo, since Core cannot depend on any
    // product module's generated code.

    bool get_auth();
    std::string language_code();
    void set_language_code(std::string_view language_code);
    void use_app_language();
    void use_emulator(std::string_view host, double port);
    std::optional<std::uint64_t> current_user();
    void sign_out();
    void fetch_providers_for_email(std::string_view email, const std::optional<gm::wire::GMFunction>& callback);
    void sign_in_with_custom_token(std::string_view custom_token, const std::optional<gm::wire::GMFunction>& callback);
    void sign_in_with_credential(std::uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback);
    void sign_in_and_retrieve_data_with_credential(std::uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback);
    void sign_in_anonymously(const std::optional<gm::wire::GMFunction>& callback);
    void sign_in_with_email_and_password(std::string_view email, std::string_view password, const std::optional<gm::wire::GMFunction>& callback);
    void create_user_with_email_and_password(std::string_view email, std::string_view password, const std::optional<gm::wire::GMFunction>& callback);
    void send_password_reset_email(std::string_view email, const std::optional<gm::wire::GMFunction>& callback);
    std::optional<std::uint64_t> add_state_listener(const gm::wire::GMFunction& callback);
    void remove_state_listener(std::uint64_t listener_ref);
    std::optional<std::uint64_t> add_id_token_listener(const gm::wire::GMFunction& callback);
    void remove_id_token_listener(std::uint64_t listener_ref);
    std::string credential_provider(std::uint64_t credential_ref);
    bool credential_is_valid(std::uint64_t credential_ref);
    void credential_release(std::uint64_t credential_ref);
    std::uint64_t email_auth_provider_get_credential(std::string_view email, std::string_view password);
    std::uint64_t facebook_auth_provider_get_credential(std::string_view access_token);
    void game_center_auth_provider_get_credential(const std::optional<gm::wire::GMFunction>& callback);
    bool game_center_auth_provider_is_player_authenticated();
    std::uint64_t github_auth_provider_get_credential(std::string_view token);
    std::uint64_t google_auth_provider_get_credential(std::string_view id_token, std::string_view access_token);
    std::uint64_t oauth_provider_get_credential(std::string_view provider_id, std::string_view id_token, std::string_view access_token);
    std::uint64_t oauth_provider_get_credential_with_nonce(std::string_view provider_id, std::string_view id_token, std::string_view raw_nonce, std::string_view access_token);
    std::uint64_t play_games_auth_provider_get_credential(std::string_view server_auth_code);
    std::uint64_t twitter_auth_provider_get_credential(std::string_view token, std::string_view secret);
    std::uint64_t phone_verify_phone_number(std::string_view phone_number, double timeout_ms, std::uint64_t force_resending_token, const std::optional<gm::wire::GMFunction>& on_verification_completed, const std::optional<gm::wire::GMFunction>& on_verification_failed, const std::optional<gm::wire::GMFunction>& on_code_sent, const std::optional<gm::wire::GMFunction>& on_timeout);
    std::uint64_t phone_get_credential(std::string_view verification_id, std::string_view verification_code);
    std::string phone_credential_sms_code(std::uint64_t credential);
    void phone_resending_token_release(std::uint64_t token);
    void phone_listener_release(std::uint64_t listener);
    GMFirebaseAuthUserInfo user_get_info(std::uint64_t user);
    void user_release(std::uint64_t user_ref);
    bool user_is_valid(std::uint64_t user_ref);
    std::string user_uid(std::uint64_t user_ref);
    std::string user_email(std::uint64_t user_ref);
    std::string user_display_name(std::uint64_t user_ref);
    std::string user_photo_url(std::uint64_t user_ref);
    std::string user_provider_id(std::uint64_t user_ref);
    std::string user_phone_number(std::uint64_t user_ref);
    bool user_is_email_verified(std::uint64_t user_ref);
    bool user_is_anonymous(std::uint64_t user_ref);
    double user_creation_timestamp(std::uint64_t user_ref);
    double user_last_sign_in_timestamp(std::uint64_t user_ref);
    void user_get_token(std::uint64_t user_ref, bool force_refresh, const std::optional<gm::wire::GMFunction>& callback);
    void user_update_password(std::uint64_t user_ref, std::string_view password, const std::optional<gm::wire::GMFunction>& callback);
    void user_update_profile(std::uint64_t user_ref, std::string_view display_name, std::string_view photo_url, const std::optional<gm::wire::GMFunction>& callback);
    void user_send_email_verification(std::uint64_t user_ref, const std::optional<gm::wire::GMFunction>& callback);
    void user_send_email_verification_before_updating_email(std::uint64_t user_ref, std::string_view new_email, const std::optional<gm::wire::GMFunction>& callback);
    void user_reauthenticate(std::uint64_t user_ref, std::uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback);
    void user_reauthenticate_and_retrieve_data(std::uint64_t user_ref, std::uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback);
    void user_link_with_credential(std::uint64_t user_ref, std::uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback);
    void user_unlink(std::uint64_t user_ref, std::string_view provider_id, const std::optional<gm::wire::GMFunction>& callback);
    void user_reload(std::uint64_t user_ref, const std::optional<gm::wire::GMFunction>& callback);
    void user_delete(std::uint64_t user_ref, const std::optional<gm::wire::GMFunction>& callback);
    std::uint64_t federated_oauth_provider_create(std::string_view provider_id, const gm::wire::GMValue& scopes, const gm::wire::GMValue& custom_parameters);
    void federated_oauth_provider_set_data(std::uint64_t provider, std::string_view provider_id, const gm::wire::GMValue& scopes, const gm::wire::GMValue& custom_parameters);
    void federated_oauth_provider_release(std::uint64_t provider);
    void sign_in_with_provider(std::uint64_t provider, const std::optional<gm::wire::GMFunction>& callback);
    void sign_in_with_custom_token_result(std::string_view custom_token, const std::optional<gm::wire::GMFunction>& callback);
    void sign_in_and_retrieve_data_with_credential_result(std::uint64_t credential, const std::optional<gm::wire::GMFunction>& callback);
    void sign_in_anonymously_result(const std::optional<gm::wire::GMFunction>& callback);
    void sign_in_with_email_and_password_result(std::string_view email, std::string_view password, const std::optional<gm::wire::GMFunction>& callback);
    void create_user_with_email_and_password_result(std::string_view email, std::string_view password, const std::optional<gm::wire::GMFunction>& callback);
    double user_provider_data_count(std::uint64_t user);
    gm::wire::DataStream user_provider_data_at(std::uint64_t user, double index);
    void user_reauthenticate_with_provider(std::uint64_t user, std::uint64_t provider, const std::optional<gm::wire::GMFunction>& callback);
    void user_link_with_provider(std::uint64_t user, std::uint64_t provider, const std::optional<gm::wire::GMFunction>& callback);
    void user_reauthenticate_and_retrieve_data_result(std::uint64_t user, std::uint64_t credential, const std::optional<gm::wire::GMFunction>& callback);
    void user_link_with_credential_result(std::uint64_t user, std::uint64_t credential, const std::optional<gm::wire::GMFunction>& callback);
    void user_update_phone_number_credential(std::uint64_t user, std::uint64_t phone_credential, const std::optional<gm::wire::GMFunction>& callback);
    std::uint64_t get_app();
    std::uint64_t get_current_instance_handle();
    std::uint64_t get_instance_for_app(std::uint64_t app);
    double use_instance(std::uint64_t auth);
    std::uint64_t instance_get_app(std::uint64_t auth);
    std::string email_auth_provider_id();
    std::string facebook_auth_provider_id();
    std::string game_center_auth_provider_id();
    std::string github_auth_provider_id();
    std::string google_auth_provider_id();
    std::string microsoft_auth_provider_id();
    std::string play_games_auth_provider_id();
    std::string twitter_auth_provider_id();
    std::string yahoo_auth_provider_id();
    void game_center_auth_provider_get_credential_last_result(const std::optional<gm::wire::GMFunction>& callback);
}
