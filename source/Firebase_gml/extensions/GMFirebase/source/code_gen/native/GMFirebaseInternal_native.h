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
    enum class FirebaseAppCheckProvider : std::int64_t
    {
        Debug = 0,
        DeviceCheck = 1,
        PlayIntegrity = 2,
        AppAttest = 3
    };

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

    enum class FirebaseLogLevel : std::int64_t
    {
        Verbose = 0,
        Debug = 1,
        Info = 2,
        Warning = 3,
        Error = 4,
        Assert = 5
    };

    enum class FirebaseDatabaseError : std::int64_t
    {
        None = 0,
        Disconnected = 1,
        ExpiredToken = 2,
        InvalidToken = 3,
        MaxRetries = 4,
        NetworkError = 5,
        OperationFailed = 6,
        OverriddenBySet = 7,
        PermissionDenied = 8,
        Unavailable = 9,
        UnknownError = 10,
        WriteCanceled = 11,
        InvalidVariantType = 12,
        ConflictingOperationInProgress = 13,
        TransactionAbortedByUser = 14
    };

    enum class FirestoreError : std::int64_t
    {
        Ok = 0,
        Cancelled = 1,
        Unknown = 2,
        InvalidArgument = 3,
        DeadlineExceeded = 4,
        NotFound = 5,
        AlreadyExists = 6,
        PermissionDenied = 7,
        ResourceExhausted = 8,
        FailedPrecondition = 9,
        Aborted = 10,
        OutOfRange = 11,
        Unimplemented = 12,
        Internal = 13,
        Unavailable = 14,
        DataLoss = 15,
        Unauthenticated = 16
    };

    enum class FirestoreSource : std::int64_t
    {
        Default = 0,
        Cache = 1,
        Server = 2
    };

    enum class FirestoreDirection : std::int64_t
    {
        Ascending = 0,
        Descending = 1
    };

    enum class FirestoreServerTimestampBehavior : std::int64_t
    {
        None = 0,
        Estimate = 1,
        Previous = 2
    };

    enum class FirestoreDocumentChangeType : std::int64_t
    {
        Added = 0,
        Modified = 1,
        Removed = 2
    };

    enum class FirebaseRemoteConfigLastFetchStatus : std::int64_t
    {
        Success = 0,
        Failure = 1,
        Pending = 2
    };

    enum class FirebaseRemoteConfigFetchFailureReason : std::int64_t
    {
        Invalid = 0,
        Throttled = 1,
        Error = 2
    };

    enum class FirebaseUmpConsentStatus : std::int64_t
    {
        Unknown = 0,
        Required = 1,
        NotRequired = 2,
        Obtained = 3
    };

    enum class FirebaseUmpConsentFormStatus : std::int64_t
    {
        Unknown = 0,
        Unavailable = 1,
        Available = 2
    };

    enum class FirebaseUmpPrivacyOptionsRequirementStatus : std::int64_t
    {
        Unknown = 0,
        NotRequired = 1,
        Required = 2
    };

    enum class FirebaseUmpConsentDebugGeography : std::int64_t
    {
        Disabled = 0,
        EEA = 1,
        NonEEA = 2
    };

}


namespace gm_structs
{
    struct DatabaseReference;
    struct FirebaseDataSnapshotInfo;
    struct FirebaseDataSnapshot;
    struct FirestoreDocumentSnapshotInfo;
    struct FirestoreQuerySnapshotInfo;
    struct FirebaseRemoteConfigInfo;

    struct DatabaseReference
    {
        std::string key;
        bool is_root;
        bool is_valid;
        std::uint64_t reference;
        std::uint64_t parent;
        std::uint64_t root;
        std::uint64_t database;
        std::string url;
    };

    struct FirebaseDataSnapshotInfo
    {
        std::string key;
        bool exists;
        bool is_valid;
        bool has_children;
        double children_count;
        std::uint64_t reference;
    };

    struct FirebaseDataSnapshot
    {
        std::string key;
        bool exists;
        bool is_valid;
        bool has_children;
        double children_count;
        std::uint64_t reference;
        gm::wire::DataStream value;
        gm::wire::DataStream priority;
    };

    struct FirestoreDocumentSnapshotInfo
    {
        bool exists;
        std::string id;
        std::uint64_t reference;
        bool has_pending_writes;
        bool is_from_cache;
    };

    struct FirestoreQuerySnapshotInfo
    {
        double size;
        bool empty;
        bool has_pending_writes;
        bool is_from_cache;
    };

    struct FirebaseRemoteConfigInfo
    {
        double fetch_time;
        double last_fetch_status;
        double last_fetch_failure_reason;
        double throttled_end_time;
    };

}

