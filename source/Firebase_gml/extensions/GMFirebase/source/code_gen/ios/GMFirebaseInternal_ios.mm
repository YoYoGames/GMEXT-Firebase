// ##### extgen :: Auto-generated file do not edit!! #####

#import "GMFirebaseInternal_ios.h"
#import "native/GMFirebaseInternal_exports.h"
#import <objc/runtime.h>


extern "C" const char* extOptGetString(char* _ext, char* _opt);

// Adapter: matches const signature expected by the C++ API
static const char* ExtOptGetString(const char* ext, const char* opt)
{
    return extOptGetString(const_cast<char*>(ext), const_cast<char*>(opt));
}

static BOOL GMIsSubclassOf(Class cls, Class base)
{
    for (Class c = cls; c != Nil; c = class_getSuperclass(c)) {
        if (c == base) return YES;
    }
    return NO;
}

static void GMInjectSelectorsIntoSubclass(Class subclass, Class base)
{
    // Build set of methods already defined on subclass
    unsigned subCount = 0;
    Method *subList = class_copyMethodList(subclass, &subCount);

    CFMutableSetRef owned = CFSetCreateMutable(kCFAllocatorDefault, 0, NULL);
    for (unsigned i = 0; i < subCount; ++i) {
        CFSetAddValue(owned, method_getName(subList[i]));
    }

    // Walk base class methods
    unsigned baseCount = 0;
    Method *baseList = class_copyMethodList(base, &baseCount);

    for (unsigned i = 0; i < baseCount; ++i) {
        SEL sel = method_getName(baseList[i]);
        const char *name = sel_getName(sel);

        // Only inject extension selectors (methods prefixed with __EXT_NATIVE__)
        if (!name || strncmp(name, "__EXT_NATIVE__", 13) != 0) continue;

        // Add only if subclass doesn't already have it
        if (!CFSetContainsValue(owned, sel)) {
            IMP imp = method_getImplementation(baseList[i]);
            const char *types = method_getTypeEncoding(baseList[i]);
            if (class_addMethod(subclass, sel, imp, types)) {
                CFSetAddValue(owned, sel);
            }
        }
    }

    if (subList) free(subList);
    if (baseList) free(baseList);
    if (owned) CFRelease(owned);
}

@implementation GMFirebaseInternal

+ (void)load
{
    // Find all loaded classes
    int num = objc_getClassList(NULL, 0);
    if (num <= 0) return;

    Class *classes = (Class *)malloc(sizeof(Class) * (unsigned)num);
    num = objc_getClassList(classes, num);

    Class base = [GMFirebaseInternal class];

    for (int i = 0; i < num; ++i) {
        Class cls = classes[i];
        if (cls == base) continue;

        // We only care about direct or indirect subclasses
        if (GMIsSubclassOf(cls, base)) {
            GMInjectSelectorsIntoSubclass(cls, base);
        }
    }

    free(classes);

    gm::details::GMRTRunnerInterface ri{};
    ri.ExtOptGetString = &ExtOptGetString;
    GMExtensionInitialise(&ri, sizeof(ri));
}

