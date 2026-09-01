// ##### extgen :: Auto-generated file do not edit!! #####

#pragma once
#include <cstdint>
#include <string_view>
#include <vector>
#include <array>
#include <optional>
#include "core/GMExtWire.h"

namespace gm_consts
{
}


namespace gm_enums
{
    enum class FirebaseAuthError : std::int64_t
    {
        None = 0,
        Unimplemented = -1,
        Failure = 1,
        InvalidCustomToken = 2,
        CustomTokenMismatch = 3,
        InvalidCredential = 4,
        UserDisabled = 5,
        AccountExistsWithDifferentCredentials = 6,
        OperationNotAllowed = 7,
        EmailAlreadyInUse = 8,
        RequiresRecentLogin = 9,
        CredentialAlreadyInUse = 10,
        InvalidEmail = 11,
        WrongPassword = 12,
        TooManyRequests = 13,
        UserNotFound = 14,
        ProviderAlreadyLinked = 15,
        NoSuchProvider = 16,
        InvalidUserToken = 17,
        UserTokenExpired = 18,
        NetworkRequestFailed = 19,
        InvalidApiKey = 20,
        AppNotAuthorized = 21,
        UserMismatch = 22,
        WeakPassword = 23,
        NoSignedInUser = 24,
        ApiNotAvailable = 25,
        ExpiredActionCode = 26,
        InvalidActionCode = 27,
        InvalidMessagePayload = 28,
        InvalidPhoneNumber = 29,
        MissingPhoneNumber = 30,
        InvalidRecipientEmail = 31,
        InvalidSender = 32,
        InvalidVerificationCode = 33,
        InvalidVerificationId = 34,
        MissingVerificationCode = 35,
        MissingVerificationId = 36,
        MissingEmail = 37,
        MissingPassword = 38,
        QuotaExceeded = 39,
        RetryPhoneAuth = 40,
        SessionExpired = 41,
        AppNotVerified = 42,
        AppVerificationFailed = 43,
        CaptchaCheckFailed = 44,
        InvalidAppCredential = 45,
        MissingAppCredential = 46,
        InvalidClientId = 47,
        InvalidContinueUri = 48,
        MissingContinueUri = 49,
        KeychainError = 50,
        MissingAppToken = 51,
        MissingIosBundleId = 52,
        NotificationNotForwarded = 53,
        UnauthorizedDomain = 54,
        WebContextAlreadyPresented = 55,
        WebContextCancelled = 56,
        DynamicLinkNotActivated = 57,
        Cancelled = 58,
        InvalidProviderId = 59,
        WebInternalError = 60,
        WebStorateUnsupported = 61,
        TenantIdMismatch = 62,
        UnsupportedTenantOperation = 63,
        InvalidLinkDomain = 64,
        RejectedCredential = 65,
        PhoneNumberNotFound = 66,
        InvalidTenantId = 67,
        MissingClientIdentifier = 68,
        MissingMultiFactorSession = 69,
        MissingMultiFactorInfo = 70,
        InvalidMultiFactorSession = 71,
        MultiFactorInfoNotFound = 72,
        AdminRestrictedOperation = 73,
        UnverifiedEmail = 74,
        SecondFactorAlreadyEnrolled = 75,
        MaximumSecondFactorCountExceeded = 76,
        UnsupportedFirstFactor = 77,
        EmailChangeNeedsVerification = 78
    };

}


namespace gm_structs
{
    struct FirebaseAuthUserInfo;

    struct FirebaseAuthUserInfo
    {
        std::string uid;
        std::string email;
        std::string display_name;
        std::string photo_url;
        std::string provider_id;
        std::string phone_number;
        bool is_email_verified;
        bool is_anonymous;
        bool is_valid;
        double creation_timestamp;
        double last_sign_in_timestamp;
    };

}

