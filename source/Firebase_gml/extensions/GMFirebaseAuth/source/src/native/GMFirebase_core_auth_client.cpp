#include "GMFirebase_core_auth_client.h"

#include <mutex>

#if defined(_WIN32)
    #define WIN32_LEAN_AND_MEAN
    #define NOMINMAX
    #include <windows.h>
#elif defined(__APPLE__)
    #include <TargetConditionals.h>
    #if !TARGET_OS_IPHONE && !TARGET_OS_TV
        #include <dlfcn.h>
    #endif
#else
    #include <dlfcn.h>
#endif

namespace
{
    using GetAuthApiFn = const GMFirebaseCoreAuthAPI* (*)();

    std::mutex g_core_auth_api_mutex;
    const GMFirebaseCoreAuthAPI* g_core_auth_api = nullptr;

    const GMFirebaseCoreAuthAPI* validate(const GMFirebaseCoreAuthAPI* api)
    {
        if (api == nullptr)
            return nullptr;
        if (api->abi_version != GMFIREBASE_CORE_AUTH_ABI_VERSION)
            return nullptr;
        if (api->struct_size < sizeof(GMFirebaseCoreAuthAPI))
            return nullptr;

        if (api->get_auth == nullptr || api->language_code == nullptr ||
            api->set_language_code == nullptr || api->use_app_language == nullptr ||
            api->use_emulator == nullptr || api->current_user == nullptr ||
            api->sign_out == nullptr || api->fetch_providers_for_email == nullptr ||
            api->sign_in_with_custom_token == nullptr || api->sign_in_with_credential == nullptr ||
            api->sign_in_and_retrieve_data_with_credential == nullptr || api->sign_in_anonymously == nullptr ||
            api->sign_in_with_email_and_password == nullptr || api->create_user_with_email_and_password == nullptr ||
            api->send_password_reset_email == nullptr || api->add_state_listener == nullptr ||
            api->remove_state_listener == nullptr || api->add_id_token_listener == nullptr ||
            api->remove_id_token_listener == nullptr || api->credential_provider == nullptr ||
            api->credential_is_valid == nullptr || api->credential_release == nullptr ||
            api->email_auth_provider_get_credential == nullptr || api->facebook_auth_provider_get_credential == nullptr ||
            api->game_center_auth_provider_get_credential == nullptr || api->game_center_auth_provider_is_player_authenticated == nullptr ||
            api->github_auth_provider_get_credential == nullptr || api->google_auth_provider_get_credential == nullptr ||
            api->oauth_provider_get_credential == nullptr || api->oauth_provider_get_credential_with_nonce == nullptr ||
            api->play_games_auth_provider_get_credential == nullptr || api->twitter_auth_provider_get_credential == nullptr ||
            api->phone_verify_phone_number == nullptr || api->phone_get_credential == nullptr ||
            api->phone_credential_sms_code == nullptr || api->phone_resending_token_release == nullptr ||
            api->phone_listener_release == nullptr || api->user_get_info == nullptr ||
            api->user_release == nullptr || api->user_is_valid == nullptr ||
            api->user_uid == nullptr || api->user_email == nullptr ||
            api->user_display_name == nullptr || api->user_photo_url == nullptr ||
            api->user_provider_id == nullptr || api->user_phone_number == nullptr ||
            api->user_is_email_verified == nullptr || api->user_is_anonymous == nullptr ||
            api->user_creation_timestamp == nullptr || api->user_last_sign_in_timestamp == nullptr ||
            api->user_get_token == nullptr || api->user_update_password == nullptr ||
            api->user_update_profile == nullptr || api->user_send_email_verification == nullptr ||
            api->user_send_email_verification_before_updating_email == nullptr || api->user_reauthenticate == nullptr ||
            api->user_reauthenticate_and_retrieve_data == nullptr || api->user_link_with_credential == nullptr ||
            api->user_unlink == nullptr || api->user_reload == nullptr ||
            api->user_delete == nullptr || api->federated_oauth_provider_create == nullptr ||
            api->federated_oauth_provider_set_data == nullptr || api->federated_oauth_provider_release == nullptr ||
            api->sign_in_with_provider == nullptr || api->sign_in_with_custom_token_result == nullptr ||
            api->sign_in_and_retrieve_data_with_credential_result == nullptr || api->sign_in_anonymously_result == nullptr ||
            api->sign_in_with_email_and_password_result == nullptr || api->create_user_with_email_and_password_result == nullptr ||
            api->user_provider_data_count == nullptr || api->user_provider_data_at == nullptr ||
            api->user_reauthenticate_with_provider == nullptr || api->user_link_with_provider == nullptr ||
            api->user_reauthenticate_and_retrieve_data_result == nullptr || api->user_link_with_credential_result == nullptr ||
            api->user_update_phone_number_credential == nullptr || api->get_app == nullptr ||
            api->get_current_instance_handle == nullptr || api->get_instance_for_app == nullptr ||
            api->use_instance == nullptr || api->instance_get_app == nullptr ||
            api->email_auth_provider_id == nullptr || api->facebook_auth_provider_id == nullptr ||
            api->game_center_auth_provider_id == nullptr || api->github_auth_provider_id == nullptr ||
            api->google_auth_provider_id == nullptr || api->microsoft_auth_provider_id == nullptr ||
            api->play_games_auth_provider_id == nullptr || api->twitter_auth_provider_id == nullptr ||
            api->yahoo_auth_provider_id == nullptr || api->game_center_auth_provider_get_credential_last_result == nullptr)
            return nullptr;

        return api;
    }