namespace gm::wire::codec
{
    template<>
    inline void writeValue<gm_structs::DatabaseReference>(gm::byteio::IByteWriter& _buf, const gm_structs::DatabaseReference& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.key);
        gm::wire::codec::writeValue(_buf, obj.is_root);
        gm::wire::codec::writeValue(_buf, obj.is_valid);
        gm::wire::codec::writeValue(_buf, obj.reference);
        gm::wire::codec::writeValue(_buf, obj.parent);
        gm::wire::codec::writeValue(_buf, obj.root);
        gm::wire::codec::writeValue(_buf, obj.database);
        gm::wire::codec::writeValue(_buf, obj.url);
    }

    template<>
    inline gm_structs::DatabaseReference readValue<gm_structs::DatabaseReference>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::DatabaseReference obj;
        obj.key = gm::wire::codec::readValue<std::string>(_buf);
        obj.is_root = gm::wire::codec::readValue<bool>(_buf);
        obj.is_valid = gm::wire::codec::readValue<bool>(_buf);
        obj.reference = gm::wire::codec::readValue<std::uint64_t>(_buf);
        obj.parent = gm::wire::codec::readValue<std::uint64_t>(_buf);
        obj.root = gm::wire::codec::readValue<std::uint64_t>(_buf);
        obj.database = gm::wire::codec::readValue<std::uint64_t>(_buf);
        obj.url = gm::wire::codec::readValue<std::string>(_buf);
        return obj;
    }

    template<>
    inline void writeValue<gm_structs::FirebaseDataSnapshotInfo>(gm::byteio::IByteWriter& _buf, const gm_structs::FirebaseDataSnapshotInfo& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.key);
        gm::wire::codec::writeValue(_buf, obj.exists);
        gm::wire::codec::writeValue(_buf, obj.is_valid);
        gm::wire::codec::writeValue(_buf, obj.has_children);
        gm::wire::codec::writeValue(_buf, obj.children_count);
        gm::wire::codec::writeValue(_buf, obj.reference);
    }

    template<>
    inline gm_structs::FirebaseDataSnapshotInfo readValue<gm_structs::FirebaseDataSnapshotInfo>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::FirebaseDataSnapshotInfo obj;
        obj.key = gm::wire::codec::readValue<std::string>(_buf);
        obj.exists = gm::wire::codec::readValue<bool>(_buf);
        obj.is_valid = gm::wire::codec::readValue<bool>(_buf);
        obj.has_children = gm::wire::codec::readValue<bool>(_buf);
        obj.children_count = gm::wire::codec::readValue<double>(_buf);
        obj.reference = gm::wire::codec::readValue<std::uint64_t>(_buf);
        return obj;
    }

    template<>
    inline void writeValue<gm_structs::FirebaseDataSnapshot>(gm::byteio::IByteWriter& _buf, const gm_structs::FirebaseDataSnapshot& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.key);
        gm::wire::codec::writeValue(_buf, obj.exists);
        gm::wire::codec::writeValue(_buf, obj.is_valid);
        gm::wire::codec::writeValue(_buf, obj.has_children);
        gm::wire::codec::writeValue(_buf, obj.children_count);
        gm::wire::codec::writeValue(_buf, obj.reference);
        gm::wire::codec::writeValue(_buf, obj.value);
        gm::wire::codec::writeValue(_buf, obj.priority);
    }

    template<>
    inline gm_structs::FirebaseDataSnapshot readValue<gm_structs::FirebaseDataSnapshot>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::FirebaseDataSnapshot obj;
        obj.key = gm::wire::codec::readValue<std::string>(_buf);
        obj.exists = gm::wire::codec::readValue<bool>(_buf);
        obj.is_valid = gm::wire::codec::readValue<bool>(_buf);
        obj.has_children = gm::wire::codec::readValue<bool>(_buf);
        obj.children_count = gm::wire::codec::readValue<double>(_buf);
        obj.reference = gm::wire::codec::readValue<std::uint64_t>(_buf);
        obj.value = gm::wire::codec::readValue<gm::wire::DataStream>(_buf);
        obj.priority = gm::wire::codec::readValue<gm::wire::DataStream>(_buf);
        return obj;
    }

    template<>
    inline void writeValue<gm_structs::FirestoreDocumentSnapshotInfo>(gm::byteio::IByteWriter& _buf, const gm_structs::FirestoreDocumentSnapshotInfo& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.exists);
        gm::wire::codec::writeValue(_buf, obj.id);
        gm::wire::codec::writeValue(_buf, obj.reference);
        gm::wire::codec::writeValue(_buf, obj.has_pending_writes);
        gm::wire::codec::writeValue(_buf, obj.is_from_cache);
    }

    template<>
    inline gm_structs::FirestoreDocumentSnapshotInfo readValue<gm_structs::FirestoreDocumentSnapshotInfo>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::FirestoreDocumentSnapshotInfo obj;
        obj.exists = gm::wire::codec::readValue<bool>(_buf);
        obj.id = gm::wire::codec::readValue<std::string>(_buf);
        obj.reference = gm::wire::codec::readValue<std::uint64_t>(_buf);
        obj.has_pending_writes = gm::wire::codec::readValue<bool>(_buf);
        obj.is_from_cache = gm::wire::codec::readValue<bool>(_buf);
        return obj;
    }

    template<>
    inline void writeValue<gm_structs::FirestoreQuerySnapshotInfo>(gm::byteio::IByteWriter& _buf, const gm_structs::FirestoreQuerySnapshotInfo& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.size);
        gm::wire::codec::writeValue(_buf, obj.empty);
        gm::wire::codec::writeValue(_buf, obj.has_pending_writes);
        gm::wire::codec::writeValue(_buf, obj.is_from_cache);
    }

    template<>
    inline gm_structs::FirestoreQuerySnapshotInfo readValue<gm_structs::FirestoreQuerySnapshotInfo>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::FirestoreQuerySnapshotInfo obj;
        obj.size = gm::wire::codec::readValue<double>(_buf);
        obj.empty = gm::wire::codec::readValue<bool>(_buf);
        obj.has_pending_writes = gm::wire::codec::readValue<bool>(_buf);
        obj.is_from_cache = gm::wire::codec::readValue<bool>(_buf);
        return obj;
    }

    template<>
    inline void writeValue<gm_structs::FirebaseRemoteConfigInfo>(gm::byteio::IByteWriter& _buf, const gm_structs::FirebaseRemoteConfigInfo& obj)
    {
        gm::wire::codec::writeValue(_buf, obj.fetch_time);
        gm::wire::codec::writeValue(_buf, obj.last_fetch_status);
        gm::wire::codec::writeValue(_buf, obj.last_fetch_failure_reason);
        gm::wire::codec::writeValue(_buf, obj.throttled_end_time);
    }

    template<>
    inline gm_structs::FirebaseRemoteConfigInfo readValue<gm_structs::FirebaseRemoteConfigInfo>(gm::byteio::BufferReader& _buf)
    {
        gm_structs::FirebaseRemoteConfigInfo obj;
        obj.fetch_time = gm::wire::codec::readValue<double>(_buf);
        obj.last_fetch_status = gm::wire::codec::readValue<double>(_buf);
        obj.last_fetch_failure_reason = gm::wire::codec::readValue<double>(_buf);
        obj.throttled_end_time = gm::wire::codec::readValue<double>(_buf);
        return obj;
    }

}