- (double)__EXT_NATIVE__firebase_app_initialize
{
    return __EXT_NATIVE__firebase_app_initialize();
}
- (double)__EXT_NATIVE__firebase_app_is_initialized
{
    return __EXT_NATIVE__firebase_app_is_initialized();
}
- (char*)__EXT_NATIVE__firebase_app_get_name
{
    return __EXT_NATIVE__firebase_app_get_name();
}
- (double)__EXT_NATIVE__firebase_last_error_code
{
    return __EXT_NATIVE__firebase_last_error_code();
}
- (char*)__EXT_NATIVE__firebase_last_error_message
{
    return __EXT_NATIVE__firebase_last_error_message();
}
- (double)__EXT_NATIVE__firebase_analytics_initialize
{
    return __EXT_NATIVE__firebase_analytics_initialize();
}
- (double)__EXT_NATIVE__firebase_analytics_terminate
{
    return __EXT_NATIVE__firebase_analytics_terminate();
}
- (double)__EXT_NATIVE__firebase_analytics_set_analytics_collection_enabled:(double)enabled
{
    return __EXT_NATIVE__firebase_analytics_set_analytics_collection_enabled(enabled);
}
- (double)__EXT_NATIVE__firebase_analytics_set_consent:(double)ad_storage arg1:(double)analytics_storage arg2:(double)ad_user_data arg3:(double)ad_personalization
{
    return __EXT_NATIVE__firebase_analytics_set_consent(ad_storage, analytics_storage, ad_user_data, ad_personalization);
}
- (double)__EXT_NATIVE__firebase_analytics_log_event:(char*)name
{
    return __EXT_NATIVE__firebase_analytics_log_event(name);
}
- (double)__EXT_NATIVE__firebase_analytics_log_event_string:(char*)name arg1:(char*)parameter_name arg2:(char*)parameter_value
{
    return __EXT_NATIVE__firebase_analytics_log_event_string(name, parameter_name, parameter_value);
}
- (double)__EXT_NATIVE__firebase_analytics_log_event_number:(char*)name arg1:(char*)parameter_name arg2:(double)parameter_value
{
    return __EXT_NATIVE__firebase_analytics_log_event_number(name, parameter_name, parameter_value);
}
- (double)__EXT_NATIVE__firebase_analytics_log_event_params:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_analytics_log_event_params(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_analytics_set_default_event_parameters:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_analytics_set_default_event_parameters(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_analytics_log_apple_transaction:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_analytics_log_apple_transaction(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_analytics_set_user_property:(char*)name arg1:(char*)value
{
    return __EXT_NATIVE__firebase_analytics_set_user_property(name, value);
}
- (double)__EXT_NATIVE__firebase_analytics_set_user_id:(char*)user_id
{
    return __EXT_NATIVE__firebase_analytics_set_user_id(user_id);
}
- (double)__EXT_NATIVE__firebase_analytics_set_session_timeout_duration:(double)milliseconds
{
    return __EXT_NATIVE__firebase_analytics_set_session_timeout_duration(milliseconds);
}
- (double)__EXT_NATIVE__firebase_analytics_reset_analytics_data
{
    return __EXT_NATIVE__firebase_analytics_reset_analytics_data();
}
- (double)__EXT_NATIVE__firebase_analytics_get_analytics_instance_id:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_analytics_get_analytics_instance_id(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_analytics_get_session_id:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_analytics_get_session_id(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_analytics_notify_app_lifecycle_termination
{
    return __EXT_NATIVE__firebase_analytics_notify_app_lifecycle_termination();
}
- (double)__EXT_NATIVE__firebase_analytics_is_desktop_initialized
{
    return __EXT_NATIVE__firebase_analytics_is_desktop_initialized();
}
- (double)__EXT_NATIVE__firebase_analytics_set_desktop_debug_mode:(double)enabled
{
    return __EXT_NATIVE__firebase_analytics_set_desktop_debug_mode(enabled);
}
- (double)__EXT_NATIVE__firebase_analytics_set_log_callback:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_analytics_set_log_callback(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_email:(char*)email_address
{
    return __EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_email(email_address);
}
- (double)__EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_phone:(char*)phone_number
{
    return __EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_phone(phone_number);
}
- (double)__EXT_NATIVE__firebase_app_check_set_provider_factory:(double)provider
{
    return __EXT_NATIVE__firebase_app_check_set_provider_factory(provider);
}
- (double)__EXT_NATIVE__firebase_app_check_debug_provider_set_debug_token:(char*)token
{
    return __EXT_NATIVE__firebase_app_check_debug_provider_set_debug_token(token);
}
- (double)__EXT_NATIVE__firebase_app_check_set_token_auto_refresh_enabled:(double)enabled
{
    return __EXT_NATIVE__firebase_app_check_set_token_auto_refresh_enabled(enabled);
}
- (double)__EXT_NATIVE__firebase_app_check_get_token:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_app_check_get_token(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_app_check_get_limited_use_token:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_app_check_get_limited_use_token(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_app_check_add_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_app_check_add_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_app_check_remove_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_app_check_remove_listener(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_installations_get_id:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_installations_get_id(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_installations_get_token:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_installations_get_token(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_installations_delete:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_installations_delete(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_get_auth
{
    return __EXT_NATIVE__firebase_auth_get_auth();
}
- (char*)__EXT_NATIVE__firebase_auth_language_code
{
    return __EXT_NATIVE__firebase_auth_language_code();
}
- (double)__EXT_NATIVE__firebase_auth_set_language_code:(char*)language_code
{
    return __EXT_NATIVE__firebase_auth_set_language_code(language_code);
}
- (double)__EXT_NATIVE__firebase_auth_use_app_language
{
    return __EXT_NATIVE__firebase_auth_use_app_language();
}
- (double)__EXT_NATIVE__firebase_auth_use_emulator:(char*)host arg1:(double)port
{
    return __EXT_NATIVE__firebase_auth_use_emulator(host, port);
}
- (double)__EXT_NATIVE__firebase_auth_current_user:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_auth_current_user(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_sign_out
{
    return __EXT_NATIVE__firebase_auth_sign_out();
}
- (double)__EXT_NATIVE__firebase_auth_fetch_providers_for_email:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_fetch_providers_for_email(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_sign_in_with_custom_token:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_sign_in_with_custom_token(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_sign_in_with_credential:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_sign_in_with_credential(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_sign_in_and_retrieve_data_with_credential:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_sign_in_and_retrieve_data_with_credential(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_sign_in_anonymously:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_sign_in_anonymously(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_sign_in_with_email_and_password:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_sign_in_with_email_and_password(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_create_user_with_email_and_password:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_create_user_with_email_and_password(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_send_password_reset_email:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_send_password_reset_email(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_add_state_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_auth_add_state_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_remove_state_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_remove_state_listener(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_add_id_token_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_auth_add_id_token_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_remove_id_token_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_remove_id_token_listener(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_auth_credential_provider:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_credential_provider(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_credential_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_credential_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_credential_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_credential_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_email_auth_provider_get_credential:(char*)email arg1:(char*)password arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_auth_email_auth_provider_get_credential(email, password, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_facebook_auth_provider_get_credential:(char*)access_token arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_auth_facebook_auth_provider_get_credential(access_token, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_game_center_auth_provider_get_credential:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_game_center_auth_provider_get_credential(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_game_center_auth_provider_is_player_authenticated
{
    return __EXT_NATIVE__firebase_auth_game_center_auth_provider_is_player_authenticated();
}
- (double)__EXT_NATIVE__firebase_auth_github_auth_provider_get_credential:(char*)token arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_auth_github_auth_provider_get_credential(token, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_google_auth_provider_get_credential:(char*)id_token arg1:(char*)access_token arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_auth_google_auth_provider_get_credential(id_token, access_token, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_oauth_provider_get_credential:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_auth_oauth_provider_get_credential(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_oauth_provider_get_credential_with_nonce:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_auth_oauth_provider_get_credential_with_nonce(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_play_games_auth_provider_get_credential:(char*)server_auth_code arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_auth_play_games_auth_provider_get_credential(server_auth_code, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_twitter_auth_provider_get_credential:(char*)token arg1:(char*)secret arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_auth_twitter_auth_provider_get_credential(token, secret, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_phone_verify_phone_number:(char*)phone_number arg1:(double)timeout_ms
{
    return __EXT_NATIVE__firebase_auth_phone_verify_phone_number(phone_number, timeout_ms);
}
- (double)__EXT_NATIVE__firebase_auth_user_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_user_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_is_valid(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_auth_user_uid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_uid(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_auth_user_email:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_email(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_auth_user_display_name:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_display_name(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_auth_user_photo_url:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_photo_url(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_auth_user_provider_id:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_provider_id(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_auth_user_phone_number:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_phone_number(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_user_is_email_verified:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_is_email_verified(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_user_is_anonymous:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_is_anonymous(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_user_creation_timestamp:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_creation_timestamp(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_user_last_sign_in_timestamp:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_last_sign_in_timestamp(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_user_get_token:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_get_token(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_user_update_password:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_update_password(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_user_update_profile:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_update_profile(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_user_send_email_verification:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_send_email_verification(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_user_send_email_verification_before_updating_email:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_send_email_verification_before_updating_email(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_user_reauthenticate:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_reauthenticate(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_user_reauthenticate_and_retrieve_data:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_reauthenticate_and_retrieve_data(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_user_link_with_credential:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_link_with_credential(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_user_unlink:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_unlink(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_user_reload:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_reload(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_auth_user_delete:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_auth_user_delete(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_get_instance:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_get_instance(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_get_instance_for_url:(char*)url arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_get_instance_for_url(url, __ret_buffer, __ret_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_database_get_url:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_get_url(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_get_reference:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_get_reference_at_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_get_reference_at_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_get_reference_from_url:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_get_reference_from_url(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_go_offline:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_go_offline(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_go_online:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_go_online(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_purge_outstanding_writes:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_purge_outstanding_writes(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_set_persistence_enabled:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_set_persistence_enabled(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_set_log_level:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_set_log_level(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_get_log_level:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_get_log_level(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_order_by_child:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_order_by_child(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_order_by_key:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_order_by_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_order_by_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_order_by_value(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_order_by_priority:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_order_by_priority(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_start_at:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_start_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_start_at_key:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_start_at_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_end_at:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_end_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_end_at_key:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_end_at_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_equal_to:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_equal_to(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_equal_to_key:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_equal_to_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_limit_to_first:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_limit_to_first(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_limit_to_last:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_limit_to_last(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_get_reference:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_set_keep_synchronized:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_set_keep_synchronized(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_get_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_get_value(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_add_value_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_add_value_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_remove_value_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_remove_value_listener(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_remove_all_value_listeners:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_remove_all_value_listeners(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_add_child_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_add_child_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_remove_child_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_remove_child_listener(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_remove_all_child_listeners:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_remove_all_child_listeners(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_order_by_child:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_order_by_child(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_order_by_key:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_order_by_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_order_by_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_order_by_value(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_order_by_priority:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_order_by_priority(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_start_at:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_start_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_start_at_key:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_start_at_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_end_at:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_end_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_end_at_key:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_end_at_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_equal_to:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_equal_to(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_equal_to_key:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_equal_to_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_limit_to_first:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_limit_to_first(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_limit_to_last:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_limit_to_last(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_get_reference:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_set_keep_synchronized:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_set_keep_synchronized(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_get_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_get_value(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_add_value_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_add_value_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_remove_value_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_remove_value_listener(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_remove_all_value_listeners:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_remove_all_value_listeners(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_add_child_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_add_child_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_remove_child_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_remove_child_listener(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_remove_all_child_listeners:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_remove_all_child_listeners(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_release(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_database_ref_key:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_key(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_is_root:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_is_root(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_get_parent:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_get_parent(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_get_root:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_get_root(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_child:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_child(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_push:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_push(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_get_database:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_get_database(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_database_ref_get_url:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_get_url(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_go_online:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_go_online(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_go_offline:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_go_offline(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_set_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_set_value(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_set_priority:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_set_priority(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_set_value_and_priority:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_set_value_and_priority(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_update_children:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_update_children(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_remove_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_remove_value(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_run_transaction:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_run_transaction(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_exists:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_exists(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_child:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_child(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_has_child:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_has_child(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_has_children:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_has_children(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_children_count:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_children_count(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_get_children:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_get_children(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_database_snapshot_key:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_key(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_get_reference:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_get_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_get_value(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_get_priority:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_get_priority(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_get_instance:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_get_instance(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_get_instance_for_database:(char*)database_name arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_get_instance_for_database(database_name, __ret_buffer, __ret_buffer_length);
}
- (char*)__EXT_NATIVE__firestore_settings_get_host:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_settings_get_host(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_settings_set_host:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_settings_set_host(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_settings_get_ssl_enabled:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_settings_get_ssl_enabled(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_settings_set_ssl_enabled:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_settings_set_ssl_enabled(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_settings_get_persistence_enabled:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_settings_get_persistence_enabled(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_settings_set_persistence_enabled:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_settings_set_persistence_enabled(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_settings_get_cache_size_bytes:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_settings_get_cache_size_bytes(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_settings_set_cache_size_bytes:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_settings_set_cache_size_bytes(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_collection:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_collection(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_document:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_document(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_collection_group:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_collection_group(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_batch:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_batch(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_set_log_level:(double)level
{
    return __EXT_NATIVE__firestore_set_log_level(level);
}
- (double)__EXT_NATIVE__firestore_enable_network:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_enable_network(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_disable_network:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_disable_network(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_terminate:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_terminate(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_clear_persistence:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_clear_persistence(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_wait_for_pending_writes:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_wait_for_pending_writes(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_run_transaction:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_run_transaction(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firestore_collection_ref_id:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_collection_ref_id(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firestore_collection_ref_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_collection_ref_path(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_collection_ref_parent:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_collection_ref_parent(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_collection_ref_document:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_collection_ref_document(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_collection_ref_document_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_collection_ref_document_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_collection_ref_add:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_collection_ref_add(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_collection_ref_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_collection_ref_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_collection_ref_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_collection_ref_release(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firestore_document_ref_id:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_document_ref_id(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firestore_document_ref_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_document_ref_path(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_document_ref_parent:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_document_ref_parent(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_document_ref_collection:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_document_ref_collection(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_document_ref_get:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_document_ref_get(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_document_ref_set:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_document_ref_set(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_document_ref_set_merge:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_document_ref_set_merge(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_document_ref_set_merge_fields:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_document_ref_set_merge_fields(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_document_ref_update:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_document_ref_update(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_document_ref_delete:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_document_ref_delete(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_document_ref_add_snapshot_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_document_ref_add_snapshot_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_document_ref_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_document_ref_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_document_ref_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_document_ref_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_where_equal_to:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_where_equal_to(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_where_not_equal_to:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_where_not_equal_to(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_where_less_than:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_where_less_than(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_where_less_than_or_equal_to:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_where_less_than_or_equal_to(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_where_greater_than:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_where_greater_than(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_where_greater_than_or_equal_to:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_where_greater_than_or_equal_to(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_where_array_contains:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_where_array_contains(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_where_array_contains_any:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_where_array_contains_any(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_where_in:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_where_in(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_where_not_in:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_where_not_in(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_order_by:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_order_by(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_limit:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_limit(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_limit_to_last:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_limit_to_last(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_start_at_snapshot:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_start_at_snapshot(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_start_at_values:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_start_at_values(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_start_after_snapshot:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_start_after_snapshot(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_start_after_values:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_start_after_values(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_end_before_snapshot:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_end_before_snapshot(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_end_before_values:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_end_before_values(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_end_at_snapshot:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_end_at_snapshot(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_end_at_values:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_end_at_values(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_get:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_query_get(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_add_snapshot_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_add_snapshot_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_query_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_query_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_write_batch_set:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_write_batch_set(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_write_batch_set_merge:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_write_batch_set_merge(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_write_batch_set_merge_fields:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_write_batch_set_merge_fields(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_write_batch_update:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_write_batch_update(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_write_batch_delete:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_write_batch_delete(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_write_batch_commit:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_write_batch_commit(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_write_batch_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_write_batch_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_field_value_delete:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_field_value_delete(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_field_value_server_timestamp:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_field_value_server_timestamp(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_field_value_array_union:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_field_value_array_union(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_field_value_array_remove:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_field_value_array_remove(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_field_value_increment_integer:(double)value arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_field_value_increment_integer(value, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_field_value_increment_double:(double)value arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_field_value_increment_double(value, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_field_value_integer:(double)value arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_field_value_integer(value, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_field_value_double:(double)value arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_field_value_double(value, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_field_value_timestamp:(double)seconds arg1:(double)nanoseconds arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_field_value_timestamp(seconds, nanoseconds, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_field_value_geo_point:(double)latitude arg1:(double)longitude arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_field_value_geo_point(latitude, longitude, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_field_value_reference:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_field_value_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_field_value_blob:(char*)data arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_field_value_blob(data, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_field_value_null:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_field_value_null(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_field_value_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_field_value_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_document_snapshot_exists:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_document_snapshot_exists(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firestore_document_snapshot_id:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_document_snapshot_id(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_document_snapshot_reference:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_document_snapshot_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_document_snapshot_metadata_has_pending_writes:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_document_snapshot_metadata_has_pending_writes(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_document_snapshot_metadata_is_from_cache:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_document_snapshot_metadata_is_from_cache(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_document_snapshot_get:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_document_snapshot_get(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_document_snapshot_get_data:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_document_snapshot_get_data(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_document_snapshot_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_document_snapshot_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_snapshot_size:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_query_snapshot_size(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_snapshot_empty:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_query_snapshot_empty(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_snapshot_metadata_has_pending_writes:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_query_snapshot_metadata_has_pending_writes(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_snapshot_metadata_is_from_cache:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_query_snapshot_metadata_is_from_cache(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_snapshot_documents:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_snapshot_documents(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_snapshot_document_changes:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firestore_query_snapshot_document_changes(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firestore_query_snapshot_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_query_snapshot_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firestore_listener_registration_remove:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firestore_listener_registration_remove(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_get_instance:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__storage_get_instance(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__storage_get_instance_with_url:(char*)url arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length
{
    return __EXT_NATIVE__storage_get_instance_with_url(url, __ret_buffer, __ret_buffer_length);
}
- (char*)__EXT_NATIVE__storage_url:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_url(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_get_reference:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__storage_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__storage_get_reference_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__storage_get_reference_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__storage_get_reference_from_url:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__storage_get_reference_from_url(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__storage_max_download_retry_time:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_max_download_retry_time(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_set_max_download_retry_time:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_set_max_download_retry_time(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_max_upload_retry_time:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_max_upload_retry_time(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_set_max_upload_retry_time:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_set_max_upload_retry_time(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_max_operation_retry_time:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_max_operation_retry_time(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_set_max_operation_retry_time:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_set_max_operation_retry_time(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_use_emulator:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_use_emulator(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_ref_child:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__storage_ref_child(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__storage_ref_get_parent:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__storage_ref_get_parent(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (char*)__EXT_NATIVE__storage_ref_bucket:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_ref_bucket(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__storage_ref_full_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_ref_full_path(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__storage_ref_name:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_ref_name(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_ref_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_ref_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_ref_storage:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__storage_ref_storage(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__storage_ref_delete:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_ref_delete(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_ref_get_download_url:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_ref_get_download_url(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_ref_get_metadata:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_ref_get_metadata(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_ref_update_metadata:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_ref_update_metadata(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_ref_put_bytes:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_ref_put_bytes(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_ref_put_file:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_ref_put_file(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_ref_get_bytes:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_ref_get_bytes(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_ref_get_file:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_ref_get_file(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_ref_list:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_ref_list(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_metadata_create:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__storage_metadata_create(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__storage_metadata_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_metadata_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_is_valid(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__storage_metadata_bucket:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_bucket(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__storage_metadata_cache_control:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_cache_control(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_metadata_set_cache_control:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_set_cache_control(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__storage_metadata_content_disposition:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_content_disposition(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_metadata_set_content_disposition:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_set_content_disposition(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__storage_metadata_content_encoding:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_content_encoding(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_metadata_set_content_encoding:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_set_content_encoding(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__storage_metadata_content_language:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_content_language(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_metadata_set_content_language:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_set_content_language(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__storage_metadata_content_type:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_content_type(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_metadata_set_content_type:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_set_content_type(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_metadata_creation_time:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_creation_time(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_metadata_generation:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_generation(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_metadata_metadata_generation:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_metadata_generation(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__storage_metadata_name:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_name(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__storage_metadata_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_path(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_metadata_get_reference:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__storage_metadata_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__storage_metadata_size_bytes:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_size_bytes(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_metadata_updated_time:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_updated_time(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_metadata_custom_metadata_count:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_custom_metadata_count(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__storage_metadata_custom_metadata_key_at:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_custom_metadata_key_at(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__storage_metadata_get_custom_metadata:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_get_custom_metadata(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_metadata_set_custom_metadata:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_metadata_set_custom_metadata(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_controller_create:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__storage_controller_create(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__storage_controller_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_controller_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_controller_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_controller_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_controller_pause:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_controller_pause(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_controller_resume:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_controller_resume(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_controller_cancel:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_controller_cancel(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_controller_is_paused:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_controller_is_paused(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_controller_bytes_transferred:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_controller_bytes_transferred(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_controller_total_byte_count:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_controller_total_byte_count(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_controller_get_reference:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__storage_controller_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__storage_list_result_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_list_result_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_list_result_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_list_result_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_list_result_item_count:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_list_result_item_count(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_list_result_item_at:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__storage_list_result_item_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__storage_list_result_prefix_count:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_list_result_prefix_count(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__storage_list_result_prefix_at:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__storage_list_result_prefix_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (char*)__EXT_NATIVE__storage_list_result_next_page_token:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__storage_list_result_next_page_token(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__functions_get_instance:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__functions_get_instance(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__functions_get_instance_with_region:(char*)region arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length
{
    return __EXT_NATIVE__functions_get_instance_with_region(region, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__functions_use_functions_emulator:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__functions_use_functions_emulator(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__functions_get_https_callable:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__functions_get_https_callable(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__functions_get_https_callable_with_options:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__functions_get_https_callable_with_options(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__functions_get_https_callable_from_url:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__functions_get_https_callable_from_url(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__functions_get_https_callable_from_url_with_options:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__functions_get_https_callable_from_url_with_options(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__functions_callable_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__functions_callable_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__functions_callable_call:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__functions_callable_call(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__functions_callable_call_with_data:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__functions_callable_call_with_data(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__remote_config_get_instance:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__remote_config_get_instance(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__remote_config_ensure_initialized:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__remote_config_ensure_initialized(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__remote_config_set_config_settings:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__remote_config_set_config_settings(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__remote_config_get_config_settings_fetch_timeout:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__remote_config_get_config_settings_fetch_timeout(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__remote_config_get_config_settings_minimum_fetch_interval:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__remote_config_get_config_settings_minimum_fetch_interval(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__remote_config_fetch:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__remote_config_fetch(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__remote_config_fetch_with_expiration:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__remote_config_fetch_with_expiration(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__remote_config_fetch_and_activate:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__remote_config_fetch_and_activate(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__remote_config_activate:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__remote_config_activate(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__remote_config_get_boolean:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__remote_config_get_boolean(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__remote_config_get_long:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__remote_config_get_long(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__remote_config_get_double:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__remote_config_get_double(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__remote_config_get_string:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__remote_config_get_string(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__remote_config_get_data_size:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__remote_config_get_data_size(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__remote_config_get_data:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__remote_config_get_data(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__remote_config_get_keys_by_prefix:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__remote_config_get_keys_by_prefix(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__remote_config_get_keys:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__remote_config_get_keys(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__remote_config_get_all:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__remote_config_get_all(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__remote_config_set_defaults:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__remote_config_set_defaults(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__remote_config_get_info:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__remote_config_get_info(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__remote_config_add_config_update_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__remote_config_add_config_update_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__remote_config_remove_config_update_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__remote_config_remove_config_update_listener(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__messaging_initialize
{
    return __EXT_NATIVE__messaging_initialize();
}
- (double)__EXT_NATIVE__messaging_terminate
{
    return __EXT_NATIVE__messaging_terminate();
}
- (double)__EXT_NATIVE__messaging_set_token_registration_on_init_enabled:(double)enabled
{
    return __EXT_NATIVE__messaging_set_token_registration_on_init_enabled(enabled);
}
- (double)__EXT_NATIVE__messaging_is_token_registration_on_init_enabled
{
    return __EXT_NATIVE__messaging_is_token_registration_on_init_enabled();
}
- (double)__EXT_NATIVE__messaging_delivery_metrics_export_to_big_query_enabled
{
    return __EXT_NATIVE__messaging_delivery_metrics_export_to_big_query_enabled();
}
- (double)__EXT_NATIVE__messaging_set_delivery_metrics_export_to_big_query:(double)enabled
{
    return __EXT_NATIVE__messaging_set_delivery_metrics_export_to_big_query(enabled);
}
- (double)__EXT_NATIVE__messaging_request_permission:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__messaging_request_permission(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__messaging_get_token:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__messaging_get_token(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__messaging_delete_token:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__messaging_delete_token(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__messaging_subscribe:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__messaging_subscribe(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__messaging_unsubscribe:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__messaging_unsubscribe(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__messaging_poll_message
{
    return __EXT_NATIVE__messaging_poll_message();
}
- (double)__EXT_NATIVE__messaging_poll_token
{
    return __EXT_NATIVE__messaging_poll_token();
}
- (char*)__EXT_NATIVE__messaging_current_token
{
    return __EXT_NATIVE__messaging_current_token();
}
- (char*)__EXT_NATIVE__messaging_message_from
{
    return __EXT_NATIVE__messaging_message_from();
}
- (char*)__EXT_NATIVE__messaging_message_to
{
    return __EXT_NATIVE__messaging_message_to();
}
- (char*)__EXT_NATIVE__messaging_message_collapse_key
{
    return __EXT_NATIVE__messaging_message_collapse_key();
}
- (char*)__EXT_NATIVE__messaging_message_message_id
{
    return __EXT_NATIVE__messaging_message_message_id();
}
- (char*)__EXT_NATIVE__messaging_message_message_type
{
    return __EXT_NATIVE__messaging_message_message_type();
}
- (char*)__EXT_NATIVE__messaging_message_priority
{
    return __EXT_NATIVE__messaging_message_priority();
}
- (char*)__EXT_NATIVE__messaging_message_original_priority
{
    return __EXT_NATIVE__messaging_message_original_priority();
}
- (double)__EXT_NATIVE__messaging_message_time_to_live
{
    return __EXT_NATIVE__messaging_message_time_to_live();
}
- (double)__EXT_NATIVE__messaging_message_sent_time
{
    return __EXT_NATIVE__messaging_message_sent_time();
}
- (char*)__EXT_NATIVE__messaging_message_error
{
    return __EXT_NATIVE__messaging_message_error();
}
- (char*)__EXT_NATIVE__messaging_message_error_description
{
    return __EXT_NATIVE__messaging_message_error_description();
}
- (char*)__EXT_NATIVE__messaging_message_link
{
    return __EXT_NATIVE__messaging_message_link();
}
- (double)__EXT_NATIVE__messaging_message_notification_opened
{
    return __EXT_NATIVE__messaging_message_notification_opened();
}
- (double)__EXT_NATIVE__messaging_message_data_count
{
    return __EXT_NATIVE__messaging_message_data_count();
}
- (char*)__EXT_NATIVE__messaging_message_data_key_at:(double)index
{
    return __EXT_NATIVE__messaging_message_data_key_at(index);
}
- (char*)__EXT_NATIVE__messaging_message_get_data:(char*)key
{
    return __EXT_NATIVE__messaging_message_get_data(key);
}
- (double)__EXT_NATIVE__messaging_message_raw_data_size
{
    return __EXT_NATIVE__messaging_message_raw_data_size();
}
- (double)__EXT_NATIVE__messaging_message_raw_data_copy:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__messaging_message_raw_data_copy(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__messaging_message_has_notification
{
    return __EXT_NATIVE__messaging_message_has_notification();
}
- (char*)__EXT_NATIVE__messaging_message_notification_title
{
    return __EXT_NATIVE__messaging_message_notification_title();
}
- (char*)__EXT_NATIVE__messaging_message_notification_body
{
    return __EXT_NATIVE__messaging_message_notification_body();
}
- (char*)__EXT_NATIVE__messaging_message_notification_icon
{
    return __EXT_NATIVE__messaging_message_notification_icon();
}
- (char*)__EXT_NATIVE__messaging_message_notification_sound
{
    return __EXT_NATIVE__messaging_message_notification_sound();
}
- (char*)__EXT_NATIVE__messaging_message_notification_badge
{
    return __EXT_NATIVE__messaging_message_notification_badge();
}
- (char*)__EXT_NATIVE__messaging_message_notification_tag
{
    return __EXT_NATIVE__messaging_message_notification_tag();
}
- (char*)__EXT_NATIVE__messaging_message_notification_color
{
    return __EXT_NATIVE__messaging_message_notification_color();
}
- (char*)__EXT_NATIVE__messaging_message_notification_click_action
{
    return __EXT_NATIVE__messaging_message_notification_click_action();
}
- (char*)__EXT_NATIVE__messaging_message_notification_body_loc_key
{
    return __EXT_NATIVE__messaging_message_notification_body_loc_key();
}
- (double)__EXT_NATIVE__messaging_message_notification_body_loc_args_count
{
    return __EXT_NATIVE__messaging_message_notification_body_loc_args_count();
}
- (char*)__EXT_NATIVE__messaging_message_notification_body_loc_args_at:(double)index
{
    return __EXT_NATIVE__messaging_message_notification_body_loc_args_at(index);
}
- (char*)__EXT_NATIVE__messaging_message_notification_title_loc_key
{
    return __EXT_NATIVE__messaging_message_notification_title_loc_key();
}
- (double)__EXT_NATIVE__messaging_message_notification_title_loc_args_count
{
    return __EXT_NATIVE__messaging_message_notification_title_loc_args_count();
}
- (char*)__EXT_NATIVE__messaging_message_notification_title_loc_args_at:(double)index
{
    return __EXT_NATIVE__messaging_message_notification_title_loc_args_at(index);
}
- (char*)__EXT_NATIVE__messaging_message_notification_android_channel_id
{
    return __EXT_NATIVE__messaging_message_notification_android_channel_id();
}
- (double)__EXT_NATIVE__ump_get_instance:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__ump_get_instance(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__ump_get_consent_status:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__ump_get_consent_status(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__ump_get_consent_form_status:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__ump_get_consent_form_status(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__ump_get_privacy_options_requirement_status:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__ump_get_privacy_options_requirement_status(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__ump_can_request_ads:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__ump_can_request_ads(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__ump_reset:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__ump_reset(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__ump_request_consent_info_update:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__ump_request_consent_info_update(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__ump_load_consent_form:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__ump_load_consent_form(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__ump_show_consent_form:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__ump_show_consent_form(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__ump_load_and_show_consent_form_if_required:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__ump_load_and_show_consent_form_if_required(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__ump_show_privacy_options_form:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__ump_show_privacy_options_form(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__GMFirebase_invocation_handler:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__GMFirebase_invocation_handler(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__GMFirebase_queue_buffer:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__GMFirebase_queue_buffer(__arg_buffer, __arg_buffer_length);
}
@end