    const GMFirebaseCoreAuthAPI* tryLoadCoreAuthAPI()
    {
#if defined(__APPLE__) && (TARGET_OS_IPHONE || TARGET_OS_TV)
        // Split iOS/tvOS extensions are static archives in the final GameMaker
        // Xcode target, so the linker resolves this symbol from GMFirebaseCore.
        return validate(gmfirebase_core_get_auth_api());

#elif defined(_WIN32)
        HMODULE module = GetModuleHandleA("GMFirebaseCore.dll");
        if (module == nullptr)
            module = LoadLibraryA("GMFirebaseCore.dll");
        if (module == nullptr)
            return nullptr;

        auto getter = reinterpret_cast<GetAuthApiFn>(
            GetProcAddress(module, "gmfirebase_core_get_auth_api"));
        return getter != nullptr ? validate(getter()) : nullptr;

#else
        // First try the process-wide symbol table in case GameMaker already
        // loaded Core. If not, explicitly load the sibling native library.
        auto getter = reinterpret_cast<GetAuthApiFn>(
            dlsym(RTLD_DEFAULT, "gmfirebase_core_get_auth_api"));
        if (getter != nullptr)
            return validate(getter());

        const char* candidates[] = {
#if defined(__APPLE__)
            "libGMFirebaseCore.dylib",
            "GMFirebaseCore.dylib",
#else
            "libGMFirebaseCore.so",
            "GMFirebaseCore.so",
#endif
        };

        for (const char* candidate : candidates)
        {
            void* module = dlopen(candidate, RTLD_NOW | RTLD_GLOBAL);
            if (module == nullptr)
                continue;
            getter = reinterpret_cast<GetAuthApiFn>(
                dlsym(module, "gmfirebase_core_get_auth_api"));
            if (getter != nullptr)
                return validate(getter());
        }
        return nullptr;
#endif
    }
}

const GMFirebaseCoreAuthAPI* gmfirebaseGetCoreAuthAPI()
{
    if (g_core_auth_api != nullptr)
        return g_core_auth_api;

    std::lock_guard<std::mutex> lock(g_core_auth_api_mutex);
    if (g_core_auth_api == nullptr)
        g_core_auth_api = tryLoadCoreAuthAPI();
    return g_core_auth_api;
}

bool gmfirebaseCoreAuthAvailable()
{
    return gmfirebaseGetCoreAuthAPI() != nullptr;
}