namespace gm::wire::codec
{
    template<>
    inline void writeValue<gm_structs::FirebaseAuthUserInfo>(gm::byteio::IByteWriter& _buf, const gm_structs::FirebaseAuthUserInfo& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.uid);
        gm::wire::codec::writeValue(_buf, obj.email);
        gm::wire::codec::writeValue(_buf, obj.display_name);
        gm::wire::codec::writeValue(_buf, obj.photo_url);
        gm::wire::codec::writeValue(_buf, obj.provider_id);
        gm::wire::codec::writeValue(_buf, obj.phone_number);
        gm::wire::codec::writeValue(_buf, obj.is_email_verified);
        gm::wire::codec::writeValue(_buf, obj.is_anonymous);
        gm::wire::codec::writeValue(_buf, obj.is_valid);
        gm::wire::codec::writeValue(_buf, obj.creation_timestamp);
        gm::wire::codec::writeValue(_buf, obj.last_sign_in_timestamp);
    }

    template<>
    inline gm_structs::FirebaseAuthUserInfo readValue<gm_structs::FirebaseAuthUserInfo>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::FirebaseAuthUserInfo obj;
        obj.uid = gm::wire::codec::readValue<std::string>(_buf);
        obj.email = gm::wire::codec::readValue<std::string>(_buf);
        obj.display_name = gm::wire::codec::readValue<std::string>(_buf);
        obj.photo_url = gm::wire::codec::readValue<std::string>(_buf);
        obj.provider_id = gm::wire::codec::readValue<std::string>(_buf);
        obj.phone_number = gm::wire::codec::readValue<std::string>(_buf);
        obj.is_email_verified = gm::wire::codec::readValue<bool>(_buf);
        obj.is_anonymous = gm::wire::codec::readValue<bool>(_buf);
        obj.is_valid = gm::wire::codec::readValue<bool>(_buf);
        obj.creation_timestamp = gm::wire::codec::readValue<double>(_buf);
        obj.last_sign_in_timestamp = gm::wire::codec::readValue<double>(_buf);
        return obj;
    }

}

namespace gm::wire::details
{
    template<>
    struct gm_struct_traits<gm_structs::FirebaseAuthUserInfo>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 0;
    };

}

