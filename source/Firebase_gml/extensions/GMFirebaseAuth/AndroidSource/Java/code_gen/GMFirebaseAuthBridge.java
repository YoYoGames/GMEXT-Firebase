package com.gamemaker.ExtensionCore.ExtBridge;
import java.lang.String;
import java.nio.ByteBuffer;
import ${YYAndroidPackageName}.GMExtUtils;

public final class GMFirebaseAuthBridge {
    static {
        // this is the extension lib name
        System.loadLibrary("GMFirebaseAuth");
        nativeRegister();
    }
    // this registers the native functions on the C++ layer
    private static native void nativeRegister();

    public static String __EXT_JAVA__GetExtensionOption(String extName, String optName)
    {
        return GMExtUtils.GetExtensionOption(extName, optName);
    }

    public static native double __EXT_JNI__GMFirebaseAuth_invocation_handler(ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_auth_get_auth();
    public static native String __EXT_JNI__firebase_auth_language_code();
    public static native double __EXT_JNI__firebase_auth_set_language_code(String language_code);
    public static native double __EXT_JNI__firebase_auth_use_app_language();
    public static native double __EXT_JNI__firebase_auth_use_emulator(String host, double port);
    public static native double __EXT_JNI__firebase_auth_current_user(ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_auth_sign_out();
    public static native double __EXT_JNI__firebase_auth_fetch_providers_for_email(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_sign_in_with_custom_token(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_sign_in_with_credential(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_sign_in_and_retrieve_data_with_credential(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_sign_in_anonymously(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_sign_in_with_email_and_password(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_create_user_with_email_and_password(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_send_password_reset_email(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_add_state_listener(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_auth_remove_state_listener(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_add_id_token_listener(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_auth_remove_id_token_listener(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native String __EXT_JNI__firebase_auth_credential_provider(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_credential_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_credential_release(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_email_auth_provider_get_credential(String email, String password, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_auth_facebook_auth_provider_get_credential(String access_token, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_auth_game_center_auth_provider_get_credential(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_game_center_auth_provider_is_player_authenticated();
    public static native double __EXT_JNI__firebase_auth_github_auth_provider_get_credential(String token, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_auth_google_auth_provider_get_credential(String id_token, String access_token, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_auth_oauth_provider_get_credential(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_auth_oauth_provider_get_credential_with_nonce(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_auth_play_games_auth_provider_get_credential(String server_auth_code, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_auth_twitter_auth_provider_get_credential(String token, String secret, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_auth_phone_verify_phone_number(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_auth_phone_get_credential(String verification_id, String verification_code, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native String __EXT_JNI__firebase_auth_phone_credential_sms_code(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_phone_resending_token_release(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_phone_listener_release(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_get_info(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_release(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native String __EXT_JNI__firebase_auth_user_uid(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native String __EXT_JNI__firebase_auth_user_email(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native String __EXT_JNI__firebase_auth_user_display_name(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native String __EXT_JNI__firebase_auth_user_photo_url(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native String __EXT_JNI__firebase_auth_user_provider_id(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native String __EXT_JNI__firebase_auth_user_phone_number(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_is_email_verified(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_is_anonymous(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_creation_timestamp(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_last_sign_in_timestamp(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_get_token(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_update_password(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_update_profile(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_send_email_verification(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_send_email_verification_before_updating_email(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_reauthenticate(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_reauthenticate_and_retrieve_data(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_link_with_credential(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_unlink(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_reload(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_delete(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_federated_oauth_provider_create(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_auth_federated_oauth_provider_set_data(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_federated_oauth_provider_release(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_sign_in_with_provider(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_sign_in_with_custom_token_result(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_sign_in_and_retrieve_data_with_credential_result(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_sign_in_anonymously_result(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_sign_in_with_email_and_password_result(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_create_user_with_email_and_password_result(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_provider_data_count(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_provider_data_at(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_reauthenticate_with_provider(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_link_with_provider(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_reauthenticate_and_retrieve_data_result(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_link_with_credential_result(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_user_update_phone_number_credential(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_get_app(ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_auth_get_current_instance_handle(ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_auth_get_instance_for_app(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_auth_use_instance(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_auth_instance_get_app(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native String __EXT_JNI__firebase_auth_email_auth_provider_id();
    public static native String __EXT_JNI__firebase_auth_facebook_auth_provider_id();
    public static native String __EXT_JNI__firebase_auth_game_center_auth_provider_id();
    public static native String __EXT_JNI__firebase_auth_github_auth_provider_id();
    public static native String __EXT_JNI__firebase_auth_google_auth_provider_id();
    public static native String __EXT_JNI__firebase_auth_microsoft_auth_provider_id();
    public static native String __EXT_JNI__firebase_auth_play_games_auth_provider_id();
    public static native String __EXT_JNI__firebase_auth_twitter_auth_provider_id();
    public static native String __EXT_JNI__firebase_auth_yahoo_auth_provider_id();
    public static native double __EXT_JNI__firebase_auth_game_center_auth_provider_get_credential_last_result(ByteBuffer __arg_buffer, double __arg_buffer_length);
}