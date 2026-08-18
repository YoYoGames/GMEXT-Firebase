package ${YYAndroidPackageName};
import static com.gamemaker.ExtensionCore.ExtBridge.GMFirebaseBridge.*;
import java.lang.String;
import java.nio.ByteBuffer;

public class GMFirebaseInternal extends RunnerSocial {
    public double __EXT_NATIVE__GMFirebase_invocation_handler(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__GMFirebase_invocation_handler(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__GMFirebase_queue_buffer(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__GMFirebase_queue_buffer(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_initialize()
    {
        return __EXT_JNI__firebase_app_initialize();
    }
    public double __EXT_NATIVE__firebase_app_is_initialized()
    {
        return __EXT_JNI__firebase_app_is_initialized();
    }
    public String __EXT_NATIVE__firebase_app_get_name()
    {
        return __EXT_JNI__firebase_app_get_name();
    }
    public double __EXT_NATIVE__firebase_last_error_code()
    {
        return __EXT_JNI__firebase_last_error_code();
    }
    public String __EXT_NATIVE__firebase_last_error_message()
    {
        return __EXT_JNI__firebase_last_error_message();
    }
    public double __EXT_NATIVE__firebase_analytics_initialize()
    {
        return __EXT_JNI__firebase_analytics_initialize();
    }
    public double __EXT_NATIVE__firebase_analytics_terminate()
    {
        return __EXT_JNI__firebase_analytics_terminate();
    }
    public double __EXT_NATIVE__firebase_analytics_set_analytics_collection_enabled(double enabled)
    {
        return __EXT_JNI__firebase_analytics_set_analytics_collection_enabled(enabled);
    }
    public double __EXT_NATIVE__firebase_analytics_set_consent(double ad_storage, double analytics_storage, double ad_user_data, double ad_personalization)
    {
        return __EXT_JNI__firebase_analytics_set_consent(ad_storage, analytics_storage, ad_user_data, ad_personalization);
    }
    public double __EXT_NATIVE__firebase_analytics_log_event(String name)
    {
        return __EXT_JNI__firebase_analytics_log_event(name);
    }
    public double __EXT_NATIVE__firebase_analytics_log_event_string(String name, String parameter_name, String parameter_value)
    {
        return __EXT_JNI__firebase_analytics_log_event_string(name, parameter_name, parameter_value);
    }
    public double __EXT_NATIVE__firebase_analytics_log_event_number(String name, String parameter_name, double parameter_value)
    {
        return __EXT_JNI__firebase_analytics_log_event_number(name, parameter_name, parameter_value);
    }
    public double __EXT_NATIVE__firebase_analytics_log_event_params(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_analytics_log_event_params(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_analytics_set_default_event_parameters(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_analytics_set_default_event_parameters(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_analytics_log_apple_transaction(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_analytics_log_apple_transaction(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_analytics_set_user_property(String name, String value)
    {
        return __EXT_JNI__firebase_analytics_set_user_property(name, value);
    }
    public double __EXT_NATIVE__firebase_analytics_set_user_id(String user_id)
    {
        return __EXT_JNI__firebase_analytics_set_user_id(user_id);
    }
    public double __EXT_NATIVE__firebase_analytics_set_session_timeout_duration(double milliseconds)
    {
        return __EXT_JNI__firebase_analytics_set_session_timeout_duration(milliseconds);
    }
    public double __EXT_NATIVE__firebase_analytics_reset_analytics_data()
    {
        return __EXT_JNI__firebase_analytics_reset_analytics_data();
    }
    public double __EXT_NATIVE__firebase_analytics_get_analytics_instance_id(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_analytics_get_analytics_instance_id(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_analytics_get_session_id(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_analytics_get_session_id(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_analytics_notify_app_lifecycle_termination()
    {
        return __EXT_JNI__firebase_analytics_notify_app_lifecycle_termination();
    }
    public double __EXT_NATIVE__firebase_analytics_is_desktop_initialized()
    {
        return __EXT_JNI__firebase_analytics_is_desktop_initialized();
    }
    public double __EXT_NATIVE__firebase_analytics_set_desktop_debug_mode(double enabled)
    {
        return __EXT_JNI__firebase_analytics_set_desktop_debug_mode(enabled);
    }
    public double __EXT_NATIVE__firebase_analytics_set_log_callback(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_analytics_set_log_callback(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_email(String email_address)
    {
        return __EXT_JNI__firebase_analytics_initiate_on_device_conversion_measurement_email(email_address);
    }
    public double __EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_phone(String phone_number)
    {
        return __EXT_JNI__firebase_analytics_initiate_on_device_conversion_measurement_phone(phone_number);
    }
    public double __EXT_NATIVE__firebase_app_check_set_provider_factory(double provider)
    {
        return __EXT_JNI__firebase_app_check_set_provider_factory(provider);
    }
    public double __EXT_NATIVE__firebase_app_check_debug_provider_set_debug_token(String token)
    {
        return __EXT_JNI__firebase_app_check_debug_provider_set_debug_token(token);
    }
    public double __EXT_NATIVE__firebase_app_check_set_token_auto_refresh_enabled(double enabled)
    {
        return __EXT_JNI__firebase_app_check_set_token_auto_refresh_enabled(enabled);
    }
    public double __EXT_NATIVE__firebase_app_check_get_token(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_app_check_get_token(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_check_get_limited_use_token(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_app_check_get_limited_use_token(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_check_add_listener(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_app_check_add_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_check_remove_listener(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_app_check_remove_listener(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_installations_get_id(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_installations_get_id(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_installations_get_token(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_installations_get_token(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_installations_delete(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_installations_delete(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_get_auth()
    {
        return __EXT_JNI__firebase_auth_get_auth();
    }
    public String __EXT_NATIVE__firebase_auth_language_code()
    {
        return __EXT_JNI__firebase_auth_language_code();
    }
    public double __EXT_NATIVE__firebase_auth_set_language_code(String language_code)
    {
        return __EXT_JNI__firebase_auth_set_language_code(language_code);
    }
    public double __EXT_NATIVE__firebase_auth_use_app_language()
    {
        return __EXT_JNI__firebase_auth_use_app_language();
    }
    public double __EXT_NATIVE__firebase_auth_use_emulator(String host, double port)
    {
        return __EXT_JNI__firebase_auth_use_emulator(host, port);
    }
    public double __EXT_NATIVE__firebase_auth_current_user(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_auth_current_user(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_sign_out()
    {
        return __EXT_JNI__firebase_auth_sign_out();
    }
    public double __EXT_NATIVE__firebase_auth_fetch_providers_for_email(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_fetch_providers_for_email(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_sign_in_with_custom_token(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_sign_in_with_custom_token(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_sign_in_with_credential(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_sign_in_with_credential(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_sign_in_and_retrieve_data_with_credential(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_sign_in_and_retrieve_data_with_credential(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_sign_in_anonymously(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_sign_in_anonymously(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_sign_in_with_email_and_password(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_sign_in_with_email_and_password(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_create_user_with_email_and_password(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_create_user_with_email_and_password(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_send_password_reset_email(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_send_password_reset_email(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_add_state_listener(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_auth_add_state_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_remove_state_listener(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_remove_state_listener(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_add_id_token_listener(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_auth_add_id_token_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_remove_id_token_listener(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_remove_id_token_listener(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_auth_credential_provider(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_credential_provider(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_credential_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_credential_is_valid(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_credential_release(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_credential_release(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_email_auth_provider_get_credential(String email, String password, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_auth_email_auth_provider_get_credential(email, password, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_facebook_auth_provider_get_credential(String access_token, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_auth_facebook_auth_provider_get_credential(access_token, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_game_center_auth_provider_get_credential(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_game_center_auth_provider_get_credential(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_game_center_auth_provider_is_player_authenticated()
    {
        return __EXT_JNI__firebase_auth_game_center_auth_provider_is_player_authenticated();
    }
    public double __EXT_NATIVE__firebase_auth_github_auth_provider_get_credential(String token, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_auth_github_auth_provider_get_credential(token, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_google_auth_provider_get_credential(String id_token, String access_token, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_auth_google_auth_provider_get_credential(id_token, access_token, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_oauth_provider_get_credential(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_auth_oauth_provider_get_credential(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_oauth_provider_get_credential_with_nonce(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_auth_oauth_provider_get_credential_with_nonce(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_play_games_auth_provider_get_credential(String server_auth_code, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_auth_play_games_auth_provider_get_credential(server_auth_code, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_twitter_auth_provider_get_credential(String token, String secret, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_auth_twitter_auth_provider_get_credential(token, secret, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_phone_verify_phone_number(String phone_number, double timeout_ms)
    {
        return __EXT_JNI__firebase_auth_phone_verify_phone_number(phone_number, timeout_ms);
    }
    public double __EXT_NATIVE__firebase_auth_user_release(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_release(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_user_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_is_valid(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_auth_user_uid(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_uid(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_auth_user_email(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_email(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_auth_user_display_name(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_display_name(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_auth_user_photo_url(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_photo_url(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_auth_user_provider_id(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_provider_id(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_auth_user_phone_number(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_phone_number(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_user_is_email_verified(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_is_email_verified(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_user_is_anonymous(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_is_anonymous(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_user_creation_timestamp(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_creation_timestamp(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_user_last_sign_in_timestamp(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_last_sign_in_timestamp(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_user_get_token(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_get_token(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_user_update_password(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_update_password(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_user_update_profile(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_update_profile(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_user_send_email_verification(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_send_email_verification(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_user_send_email_verification_before_updating_email(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_send_email_verification_before_updating_email(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_user_reauthenticate(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_reauthenticate(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_user_reauthenticate_and_retrieve_data(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_reauthenticate_and_retrieve_data(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_user_link_with_credential(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_link_with_credential(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_user_unlink(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_unlink(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_user_reload(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_reload(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_auth_user_delete(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_auth_user_delete(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_get_instance(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_get_instance(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_get_instance_for_url(String url, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_get_instance_for_url(url, __ret_buffer, __ret_buffer_length);
    }
    public String __EXT_NATIVE__firebase_database_get_url(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_get_url(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_get_reference(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_get_reference_at_path(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_get_reference_at_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_get_reference_from_url(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_get_reference_from_url(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_go_offline(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_go_offline(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_go_online(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_go_online(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_purge_outstanding_writes(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_purge_outstanding_writes(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_set_persistence_enabled(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_set_persistence_enabled(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_set_log_level(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_set_log_level(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_get_log_level(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_get_log_level(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_order_by_child(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_order_by_child(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_order_by_key(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_order_by_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_order_by_value(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_order_by_value(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_order_by_priority(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_order_by_priority(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_start_at(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_start_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_start_at_key(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_start_at_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_end_at(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_end_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_end_at_key(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_end_at_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_equal_to(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_equal_to(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_equal_to_key(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_equal_to_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_limit_to_first(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_limit_to_first(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_limit_to_last(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_limit_to_last(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_set_keep_synchronized(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_set_keep_synchronized(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_get_value(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_get_value(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_add_value_listener(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_add_value_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_remove_value_listener(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_remove_value_listener(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_remove_all_value_listeners(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_remove_all_value_listeners(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_add_child_listener(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_add_child_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_remove_child_listener(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_remove_child_listener(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_remove_all_child_listeners(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_remove_all_child_listeners(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_order_by_child(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_order_by_child(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_order_by_key(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_order_by_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_order_by_value(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_order_by_value(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_order_by_priority(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_order_by_priority(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_start_at(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_start_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_start_at_key(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_start_at_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_end_at(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_end_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_end_at_key(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_end_at_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_equal_to(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_equal_to(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_equal_to_key(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_equal_to_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_limit_to_first(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_limit_to_first(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_limit_to_last(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_limit_to_last(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_get_reference(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_set_keep_synchronized(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_set_keep_synchronized(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_is_valid(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_get_value(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_get_value(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_add_value_listener(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_add_value_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_remove_value_listener(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_remove_value_listener(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_remove_all_value_listeners(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_remove_all_value_listeners(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_add_child_listener(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_add_child_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_remove_child_listener(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_remove_child_listener(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_remove_all_child_listeners(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_remove_all_child_listeners(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_query_release(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_query_release(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_get(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_get(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_child(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_child(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_push(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_push(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_go_online(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_go_online(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_go_offline(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_go_offline(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_set_value(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_set_value(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_set_priority(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_set_priority(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_set_value_and_priority(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_set_value_and_priority(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_update_children(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_update_children(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_remove_value(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_remove_value(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_run_transaction(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_run_transaction(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_ref_release(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_ref_release(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_exists(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_exists(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_is_valid(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_child(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_child(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_has_child(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_has_child(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_has_children(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_has_children(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_children_count(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_children_count(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_get_children(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_get_children(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public String __EXT_NATIVE__firebase_database_snapshot_key(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_key(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_get_reference(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_get_info(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_get_info(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_get_value(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_get_value(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_get_priority(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_get_priority(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_database_snapshot_release(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_database_snapshot_release(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_get_instance(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_get_instance(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_get_instance_for_database(String database_name, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_get_instance_for_database(database_name, __ret_buffer, __ret_buffer_length);
    }
    public String __EXT_NATIVE__firebase_firestore_settings_get_host(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_settings_get_host(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_settings_set_host(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_settings_set_host(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_settings_get_ssl_enabled(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_settings_get_ssl_enabled(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_settings_set_ssl_enabled(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_settings_set_ssl_enabled(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_settings_get_persistence_enabled(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_settings_get_persistence_enabled(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_settings_set_persistence_enabled(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_settings_set_persistence_enabled(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_settings_get_cache_size_bytes(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_settings_get_cache_size_bytes(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_settings_set_cache_size_bytes(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_settings_set_cache_size_bytes(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_collection(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_collection(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_document(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_collection_group(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_collection_group(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_batch(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_batch(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_set_log_level(double level)
    {
        return __EXT_JNI__firebase_firestore_set_log_level(level);
    }
    public double __EXT_NATIVE__firebase_firestore_enable_network(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_enable_network(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_disable_network(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_disable_network(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_terminate(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_terminate(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_clear_persistence(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_clear_persistence(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_wait_for_pending_writes(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_wait_for_pending_writes(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_run_transaction(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_run_transaction(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_firestore_collection_ref_id(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_collection_ref_id(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_firestore_collection_ref_path(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_collection_ref_path(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_collection_ref_parent(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_collection_ref_parent(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_collection_ref_document(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_collection_ref_document(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_collection_ref_document_path(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_collection_ref_document_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_collection_ref_add(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_collection_ref_add(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_collection_ref_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_collection_ref_is_valid(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_collection_ref_release(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_collection_ref_release(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_firestore_document_ref_id(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document_ref_id(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_firestore_document_ref_path(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document_ref_path(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_document_ref_parent(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document_ref_parent(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_document_ref_collection(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document_ref_collection(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_document_ref_get(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document_ref_get(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_document_ref_set(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document_ref_set(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_document_ref_set_merge(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document_ref_set_merge(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_document_ref_set_merge_fields(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document_ref_set_merge_fields(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_document_ref_update(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document_ref_update(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_document_ref_delete(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document_ref_delete(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_document_ref_add_snapshot_listener(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document_ref_add_snapshot_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_document_ref_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document_ref_is_valid(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_document_ref_release(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document_ref_release(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_where_equal_to(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_where_equal_to(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_where_not_equal_to(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_where_not_equal_to(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_where_less_than(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_where_less_than(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_where_less_than_or_equal_to(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_where_less_than_or_equal_to(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_where_greater_than(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_where_greater_than(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_where_greater_than_or_equal_to(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_where_greater_than_or_equal_to(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_where_array_contains(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_where_array_contains(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_where_array_contains_any(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_where_array_contains_any(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_where_in(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_where_in(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_where_not_in(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_where_not_in(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_order_by(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_order_by(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_limit(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_limit(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_limit_to_last(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_limit_to_last(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_start_at_snapshot(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_start_at_snapshot(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_start_at_values(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_start_at_values(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_start_after_snapshot(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_start_after_snapshot(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_start_after_values(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_start_after_values(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_end_before_snapshot(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_end_before_snapshot(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_end_before_values(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_end_before_values(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_end_at_snapshot(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_end_at_snapshot(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_end_at_values(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_end_at_values(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_get(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_get(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_add_snapshot_listener(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_add_snapshot_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_is_valid(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_release(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_release(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_write_batch_set(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_write_batch_set(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_write_batch_set_merge(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_write_batch_set_merge(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_write_batch_set_merge_fields(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_write_batch_set_merge_fields(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_write_batch_update(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_write_batch_update(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_write_batch_delete(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_write_batch_delete(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_write_batch_commit(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_write_batch_commit(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_write_batch_release(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_write_batch_release(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_field_value_delete(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_field_value_delete(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_field_value_server_timestamp(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_field_value_server_timestamp(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_field_value_array_union(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_field_value_array_union(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_field_value_array_remove(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_field_value_array_remove(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_field_value_increment_integer(double value, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_field_value_increment_integer(value, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_field_value_increment_double(double value, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_field_value_increment_double(value, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_field_value_integer(double value, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_field_value_integer(value, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_field_value_double(double value, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_field_value_double(value, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_field_value_timestamp(double seconds, double nanoseconds, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_field_value_timestamp(seconds, nanoseconds, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_field_value_geo_point(double latitude, double longitude, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_field_value_geo_point(latitude, longitude, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_field_value_reference(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_field_value_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_field_value_blob(String data, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_field_value_blob(data, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_field_value_null(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_field_value_null(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_field_value_release(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_field_value_release(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_document_snapshot_exists(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document_snapshot_exists(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_firestore_document_snapshot_id(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document_snapshot_id(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_document_snapshot_reference(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document_snapshot_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_document_snapshot_metadata_has_pending_writes(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document_snapshot_metadata_has_pending_writes(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_document_snapshot_metadata_is_from_cache(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document_snapshot_metadata_is_from_cache(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_document_snapshot_get(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document_snapshot_get(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_document_snapshot_get_data(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document_snapshot_get_data(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_document_snapshot_release(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_document_snapshot_release(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_snapshot_size(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_snapshot_size(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_snapshot_empty(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_snapshot_empty(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_snapshot_metadata_has_pending_writes(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_snapshot_metadata_has_pending_writes(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_snapshot_metadata_is_from_cache(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_snapshot_metadata_is_from_cache(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_snapshot_documents(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_snapshot_documents(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_snapshot_document_changes(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_snapshot_document_changes(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_query_snapshot_release(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_query_snapshot_release(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_firestore_listener_registration_remove(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_firestore_listener_registration_remove(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_get_instance(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_storage_get_instance(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_get_instance_with_url(String url, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_storage_get_instance_with_url(url, __ret_buffer, __ret_buffer_length);
    }
    public String __EXT_NATIVE__firebase_storage_url(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_url(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_get_reference(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_storage_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_get_reference_path(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_storage_get_reference_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_get_reference_from_url(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_storage_get_reference_from_url(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_max_download_retry_time(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_max_download_retry_time(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_set_max_download_retry_time(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_set_max_download_retry_time(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_max_upload_retry_time(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_max_upload_retry_time(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_set_max_upload_retry_time(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_set_max_upload_retry_time(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_max_operation_retry_time(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_max_operation_retry_time(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_set_max_operation_retry_time(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_set_max_operation_retry_time(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_use_emulator(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_use_emulator(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_ref_child(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_storage_ref_child(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_ref_get_parent(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_storage_ref_get_parent(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public String __EXT_NATIVE__firebase_storage_ref_bucket(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_ref_bucket(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_storage_ref_full_path(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_ref_full_path(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_storage_ref_name(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_ref_name(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_ref_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_ref_is_valid(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_ref_storage(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_storage_ref_storage(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_ref_delete(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_ref_delete(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_ref_get_download_url(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_ref_get_download_url(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_ref_get_metadata(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_ref_get_metadata(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_ref_update_metadata(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_ref_update_metadata(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_ref_put_bytes(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_ref_put_bytes(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_ref_put_file(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_ref_put_file(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_ref_get_bytes(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_ref_get_bytes(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_ref_get_file(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_ref_get_file(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_ref_list(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_ref_list(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_metadata_create(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_create(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_metadata_release(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_release(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_metadata_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_is_valid(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_storage_metadata_bucket(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_bucket(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_storage_metadata_cache_control(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_cache_control(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_metadata_set_cache_control(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_set_cache_control(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_storage_metadata_content_disposition(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_content_disposition(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_metadata_set_content_disposition(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_set_content_disposition(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_storage_metadata_content_encoding(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_content_encoding(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_metadata_set_content_encoding(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_set_content_encoding(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_storage_metadata_content_language(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_content_language(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_metadata_set_content_language(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_set_content_language(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_storage_metadata_content_type(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_content_type(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_metadata_set_content_type(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_set_content_type(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_metadata_creation_time(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_creation_time(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_metadata_generation(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_generation(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_metadata_metadata_generation(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_metadata_generation(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_storage_metadata_name(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_name(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_storage_metadata_path(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_path(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_metadata_get_reference(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_metadata_size_bytes(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_size_bytes(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_metadata_updated_time(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_updated_time(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_metadata_custom_metadata_count(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_custom_metadata_count(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_storage_metadata_custom_metadata_key_at(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_custom_metadata_key_at(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_storage_metadata_get_custom_metadata(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_get_custom_metadata(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_metadata_set_custom_metadata(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_metadata_set_custom_metadata(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_controller_create(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_storage_controller_create(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_controller_release(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_controller_release(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_controller_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_controller_is_valid(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_controller_pause(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_controller_pause(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_controller_resume(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_controller_resume(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_controller_cancel(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_controller_cancel(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_controller_is_paused(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_controller_is_paused(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_controller_bytes_transferred(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_controller_bytes_transferred(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_controller_total_byte_count(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_controller_total_byte_count(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_controller_get_reference(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_storage_controller_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_list_result_release(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_list_result_release(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_list_result_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_list_result_is_valid(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_list_result_item_count(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_list_result_item_count(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_list_result_item_at(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_storage_list_result_item_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_list_result_prefix_count(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_list_result_prefix_count(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_storage_list_result_prefix_at(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_storage_list_result_prefix_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public String __EXT_NATIVE__firebase_storage_list_result_next_page_token(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_storage_list_result_next_page_token(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_functions_get_instance(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_functions_get_instance(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_functions_get_instance_with_region(String region, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_functions_get_instance_with_region(region, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_functions_use_functions_emulator(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_functions_use_functions_emulator(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_functions_get_https_callable(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_functions_get_https_callable(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_functions_get_https_callable_with_options(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_functions_get_https_callable_with_options(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_functions_get_https_callable_from_url(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_functions_get_https_callable_from_url(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_functions_get_https_callable_from_url_with_options(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_functions_get_https_callable_from_url_with_options(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_functions_callable_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_functions_callable_is_valid(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_functions_callable_call(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_functions_callable_call(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_functions_callable_call_with_data(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_functions_callable_call_with_data(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_remote_config_get_instance(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_get_instance(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_remote_config_ensure_initialized(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_ensure_initialized(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_remote_config_set_config_settings(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_set_config_settings(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_remote_config_get_config_settings_fetch_timeout(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_get_config_settings_fetch_timeout(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_remote_config_get_config_settings_minimum_fetch_interval(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_get_config_settings_minimum_fetch_interval(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_remote_config_fetch(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_fetch(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_remote_config_fetch_with_expiration(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_fetch_with_expiration(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_remote_config_fetch_and_activate(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_fetch_and_activate(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_remote_config_activate(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_activate(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_remote_config_get_boolean(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_get_boolean(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_remote_config_get_long(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_get_long(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_remote_config_get_double(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_get_double(__arg_buffer, __arg_buffer_length);
    }
    public String __EXT_NATIVE__firebase_remote_config_get_string(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_get_string(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_remote_config_get_data_size(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_get_data_size(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_remote_config_get_data(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_get_data(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_remote_config_get_keys_by_prefix(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_get_keys_by_prefix(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_remote_config_get_keys(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_get_keys(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_remote_config_get_all(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_get_all(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_remote_config_set_defaults(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_set_defaults(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_remote_config_get_info(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_get_info(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_remote_config_add_config_update_listener(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_add_config_update_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_remote_config_remove_config_update_listener(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_remote_config_remove_config_update_listener(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_messaging_initialize()
    {
        return __EXT_JNI__firebase_messaging_initialize();
    }
    public double __EXT_NATIVE__firebase_messaging_terminate()
    {
        return __EXT_JNI__firebase_messaging_terminate();
    }
    public double __EXT_NATIVE__firebase_messaging_set_token_registration_on_init_enabled(double enabled)
    {
        return __EXT_JNI__firebase_messaging_set_token_registration_on_init_enabled(enabled);
    }
    public double __EXT_NATIVE__firebase_messaging_is_token_registration_on_init_enabled()
    {
        return __EXT_JNI__firebase_messaging_is_token_registration_on_init_enabled();
    }
    public double __EXT_NATIVE__firebase_messaging_delivery_metrics_export_to_big_query_enabled()
    {
        return __EXT_JNI__firebase_messaging_delivery_metrics_export_to_big_query_enabled();
    }
    public double __EXT_NATIVE__firebase_messaging_set_delivery_metrics_export_to_big_query(double enabled)
    {
        return __EXT_JNI__firebase_messaging_set_delivery_metrics_export_to_big_query(enabled);
    }
    public double __EXT_NATIVE__firebase_messaging_request_permission(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_messaging_request_permission(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_messaging_get_token(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_messaging_get_token(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_messaging_delete_token(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_messaging_delete_token(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_messaging_subscribe(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_messaging_subscribe(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_messaging_unsubscribe(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_messaging_unsubscribe(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_messaging_poll_message()
    {
        return __EXT_JNI__firebase_messaging_poll_message();
    }
    public double __EXT_NATIVE__firebase_messaging_poll_token()
    {
        return __EXT_JNI__firebase_messaging_poll_token();
    }
    public String __EXT_NATIVE__firebase_messaging_current_token()
    {
        return __EXT_JNI__firebase_messaging_current_token();
    }
    public String __EXT_NATIVE__firebase_messaging_message_from()
    {
        return __EXT_JNI__firebase_messaging_message_from();
    }
    public String __EXT_NATIVE__firebase_messaging_message_to()
    {
        return __EXT_JNI__firebase_messaging_message_to();
    }
    public String __EXT_NATIVE__firebase_messaging_message_collapse_key()
    {
        return __EXT_JNI__firebase_messaging_message_collapse_key();
    }
    public String __EXT_NATIVE__firebase_messaging_message_message_id()
    {
        return __EXT_JNI__firebase_messaging_message_message_id();
    }
    public String __EXT_NATIVE__firebase_messaging_message_message_type()
    {
        return __EXT_JNI__firebase_messaging_message_message_type();
    }
    public String __EXT_NATIVE__firebase_messaging_message_priority()
    {
        return __EXT_JNI__firebase_messaging_message_priority();
    }
    public String __EXT_NATIVE__firebase_messaging_message_original_priority()
    {
        return __EXT_JNI__firebase_messaging_message_original_priority();
    }
    public double __EXT_NATIVE__firebase_messaging_message_time_to_live()
    {
        return __EXT_JNI__firebase_messaging_message_time_to_live();
    }
    public double __EXT_NATIVE__firebase_messaging_message_sent_time()
    {
        return __EXT_JNI__firebase_messaging_message_sent_time();
    }
    public String __EXT_NATIVE__firebase_messaging_message_error()
    {
        return __EXT_JNI__firebase_messaging_message_error();
    }
    public String __EXT_NATIVE__firebase_messaging_message_error_description()
    {
        return __EXT_JNI__firebase_messaging_message_error_description();
    }
    public String __EXT_NATIVE__firebase_messaging_message_link()
    {
        return __EXT_JNI__firebase_messaging_message_link();
    }
    public double __EXT_NATIVE__firebase_messaging_message_notification_opened()
    {
        return __EXT_JNI__firebase_messaging_message_notification_opened();
    }
    public double __EXT_NATIVE__firebase_messaging_message_data_count()
    {
        return __EXT_JNI__firebase_messaging_message_data_count();
    }
    public String __EXT_NATIVE__firebase_messaging_message_data_key_at(double index)
    {
        return __EXT_JNI__firebase_messaging_message_data_key_at(index);
    }
    public String __EXT_NATIVE__firebase_messaging_message_get_data(String key)
    {
        return __EXT_JNI__firebase_messaging_message_get_data(key);
    }
    public double __EXT_NATIVE__firebase_messaging_message_raw_data_size()
    {
        return __EXT_JNI__firebase_messaging_message_raw_data_size();
    }
    public double __EXT_NATIVE__firebase_messaging_message_raw_data_copy(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_messaging_message_raw_data_copy(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_messaging_message_has_notification()
    {
        return __EXT_JNI__firebase_messaging_message_has_notification();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_title()
    {
        return __EXT_JNI__firebase_messaging_message_notification_title();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_body()
    {
        return __EXT_JNI__firebase_messaging_message_notification_body();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_icon()
    {
        return __EXT_JNI__firebase_messaging_message_notification_icon();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_sound()
    {
        return __EXT_JNI__firebase_messaging_message_notification_sound();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_badge()
    {
        return __EXT_JNI__firebase_messaging_message_notification_badge();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_tag()
    {
        return __EXT_JNI__firebase_messaging_message_notification_tag();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_color()
    {
        return __EXT_JNI__firebase_messaging_message_notification_color();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_click_action()
    {
        return __EXT_JNI__firebase_messaging_message_notification_click_action();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_body_loc_key()
    {
        return __EXT_JNI__firebase_messaging_message_notification_body_loc_key();
    }
    public double __EXT_NATIVE__firebase_messaging_message_notification_body_loc_args_count()
    {
        return __EXT_JNI__firebase_messaging_message_notification_body_loc_args_count();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_body_loc_args_at(double index)
    {
        return __EXT_JNI__firebase_messaging_message_notification_body_loc_args_at(index);
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_title_loc_key()
    {
        return __EXT_JNI__firebase_messaging_message_notification_title_loc_key();
    }
    public double __EXT_NATIVE__firebase_messaging_message_notification_title_loc_args_count()
    {
        return __EXT_JNI__firebase_messaging_message_notification_title_loc_args_count();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_title_loc_args_at(double index)
    {
        return __EXT_JNI__firebase_messaging_message_notification_title_loc_args_at(index);
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_android_channel_id()
    {
        return __EXT_JNI__firebase_messaging_message_notification_android_channel_id();
    }
    public double __EXT_NATIVE__firebase_ump_get_instance(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_ump_get_instance(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_get_consent_status(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_ump_get_consent_status(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_get_consent_form_status(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_ump_get_consent_form_status(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_get_privacy_options_requirement_status(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_ump_get_privacy_options_requirement_status(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_can_request_ads(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_ump_can_request_ads(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_reset(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_ump_reset(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_request_consent_info_update(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_ump_request_consent_info_update(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_load_consent_form(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_ump_load_consent_form(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_show_consent_form(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_ump_show_consent_form(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_load_and_show_consent_form_if_required(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_ump_load_and_show_consent_form_if_required(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_show_privacy_options_form(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_ump_show_privacy_options_form(__arg_buffer, __arg_buffer_length);
    }
}