namespace gm::wire::details
{
    template<>
    struct gm_struct_traits<gm_structs::DatabaseReference>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 0;
    };

    template<>
    struct gm_struct_traits<gm_structs::FirebaseDataSnapshotInfo>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 1;
    };

    template<>
    struct gm_struct_traits<gm_structs::FirebaseDataSnapshot>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 2;
    };

    template<>
    struct gm_struct_traits<gm_structs::FirestoreDocumentSnapshotInfo>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 3;
    };

    template<>
    struct gm_struct_traits<gm_structs::FirestoreQuerySnapshotInfo>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 4;
    };

    template<>
    struct gm_struct_traits<gm_structs::FirebaseRemoteConfigInfo>
    {
        static constexpr bool is_gm_struct = true;
        static constexpr std::uint32_t codec_id = 5;
    };

}

double firebase_app_initialize();
double firebase_app_is_initialized();
std::string firebase_app_get_name();
double firebase_last_error_code();
std::string firebase_last_error_message();
double firebase_analytics_initialize();
void firebase_analytics_terminate();
void firebase_analytics_set_analytics_collection_enabled(double enabled);
void firebase_analytics_set_consent(double ad_storage, double analytics_storage, double ad_user_data, double ad_personalization);
void firebase_analytics_log_event(std::string_view name);
void firebase_analytics_log_event_string(std::string_view name, std::string_view parameter_name, std::string_view parameter_value);
void firebase_analytics_log_event_number(std::string_view name, std::string_view parameter_name, double parameter_value);
void firebase_analytics_log_event_params(std::string_view name, const gm::wire::GMValue& params);
void firebase_analytics_set_default_event_parameters(const gm::wire::GMValue& params);
double firebase_analytics_log_apple_transaction(std::string_view transaction_id, const std::optional<gm::wire::GMFunction>& callback);
void firebase_analytics_set_user_property(std::string_view name, std::string_view value);
void firebase_analytics_set_user_id(std::string_view user_id);
void firebase_analytics_set_session_timeout_duration(double milliseconds);
void firebase_analytics_reset_analytics_data();
double firebase_analytics_get_analytics_instance_id(const std::optional<gm::wire::GMFunction>& callback);
double firebase_analytics_get_session_id(const std::optional<gm::wire::GMFunction>& callback);
void firebase_analytics_notify_app_lifecycle_termination();
double firebase_analytics_is_desktop_initialized();
void firebase_analytics_set_desktop_debug_mode(double enabled);
void firebase_analytics_set_log_callback(const std::optional<gm::wire::GMFunction>& callback);
void firebase_analytics_initiate_on_device_conversion_measurement_email(std::string_view email_address);
void firebase_analytics_initiate_on_device_conversion_measurement_phone(std::string_view phone_number);
void firebase_app_check_set_provider_factory(double provider);
void firebase_app_check_debug_provider_set_debug_token(std::string_view token);
void firebase_app_check_set_token_auto_refresh_enabled(double enabled);
double firebase_app_check_get_token(double force_refresh, const std::optional<gm::wire::GMFunction>& callback);
double firebase_app_check_get_limited_use_token(const std::optional<gm::wire::GMFunction>& callback);
std::uint64_t firebase_app_check_add_listener(const std::optional<gm::wire::GMFunction>& callback);
double firebase_app_check_remove_listener(std::uint64_t listener_ref);
double firebase_installations_get_id(const std::optional<gm::wire::GMFunction>& callback);
double firebase_installations_get_token(double force_refresh, const std::optional<gm::wire::GMFunction>& callback);
double firebase_installations_delete(const std::optional<gm::wire::GMFunction>& callback);
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
double firebase_auth_phone_verify_phone_number(std::string_view phone_number, double timeout_ms);
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
std::uint64_t firebase_database_get_instance();
std::uint64_t firebase_database_get_instance_for_url(std::string_view url);
std::string firebase_database_get_url(std::uint64_t db_ref);
std::uint64_t firebase_database_get_reference(std::uint64_t db_ref);
std::uint64_t firebase_database_get_reference_at_path(std::uint64_t db_ref, std::string_view path);
std::uint64_t firebase_database_get_reference_from_url(std::uint64_t db_ref, std::string_view url);
double firebase_database_go_offline(std::uint64_t db_ref);
double firebase_database_go_online(std::uint64_t db_ref);
double firebase_database_purge_outstanding_writes(std::uint64_t db_ref);
double firebase_database_set_persistence_enabled(std::uint64_t db_ref, double enabled);
double firebase_database_set_log_level(std::uint64_t db_ref, gm_enums::FirebaseLogLevel log_level);
gm_enums::FirebaseLogLevel firebase_database_get_log_level(std::uint64_t db_ref);
std::uint64_t firebase_database_ref_order_by_child(std::uint64_t ref, std::string_view path);
std::uint64_t firebase_database_ref_order_by_key(std::uint64_t ref);
std::uint64_t firebase_database_ref_order_by_value(std::uint64_t ref);
std::uint64_t firebase_database_ref_order_by_priority(std::uint64_t ref);
std::uint64_t firebase_database_ref_start_at(std::uint64_t ref, const gm::wire::GMValue& order_value);
std::uint64_t firebase_database_ref_start_at_key(std::uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key);
std::uint64_t firebase_database_ref_end_at(std::uint64_t ref, const gm::wire::GMValue& order_value);
std::uint64_t firebase_database_ref_end_at_key(std::uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key);
std::uint64_t firebase_database_ref_equal_to(std::uint64_t ref, const gm::wire::GMValue& order_value);
std::uint64_t firebase_database_ref_equal_to_key(std::uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key);
std::uint64_t firebase_database_ref_limit_to_first(std::uint64_t ref, double limit);
std::uint64_t firebase_database_ref_limit_to_last(std::uint64_t ref, double limit);
double firebase_database_ref_set_keep_synchronized(std::uint64_t ref, double keep_sync);
double firebase_database_ref_get_value(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback);
std::uint64_t firebase_database_ref_add_value_listener(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& on_value_changed, const std::optional<gm::wire::GMFunction>& on_cancelled);
double firebase_database_ref_remove_value_listener(std::uint64_t ref, std::uint64_t listener_ref);
double firebase_database_ref_remove_all_value_listeners(std::uint64_t ref);
std::uint64_t firebase_database_ref_add_child_listener(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& on_child_added, const std::optional<gm::wire::GMFunction>& on_child_changed, const std::optional<gm::wire::GMFunction>& on_child_moved, const std::optional<gm::wire::GMFunction>& on_child_removed, const std::optional<gm::wire::GMFunction>& on_cancelled);
double firebase_database_ref_remove_child_listener(std::uint64_t ref, std::uint64_t listener_ref);
double firebase_database_ref_remove_all_child_listeners(std::uint64_t ref);
std::uint64_t firebase_database_query_order_by_child(std::uint64_t ref, std::string_view path);
std::uint64_t firebase_database_query_order_by_key(std::uint64_t ref);
std::uint64_t firebase_database_query_order_by_value(std::uint64_t ref);
std::uint64_t firebase_database_query_order_by_priority(std::uint64_t ref);
std::uint64_t firebase_database_query_start_at(std::uint64_t ref, const gm::wire::GMValue& order_value);
std::uint64_t firebase_database_query_start_at_key(std::uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key);
std::uint64_t firebase_database_query_end_at(std::uint64_t ref, const gm::wire::GMValue& order_value);
std::uint64_t firebase_database_query_end_at_key(std::uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key);
std::uint64_t firebase_database_query_equal_to(std::uint64_t ref, const gm::wire::GMValue& order_value);
std::uint64_t firebase_database_query_equal_to_key(std::uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key);
std::uint64_t firebase_database_query_limit_to_first(std::uint64_t ref, double limit);
std::uint64_t firebase_database_query_limit_to_last(std::uint64_t ref, double limit);
std::uint64_t firebase_database_query_get_reference(std::uint64_t ref);
double firebase_database_query_set_keep_synchronized(std::uint64_t ref, double keep_sync);
double firebase_database_query_is_valid(std::uint64_t ref);
double firebase_database_query_get_value(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback);
std::uint64_t firebase_database_query_add_value_listener(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& on_value_changed, const std::optional<gm::wire::GMFunction>& on_cancelled);
double firebase_database_query_remove_value_listener(std::uint64_t ref, std::uint64_t listener_ref);
double firebase_database_query_remove_all_value_listeners(std::uint64_t ref);
std::uint64_t firebase_database_query_add_child_listener(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& on_child_added, const std::optional<gm::wire::GMFunction>& on_child_changed, const std::optional<gm::wire::GMFunction>& on_child_moved, const std::optional<gm::wire::GMFunction>& on_child_removed, const std::optional<gm::wire::GMFunction>& on_cancelled);
double firebase_database_query_remove_child_listener(std::uint64_t ref, std::uint64_t listener_ref);
double firebase_database_query_remove_all_child_listeners(std::uint64_t ref);
double firebase_database_query_release(std::uint64_t ref);
gm_structs::DatabaseReference firebase_database_ref_get(std::uint64_t ref);
std::uint64_t firebase_database_ref_child(std::uint64_t ref, std::string_view path);
std::uint64_t firebase_database_ref_push(std::uint64_t ref);
double firebase_database_ref_go_online(std::uint64_t ref);
double firebase_database_ref_go_offline(std::uint64_t ref);
double firebase_database_ref_set_value(std::uint64_t ref, const gm::wire::GMValue& value, const std::optional<gm::wire::GMFunction>& callback);
double firebase_database_ref_set_priority(std::uint64_t ref, const gm::wire::GMValue& priority, const std::optional<gm::wire::GMFunction>& callback);
double firebase_database_ref_set_value_and_priority(std::uint64_t ref, const gm::wire::GMValue& value, const gm::wire::GMValue& priority, const std::optional<gm::wire::GMFunction>& callback);
double firebase_database_ref_update_children(std::uint64_t ref, const gm::wire::GMValue& values, const std::optional<gm::wire::GMFunction>& callback);
double firebase_database_ref_remove_value(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_database_ref_run_transaction(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_database_ref_release(std::uint64_t ref);
double firebase_database_snapshot_exists(std::uint64_t ref);
double firebase_database_snapshot_is_valid(std::uint64_t ref);
std::uint64_t firebase_database_snapshot_child(std::uint64_t ref, std::string_view path);
double firebase_database_snapshot_has_child(std::uint64_t ref, std::string_view path);
double firebase_database_snapshot_has_children(std::uint64_t ref);
double firebase_database_snapshot_children_count(std::uint64_t ref);
gm::wire::DataStream firebase_database_snapshot_get_children(std::uint64_t ref);
std::string firebase_database_snapshot_key(std::uint64_t ref);
std::uint64_t firebase_database_snapshot_get_reference(std::uint64_t ref);
gm_structs::FirebaseDataSnapshotInfo firebase_database_snapshot_get_info(std::uint64_t ref);
gm_structs::FirebaseDataSnapshot firebase_database_snapshot_get_value(std::uint64_t ref);
gm::wire::DataStream firebase_database_snapshot_get_priority(std::uint64_t ref);
double firebase_database_snapshot_release(std::uint64_t ref);
std::uint64_t firebase_firestore_get_instance();
std::uint64_t firebase_firestore_get_instance_for_database(std::string_view database_name);
std::string firebase_firestore_settings_get_host(std::uint64_t instance_ref);
void firebase_firestore_settings_set_host(std::uint64_t instance_ref, std::string_view host);
bool firebase_firestore_settings_get_ssl_enabled(std::uint64_t instance_ref);
void firebase_firestore_settings_set_ssl_enabled(std::uint64_t instance_ref, bool enabled);
bool firebase_firestore_settings_get_persistence_enabled(std::uint64_t instance_ref);
void firebase_firestore_settings_set_persistence_enabled(std::uint64_t instance_ref, bool enabled);
double firebase_firestore_settings_get_cache_size_bytes(std::uint64_t instance_ref);
void firebase_firestore_settings_set_cache_size_bytes(std::uint64_t instance_ref, double bytes);
std::uint64_t firebase_firestore_collection(std::uint64_t instance_ref, std::string_view path);
std::uint64_t firebase_firestore_document(std::uint64_t instance_ref, std::string_view path);
std::uint64_t firebase_firestore_collection_group(std::uint64_t instance_ref, std::string_view collection_id);
std::uint64_t firebase_firestore_batch(std::uint64_t instance_ref);
void firebase_firestore_set_log_level(double level);
double firebase_firestore_enable_network(std::uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_disable_network(std::uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_terminate(std::uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_clear_persistence(std::uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_wait_for_pending_writes(std::uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_run_transaction(std::uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback);
std::string firebase_firestore_collection_ref_id(std::uint64_t ref);
std::string firebase_firestore_collection_ref_path(std::uint64_t ref);
std::uint64_t firebase_firestore_collection_ref_parent(std::uint64_t ref);
std::uint64_t firebase_firestore_collection_ref_document(std::uint64_t ref);
std::uint64_t firebase_firestore_collection_ref_document_path(std::uint64_t ref, std::string_view path);
double firebase_firestore_collection_ref_add(std::uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback);
bool firebase_firestore_collection_ref_is_valid(std::uint64_t ref);
void firebase_firestore_collection_ref_release(std::uint64_t ref);
std::string firebase_firestore_document_ref_id(std::uint64_t ref);
std::string firebase_firestore_document_ref_path(std::uint64_t ref);
std::uint64_t firebase_firestore_document_ref_parent(std::uint64_t ref);
std::uint64_t firebase_firestore_document_ref_collection(std::uint64_t ref, std::string_view path);
double firebase_firestore_document_ref_get(std::uint64_t ref, double source, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_document_ref_set(std::uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_document_ref_set_merge(std::uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_document_ref_set_merge_fields(std::uint64_t ref, const gm::wire::GMValue& data, const gm::wire::GMValue& fields, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_document_ref_update(std::uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback);
double firebase_firestore_document_ref_delete(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback);
std::uint64_t firebase_firestore_document_ref_add_snapshot_listener(std::uint64_t ref, bool include_metadata_changes, const std::optional<gm::wire::GMFunction>& callback);
bool firebase_firestore_document_ref_is_valid(std::uint64_t ref);
void firebase_firestore_document_ref_release(std::uint64_t ref);
std::uint64_t firebase_firestore_query_where_equal_to(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& value);
std::uint64_t firebase_firestore_query_where_not_equal_to(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& value);
std::uint64_t firebase_firestore_query_where_less_than(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& value);
std::uint64_t firebase_firestore_query_where_less_than_or_equal_to(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& value);
std::uint64_t firebase_firestore_query_where_greater_than(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& value);
std::uint64_t firebase_firestore_query_where_greater_than_or_equal_to(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& value);
std::uint64_t firebase_firestore_query_where_array_contains(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& value);
std::uint64_t firebase_firestore_query_where_array_contains_any(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& values);
std::uint64_t firebase_firestore_query_where_in(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& values);
std::uint64_t firebase_firestore_query_where_not_in(std::uint64_t ref, std::string_view field, const gm::wire::GMValue& values);
std::uint64_t firebase_firestore_query_order_by(std::uint64_t ref, std::string_view field, double direction);
std::uint64_t firebase_firestore_query_limit(std::uint64_t ref, double limit);
std::uint64_t firebase_firestore_query_limit_to_last(std::uint64_t ref, double limit);
std::uint64_t firebase_firestore_query_start_at_snapshot(std::uint64_t ref, std::uint64_t snapshot_ref);
std::uint64_t firebase_firestore_query_start_at_values(std::uint64_t ref, const gm::wire::GMValue& values);
std::uint64_t firebase_firestore_query_start_after_snapshot(std::uint64_t ref, std::uint64_t snapshot_ref);
std::uint64_t firebase_firestore_query_start_after_values(std::uint64_t ref, const gm::wire::GMValue& values);
std::uint64_t firebase_firestore_query_end_before_snapshot(std::uint64_t ref, std::uint64_t snapshot_ref);
std::uint64_t firebase_firestore_query_end_before_values(std::uint64_t ref, const gm::wire::GMValue& values);
std::uint64_t firebase_firestore_query_end_at_snapshot(std::uint64_t ref, std::uint64_t snapshot_ref);
std::uint64_t firebase_firestore_query_end_at_values(std::uint64_t ref, const gm::wire::GMValue& values);
double firebase_firestore_query_get(std::uint64_t ref, double source, const std::optional<gm::wire::GMFunction>& callback);
std::uint64_t firebase_firestore_query_add_snapshot_listener(std::uint64_t ref, bool include_metadata_changes, const std::optional<gm::wire::GMFunction>& callback);
bool firebase_firestore_query_is_valid(std::uint64_t ref);
void firebase_firestore_query_release(std::uint64_t ref);
double firebase_firestore_write_batch_set(std::uint64_t batch_ref, std::uint64_t document_ref, const gm::wire::GMValue& data);
double firebase_firestore_write_batch_set_merge(std::uint64_t batch_ref, std::uint64_t document_ref, const gm::wire::GMValue& data);
double firebase_firestore_write_batch_set_merge_fields(std::uint64_t batch_ref, std::uint64_t document_ref, const gm::wire::GMValue& data, const gm::wire::GMValue& fields);
double firebase_firestore_write_batch_update(std::uint64_t batch_ref, std::uint64_t document_ref, const gm::wire::GMValue& data);
double firebase_firestore_write_batch_delete(std::uint64_t batch_ref, std::uint64_t document_ref);
double firebase_firestore_write_batch_commit(std::uint64_t batch_ref, const std::optional<gm::wire::GMFunction>& callback);
void firebase_firestore_write_batch_release(std::uint64_t batch_ref);
std::uint64_t firebase_firestore_field_value_delete();
std::uint64_t firebase_firestore_field_value_server_timestamp();
std::uint64_t firebase_firestore_field_value_array_union(const gm::wire::GMValue& values);
std::uint64_t firebase_firestore_field_value_array_remove(const gm::wire::GMValue& values);
std::uint64_t firebase_firestore_field_value_increment_integer(double value);
std::uint64_t firebase_firestore_field_value_increment_double(double value);
std::uint64_t firebase_firestore_field_value_integer(double value);
std::uint64_t firebase_firestore_field_value_double(double value);
std::uint64_t firebase_firestore_field_value_timestamp(double seconds, double nanoseconds);
std::uint64_t firebase_firestore_field_value_geo_point(double latitude, double longitude);
std::uint64_t firebase_firestore_field_value_reference(std::uint64_t document_ref);
std::uint64_t firebase_firestore_field_value_blob(std::string_view data);
std::uint64_t firebase_firestore_field_value_null();
void firebase_firestore_field_value_release(std::uint64_t ref);
gm_structs::FirestoreDocumentSnapshotInfo firebase_firestore_document_snapshot_get_info(std::uint64_t ref);
gm::wire::DataStream firebase_firestore_document_snapshot_get(std::uint64_t ref, std::string_view field, double server_timestamp_behavior);
gm::wire::DataStream firebase_firestore_document_snapshot_get_data(std::uint64_t ref, double server_timestamp_behavior);
void firebase_firestore_document_snapshot_release(std::uint64_t ref);
gm_structs::FirestoreQuerySnapshotInfo firebase_firestore_query_snapshot_get_info(std::uint64_t ref);
gm::wire::DataStream firebase_firestore_query_snapshot_documents(std::uint64_t ref);
gm::wire::DataStream firebase_firestore_query_snapshot_document_changes(std::uint64_t ref, bool include_metadata_changes);
void firebase_firestore_query_snapshot_release(std::uint64_t ref);
void firebase_firestore_listener_registration_remove(std::uint64_t ref);
std::uint64_t firebase_storage_get_instance();
std::uint64_t firebase_storage_get_instance_with_url(std::string_view url);
std::string firebase_storage_url(std::uint64_t storage_ref);
std::uint64_t firebase_storage_get_reference(std::uint64_t storage_ref);
std::uint64_t firebase_storage_get_reference_path(std::uint64_t storage_ref, std::string_view path);
std::uint64_t firebase_storage_get_reference_from_url(std::uint64_t storage_ref, std::string_view url);
double firebase_storage_max_download_retry_time(std::uint64_t storage_ref);
void firebase_storage_set_max_download_retry_time(std::uint64_t storage_ref, double seconds);
double firebase_storage_max_upload_retry_time(std::uint64_t storage_ref);
void firebase_storage_set_max_upload_retry_time(std::uint64_t storage_ref, double seconds);
double firebase_storage_max_operation_retry_time(std::uint64_t storage_ref);
void firebase_storage_set_max_operation_retry_time(std::uint64_t storage_ref, double seconds);
void firebase_storage_use_emulator(std::uint64_t storage_ref, std::string_view host, double port);
std::uint64_t firebase_storage_ref_child(std::uint64_t ref, std::string_view path);
std::uint64_t firebase_storage_ref_get_parent(std::uint64_t ref);
std::string firebase_storage_ref_bucket(std::uint64_t ref);
std::string firebase_storage_ref_full_path(std::uint64_t ref);
std::string firebase_storage_ref_name(std::uint64_t ref);
double firebase_storage_ref_is_valid(std::uint64_t ref);
std::uint64_t firebase_storage_ref_storage(std::uint64_t ref);
double firebase_storage_ref_delete(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_storage_ref_get_download_url(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_storage_ref_get_metadata(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_storage_ref_update_metadata(std::uint64_t ref, std::uint64_t metadata_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_storage_ref_put_bytes(std::uint64_t ref, gm::wire::GMBuffer data, std::uint64_t metadata_ref, const std::optional<gm::wire::GMFunction>& progress_callback, std::uint64_t controller_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_storage_ref_put_file(std::uint64_t ref, std::string_view local_path, std::uint64_t metadata_ref, const std::optional<gm::wire::GMFunction>& progress_callback, std::uint64_t controller_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_storage_ref_get_bytes(std::uint64_t ref, gm::wire::GMBuffer data, const std::optional<gm::wire::GMFunction>& progress_callback, std::uint64_t controller_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_storage_ref_get_file(std::uint64_t ref, std::string_view local_path, const std::optional<gm::wire::GMFunction>& progress_callback, std::uint64_t controller_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_storage_ref_list(std::uint64_t ref, double max_results, std::string_view page_token, const std::optional<gm::wire::GMFunction>& callback);
std::uint64_t firebase_storage_metadata_create();
double firebase_storage_metadata_release(std::uint64_t ref);
double firebase_storage_metadata_is_valid(std::uint64_t ref);
std::string firebase_storage_metadata_bucket(std::uint64_t ref);
std::string firebase_storage_metadata_cache_control(std::uint64_t ref);
void firebase_storage_metadata_set_cache_control(std::uint64_t ref, std::string_view value);
std::string firebase_storage_metadata_content_disposition(std::uint64_t ref);
void firebase_storage_metadata_set_content_disposition(std::uint64_t ref, std::string_view value);
std::string firebase_storage_metadata_content_encoding(std::uint64_t ref);
void firebase_storage_metadata_set_content_encoding(std::uint64_t ref, std::string_view value);
std::string firebase_storage_metadata_content_language(std::uint64_t ref);
void firebase_storage_metadata_set_content_language(std::uint64_t ref, std::string_view value);
std::string firebase_storage_metadata_content_type(std::uint64_t ref);
void firebase_storage_metadata_set_content_type(std::uint64_t ref, std::string_view value);
double firebase_storage_metadata_creation_time(std::uint64_t ref);
double firebase_storage_metadata_generation(std::uint64_t ref);
double firebase_storage_metadata_metadata_generation(std::uint64_t ref);
std::string firebase_storage_metadata_name(std::uint64_t ref);
std::string firebase_storage_metadata_path(std::uint64_t ref);
std::uint64_t firebase_storage_metadata_get_reference(std::uint64_t ref);
double firebase_storage_metadata_size_bytes(std::uint64_t ref);
double firebase_storage_metadata_updated_time(std::uint64_t ref);
double firebase_storage_metadata_custom_metadata_count(std::uint64_t ref);
std::string firebase_storage_metadata_custom_metadata_key_at(std::uint64_t ref, double index);
std::string firebase_storage_metadata_get_custom_metadata(std::uint64_t ref, std::string_view key);
void firebase_storage_metadata_set_custom_metadata(std::uint64_t ref, std::string_view key, std::string_view value);
std::uint64_t firebase_storage_controller_create();
double firebase_storage_controller_release(std::uint64_t ref);
double firebase_storage_controller_is_valid(std::uint64_t ref);
double firebase_storage_controller_pause(std::uint64_t ref);
double firebase_storage_controller_resume(std::uint64_t ref);
double firebase_storage_controller_cancel(std::uint64_t ref);
double firebase_storage_controller_is_paused(std::uint64_t ref);
double firebase_storage_controller_bytes_transferred(std::uint64_t ref);
double firebase_storage_controller_total_byte_count(std::uint64_t ref);
std::uint64_t firebase_storage_controller_get_reference(std::uint64_t ref);
double firebase_storage_list_result_release(std::uint64_t ref);
double firebase_storage_list_result_is_valid(std::uint64_t ref);
double firebase_storage_list_result_item_count(std::uint64_t ref);
std::uint64_t firebase_storage_list_result_item_at(std::uint64_t ref, double index);
double firebase_storage_list_result_prefix_count(std::uint64_t ref);
std::uint64_t firebase_storage_list_result_prefix_at(std::uint64_t ref, double index);
std::string firebase_storage_list_result_next_page_token(std::uint64_t ref);
std::uint64_t firebase_functions_get_instance();
std::uint64_t firebase_functions_get_instance_with_region(std::string_view region);
void firebase_functions_use_functions_emulator(std::uint64_t functions_ref, std::string_view origin);
std::uint64_t firebase_functions_get_https_callable(std::uint64_t functions_ref, std::string_view name);
std::uint64_t firebase_functions_get_https_callable_with_options(std::uint64_t functions_ref, std::string_view name, double limited_use_app_check_token);
std::uint64_t firebase_functions_get_https_callable_from_url(std::uint64_t functions_ref, std::string_view url);
std::uint64_t firebase_functions_get_https_callable_from_url_with_options(std::uint64_t functions_ref, std::string_view url, double limited_use_app_check_token);
double firebase_functions_callable_is_valid(std::uint64_t ref);
double firebase_functions_callable_call(std::uint64_t ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_functions_callable_call_with_data(std::uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback);
std::uint64_t firebase_remote_config_get_instance();
double firebase_remote_config_ensure_initialized(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_remote_config_set_config_settings(std::uint64_t rc_ref, double fetch_timeout_ms, double minimum_fetch_interval_ms, const std::optional<gm::wire::GMFunction>& callback);
double firebase_remote_config_get_config_settings_fetch_timeout(std::uint64_t rc_ref);
double firebase_remote_config_get_config_settings_minimum_fetch_interval(std::uint64_t rc_ref);
double firebase_remote_config_fetch(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_remote_config_fetch_with_expiration(std::uint64_t rc_ref, double cache_expiration_in_seconds, const std::optional<gm::wire::GMFunction>& callback);
double firebase_remote_config_fetch_and_activate(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_remote_config_activate(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_remote_config_get_boolean(std::uint64_t rc_ref, std::string_view key);
double firebase_remote_config_get_long(std::uint64_t rc_ref, std::string_view key);
double firebase_remote_config_get_double(std::uint64_t rc_ref, std::string_view key);
std::string firebase_remote_config_get_string(std::uint64_t rc_ref, std::string_view key);
double firebase_remote_config_get_data_size(std::uint64_t rc_ref, std::string_view key);
double firebase_remote_config_get_data(std::uint64_t rc_ref, std::string_view key, gm::wire::GMBuffer out_buffer);
double firebase_remote_config_get_keys_by_prefix(std::uint64_t rc_ref, std::string_view prefix, const std::optional<gm::wire::GMFunction>& callback);
double firebase_remote_config_get_keys(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_remote_config_get_all(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_remote_config_set_defaults(std::uint64_t rc_ref, const gm::wire::GMValue& defaults, const std::optional<gm::wire::GMFunction>& callback);
gm_structs::FirebaseRemoteConfigInfo firebase_remote_config_get_info(std::uint64_t rc_ref);
std::uint64_t firebase_remote_config_add_config_update_listener(std::uint64_t rc_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_remote_config_remove_config_update_listener(std::uint64_t reg_ref);
double firebase_messaging_initialize();
void firebase_messaging_terminate();
void firebase_messaging_set_token_registration_on_init_enabled(double enabled);
double firebase_messaging_is_token_registration_on_init_enabled();
double firebase_messaging_delivery_metrics_export_to_big_query_enabled();
void firebase_messaging_set_delivery_metrics_export_to_big_query(double enabled);
double firebase_messaging_request_permission(const std::optional<gm::wire::GMFunction>& callback);
double firebase_messaging_get_token(const std::optional<gm::wire::GMFunction>& callback);
double firebase_messaging_delete_token(const std::optional<gm::wire::GMFunction>& callback);
double firebase_messaging_subscribe(std::string_view topic, const std::optional<gm::wire::GMFunction>& callback);
double firebase_messaging_unsubscribe(std::string_view topic, const std::optional<gm::wire::GMFunction>& callback);
double firebase_messaging_poll_message();
double firebase_messaging_poll_token();
std::string firebase_messaging_current_token();
std::string firebase_messaging_message_from();
std::string firebase_messaging_message_to();
std::string firebase_messaging_message_collapse_key();
std::string firebase_messaging_message_message_id();
std::string firebase_messaging_message_message_type();
std::string firebase_messaging_message_priority();
std::string firebase_messaging_message_original_priority();
double firebase_messaging_message_time_to_live();
double firebase_messaging_message_sent_time();
std::string firebase_messaging_message_error();
std::string firebase_messaging_message_error_description();
std::string firebase_messaging_message_link();
double firebase_messaging_message_notification_opened();
double firebase_messaging_message_data_count();
std::string firebase_messaging_message_data_key_at(double index);
std::string firebase_messaging_message_get_data(std::string_view key);
double firebase_messaging_message_raw_data_size();
double firebase_messaging_message_raw_data_copy(gm::wire::GMBuffer out_buffer);
double firebase_messaging_message_has_notification();
std::string firebase_messaging_message_notification_title();
std::string firebase_messaging_message_notification_body();
std::string firebase_messaging_message_notification_icon();
std::string firebase_messaging_message_notification_sound();
std::string firebase_messaging_message_notification_badge();
std::string firebase_messaging_message_notification_tag();
std::string firebase_messaging_message_notification_color();
std::string firebase_messaging_message_notification_click_action();
std::string firebase_messaging_message_notification_body_loc_key();
double firebase_messaging_message_notification_body_loc_args_count();
std::string firebase_messaging_message_notification_body_loc_args_at(double index);
std::string firebase_messaging_message_notification_title_loc_key();
double firebase_messaging_message_notification_title_loc_args_count();
std::string firebase_messaging_message_notification_title_loc_args_at(double index);
std::string firebase_messaging_message_notification_android_channel_id();
std::optional<std::uint64_t> firebase_ump_get_instance();
double firebase_ump_get_consent_status(std::uint64_t consent_ref);
double firebase_ump_get_consent_form_status(std::uint64_t consent_ref);
double firebase_ump_get_privacy_options_requirement_status(std::uint64_t consent_ref);
double firebase_ump_can_request_ads(std::uint64_t consent_ref);
void firebase_ump_reset(std::uint64_t consent_ref);
double firebase_ump_request_consent_info_update(std::uint64_t consent_ref, double debug_geography, double tag_for_under_age_of_consent, const gm::wire::GMValue& debug_device_ids, const std::optional<gm::wire::GMFunction>& callback);
double firebase_ump_load_consent_form(std::uint64_t consent_ref, const std::optional<gm::wire::GMFunction>& callback);
double firebase_ump_show_consent_form(std::uint64_t consent_ref, std::uint64_t form_parent, const std::optional<gm::wire::GMFunction>& callback);
double firebase_ump_load_and_show_consent_form_if_required(std::uint64_t consent_ref, std::uint64_t form_parent, const std::optional<gm::wire::GMFunction>& callback);
double firebase_ump_show_privacy_options_form(std::uint64_t consent_ref, std::uint64_t form_parent, const std::optional<gm::wire::GMFunction>& callback);
