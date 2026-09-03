#include "GMFirebase_core_product_api.h"
#include "GMFirebase_core_auth_impl.h"
#include <cstring>

// Every symbol below is "firebase_auth_" + the gmfb_auth:: function name -
// cross-referenced against GMFirebaseAuth's forwarders in GMFirebase_auth.cpp /
// GMFirebase_auth_user.cpp / GMFirebase_auth_credential.cpp, which all follow
// this convention with no exceptions.
GMFirebaseCoreProc gmfirebase_core_resolve_auth_proc(const char* symbol)
{
    if (symbol == nullptr) return nullptr;

    // ---- Auth singleton ----
    if (std::strcmp(symbol, "firebase_auth_get_auth") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::get_auth);

    // ---- Language / emulator configuration ----
    if (std::strcmp(symbol, "firebase_auth_language_code") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::language_code);
    if (std::strcmp(symbol, "firebase_auth_set_language_code") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::set_language_code);
    if (std::strcmp(symbol, "firebase_auth_use_app_language") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::use_app_language);
    if (std::strcmp(symbol, "firebase_auth_use_emulator") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::use_emulator);

    // ---- Current user / sign-out ----
    if (std::strcmp(symbol, "firebase_auth_current_user") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::current_user);
    if (std::strcmp(symbol, "firebase_auth_sign_out") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::sign_out);

    // ---- Provider discovery ----
    if (std::strcmp(symbol, "firebase_auth_fetch_providers_for_email") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::fetch_providers_for_email);

    // ---- Sign-in / sign-up ----
    if (std::strcmp(symbol, "firebase_auth_sign_in_with_custom_token") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::sign_in_with_custom_token);
    if (std::strcmp(symbol, "firebase_auth_sign_in_with_credential") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::sign_in_with_credential);
    if (std::strcmp(symbol, "firebase_auth_sign_in_and_retrieve_data_with_credential") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::sign_in_and_retrieve_data_with_credential);
    if (std::strcmp(symbol, "firebase_auth_sign_in_anonymously") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::sign_in_anonymously);
    if (std::strcmp(symbol, "firebase_auth_sign_in_with_email_and_password") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::sign_in_with_email_and_password);
    if (std::strcmp(symbol, "firebase_auth_create_user_with_email_and_password") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::create_user_with_email_and_password);

    // ---- Password reset ----
    if (std::strcmp(symbol, "firebase_auth_send_password_reset_email") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::send_password_reset_email);

    // ---- AuthStateListener / IdTokenListener ----
    if (std::strcmp(symbol, "firebase_auth_add_state_listener") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::add_state_listener);
    if (std::strcmp(symbol, "firebase_auth_remove_state_listener") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::remove_state_listener);
    if (std::strcmp(symbol, "firebase_auth_add_id_token_listener") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::add_id_token_listener);
    if (std::strcmp(symbol, "firebase_auth_remove_id_token_listener") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::remove_id_token_listener);

    // ---- Credential (generic accessors) ----
    if (std::strcmp(symbol, "firebase_auth_credential_provider") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::credential_provider);
    if (std::strcmp(symbol, "firebase_auth_credential_is_valid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::credential_is_valid);
    if (std::strcmp(symbol, "firebase_auth_credential_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::credential_release);

    // ---- Identity provider factories ----
    if (std::strcmp(symbol, "firebase_auth_email_auth_provider_get_credential") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::email_auth_provider_get_credential);
    if (std::strcmp(symbol, "firebase_auth_facebook_auth_provider_get_credential") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::facebook_auth_provider_get_credential);
    if (std::strcmp(symbol, "firebase_auth_game_center_auth_provider_get_credential") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::game_center_auth_provider_get_credential);
    if (std::strcmp(symbol, "firebase_auth_game_center_auth_provider_is_player_authenticated") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::game_center_auth_provider_is_player_authenticated);
    if (std::strcmp(symbol, "firebase_auth_github_auth_provider_get_credential") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::github_auth_provider_get_credential);
    if (std::strcmp(symbol, "firebase_auth_google_auth_provider_get_credential") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::google_auth_provider_get_credential);
    if (std::strcmp(symbol, "firebase_auth_oauth_provider_get_credential") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::oauth_provider_get_credential);
    if (std::strcmp(symbol, "firebase_auth_oauth_provider_get_credential_with_nonce") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::oauth_provider_get_credential_with_nonce);
    if (std::strcmp(symbol, "firebase_auth_play_games_auth_provider_get_credential") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::play_games_auth_provider_get_credential);
    if (std::strcmp(symbol, "firebase_auth_twitter_auth_provider_get_credential") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::twitter_auth_provider_get_credential);

    // ---- Phone Auth ----
    if (std::strcmp(symbol, "firebase_auth_phone_verify_phone_number") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::phone_verify_phone_number);
    if (std::strcmp(symbol, "firebase_auth_phone_get_credential") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::phone_get_credential);
    if (std::strcmp(symbol, "firebase_auth_phone_credential_sms_code") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::phone_credential_sms_code);
    if (std::strcmp(symbol, "firebase_auth_phone_resending_token_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::phone_resending_token_release);
    if (std::strcmp(symbol, "firebase_auth_phone_listener_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::phone_listener_release);

    // ---- User: basic properties ----
    // user_get_info's return type differs from GMFirebaseAuth's GML-facing
    // declaration (GMFirebaseAuthUserInfo mirror vs. generated
    // gm_structs::FirebaseAuthUserInfo) - see GMFirebase_core_auth_impl.h.
    if (std::strcmp(symbol, "firebase_auth_user_get_info") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_get_info);
    if (std::strcmp(symbol, "firebase_auth_user_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_release);
    if (std::strcmp(symbol, "firebase_auth_user_is_valid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_is_valid);
    if (std::strcmp(symbol, "firebase_auth_user_uid") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_uid);
    if (std::strcmp(symbol, "firebase_auth_user_email") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_email);
    if (std::strcmp(symbol, "firebase_auth_user_display_name") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_display_name);
    if (std::strcmp(symbol, "firebase_auth_user_photo_url") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_photo_url);
    if (std::strcmp(symbol, "firebase_auth_user_provider_id") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_provider_id);
    if (std::strcmp(symbol, "firebase_auth_user_phone_number") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_phone_number);
    if (std::strcmp(symbol, "firebase_auth_user_is_email_verified") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_is_email_verified);
    if (std::strcmp(symbol, "firebase_auth_user_is_anonymous") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_is_anonymous);
    if (std::strcmp(symbol, "firebase_auth_user_creation_timestamp") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_creation_timestamp);
    if (std::strcmp(symbol, "firebase_auth_user_last_sign_in_timestamp") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_last_sign_in_timestamp);

    // ---- User: token ----
    if (std::strcmp(symbol, "firebase_auth_user_get_token") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_get_token);

    // ---- User: profile mutation ----
    if (std::strcmp(symbol, "firebase_auth_user_update_password") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_update_password);
    if (std::strcmp(symbol, "firebase_auth_user_update_profile") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_update_profile);

    // ---- User: email verification ----
    if (std::strcmp(symbol, "firebase_auth_user_send_email_verification") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_send_email_verification);
    if (std::strcmp(symbol, "firebase_auth_user_send_email_verification_before_updating_email") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_send_email_verification_before_updating_email);

    // ---- User: reauthenticate / link / unlink ----
    if (std::strcmp(symbol, "firebase_auth_user_reauthenticate") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_reauthenticate);
    if (std::strcmp(symbol, "firebase_auth_user_reauthenticate_and_retrieve_data") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_reauthenticate_and_retrieve_data);
    if (std::strcmp(symbol, "firebase_auth_user_link_with_credential") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_link_with_credential);
    if (std::strcmp(symbol, "firebase_auth_user_unlink") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_unlink);

    // ---- User: reload / delete ----
    if (std::strcmp(symbol, "firebase_auth_user_reload") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_reload);
    if (std::strcmp(symbol, "firebase_auth_user_delete") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_delete);

    // ---- Full AuthResult materialization + Federated OAuth providers ----
    if (std::strcmp(symbol, "firebase_auth_federated_oauth_provider_create") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::federated_oauth_provider_create);
    if (std::strcmp(symbol, "firebase_auth_federated_oauth_provider_set_data") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::federated_oauth_provider_set_data);
    if (std::strcmp(symbol, "firebase_auth_federated_oauth_provider_release") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::federated_oauth_provider_release);
    if (std::strcmp(symbol, "firebase_auth_sign_in_with_provider") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::sign_in_with_provider);
    if (std::strcmp(symbol, "firebase_auth_sign_in_with_custom_token_result") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::sign_in_with_custom_token_result);
    if (std::strcmp(symbol, "firebase_auth_sign_in_and_retrieve_data_with_credential_result") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::sign_in_and_retrieve_data_with_credential_result);
    if (std::strcmp(symbol, "firebase_auth_sign_in_anonymously_result") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::sign_in_anonymously_result);
    if (std::strcmp(symbol, "firebase_auth_sign_in_with_email_and_password_result") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::sign_in_with_email_and_password_result);
    if (std::strcmp(symbol, "firebase_auth_create_user_with_email_and_password_result") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::create_user_with_email_and_password_result);

    // ---- User: provider data / federated provider / phone-number operations ----
    if (std::strcmp(symbol, "firebase_auth_user_provider_data_count") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_provider_data_count);
    if (std::strcmp(symbol, "firebase_auth_user_provider_data_at") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_provider_data_at);
    if (std::strcmp(symbol, "firebase_auth_user_reauthenticate_with_provider") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_reauthenticate_with_provider);
    if (std::strcmp(symbol, "firebase_auth_user_link_with_provider") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_link_with_provider);
    if (std::strcmp(symbol, "firebase_auth_user_reauthenticate_and_retrieve_data_result") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_reauthenticate_and_retrieve_data_result);
    if (std::strcmp(symbol, "firebase_auth_user_link_with_credential_result") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_link_with_credential_result);
    if (std::strcmp(symbol, "firebase_auth_user_update_phone_number_credential") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::user_update_phone_number_credential);

    // ---- Multi-instance helpers ----
    if (std::strcmp(symbol, "firebase_auth_get_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::get_app);
    if (std::strcmp(symbol, "firebase_auth_get_current_instance_handle") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::get_current_instance_handle);
    if (std::strcmp(symbol, "firebase_auth_get_instance_for_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::get_instance_for_app);
    if (std::strcmp(symbol, "firebase_auth_use_instance") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::use_instance);
    if (std::strcmp(symbol, "firebase_auth_instance_get_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::instance_get_app);

    // ---- Provider IDs / Game Center last-result parity ----
    if (std::strcmp(symbol, "firebase_auth_email_auth_provider_id") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::email_auth_provider_id);
    if (std::strcmp(symbol, "firebase_auth_facebook_auth_provider_id") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::facebook_auth_provider_id);
    if (std::strcmp(symbol, "firebase_auth_game_center_auth_provider_id") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::game_center_auth_provider_id);
    if (std::strcmp(symbol, "firebase_auth_github_auth_provider_id") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::github_auth_provider_id);
    if (std::strcmp(symbol, "firebase_auth_google_auth_provider_id") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::google_auth_provider_id);
    if (std::strcmp(symbol, "firebase_auth_microsoft_auth_provider_id") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::microsoft_auth_provider_id);
    if (std::strcmp(symbol, "firebase_auth_play_games_auth_provider_id") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::play_games_auth_provider_id);
    if (std::strcmp(symbol, "firebase_auth_twitter_auth_provider_id") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::twitter_auth_provider_id);
    if (std::strcmp(symbol, "firebase_auth_yahoo_auth_provider_id") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::yahoo_auth_provider_id);
    if (std::strcmp(symbol, "firebase_auth_game_center_auth_provider_get_credential_last_result") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&gmfb_auth::game_center_auth_provider_get_credential_last_result);

    return nullptr;
}
