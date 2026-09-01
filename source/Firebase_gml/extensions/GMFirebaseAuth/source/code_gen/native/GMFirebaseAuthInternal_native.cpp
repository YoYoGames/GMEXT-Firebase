// ##### extgen :: Auto-generated file do not edit!! #####

#include "GMFirebaseAuthInternal_native.h"
#include "GMFirebaseAuthInternal_exports.h"

using namespace gm_structs;
using namespace gm::wire::codec;

static gm::runtime::DispatchQueue __dispatch_queue;

// Internal function used for fetching dispatched function calls to GML
GMEXPORT double __EXT_NATIVE__GMFirebaseAuth_invocation_handler(char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferWriter __bw{ __ret_buffer, static_cast<size_t>(__ret_buffer_length) };
    return __dispatch_queue.fetch(__bw);
}

GMEXPORT double __EXT_NATIVE__firebase_auth_get_auth()
{
    auto&& __result = firebase_auth_get_auth();
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_language_code()
{
    static std::string __result;
    __result = firebase_auth_language_code();
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_auth_set_language_code(char* language_code)
{
    firebase_auth_set_language_code(language_code);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_use_app_language()
{
    firebase_auth_use_app_language();
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_use_emulator(char* host, double port)
{
    firebase_auth_use_emulator(host, static_cast<double>(port));
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_current_user(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_auth_current_user();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: optional<UInt64>
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_out()
{
    firebase_auth_sign_out();
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_fetch_providers_for_email(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: email, type: String
    std::string_view email = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_fetch_providers_for_email(email, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_in_with_custom_token(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: custom_token, type: String
    std::string_view custom_token = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_sign_in_with_custom_token(custom_token, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_in_with_credential(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: credential_ref, type: UInt64
    std::uint64_t credential_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_sign_in_with_credential(credential_ref, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_in_and_retrieve_data_with_credential(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: credential_ref, type: UInt64
    std::uint64_t credential_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_sign_in_and_retrieve_data_with_credential(credential_ref, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_in_anonymously(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_sign_in_anonymously(callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_in_with_email_and_password(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: email, type: String
    std::string_view email = gm::wire::codec::readValue<std::string_view>(__br);

    // field: password, type: String
    std::string_view password = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_sign_in_with_email_and_password(email, password, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_create_user_with_email_and_password(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: email, type: String
    std::string_view email = gm::wire::codec::readValue<std::string_view>(__br);

    // field: password, type: String
    std::string_view password = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_create_user_with_email_and_password(email, password, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_send_password_reset_email(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: email, type: String
    std::string_view email = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_send_password_reset_email(email, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_add_state_listener(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    auto&& __result = firebase_auth_add_state_listener(callback);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: optional<UInt64>
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_remove_state_listener(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: listener_ref, type: UInt64
    std::uint64_t listener_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_auth_remove_state_listener(listener_ref);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_add_id_token_listener(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    auto&& __result = firebase_auth_add_id_token_listener(callback);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: optional<UInt64>
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_remove_id_token_listener(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: listener_ref, type: UInt64
    std::uint64_t listener_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_auth_remove_id_token_listener(listener_ref);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_credential_provider(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: credential_ref, type: UInt64
    std::uint64_t credential_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_auth_credential_provider(credential_ref);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_auth_credential_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: credential_ref, type: UInt64
    std::uint64_t credential_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_credential_is_valid(credential_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_auth_credential_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: credential_ref, type: UInt64
    std::uint64_t credential_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_auth_credential_release(credential_ref);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_email_auth_provider_get_credential(char* email, char* password, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_auth_email_auth_provider_get_credential(email, password);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_facebook_auth_provider_get_credential(char* access_token, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_auth_facebook_auth_provider_get_credential(access_token);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_game_center_auth_provider_get_credential(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_game_center_auth_provider_get_credential(callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_game_center_auth_provider_is_player_authenticated()
{
    auto&& __result = firebase_auth_game_center_auth_provider_is_player_authenticated();
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_auth_github_auth_provider_get_credential(char* token, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_auth_github_auth_provider_get_credential(token);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_google_auth_provider_get_credential(char* id_token, char* access_token, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_auth_google_auth_provider_get_credential(id_token, access_token);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_oauth_provider_get_credential(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: provider_id, type: String
    std::string_view provider_id = gm::wire::codec::readValue<std::string_view>(__br);

    // field: id_token, type: String
    std::string_view id_token = gm::wire::codec::readValue<std::string_view>(__br);

    // field: access_token, type: String
    std::string_view access_token = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_auth_oauth_provider_get_credential(provider_id, id_token, access_token);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_oauth_provider_get_credential_with_nonce(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: provider_id, type: String
    std::string_view provider_id = gm::wire::codec::readValue<std::string_view>(__br);

    // field: id_token, type: String
    std::string_view id_token = gm::wire::codec::readValue<std::string_view>(__br);

    // field: raw_nonce, type: String
    std::string_view raw_nonce = gm::wire::codec::readValue<std::string_view>(__br);

    // field: access_token, type: String
    std::string_view access_token = gm::wire::codec::readValue<std::string_view>(__br);

    auto&& __result = firebase_auth_oauth_provider_get_credential_with_nonce(provider_id, id_token, raw_nonce, access_token);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_play_games_auth_provider_get_credential(char* server_auth_code, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_auth_play_games_auth_provider_get_credential(server_auth_code);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_twitter_auth_provider_get_credential(char* token, char* secret, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_auth_twitter_auth_provider_get_credential(token, secret);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_phone_verify_phone_number(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: phone_number, type: String
    std::string_view phone_number = gm::wire::codec::readValue<std::string_view>(__br);

    // field: timeout_ms, type: Float64
    double timeout_ms = gm::wire::codec::readValue<double>(__br);

    // field: force_resending_token, type: UInt64
    std::uint64_t force_resending_token = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: on_verification_completed, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_verification_completed = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_verification_completed = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    // field: on_verification_failed, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_verification_failed = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_verification_failed = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    // field: on_code_sent, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_code_sent = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_code_sent = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    // field: on_timeout, type: optional<Function>
    std::optional<gm::wire::GMFunction> on_timeout = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        on_timeout = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    auto&& __result = firebase_auth_phone_verify_phone_number(phone_number, timeout_ms, force_resending_token, on_verification_completed, on_verification_failed, on_code_sent, on_timeout);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_phone_get_credential(char* verification_id, char* verification_code, char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_auth_phone_get_credential(verification_id, verification_code);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_phone_credential_sms_code(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: credential, type: UInt64
    std::uint64_t credential = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_auth_phone_credential_sms_code(credential);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_auth_phone_resending_token_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: token, type: UInt64
    std::uint64_t token = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_auth_phone_resending_token_release(token);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_phone_listener_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: listener, type: UInt64
    std::uint64_t listener = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_auth_phone_listener_release(listener);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_get_info(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user, type: UInt64
    std::uint64_t user = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_user_get_info(user);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: struct FirebaseAuthUserInfo
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_auth_user_release(user_ref);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_is_valid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_user_is_valid(user_ref);
    return static_cast<double>(__result);
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_user_uid(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_auth_user_uid(user_ref);
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_user_email(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_auth_user_email(user_ref);
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_user_display_name(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_auth_user_display_name(user_ref);
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_user_photo_url(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_auth_user_photo_url(user_ref);
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_user_provider_id(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_auth_user_provider_id(user_ref);
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_user_phone_number(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    static std::string __result;
    __result = firebase_auth_user_phone_number(user_ref);
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_is_email_verified(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_user_is_email_verified(user_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_is_anonymous(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_user_is_anonymous(user_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_creation_timestamp(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_user_creation_timestamp(user_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_last_sign_in_timestamp(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_user_last_sign_in_timestamp(user_ref);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_get_token(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: force_refresh, type: Bool
    bool force_refresh = gm::wire::codec::readValue<bool>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_get_token(user_ref, force_refresh, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_update_password(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: password, type: String
    std::string_view password = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_update_password(user_ref, password, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_update_profile(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: display_name, type: String
    std::string_view display_name = gm::wire::codec::readValue<std::string_view>(__br);

    // field: photo_url, type: String
    std::string_view photo_url = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_update_profile(user_ref, display_name, photo_url, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_send_email_verification(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_send_email_verification(user_ref, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_send_email_verification_before_updating_email(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: new_email, type: String
    std::string_view new_email = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_send_email_verification_before_updating_email(user_ref, new_email, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_reauthenticate(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: credential_ref, type: UInt64
    std::uint64_t credential_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_reauthenticate(user_ref, credential_ref, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_reauthenticate_and_retrieve_data(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: credential_ref, type: UInt64
    std::uint64_t credential_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_reauthenticate_and_retrieve_data(user_ref, credential_ref, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_link_with_credential(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: credential_ref, type: UInt64
    std::uint64_t credential_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_link_with_credential(user_ref, credential_ref, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_unlink(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: provider_id, type: String
    std::string_view provider_id = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_unlink(user_ref, provider_id, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_reload(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_reload(user_ref, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_delete(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user_ref, type: UInt64
    std::uint64_t user_ref = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_delete(user_ref, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_federated_oauth_provider_create(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: provider_id, type: String
    std::string_view provider_id = gm::wire::codec::readValue<std::string_view>(__br);

    // field: scopes, type: Any
    gm::wire::GMValue scopes = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: custom_parameters, type: Any
    gm::wire::GMValue custom_parameters = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    auto&& __result = firebase_auth_federated_oauth_provider_create(provider_id, scopes, custom_parameters);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_federated_oauth_provider_set_data(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: provider, type: UInt64
    std::uint64_t provider = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: provider_id, type: String
    std::string_view provider_id = gm::wire::codec::readValue<std::string_view>(__br);

    // field: scopes, type: Any
    gm::wire::GMValue scopes = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    // field: custom_parameters, type: Any
    gm::wire::GMValue custom_parameters = gm::wire::codec::readValue<gm::wire::GMValue>(__br);

    firebase_auth_federated_oauth_provider_set_data(provider, provider_id, scopes, custom_parameters);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_federated_oauth_provider_release(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: provider, type: UInt64
    std::uint64_t provider = gm::wire::codec::readValue<std::uint64_t>(__br);

    firebase_auth_federated_oauth_provider_release(provider);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_in_with_provider(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: provider, type: UInt64
    std::uint64_t provider = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_sign_in_with_provider(provider, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_in_with_custom_token_result(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: custom_token, type: String
    std::string_view custom_token = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_sign_in_with_custom_token_result(custom_token, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_in_and_retrieve_data_with_credential_result(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: credential, type: UInt64
    std::uint64_t credential = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_sign_in_and_retrieve_data_with_credential_result(credential, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_in_anonymously_result(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_sign_in_anonymously_result(callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_sign_in_with_email_and_password_result(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: email, type: String
    std::string_view email = gm::wire::codec::readValue<std::string_view>(__br);

    // field: password, type: String
    std::string_view password = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_sign_in_with_email_and_password_result(email, password, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_create_user_with_email_and_password_result(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: email, type: String
    std::string_view email = gm::wire::codec::readValue<std::string_view>(__br);

    // field: password, type: String
    std::string_view password = gm::wire::codec::readValue<std::string_view>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_create_user_with_email_and_password_result(email, password, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_provider_data_count(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user, type: UInt64
    std::uint64_t user = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_user_provider_data_count(user);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_provider_data_at(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user, type: UInt64
    std::uint64_t user = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: index, type: Float64
    double index = gm::wire::codec::readValue<double>(__br);

    auto&& __result = firebase_auth_user_provider_data_at(user, index);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: Any
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_reauthenticate_with_provider(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user, type: UInt64
    std::uint64_t user = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: provider, type: UInt64
    std::uint64_t provider = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_reauthenticate_with_provider(user, provider, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_link_with_provider(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user, type: UInt64
    std::uint64_t user = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: provider, type: UInt64
    std::uint64_t provider = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_link_with_provider(user, provider, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_reauthenticate_and_retrieve_data_result(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user, type: UInt64
    std::uint64_t user = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: credential, type: UInt64
    std::uint64_t credential = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_reauthenticate_and_retrieve_data_result(user, credential, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_link_with_credential_result(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user, type: UInt64
    std::uint64_t user = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: credential, type: UInt64
    std::uint64_t credential = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_link_with_credential_result(user, credential, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_user_update_phone_number_credential(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: user, type: UInt64
    std::uint64_t user = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: phone_credential, type: UInt64
    std::uint64_t phone_credential = gm::wire::codec::readValue<std::uint64_t>(__br);

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_user_update_phone_number_credential(user, phone_credential, callback);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_get_app(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_auth_get_app();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_get_current_instance_handle(char* __ret_buffer, double __ret_buffer_length)
{
    auto&& __result = firebase_auth_get_current_instance_handle();
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_get_instance_for_app(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: app, type: UInt64
    std::uint64_t app = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_get_instance_for_app(app);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT double __EXT_NATIVE__firebase_auth_use_instance(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: auth, type: UInt64
    std::uint64_t auth = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_use_instance(auth);
    return static_cast<double>(__result);
}

GMEXPORT double __EXT_NATIVE__firebase_auth_instance_get_app(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: auth, type: UInt64
    std::uint64_t auth = gm::wire::codec::readValue<std::uint64_t>(__br);

    auto&& __result = firebase_auth_instance_get_app(auth);
    gm::byteio::BufferWriter __bw{__ret_buffer, static_cast<size_t>(__ret_buffer_length)};

    // return: __result, type: UInt64
    gm::wire::codec::writeValue(__bw, __result);
    return 0;
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_email_auth_provider_id()
{
    static std::string __result;
    __result = firebase_auth_email_auth_provider_id();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_facebook_auth_provider_id()
{
    static std::string __result;
    __result = firebase_auth_facebook_auth_provider_id();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_game_center_auth_provider_id()
{
    static std::string __result;
    __result = firebase_auth_game_center_auth_provider_id();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_github_auth_provider_id()
{
    static std::string __result;
    __result = firebase_auth_github_auth_provider_id();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_google_auth_provider_id()
{
    static std::string __result;
    __result = firebase_auth_google_auth_provider_id();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_microsoft_auth_provider_id()
{
    static std::string __result;
    __result = firebase_auth_microsoft_auth_provider_id();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_play_games_auth_provider_id()
{
    static std::string __result;
    __result = firebase_auth_play_games_auth_provider_id();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_twitter_auth_provider_id()
{
    static std::string __result;
    __result = firebase_auth_twitter_auth_provider_id();
    return (char*)__result.c_str();
}

GMEXPORT char* __EXT_NATIVE__firebase_auth_yahoo_auth_provider_id()
{
    static std::string __result;
    __result = firebase_auth_yahoo_auth_provider_id();
    return (char*)__result.c_str();
}

GMEXPORT double __EXT_NATIVE__firebase_auth_game_center_auth_provider_get_credential_last_result(char* __arg_buffer, double __arg_buffer_length)
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: optional<Function>
    std::optional<gm::wire::GMFunction> callback = std::nullopt;
    if (gm::wire::codec::readValue<bool>(__br))
    {
        callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);
    }

    firebase_auth_game_center_auth_provider_get_credential_last_result(callback);
    return 0;
}