bool firebase_auth_get_auth();
std::string firebase_auth_language_code();
void firebase_auth_set_language_code(std::string_view language_code);
void firebase_auth_use_app_language();
void firebase_auth_use_emulator(std::string_view host, double port);
std::optional<std::uint64_t> firebase_auth_current_user();
void firebase_auth_sign_out();
void firebase_auth_fetch_providers_for_email(std::string_view email, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_sign_in_with_custom_token(std::string_view custom_token, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_sign_in_with_credential(std::uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_sign_in_and_retrieve_data_with_credential(std::uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_sign_in_anonymously(const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_sign_in_with_email_and_password(std::string_view email, std::string_view password, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_create_user_with_email_and_password(std::string_view email, std::string_view password, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_send_password_reset_email(std::string_view email, const std::optional<gm::wire::GMFunction>& callback);
std::optional<std::uint64_t> firebase_auth_add_state_listener(const gm::wire::GMFunction& callback);
void firebase_auth_remove_state_listener(std::uint64_t listener_ref);
std::optional<std::uint64_t> firebase_auth_add_id_token_listener(const gm::wire::GMFunction& callback);
void firebase_auth_remove_id_token_listener(std::uint64_t listener_ref);
std::string firebase_auth_credential_provider(std::uint64_t credential_ref);
bool firebase_auth_credential_is_valid(std::uint64_t credential_ref);
void firebase_auth_credential_release(std::uint64_t credential_ref);
std::uint64_t firebase_auth_email_auth_provider_get_credential(std::string_view email, std::string_view password);
std::uint64_t firebase_auth_facebook_auth_provider_get_credential(std::string_view access_token);
void firebase_auth_game_center_auth_provider_get_credential(const std::optional<gm::wire::GMFunction>& callback);
bool firebase_auth_game_center_auth_provider_is_player_authenticated();
std::uint64_t firebase_auth_github_auth_provider_get_credential(std::string_view token);
std::uint64_t firebase_auth_google_auth_provider_get_credential(std::string_view id_token, std::string_view access_token);
std::uint64_t firebase_auth_oauth_provider_get_credential(std::string_view provider_id, std::string_view id_token, std::string_view access_token);
std::uint64_t firebase_auth_oauth_provider_get_credential_with_nonce(std::string_view provider_id, std::string_view id_token, std::string_view raw_nonce, std::string_view access_token);
std::uint64_t firebase_auth_play_games_auth_provider_get_credential(std::string_view server_auth_code);
std::uint64_t firebase_auth_twitter_auth_provider_get_credential(std::string_view token, std::string_view secret);
std::uint64_t firebase_auth_phone_verify_phone_number(std::string_view phone_number, double timeout_ms, std::uint64_t force_resending_token, const std::optional<gm::wire::GMFunction>& on_verification_completed, const std::optional<gm::wire::GMFunction>& on_verification_failed, const std::optional<gm::wire::GMFunction>& on_code_sent, const std::optional<gm::wire::GMFunction>& on_timeout);
std::uint64_t firebase_auth_phone_get_credential(std::string_view verification_id, std::string_view verification_code);
std::string firebase_auth_phone_credential_sms_code(std::uint64_t credential);
void firebase_auth_phone_resending_token_release(std::uint64_t token);
void firebase_auth_phone_listener_release(std::uint64_t listener);
gm_structs::FirebaseAuthUserInfo firebase_auth_user_get_info(std::uint64_t user);
void firebase_auth_user_release(std::uint64_t user_ref);
bool firebase_auth_user_is_valid(std::uint64_t user_ref);
std::string firebase_auth_user_uid(std::uint64_t user_ref);
std::string firebase_auth_user_email(std::uint64_t user_ref);
std::string firebase_auth_user_display_name(std::uint64_t user_ref);
std::string firebase_auth_user_photo_url(std::uint64_t user_ref);
std::string firebase_auth_user_provider_id(std::uint64_t user_ref);
std::string firebase_auth_user_phone_number(std::uint64_t user_ref);
bool firebase_auth_user_is_email_verified(std::uint64_t user_ref);
bool firebase_auth_user_is_anonymous(std::uint64_t user_ref);
double firebase_auth_user_creation_timestamp(std::uint64_t user_ref);
double firebase_auth_user_last_sign_in_timestamp(std::uint64_t user_ref);
void firebase_auth_user_get_token(std::uint64_t user_ref, bool force_refresh, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_user_update_password(std::uint64_t user_ref, std::string_view password, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_user_update_profile(std::uint64_t user_ref, std::string_view display_name, std::string_view photo_url, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_user_send_email_verification(std::uint64_t user_ref, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_user_send_email_verification_before_updating_email(std::uint64_t user_ref, std::string_view new_email, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_user_reauthenticate(std::uint64_t user_ref, std::uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_user_reauthenticate_and_retrieve_data(std::uint64_t user_ref, std::uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_user_link_with_credential(std::uint64_t user_ref, std::uint64_t credential_ref, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_user_unlink(std::uint64_t user_ref, std::string_view provider_id, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_user_reload(std::uint64_t user_ref, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_user_delete(std::uint64_t user_ref, const std::optional<gm::wire::GMFunction>& callback);
std::uint64_t firebase_auth_federated_oauth_provider_create(std::string_view provider_id, const gm::wire::GMValue& scopes, const gm::wire::GMValue& custom_parameters);
void firebase_auth_federated_oauth_provider_set_data(std::uint64_t provider, std::string_view provider_id, const gm::wire::GMValue& scopes, const gm::wire::GMValue& custom_parameters);
void firebase_auth_federated_oauth_provider_release(std::uint64_t provider);
void firebase_auth_sign_in_with_provider(std::uint64_t provider, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_sign_in_with_custom_token_result(std::string_view custom_token, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_sign_in_and_retrieve_data_with_credential_result(std::uint64_t credential, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_sign_in_anonymously_result(const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_sign_in_with_email_and_password_result(std::string_view email, std::string_view password, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_create_user_with_email_and_password_result(std::string_view email, std::string_view password, const std::optional<gm::wire::GMFunction>& callback);
double firebase_auth_user_provider_data_count(std::uint64_t user);
gm::wire::DataStream firebase_auth_user_provider_data_at(std::uint64_t user, double index);
void firebase_auth_user_reauthenticate_with_provider(std::uint64_t user, std::uint64_t provider, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_user_link_with_provider(std::uint64_t user, std::uint64_t provider, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_user_reauthenticate_and_retrieve_data_result(std::uint64_t user, std::uint64_t credential, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_user_link_with_credential_result(std::uint64_t user, std::uint64_t credential, const std::optional<gm::wire::GMFunction>& callback);
void firebase_auth_user_update_phone_number_credential(std::uint64_t user, std::uint64_t phone_credential, const std::optional<gm::wire::GMFunction>& callback);
std::uint64_t firebase_auth_get_app();
std::uint64_t firebase_auth_get_current_instance_handle();
std::uint64_t firebase_auth_get_instance_for_app(std::uint64_t app);
double firebase_auth_use_instance(std::uint64_t auth);
std::uint64_t firebase_auth_instance_get_app(std::uint64_t auth);
std::string firebase_auth_email_auth_provider_id();
std::string firebase_auth_facebook_auth_provider_id();
std::string firebase_auth_game_center_auth_provider_id();
std::string firebase_auth_github_auth_provider_id();
std::string firebase_auth_google_auth_provider_id();
std::string firebase_auth_microsoft_auth_provider_id();
std::string firebase_auth_play_games_auth_provider_id();
std::string firebase_auth_twitter_auth_provider_id();
std::string firebase_auth_yahoo_auth_provider_id();
void firebase_auth_game_center_auth_provider_get_credential_last_result(const std::optional<gm::wire::GMFunction>& callback);
