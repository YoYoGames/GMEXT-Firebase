// ##### extgen :: Auto-generated file do not edit!! #####

// #####################################################################
// # Macros
// #####################################################################

// #####################################################################
// # Enums
// #####################################################################

enum FirebaseError
{
    Ok = 0,
    InvalidHandle = -1000,
    NotInitialized = -1001,
    InvalidArgument = -1002,
    Unsupported = -1003
}

enum FirebaseAppCheckError
{
    None = 0,
    ServerUnreachable = 1,
    InvalidConfiguration = 2,
    SystemKeychain = 3,
    UnsupportedProvider = 4,
    Unknown = 5
}

enum FirebaseAppCheckProvider
{
    Debug = 0,
    DeviceCheck = 1,
    PlayIntegrity = 2,
    AppAttest = 3
}

enum FirebaseAuthError
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
    EmailChangeNeedsVerification = 78,
    InvalidEventHandler = 79,
    FederatedProviderAreadyInUse = 80,
    InvalidAuthenticatedUserData = 81,
    FederatedSignInUserInteractionFailure = 82,
    MissingOrInvalidNonce = 83,
    UserCancelled = 84,
    UnsupportedPassthroughOperation = 85,
    TokenRefreshUnavailable = 86
}

enum FirebaseLogLevel
{
    Verbose = 0,
    Debug = 1,
    Info = 2,
    Warning = 3,
    Error = 4,
    Assert = 5
}

enum FirebaseDatabaseError
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
}

enum FirestoreError
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
}

enum FirestoreSource
{
    Default = 0,
    Server = 1,
    Cache = 2
}

enum FirestoreDirection
{
    Ascending = 0,
    Descending = 1
}

enum FirestoreServerTimestampBehavior
{
    None = 0,
    Estimate = 1,
    Previous = 2
}

enum FirestoreDocumentChangeType
{
    Added = 0,
    Modified = 1,
    Removed = 2
}

enum FirestoreLoadBundleTaskState
{
    Error = 0,
    InProgress = 1,
    Success = 2
}

enum FirestoreFieldValueType
{
    Null = 0,
    Boolean = 1,
    Integer = 2,
    Double = 3,
    Timestamp = 4,
    String = 5,
    Blob = 6,
    Reference = 7,
    GeoPoint = 8,
    Array = 9,
    Map = 10,
    Delete = 11,
    ServerTimestamp = 12,
    ArrayUnion = 13,
    ArrayRemove = 14,
    IncrementInteger = 15,
    IncrementDouble = 16
}

enum FirebaseStorageError
{
    None = 0,
    Unknown = 1,
    ObjectNotFound = 2,
    BucketNotFound = 3,
    ProjectNotFound = 4,
    QuotaExceeded = 5,
    Unauthenticated = 6,
    Unauthorized = 7,
    RetryLimitExceeded = 8,
    NonMatchingChecksum = 9,
    DownloadSizeExceeded = 10,
    Cancelled = 11
}

enum FirebaseFunctionsError
{
    None = 0,
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
}

enum FirebaseRemoteConfigLastFetchStatus
{
    Success = 0,
    Failure = 1,
    Pending = 2
}

enum FirebaseRemoteConfigFetchFailureReason
{
    Invalid = 0,
    Throttled = 1,
    Error = 2
}

enum FirebaseRemoteConfigValueSource
{
    StaticValue = 0,
    RemoteValue = 1,
    DefaultValue = 2
}

enum FirebaseRemoteConfigError
{
    Unimplemented = -1,
    None = 0,
    ConfigUpdateStreamError = 1,
    ConfigUpdateMessageInvalid = 2,
    ConfigUpdateNotFetched = 3,
    ConfigUpdateUnavailable = 4
}

enum FirebaseMessagingError
{
    None = 0,
    FailedToRegisterForRemoteNotifications = 1,
    InvalidTopicName = 2,
    NoRegistrationToken = 3,
    Unknown = 4
}

enum FirebaseUmpConsentStatus
{
    Unknown = 0,
    Required = 1,
    NotRequired = 2,
    Obtained = 3
}

enum FirebaseUmpConsentFormStatus
{
    Unknown = 0,
    Unavailable = 1,
    Available = 2
}

enum FirebaseUmpPrivacyOptionsRequirementStatus
{
    Unknown = 0,
    NotRequired = 1,
    Required = 2
}

enum FirebaseUmpConsentDebugGeography
{
    Disabled = 0,
    EEA = 1,
    NonEEA = 2
}

enum FirebaseUmpConsentRequestError
{
    Success = 0,
    InvalidAppId = 1,
    Network = 2,
    Internal = 3,
    Misconfiguration = 4,
    Unknown = 5,
    InvalidOperation = 6,
    OperationInProgress = 7
}

enum FirebaseUmpConsentFormError
{
    Success = 0,
    Timeout = 1,
    Internal = 2,
    Unknown = 3,
    Unavailable = 4,
    AlreadyUsed = 5,
    InvalidOperation = 6,
    OperationInProgress = 7
}

enum FirebaseAnalyticsAppLifecycleState
{
    Unknown = 0,
    Termination = 1
}

enum FirestoreAggregateSource
{
    Server = 0
}

// #####################################################################
// # Constructors
// #####################################################################

/**
 * @returns {Struct.FirebaseAnalyticsParameter}
 */
function FirebaseAnalyticsParameter() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 2925689187;

    self.name = undefined;
    self.value = undefined;

}

/**
 * @returns {Struct.FirebaseAppCheckToken}
 */
function FirebaseAppCheckToken() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 2607280334;

    self.token = undefined;
    self.expire_time_millis = undefined;

}

/**
 * @returns {Struct.FirebaseAuthProviderUserInfo}
 */
function FirebaseAuthProviderUserInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 4291374416;

    self.uid = undefined;
    self.email = undefined;
    self.display_name = undefined;
    self.photo_url = undefined;
    self.provider_id = undefined;
    self.phone_number = undefined;

}

/**
 * @returns {Struct.FirebaseAuthAdditionalUserInfo}
 */
function FirebaseAuthAdditionalUserInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 821614872;

    self.provider_id = undefined;
    self.user_name = undefined;
    self.profile = undefined;
    self.updated_credential = undefined;

}

/**
 * @returns {Struct.FirebaseAuthUserInfo}
 */
function FirebaseAuthUserInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 311442373;

    self.uid = undefined;
    self.email = undefined;
    self.display_name = undefined;
    self.photo_url = undefined;
    self.provider_id = undefined;
    self.phone_number = undefined;
    self.is_email_verified = undefined;
    self.is_anonymous = undefined;
    self.is_valid = undefined;
    self.creation_timestamp = undefined;
    self.last_sign_in_timestamp = undefined;

}

/**
 * @returns {Struct.FirebaseDatabaseReferenceInfo}
 */
function FirebaseDatabaseReferenceInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 3138794886;

    self.key = undefined;
    self.is_root = undefined;
    self.is_valid = undefined;
    self.url = undefined;

}

/**
 * @returns {Struct.FirebaseDataSnapshotInfo}
 */
function FirebaseDataSnapshotInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 3979383028;

    self.key = undefined;
    self.exists = undefined;
    self.is_valid = undefined;
    self.has_children = undefined;
    self.children_count = undefined;

}

/**
 * @returns {Struct.FirebaseMutableDataInfo}
 */
function FirebaseMutableDataInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 1691460014;

    self.key = undefined;
    self.children_count = undefined;

}

/**
 * @returns {Struct.FirestoreTimestamp}
 */
function FirestoreTimestamp() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 2609732746;

    self.seconds = undefined;
    self.nanoseconds = undefined;

}

/**
 * @returns {Struct.FirestoreGeoPoint}
 */
function FirestoreGeoPoint() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 3244324715;

    self.latitude = undefined;
    self.longitude = undefined;

}

/**
 * @returns {Struct.FirestoreBlob}
 */
function FirestoreBlob() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 3490355161;

    self.field_value = undefined;
    self.size = undefined;

}

/**
 * @returns {Struct.FirestoreReference}
 */
function FirestoreReference() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 3319830055;

    self.path = undefined;

}

/**
 * @returns {Struct.FirestoreDocumentChange}
 */
function FirestoreDocumentChange() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 286701835;

    self.type = undefined;
    self.document = undefined;
    self.old_index = undefined;
    self.new_index = undefined;

}

/**
 * @returns {Struct.FirestoreFieldLookup}
 */
function FirestoreFieldLookup() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 2564053480;

    self.exists = undefined;
    self.value = undefined;

}

/**
 * @returns {Struct.FirestoreFieldPathValue}
 */
function FirestoreFieldPathValue() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 696662754;

    self.field_path = undefined;
    self.value = undefined;

}

/**
 * @returns {Struct.FirestoreLoadBundleTaskProgress}
 */
function FirestoreLoadBundleTaskProgress() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 868952080;

    self.documents_loaded = undefined;
    self.total_documents = undefined;
    self.bytes_loaded = undefined;
    self.total_bytes = undefined;
    self.state = undefined;

}

/**
 * @returns {Struct.FirestoreDocumentSnapshotInfo}
 */
function FirestoreDocumentSnapshotInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 1265412019;

    self.exists = undefined;
    self.id = undefined;
    self.has_pending_writes = undefined;
    self.is_from_cache = undefined;

}

/**
 * @returns {Struct.FirestoreQuerySnapshotInfo}
 */
function FirestoreQuerySnapshotInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 1676591002;

    self.size = undefined;
    self.empty = undefined;
    self.has_pending_writes = undefined;
    self.is_from_cache = undefined;

}

/**
 * @returns {Struct.FirebaseRemoteConfigInfo}
 */
function FirebaseRemoteConfigInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 3905783408;

    self.fetch_time = undefined;
    self.last_fetch_status = undefined;
    self.last_fetch_failure_reason = undefined;
    self.throttled_end_time = undefined;

}

/**
 * @returns {Struct.FirebaseRemoteConfigBooleanInfo}
 */
function FirebaseRemoteConfigBooleanInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 2980569540;

    self.value = undefined;
    self.source = undefined;
    self.conversion_successful = undefined;

}

/**
 * @returns {Struct.FirebaseRemoteConfigLongInfo}
 */
function FirebaseRemoteConfigLongInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 516067666;

    self.value = undefined;
    self.source = undefined;
    self.conversion_successful = undefined;

}

/**
 * @returns {Struct.FirebaseRemoteConfigDoubleInfo}
 */
function FirebaseRemoteConfigDoubleInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 1613081497;

    self.value = undefined;
    self.source = undefined;
    self.conversion_successful = undefined;

}

/**
 * @returns {Struct.FirebaseRemoteConfigStringInfo}
 */
function FirebaseRemoteConfigStringInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 1038331485;

    self.value = undefined;
    self.source = undefined;
    self.conversion_successful = undefined;

}

/**
 * @returns {Struct.FirebaseRemoteConfigDataInfo}
 */
function FirebaseRemoteConfigDataInfo() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 2171969480;

    self.bytes_copied = undefined;
    self.size = undefined;
    self.source = undefined;
    self.conversion_successful = undefined;

}

/**
 * @returns {Struct.FirebaseMessagingAndroidNotificationParams}
 */
function FirebaseMessagingAndroidNotificationParams() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 857248506;

    self.channel_id = undefined;

}

/**
 * @returns {Struct.FirebaseAppOptions}
 */
function FirebaseAppOptions() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 1906593923;

    self.app_id = undefined;
    self.api_key = undefined;
    self.messaging_sender_id = undefined;
    self.database_url = undefined;
    self.ga_tracking_id = undefined;
    self.storage_bucket = undefined;
    self.project_id = undefined;

}

/**
 * @returns {Struct.FirebaseAuthResult}
 */
function FirebaseAuthResult() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 1859144699;

    self.user = undefined;
    self.credential = undefined;
    self.additional_user_info = undefined;

}

/**
 * @returns {Struct.FirebaseMessagingNotification}
 */
function FirebaseMessagingNotification() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 987839259;

    self.title = undefined;
    self.body = undefined;
    self.icon = undefined;
    self.sound = undefined;
    self.badge = undefined;
    self.tag = undefined;
    self.color = undefined;
    self.click_action = undefined;
    self.body_loc_key = undefined;
    self.body_loc_args = undefined;
    self.title_loc_key = undefined;
    self.title_loc_args = undefined;
    self.android = undefined;

}

/**
 * @returns {Struct.FirebaseMessagingMessage}
 */
function FirebaseMessagingMessage() constructor
{
    /**
     * Internally generated hash for quick validation
     * @ignore
     */
    static __uid = 1450007171;

    self.from = undefined;
    self.to = undefined;
    self.collapse_key = undefined;
    self.data = undefined;
    self.raw_data = undefined;
    self.raw_data_size = undefined;
    self.message_id = undefined;
    self.message_type = undefined;
    self.priority = undefined;
    self.time_to_live = undefined;
    self.error = undefined;
    self.error_description = undefined;
    self.notification = undefined;
    self.notification_opened = undefined;
    self.link = undefined;
    self.original_priority = undefined;
    self.sent_time = undefined;

}

// #####################################################################
// # Codecs
// #####################################################################

/**
 * @func __FirebaseAnalyticsParameter_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseAnalyticsParameter} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseAnalyticsParameter_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: name, type: String
        if (!is_string(self.name)) show_error($"{_where} :: self.name expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.name));
        buffer_write(_buffer, buffer_string, self.name);

        // field: value, type: Any

        __ext_core_buffer_marshal_value(_buffer, self.value);

    }
}

/**
 * @func __FirebaseAnalyticsParameter_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseAnalyticsParameter}
 * @ignore
 */
function __FirebaseAnalyticsParameter_decode(_buffer, _offset)
{
    var __decoders__ = __GMFirebase_get_decoders();

    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseAnalyticsParameter();
    with (_inst)
    {
        // field: name, type: String
        buffer_read(_buffer, buffer_u32);
        self.name = buffer_read(_buffer, buffer_string);

        // field: value, type: Any
        self.value = __ext_core_buffer_unmarshal_value(_buffer, __decoders__);

    }

    return _inst;
}

/**
 * @func __FirebaseAppCheckToken_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseAppCheckToken} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseAppCheckToken_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: token, type: String
        if (!is_string(self.token)) show_error($"{_where} :: self.token expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.token));
        buffer_write(_buffer, buffer_string, self.token);

        // field: expire_time_millis, type: Float64
        if (!is_numeric(self.expire_time_millis)) show_error($"{_where} :: self.expire_time_millis expected number", true);
        buffer_write(_buffer, buffer_f64, self.expire_time_millis);

    }
}

/**
 * @func __FirebaseAppCheckToken_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseAppCheckToken}
 * @ignore
 */
function __FirebaseAppCheckToken_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseAppCheckToken();
    with (_inst)
    {
        // field: token, type: String
        buffer_read(_buffer, buffer_u32);
        self.token = buffer_read(_buffer, buffer_string);

        // field: expire_time_millis, type: Float64
        self.expire_time_millis = buffer_read(_buffer, buffer_f64);

    }

    return _inst;
}

/**
 * @func __FirebaseAuthProviderUserInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseAuthProviderUserInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseAuthProviderUserInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: uid, type: String
        if (!is_string(self.uid)) show_error($"{_where} :: self.uid expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.uid));
        buffer_write(_buffer, buffer_string, self.uid);

        // field: email, type: String
        if (!is_string(self.email)) show_error($"{_where} :: self.email expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.email));
        buffer_write(_buffer, buffer_string, self.email);

        // field: display_name, type: String
        if (!is_string(self.display_name)) show_error($"{_where} :: self.display_name expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.display_name));
        buffer_write(_buffer, buffer_string, self.display_name);

        // field: photo_url, type: String
        if (!is_string(self.photo_url)) show_error($"{_where} :: self.photo_url expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.photo_url));
        buffer_write(_buffer, buffer_string, self.photo_url);

        // field: provider_id, type: String
        if (!is_string(self.provider_id)) show_error($"{_where} :: self.provider_id expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.provider_id));
        buffer_write(_buffer, buffer_string, self.provider_id);

        // field: phone_number, type: String
        if (!is_string(self.phone_number)) show_error($"{_where} :: self.phone_number expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.phone_number));
        buffer_write(_buffer, buffer_string, self.phone_number);

    }
}

/**
 * @func __FirebaseAuthProviderUserInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseAuthProviderUserInfo}
 * @ignore
 */
function __FirebaseAuthProviderUserInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseAuthProviderUserInfo();
    with (_inst)
    {
        // field: uid, type: String
        buffer_read(_buffer, buffer_u32);
        self.uid = buffer_read(_buffer, buffer_string);

        // field: email, type: String
        buffer_read(_buffer, buffer_u32);
        self.email = buffer_read(_buffer, buffer_string);

        // field: display_name, type: String
        buffer_read(_buffer, buffer_u32);
        self.display_name = buffer_read(_buffer, buffer_string);

        // field: photo_url, type: String
        buffer_read(_buffer, buffer_u32);
        self.photo_url = buffer_read(_buffer, buffer_string);

        // field: provider_id, type: String
        buffer_read(_buffer, buffer_u32);
        self.provider_id = buffer_read(_buffer, buffer_string);

        // field: phone_number, type: String
        buffer_read(_buffer, buffer_u32);
        self.phone_number = buffer_read(_buffer, buffer_string);

    }

    return _inst;
}

/**
 * @func __FirebaseAuthAdditionalUserInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseAuthAdditionalUserInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseAuthAdditionalUserInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: provider_id, type: String
        if (!is_string(self.provider_id)) show_error($"{_where} :: self.provider_id expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.provider_id));
        buffer_write(_buffer, buffer_string, self.provider_id);

        // field: user_name, type: String
        if (!is_string(self.user_name)) show_error($"{_where} :: self.user_name expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.user_name));
        buffer_write(_buffer, buffer_string, self.user_name);

        // field: profile, type: Any

        __ext_core_buffer_marshal_value(_buffer, self.profile);

        // field: updated_credential, type: optional<UInt64>
        if (is_undefined(self.updated_credential))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_numeric(self.updated_credential)) show_error($"{_where} :: self.updated_credential expected number", true);
            buffer_write(_buffer, buffer_u64, self.updated_credential);
        }

    }
}

/**
 * @func __FirebaseAuthAdditionalUserInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseAuthAdditionalUserInfo}
 * @ignore
 */
function __FirebaseAuthAdditionalUserInfo_decode(_buffer, _offset)
{
    var __decoders__ = __GMFirebase_get_decoders();

    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseAuthAdditionalUserInfo();
    with (_inst)
    {
        // field: provider_id, type: String
        buffer_read(_buffer, buffer_u32);
        self.provider_id = buffer_read(_buffer, buffer_string);

        // field: user_name, type: String
        buffer_read(_buffer, buffer_u32);
        self.user_name = buffer_read(_buffer, buffer_string);

        // field: profile, type: Any
        self.profile = __ext_core_buffer_unmarshal_value(_buffer, __decoders__);

        // field: updated_credential, type: optional<UInt64>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.updated_credential = buffer_read(_buffer, buffer_u64);
        }
        else
        {
            self.updated_credential = undefined;
        }

    }

    return _inst;
}

/**
 * @func __FirebaseAuthUserInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseAuthUserInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseAuthUserInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: uid, type: String
        if (!is_string(self.uid)) show_error($"{_where} :: self.uid expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.uid));
        buffer_write(_buffer, buffer_string, self.uid);

        // field: email, type: String
        if (!is_string(self.email)) show_error($"{_where} :: self.email expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.email));
        buffer_write(_buffer, buffer_string, self.email);

        // field: display_name, type: String
        if (!is_string(self.display_name)) show_error($"{_where} :: self.display_name expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.display_name));
        buffer_write(_buffer, buffer_string, self.display_name);

        // field: photo_url, type: String
        if (!is_string(self.photo_url)) show_error($"{_where} :: self.photo_url expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.photo_url));
        buffer_write(_buffer, buffer_string, self.photo_url);

        // field: provider_id, type: String
        if (!is_string(self.provider_id)) show_error($"{_where} :: self.provider_id expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.provider_id));
        buffer_write(_buffer, buffer_string, self.provider_id);

        // field: phone_number, type: String
        if (!is_string(self.phone_number)) show_error($"{_where} :: self.phone_number expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.phone_number));
        buffer_write(_buffer, buffer_string, self.phone_number);

        // field: is_email_verified, type: Bool
        if (!is_bool(self.is_email_verified)) show_error($"{_where} :: self.is_email_verified expected bool", true);
        buffer_write(_buffer, buffer_bool, self.is_email_verified);

        // field: is_anonymous, type: Bool
        if (!is_bool(self.is_anonymous)) show_error($"{_where} :: self.is_anonymous expected bool", true);
        buffer_write(_buffer, buffer_bool, self.is_anonymous);

        // field: is_valid, type: Bool
        if (!is_bool(self.is_valid)) show_error($"{_where} :: self.is_valid expected bool", true);
        buffer_write(_buffer, buffer_bool, self.is_valid);

        // field: creation_timestamp, type: Float64
        if (!is_numeric(self.creation_timestamp)) show_error($"{_where} :: self.creation_timestamp expected number", true);
        buffer_write(_buffer, buffer_f64, self.creation_timestamp);

        // field: last_sign_in_timestamp, type: Float64
        if (!is_numeric(self.last_sign_in_timestamp)) show_error($"{_where} :: self.last_sign_in_timestamp expected number", true);
        buffer_write(_buffer, buffer_f64, self.last_sign_in_timestamp);

    }
}

/**
 * @func __FirebaseAuthUserInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseAuthUserInfo}
 * @ignore
 */
function __FirebaseAuthUserInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseAuthUserInfo();
    with (_inst)
    {
        // field: uid, type: String
        buffer_read(_buffer, buffer_u32);
        self.uid = buffer_read(_buffer, buffer_string);

        // field: email, type: String
        buffer_read(_buffer, buffer_u32);
        self.email = buffer_read(_buffer, buffer_string);

        // field: display_name, type: String
        buffer_read(_buffer, buffer_u32);
        self.display_name = buffer_read(_buffer, buffer_string);

        // field: photo_url, type: String
        buffer_read(_buffer, buffer_u32);
        self.photo_url = buffer_read(_buffer, buffer_string);

        // field: provider_id, type: String
        buffer_read(_buffer, buffer_u32);
        self.provider_id = buffer_read(_buffer, buffer_string);

        // field: phone_number, type: String
        buffer_read(_buffer, buffer_u32);
        self.phone_number = buffer_read(_buffer, buffer_string);

        // field: is_email_verified, type: Bool
        self.is_email_verified = buffer_read(_buffer, buffer_bool);

        // field: is_anonymous, type: Bool
        self.is_anonymous = buffer_read(_buffer, buffer_bool);

        // field: is_valid, type: Bool
        self.is_valid = buffer_read(_buffer, buffer_bool);

        // field: creation_timestamp, type: Float64
        self.creation_timestamp = buffer_read(_buffer, buffer_f64);

        // field: last_sign_in_timestamp, type: Float64
        self.last_sign_in_timestamp = buffer_read(_buffer, buffer_f64);

    }

    return _inst;
}

/**
 * @func __FirebaseDatabaseReferenceInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseDatabaseReferenceInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseDatabaseReferenceInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: key, type: String
        if (!is_string(self.key)) show_error($"{_where} :: self.key expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.key));
        buffer_write(_buffer, buffer_string, self.key);

        // field: is_root, type: Bool
        if (!is_bool(self.is_root)) show_error($"{_where} :: self.is_root expected bool", true);
        buffer_write(_buffer, buffer_bool, self.is_root);

        // field: is_valid, type: Bool
        if (!is_bool(self.is_valid)) show_error($"{_where} :: self.is_valid expected bool", true);
        buffer_write(_buffer, buffer_bool, self.is_valid);

        // field: url, type: String
        if (!is_string(self.url)) show_error($"{_where} :: self.url expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.url));
        buffer_write(_buffer, buffer_string, self.url);

    }
}

/**
 * @func __FirebaseDatabaseReferenceInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseDatabaseReferenceInfo}
 * @ignore
 */
function __FirebaseDatabaseReferenceInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseDatabaseReferenceInfo();
    with (_inst)
    {
        // field: key, type: String
        buffer_read(_buffer, buffer_u32);
        self.key = buffer_read(_buffer, buffer_string);

        // field: is_root, type: Bool
        self.is_root = buffer_read(_buffer, buffer_bool);

        // field: is_valid, type: Bool
        self.is_valid = buffer_read(_buffer, buffer_bool);

        // field: url, type: String
        buffer_read(_buffer, buffer_u32);
        self.url = buffer_read(_buffer, buffer_string);

    }

    return _inst;
}

/**
 * @func __FirebaseDataSnapshotInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseDataSnapshotInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseDataSnapshotInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: key, type: String
        if (!is_string(self.key)) show_error($"{_where} :: self.key expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.key));
        buffer_write(_buffer, buffer_string, self.key);

        // field: exists, type: Bool
        if (!is_bool(self.exists)) show_error($"{_where} :: self.exists expected bool", true);
        buffer_write(_buffer, buffer_bool, self.exists);

        // field: is_valid, type: Bool
        if (!is_bool(self.is_valid)) show_error($"{_where} :: self.is_valid expected bool", true);
        buffer_write(_buffer, buffer_bool, self.is_valid);

        // field: has_children, type: Bool
        if (!is_bool(self.has_children)) show_error($"{_where} :: self.has_children expected bool", true);
        buffer_write(_buffer, buffer_bool, self.has_children);

        // field: children_count, type: Float64
        if (!is_numeric(self.children_count)) show_error($"{_where} :: self.children_count expected number", true);
        buffer_write(_buffer, buffer_f64, self.children_count);

    }
}

/**
 * @func __FirebaseDataSnapshotInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseDataSnapshotInfo}
 * @ignore
 */
function __FirebaseDataSnapshotInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseDataSnapshotInfo();
    with (_inst)
    {
        // field: key, type: String
        buffer_read(_buffer, buffer_u32);
        self.key = buffer_read(_buffer, buffer_string);

        // field: exists, type: Bool
        self.exists = buffer_read(_buffer, buffer_bool);

        // field: is_valid, type: Bool
        self.is_valid = buffer_read(_buffer, buffer_bool);

        // field: has_children, type: Bool
        self.has_children = buffer_read(_buffer, buffer_bool);

        // field: children_count, type: Float64
        self.children_count = buffer_read(_buffer, buffer_f64);

    }

    return _inst;
}

/**
 * @func __FirebaseMutableDataInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseMutableDataInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseMutableDataInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: key, type: String
        if (!is_string(self.key)) show_error($"{_where} :: self.key expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.key));
        buffer_write(_buffer, buffer_string, self.key);

        // field: children_count, type: Float64
        if (!is_numeric(self.children_count)) show_error($"{_where} :: self.children_count expected number", true);
        buffer_write(_buffer, buffer_f64, self.children_count);

    }
}

/**
 * @func __FirebaseMutableDataInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseMutableDataInfo}
 * @ignore
 */
function __FirebaseMutableDataInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseMutableDataInfo();
    with (_inst)
    {
        // field: key, type: String
        buffer_read(_buffer, buffer_u32);
        self.key = buffer_read(_buffer, buffer_string);

        // field: children_count, type: Float64
        self.children_count = buffer_read(_buffer, buffer_f64);

    }

    return _inst;
}

/**
 * @func __FirestoreTimestamp_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirestoreTimestamp} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirestoreTimestamp_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: seconds, type: Float64
        if (!is_numeric(self.seconds)) show_error($"{_where} :: self.seconds expected number", true);
        buffer_write(_buffer, buffer_f64, self.seconds);

        // field: nanoseconds, type: Float64
        if (!is_numeric(self.nanoseconds)) show_error($"{_where} :: self.nanoseconds expected number", true);
        buffer_write(_buffer, buffer_f64, self.nanoseconds);

    }
}

/**
 * @func __FirestoreTimestamp_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirestoreTimestamp}
 * @ignore
 */
function __FirestoreTimestamp_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirestoreTimestamp();
    with (_inst)
    {
        // field: seconds, type: Float64
        self.seconds = buffer_read(_buffer, buffer_f64);

        // field: nanoseconds, type: Float64
        self.nanoseconds = buffer_read(_buffer, buffer_f64);

    }

    return _inst;
}

/**
 * @func __FirestoreGeoPoint_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirestoreGeoPoint} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirestoreGeoPoint_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: latitude, type: Float64
        if (!is_numeric(self.latitude)) show_error($"{_where} :: self.latitude expected number", true);
        buffer_write(_buffer, buffer_f64, self.latitude);

        // field: longitude, type: Float64
        if (!is_numeric(self.longitude)) show_error($"{_where} :: self.longitude expected number", true);
        buffer_write(_buffer, buffer_f64, self.longitude);

    }
}

/**
 * @func __FirestoreGeoPoint_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirestoreGeoPoint}
 * @ignore
 */
function __FirestoreGeoPoint_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirestoreGeoPoint();
    with (_inst)
    {
        // field: latitude, type: Float64
        self.latitude = buffer_read(_buffer, buffer_f64);

        // field: longitude, type: Float64
        self.longitude = buffer_read(_buffer, buffer_f64);

    }

    return _inst;
}

/**
 * @func __FirestoreBlob_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirestoreBlob} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirestoreBlob_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: field_value, type: UInt64
        if (!is_numeric(self.field_value)) show_error($"{_where} :: self.field_value expected number", true);
        buffer_write(_buffer, buffer_u64, self.field_value);

        // field: size, type: Float64
        if (!is_numeric(self.size)) show_error($"{_where} :: self.size expected number", true);
        buffer_write(_buffer, buffer_f64, self.size);

    }
}

/**
 * @func __FirestoreBlob_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirestoreBlob}
 * @ignore
 */
function __FirestoreBlob_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirestoreBlob();
    with (_inst)
    {
        // field: field_value, type: UInt64
        self.field_value = buffer_read(_buffer, buffer_u64);

        // field: size, type: Float64
        self.size = buffer_read(_buffer, buffer_f64);

    }

    return _inst;
}

/**
 * @func __FirestoreReference_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirestoreReference} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirestoreReference_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: path, type: String
        if (!is_string(self.path)) show_error($"{_where} :: self.path expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.path));
        buffer_write(_buffer, buffer_string, self.path);

    }
}

/**
 * @func __FirestoreReference_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirestoreReference}
 * @ignore
 */
function __FirestoreReference_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirestoreReference();
    with (_inst)
    {
        // field: path, type: String
        buffer_read(_buffer, buffer_u32);
        self.path = buffer_read(_buffer, buffer_string);

    }

    return _inst;
}

/**
 * @func __FirestoreDocumentChange_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirestoreDocumentChange} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirestoreDocumentChange_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: type, type: enum FirestoreDocumentChangeType

        if (!is_numeric(self.type)) show_error($"{_where} :: self.type expected number", true);
        buffer_write(_buffer, buffer_u64, self.type);

        // field: document, type: UInt64
        if (!is_numeric(self.document)) show_error($"{_where} :: self.document expected number", true);
        buffer_write(_buffer, buffer_u64, self.document);

        // field: old_index, type: Float64
        if (!is_numeric(self.old_index)) show_error($"{_where} :: self.old_index expected number", true);
        buffer_write(_buffer, buffer_f64, self.old_index);

        // field: new_index, type: Float64
        if (!is_numeric(self.new_index)) show_error($"{_where} :: self.new_index expected number", true);
        buffer_write(_buffer, buffer_f64, self.new_index);

    }
}

/**
 * @func __FirestoreDocumentChange_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirestoreDocumentChange}
 * @ignore
 */
function __FirestoreDocumentChange_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirestoreDocumentChange();
    with (_inst)
    {
        // field: type, type: enum FirestoreDocumentChangeType
        self.type = buffer_read(_buffer, buffer_u64);

        // field: document, type: UInt64
        self.document = buffer_read(_buffer, buffer_u64);

        // field: old_index, type: Float64
        self.old_index = buffer_read(_buffer, buffer_f64);

        // field: new_index, type: Float64
        self.new_index = buffer_read(_buffer, buffer_f64);

    }

    return _inst;
}

/**
 * @func __FirestoreFieldLookup_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirestoreFieldLookup} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirestoreFieldLookup_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: exists, type: Bool
        if (!is_bool(self.exists)) show_error($"{_where} :: self.exists expected bool", true);
        buffer_write(_buffer, buffer_bool, self.exists);

        // field: value, type: Any

        __ext_core_buffer_marshal_value(_buffer, self.value);

    }
}

/**
 * @func __FirestoreFieldLookup_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirestoreFieldLookup}
 * @ignore
 */
function __FirestoreFieldLookup_decode(_buffer, _offset)
{
    var __decoders__ = __GMFirebase_get_decoders();

    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirestoreFieldLookup();
    with (_inst)
    {
        // field: exists, type: Bool
        self.exists = buffer_read(_buffer, buffer_bool);

        // field: value, type: Any
        self.value = __ext_core_buffer_unmarshal_value(_buffer, __decoders__);

    }

    return _inst;
}

/**
 * @func __FirestoreFieldPathValue_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirestoreFieldPathValue} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirestoreFieldPathValue_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: field_path, type: UInt64
        if (!is_numeric(self.field_path)) show_error($"{_where} :: self.field_path expected number", true);
        buffer_write(_buffer, buffer_u64, self.field_path);

        // field: value, type: Any

        __ext_core_buffer_marshal_value(_buffer, self.value);

    }
}

/**
 * @func __FirestoreFieldPathValue_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirestoreFieldPathValue}
 * @ignore
 */
function __FirestoreFieldPathValue_decode(_buffer, _offset)
{
    var __decoders__ = __GMFirebase_get_decoders();

    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirestoreFieldPathValue();
    with (_inst)
    {
        // field: field_path, type: UInt64
        self.field_path = buffer_read(_buffer, buffer_u64);

        // field: value, type: Any
        self.value = __ext_core_buffer_unmarshal_value(_buffer, __decoders__);

    }

    return _inst;
}

/**
 * @func __FirestoreLoadBundleTaskProgress_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirestoreLoadBundleTaskProgress} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirestoreLoadBundleTaskProgress_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: documents_loaded, type: Float64
        if (!is_numeric(self.documents_loaded)) show_error($"{_where} :: self.documents_loaded expected number", true);
        buffer_write(_buffer, buffer_f64, self.documents_loaded);

        // field: total_documents, type: Float64
        if (!is_numeric(self.total_documents)) show_error($"{_where} :: self.total_documents expected number", true);
        buffer_write(_buffer, buffer_f64, self.total_documents);

        // field: bytes_loaded, type: Float64
        if (!is_numeric(self.bytes_loaded)) show_error($"{_where} :: self.bytes_loaded expected number", true);
        buffer_write(_buffer, buffer_f64, self.bytes_loaded);

        // field: total_bytes, type: Float64
        if (!is_numeric(self.total_bytes)) show_error($"{_where} :: self.total_bytes expected number", true);
        buffer_write(_buffer, buffer_f64, self.total_bytes);

        // field: state, type: enum FirestoreLoadBundleTaskState

        if (!is_numeric(self.state)) show_error($"{_where} :: self.state expected number", true);
        buffer_write(_buffer, buffer_u64, self.state);

    }
}

/**
 * @func __FirestoreLoadBundleTaskProgress_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirestoreLoadBundleTaskProgress}
 * @ignore
 */
function __FirestoreLoadBundleTaskProgress_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirestoreLoadBundleTaskProgress();
    with (_inst)
    {
        // field: documents_loaded, type: Float64
        self.documents_loaded = buffer_read(_buffer, buffer_f64);

        // field: total_documents, type: Float64
        self.total_documents = buffer_read(_buffer, buffer_f64);

        // field: bytes_loaded, type: Float64
        self.bytes_loaded = buffer_read(_buffer, buffer_f64);

        // field: total_bytes, type: Float64
        self.total_bytes = buffer_read(_buffer, buffer_f64);

        // field: state, type: enum FirestoreLoadBundleTaskState
        self.state = buffer_read(_buffer, buffer_u64);

    }

    return _inst;
}

/**
 * @func __FirestoreDocumentSnapshotInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirestoreDocumentSnapshotInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirestoreDocumentSnapshotInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: exists, type: Bool
        if (!is_bool(self.exists)) show_error($"{_where} :: self.exists expected bool", true);
        buffer_write(_buffer, buffer_bool, self.exists);

        // field: id, type: String
        if (!is_string(self.id)) show_error($"{_where} :: self.id expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.id));
        buffer_write(_buffer, buffer_string, self.id);

        // field: has_pending_writes, type: Bool
        if (!is_bool(self.has_pending_writes)) show_error($"{_where} :: self.has_pending_writes expected bool", true);
        buffer_write(_buffer, buffer_bool, self.has_pending_writes);

        // field: is_from_cache, type: Bool
        if (!is_bool(self.is_from_cache)) show_error($"{_where} :: self.is_from_cache expected bool", true);
        buffer_write(_buffer, buffer_bool, self.is_from_cache);

    }
}

/**
 * @func __FirestoreDocumentSnapshotInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirestoreDocumentSnapshotInfo}
 * @ignore
 */
function __FirestoreDocumentSnapshotInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirestoreDocumentSnapshotInfo();
    with (_inst)
    {
        // field: exists, type: Bool
        self.exists = buffer_read(_buffer, buffer_bool);

        // field: id, type: String
        buffer_read(_buffer, buffer_u32);
        self.id = buffer_read(_buffer, buffer_string);

        // field: has_pending_writes, type: Bool
        self.has_pending_writes = buffer_read(_buffer, buffer_bool);

        // field: is_from_cache, type: Bool
        self.is_from_cache = buffer_read(_buffer, buffer_bool);

    }

    return _inst;
}

/**
 * @func __FirestoreQuerySnapshotInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirestoreQuerySnapshotInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirestoreQuerySnapshotInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: size, type: Float64
        if (!is_numeric(self.size)) show_error($"{_where} :: self.size expected number", true);
        buffer_write(_buffer, buffer_f64, self.size);

        // field: empty, type: Bool
        if (!is_bool(self.empty)) show_error($"{_where} :: self.empty expected bool", true);
        buffer_write(_buffer, buffer_bool, self.empty);

        // field: has_pending_writes, type: Bool
        if (!is_bool(self.has_pending_writes)) show_error($"{_where} :: self.has_pending_writes expected bool", true);
        buffer_write(_buffer, buffer_bool, self.has_pending_writes);

        // field: is_from_cache, type: Bool
        if (!is_bool(self.is_from_cache)) show_error($"{_where} :: self.is_from_cache expected bool", true);
        buffer_write(_buffer, buffer_bool, self.is_from_cache);

    }
}

/**
 * @func __FirestoreQuerySnapshotInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirestoreQuerySnapshotInfo}
 * @ignore
 */
function __FirestoreQuerySnapshotInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirestoreQuerySnapshotInfo();
    with (_inst)
    {
        // field: size, type: Float64
        self.size = buffer_read(_buffer, buffer_f64);

        // field: empty, type: Bool
        self.empty = buffer_read(_buffer, buffer_bool);

        // field: has_pending_writes, type: Bool
        self.has_pending_writes = buffer_read(_buffer, buffer_bool);

        // field: is_from_cache, type: Bool
        self.is_from_cache = buffer_read(_buffer, buffer_bool);

    }

    return _inst;
}

/**
 * @func __FirebaseRemoteConfigInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseRemoteConfigInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseRemoteConfigInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: fetch_time, type: Float64
        if (!is_numeric(self.fetch_time)) show_error($"{_where} :: self.fetch_time expected number", true);
        buffer_write(_buffer, buffer_f64, self.fetch_time);

        // field: last_fetch_status, type: enum FirebaseRemoteConfigLastFetchStatus

        if (!is_numeric(self.last_fetch_status)) show_error($"{_where} :: self.last_fetch_status expected number", true);
        buffer_write(_buffer, buffer_u64, self.last_fetch_status);

        // field: last_fetch_failure_reason, type: enum FirebaseRemoteConfigFetchFailureReason

        if (!is_numeric(self.last_fetch_failure_reason)) show_error($"{_where} :: self.last_fetch_failure_reason expected number", true);
        buffer_write(_buffer, buffer_u64, self.last_fetch_failure_reason);

        // field: throttled_end_time, type: Float64
        if (!is_numeric(self.throttled_end_time)) show_error($"{_where} :: self.throttled_end_time expected number", true);
        buffer_write(_buffer, buffer_f64, self.throttled_end_time);

    }
}

/**
 * @func __FirebaseRemoteConfigInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseRemoteConfigInfo}
 * @ignore
 */
function __FirebaseRemoteConfigInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseRemoteConfigInfo();
    with (_inst)
    {
        // field: fetch_time, type: Float64
        self.fetch_time = buffer_read(_buffer, buffer_f64);

        // field: last_fetch_status, type: enum FirebaseRemoteConfigLastFetchStatus
        self.last_fetch_status = buffer_read(_buffer, buffer_u64);

        // field: last_fetch_failure_reason, type: enum FirebaseRemoteConfigFetchFailureReason
        self.last_fetch_failure_reason = buffer_read(_buffer, buffer_u64);

        // field: throttled_end_time, type: Float64
        self.throttled_end_time = buffer_read(_buffer, buffer_f64);

    }

    return _inst;
}

/**
 * @func __FirebaseRemoteConfigBooleanInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseRemoteConfigBooleanInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseRemoteConfigBooleanInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: value, type: Bool
        if (!is_bool(self.value)) show_error($"{_where} :: self.value expected bool", true);
        buffer_write(_buffer, buffer_bool, self.value);

        // field: source, type: enum FirebaseRemoteConfigValueSource

        if (!is_numeric(self.source)) show_error($"{_where} :: self.source expected number", true);
        buffer_write(_buffer, buffer_u64, self.source);

        // field: conversion_successful, type: Bool
        if (!is_bool(self.conversion_successful)) show_error($"{_where} :: self.conversion_successful expected bool", true);
        buffer_write(_buffer, buffer_bool, self.conversion_successful);

    }
}

/**
 * @func __FirebaseRemoteConfigBooleanInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseRemoteConfigBooleanInfo}
 * @ignore
 */
function __FirebaseRemoteConfigBooleanInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseRemoteConfigBooleanInfo();
    with (_inst)
    {
        // field: value, type: Bool
        self.value = buffer_read(_buffer, buffer_bool);

        // field: source, type: enum FirebaseRemoteConfigValueSource
        self.source = buffer_read(_buffer, buffer_u64);

        // field: conversion_successful, type: Bool
        self.conversion_successful = buffer_read(_buffer, buffer_bool);

    }

    return _inst;
}

/**
 * @func __FirebaseRemoteConfigLongInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseRemoteConfigLongInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseRemoteConfigLongInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: value, type: Float64
        if (!is_numeric(self.value)) show_error($"{_where} :: self.value expected number", true);
        buffer_write(_buffer, buffer_f64, self.value);

        // field: source, type: enum FirebaseRemoteConfigValueSource

        if (!is_numeric(self.source)) show_error($"{_where} :: self.source expected number", true);
        buffer_write(_buffer, buffer_u64, self.source);

        // field: conversion_successful, type: Bool
        if (!is_bool(self.conversion_successful)) show_error($"{_where} :: self.conversion_successful expected bool", true);
        buffer_write(_buffer, buffer_bool, self.conversion_successful);

    }
}

/**
 * @func __FirebaseRemoteConfigLongInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseRemoteConfigLongInfo}
 * @ignore
 */
function __FirebaseRemoteConfigLongInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseRemoteConfigLongInfo();
    with (_inst)
    {
        // field: value, type: Float64
        self.value = buffer_read(_buffer, buffer_f64);

        // field: source, type: enum FirebaseRemoteConfigValueSource
        self.source = buffer_read(_buffer, buffer_u64);

        // field: conversion_successful, type: Bool
        self.conversion_successful = buffer_read(_buffer, buffer_bool);

    }

    return _inst;
}

/**
 * @func __FirebaseRemoteConfigDoubleInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseRemoteConfigDoubleInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseRemoteConfigDoubleInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: value, type: Float64
        if (!is_numeric(self.value)) show_error($"{_where} :: self.value expected number", true);
        buffer_write(_buffer, buffer_f64, self.value);

        // field: source, type: enum FirebaseRemoteConfigValueSource

        if (!is_numeric(self.source)) show_error($"{_where} :: self.source expected number", true);
        buffer_write(_buffer, buffer_u64, self.source);

        // field: conversion_successful, type: Bool
        if (!is_bool(self.conversion_successful)) show_error($"{_where} :: self.conversion_successful expected bool", true);
        buffer_write(_buffer, buffer_bool, self.conversion_successful);

    }
}

/**
 * @func __FirebaseRemoteConfigDoubleInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseRemoteConfigDoubleInfo}
 * @ignore
 */
function __FirebaseRemoteConfigDoubleInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseRemoteConfigDoubleInfo();
    with (_inst)
    {
        // field: value, type: Float64
        self.value = buffer_read(_buffer, buffer_f64);

        // field: source, type: enum FirebaseRemoteConfigValueSource
        self.source = buffer_read(_buffer, buffer_u64);

        // field: conversion_successful, type: Bool
        self.conversion_successful = buffer_read(_buffer, buffer_bool);

    }

    return _inst;
}

/**
 * @func __FirebaseRemoteConfigStringInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseRemoteConfigStringInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseRemoteConfigStringInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: value, type: String
        if (!is_string(self.value)) show_error($"{_where} :: self.value expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.value));
        buffer_write(_buffer, buffer_string, self.value);

        // field: source, type: enum FirebaseRemoteConfigValueSource

        if (!is_numeric(self.source)) show_error($"{_where} :: self.source expected number", true);
        buffer_write(_buffer, buffer_u64, self.source);

        // field: conversion_successful, type: Bool
        if (!is_bool(self.conversion_successful)) show_error($"{_where} :: self.conversion_successful expected bool", true);
        buffer_write(_buffer, buffer_bool, self.conversion_successful);

    }
}

/**
 * @func __FirebaseRemoteConfigStringInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseRemoteConfigStringInfo}
 * @ignore
 */
function __FirebaseRemoteConfigStringInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseRemoteConfigStringInfo();
    with (_inst)
    {
        // field: value, type: String
        buffer_read(_buffer, buffer_u32);
        self.value = buffer_read(_buffer, buffer_string);

        // field: source, type: enum FirebaseRemoteConfigValueSource
        self.source = buffer_read(_buffer, buffer_u64);

        // field: conversion_successful, type: Bool
        self.conversion_successful = buffer_read(_buffer, buffer_bool);

    }

    return _inst;
}

/**
 * @func __FirebaseRemoteConfigDataInfo_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseRemoteConfigDataInfo} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseRemoteConfigDataInfo_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: bytes_copied, type: Float64
        if (!is_numeric(self.bytes_copied)) show_error($"{_where} :: self.bytes_copied expected number", true);
        buffer_write(_buffer, buffer_f64, self.bytes_copied);

        // field: size, type: Float64
        if (!is_numeric(self.size)) show_error($"{_where} :: self.size expected number", true);
        buffer_write(_buffer, buffer_f64, self.size);

        // field: source, type: enum FirebaseRemoteConfigValueSource

        if (!is_numeric(self.source)) show_error($"{_where} :: self.source expected number", true);
        buffer_write(_buffer, buffer_u64, self.source);

        // field: conversion_successful, type: Bool
        if (!is_bool(self.conversion_successful)) show_error($"{_where} :: self.conversion_successful expected bool", true);
        buffer_write(_buffer, buffer_bool, self.conversion_successful);

    }
}

/**
 * @func __FirebaseRemoteConfigDataInfo_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseRemoteConfigDataInfo}
 * @ignore
 */
function __FirebaseRemoteConfigDataInfo_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseRemoteConfigDataInfo();
    with (_inst)
    {
        // field: bytes_copied, type: Float64
        self.bytes_copied = buffer_read(_buffer, buffer_f64);

        // field: size, type: Float64
        self.size = buffer_read(_buffer, buffer_f64);

        // field: source, type: enum FirebaseRemoteConfigValueSource
        self.source = buffer_read(_buffer, buffer_u64);

        // field: conversion_successful, type: Bool
        self.conversion_successful = buffer_read(_buffer, buffer_bool);

    }

    return _inst;
}

/**
 * @func __FirebaseMessagingAndroidNotificationParams_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseMessagingAndroidNotificationParams} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseMessagingAndroidNotificationParams_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: channel_id, type: String
        if (!is_string(self.channel_id)) show_error($"{_where} :: self.channel_id expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.channel_id));
        buffer_write(_buffer, buffer_string, self.channel_id);

    }
}

/**
 * @func __FirebaseMessagingAndroidNotificationParams_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseMessagingAndroidNotificationParams}
 * @ignore
 */
function __FirebaseMessagingAndroidNotificationParams_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseMessagingAndroidNotificationParams();
    with (_inst)
    {
        // field: channel_id, type: String
        buffer_read(_buffer, buffer_u32);
        self.channel_id = buffer_read(_buffer, buffer_string);

    }

    return _inst;
}

/**
 * @func __FirebaseAppOptions_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseAppOptions} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseAppOptions_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: app_id, type: optional<String>
        if (is_undefined(self.app_id))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.app_id)) show_error($"{_where} :: self.app_id expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.app_id));
            buffer_write(_buffer, buffer_string, self.app_id);
        }

        // field: api_key, type: optional<String>
        if (is_undefined(self.api_key))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.api_key)) show_error($"{_where} :: self.api_key expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.api_key));
            buffer_write(_buffer, buffer_string, self.api_key);
        }

        // field: messaging_sender_id, type: optional<String>
        if (is_undefined(self.messaging_sender_id))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.messaging_sender_id)) show_error($"{_where} :: self.messaging_sender_id expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.messaging_sender_id));
            buffer_write(_buffer, buffer_string, self.messaging_sender_id);
        }

        // field: database_url, type: optional<String>
        if (is_undefined(self.database_url))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.database_url)) show_error($"{_where} :: self.database_url expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.database_url));
            buffer_write(_buffer, buffer_string, self.database_url);
        }

        // field: ga_tracking_id, type: optional<String>
        if (is_undefined(self.ga_tracking_id))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.ga_tracking_id)) show_error($"{_where} :: self.ga_tracking_id expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.ga_tracking_id));
            buffer_write(_buffer, buffer_string, self.ga_tracking_id);
        }

        // field: storage_bucket, type: optional<String>
        if (is_undefined(self.storage_bucket))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.storage_bucket)) show_error($"{_where} :: self.storage_bucket expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.storage_bucket));
            buffer_write(_buffer, buffer_string, self.storage_bucket);
        }

        // field: project_id, type: optional<String>
        if (is_undefined(self.project_id))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_string(self.project_id)) show_error($"{_where} :: self.project_id expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.project_id));
            buffer_write(_buffer, buffer_string, self.project_id);
        }

    }
}

/**
 * @func __FirebaseAppOptions_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseAppOptions}
 * @ignore
 */
function __FirebaseAppOptions_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseAppOptions();
    with (_inst)
    {
        // field: app_id, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.app_id = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.app_id = undefined;
        }

        // field: api_key, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.api_key = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.api_key = undefined;
        }

        // field: messaging_sender_id, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.messaging_sender_id = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.messaging_sender_id = undefined;
        }

        // field: database_url, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.database_url = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.database_url = undefined;
        }

        // field: ga_tracking_id, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.ga_tracking_id = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.ga_tracking_id = undefined;
        }

        // field: storage_bucket, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.storage_bucket = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.storage_bucket = undefined;
        }

        // field: project_id, type: optional<String>
        if (buffer_read(_buffer, buffer_bool))
        {
            buffer_read(_buffer, buffer_u32);
            self.project_id = buffer_read(_buffer, buffer_string);
        }
        else
        {
            self.project_id = undefined;
        }

    }

    return _inst;
}

/**
 * @func __FirebaseAuthResult_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseAuthResult} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseAuthResult_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: user, type: optional<UInt64>
        if (is_undefined(self.user))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_numeric(self.user)) show_error($"{_where} :: self.user expected number", true);
            buffer_write(_buffer, buffer_u64, self.user);
        }

        // field: credential, type: optional<UInt64>
        if (is_undefined(self.credential))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_numeric(self.credential)) show_error($"{_where} :: self.credential expected number", true);
            buffer_write(_buffer, buffer_u64, self.credential);
        }

        // field: additional_user_info, type: struct FirebaseAuthAdditionalUserInfo
        if (self.additional_user_info.__uid != 821614872) show_error($"{_where} :: self.additional_user_info expected FirebaseAuthAdditionalUserInfo", true);
        __FirebaseAuthAdditionalUserInfo_encode(self.additional_user_info, _buffer, buffer_tell(_buffer), _where);

    }
}

/**
 * @func __FirebaseAuthResult_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseAuthResult}
 * @ignore
 */
function __FirebaseAuthResult_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseAuthResult();
    with (_inst)
    {
        // field: user, type: optional<UInt64>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.user = buffer_read(_buffer, buffer_u64);
        }
        else
        {
            self.user = undefined;
        }

        // field: credential, type: optional<UInt64>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.credential = buffer_read(_buffer, buffer_u64);
        }
        else
        {
            self.credential = undefined;
        }

        // field: additional_user_info, type: struct FirebaseAuthAdditionalUserInfo
        self.additional_user_info = __FirebaseAuthAdditionalUserInfo_decode(_buffer, buffer_tell(_buffer));

    }

    return _inst;
}

/**
 * @func __FirebaseMessagingNotification_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseMessagingNotification} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseMessagingNotification_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: title, type: String
        if (!is_string(self.title)) show_error($"{_where} :: self.title expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.title));
        buffer_write(_buffer, buffer_string, self.title);

        // field: body, type: String
        if (!is_string(self.body)) show_error($"{_where} :: self.body expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.body));
        buffer_write(_buffer, buffer_string, self.body);

        // field: icon, type: String
        if (!is_string(self.icon)) show_error($"{_where} :: self.icon expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.icon));
        buffer_write(_buffer, buffer_string, self.icon);

        // field: sound, type: String
        if (!is_string(self.sound)) show_error($"{_where} :: self.sound expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.sound));
        buffer_write(_buffer, buffer_string, self.sound);

        // field: badge, type: String
        if (!is_string(self.badge)) show_error($"{_where} :: self.badge expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.badge));
        buffer_write(_buffer, buffer_string, self.badge);

        // field: tag, type: String
        if (!is_string(self.tag)) show_error($"{_where} :: self.tag expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.tag));
        buffer_write(_buffer, buffer_string, self.tag);

        // field: color, type: String
        if (!is_string(self.color)) show_error($"{_where} :: self.color expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.color));
        buffer_write(_buffer, buffer_string, self.color);

        // field: click_action, type: String
        if (!is_string(self.click_action)) show_error($"{_where} :: self.click_action expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.click_action));
        buffer_write(_buffer, buffer_string, self.click_action);

        // field: body_loc_key, type: String
        if (!is_string(self.body_loc_key)) show_error($"{_where} :: self.body_loc_key expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.body_loc_key));
        buffer_write(_buffer, buffer_string, self.body_loc_key);

        // field: body_loc_args, type: String[]
        if (!is_array(self.body_loc_args)) show_error($"{_where} :: self.body_loc_args expected array", true);
        var __length__ = array_length(self.body_loc_args);
        buffer_write(_buffer, buffer_u32, __length__);
        for (var _i = 0; _i < __length__; ++_i)
        {
            if (!is_string(self.body_loc_args[_i])) show_error($"{_where} :: self.body_loc_args[_i] expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.body_loc_args[_i]));
            buffer_write(_buffer, buffer_string, self.body_loc_args[_i]);
        }

        // field: title_loc_key, type: String
        if (!is_string(self.title_loc_key)) show_error($"{_where} :: self.title_loc_key expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.title_loc_key));
        buffer_write(_buffer, buffer_string, self.title_loc_key);

        // field: title_loc_args, type: String[]
        if (!is_array(self.title_loc_args)) show_error($"{_where} :: self.title_loc_args expected array", true);
        var __length__ = array_length(self.title_loc_args);
        buffer_write(_buffer, buffer_u32, __length__);
        for (var _i = 0; _i < __length__; ++_i)
        {
            if (!is_string(self.title_loc_args[_i])) show_error($"{_where} :: self.title_loc_args[_i] expected string", true);
            buffer_write(_buffer, buffer_u32, string_byte_length(self.title_loc_args[_i]));
            buffer_write(_buffer, buffer_string, self.title_loc_args[_i]);
        }

        // field: android, type: optional<struct FirebaseMessagingAndroidNotificationParams>
        if (is_undefined(self.android))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (self.android.__uid != 857248506) show_error($"{_where} :: self.android expected FirebaseMessagingAndroidNotificationParams", true);
            __FirebaseMessagingAndroidNotificationParams_encode(self.android, _buffer, buffer_tell(_buffer), _where);
        }

    }
}

/**
 * @func __FirebaseMessagingNotification_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseMessagingNotification}
 * @ignore
 */
function __FirebaseMessagingNotification_decode(_buffer, _offset)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseMessagingNotification();
    with (_inst)
    {
        // field: title, type: String
        buffer_read(_buffer, buffer_u32);
        self.title = buffer_read(_buffer, buffer_string);

        // field: body, type: String
        buffer_read(_buffer, buffer_u32);
        self.body = buffer_read(_buffer, buffer_string);

        // field: icon, type: String
        buffer_read(_buffer, buffer_u32);
        self.icon = buffer_read(_buffer, buffer_string);

        // field: sound, type: String
        buffer_read(_buffer, buffer_u32);
        self.sound = buffer_read(_buffer, buffer_string);

        // field: badge, type: String
        buffer_read(_buffer, buffer_u32);
        self.badge = buffer_read(_buffer, buffer_string);

        // field: tag, type: String
        buffer_read(_buffer, buffer_u32);
        self.tag = buffer_read(_buffer, buffer_string);

        // field: color, type: String
        buffer_read(_buffer, buffer_u32);
        self.color = buffer_read(_buffer, buffer_string);

        // field: click_action, type: String
        buffer_read(_buffer, buffer_u32);
        self.click_action = buffer_read(_buffer, buffer_string);

        // field: body_loc_key, type: String
        buffer_read(_buffer, buffer_u32);
        self.body_loc_key = buffer_read(_buffer, buffer_string);

        // field: body_loc_args, type: String[]
        var __length__ = buffer_read(_buffer, buffer_u32);
        self.body_loc_args = array_create(__length__);
        for (var _i = 0; _i < __length__; ++_i)
        {
            buffer_read(_buffer, buffer_u32);
            self.body_loc_args[_i] = buffer_read(_buffer, buffer_string);
        }

        // field: title_loc_key, type: String
        buffer_read(_buffer, buffer_u32);
        self.title_loc_key = buffer_read(_buffer, buffer_string);

        // field: title_loc_args, type: String[]
        var __length__ = buffer_read(_buffer, buffer_u32);
        self.title_loc_args = array_create(__length__);
        for (var _i = 0; _i < __length__; ++_i)
        {
            buffer_read(_buffer, buffer_u32);
            self.title_loc_args[_i] = buffer_read(_buffer, buffer_string);
        }

        // field: android, type: optional<struct FirebaseMessagingAndroidNotificationParams>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.android = __FirebaseMessagingAndroidNotificationParams_decode(_buffer, buffer_tell(_buffer));
        }
        else
        {
            self.android = undefined;
        }

    }

    return _inst;
}

/**
 * @func __FirebaseMessagingMessage_encode(_inst, _buffer, _offset, _where)
 * @param {Struct.FirebaseMessagingMessage} _inst
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @param {String} _where
 * @ignore
 */
function __FirebaseMessagingMessage_encode(_inst, _buffer, _offset, _where = _GMFUNCTION_)
{
    buffer_seek(_buffer, buffer_seek_start, _offset);
    with (_inst)
    {
        // field: from, type: String
        if (!is_string(self.from)) show_error($"{_where} :: self.from expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.from));
        buffer_write(_buffer, buffer_string, self.from);

        // field: to, type: String
        if (!is_string(self.to)) show_error($"{_where} :: self.to expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.to));
        buffer_write(_buffer, buffer_string, self.to);

        // field: collapse_key, type: String
        if (!is_string(self.collapse_key)) show_error($"{_where} :: self.collapse_key expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.collapse_key));
        buffer_write(_buffer, buffer_string, self.collapse_key);

        // field: data, type: Any

        __ext_core_buffer_marshal_value(_buffer, self.data);

        // field: raw_data, type: optional<UInt64>
        if (is_undefined(self.raw_data))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (!is_numeric(self.raw_data)) show_error($"{_where} :: self.raw_data expected number", true);
            buffer_write(_buffer, buffer_u64, self.raw_data);
        }

        // field: raw_data_size, type: Float64
        if (!is_numeric(self.raw_data_size)) show_error($"{_where} :: self.raw_data_size expected number", true);
        buffer_write(_buffer, buffer_f64, self.raw_data_size);

        // field: message_id, type: String
        if (!is_string(self.message_id)) show_error($"{_where} :: self.message_id expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.message_id));
        buffer_write(_buffer, buffer_string, self.message_id);

        // field: message_type, type: String
        if (!is_string(self.message_type)) show_error($"{_where} :: self.message_type expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.message_type));
        buffer_write(_buffer, buffer_string, self.message_type);

        // field: priority, type: String
        if (!is_string(self.priority)) show_error($"{_where} :: self.priority expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.priority));
        buffer_write(_buffer, buffer_string, self.priority);

        // field: time_to_live, type: Float64
        if (!is_numeric(self.time_to_live)) show_error($"{_where} :: self.time_to_live expected number", true);
        buffer_write(_buffer, buffer_f64, self.time_to_live);

        // field: error, type: String
        if (!is_string(self.error)) show_error($"{_where} :: self.error expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.error));
        buffer_write(_buffer, buffer_string, self.error);

        // field: error_description, type: String
        if (!is_string(self.error_description)) show_error($"{_where} :: self.error_description expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.error_description));
        buffer_write(_buffer, buffer_string, self.error_description);

        // field: notification, type: optional<struct FirebaseMessagingNotification>
        if (is_undefined(self.notification))
        {
            buffer_write(_buffer, buffer_bool, false);
        }
        else
        {
            buffer_write(_buffer, buffer_bool, true);
            if (self.notification.__uid != 987839259) show_error($"{_where} :: self.notification expected FirebaseMessagingNotification", true);
            __FirebaseMessagingNotification_encode(self.notification, _buffer, buffer_tell(_buffer), _where);
        }

        // field: notification_opened, type: Bool
        if (!is_bool(self.notification_opened)) show_error($"{_where} :: self.notification_opened expected bool", true);
        buffer_write(_buffer, buffer_bool, self.notification_opened);

        // field: link, type: String
        if (!is_string(self.link)) show_error($"{_where} :: self.link expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.link));
        buffer_write(_buffer, buffer_string, self.link);

        // field: original_priority, type: String
        if (!is_string(self.original_priority)) show_error($"{_where} :: self.original_priority expected string", true);
        buffer_write(_buffer, buffer_u32, string_byte_length(self.original_priority));
        buffer_write(_buffer, buffer_string, self.original_priority);

        // field: sent_time, type: Float64
        if (!is_numeric(self.sent_time)) show_error($"{_where} :: self.sent_time expected number", true);
        buffer_write(_buffer, buffer_f64, self.sent_time);

    }
}

/**
 * @func __FirebaseMessagingMessage_decode(_buffer, _offset)
 * @param {Id.Buffer} _buffer
 * @param {Real} _offset
 * @returns {Struct.FirebaseMessagingMessage}
 * @ignore
 */
function __FirebaseMessagingMessage_decode(_buffer, _offset)
{
    var __decoders__ = __GMFirebase_get_decoders();

    buffer_seek(_buffer, buffer_seek_start, _offset);

    _inst = new FirebaseMessagingMessage();
    with (_inst)
    {
        // field: from, type: String
        buffer_read(_buffer, buffer_u32);
        self.from = buffer_read(_buffer, buffer_string);

        // field: to, type: String
        buffer_read(_buffer, buffer_u32);
        self.to = buffer_read(_buffer, buffer_string);

        // field: collapse_key, type: String
        buffer_read(_buffer, buffer_u32);
        self.collapse_key = buffer_read(_buffer, buffer_string);

        // field: data, type: Any
        self.data = __ext_core_buffer_unmarshal_value(_buffer, __decoders__);

        // field: raw_data, type: optional<UInt64>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.raw_data = buffer_read(_buffer, buffer_u64);
        }
        else
        {
            self.raw_data = undefined;
        }

        // field: raw_data_size, type: Float64
        self.raw_data_size = buffer_read(_buffer, buffer_f64);

        // field: message_id, type: String
        buffer_read(_buffer, buffer_u32);
        self.message_id = buffer_read(_buffer, buffer_string);

        // field: message_type, type: String
        buffer_read(_buffer, buffer_u32);
        self.message_type = buffer_read(_buffer, buffer_string);

        // field: priority, type: String
        buffer_read(_buffer, buffer_u32);
        self.priority = buffer_read(_buffer, buffer_string);

        // field: time_to_live, type: Float64
        self.time_to_live = buffer_read(_buffer, buffer_f64);

        // field: error, type: String
        buffer_read(_buffer, buffer_u32);
        self.error = buffer_read(_buffer, buffer_string);

        // field: error_description, type: String
        buffer_read(_buffer, buffer_u32);
        self.error_description = buffer_read(_buffer, buffer_string);

        // field: notification, type: optional<struct FirebaseMessagingNotification>
        if (buffer_read(_buffer, buffer_bool))
        {
            self.notification = __FirebaseMessagingNotification_decode(_buffer, buffer_tell(_buffer));
        }
        else
        {
            self.notification = undefined;
        }

        // field: notification_opened, type: Bool
        self.notification_opened = buffer_read(_buffer, buffer_bool);

        // field: link, type: String
        buffer_read(_buffer, buffer_u32);
        self.link = buffer_read(_buffer, buffer_string);

        // field: original_priority, type: String
        buffer_read(_buffer, buffer_u32);
        self.original_priority = buffer_read(_buffer, buffer_string);

        // field: sent_time, type: Float64
        self.sent_time = buffer_read(_buffer, buffer_f64);

    }

    return _inst;
}

// #####################################################################
// # Functions
// #####################################################################

// Skipping function firebase_app_initialize (no wrapper is required)


// Skipping function firebase_app_is_initialized (no wrapper is required)


// Skipping function firebase_app_get_name (no wrapper is required)


/**
 * @returns {Enum.FirebaseError}
 */
function firebase_last_error_code()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_last_error_code(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

// Skipping function firebase_last_error_message (no wrapper is required)


// Skipping function firebase_analytics_initialize (no wrapper is required)


// Skipping function firebase_analytics_terminate (no wrapper is required)


// Skipping function firebase_analytics_set_analytics_collection_enabled (no wrapper is required)


/**
 * @param {Bool} _ad_storage
 * @param {Bool} _analytics_storage
 * @param {Bool} _ad_user_data
 * @param {Bool} _ad_personalization
 */
function firebase_analytics_set_consent(_ad_storage, _analytics_storage, _ad_user_data, _ad_personalization)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ad_storage, type: optional<Bool>
    if (is_undefined(_ad_storage))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_bool(_ad_storage)) show_error($"{_GMFUNCTION_} :: _ad_storage expected bool", true);
        buffer_write(__args_buffer__, buffer_bool, _ad_storage);
    }

    // param: _analytics_storage, type: optional<Bool>
    if (is_undefined(_analytics_storage))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_bool(_analytics_storage)) show_error($"{_GMFUNCTION_} :: _analytics_storage expected bool", true);
        buffer_write(__args_buffer__, buffer_bool, _analytics_storage);
    }

    // param: _ad_user_data, type: optional<Bool>
    if (is_undefined(_ad_user_data))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_bool(_ad_user_data)) show_error($"{_GMFUNCTION_} :: _ad_user_data expected bool", true);
        buffer_write(__args_buffer__, buffer_bool, _ad_user_data);
    }

    // param: _ad_personalization, type: optional<Bool>
    if (is_undefined(_ad_personalization))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_bool(_ad_personalization)) show_error($"{_GMFUNCTION_} :: _ad_personalization expected bool", true);
        buffer_write(__args_buffer__, buffer_bool, _ad_personalization);
    }

    var __return_value__ = __firebase_analytics_set_consent(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

// Skipping function firebase_analytics_log_event (no wrapper is required)


// Skipping function firebase_analytics_log_event_string (no wrapper is required)


// Skipping function firebase_analytics_log_event_number (no wrapper is required)


/**
 * @param {String} _name
 * @param {Array[Struct.FirebaseAnalyticsParameter]} _params
 */
function firebase_analytics_log_event_params(_name, _params)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _name, type: String
    if (!is_string(_name)) show_error($"{_GMFUNCTION_} :: _name expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_name));
    buffer_write(__args_buffer__, buffer_string, _name);

    // param: _params, type: struct FirebaseAnalyticsParameter[]
    if (!is_array(_params)) show_error($"{_GMFUNCTION_} :: _params expected array", true);
    var __length__ = array_length(_params);
    buffer_write(__args_buffer__, buffer_u32, __length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        if (_params[_i].__uid != 2925689187) show_error($"{_GMFUNCTION_} :: _params[_i] expected FirebaseAnalyticsParameter", true);
        __FirebaseAnalyticsParameter_encode(_params[_i], __args_buffer__, buffer_tell(__args_buffer__), _GMFUNCTION_);
    }

    var __return_value__ = __firebase_analytics_log_event_params(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Array[Struct.FirebaseAnalyticsParameter]} _params
 */
function firebase_analytics_set_default_event_parameters(_params)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _params, type: struct FirebaseAnalyticsParameter[]
    if (!is_array(_params)) show_error($"{_GMFUNCTION_} :: _params expected array", true);
    var __length__ = array_length(_params);
    buffer_write(__args_buffer__, buffer_u32, __length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        if (_params[_i].__uid != 2925689187) show_error($"{_GMFUNCTION_} :: _params[_i] expected FirebaseAnalyticsParameter", true);
        __FirebaseAnalyticsParameter_encode(_params[_i], __args_buffer__, buffer_tell(__args_buffer__), _GMFUNCTION_);
    }

    var __return_value__ = __firebase_analytics_set_default_event_parameters(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _transaction_id
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_analytics_log_apple_transaction(_transaction_id, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _transaction_id, type: String
    if (!is_string(_transaction_id)) show_error($"{_GMFUNCTION_} :: _transaction_id expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_transaction_id));
    buffer_write(__args_buffer__, buffer_string, _transaction_id);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_analytics_log_apple_transaction(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

// Skipping function firebase_analytics_set_user_property (no wrapper is required)


// Skipping function firebase_analytics_set_user_id (no wrapper is required)


// Skipping function firebase_analytics_set_session_timeout_duration (no wrapper is required)


// Skipping function firebase_analytics_reset_analytics_data (no wrapper is required)


/**
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_analytics_get_analytics_instance_id(_callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_analytics_get_analytics_instance_id(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_analytics_get_session_id(_callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_analytics_get_session_id(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

// Skipping function firebase_analytics_notify_app_lifecycle_termination (no wrapper is required)


// Skipping function firebase_analytics_is_desktop_initialized (no wrapper is required)


// Skipping function firebase_analytics_set_desktop_debug_mode (no wrapper is required)


/**
 * @param {Function} _callback
 */
function firebase_analytics_set_log_callback(_callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_analytics_set_log_callback(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

// Skipping function firebase_analytics_initiate_on_device_conversion_measurement_email (no wrapper is required)


// Skipping function firebase_analytics_initiate_on_device_conversion_measurement_phone (no wrapper is required)


/**
 * @param {Enum.FirebaseAppCheckProvider} _provider
 */
function firebase_app_check_set_provider_factory(_provider)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _provider, type: enum FirebaseAppCheckProvider

    if (!is_numeric(_provider)) show_error($"{_GMFUNCTION_} :: _provider expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _provider);

    var __return_value__ = __firebase_app_check_set_provider_factory(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

// Skipping function firebase_app_check_debug_provider_set_debug_token (no wrapper is required)


/**
 * @returns {Real}
 */
function firebase_app_check_get_instance()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_check_get_instance(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @returns {Real}
 */
function firebase_app_check_get_instance_for_app(_app)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_check_get_instance_for_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app_check
 * @returns {Real}
 */
function firebase_app_check_get_app(_app_check)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app_check, type: UInt64
    if (!is_numeric(_app_check)) show_error($"{_GMFUNCTION_} :: _app_check expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app_check);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_check_get_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app_check
 * @param {Bool} _enabled
 */
function firebase_app_check_set_token_auto_refresh_enabled(_app_check, _enabled)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app_check, type: UInt64
    if (!is_numeric(_app_check)) show_error($"{_GMFUNCTION_} :: _app_check expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app_check);

    // param: _enabled, type: Bool
    if (!is_bool(_enabled)) show_error($"{_GMFUNCTION_} :: _enabled expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _enabled);

    var __return_value__ = __firebase_app_check_set_token_auto_refresh_enabled(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _app_check
 * @param {Bool} _force_refresh
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_app_check_get_token(_app_check, _force_refresh, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app_check, type: UInt64
    if (!is_numeric(_app_check)) show_error($"{_GMFUNCTION_} :: _app_check expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app_check);

    // param: _force_refresh, type: Bool
    if (!is_bool(_force_refresh)) show_error($"{_GMFUNCTION_} :: _force_refresh expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _force_refresh);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_check_get_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app_check
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_app_check_get_limited_use_token(_app_check, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app_check, type: UInt64
    if (!is_numeric(_app_check)) show_error($"{_GMFUNCTION_} :: _app_check expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app_check);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_check_get_limited_use_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app_check
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_app_check_add_listener(_app_check, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app_check, type: UInt64
    if (!is_numeric(_app_check)) show_error($"{_GMFUNCTION_} :: _app_check expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app_check);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_check_add_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _listener_ref
 * @returns {Bool}
 */
function firebase_app_check_remove_listener(_listener_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _listener_ref, type: UInt64
    if (!is_numeric(_listener_ref)) show_error($"{_GMFUNCTION_} :: _listener_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _listener_ref);

    var __return_value__ = __firebase_app_check_remove_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @returns {Real}
 */
function firebase_installations_get_instance()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_installations_get_instance(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @returns {Real}
 */
function firebase_installations_get_instance_for_app(_app)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_installations_get_instance_for_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _installations
 * @returns {Real}
 */
function firebase_installations_get_app(_installations)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _installations, type: UInt64
    if (!is_numeric(_installations)) show_error($"{_GMFUNCTION_} :: _installations expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _installations);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_installations_get_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _installations
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_installations_get_id(_installations, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _installations, type: UInt64
    if (!is_numeric(_installations)) show_error($"{_GMFUNCTION_} :: _installations expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _installations);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_installations_get_id(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _installations
 * @param {Bool} _force_refresh
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_installations_get_token(_installations, _force_refresh, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _installations, type: UInt64
    if (!is_numeric(_installations)) show_error($"{_GMFUNCTION_} :: _installations expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _installations);

    // param: _force_refresh, type: Bool
    if (!is_bool(_force_refresh)) show_error($"{_GMFUNCTION_} :: _force_refresh expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _force_refresh);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_installations_get_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _installations
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_installations_delete(_installations, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _installations, type: UInt64
    if (!is_numeric(_installations)) show_error($"{_GMFUNCTION_} :: _installations expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _installations);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_installations_delete(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

// Skipping function firebase_auth_get_auth (no wrapper is required)


// Skipping function firebase_auth_language_code (no wrapper is required)


// Skipping function firebase_auth_set_language_code (no wrapper is required)


// Skipping function firebase_auth_use_app_language (no wrapper is required)


// Skipping function firebase_auth_use_emulator (no wrapper is required)


/**
 * @returns {Real}
 */
function firebase_auth_current_user()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_current_user(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = buffer_read(__ret_buffer__, buffer_u64);
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

// Skipping function firebase_auth_sign_out (no wrapper is required)


/**
 * @param {String} _email
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_fetch_providers_for_email(_email, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _email, type: String
    if (!is_string(_email)) show_error($"{_GMFUNCTION_} :: _email expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_email));
    buffer_write(__args_buffer__, buffer_string, _email);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_fetch_providers_for_email(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _custom_token
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_sign_in_with_custom_token(_custom_token, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _custom_token, type: String
    if (!is_string(_custom_token)) show_error($"{_GMFUNCTION_} :: _custom_token expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_custom_token));
    buffer_write(__args_buffer__, buffer_string, _custom_token);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_sign_in_with_custom_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _credential_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_sign_in_with_credential(_credential_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _credential_ref, type: UInt64
    if (!is_numeric(_credential_ref)) show_error($"{_GMFUNCTION_} :: _credential_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _credential_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_sign_in_with_credential(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _credential_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_sign_in_and_retrieve_data_with_credential(_credential_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _credential_ref, type: UInt64
    if (!is_numeric(_credential_ref)) show_error($"{_GMFUNCTION_} :: _credential_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _credential_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_sign_in_and_retrieve_data_with_credential(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_sign_in_anonymously(_callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_sign_in_anonymously(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _email
 * @param {String} _password
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_sign_in_with_email_and_password(_email, _password, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _email, type: String
    if (!is_string(_email)) show_error($"{_GMFUNCTION_} :: _email expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_email));
    buffer_write(__args_buffer__, buffer_string, _email);

    // param: _password, type: String
    if (!is_string(_password)) show_error($"{_GMFUNCTION_} :: _password expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_password));
    buffer_write(__args_buffer__, buffer_string, _password);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_sign_in_with_email_and_password(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _email
 * @param {String} _password
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_create_user_with_email_and_password(_email, _password, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _email, type: String
    if (!is_string(_email)) show_error($"{_GMFUNCTION_} :: _email expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_email));
    buffer_write(__args_buffer__, buffer_string, _email);

    // param: _password, type: String
    if (!is_string(_password)) show_error($"{_GMFUNCTION_} :: _password expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_password));
    buffer_write(__args_buffer__, buffer_string, _password);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_create_user_with_email_and_password(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _email
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_send_password_reset_email(_email, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _email, type: String
    if (!is_string(_email)) show_error($"{_GMFUNCTION_} :: _email expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_email));
    buffer_write(__args_buffer__, buffer_string, _email);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_send_password_reset_email(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_auth_add_state_listener(_callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
    buffer_write(__args_buffer__, buffer_u64, _callback_handle);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_add_state_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = buffer_read(__ret_buffer__, buffer_u64);
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

/**
 * @param {Real} _listener_ref
 */
function firebase_auth_remove_state_listener(_listener_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _listener_ref, type: UInt64
    if (!is_numeric(_listener_ref)) show_error($"{_GMFUNCTION_} :: _listener_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _listener_ref);

    var __return_value__ = __firebase_auth_remove_state_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_auth_add_id_token_listener(_callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
    buffer_write(__args_buffer__, buffer_u64, _callback_handle);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_add_id_token_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = buffer_read(__ret_buffer__, buffer_u64);
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

/**
 * @param {Real} _listener_ref
 */
function firebase_auth_remove_id_token_listener(_listener_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _listener_ref, type: UInt64
    if (!is_numeric(_listener_ref)) show_error($"{_GMFUNCTION_} :: _listener_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _listener_ref);

    var __return_value__ = __firebase_auth_remove_id_token_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _credential_ref
 * @returns {String}
 */
function firebase_auth_credential_provider(_credential_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _credential_ref, type: UInt64
    if (!is_numeric(_credential_ref)) show_error($"{_GMFUNCTION_} :: _credential_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _credential_ref);

    var __return_value__ = __firebase_auth_credential_provider(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _credential_ref
 * @returns {Bool}
 */
function firebase_auth_credential_is_valid(_credential_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _credential_ref, type: UInt64
    if (!is_numeric(_credential_ref)) show_error($"{_GMFUNCTION_} :: _credential_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _credential_ref);

    var __return_value__ = __firebase_auth_credential_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _credential_ref
 */
function firebase_auth_credential_release(_credential_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _credential_ref, type: UInt64
    if (!is_numeric(_credential_ref)) show_error($"{_GMFUNCTION_} :: _credential_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _credential_ref);

    var __return_value__ = __firebase_auth_credential_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _email
 * @param {String} _password
 * @returns {Real}
 */
function firebase_auth_email_auth_provider_get_credential(_email, _password)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_email_auth_provider_get_credential(_email, _password, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _access_token
 * @returns {Real}
 */
function firebase_auth_facebook_auth_provider_get_credential(_access_token)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_facebook_auth_provider_get_credential(_access_token, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_game_center_auth_provider_get_credential(_callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_game_center_auth_provider_get_credential(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

// Skipping function firebase_auth_game_center_auth_provider_is_player_authenticated (no wrapper is required)


/**
 * @param {String} _token
 * @returns {Real}
 */
function firebase_auth_github_auth_provider_get_credential(_token)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_github_auth_provider_get_credential(_token, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _id_token
 * @param {String} _access_token
 * @returns {Real}
 */
function firebase_auth_google_auth_provider_get_credential(_id_token, _access_token)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_google_auth_provider_get_credential(_id_token, _access_token, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _provider_id
 * @param {String} _id_token
 * @param {String} _access_token
 * @returns {Real}
 */
function firebase_auth_oauth_provider_get_credential(_provider_id, _id_token, _access_token)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _provider_id, type: String
    if (!is_string(_provider_id)) show_error($"{_GMFUNCTION_} :: _provider_id expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_provider_id));
    buffer_write(__args_buffer__, buffer_string, _provider_id);

    // param: _id_token, type: String
    if (!is_string(_id_token)) show_error($"{_GMFUNCTION_} :: _id_token expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_id_token));
    buffer_write(__args_buffer__, buffer_string, _id_token);

    // param: _access_token, type: String
    if (!is_string(_access_token)) show_error($"{_GMFUNCTION_} :: _access_token expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_access_token));
    buffer_write(__args_buffer__, buffer_string, _access_token);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_oauth_provider_get_credential(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _provider_id
 * @param {String} _id_token
 * @param {String} _raw_nonce
 * @param {String} _access_token
 * @returns {Real}
 */
function firebase_auth_oauth_provider_get_credential_with_nonce(_provider_id, _id_token, _raw_nonce, _access_token)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _provider_id, type: String
    if (!is_string(_provider_id)) show_error($"{_GMFUNCTION_} :: _provider_id expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_provider_id));
    buffer_write(__args_buffer__, buffer_string, _provider_id);

    // param: _id_token, type: String
    if (!is_string(_id_token)) show_error($"{_GMFUNCTION_} :: _id_token expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_id_token));
    buffer_write(__args_buffer__, buffer_string, _id_token);

    // param: _raw_nonce, type: String
    if (!is_string(_raw_nonce)) show_error($"{_GMFUNCTION_} :: _raw_nonce expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_raw_nonce));
    buffer_write(__args_buffer__, buffer_string, _raw_nonce);

    // param: _access_token, type: String
    if (!is_string(_access_token)) show_error($"{_GMFUNCTION_} :: _access_token expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_access_token));
    buffer_write(__args_buffer__, buffer_string, _access_token);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_oauth_provider_get_credential_with_nonce(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _server_auth_code
 * @returns {Real}
 */
function firebase_auth_play_games_auth_provider_get_credential(_server_auth_code)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_play_games_auth_provider_get_credential(_server_auth_code, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _token
 * @param {String} _secret
 * @returns {Real}
 */
function firebase_auth_twitter_auth_provider_get_credential(_token, _secret)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_twitter_auth_provider_get_credential(_token, _secret, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _phone_number
 * @param {Real} _timeout_ms
 * @param {Real} _force_resending_token
 * @param {Function} _on_verification_completed
 * @param {Function} _on_verification_failed
 * @param {Function} _on_code_sent
 * @param {Function} _on_timeout
 * @returns {Real}
 */
function firebase_auth_phone_verify_phone_number(_phone_number, _timeout_ms, _force_resending_token, _on_verification_completed, _on_verification_failed, _on_code_sent, _on_timeout)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _phone_number, type: String
    if (!is_string(_phone_number)) show_error($"{_GMFUNCTION_} :: _phone_number expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_phone_number));
    buffer_write(__args_buffer__, buffer_string, _phone_number);

    // param: _timeout_ms, type: Float64
    if (!is_numeric(_timeout_ms)) show_error($"{_GMFUNCTION_} :: _timeout_ms expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _timeout_ms);

    // param: _force_resending_token, type: UInt64
    if (!is_numeric(_force_resending_token)) show_error($"{_GMFUNCTION_} :: _force_resending_token expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _force_resending_token);

    // param: _on_verification_completed, type: optional<Function>
    if (is_undefined(_on_verification_completed))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_verification_completed)) show_error($"{_GMFUNCTION_} :: _on_verification_completed expected callable type", true);
        var _on_verification_completed_handle = __ext_core_function_register(_on_verification_completed, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_verification_completed_handle);
    }

    // param: _on_verification_failed, type: optional<Function>
    if (is_undefined(_on_verification_failed))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_verification_failed)) show_error($"{_GMFUNCTION_} :: _on_verification_failed expected callable type", true);
        var _on_verification_failed_handle = __ext_core_function_register(_on_verification_failed, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_verification_failed_handle);
    }

    // param: _on_code_sent, type: optional<Function>
    if (is_undefined(_on_code_sent))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_code_sent)) show_error($"{_GMFUNCTION_} :: _on_code_sent expected callable type", true);
        var _on_code_sent_handle = __ext_core_function_register(_on_code_sent, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_code_sent_handle);
    }

    // param: _on_timeout, type: optional<Function>
    if (is_undefined(_on_timeout))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_timeout)) show_error($"{_GMFUNCTION_} :: _on_timeout expected callable type", true);
        var _on_timeout_handle = __ext_core_function_register(_on_timeout, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_timeout_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_phone_verify_phone_number(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _verification_id
 * @param {String} _verification_code
 * @returns {Real}
 */
function firebase_auth_phone_get_credential(_verification_id, _verification_code)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_phone_get_credential(_verification_id, _verification_code, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _credential
 * @returns {String}
 */
function firebase_auth_phone_credential_sms_code(_credential)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _credential, type: UInt64
    if (!is_numeric(_credential)) show_error($"{_GMFUNCTION_} :: _credential expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _credential);

    var __return_value__ = __firebase_auth_phone_credential_sms_code(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _token
 */
function firebase_auth_phone_resending_token_release(_token)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _token, type: UInt64
    if (!is_numeric(_token)) show_error($"{_GMFUNCTION_} :: _token expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _token);

    var __return_value__ = __firebase_auth_phone_resending_token_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _listener
 */
function firebase_auth_phone_listener_release(_listener)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _listener, type: UInt64
    if (!is_numeric(_listener)) show_error($"{_GMFUNCTION_} :: _listener expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _listener);

    var __return_value__ = __firebase_auth_phone_listener_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user
 * @returns {Struct.FirebaseAuthUserInfo}
 */
function firebase_auth_user_get_info(_user)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user, type: UInt64
    if (!is_numeric(_user)) show_error($"{_GMFUNCTION_} :: _user expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_user_get_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = __FirebaseAuthUserInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

/**
 * @param {Real} _user_ref
 */
function firebase_auth_user_release(_user_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    var __return_value__ = __firebase_auth_user_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @returns {Bool}
 */
function firebase_auth_user_is_valid(_user_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    var __return_value__ = __firebase_auth_user_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @param {Bool} _force_refresh
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_user_get_token(_user_ref, _force_refresh, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    // param: _force_refresh, type: Bool
    if (!is_bool(_force_refresh)) show_error($"{_GMFUNCTION_} :: _force_refresh expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _force_refresh);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_user_get_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _user_ref
 * @param {String} _password
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_user_update_password(_user_ref, _password, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    // param: _password, type: String
    if (!is_string(_password)) show_error($"{_GMFUNCTION_} :: _password expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_password));
    buffer_write(__args_buffer__, buffer_string, _password);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_user_update_password(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _user_ref
 * @param {String} _display_name
 * @param {String} _photo_url
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_user_update_profile(_user_ref, _display_name, _photo_url, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    // param: _display_name, type: String
    if (!is_string(_display_name)) show_error($"{_GMFUNCTION_} :: _display_name expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_display_name));
    buffer_write(__args_buffer__, buffer_string, _display_name);

    // param: _photo_url, type: String
    if (!is_string(_photo_url)) show_error($"{_GMFUNCTION_} :: _photo_url expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_photo_url));
    buffer_write(__args_buffer__, buffer_string, _photo_url);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_user_update_profile(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _user_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_user_send_email_verification(_user_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_user_send_email_verification(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _user_ref
 * @param {String} _new_email
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_user_send_email_verification_before_updating_email(_user_ref, _new_email, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    // param: _new_email, type: String
    if (!is_string(_new_email)) show_error($"{_GMFUNCTION_} :: _new_email expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_new_email));
    buffer_write(__args_buffer__, buffer_string, _new_email);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_user_send_email_verification_before_updating_email(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _user_ref
 * @param {Real} _credential_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_user_reauthenticate(_user_ref, _credential_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    // param: _credential_ref, type: UInt64
    if (!is_numeric(_credential_ref)) show_error($"{_GMFUNCTION_} :: _credential_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _credential_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_user_reauthenticate(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _user_ref
 * @param {Real} _credential_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_user_reauthenticate_and_retrieve_data(_user_ref, _credential_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    // param: _credential_ref, type: UInt64
    if (!is_numeric(_credential_ref)) show_error($"{_GMFUNCTION_} :: _credential_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _credential_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_user_reauthenticate_and_retrieve_data(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _user_ref
 * @param {Real} _credential_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_user_link_with_credential(_user_ref, _credential_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    // param: _credential_ref, type: UInt64
    if (!is_numeric(_credential_ref)) show_error($"{_GMFUNCTION_} :: _credential_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _credential_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_user_link_with_credential(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _user_ref
 * @param {String} _provider_id
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_user_unlink(_user_ref, _provider_id, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    // param: _provider_id, type: String
    if (!is_string(_provider_id)) show_error($"{_GMFUNCTION_} :: _provider_id expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_provider_id));
    buffer_write(__args_buffer__, buffer_string, _provider_id);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_user_unlink(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _user_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_user_reload(_user_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_user_reload(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _user_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_user_delete(_user_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_user_delete(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @returns {Real}
 */
function firebase_database_get_instance()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_get_instance(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _url
 * @returns {Real}
 */
function firebase_database_get_instance_for_url(_url)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_get_instance_for_url(_url, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _db_ref
 * @returns {String}
 */
function firebase_database_get_url(_db_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _db_ref, type: UInt64
    if (!is_numeric(_db_ref)) show_error($"{_GMFUNCTION_} :: _db_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _db_ref);

    var __return_value__ = __firebase_database_get_url(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _db_ref
 * @returns {Real}
 */
function firebase_database_get_reference(_db_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _db_ref, type: UInt64
    if (!is_numeric(_db_ref)) show_error($"{_GMFUNCTION_} :: _db_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _db_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_get_reference(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _db_ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_database_get_reference_at_path(_db_ref, _path)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _db_ref, type: UInt64
    if (!is_numeric(_db_ref)) show_error($"{_GMFUNCTION_} :: _db_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _db_ref);

    // param: _path, type: String
    if (!is_string(_path)) show_error($"{_GMFUNCTION_} :: _path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_path));
    buffer_write(__args_buffer__, buffer_string, _path);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_get_reference_at_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _db_ref
 * @param {String} _url
 * @returns {Real}
 */
function firebase_database_get_reference_from_url(_db_ref, _url)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _db_ref, type: UInt64
    if (!is_numeric(_db_ref)) show_error($"{_GMFUNCTION_} :: _db_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _db_ref);

    // param: _url, type: String
    if (!is_string(_url)) show_error($"{_GMFUNCTION_} :: _url expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_url));
    buffer_write(__args_buffer__, buffer_string, _url);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_get_reference_from_url(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _db_ref
 * @returns {Bool}
 */
function firebase_database_go_offline(_db_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _db_ref, type: UInt64
    if (!is_numeric(_db_ref)) show_error($"{_GMFUNCTION_} :: _db_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _db_ref);

    var __return_value__ = __firebase_database_go_offline(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _db_ref
 * @returns {Bool}
 */
function firebase_database_go_online(_db_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _db_ref, type: UInt64
    if (!is_numeric(_db_ref)) show_error($"{_GMFUNCTION_} :: _db_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _db_ref);

    var __return_value__ = __firebase_database_go_online(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _db_ref
 * @returns {Bool}
 */
function firebase_database_purge_outstanding_writes(_db_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _db_ref, type: UInt64
    if (!is_numeric(_db_ref)) show_error($"{_GMFUNCTION_} :: _db_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _db_ref);

    var __return_value__ = __firebase_database_purge_outstanding_writes(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _db_ref
 * @param {Bool} _enabled
 * @returns {Bool}
 */
function firebase_database_set_persistence_enabled(_db_ref, _enabled)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _db_ref, type: UInt64
    if (!is_numeric(_db_ref)) show_error($"{_GMFUNCTION_} :: _db_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _db_ref);

    // param: _enabled, type: Bool
    if (!is_bool(_enabled)) show_error($"{_GMFUNCTION_} :: _enabled expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _enabled);

    var __return_value__ = __firebase_database_set_persistence_enabled(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _db_ref
 * @param {Enum.FirebaseLogLevel} _log_level
 * @returns {Bool}
 */
function firebase_database_set_log_level(_db_ref, _log_level)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _db_ref, type: UInt64
    if (!is_numeric(_db_ref)) show_error($"{_GMFUNCTION_} :: _db_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _db_ref);

    // param: _log_level, type: enum FirebaseLogLevel

    if (!is_numeric(_log_level)) show_error($"{_GMFUNCTION_} :: _log_level expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _log_level);

    var __return_value__ = __firebase_database_set_log_level(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _db_ref
 * @returns {Enum.FirebaseLogLevel}
 */
function firebase_database_get_log_level(_db_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _db_ref, type: UInt64
    if (!is_numeric(_db_ref)) show_error($"{_GMFUNCTION_} :: _db_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _db_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_get_log_level(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_database_query_order_by_child(_ref, _path)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _path, type: String
    if (!is_string(_path)) show_error($"{_GMFUNCTION_} :: _path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_path));
    buffer_write(__args_buffer__, buffer_string, _path);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_order_by_child(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_query_order_by_key(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_order_by_key(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_query_order_by_value(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_order_by_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_query_order_by_priority(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_order_by_priority(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _order_value
 * @returns {Real}
 */
function firebase_database_query_start_at(_ref, _order_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _order_value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _order_value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_start_at(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _order_value
 * @param {String} _child_key
 * @returns {Real}
 */
function firebase_database_query_start_at_key(_ref, _order_value, _child_key)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _order_value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _order_value);

    // param: _child_key, type: String
    if (!is_string(_child_key)) show_error($"{_GMFUNCTION_} :: _child_key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_child_key));
    buffer_write(__args_buffer__, buffer_string, _child_key);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_start_at_key(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _order_value
 * @returns {Real}
 */
function firebase_database_query_end_at(_ref, _order_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _order_value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _order_value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_end_at(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _order_value
 * @param {String} _child_key
 * @returns {Real}
 */
function firebase_database_query_end_at_key(_ref, _order_value, _child_key)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _order_value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _order_value);

    // param: _child_key, type: String
    if (!is_string(_child_key)) show_error($"{_GMFUNCTION_} :: _child_key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_child_key));
    buffer_write(__args_buffer__, buffer_string, _child_key);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_end_at_key(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _order_value
 * @returns {Real}
 */
function firebase_database_query_equal_to(_ref, _order_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _order_value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _order_value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_equal_to(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _order_value
 * @param {String} _child_key
 * @returns {Real}
 */
function firebase_database_query_equal_to_key(_ref, _order_value, _child_key)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _order_value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _order_value);

    // param: _child_key, type: String
    if (!is_string(_child_key)) show_error($"{_GMFUNCTION_} :: _child_key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_child_key));
    buffer_write(__args_buffer__, buffer_string, _child_key);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_equal_to_key(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _limit
 * @returns {Real}
 */
function firebase_database_query_limit_to_first(_ref, _limit)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _limit, type: Float64
    if (!is_numeric(_limit)) show_error($"{_GMFUNCTION_} :: _limit expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _limit);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_limit_to_first(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _limit
 * @returns {Real}
 */
function firebase_database_query_limit_to_last(_ref, _limit)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _limit, type: Float64
    if (!is_numeric(_limit)) show_error($"{_GMFUNCTION_} :: _limit expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _limit);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_limit_to_last(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_query_get_reference(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_get_reference(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Bool} _keep_sync
 * @returns {Bool}
 */
function firebase_database_query_set_keep_synchronized(_ref, _keep_sync)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _keep_sync, type: Bool
    if (!is_bool(_keep_sync)) show_error($"{_GMFUNCTION_} :: _keep_sync expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _keep_sync);

    var __return_value__ = __firebase_database_query_set_keep_synchronized(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_database_query_is_valid(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_query_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_database_query_get_value(_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_get_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Function} _on_value_changed
 * @param {Function} _on_cancelled
 * @returns {Real}
 */
function firebase_database_query_add_value_listener(_ref, _on_value_changed, _on_cancelled)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _on_value_changed, type: optional<Function>
    if (is_undefined(_on_value_changed))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_value_changed)) show_error($"{_GMFUNCTION_} :: _on_value_changed expected callable type", true);
        var _on_value_changed_handle = __ext_core_function_register(_on_value_changed, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_value_changed_handle);
    }

    // param: _on_cancelled, type: optional<Function>
    if (is_undefined(_on_cancelled))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_cancelled)) show_error($"{_GMFUNCTION_} :: _on_cancelled expected callable type", true);
        var _on_cancelled_handle = __ext_core_function_register(_on_cancelled, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_cancelled_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_add_value_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _listener_ref
 * @returns {Bool}
 */
function firebase_database_query_remove_value_listener(_ref, _listener_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _listener_ref, type: UInt64
    if (!is_numeric(_listener_ref)) show_error($"{_GMFUNCTION_} :: _listener_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _listener_ref);

    var __return_value__ = __firebase_database_query_remove_value_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_database_query_remove_all_value_listeners(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_query_remove_all_value_listeners(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _on_child_added
 * @param {Function} _on_child_changed
 * @param {Function} _on_child_moved
 * @param {Function} _on_child_removed
 * @param {Function} _on_cancelled
 * @returns {Real}
 */
function firebase_database_query_add_child_listener(_ref, _on_child_added, _on_child_changed, _on_child_moved, _on_child_removed, _on_cancelled)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _on_child_added, type: optional<Function>
    if (is_undefined(_on_child_added))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_child_added)) show_error($"{_GMFUNCTION_} :: _on_child_added expected callable type", true);
        var _on_child_added_handle = __ext_core_function_register(_on_child_added, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_child_added_handle);
    }

    // param: _on_child_changed, type: optional<Function>
    if (is_undefined(_on_child_changed))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_child_changed)) show_error($"{_GMFUNCTION_} :: _on_child_changed expected callable type", true);
        var _on_child_changed_handle = __ext_core_function_register(_on_child_changed, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_child_changed_handle);
    }

    // param: _on_child_moved, type: optional<Function>
    if (is_undefined(_on_child_moved))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_child_moved)) show_error($"{_GMFUNCTION_} :: _on_child_moved expected callable type", true);
        var _on_child_moved_handle = __ext_core_function_register(_on_child_moved, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_child_moved_handle);
    }

    // param: _on_child_removed, type: optional<Function>
    if (is_undefined(_on_child_removed))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_child_removed)) show_error($"{_GMFUNCTION_} :: _on_child_removed expected callable type", true);
        var _on_child_removed_handle = __ext_core_function_register(_on_child_removed, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_child_removed_handle);
    }

    // param: _on_cancelled, type: optional<Function>
    if (is_undefined(_on_cancelled))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_on_cancelled)) show_error($"{_GMFUNCTION_} :: _on_cancelled expected callable type", true);
        var _on_cancelled_handle = __ext_core_function_register(_on_cancelled, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _on_cancelled_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_query_add_child_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _listener_ref
 * @returns {Bool}
 */
function firebase_database_query_remove_child_listener(_ref, _listener_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _listener_ref, type: UInt64
    if (!is_numeric(_listener_ref)) show_error($"{_GMFUNCTION_} :: _listener_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _listener_ref);

    var __return_value__ = __firebase_database_query_remove_child_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_database_query_remove_all_child_listeners(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_query_remove_all_child_listeners(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 */
function firebase_database_query_release(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_query_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Struct.FirebaseDatabaseReferenceInfo}
 */
function firebase_database_ref_get(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_get(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = __FirebaseDatabaseReferenceInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_database_ref_child(_ref, _path)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _path, type: String
    if (!is_string(_path)) show_error($"{_GMFUNCTION_} :: _path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_path));
    buffer_write(__args_buffer__, buffer_string, _path);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_child(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_push(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_push(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_database_ref_go_online(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_ref_go_online(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_database_ref_go_offline(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_ref_go_offline(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Any} _value
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_database_ref_set_value(_ref, _value, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_set_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _priority
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_database_ref_set_priority(_ref, _priority, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _priority, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _priority);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_set_priority(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _value
 * @param {Any} _priority
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_database_ref_set_value_and_priority(_ref, _value, _priority, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    // param: _priority, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _priority);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_set_value_and_priority(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _values
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_database_ref_update_children(_ref, _values, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_update_children(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_database_ref_remove_value(_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_remove_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Bool} _trigger_local_events
 * @param {Function} _update_callback
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_database_ref_run_transaction(_ref, _trigger_local_events, _update_callback, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _trigger_local_events, type: Bool
    if (!is_bool(_trigger_local_events)) show_error($"{_GMFUNCTION_} :: _trigger_local_events expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _trigger_local_events);

    // param: _update_callback, type: optional<Function>
    if (is_undefined(_update_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_update_callback)) show_error($"{_GMFUNCTION_} :: _update_callback expected callable type", true);
        var _update_callback_handle = __ext_core_function_register(_update_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _update_callback_handle);
    }

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_run_transaction(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 */
function firebase_database_ref_release(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_ref_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_database_snapshot_is_valid(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_snapshot_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_database_snapshot_child(_ref, _path)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _path, type: String
    if (!is_string(_path)) show_error($"{_GMFUNCTION_} :: _path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_path));
    buffer_write(__args_buffer__, buffer_string, _path);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_snapshot_child(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _path
 * @returns {Bool}
 */
function firebase_database_snapshot_has_child(_ref, _path)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _path, type: String
    if (!is_string(_path)) show_error($"{_GMFUNCTION_} :: _path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_path));
    buffer_write(__args_buffer__, buffer_string, _path);

    var __return_value__ = __firebase_database_snapshot_has_child(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Array[Real]}
 */
function firebase_database_snapshot_get_children(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_snapshot_get_children(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    var __length__ = buffer_read(__ret_buffer__, buffer_u32);
    __result__ = array_create(__length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        __result__[_i] = buffer_read(__ret_buffer__, buffer_u64);
    }
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_snapshot_get_reference(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_snapshot_get_reference(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _snapshot
 * @returns {Struct.FirebaseDataSnapshotInfo}
 */
function firebase_database_snapshot_get_info(_snapshot)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_snapshot_get_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = __FirebaseDataSnapshotInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

/**
 * @param {Real} _snapshot
 * @returns {Any}
 */
function firebase_database_snapshot_get_value(_snapshot)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebase_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_snapshot_get_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _snapshot
 * @returns {Any}
 */
function firebase_database_snapshot_get_priority(_snapshot)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebase_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_snapshot_get_priority(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _snapshot
 */
function firebase_database_snapshot_release(_snapshot)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_database_snapshot_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _data
 * @returns {Struct.FirebaseMutableDataInfo}
 */
function firebase_database_mutable_data_get_info(_data)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _data, type: UInt64
    if (!is_numeric(_data)) show_error($"{_GMFUNCTION_} :: _data expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _data);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_mutable_data_get_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = __FirebaseMutableDataInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

/**
 * @param {Real} _data
 * @param {String} _path
 * @returns {Real}
 */
function firebase_database_mutable_data_child(_data, _path)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _data, type: UInt64
    if (!is_numeric(_data)) show_error($"{_GMFUNCTION_} :: _data expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _data);

    // param: _path, type: String
    if (!is_string(_path)) show_error($"{_GMFUNCTION_} :: _path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_path));
    buffer_write(__args_buffer__, buffer_string, _path);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_mutable_data_child(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _data
 * @param {String} _path
 * @returns {Bool}
 */
function firebase_database_mutable_data_has_child(_data, _path)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _data, type: UInt64
    if (!is_numeric(_data)) show_error($"{_GMFUNCTION_} :: _data expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _data);

    // param: _path, type: String
    if (!is_string(_path)) show_error($"{_GMFUNCTION_} :: _path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_path));
    buffer_write(__args_buffer__, buffer_string, _path);

    var __return_value__ = __firebase_database_mutable_data_has_child(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _data
 * @returns {Array[Real]}
 */
function firebase_database_mutable_data_get_children(_data)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _data, type: UInt64
    if (!is_numeric(_data)) show_error($"{_GMFUNCTION_} :: _data expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _data);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_mutable_data_get_children(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    var __length__ = buffer_read(__ret_buffer__, buffer_u32);
    __result__ = array_create(__length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        __result__[_i] = buffer_read(__ret_buffer__, buffer_u64);
    }
    return __result__;
}

/**
 * @param {Real} _data
 * @returns {Any}
 */
function firebase_database_mutable_data_get_value(_data)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebase_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _data, type: UInt64
    if (!is_numeric(_data)) show_error($"{_GMFUNCTION_} :: _data expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _data);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_mutable_data_get_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _data
 * @returns {Any}
 */
function firebase_database_mutable_data_get_priority(_data)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebase_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _data, type: UInt64
    if (!is_numeric(_data)) show_error($"{_GMFUNCTION_} :: _data expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _data);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_mutable_data_get_priority(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _data
 * @param {Any} _value
 * @returns {Bool}
 */
function firebase_database_mutable_data_set_value(_data, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _data, type: UInt64
    if (!is_numeric(_data)) show_error($"{_GMFUNCTION_} :: _data expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _data);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __return_value__ = __firebase_database_mutable_data_set_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _data
 * @param {Any} _priority
 * @returns {Bool}
 */
function firebase_database_mutable_data_set_priority(_data, _priority)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _data, type: UInt64
    if (!is_numeric(_data)) show_error($"{_GMFUNCTION_} :: _data expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _data);

    // param: _priority, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _priority);

    var __return_value__ = __firebase_database_mutable_data_set_priority(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _data
 * @returns {Bool}
 */
function firebase_database_transaction_commit(_data)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _data, type: UInt64
    if (!is_numeric(_data)) show_error($"{_GMFUNCTION_} :: _data expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _data);

    var __return_value__ = __firebase_database_transaction_commit(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _data
 * @returns {Bool}
 */
function firebase_database_transaction_abort(_data)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _data, type: UInt64
    if (!is_numeric(_data)) show_error($"{_GMFUNCTION_} :: _data expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _data);

    var __return_value__ = __firebase_database_transaction_abort(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @returns {Real}
 */
function firebase_firestore_get_instance()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_get_instance(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _database_name
 * @returns {Real}
 */
function firebase_firestore_get_instance_for_database(_database_name)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_get_instance_for_database(_database_name, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _instance_ref
 * @returns {String}
 */
function firebase_firestore_settings_get_host(_instance_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    var __return_value__ = __firebase_firestore_settings_get_host(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @param {String} _host
 */
function firebase_firestore_settings_set_host(_instance_ref, _host)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _host, type: String
    if (!is_string(_host)) show_error($"{_GMFUNCTION_} :: _host expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_host));
    buffer_write(__args_buffer__, buffer_string, _host);

    var __return_value__ = __firebase_firestore_settings_set_host(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @returns {Bool}
 */
function firebase_firestore_settings_get_ssl_enabled(_instance_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    var __return_value__ = __firebase_firestore_settings_get_ssl_enabled(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @param {Bool} _enabled
 */
function firebase_firestore_settings_set_ssl_enabled(_instance_ref, _enabled)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _enabled, type: Bool
    if (!is_bool(_enabled)) show_error($"{_GMFUNCTION_} :: _enabled expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _enabled);

    var __return_value__ = __firebase_firestore_settings_set_ssl_enabled(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @returns {Bool}
 */
function firebase_firestore_settings_get_persistence_enabled(_instance_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    var __return_value__ = __firebase_firestore_settings_get_persistence_enabled(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @param {Bool} _enabled
 */
function firebase_firestore_settings_set_persistence_enabled(_instance_ref, _enabled)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _enabled, type: Bool
    if (!is_bool(_enabled)) show_error($"{_GMFUNCTION_} :: _enabled expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _enabled);

    var __return_value__ = __firebase_firestore_settings_set_persistence_enabled(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @returns {Real}
 */
function firebase_firestore_settings_get_cache_size_bytes(_instance_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    var __return_value__ = __firebase_firestore_settings_get_cache_size_bytes(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @param {Real} _bytes
 */
function firebase_firestore_settings_set_cache_size_bytes(_instance_ref, _bytes)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _bytes, type: Float64
    if (!is_numeric(_bytes)) show_error($"{_GMFUNCTION_} :: _bytes expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _bytes);

    var __return_value__ = __firebase_firestore_settings_set_cache_size_bytes(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_firestore_collection(_instance_ref, _path)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _path, type: String
    if (!is_string(_path)) show_error($"{_GMFUNCTION_} :: _path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_path));
    buffer_write(__args_buffer__, buffer_string, _path);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_collection(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _instance_ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_firestore_document(_instance_ref, _path)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _path, type: String
    if (!is_string(_path)) show_error($"{_GMFUNCTION_} :: _path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_path));
    buffer_write(__args_buffer__, buffer_string, _path);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _instance_ref
 * @param {String} _collection_id
 * @returns {Real}
 */
function firebase_firestore_collection_group(_instance_ref, _collection_id)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _collection_id, type: String
    if (!is_string(_collection_id)) show_error($"{_GMFUNCTION_} :: _collection_id expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_collection_id));
    buffer_write(__args_buffer__, buffer_string, _collection_id);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_collection_group(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _instance_ref
 * @returns {Real}
 */
function firebase_firestore_batch(_instance_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_batch(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Enum.FirebaseLogLevel} _level
 */
function firebase_firestore_set_log_level(_level)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _level, type: enum FirebaseLogLevel

    if (!is_numeric(_level)) show_error($"{_GMFUNCTION_} :: _level expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _level);

    var __return_value__ = __firebase_firestore_set_log_level(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_firestore_enable_network(_instance_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_enable_network(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _instance_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_firestore_disable_network(_instance_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_disable_network(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _instance_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_firestore_terminate(_instance_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_terminate(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _instance_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_firestore_clear_persistence(_instance_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_clear_persistence(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _instance_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_firestore_wait_for_pending_writes(_instance_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_wait_for_pending_writes(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _instance_ref
 * @param {Real} _max_attempts
 * @param {Function} _update_callback
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_firestore_run_transaction(_instance_ref, _max_attempts, _update_callback, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _instance_ref, type: UInt64
    if (!is_numeric(_instance_ref)) show_error($"{_GMFUNCTION_} :: _instance_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _instance_ref);

    // param: _max_attempts, type: Float64
    if (!is_numeric(_max_attempts)) show_error($"{_GMFUNCTION_} :: _max_attempts expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _max_attempts);

    // param: _update_callback, type: optional<Function>
    if (is_undefined(_update_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_update_callback)) show_error($"{_GMFUNCTION_} :: _update_callback expected callable type", true);
        var _update_callback_handle = __ext_core_function_register(_update_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _update_callback_handle);
    }

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_run_transaction(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _transaction_ref
 * @param {Real} _document_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_firestore_transaction_get(_transaction_ref, _document_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _transaction_ref, type: UInt64
    if (!is_numeric(_transaction_ref)) show_error($"{_GMFUNCTION_} :: _transaction_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _transaction_ref);

    // param: _document_ref, type: UInt64
    if (!is_numeric(_document_ref)) show_error($"{_GMFUNCTION_} :: _document_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_transaction_get(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _transaction_ref
 * @param {Real} _document_ref
 * @param {Any} _data
 * @returns {Bool}
 */
function firebase_firestore_transaction_set(_transaction_ref, _document_ref, _data)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _transaction_ref, type: UInt64
    if (!is_numeric(_transaction_ref)) show_error($"{_GMFUNCTION_} :: _transaction_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _transaction_ref);

    // param: _document_ref, type: UInt64
    if (!is_numeric(_document_ref)) show_error($"{_GMFUNCTION_} :: _document_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document_ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    var __return_value__ = __firebase_firestore_transaction_set(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _transaction_ref
 * @param {Real} _document_ref
 * @param {Any} _data
 * @returns {Bool}
 */
function firebase_firestore_transaction_set_merge(_transaction_ref, _document_ref, _data)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _transaction_ref, type: UInt64
    if (!is_numeric(_transaction_ref)) show_error($"{_GMFUNCTION_} :: _transaction_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _transaction_ref);

    // param: _document_ref, type: UInt64
    if (!is_numeric(_document_ref)) show_error($"{_GMFUNCTION_} :: _document_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document_ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    var __return_value__ = __firebase_firestore_transaction_set_merge(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _transaction_ref
 * @param {Real} _document_ref
 * @param {Any} _data
 * @param {Array[String]} _fields
 * @returns {Bool}
 */
function firebase_firestore_transaction_set_merge_fields(_transaction_ref, _document_ref, _data, _fields)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _transaction_ref, type: UInt64
    if (!is_numeric(_transaction_ref)) show_error($"{_GMFUNCTION_} :: _transaction_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _transaction_ref);

    // param: _document_ref, type: UInt64
    if (!is_numeric(_document_ref)) show_error($"{_GMFUNCTION_} :: _document_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document_ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    // param: _fields, type: String[]
    if (!is_array(_fields)) show_error($"{_GMFUNCTION_} :: _fields expected array", true);
    var __length__ = array_length(_fields);
    buffer_write(__args_buffer__, buffer_u32, __length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        if (!is_string(_fields[_i])) show_error($"{_GMFUNCTION_} :: _fields[_i] expected string", true);
        buffer_write(__args_buffer__, buffer_u32, string_byte_length(_fields[_i]));
        buffer_write(__args_buffer__, buffer_string, _fields[_i]);
    }

    var __return_value__ = __firebase_firestore_transaction_set_merge_fields(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _transaction_ref
 * @param {Real} _document_ref
 * @param {Any} _data
 * @param {Array[Real]} _field_paths
 * @returns {Bool}
 */
function firebase_firestore_transaction_set_merge_field_paths(_transaction_ref, _document_ref, _data, _field_paths)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _transaction_ref, type: UInt64
    if (!is_numeric(_transaction_ref)) show_error($"{_GMFUNCTION_} :: _transaction_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _transaction_ref);

    // param: _document_ref, type: UInt64
    if (!is_numeric(_document_ref)) show_error($"{_GMFUNCTION_} :: _document_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document_ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    // param: _field_paths, type: UInt64[]
    if (!is_array(_field_paths)) show_error($"{_GMFUNCTION_} :: _field_paths expected array", true);
    var __length__ = array_length(_field_paths);
    buffer_write(__args_buffer__, buffer_u32, __length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        if (!is_numeric(_field_paths[_i])) show_error($"{_GMFUNCTION_} :: _field_paths[_i] expected number", true);
        buffer_write(__args_buffer__, buffer_u64, _field_paths[_i]);
    }

    var __return_value__ = __firebase_firestore_transaction_set_merge_field_paths(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _transaction_ref
 * @param {Real} _document_ref
 * @param {Any} _data
 * @returns {Bool}
 */
function firebase_firestore_transaction_update(_transaction_ref, _document_ref, _data)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _transaction_ref, type: UInt64
    if (!is_numeric(_transaction_ref)) show_error($"{_GMFUNCTION_} :: _transaction_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _transaction_ref);

    // param: _document_ref, type: UInt64
    if (!is_numeric(_document_ref)) show_error($"{_GMFUNCTION_} :: _document_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document_ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    var __return_value__ = __firebase_firestore_transaction_update(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _transaction_ref
 * @param {Real} _document_ref
 * @param {Array[Struct.FirestoreFieldPathValue]} _entries
 * @returns {Bool}
 */
function firebase_firestore_transaction_update_field_paths(_transaction_ref, _document_ref, _entries)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _transaction_ref, type: UInt64
    if (!is_numeric(_transaction_ref)) show_error($"{_GMFUNCTION_} :: _transaction_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _transaction_ref);

    // param: _document_ref, type: UInt64
    if (!is_numeric(_document_ref)) show_error($"{_GMFUNCTION_} :: _document_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document_ref);

    // param: _entries, type: struct FirestoreFieldPathValue[]
    if (!is_array(_entries)) show_error($"{_GMFUNCTION_} :: _entries expected array", true);
    var __length__ = array_length(_entries);
    buffer_write(__args_buffer__, buffer_u32, __length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        if (_entries[_i].__uid != 696662754) show_error($"{_GMFUNCTION_} :: _entries[_i] expected FirestoreFieldPathValue", true);
        __FirestoreFieldPathValue_encode(_entries[_i], __args_buffer__, buffer_tell(__args_buffer__), _GMFUNCTION_);
    }

    var __return_value__ = __firebase_firestore_transaction_update_field_paths(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _transaction_ref
 * @param {Real} _document_ref
 * @returns {Bool}
 */
function firebase_firestore_transaction_delete(_transaction_ref, _document_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _transaction_ref, type: UInt64
    if (!is_numeric(_transaction_ref)) show_error($"{_GMFUNCTION_} :: _transaction_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _transaction_ref);

    // param: _document_ref, type: UInt64
    if (!is_numeric(_document_ref)) show_error($"{_GMFUNCTION_} :: _document_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document_ref);

    var __return_value__ = __firebase_firestore_transaction_delete(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _transaction_ref
 * @returns {Bool}
 */
function firebase_firestore_transaction_commit(_transaction_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _transaction_ref, type: UInt64
    if (!is_numeric(_transaction_ref)) show_error($"{_GMFUNCTION_} :: _transaction_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _transaction_ref);

    var __return_value__ = __firebase_firestore_transaction_commit(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _transaction_ref
 * @param {String} _error_message
 * @returns {Bool}
 */
function firebase_firestore_transaction_abort(_transaction_ref, _error_message)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _transaction_ref, type: UInt64
    if (!is_numeric(_transaction_ref)) show_error($"{_GMFUNCTION_} :: _transaction_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _transaction_ref);

    // param: _error_message, type: String
    if (!is_string(_error_message)) show_error($"{_GMFUNCTION_} :: _error_message expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_error_message));
    buffer_write(__args_buffer__, buffer_string, _error_message);

    var __return_value__ = __firebase_firestore_transaction_abort(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_firestore_collection_ref_id(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_collection_ref_id(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_firestore_collection_ref_path(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_collection_ref_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_firestore_collection_ref_parent(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_collection_ref_parent(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_firestore_collection_ref_document(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_collection_ref_document(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_firestore_collection_ref_document_path(_ref, _path)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _path, type: String
    if (!is_string(_path)) show_error($"{_GMFUNCTION_} :: _path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_path));
    buffer_write(__args_buffer__, buffer_string, _path);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_collection_ref_document_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _data
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_firestore_collection_ref_add(_ref, _data, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_collection_ref_add(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_firestore_collection_ref_is_valid(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_collection_ref_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 */
function firebase_firestore_collection_ref_release(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_collection_ref_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_firestore_document_ref_id(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_document_ref_id(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_firestore_document_ref_path(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_document_ref_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_firestore_document_ref_parent(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_ref_parent(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_firestore_document_ref_collection(_ref, _path)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _path, type: String
    if (!is_string(_path)) show_error($"{_GMFUNCTION_} :: _path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_path));
    buffer_write(__args_buffer__, buffer_string, _path);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_ref_collection(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Enum.FirestoreSource} _source
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_firestore_document_ref_get(_ref, _source, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _source, type: enum FirestoreSource

    if (!is_numeric(_source)) show_error($"{_GMFUNCTION_} :: _source expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _source);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_ref_get(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _data
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_firestore_document_ref_set(_ref, _data, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_ref_set(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _data
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_firestore_document_ref_set_merge(_ref, _data, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_ref_set_merge(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _data
 * @param {Array[String]} _fields
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_firestore_document_ref_set_merge_fields(_ref, _data, _fields, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    // param: _fields, type: String[]
    if (!is_array(_fields)) show_error($"{_GMFUNCTION_} :: _fields expected array", true);
    var __length__ = array_length(_fields);
    buffer_write(__args_buffer__, buffer_u32, __length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        if (!is_string(_fields[_i])) show_error($"{_GMFUNCTION_} :: _fields[_i] expected string", true);
        buffer_write(__args_buffer__, buffer_u32, string_byte_length(_fields[_i]));
        buffer_write(__args_buffer__, buffer_string, _fields[_i]);
    }

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_ref_set_merge_fields(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _data
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_firestore_document_ref_update(_ref, _data, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_ref_update(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_firestore_document_ref_delete(_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_ref_delete(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Bool} _include_metadata_changes
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_document_ref_add_snapshot_listener(_ref, _include_metadata_changes, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _include_metadata_changes, type: Bool
    if (!is_bool(_include_metadata_changes)) show_error($"{_GMFUNCTION_} :: _include_metadata_changes expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _include_metadata_changes);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_ref_add_snapshot_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_firestore_document_ref_is_valid(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_document_ref_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 */
function firebase_firestore_document_ref_release(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_document_ref_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_equal_to(_ref, _field, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_equal_to(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_not_equal_to(_ref, _field, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_not_equal_to(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_less_than(_ref, _field, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_less_than(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_less_than_or_equal_to(_ref, _field, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_less_than_or_equal_to(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_greater_than(_ref, _field, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_greater_than(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_greater_than_or_equal_to(_ref, _field, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_greater_than_or_equal_to(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_array_contains(_ref, _field, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_array_contains(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_query_where_array_contains_any(_ref, _field, _values)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_array_contains_any(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_query_where_in(_ref, _field, _values)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_in(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_query_where_not_in(_ref, _field, _values)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_not_in(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Enum.FirestoreDirection} _direction
 * @returns {Real}
 */
function firebase_firestore_query_order_by(_ref, _field, _direction)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _direction, type: enum FirestoreDirection

    if (!is_numeric(_direction)) show_error($"{_GMFUNCTION_} :: _direction expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _direction);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_order_by(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _limit
 * @returns {Real}
 */
function firebase_firestore_query_limit(_ref, _limit)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _limit, type: Float64
    if (!is_numeric(_limit)) show_error($"{_GMFUNCTION_} :: _limit expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _limit);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_limit(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _limit
 * @returns {Real}
 */
function firebase_firestore_query_limit_to_last(_ref, _limit)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _limit, type: Float64
    if (!is_numeric(_limit)) show_error($"{_GMFUNCTION_} :: _limit expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _limit);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_limit_to_last(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _snapshot_ref
 * @returns {Real}
 */
function firebase_firestore_query_start_at_snapshot(_ref, _snapshot_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _snapshot_ref, type: UInt64
    if (!is_numeric(_snapshot_ref)) show_error($"{_GMFUNCTION_} :: _snapshot_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_start_at_snapshot(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_query_start_at_values(_ref, _values)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_start_at_values(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _snapshot_ref
 * @returns {Real}
 */
function firebase_firestore_query_start_after_snapshot(_ref, _snapshot_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _snapshot_ref, type: UInt64
    if (!is_numeric(_snapshot_ref)) show_error($"{_GMFUNCTION_} :: _snapshot_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_start_after_snapshot(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_query_start_after_values(_ref, _values)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_start_after_values(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _snapshot_ref
 * @returns {Real}
 */
function firebase_firestore_query_end_before_snapshot(_ref, _snapshot_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _snapshot_ref, type: UInt64
    if (!is_numeric(_snapshot_ref)) show_error($"{_GMFUNCTION_} :: _snapshot_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_end_before_snapshot(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_query_end_before_values(_ref, _values)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_end_before_values(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _snapshot_ref
 * @returns {Real}
 */
function firebase_firestore_query_end_at_snapshot(_ref, _snapshot_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _snapshot_ref, type: UInt64
    if (!is_numeric(_snapshot_ref)) show_error($"{_GMFUNCTION_} :: _snapshot_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_end_at_snapshot(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_query_end_at_values(_ref, _values)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_end_at_values(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Enum.FirestoreSource} _source
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_firestore_query_get(_ref, _source, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _source, type: enum FirestoreSource

    if (!is_numeric(_source)) show_error($"{_GMFUNCTION_} :: _source expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _source);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_get(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Bool} _include_metadata_changes
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_query_add_snapshot_listener(_ref, _include_metadata_changes, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _include_metadata_changes, type: Bool
    if (!is_bool(_include_metadata_changes)) show_error($"{_GMFUNCTION_} :: _include_metadata_changes expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _include_metadata_changes);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_add_snapshot_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_firestore_query_is_valid(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_query_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 */
function firebase_firestore_query_release(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_query_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _batch_ref
 * @param {Real} _document_ref
 * @param {Any} _data
 * @returns {Bool}
 */
function firebase_firestore_write_batch_set(_batch_ref, _document_ref, _data)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _batch_ref, type: UInt64
    if (!is_numeric(_batch_ref)) show_error($"{_GMFUNCTION_} :: _batch_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _batch_ref);

    // param: _document_ref, type: UInt64
    if (!is_numeric(_document_ref)) show_error($"{_GMFUNCTION_} :: _document_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document_ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    var __return_value__ = __firebase_firestore_write_batch_set(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _batch_ref
 * @param {Real} _document_ref
 * @param {Any} _data
 * @returns {Bool}
 */
function firebase_firestore_write_batch_set_merge(_batch_ref, _document_ref, _data)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _batch_ref, type: UInt64
    if (!is_numeric(_batch_ref)) show_error($"{_GMFUNCTION_} :: _batch_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _batch_ref);

    // param: _document_ref, type: UInt64
    if (!is_numeric(_document_ref)) show_error($"{_GMFUNCTION_} :: _document_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document_ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    var __return_value__ = __firebase_firestore_write_batch_set_merge(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _batch_ref
 * @param {Real} _document_ref
 * @param {Any} _data
 * @param {Array[String]} _fields
 * @returns {Bool}
 */
function firebase_firestore_write_batch_set_merge_fields(_batch_ref, _document_ref, _data, _fields)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _batch_ref, type: UInt64
    if (!is_numeric(_batch_ref)) show_error($"{_GMFUNCTION_} :: _batch_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _batch_ref);

    // param: _document_ref, type: UInt64
    if (!is_numeric(_document_ref)) show_error($"{_GMFUNCTION_} :: _document_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document_ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    // param: _fields, type: String[]
    if (!is_array(_fields)) show_error($"{_GMFUNCTION_} :: _fields expected array", true);
    var __length__ = array_length(_fields);
    buffer_write(__args_buffer__, buffer_u32, __length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        if (!is_string(_fields[_i])) show_error($"{_GMFUNCTION_} :: _fields[_i] expected string", true);
        buffer_write(__args_buffer__, buffer_u32, string_byte_length(_fields[_i]));
        buffer_write(__args_buffer__, buffer_string, _fields[_i]);
    }

    var __return_value__ = __firebase_firestore_write_batch_set_merge_fields(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _batch_ref
 * @param {Real} _document_ref
 * @param {Any} _data
 * @returns {Bool}
 */
function firebase_firestore_write_batch_update(_batch_ref, _document_ref, _data)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _batch_ref, type: UInt64
    if (!is_numeric(_batch_ref)) show_error($"{_GMFUNCTION_} :: _batch_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _batch_ref);

    // param: _document_ref, type: UInt64
    if (!is_numeric(_document_ref)) show_error($"{_GMFUNCTION_} :: _document_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document_ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    var __return_value__ = __firebase_firestore_write_batch_update(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _batch_ref
 * @param {Real} _document_ref
 * @returns {Bool}
 */
function firebase_firestore_write_batch_delete(_batch_ref, _document_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _batch_ref, type: UInt64
    if (!is_numeric(_batch_ref)) show_error($"{_GMFUNCTION_} :: _batch_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _batch_ref);

    // param: _document_ref, type: UInt64
    if (!is_numeric(_document_ref)) show_error($"{_GMFUNCTION_} :: _document_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document_ref);

    var __return_value__ = __firebase_firestore_write_batch_delete(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _batch_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_firestore_write_batch_commit(_batch_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _batch_ref, type: UInt64
    if (!is_numeric(_batch_ref)) show_error($"{_GMFUNCTION_} :: _batch_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _batch_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_write_batch_commit(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _batch_ref
 */
function firebase_firestore_write_batch_release(_batch_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _batch_ref, type: UInt64
    if (!is_numeric(_batch_ref)) show_error($"{_GMFUNCTION_} :: _batch_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _batch_ref);

    var __return_value__ = __firebase_firestore_write_batch_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @returns {Real}
 */
function firebase_firestore_field_value_delete()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_delete(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @returns {Real}
 */
function firebase_firestore_field_value_server_timestamp()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_server_timestamp(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_field_value_array_union(_values)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_array_union(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_field_value_array_remove(_values)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_array_remove(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _value
 * @returns {Real}
 */
function firebase_firestore_field_value_increment_integer(_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_increment_integer(_value, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _value
 * @returns {Real}
 */
function firebase_firestore_field_value_increment_double(_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_increment_double(_value, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _value
 * @returns {Real}
 */
function firebase_firestore_field_value_integer(_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_integer(_value, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _value
 * @returns {Real}
 */
function firebase_firestore_field_value_double(_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_double(_value, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _seconds
 * @param {Real} _nanoseconds
 * @returns {Real}
 */
function firebase_firestore_field_value_timestamp(_seconds, _nanoseconds)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_timestamp(_seconds, _nanoseconds, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _latitude
 * @param {Real} _longitude
 * @returns {Real}
 */
function firebase_firestore_field_value_geo_point(_latitude, _longitude)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_geo_point(_latitude, _longitude, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _document_ref
 * @returns {Real}
 */
function firebase_firestore_field_value_reference(_document_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _document_ref, type: UInt64
    if (!is_numeric(_document_ref)) show_error($"{_GMFUNCTION_} :: _document_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_reference(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Id.Buffer} _data
 * @returns {Real}
 */
function firebase_firestore_field_value_blob(_data)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _data, type: Buffer
    if (!buffer_exists(_data)) show_error($"{_GMFUNCTION_} :: _data expected Id.Buffer", true);
    __GMFirebase_queue_buffer(buffer_get_address(_data), buffer_get_size(_data));

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_blob(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @returns {Real}
 */
function firebase_firestore_field_value_null()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_null(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 */
function firebase_firestore_field_value_release(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_field_value_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Struct.FirestoreDocumentSnapshotInfo}
 */
function firebase_firestore_document_snapshot_get_info(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_snapshot_get_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = __FirestoreDocumentSnapshotInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Enum.FirestoreServerTimestampBehavior} _server_timestamp_behavior
 * @returns {Struct.FirestoreFieldLookup}
 */
function firebase_firestore_document_snapshot_get(_ref, _field, _server_timestamp_behavior)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _server_timestamp_behavior, type: enum FirestoreServerTimestampBehavior

    if (!is_numeric(_server_timestamp_behavior)) show_error($"{_GMFUNCTION_} :: _server_timestamp_behavior expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _server_timestamp_behavior);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_snapshot_get(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = __FirestoreFieldLookup_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Enum.FirestoreServerTimestampBehavior} _server_timestamp_behavior
 * @returns {Any}
 */
function firebase_firestore_document_snapshot_get_data(_ref, _server_timestamp_behavior)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebase_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _server_timestamp_behavior, type: enum FirestoreServerTimestampBehavior

    if (!is_numeric(_server_timestamp_behavior)) show_error($"{_GMFUNCTION_} :: _server_timestamp_behavior expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _server_timestamp_behavior);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_snapshot_get_data(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _ref
 */
function firebase_firestore_document_snapshot_release(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_document_snapshot_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Struct.FirestoreQuerySnapshotInfo}
 */
function firebase_firestore_query_snapshot_get_info(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_snapshot_get_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = __FirestoreQuerySnapshotInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Array[Real]}
 */
function firebase_firestore_query_snapshot_documents(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_snapshot_documents(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    var __length__ = buffer_read(__ret_buffer__, buffer_u32);
    __result__ = array_create(__length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        __result__[_i] = buffer_read(__ret_buffer__, buffer_u64);
    }
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Bool} _include_metadata_changes
 * @returns {Array[Struct.FirestoreDocumentChange]}
 */
function firebase_firestore_query_snapshot_document_changes(_ref, _include_metadata_changes)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _include_metadata_changes, type: Bool
    if (!is_bool(_include_metadata_changes)) show_error($"{_GMFUNCTION_} :: _include_metadata_changes expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _include_metadata_changes);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_snapshot_document_changes(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    var __length__ = buffer_read(__ret_buffer__, buffer_u32);
    __result__ = array_create(__length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        __result__[_i] = __FirestoreDocumentChange_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    }
    return __result__;
}

/**
 * @param {Real} _ref
 */
function firebase_firestore_query_snapshot_release(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_query_snapshot_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 */
function firebase_firestore_listener_registration_remove(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_firestore_listener_registration_remove(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @returns {Real}
 */
function firebase_storage_get_instance()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_get_instance(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _url
 * @returns {Real}
 */
function firebase_storage_get_instance_with_url(_url)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_get_instance_with_url(_url, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _storage_ref
 * @returns {String}
 */
function firebase_storage_url(_storage_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    var __return_value__ = __firebase_storage_url(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _storage_ref
 * @returns {Real}
 */
function firebase_storage_get_reference(_storage_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_get_reference(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _storage_ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_storage_get_reference_path(_storage_ref, _path)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    // param: _path, type: String
    if (!is_string(_path)) show_error($"{_GMFUNCTION_} :: _path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_path));
    buffer_write(__args_buffer__, buffer_string, _path);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_get_reference_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _storage_ref
 * @param {String} _url
 * @returns {Real}
 */
function firebase_storage_get_reference_from_url(_storage_ref, _url)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    // param: _url, type: String
    if (!is_string(_url)) show_error($"{_GMFUNCTION_} :: _url expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_url));
    buffer_write(__args_buffer__, buffer_string, _url);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_get_reference_from_url(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _storage_ref
 * @returns {Real}
 */
function firebase_storage_max_download_retry_time(_storage_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    var __return_value__ = __firebase_storage_max_download_retry_time(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _storage_ref
 * @param {Real} _seconds
 */
function firebase_storage_set_max_download_retry_time(_storage_ref, _seconds)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    // param: _seconds, type: Float64
    if (!is_numeric(_seconds)) show_error($"{_GMFUNCTION_} :: _seconds expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _seconds);

    var __return_value__ = __firebase_storage_set_max_download_retry_time(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _storage_ref
 * @returns {Real}
 */
function firebase_storage_max_upload_retry_time(_storage_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    var __return_value__ = __firebase_storage_max_upload_retry_time(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _storage_ref
 * @param {Real} _seconds
 */
function firebase_storage_set_max_upload_retry_time(_storage_ref, _seconds)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    // param: _seconds, type: Float64
    if (!is_numeric(_seconds)) show_error($"{_GMFUNCTION_} :: _seconds expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _seconds);

    var __return_value__ = __firebase_storage_set_max_upload_retry_time(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _storage_ref
 * @returns {Real}
 */
function firebase_storage_max_operation_retry_time(_storage_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    var __return_value__ = __firebase_storage_max_operation_retry_time(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _storage_ref
 * @param {Real} _seconds
 */
function firebase_storage_set_max_operation_retry_time(_storage_ref, _seconds)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    // param: _seconds, type: Float64
    if (!is_numeric(_seconds)) show_error($"{_GMFUNCTION_} :: _seconds expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _seconds);

    var __return_value__ = __firebase_storage_set_max_operation_retry_time(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _storage_ref
 * @param {String} _host
 * @param {Real} _port
 */
function firebase_storage_use_emulator(_storage_ref, _host, _port)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage_ref, type: UInt64
    if (!is_numeric(_storage_ref)) show_error($"{_GMFUNCTION_} :: _storage_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage_ref);

    // param: _host, type: String
    if (!is_string(_host)) show_error($"{_GMFUNCTION_} :: _host expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_host));
    buffer_write(__args_buffer__, buffer_string, _host);

    // param: _port, type: Float64
    if (!is_numeric(_port)) show_error($"{_GMFUNCTION_} :: _port expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _port);

    var __return_value__ = __firebase_storage_use_emulator(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _path
 * @returns {Real}
 */
function firebase_storage_ref_child(_ref, _path)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _path, type: String
    if (!is_string(_path)) show_error($"{_GMFUNCTION_} :: _path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_path));
    buffer_write(__args_buffer__, buffer_string, _path);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_ref_child(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_ref_get_parent(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_ref_get_parent(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 */
function firebase_storage_ref_release(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_ref_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_ref_bucket(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_ref_bucket(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_ref_full_path(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_ref_full_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_ref_name(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_ref_name(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_storage_ref_is_valid(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_ref_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_ref_storage(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_ref_storage(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_storage_ref_delete(_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_ref_delete(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_storage_ref_get_download_url(_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_ref_get_download_url(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_storage_ref_get_metadata(_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_ref_get_metadata(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _metadata_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_storage_ref_update_metadata(_ref, _metadata_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _metadata_ref, type: UInt64
    if (!is_numeric(_metadata_ref)) show_error($"{_GMFUNCTION_} :: _metadata_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _metadata_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_ref_update_metadata(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Id.Buffer} _data
 * @param {Real} _metadata_ref
 * @param {Function} _progress_callback
 * @param {Real} _controller_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_storage_ref_put_bytes(_ref, _data, _metadata_ref, _progress_callback, _controller_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _data, type: Buffer
    if (!buffer_exists(_data)) show_error($"{_GMFUNCTION_} :: _data expected Id.Buffer", true);
    __GMFirebase_queue_buffer(buffer_get_address(_data), buffer_get_size(_data));

    // param: _metadata_ref, type: UInt64
    if (!is_numeric(_metadata_ref)) show_error($"{_GMFUNCTION_} :: _metadata_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _metadata_ref);

    // param: _progress_callback, type: optional<Function>
    if (is_undefined(_progress_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_progress_callback)) show_error($"{_GMFUNCTION_} :: _progress_callback expected callable type", true);
        var _progress_callback_handle = __ext_core_function_register(_progress_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _progress_callback_handle);
    }

    // param: _controller_ref, type: UInt64
    if (!is_numeric(_controller_ref)) show_error($"{_GMFUNCTION_} :: _controller_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _controller_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_ref_put_bytes(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _local_path
 * @param {Real} _metadata_ref
 * @param {Function} _progress_callback
 * @param {Real} _controller_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_storage_ref_put_file(_ref, _local_path, _metadata_ref, _progress_callback, _controller_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _local_path, type: String
    if (!is_string(_local_path)) show_error($"{_GMFUNCTION_} :: _local_path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_local_path));
    buffer_write(__args_buffer__, buffer_string, _local_path);

    // param: _metadata_ref, type: UInt64
    if (!is_numeric(_metadata_ref)) show_error($"{_GMFUNCTION_} :: _metadata_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _metadata_ref);

    // param: _progress_callback, type: optional<Function>
    if (is_undefined(_progress_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_progress_callback)) show_error($"{_GMFUNCTION_} :: _progress_callback expected callable type", true);
        var _progress_callback_handle = __ext_core_function_register(_progress_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _progress_callback_handle);
    }

    // param: _controller_ref, type: UInt64
    if (!is_numeric(_controller_ref)) show_error($"{_GMFUNCTION_} :: _controller_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _controller_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_ref_put_file(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _max_size
 * @param {Function} _progress_callback
 * @param {Real} _controller_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_storage_ref_get_bytes(_ref, _max_size, _progress_callback, _controller_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _max_size, type: Float64
    if (!is_numeric(_max_size)) show_error($"{_GMFUNCTION_} :: _max_size expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _max_size);

    // param: _progress_callback, type: optional<Function>
    if (is_undefined(_progress_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_progress_callback)) show_error($"{_GMFUNCTION_} :: _progress_callback expected callable type", true);
        var _progress_callback_handle = __ext_core_function_register(_progress_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _progress_callback_handle);
    }

    // param: _controller_ref, type: UInt64
    if (!is_numeric(_controller_ref)) show_error($"{_GMFUNCTION_} :: _controller_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _controller_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_ref_get_bytes(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _download_ref
 * @param {Id.Buffer} _out_buffer
 * @returns {Real}
 */
function firebase_storage_download_copy(_download_ref, _out_buffer)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _download_ref, type: UInt64
    if (!is_numeric(_download_ref)) show_error($"{_GMFUNCTION_} :: _download_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _download_ref);

    // param: _out_buffer, type: Buffer
    if (!buffer_exists(_out_buffer)) show_error($"{_GMFUNCTION_} :: _out_buffer expected Id.Buffer", true);
    __GMFirebase_queue_buffer(buffer_get_address(_out_buffer), buffer_get_size(_out_buffer));

    var __return_value__ = __firebase_storage_download_copy(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _download_ref
 */
function firebase_storage_download_release(_download_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _download_ref, type: UInt64
    if (!is_numeric(_download_ref)) show_error($"{_GMFUNCTION_} :: _download_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _download_ref);

    var __return_value__ = __firebase_storage_download_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _local_path
 * @param {Function} _progress_callback
 * @param {Real} _controller_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_storage_ref_get_file(_ref, _local_path, _progress_callback, _controller_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _local_path, type: String
    if (!is_string(_local_path)) show_error($"{_GMFUNCTION_} :: _local_path expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_local_path));
    buffer_write(__args_buffer__, buffer_string, _local_path);

    // param: _progress_callback, type: optional<Function>
    if (is_undefined(_progress_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_progress_callback)) show_error($"{_GMFUNCTION_} :: _progress_callback expected callable type", true);
        var _progress_callback_handle = __ext_core_function_register(_progress_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _progress_callback_handle);
    }

    // param: _controller_ref, type: UInt64
    if (!is_numeric(_controller_ref)) show_error($"{_GMFUNCTION_} :: _controller_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _controller_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_ref_get_file(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _max_results
 * @param {String} _page_token
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_storage_ref_list(_ref, _max_results, _page_token, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _max_results, type: Float64
    if (!is_numeric(_max_results)) show_error($"{_GMFUNCTION_} :: _max_results expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _max_results);

    // param: _page_token, type: String
    if (!is_string(_page_token)) show_error($"{_GMFUNCTION_} :: _page_token expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_page_token));
    buffer_write(__args_buffer__, buffer_string, _page_token);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_ref_list(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @returns {Real}
 */
function firebase_storage_metadata_create()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_metadata_create(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 */
function firebase_storage_metadata_release(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_storage_metadata_is_valid(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_metadata_bucket(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_bucket(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_metadata_cache_control(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_cache_control(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _value
 */
function firebase_storage_metadata_set_cache_control(_ref, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _value, type: String
    if (!is_string(_value)) show_error($"{_GMFUNCTION_} :: _value expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_value));
    buffer_write(__args_buffer__, buffer_string, _value);

    var __return_value__ = __firebase_storage_metadata_set_cache_control(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_metadata_content_disposition(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_content_disposition(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _value
 */
function firebase_storage_metadata_set_content_disposition(_ref, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _value, type: String
    if (!is_string(_value)) show_error($"{_GMFUNCTION_} :: _value expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_value));
    buffer_write(__args_buffer__, buffer_string, _value);

    var __return_value__ = __firebase_storage_metadata_set_content_disposition(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_metadata_content_encoding(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_content_encoding(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _value
 */
function firebase_storage_metadata_set_content_encoding(_ref, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _value, type: String
    if (!is_string(_value)) show_error($"{_GMFUNCTION_} :: _value expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_value));
    buffer_write(__args_buffer__, buffer_string, _value);

    var __return_value__ = __firebase_storage_metadata_set_content_encoding(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_metadata_content_language(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_content_language(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _value
 */
function firebase_storage_metadata_set_content_language(_ref, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _value, type: String
    if (!is_string(_value)) show_error($"{_GMFUNCTION_} :: _value expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_value));
    buffer_write(__args_buffer__, buffer_string, _value);

    var __return_value__ = __firebase_storage_metadata_set_content_language(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_metadata_content_type(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_content_type(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _value
 */
function firebase_storage_metadata_set_content_type(_ref, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _value, type: String
    if (!is_string(_value)) show_error($"{_GMFUNCTION_} :: _value expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_value));
    buffer_write(__args_buffer__, buffer_string, _value);

    var __return_value__ = __firebase_storage_metadata_set_content_type(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_metadata_creation_time(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_creation_time(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_metadata_generation(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_generation(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_metadata_metadata_generation(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_metadata_generation(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_metadata_name(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_name(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_metadata_path(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_metadata_get_reference(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_metadata_get_reference(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_metadata_size_bytes(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_size_bytes(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_metadata_updated_time(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_updated_time(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_metadata_custom_metadata_count(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_metadata_custom_metadata_count(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Real} _index
 * @returns {String}
 */
function firebase_storage_metadata_custom_metadata_key_at(_ref, _index)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _index, type: Float64
    if (!is_numeric(_index)) show_error($"{_GMFUNCTION_} :: _index expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _index);

    var __return_value__ = __firebase_storage_metadata_custom_metadata_key_at(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _key
 * @returns {String}
 */
function firebase_storage_metadata_get_custom_metadata(_ref, _key)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    var __return_value__ = __firebase_storage_metadata_get_custom_metadata(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _key
 * @param {String} _value
 */
function firebase_storage_metadata_set_custom_metadata(_ref, _key, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    // param: _value, type: String
    if (!is_string(_value)) show_error($"{_GMFUNCTION_} :: _value expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_value));
    buffer_write(__args_buffer__, buffer_string, _value);

    var __return_value__ = __firebase_storage_metadata_set_custom_metadata(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @returns {Real}
 */
function firebase_storage_controller_create()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_controller_create(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 */
function firebase_storage_controller_release(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_controller_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_storage_controller_is_valid(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_controller_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_storage_controller_pause(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_controller_pause(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_storage_controller_resume(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_controller_resume(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_storage_controller_cancel(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_controller_cancel(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_storage_controller_is_paused(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_controller_is_paused(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_controller_bytes_transferred(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_controller_bytes_transferred(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_controller_total_byte_count(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_controller_total_byte_count(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_controller_get_reference(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_controller_get_reference(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 */
function firebase_storage_list_result_release(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_list_result_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_storage_list_result_is_valid(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_list_result_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_list_result_item_count(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_list_result_item_count(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Real} _index
 * @returns {Real}
 */
function firebase_storage_list_result_item_at(_ref, _index)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _index, type: Float64
    if (!is_numeric(_index)) show_error($"{_GMFUNCTION_} :: _index expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _index);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_list_result_item_at(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_storage_list_result_prefix_count(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_list_result_prefix_count(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Real} _index
 * @returns {Real}
 */
function firebase_storage_list_result_prefix_at(_ref, _index)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _index, type: Float64
    if (!is_numeric(_index)) show_error($"{_GMFUNCTION_} :: _index expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _index);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_list_result_prefix_at(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_storage_list_result_next_page_token(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_storage_list_result_next_page_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @returns {Real}
 */
function firebase_functions_get_instance()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_get_instance(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _region
 * @returns {Real}
 */
function firebase_functions_get_instance_with_region(_region)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_get_instance_with_region(_region, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _functions_ref
 * @param {String} _origin
 */
function firebase_functions_use_functions_emulator(_functions_ref, _origin)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _functions_ref, type: UInt64
    if (!is_numeric(_functions_ref)) show_error($"{_GMFUNCTION_} :: _functions_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _functions_ref);

    // param: _origin, type: String
    if (!is_string(_origin)) show_error($"{_GMFUNCTION_} :: _origin expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_origin));
    buffer_write(__args_buffer__, buffer_string, _origin);

    var __return_value__ = __firebase_functions_use_functions_emulator(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _functions_ref
 * @param {String} _name
 * @param {Bool} _limited_use_app_check_token
 * @returns {Real}
 */
function firebase_functions_get_https_callable(_functions_ref, _name, _limited_use_app_check_token)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _functions_ref, type: UInt64
    if (!is_numeric(_functions_ref)) show_error($"{_GMFUNCTION_} :: _functions_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _functions_ref);

    // param: _name, type: String
    if (!is_string(_name)) show_error($"{_GMFUNCTION_} :: _name expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_name));
    buffer_write(__args_buffer__, buffer_string, _name);

    // param: _limited_use_app_check_token, type: Bool
    if (!is_bool(_limited_use_app_check_token)) show_error($"{_GMFUNCTION_} :: _limited_use_app_check_token expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _limited_use_app_check_token);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_get_https_callable(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _functions_ref
 * @param {String} _url
 * @param {Bool} _limited_use_app_check_token
 * @returns {Real}
 */
function firebase_functions_get_https_callable_from_url(_functions_ref, _url, _limited_use_app_check_token)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _functions_ref, type: UInt64
    if (!is_numeric(_functions_ref)) show_error($"{_GMFUNCTION_} :: _functions_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _functions_ref);

    // param: _url, type: String
    if (!is_string(_url)) show_error($"{_GMFUNCTION_} :: _url expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_url));
    buffer_write(__args_buffer__, buffer_string, _url);

    // param: _limited_use_app_check_token, type: Bool
    if (!is_bool(_limited_use_app_check_token)) show_error($"{_GMFUNCTION_} :: _limited_use_app_check_token expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _limited_use_app_check_token);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_get_https_callable_from_url(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_functions_callable_is_valid(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_functions_callable_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 */
function firebase_functions_callable_release(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_functions_callable_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_functions_callable_call(_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_callable_call(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _data
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_functions_callable_call_with_data(_ref, _data, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_callable_call_with_data(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @returns {Real}
 */
function firebase_remote_config_get_instance()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_get_instance(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_remote_config_ensure_initialized(_rc_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_ensure_initialized(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {Real} _fetch_timeout_ms
 * @param {Real} _minimum_fetch_interval_ms
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_remote_config_set_config_settings(_rc_ref, _fetch_timeout_ms, _minimum_fetch_interval_ms, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _fetch_timeout_ms, type: Float64
    if (!is_numeric(_fetch_timeout_ms)) show_error($"{_GMFUNCTION_} :: _fetch_timeout_ms expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _fetch_timeout_ms);

    // param: _minimum_fetch_interval_ms, type: Float64
    if (!is_numeric(_minimum_fetch_interval_ms)) show_error($"{_GMFUNCTION_} :: _minimum_fetch_interval_ms expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _minimum_fetch_interval_ms);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_set_config_settings(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @returns {Real}
 */
function firebase_remote_config_get_config_settings_fetch_timeout(_rc_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    var __return_value__ = __firebase_remote_config_get_config_settings_fetch_timeout(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @returns {Real}
 */
function firebase_remote_config_get_config_settings_minimum_fetch_interval(_rc_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    var __return_value__ = __firebase_remote_config_get_config_settings_minimum_fetch_interval(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_remote_config_fetch(_rc_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_fetch(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {Real} _cache_expiration_in_seconds
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_remote_config_fetch_with_expiration(_rc_ref, _cache_expiration_in_seconds, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _cache_expiration_in_seconds, type: Float64
    if (!is_numeric(_cache_expiration_in_seconds)) show_error($"{_GMFUNCTION_} :: _cache_expiration_in_seconds expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _cache_expiration_in_seconds);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_fetch_with_expiration(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_remote_config_fetch_and_activate(_rc_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_fetch_and_activate(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_remote_config_activate(_rc_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_activate(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @returns {Bool}
 */
function firebase_remote_config_get_boolean(_rc_ref, _key)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    var __return_value__ = __firebase_remote_config_get_boolean(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @returns {Real}
 */
function firebase_remote_config_get_long(_rc_ref, _key)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    var __return_value__ = __firebase_remote_config_get_long(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @returns {Real}
 */
function firebase_remote_config_get_double(_rc_ref, _key)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    var __return_value__ = __firebase_remote_config_get_double(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @returns {String}
 */
function firebase_remote_config_get_string(_rc_ref, _key)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    var __return_value__ = __firebase_remote_config_get_string(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @returns {Real}
 */
function firebase_remote_config_get_data_size(_rc_ref, _key)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    var __return_value__ = __firebase_remote_config_get_data_size(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @param {Id.Buffer} _out_buffer
 * @returns {Real}
 */
function firebase_remote_config_get_data(_rc_ref, _key, _out_buffer)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    // param: _out_buffer, type: Buffer
    if (!buffer_exists(_out_buffer)) show_error($"{_GMFUNCTION_} :: _out_buffer expected Id.Buffer", true);
    __GMFirebase_queue_buffer(buffer_get_address(_out_buffer), buffer_get_size(_out_buffer));

    var __return_value__ = __firebase_remote_config_get_data(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _prefix
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_remote_config_get_keys_by_prefix(_rc_ref, _prefix, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _prefix, type: String
    if (!is_string(_prefix)) show_error($"{_GMFUNCTION_} :: _prefix expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_prefix));
    buffer_write(__args_buffer__, buffer_string, _prefix);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_get_keys_by_prefix(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_remote_config_get_keys(_rc_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_get_keys(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_remote_config_get_all(_rc_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_get_all(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {Any} _defaults
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_remote_config_set_defaults(_rc_ref, _defaults, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _defaults, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _defaults);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_set_defaults(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {Any} _signals
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_remote_config_set_custom_signals(_rc_ref, _signals, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _signals, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _signals);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_set_custom_signals(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @returns {Struct.FirebaseRemoteConfigInfo}
 */
function firebase_remote_config_get_info(_rc_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_get_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = __FirebaseRemoteConfigInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_remote_config_add_config_update_listener(_rc_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_add_config_update_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _reg_ref
 * @returns {Bool}
 */
function firebase_remote_config_remove_config_update_listener(_reg_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _reg_ref, type: UInt64
    if (!is_numeric(_reg_ref)) show_error($"{_GMFUNCTION_} :: _reg_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _reg_ref);

    var __return_value__ = __firebase_remote_config_remove_config_update_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

// Skipping function firebase_messaging_initialize (no wrapper is required)


// Skipping function firebase_messaging_terminate (no wrapper is required)


// Skipping function firebase_messaging_set_registration_on_init_enabled (no wrapper is required)


// Skipping function firebase_messaging_is_registration_on_init_enabled (no wrapper is required)


// Skipping function firebase_messaging_set_token_registration_on_init_enabled (no wrapper is required)


// Skipping function firebase_messaging_is_token_registration_on_init_enabled (no wrapper is required)


// Skipping function firebase_messaging_delivery_metrics_export_to_big_query_enabled (no wrapper is required)


// Skipping function firebase_messaging_set_delivery_metrics_export_to_big_query (no wrapper is required)


/**
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_messaging_request_permission(_callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_messaging_request_permission(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_messaging_register(_callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_messaging_register(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_messaging_unregister(_callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_messaging_unregister(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_messaging_get_token(_callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_messaging_get_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_messaging_delete_token(_callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_messaging_delete_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _topic
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_messaging_subscribe(_topic, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _topic, type: String
    if (!is_string(_topic)) show_error($"{_GMFUNCTION_} :: _topic expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_topic));
    buffer_write(__args_buffer__, buffer_string, _topic);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_messaging_subscribe(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _topic
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_messaging_unsubscribe(_topic, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _topic, type: String
    if (!is_string(_topic)) show_error($"{_GMFUNCTION_} :: _topic expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_topic));
    buffer_write(__args_buffer__, buffer_string, _topic);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_messaging_unsubscribe(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Function} _callback
 */
function firebase_messaging_set_message_callback(_callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_messaging_set_message_callback(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Function} _callback
 */
function firebase_messaging_set_registration_callback(_callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_messaging_set_registration_callback(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Function} _callback
 */
function firebase_messaging_set_unregistration_callback(_callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __return_value__ = __firebase_messaging_set_unregistration_callback(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _raw_data_ref
 * @param {Id.Buffer} _out_buffer
 * @returns {Real}
 */
function firebase_messaging_raw_data_copy(_raw_data_ref, _out_buffer)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _raw_data_ref, type: UInt64
    if (!is_numeric(_raw_data_ref)) show_error($"{_GMFUNCTION_} :: _raw_data_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _raw_data_ref);

    // param: _out_buffer, type: Buffer
    if (!buffer_exists(_out_buffer)) show_error($"{_GMFUNCTION_} :: _out_buffer expected Id.Buffer", true);
    __GMFirebase_queue_buffer(buffer_get_address(_out_buffer), buffer_get_size(_out_buffer));

    var __return_value__ = __firebase_messaging_raw_data_copy(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _raw_data_ref
 */
function firebase_messaging_raw_data_release(_raw_data_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _raw_data_ref, type: UInt64
    if (!is_numeric(_raw_data_ref)) show_error($"{_GMFUNCTION_} :: _raw_data_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _raw_data_ref);

    var __return_value__ = __firebase_messaging_raw_data_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @returns {Real}
 */
function firebase_ump_get_instance()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_ump_get_instance(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _consent_ref
 * @returns {Enum.FirebaseUmpConsentStatus}
 */
function firebase_ump_get_consent_status(_consent_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_ump_get_consent_status(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _consent_ref
 * @returns {Enum.FirebaseUmpConsentFormStatus}
 */
function firebase_ump_get_consent_form_status(_consent_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_ump_get_consent_form_status(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _consent_ref
 * @returns {Enum.FirebaseUmpPrivacyOptionsRequirementStatus}
 */
function firebase_ump_get_privacy_options_requirement_status(_consent_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_ump_get_privacy_options_requirement_status(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _consent_ref
 * @returns {Bool}
 */
function firebase_ump_can_request_ads(_consent_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    var __return_value__ = __firebase_ump_can_request_ads(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _consent_ref
 */
function firebase_ump_reset(_consent_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    var __return_value__ = __firebase_ump_reset(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _consent_ref
 * @param {Enum.FirebaseUmpConsentDebugGeography} _debug_geography
 * @param {Bool} _tag_for_under_age_of_consent
 * @param {Array[String]} _debug_device_ids
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_ump_request_consent_info_update(_consent_ref, _debug_geography, _tag_for_under_age_of_consent, _debug_device_ids, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    // param: _debug_geography, type: enum FirebaseUmpConsentDebugGeography

    if (!is_numeric(_debug_geography)) show_error($"{_GMFUNCTION_} :: _debug_geography expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _debug_geography);

    // param: _tag_for_under_age_of_consent, type: Bool
    if (!is_bool(_tag_for_under_age_of_consent)) show_error($"{_GMFUNCTION_} :: _tag_for_under_age_of_consent expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _tag_for_under_age_of_consent);

    // param: _debug_device_ids, type: optional<String[]>
    if (is_undefined(_debug_device_ids))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_array(_debug_device_ids)) show_error($"{_GMFUNCTION_} :: _debug_device_ids expected array", true);
        var __length__ = array_length(_debug_device_ids);
        buffer_write(__args_buffer__, buffer_u32, __length__);
        for (var _i = 0; _i < __length__; ++_i)
        {
            if (!is_string(_debug_device_ids[_i])) show_error($"{_GMFUNCTION_} :: _debug_device_ids[_i] expected string", true);
            buffer_write(__args_buffer__, buffer_u32, string_byte_length(_debug_device_ids[_i]));
            buffer_write(__args_buffer__, buffer_string, _debug_device_ids[_i]);
        }
    }

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_ump_request_consent_info_update(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _consent_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_ump_load_consent_form(_consent_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_ump_load_consent_form(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _consent_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_ump_show_consent_form(_consent_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_ump_show_consent_form(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _consent_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_ump_load_and_show_consent_form_if_required(_consent_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_ump_load_and_show_consent_form_if_required(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _consent_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_ump_show_privacy_options_form(_consent_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_ump_show_privacy_options_form(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Enum.FirebaseAnalyticsAppLifecycleState} _state
 */
function firebase_analytics_notify_app_lifecycle_change(_state)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _state, type: enum FirebaseAnalyticsAppLifecycleState

    if (!is_numeric(_state)) show_error($"{_GMFUNCTION_} :: _state expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _state);

    var __return_value__ = __firebase_analytics_notify_app_lifecycle_change(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Id.Buffer} _hashed_email
 */
function firebase_analytics_initiate_on_device_conversion_measurement_hashed_email(_hashed_email)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _hashed_email, type: Buffer
    if (!buffer_exists(_hashed_email)) show_error($"{_GMFUNCTION_} :: _hashed_email expected Id.Buffer", true);
    __GMFirebase_queue_buffer(buffer_get_address(_hashed_email), buffer_get_size(_hashed_email));

    var __return_value__ = __firebase_analytics_initiate_on_device_conversion_measurement_hashed_email(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Id.Buffer} _hashed_phone
 */
function firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone(_hashed_phone)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _hashed_phone, type: Buffer
    if (!buffer_exists(_hashed_phone)) show_error($"{_GMFUNCTION_} :: _hashed_phone expected Id.Buffer", true);
    __GMFirebase_queue_buffer(buffer_get_address(_hashed_phone), buffer_get_size(_hashed_phone));

    var __return_value__ = __firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _provider_id
 * @param {Array[String]} _scopes
 * @param {Any} _custom_parameters
 * @returns {Real}
 */
function firebase_auth_federated_oauth_provider_create(_provider_id, _scopes, _custom_parameters)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _provider_id, type: String
    if (!is_string(_provider_id)) show_error($"{_GMFUNCTION_} :: _provider_id expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_provider_id));
    buffer_write(__args_buffer__, buffer_string, _provider_id);

    // param: _scopes, type: String[]
    if (!is_array(_scopes)) show_error($"{_GMFUNCTION_} :: _scopes expected array", true);
    var __length__ = array_length(_scopes);
    buffer_write(__args_buffer__, buffer_u32, __length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        if (!is_string(_scopes[_i])) show_error($"{_GMFUNCTION_} :: _scopes[_i] expected string", true);
        buffer_write(__args_buffer__, buffer_u32, string_byte_length(_scopes[_i]));
        buffer_write(__args_buffer__, buffer_string, _scopes[_i]);
    }

    // param: _custom_parameters, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _custom_parameters);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_federated_oauth_provider_create(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _provider
 * @param {String} _provider_id
 * @param {Array[String]} _scopes
 * @param {Any} _custom_parameters
 */
function firebase_auth_federated_oauth_provider_set_data(_provider, _provider_id, _scopes, _custom_parameters)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _provider, type: UInt64
    if (!is_numeric(_provider)) show_error($"{_GMFUNCTION_} :: _provider expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _provider);

    // param: _provider_id, type: String
    if (!is_string(_provider_id)) show_error($"{_GMFUNCTION_} :: _provider_id expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_provider_id));
    buffer_write(__args_buffer__, buffer_string, _provider_id);

    // param: _scopes, type: String[]
    if (!is_array(_scopes)) show_error($"{_GMFUNCTION_} :: _scopes expected array", true);
    var __length__ = array_length(_scopes);
    buffer_write(__args_buffer__, buffer_u32, __length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        if (!is_string(_scopes[_i])) show_error($"{_GMFUNCTION_} :: _scopes[_i] expected string", true);
        buffer_write(__args_buffer__, buffer_u32, string_byte_length(_scopes[_i]));
        buffer_write(__args_buffer__, buffer_string, _scopes[_i]);
    }

    // param: _custom_parameters, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _custom_parameters);

    var __return_value__ = __firebase_auth_federated_oauth_provider_set_data(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _provider
 */
function firebase_auth_federated_oauth_provider_release(_provider)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _provider, type: UInt64
    if (!is_numeric(_provider)) show_error($"{_GMFUNCTION_} :: _provider expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _provider);

    var __return_value__ = __firebase_auth_federated_oauth_provider_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _provider
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_sign_in_with_provider(_provider, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _provider, type: UInt64
    if (!is_numeric(_provider)) show_error($"{_GMFUNCTION_} :: _provider expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _provider);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_sign_in_with_provider(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _user
 * @returns {Array[Struct.FirebaseAuthProviderUserInfo]}
 */
function firebase_auth_user_provider_data(_user)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user, type: UInt64
    if (!is_numeric(_user)) show_error($"{_GMFUNCTION_} :: _user expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_user_provider_data(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    var __length__ = buffer_read(__ret_buffer__, buffer_u32);
    __result__ = array_create(__length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        __result__[_i] = __FirebaseAuthProviderUserInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    }
    return __result__;
}

/**
 * @param {Real} _user
 * @param {Real} _provider
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_user_reauthenticate_with_provider(_user, _provider, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user, type: UInt64
    if (!is_numeric(_user)) show_error($"{_GMFUNCTION_} :: _user expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user);

    // param: _provider, type: UInt64
    if (!is_numeric(_provider)) show_error($"{_GMFUNCTION_} :: _provider expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _provider);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_user_reauthenticate_with_provider(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _user
 * @param {Real} _provider
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_user_link_with_provider(_user, _provider, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user, type: UInt64
    if (!is_numeric(_user)) show_error($"{_GMFUNCTION_} :: _user expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user);

    // param: _provider, type: UInt64
    if (!is_numeric(_provider)) show_error($"{_GMFUNCTION_} :: _provider expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _provider);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_user_link_with_provider(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _user
 * @param {Real} _phone_credential
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_user_update_phone_number_credential(_user, _phone_credential, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user, type: UInt64
    if (!is_numeric(_user)) show_error($"{_GMFUNCTION_} :: _user expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user);

    // param: _phone_credential, type: UInt64
    if (!is_numeric(_phone_credential)) show_error($"{_GMFUNCTION_} :: _phone_credential expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _phone_credential);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_user_update_phone_number_credential(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Bool}
 */
function firebase_database_ref_is_valid(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_ref_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_get_parent(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_get_parent(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_get_root(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_get_root(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_get_database(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_get_database(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @returns {Any}
 */
function firebase_database_server_timestamp()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebase_get_decoders();

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_server_timestamp(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_on_disconnect(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_on_disconnect(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _handler
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_database_on_disconnect_cancel(_handler, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _handler, type: UInt64
    if (!is_numeric(_handler)) show_error($"{_GMFUNCTION_} :: _handler expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _handler);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_on_disconnect_cancel(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _handler
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_database_on_disconnect_remove_value(_handler, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _handler, type: UInt64
    if (!is_numeric(_handler)) show_error($"{_GMFUNCTION_} :: _handler expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _handler);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_on_disconnect_remove_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _handler
 * @param {Any} _value
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_database_on_disconnect_set_value(_handler, _value, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _handler, type: UInt64
    if (!is_numeric(_handler)) show_error($"{_GMFUNCTION_} :: _handler expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _handler);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_on_disconnect_set_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _handler
 * @param {Any} _value
 * @param {Any} _priority
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_database_on_disconnect_set_value_and_priority(_handler, _value, _priority, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _handler, type: UInt64
    if (!is_numeric(_handler)) show_error($"{_GMFUNCTION_} :: _handler expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _handler);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    // param: _priority, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _priority);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_on_disconnect_set_value_and_priority(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _handler
 * @param {Any} _values
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_database_on_disconnect_update_children(_handler, _values, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _handler, type: UInt64
    if (!is_numeric(_handler)) show_error($"{_GMFUNCTION_} :: _handler expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _handler);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_on_disconnect_update_children(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _handler
 */
function firebase_database_on_disconnect_release(_handler)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _handler, type: UInt64
    if (!is_numeric(_handler)) show_error($"{_GMFUNCTION_} :: _handler expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _handler);

    var __return_value__ = __firebase_database_on_disconnect_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Array[String]} _components
 * @returns {Real}
 */
function firebase_firestore_field_path_create(_components)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _components, type: String[]
    if (!is_array(_components)) show_error($"{_GMFUNCTION_} :: _components expected array", true);
    var __length__ = array_length(_components);
    buffer_write(__args_buffer__, buffer_u32, __length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        if (!is_string(_components[_i])) show_error($"{_GMFUNCTION_} :: _components[_i] expected string", true);
        buffer_write(__args_buffer__, buffer_u32, string_byte_length(_components[_i]));
        buffer_write(__args_buffer__, buffer_string, _components[_i]);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_path_create(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @returns {Real}
 */
function firebase_firestore_field_path_document_id()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_path_document_id(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _field_path
 * @returns {Bool}
 */
function firebase_firestore_field_path_is_valid(_field_path)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    var __return_value__ = __firebase_firestore_field_path_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_path
 * @returns {String}
 */
function firebase_firestore_field_path_to_string(_field_path)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    var __return_value__ = __firebase_firestore_field_path_to_string(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_path
 */
function firebase_firestore_field_path_release(_field_path)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    var __return_value__ = __firebase_firestore_field_path_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_equal_to(_field, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_equal_to(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_not_equal_to(_field, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_not_equal_to(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_less_than(_field, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_less_than(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_less_than_or_equal_to(_field, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_less_than_or_equal_to(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_greater_than(_field, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_greater_than(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_greater_than_or_equal_to(_field, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_greater_than_or_equal_to(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _field
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_array_contains(_field, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_array_contains(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _field
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_filter_array_contains_any(_field, _values)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_array_contains_any(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _field
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_filter_in(_field, _values)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_in(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _field
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_filter_not_in(_field, _values)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_not_in(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_equal_to_field_path(_field_path, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_equal_to_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_not_equal_to_field_path(_field_path, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_not_equal_to_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_less_than_field_path(_field_path, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_less_than_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_less_than_or_equal_to_field_path(_field_path, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_less_than_or_equal_to_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_greater_than_field_path(_field_path, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_greater_than_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_greater_than_or_equal_to_field_path(_field_path, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_greater_than_or_equal_to_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_filter_array_contains_field_path(_field_path, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_array_contains_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _field_path
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_filter_array_contains_any_field_path(_field_path, _values)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_array_contains_any_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _field_path
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_filter_in_field_path(_field_path, _values)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_in_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _field_path
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_filter_not_in_field_path(_field_path, _values)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_not_in_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Array[Real]} _filters
 * @returns {Real}
 */
function firebase_firestore_filter_and(_filters)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _filters, type: UInt64[]
    if (!is_array(_filters)) show_error($"{_GMFUNCTION_} :: _filters expected array", true);
    var __length__ = array_length(_filters);
    buffer_write(__args_buffer__, buffer_u32, __length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        if (!is_numeric(_filters[_i])) show_error($"{_GMFUNCTION_} :: _filters[_i] expected number", true);
        buffer_write(__args_buffer__, buffer_u64, _filters[_i]);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_and(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Array[Real]} _filters
 * @returns {Real}
 */
function firebase_firestore_filter_or(_filters)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _filters, type: UInt64[]
    if (!is_array(_filters)) show_error($"{_GMFUNCTION_} :: _filters expected array", true);
    var __length__ = array_length(_filters);
    buffer_write(__args_buffer__, buffer_u32, __length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        if (!is_numeric(_filters[_i])) show_error($"{_GMFUNCTION_} :: _filters[_i] expected number", true);
        buffer_write(__args_buffer__, buffer_u64, _filters[_i]);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_filter_or(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _filter
 */
function firebase_firestore_filter_release(_filter)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _filter, type: UInt64
    if (!is_numeric(_filter)) show_error($"{_GMFUNCTION_} :: _filter expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _filter);

    var __return_value__ = __firebase_firestore_filter_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _query
 * @param {Real} _filter
 * @returns {Real}
 */
function firebase_firestore_query_where_filter(_query, _filter)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _filter, type: UInt64
    if (!is_numeric(_filter)) show_error($"{_GMFUNCTION_} :: _filter expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _filter);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_filter(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_equal_to_field_path(_query, _field_path, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_equal_to_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_not_equal_to_field_path(_query, _field_path, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_not_equal_to_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_less_than_field_path(_query, _field_path, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_less_than_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_less_than_or_equal_to_field_path(_query, _field_path, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_less_than_or_equal_to_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_greater_than_field_path(_query, _field_path, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_greater_than_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_greater_than_or_equal_to_field_path(_query, _field_path, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_greater_than_or_equal_to_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_query_where_array_contains_field_path(_query, _field_path, _value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_array_contains_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_query_where_array_contains_any_field_path(_query, _field_path, _values)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_array_contains_any_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_query_where_in_field_path(_query, _field_path, _values)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_in_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Any} _values
 * @returns {Real}
 */
function firebase_firestore_query_where_not_in_field_path(_query, _field_path, _values)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _values, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _values);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_where_not_in_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @param {Real} _field_path
 * @param {Enum.FirestoreDirection} _direction
 * @returns {Real}
 */
function firebase_firestore_query_order_by_field_path(_query, _field_path, _direction)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _direction, type: enum FirestoreDirection

    if (!is_numeric(_direction)) show_error($"{_GMFUNCTION_} :: _direction expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _direction);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_order_by_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _query
 * @returns {Real}
 */
function firebase_firestore_query_count(_query)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_count(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _aggregate_query
 * @returns {Real}
 */
function firebase_firestore_aggregate_query_get_query(_aggregate_query)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _aggregate_query, type: UInt64
    if (!is_numeric(_aggregate_query)) show_error($"{_GMFUNCTION_} :: _aggregate_query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _aggregate_query);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_aggregate_query_get_query(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _aggregate_query
 * @returns {Bool}
 */
function firebase_firestore_aggregate_query_is_valid(_aggregate_query)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _aggregate_query, type: UInt64
    if (!is_numeric(_aggregate_query)) show_error($"{_GMFUNCTION_} :: _aggregate_query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _aggregate_query);

    var __return_value__ = __firebase_firestore_aggregate_query_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _aggregate_query
 * @param {Enum.FirestoreAggregateSource} _source
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_firestore_aggregate_query_get(_aggregate_query, _source, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _aggregate_query, type: UInt64
    if (!is_numeric(_aggregate_query)) show_error($"{_GMFUNCTION_} :: _aggregate_query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _aggregate_query);

    // param: _source, type: enum FirestoreAggregateSource

    if (!is_numeric(_source)) show_error($"{_GMFUNCTION_} :: _source expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _source);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_aggregate_query_get(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _aggregate_query
 */
function firebase_firestore_aggregate_query_release(_aggregate_query)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _aggregate_query, type: UInt64
    if (!is_numeric(_aggregate_query)) show_error($"{_GMFUNCTION_} :: _aggregate_query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _aggregate_query);

    var __return_value__ = __firebase_firestore_aggregate_query_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @returns {Real}
 */
function firebase_firestore_aggregate_snapshot_count(_snapshot)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_aggregate_snapshot_count(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @returns {Real}
 */
function firebase_firestore_aggregate_snapshot_get_query(_snapshot)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_aggregate_snapshot_get_query(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _snapshot
 * @returns {Bool}
 */
function firebase_firestore_aggregate_snapshot_is_valid(_snapshot)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_aggregate_snapshot_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 */
function firebase_firestore_aggregate_snapshot_release(_snapshot)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_aggregate_snapshot_release(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _firestore
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_add_snapshots_in_sync_listener(_firestore, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _firestore, type: UInt64
    if (!is_numeric(_firestore)) show_error($"{_GMFUNCTION_} :: _firestore expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _firestore);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_add_snapshots_in_sync_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _firestore
 * @param {Id.Buffer} _bundle
 * @param {Function} _progress_callback
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_firestore_load_bundle(_firestore, _bundle, _progress_callback, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _firestore, type: UInt64
    if (!is_numeric(_firestore)) show_error($"{_GMFUNCTION_} :: _firestore expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _firestore);

    // param: _bundle, type: Buffer
    if (!buffer_exists(_bundle)) show_error($"{_GMFUNCTION_} :: _bundle expected Id.Buffer", true);
    __GMFirebase_queue_buffer(buffer_get_address(_bundle), buffer_get_size(_bundle));

    // param: _progress_callback, type: optional<Function>
    if (is_undefined(_progress_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_progress_callback)) show_error($"{_GMFUNCTION_} :: _progress_callback expected callable type", true);
        var _progress_callback_handle = __ext_core_function_register(_progress_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _progress_callback_handle);
    }

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_load_bundle(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _firestore
 * @param {String} _name
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_firestore_named_query(_firestore, _name, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _firestore, type: UInt64
    if (!is_numeric(_firestore)) show_error($"{_GMFUNCTION_} :: _firestore expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _firestore);

    // param: _name, type: String
    if (!is_string(_name)) show_error($"{_GMFUNCTION_} :: _name expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_name));
    buffer_write(__args_buffer__, buffer_string, _name);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_named_query(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _document
 * @param {Any} _data
 * @param {Array[Real]} _field_paths
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_firestore_document_ref_set_merge_field_paths(_document, _data, _field_paths, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _document, type: UInt64
    if (!is_numeric(_document)) show_error($"{_GMFUNCTION_} :: _document expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    // param: _field_paths, type: UInt64[]
    if (!is_array(_field_paths)) show_error($"{_GMFUNCTION_} :: _field_paths expected array", true);
    var __length__ = array_length(_field_paths);
    buffer_write(__args_buffer__, buffer_u32, __length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        if (!is_numeric(_field_paths[_i])) show_error($"{_GMFUNCTION_} :: _field_paths[_i] expected number", true);
        buffer_write(__args_buffer__, buffer_u64, _field_paths[_i]);
    }

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_ref_set_merge_field_paths(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _batch
 * @param {Real} _document
 * @param {Any} _data
 * @param {Array[Real]} _field_paths
 * @returns {Bool}
 */
function firebase_firestore_write_batch_set_merge_field_paths(_batch, _document, _data, _field_paths)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _batch, type: UInt64
    if (!is_numeric(_batch)) show_error($"{_GMFUNCTION_} :: _batch expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _batch);

    // param: _document, type: UInt64
    if (!is_numeric(_document)) show_error($"{_GMFUNCTION_} :: _document expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document);

    // param: _data, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _data);

    // param: _field_paths, type: UInt64[]
    if (!is_array(_field_paths)) show_error($"{_GMFUNCTION_} :: _field_paths expected array", true);
    var __length__ = array_length(_field_paths);
    buffer_write(__args_buffer__, buffer_u32, __length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        if (!is_numeric(_field_paths[_i])) show_error($"{_GMFUNCTION_} :: _field_paths[_i] expected number", true);
        buffer_write(__args_buffer__, buffer_u64, _field_paths[_i]);
    }

    var __return_value__ = __firebase_firestore_write_batch_set_merge_field_paths(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _metadata
 * @returns {String}
 */
function firebase_storage_metadata_md5_hash(_metadata)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _metadata, type: UInt64
    if (!is_numeric(_metadata)) show_error($"{_GMFUNCTION_} :: _metadata expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _metadata);

    var __return_value__ = __firebase_storage_metadata_md5_hash(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_remote_config_ensure_initialized_info(_rc_ref, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_ensure_initialized_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @returns {Struct.FirebaseRemoteConfigBooleanInfo}
 */
function firebase_remote_config_get_boolean_with_info(_rc_ref, _key)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_get_boolean_with_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = __FirebaseRemoteConfigBooleanInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @returns {Struct.FirebaseRemoteConfigLongInfo}
 */
function firebase_remote_config_get_long_with_info(_rc_ref, _key)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_get_long_with_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = __FirebaseRemoteConfigLongInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @returns {Struct.FirebaseRemoteConfigDoubleInfo}
 */
function firebase_remote_config_get_double_with_info(_rc_ref, _key)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_get_double_with_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = __FirebaseRemoteConfigDoubleInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @returns {Struct.FirebaseRemoteConfigStringInfo}
 */
function firebase_remote_config_get_string_with_info(_rc_ref, _key)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_get_string_with_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = __FirebaseRemoteConfigStringInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @param {Id.Buffer} _out_buffer
 * @returns {Struct.FirebaseRemoteConfigDataInfo}
 */
function firebase_remote_config_get_data_with_info(_rc_ref, _key, _out_buffer)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _rc_ref, type: UInt64
    if (!is_numeric(_rc_ref)) show_error($"{_GMFUNCTION_} :: _rc_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _rc_ref);

    // param: _key, type: String
    if (!is_string(_key)) show_error($"{_GMFUNCTION_} :: _key expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_key));
    buffer_write(__args_buffer__, buffer_string, _key);

    // param: _out_buffer, type: Buffer
    if (!buffer_exists(_out_buffer)) show_error($"{_GMFUNCTION_} :: _out_buffer expected Id.Buffer", true);
    __GMFirebase_queue_buffer(buffer_get_address(_out_buffer), buffer_get_size(_out_buffer));

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_get_data_with_info(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = __FirebaseRemoteConfigDataInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

// Skipping function firebase_messaging_initialize_with_options (no wrapper is required)


/**
 * @param {Real} _field_value
 * @returns {Enum.FirestoreFieldValueType}
 */
function firebase_firestore_field_value_type(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_type(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_valid(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_null(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_null(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_boolean(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_boolean(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_integer(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_integer(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_double(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_double(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_timestamp(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_timestamp(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_string(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_string(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_blob(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_blob(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_reference(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_reference(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_geo_point(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_geo_point(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_array(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_array(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_is_map(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_is_map(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Bool}
 */
function firebase_firestore_field_value_boolean_value(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_boolean_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Real}
 */
function firebase_firestore_field_value_integer_value(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_integer_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Real}
 */
function firebase_firestore_field_value_double_value(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_double_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {String}
 */
function firebase_firestore_field_value_string_value(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_string_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Real}
 */
function firebase_firestore_field_value_blob_size(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_blob_size(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @param {Id.Buffer} _out_buffer
 * @returns {Real}
 */
function firebase_firestore_field_value_blob_copy(_field_value, _out_buffer)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    // param: _out_buffer, type: Buffer
    if (!buffer_exists(_out_buffer)) show_error($"{_GMFUNCTION_} :: _out_buffer expected Id.Buffer", true);
    __GMFirebase_queue_buffer(buffer_get_address(_out_buffer), buffer_get_size(_out_buffer));

    var __return_value__ = __firebase_firestore_field_value_blob_copy(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _field_value
 * @returns {Real}
 */
function firebase_firestore_field_value_reference_value(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_reference_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _field_value
 * @returns {Struct.FirestoreTimestamp}
 */
function firebase_firestore_field_value_timestamp_value(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_timestamp_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = __FirestoreTimestamp_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

/**
 * @param {Real} _field_value
 * @returns {Struct.FirestoreGeoPoint}
 */
function firebase_firestore_field_value_geo_point_value(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_geo_point_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = __FirestoreGeoPoint_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

/**
 * @param {Real} _field_value
 * @returns {Any}
 */
function firebase_firestore_field_value_array_value(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebase_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_array_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _field_value
 * @returns {Any}
 */
function firebase_firestore_field_value_map_value(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebase_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_map_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _field_value
 * @returns {String}
 */
function firebase_firestore_field_value_to_string(_field_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _field_value, type: UInt64
    if (!is_numeric(_field_value)) show_error($"{_GMFUNCTION_} :: _field_value expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_value);

    var __return_value__ = __firebase_firestore_field_value_to_string(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _query
 * @returns {Real}
 */
function firebase_firestore_query_get_firestore(_query)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _query, type: UInt64
    if (!is_numeric(_query)) show_error($"{_GMFUNCTION_} :: _query expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _query);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_get_firestore(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _document
 * @returns {Real}
 */
function firebase_firestore_document_ref_get_firestore(_document)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _document, type: UInt64
    if (!is_numeric(_document)) show_error($"{_GMFUNCTION_} :: _document expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_ref_get_firestore(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _document
 * @returns {String}
 */
function firebase_firestore_document_ref_to_string(_document)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _document, type: UInt64
    if (!is_numeric(_document)) show_error($"{_GMFUNCTION_} :: _document expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document);

    var __return_value__ = __firebase_firestore_document_ref_to_string(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _document
 * @param {Array[Struct.FirestoreFieldPathValue]} _entries
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_firestore_document_ref_update_field_paths(_document, _entries, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _document, type: UInt64
    if (!is_numeric(_document)) show_error($"{_GMFUNCTION_} :: _document expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document);

    // param: _entries, type: struct FirestoreFieldPathValue[]
    if (!is_array(_entries)) show_error($"{_GMFUNCTION_} :: _entries expected array", true);
    var __length__ = array_length(_entries);
    buffer_write(__args_buffer__, buffer_u32, __length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        if (_entries[_i].__uid != 696662754) show_error($"{_GMFUNCTION_} :: _entries[_i] expected FirestoreFieldPathValue", true);
        __FirestoreFieldPathValue_encode(_entries[_i], __args_buffer__, buffer_tell(__args_buffer__), _GMFUNCTION_);
    }

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_ref_update_field_paths(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _batch
 * @param {Real} _document
 * @param {Array[Struct.FirestoreFieldPathValue]} _entries
 * @returns {Bool}
 */
function firebase_firestore_write_batch_update_field_paths(_batch, _document, _entries)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _batch, type: UInt64
    if (!is_numeric(_batch)) show_error($"{_GMFUNCTION_} :: _batch expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _batch);

    // param: _document, type: UInt64
    if (!is_numeric(_document)) show_error($"{_GMFUNCTION_} :: _document expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _document);

    // param: _entries, type: struct FirestoreFieldPathValue[]
    if (!is_array(_entries)) show_error($"{_GMFUNCTION_} :: _entries expected array", true);
    var __length__ = array_length(_entries);
    buffer_write(__args_buffer__, buffer_u32, __length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        if (_entries[_i].__uid != 696662754) show_error($"{_GMFUNCTION_} :: _entries[_i] expected FirestoreFieldPathValue", true);
        __FirestoreFieldPathValue_encode(_entries[_i], __args_buffer__, buffer_tell(__args_buffer__), _GMFUNCTION_);
    }

    var __return_value__ = __firebase_firestore_write_batch_update_field_paths(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _batch
 * @returns {Bool}
 */
function firebase_firestore_write_batch_is_valid(_batch)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _batch, type: UInt64
    if (!is_numeric(_batch)) show_error($"{_GMFUNCTION_} :: _batch expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _batch);

    var __return_value__ = __firebase_firestore_write_batch_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _firestore
 * @returns {String}
 */
function firebase_firestore_settings_to_string(_firestore)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _firestore, type: UInt64
    if (!is_numeric(_firestore)) show_error($"{_GMFUNCTION_} :: _firestore expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _firestore);

    var __return_value__ = __firebase_firestore_settings_to_string(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @returns {Bool}
 */
function firebase_firestore_document_snapshot_is_valid(_snapshot)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_document_snapshot_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @returns {String}
 */
function firebase_firestore_document_snapshot_to_string(_snapshot)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_document_snapshot_to_string(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @param {Real} _field_path
 * @param {Enum.FirestoreServerTimestampBehavior} _server_timestamp_behavior
 * @returns {Struct.FirestoreFieldLookup}
 */
function firebase_firestore_document_snapshot_get_field_path(_snapshot, _field_path, _server_timestamp_behavior)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    // param: _field_path, type: UInt64
    if (!is_numeric(_field_path)) show_error($"{_GMFUNCTION_} :: _field_path expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _field_path);

    // param: _server_timestamp_behavior, type: enum FirestoreServerTimestampBehavior

    if (!is_numeric(_server_timestamp_behavior)) show_error($"{_GMFUNCTION_} :: _server_timestamp_behavior expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _server_timestamp_behavior);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_snapshot_get_field_path(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = __FirestoreFieldLookup_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

/**
 * @param {Real} _snapshot
 * @returns {Bool}
 */
function firebase_firestore_query_snapshot_is_valid(_snapshot)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_query_snapshot_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @returns {Real}
 */
function firebase_firestore_query_snapshot_get_query(_snapshot)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_snapshot_get_query(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _listener
 * @returns {Bool}
 */
function firebase_firestore_listener_registration_is_valid(_listener)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _listener, type: UInt64
    if (!is_numeric(_listener)) show_error($"{_GMFUNCTION_} :: _listener expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _listener);

    var __return_value__ = __firebase_firestore_listener_registration_is_valid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @returns {Real}
 */
function firebase_app_get_default_handle()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_get_default_handle(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _name
 * @returns {Real}
 */
function firebase_app_get_instance(_name)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_get_instance(_name, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @returns {Array[Real]}
 */
function firebase_app_get_apps()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_get_apps(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    var __length__ = buffer_read(__ret_buffer__, buffer_u32);
    __result__ = array_create(__length__);
    for (var _i = 0; _i < __length__; ++_i)
    {
        __result__[_i] = buffer_read(__ret_buffer__, buffer_u64);
    }
    return __result__;
}

/**
 * @param {Struct.FirebaseAppOptions} _options
 * @param {String} _name
 * @returns {Real}
 */
function firebase_app_initialize_with_options(_options, _name)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _options, type: struct FirebaseAppOptions
    if (_options.__uid != 1906593923) show_error($"{_GMFUNCTION_} :: _options expected FirebaseAppOptions", true);
    __FirebaseAppOptions_encode(_options, __args_buffer__, buffer_tell(__args_buffer__), _GMFUNCTION_);

    // param: _name, type: String
    if (!is_string(_name)) show_error($"{_GMFUNCTION_} :: _name expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_name));
    buffer_write(__args_buffer__, buffer_string, _name);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_initialize_with_options(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _json_config
 * @param {String} _name
 * @returns {Real}
 */
function firebase_app_initialize_from_json(_json_config, _name)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_initialize_from_json(_json_config, _name, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @returns {String}
 */
function firebase_app_handle_get_name(_app)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __return_value__ = __firebase_app_handle_get_name(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _app
 * @returns {Struct.FirebaseAppOptions}
 */
function firebase_app_handle_get_options(_app)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_handle_get_options(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = __FirebaseAppOptions_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

/**
 * @returns {Struct.FirebaseAppOptions}
 */
function firebase_app_get_default_options()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_app_get_default_options(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    if (buffer_read(__ret_buffer__, buffer_bool))
    {
        __result__ = __FirebaseAppOptions_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    }
    else
    {
        __result__ = undefined;
    }
    return __result__;
}

/**
 * @param {Real} _app
 */
function firebase_app_release_handle(_app)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __return_value__ = __firebase_app_release_handle(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Enum.FirebaseLogLevel} _level
 */
function firebase_set_log_level(_level)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _level, type: enum FirebaseLogLevel

    if (!is_numeric(_level)) show_error($"{_GMFUNCTION_} :: _level expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _level);

    var __return_value__ = __firebase_set_log_level(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @returns {Enum.FirebaseLogLevel}
 */
function firebase_get_log_level()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_get_log_level(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @returns {Real}
 */
function firebase_auth_get_app()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_get_app(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _database
 * @returns {Real}
 */
function firebase_database_get_app(_database)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _database, type: UInt64
    if (!is_numeric(_database)) show_error($"{_GMFUNCTION_} :: _database expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _database);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_get_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @returns {Real}
 */
function firebase_database_get_instance_for_app(_app)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_get_instance_for_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @param {String} _url
 * @returns {Real}
 */
function firebase_database_get_instance_for_app_url(_app, _url)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    // param: _url, type: String
    if (!is_string(_url)) show_error($"{_GMFUNCTION_} :: _url expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_url));
    buffer_write(__args_buffer__, buffer_string, _url);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_get_instance_for_app_url(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _firestore
 * @returns {Real}
 */
function firebase_firestore_get_app(_firestore)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _firestore, type: UInt64
    if (!is_numeric(_firestore)) show_error($"{_GMFUNCTION_} :: _firestore expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _firestore);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_get_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @returns {Real}
 */
function firebase_firestore_get_instance_for_app(_app)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_get_instance_for_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @param {String} _database_id
 * @returns {Real}
 */
function firebase_firestore_get_instance_for_app_database(_app, _database_id)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    // param: _database_id, type: String
    if (!is_string(_database_id)) show_error($"{_GMFUNCTION_} :: _database_id expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_database_id));
    buffer_write(__args_buffer__, buffer_string, _database_id);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_get_instance_for_app_database(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _storage
 * @returns {Real}
 */
function firebase_storage_get_app(_storage)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _storage, type: UInt64
    if (!is_numeric(_storage)) show_error($"{_GMFUNCTION_} :: _storage expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _storage);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_get_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @returns {Real}
 */
function firebase_storage_get_instance_for_app(_app)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_get_instance_for_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @param {String} _url
 * @returns {Real}
 */
function firebase_storage_get_instance_for_app_url(_app, _url)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    // param: _url, type: String
    if (!is_string(_url)) show_error($"{_GMFUNCTION_} :: _url expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_url));
    buffer_write(__args_buffer__, buffer_string, _url);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_storage_get_instance_for_app_url(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _functions
 * @returns {Real}
 */
function firebase_functions_get_app(_functions)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _functions, type: UInt64
    if (!is_numeric(_functions)) show_error($"{_GMFUNCTION_} :: _functions expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _functions);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_get_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _callable
 * @returns {Real}
 */
function firebase_functions_callable_get_functions(_callable)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callable, type: UInt64
    if (!is_numeric(_callable)) show_error($"{_GMFUNCTION_} :: _callable expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _callable);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_callable_get_functions(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @returns {Real}
 */
function firebase_functions_get_instance_for_app(_app)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_get_instance_for_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @param {String} _region
 * @returns {Real}
 */
function firebase_functions_get_instance_for_app_region(_app, _region)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    // param: _region, type: String
    if (!is_string(_region)) show_error($"{_GMFUNCTION_} :: _region expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_region));
    buffer_write(__args_buffer__, buffer_string, _region);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_get_instance_for_app_region(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _remote_config
 * @returns {Real}
 */
function firebase_remote_config_get_app(_remote_config)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _remote_config, type: UInt64
    if (!is_numeric(_remote_config)) show_error($"{_GMFUNCTION_} :: _remote_config expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _remote_config);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_get_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Bool} _value
 * @returns {Real}
 */
function firebase_firestore_field_value_boolean(_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_boolean(_value, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {String} _value
 * @returns {Real}
 */
function firebase_firestore_field_value_string(_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_string(_value, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_field_value_array(_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_array(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Any} _value
 * @returns {Real}
 */
function firebase_firestore_field_value_map(_value)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _value, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _value);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_map(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @returns {Real}
 */
function firebase_remote_config_get_instance_for_app(_app)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_remote_config_get_instance_for_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @returns {Bool}
 */
function firebase_analytics_initialize_for_app(_app)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __return_value__ = __firebase_analytics_initialize_for_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _app
 * @returns {Bool}
 */
function firebase_messaging_initialize_for_app(_app)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __return_value__ = __firebase_messaging_initialize_for_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _app
 * @param {Bool} _suppress_notification_permission_prompt
 * @returns {Bool}
 */
function firebase_messaging_initialize_for_app_with_options(_app, _suppress_notification_permission_prompt)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    // param: _suppress_notification_permission_prompt, type: Bool
    if (!is_bool(_suppress_notification_permission_prompt)) show_error($"{_GMFUNCTION_} :: _suppress_notification_permission_prompt expected bool", true);
    buffer_write(__args_buffer__, buffer_bool, _suppress_notification_permission_prompt);

    var __return_value__ = __firebase_messaging_initialize_for_app_with_options(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _app
 * @returns {Real}
 */
function firebase_ump_get_instance_for_app(_app)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_ump_get_instance_for_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @returns {Real}
 */
function firebase_auth_get_current_instance_handle()
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_get_current_instance_handle(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _app
 * @returns {Real}
 */
function firebase_auth_get_instance_for_app(_app)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _app, type: UInt64
    if (!is_numeric(_app)) show_error($"{_GMFUNCTION_} :: _app expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _app);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_get_instance_for_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _auth
 * @returns {Bool}
 */
function firebase_auth_use_instance(_auth)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _auth, type: UInt64
    if (!is_numeric(_auth)) show_error($"{_GMFUNCTION_} :: _auth expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _auth);

    var __return_value__ = __firebase_auth_use_instance(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _auth
 * @returns {Real}
 */
function firebase_auth_instance_get_app(_auth)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _auth, type: UInt64
    if (!is_numeric(_auth)) show_error($"{_GMFUNCTION_} :: _auth expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _auth);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_instance_get_app(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _snapshot
 * @returns {String}
 */
function firebase_firestore_document_snapshot_metadata_to_string(_snapshot)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_document_snapshot_metadata_to_string(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _snapshot
 * @returns {String}
 */
function firebase_firestore_query_snapshot_metadata_to_string(_snapshot)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __return_value__ = __firebase_firestore_query_snapshot_metadata_to_string(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

// Skipping function firebase_get_sdk_version (no wrapper is required)


/**
 * @param {Real} _snapshot
 * @returns {Real}
 */
function firebase_firestore_document_snapshot_reference(_snapshot)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _snapshot, type: UInt64
    if (!is_numeric(_snapshot)) show_error($"{_GMFUNCTION_} :: _snapshot expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _snapshot);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_snapshot_reference(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

// Skipping function firebase_auth_email_auth_provider_id (no wrapper is required)


// Skipping function firebase_auth_facebook_auth_provider_id (no wrapper is required)


// Skipping function firebase_auth_game_center_auth_provider_id (no wrapper is required)


// Skipping function firebase_auth_github_auth_provider_id (no wrapper is required)


// Skipping function firebase_auth_google_auth_provider_id (no wrapper is required)


// Skipping function firebase_auth_microsoft_auth_provider_id (no wrapper is required)


// Skipping function firebase_auth_play_games_auth_provider_id (no wrapper is required)


// Skipping function firebase_auth_twitter_auth_provider_id (no wrapper is required)


// Skipping function firebase_auth_yahoo_auth_provider_id (no wrapper is required)


/**
 * @param {Function} _callback
 * @returns {Enum.FirebaseError}
 */
function firebase_auth_game_center_auth_provider_get_credential_last_result(_callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _callback, type: optional<Function>
    if (is_undefined(_callback))
    {
        buffer_write(__args_buffer__, buffer_bool, false);
    }
    else
    {
        buffer_write(__args_buffer__, buffer_bool, true);
        if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
        var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
        buffer_write(__args_buffer__, buffer_u64, _callback_handle);
    }

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_game_center_auth_provider_get_credential_last_result(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/// @ignore
function __GMFirebase_get_decoders()
{
    static __decoders__ = [
        __FirebaseAnalyticsParameter_decode,
        __FirebaseAppCheckToken_decode,
        __FirebaseAuthProviderUserInfo_decode,
        __FirebaseAuthAdditionalUserInfo_decode,
        __FirebaseAuthUserInfo_decode,
        __FirebaseDatabaseReferenceInfo_decode,
        __FirebaseDataSnapshotInfo_decode,
        __FirebaseMutableDataInfo_decode,
        __FirestoreTimestamp_decode,
        __FirestoreGeoPoint_decode,
        __FirestoreBlob_decode,
        __FirestoreReference_decode,
        __FirestoreDocumentChange_decode,
        __FirestoreFieldLookup_decode,
        __FirestoreFieldPathValue_decode,
        __FirestoreLoadBundleTaskProgress_decode,
        __FirestoreDocumentSnapshotInfo_decode,
        __FirestoreQuerySnapshotInfo_decode,
        __FirebaseRemoteConfigInfo_decode,
        __FirebaseRemoteConfigBooleanInfo_decode,
        __FirebaseRemoteConfigLongInfo_decode,
        __FirebaseRemoteConfigDoubleInfo_decode,
        __FirebaseRemoteConfigStringInfo_decode,
        __FirebaseRemoteConfigDataInfo_decode,
        __FirebaseMessagingAndroidNotificationParams_decode,
        __FirebaseAppOptions_decode,
        __FirebaseAuthResult_decode,
        __FirebaseMessagingNotification_decode,
        __FirebaseMessagingMessage_decode
    ];
    return __decoders__;
}
/// @ignore
function __GMFirebase_get_dispatcher()
{
    static __dispatcher__ = new __GMNativeFunctionDispatcher(__GMFirebase_invocation_handler, __GMFirebase_get_decoders());
    return __dispatcher__;
}
/// @ignore
function __GMFirebase_is_available()
{
    static __available__ = extension_exists("GMFirebase");
    return __available__;
}
// #####################################################################
// # Exports
// #####################################################################

#export FirebaseError, FirebaseAppCheckError, FirebaseAppCheckProvider, FirebaseAuthError, FirebaseLogLevel, FirebaseDatabaseError, FirestoreError, FirestoreSource, FirestoreDirection, FirestoreServerTimestampBehavior, FirestoreDocumentChangeType, FirestoreLoadBundleTaskState, FirestoreFieldValueType, FirebaseStorageError, FirebaseFunctionsError, FirebaseRemoteConfigLastFetchStatus, FirebaseRemoteConfigFetchFailureReason, FirebaseRemoteConfigValueSource, FirebaseRemoteConfigError, FirebaseMessagingError, FirebaseUmpConsentStatus, FirebaseUmpConsentFormStatus, FirebaseUmpPrivacyOptionsRequirementStatus, FirebaseUmpConsentDebugGeography, FirebaseUmpConsentRequestError, FirebaseUmpConsentFormError, FirebaseAnalyticsAppLifecycleState, FirestoreAggregateSource, FirebaseAnalyticsParameter, FirebaseAppCheckToken, FirebaseAuthProviderUserInfo, FirebaseAuthAdditionalUserInfo, FirebaseAuthUserInfo, FirebaseDatabaseReferenceInfo, FirebaseDataSnapshotInfo, FirebaseMutableDataInfo, FirestoreTimestamp, FirestoreGeoPoint, FirestoreBlob, FirestoreReference, FirestoreDocumentChange, FirestoreFieldLookup, FirestoreFieldPathValue, FirestoreLoadBundleTaskProgress, FirestoreDocumentSnapshotInfo, FirestoreQuerySnapshotInfo, FirebaseRemoteConfigInfo, FirebaseRemoteConfigBooleanInfo, FirebaseRemoteConfigLongInfo, FirebaseRemoteConfigDoubleInfo, FirebaseRemoteConfigStringInfo, FirebaseRemoteConfigDataInfo, FirebaseMessagingAndroidNotificationParams, FirebaseAppOptions, FirebaseAuthResult, FirebaseMessagingNotification, FirebaseMessagingMessage, firebase_last_error_code, firebase_analytics_set_consent, firebase_analytics_log_event_params, firebase_analytics_set_default_event_parameters, firebase_analytics_log_apple_transaction, firebase_analytics_get_analytics_instance_id, firebase_analytics_get_session_id, firebase_analytics_set_log_callback, firebase_app_check_set_provider_factory, firebase_app_check_get_instance, firebase_app_check_get_instance_for_app, firebase_app_check_get_app, firebase_app_check_set_token_auto_refresh_enabled, firebase_app_check_get_token, firebase_app_check_get_limited_use_token, firebase_app_check_add_listener, firebase_app_check_remove_listener, firebase_installations_get_instance, firebase_installations_get_instance_for_app, firebase_installations_get_app, firebase_installations_get_id, firebase_installations_get_token, firebase_installations_delete, firebase_auth_current_user, firebase_auth_fetch_providers_for_email, firebase_auth_sign_in_with_custom_token, firebase_auth_sign_in_with_credential, firebase_auth_sign_in_and_retrieve_data_with_credential, firebase_auth_sign_in_anonymously, firebase_auth_sign_in_with_email_and_password, firebase_auth_create_user_with_email_and_password, firebase_auth_send_password_reset_email, firebase_auth_add_state_listener, firebase_auth_remove_state_listener, firebase_auth_add_id_token_listener, firebase_auth_remove_id_token_listener, firebase_auth_credential_provider, firebase_auth_credential_is_valid, firebase_auth_credential_release, firebase_auth_email_auth_provider_get_credential, firebase_auth_facebook_auth_provider_get_credential, firebase_auth_game_center_auth_provider_get_credential, firebase_auth_github_auth_provider_get_credential, firebase_auth_google_auth_provider_get_credential, firebase_auth_oauth_provider_get_credential, firebase_auth_oauth_provider_get_credential_with_nonce, firebase_auth_play_games_auth_provider_get_credential, firebase_auth_twitter_auth_provider_get_credential, firebase_auth_phone_verify_phone_number, firebase_auth_phone_get_credential, firebase_auth_phone_credential_sms_code, firebase_auth_phone_resending_token_release, firebase_auth_phone_listener_release, firebase_auth_user_get_info, firebase_auth_user_release, firebase_auth_user_is_valid, firebase_auth_user_get_token, firebase_auth_user_update_password, firebase_auth_user_update_profile, firebase_auth_user_send_email_verification, firebase_auth_user_send_email_verification_before_updating_email, firebase_auth_user_reauthenticate, firebase_auth_user_reauthenticate_and_retrieve_data, firebase_auth_user_link_with_credential, firebase_auth_user_unlink, firebase_auth_user_reload, firebase_auth_user_delete, firebase_database_get_instance, firebase_database_get_instance_for_url, firebase_database_get_url, firebase_database_get_reference, firebase_database_get_reference_at_path, firebase_database_get_reference_from_url, firebase_database_go_offline, firebase_database_go_online, firebase_database_purge_outstanding_writes, firebase_database_set_persistence_enabled, firebase_database_set_log_level, firebase_database_get_log_level, firebase_database_query_order_by_child, firebase_database_query_order_by_key, firebase_database_query_order_by_value, firebase_database_query_order_by_priority, firebase_database_query_start_at, firebase_database_query_start_at_key, firebase_database_query_end_at, firebase_database_query_end_at_key, firebase_database_query_equal_to, firebase_database_query_equal_to_key, firebase_database_query_limit_to_first, firebase_database_query_limit_to_last, firebase_database_query_get_reference, firebase_database_query_set_keep_synchronized, firebase_database_query_is_valid, firebase_database_query_get_value, firebase_database_query_add_value_listener, firebase_database_query_remove_value_listener, firebase_database_query_remove_all_value_listeners, firebase_database_query_add_child_listener, firebase_database_query_remove_child_listener, firebase_database_query_remove_all_child_listeners, firebase_database_query_release, firebase_database_ref_get, firebase_database_ref_child, firebase_database_ref_push, firebase_database_ref_go_online, firebase_database_ref_go_offline, firebase_database_ref_set_value, firebase_database_ref_set_priority, firebase_database_ref_set_value_and_priority, firebase_database_ref_update_children, firebase_database_ref_remove_value, firebase_database_ref_run_transaction, firebase_database_ref_release, firebase_database_snapshot_is_valid, firebase_database_snapshot_child, firebase_database_snapshot_has_child, firebase_database_snapshot_get_children, firebase_database_snapshot_get_reference, firebase_database_snapshot_get_info, firebase_database_snapshot_get_value, firebase_database_snapshot_get_priority, firebase_database_snapshot_release, firebase_database_mutable_data_get_info, firebase_database_mutable_data_child, firebase_database_mutable_data_has_child, firebase_database_mutable_data_get_children, firebase_database_mutable_data_get_value, firebase_database_mutable_data_get_priority, firebase_database_mutable_data_set_value, firebase_database_mutable_data_set_priority, firebase_database_transaction_commit, firebase_database_transaction_abort, firebase_firestore_get_instance, firebase_firestore_get_instance_for_database, firebase_firestore_settings_get_host, firebase_firestore_settings_set_host, firebase_firestore_settings_get_ssl_enabled, firebase_firestore_settings_set_ssl_enabled, firebase_firestore_settings_get_persistence_enabled, firebase_firestore_settings_set_persistence_enabled, firebase_firestore_settings_get_cache_size_bytes, firebase_firestore_settings_set_cache_size_bytes, firebase_firestore_collection, firebase_firestore_document, firebase_firestore_collection_group, firebase_firestore_batch, firebase_firestore_set_log_level, firebase_firestore_enable_network, firebase_firestore_disable_network, firebase_firestore_terminate, firebase_firestore_clear_persistence, firebase_firestore_wait_for_pending_writes, firebase_firestore_run_transaction, firebase_firestore_transaction_get, firebase_firestore_transaction_set, firebase_firestore_transaction_set_merge, firebase_firestore_transaction_set_merge_fields, firebase_firestore_transaction_set_merge_field_paths, firebase_firestore_transaction_update, firebase_firestore_transaction_update_field_paths, firebase_firestore_transaction_delete, firebase_firestore_transaction_commit, firebase_firestore_transaction_abort, firebase_firestore_collection_ref_id, firebase_firestore_collection_ref_path, firebase_firestore_collection_ref_parent, firebase_firestore_collection_ref_document, firebase_firestore_collection_ref_document_path, firebase_firestore_collection_ref_add, firebase_firestore_collection_ref_is_valid, firebase_firestore_collection_ref_release, firebase_firestore_document_ref_id, firebase_firestore_document_ref_path, firebase_firestore_document_ref_parent, firebase_firestore_document_ref_collection, firebase_firestore_document_ref_get, firebase_firestore_document_ref_set, firebase_firestore_document_ref_set_merge, firebase_firestore_document_ref_set_merge_fields, firebase_firestore_document_ref_update, firebase_firestore_document_ref_delete, firebase_firestore_document_ref_add_snapshot_listener, firebase_firestore_document_ref_is_valid, firebase_firestore_document_ref_release, firebase_firestore_query_where_equal_to, firebase_firestore_query_where_not_equal_to, firebase_firestore_query_where_less_than, firebase_firestore_query_where_less_than_or_equal_to, firebase_firestore_query_where_greater_than, firebase_firestore_query_where_greater_than_or_equal_to, firebase_firestore_query_where_array_contains, firebase_firestore_query_where_array_contains_any, firebase_firestore_query_where_in, firebase_firestore_query_where_not_in, firebase_firestore_query_order_by, firebase_firestore_query_limit, firebase_firestore_query_limit_to_last, firebase_firestore_query_start_at_snapshot, firebase_firestore_query_start_at_values, firebase_firestore_query_start_after_snapshot, firebase_firestore_query_start_after_values, firebase_firestore_query_end_before_snapshot, firebase_firestore_query_end_before_values, firebase_firestore_query_end_at_snapshot, firebase_firestore_query_end_at_values, firebase_firestore_query_get, firebase_firestore_query_add_snapshot_listener, firebase_firestore_query_is_valid, firebase_firestore_query_release, firebase_firestore_write_batch_set, firebase_firestore_write_batch_set_merge, firebase_firestore_write_batch_set_merge_fields, firebase_firestore_write_batch_update, firebase_firestore_write_batch_delete, firebase_firestore_write_batch_commit, firebase_firestore_write_batch_release, firebase_firestore_field_value_delete, firebase_firestore_field_value_server_timestamp, firebase_firestore_field_value_array_union, firebase_firestore_field_value_array_remove, firebase_firestore_field_value_increment_integer, firebase_firestore_field_value_increment_double, firebase_firestore_field_value_integer, firebase_firestore_field_value_double, firebase_firestore_field_value_timestamp, firebase_firestore_field_value_geo_point, firebase_firestore_field_value_reference, firebase_firestore_field_value_blob, firebase_firestore_field_value_null, firebase_firestore_field_value_release, firebase_firestore_document_snapshot_get_info, firebase_firestore_document_snapshot_get, firebase_firestore_document_snapshot_get_data, firebase_firestore_document_snapshot_release, firebase_firestore_query_snapshot_get_info, firebase_firestore_query_snapshot_documents, firebase_firestore_query_snapshot_document_changes, firebase_firestore_query_snapshot_release, firebase_firestore_listener_registration_remove, firebase_storage_get_instance, firebase_storage_get_instance_with_url, firebase_storage_url, firebase_storage_get_reference, firebase_storage_get_reference_path, firebase_storage_get_reference_from_url, firebase_storage_max_download_retry_time, firebase_storage_set_max_download_retry_time, firebase_storage_max_upload_retry_time, firebase_storage_set_max_upload_retry_time, firebase_storage_max_operation_retry_time, firebase_storage_set_max_operation_retry_time, firebase_storage_use_emulator, firebase_storage_ref_child, firebase_storage_ref_get_parent, firebase_storage_ref_release, firebase_storage_ref_bucket, firebase_storage_ref_full_path, firebase_storage_ref_name, firebase_storage_ref_is_valid, firebase_storage_ref_storage, firebase_storage_ref_delete, firebase_storage_ref_get_download_url, firebase_storage_ref_get_metadata, firebase_storage_ref_update_metadata, firebase_storage_ref_put_bytes, firebase_storage_ref_put_file, firebase_storage_ref_get_bytes, firebase_storage_download_copy, firebase_storage_download_release, firebase_storage_ref_get_file, firebase_storage_ref_list, firebase_storage_metadata_create, firebase_storage_metadata_release, firebase_storage_metadata_is_valid, firebase_storage_metadata_bucket, firebase_storage_metadata_cache_control, firebase_storage_metadata_set_cache_control, firebase_storage_metadata_content_disposition, firebase_storage_metadata_set_content_disposition, firebase_storage_metadata_content_encoding, firebase_storage_metadata_set_content_encoding, firebase_storage_metadata_content_language, firebase_storage_metadata_set_content_language, firebase_storage_metadata_content_type, firebase_storage_metadata_set_content_type, firebase_storage_metadata_creation_time, firebase_storage_metadata_generation, firebase_storage_metadata_metadata_generation, firebase_storage_metadata_name, firebase_storage_metadata_path, firebase_storage_metadata_get_reference, firebase_storage_metadata_size_bytes, firebase_storage_metadata_updated_time, firebase_storage_metadata_custom_metadata_count, firebase_storage_metadata_custom_metadata_key_at, firebase_storage_metadata_get_custom_metadata, firebase_storage_metadata_set_custom_metadata, firebase_storage_controller_create, firebase_storage_controller_release, firebase_storage_controller_is_valid, firebase_storage_controller_pause, firebase_storage_controller_resume, firebase_storage_controller_cancel, firebase_storage_controller_is_paused, firebase_storage_controller_bytes_transferred, firebase_storage_controller_total_byte_count, firebase_storage_controller_get_reference, firebase_storage_list_result_release, firebase_storage_list_result_is_valid, firebase_storage_list_result_item_count, firebase_storage_list_result_item_at, firebase_storage_list_result_prefix_count, firebase_storage_list_result_prefix_at, firebase_storage_list_result_next_page_token, firebase_functions_get_instance, firebase_functions_get_instance_with_region, firebase_functions_use_functions_emulator, firebase_functions_get_https_callable, firebase_functions_get_https_callable_from_url, firebase_functions_callable_is_valid, firebase_functions_callable_release, firebase_functions_callable_call, firebase_functions_callable_call_with_data, firebase_remote_config_get_instance, firebase_remote_config_ensure_initialized, firebase_remote_config_set_config_settings, firebase_remote_config_get_config_settings_fetch_timeout, firebase_remote_config_get_config_settings_minimum_fetch_interval, firebase_remote_config_fetch, firebase_remote_config_fetch_with_expiration, firebase_remote_config_fetch_and_activate, firebase_remote_config_activate, firebase_remote_config_get_boolean, firebase_remote_config_get_long, firebase_remote_config_get_double, firebase_remote_config_get_string, firebase_remote_config_get_data_size, firebase_remote_config_get_data, firebase_remote_config_get_keys_by_prefix, firebase_remote_config_get_keys, firebase_remote_config_get_all, firebase_remote_config_set_defaults, firebase_remote_config_set_custom_signals, firebase_remote_config_get_info, firebase_remote_config_add_config_update_listener, firebase_remote_config_remove_config_update_listener, firebase_messaging_request_permission, firebase_messaging_register, firebase_messaging_unregister, firebase_messaging_get_token, firebase_messaging_delete_token, firebase_messaging_subscribe, firebase_messaging_unsubscribe, firebase_messaging_set_message_callback, firebase_messaging_set_registration_callback, firebase_messaging_set_unregistration_callback, firebase_messaging_raw_data_copy, firebase_messaging_raw_data_release, firebase_ump_get_instance, firebase_ump_get_consent_status, firebase_ump_get_consent_form_status, firebase_ump_get_privacy_options_requirement_status, firebase_ump_can_request_ads, firebase_ump_reset, firebase_ump_request_consent_info_update, firebase_ump_load_consent_form, firebase_ump_show_consent_form, firebase_ump_load_and_show_consent_form_if_required, firebase_ump_show_privacy_options_form, firebase_analytics_notify_app_lifecycle_change, firebase_analytics_initiate_on_device_conversion_measurement_hashed_email, firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone, firebase_auth_federated_oauth_provider_create, firebase_auth_federated_oauth_provider_set_data, firebase_auth_federated_oauth_provider_release, firebase_auth_sign_in_with_provider, firebase_auth_user_provider_data, firebase_auth_user_reauthenticate_with_provider, firebase_auth_user_link_with_provider, firebase_auth_user_update_phone_number_credential, firebase_database_ref_is_valid, firebase_database_ref_get_parent, firebase_database_ref_get_root, firebase_database_ref_get_database, firebase_database_server_timestamp, firebase_database_ref_on_disconnect, firebase_database_on_disconnect_cancel, firebase_database_on_disconnect_remove_value, firebase_database_on_disconnect_set_value, firebase_database_on_disconnect_set_value_and_priority, firebase_database_on_disconnect_update_children, firebase_database_on_disconnect_release, firebase_firestore_field_path_create, firebase_firestore_field_path_document_id, firebase_firestore_field_path_is_valid, firebase_firestore_field_path_to_string, firebase_firestore_field_path_release, firebase_firestore_filter_equal_to, firebase_firestore_filter_not_equal_to, firebase_firestore_filter_less_than, firebase_firestore_filter_less_than_or_equal_to, firebase_firestore_filter_greater_than, firebase_firestore_filter_greater_than_or_equal_to, firebase_firestore_filter_array_contains, firebase_firestore_filter_array_contains_any, firebase_firestore_filter_in, firebase_firestore_filter_not_in, firebase_firestore_filter_equal_to_field_path, firebase_firestore_filter_not_equal_to_field_path, firebase_firestore_filter_less_than_field_path, firebase_firestore_filter_less_than_or_equal_to_field_path, firebase_firestore_filter_greater_than_field_path, firebase_firestore_filter_greater_than_or_equal_to_field_path, firebase_firestore_filter_array_contains_field_path, firebase_firestore_filter_array_contains_any_field_path, firebase_firestore_filter_in_field_path, firebase_firestore_filter_not_in_field_path, firebase_firestore_filter_and, firebase_firestore_filter_or, firebase_firestore_filter_release, firebase_firestore_query_where_filter, firebase_firestore_query_where_equal_to_field_path, firebase_firestore_query_where_not_equal_to_field_path, firebase_firestore_query_where_less_than_field_path, firebase_firestore_query_where_less_than_or_equal_to_field_path, firebase_firestore_query_where_greater_than_field_path, firebase_firestore_query_where_greater_than_or_equal_to_field_path, firebase_firestore_query_where_array_contains_field_path, firebase_firestore_query_where_array_contains_any_field_path, firebase_firestore_query_where_in_field_path, firebase_firestore_query_where_not_in_field_path, firebase_firestore_query_order_by_field_path, firebase_firestore_query_count, firebase_firestore_aggregate_query_get_query, firebase_firestore_aggregate_query_is_valid, firebase_firestore_aggregate_query_get, firebase_firestore_aggregate_query_release, firebase_firestore_aggregate_snapshot_count, firebase_firestore_aggregate_snapshot_get_query, firebase_firestore_aggregate_snapshot_is_valid, firebase_firestore_aggregate_snapshot_release, firebase_firestore_add_snapshots_in_sync_listener, firebase_firestore_load_bundle, firebase_firestore_named_query, firebase_firestore_document_ref_set_merge_field_paths, firebase_firestore_write_batch_set_merge_field_paths, firebase_storage_metadata_md5_hash, firebase_remote_config_ensure_initialized_info, firebase_remote_config_get_boolean_with_info, firebase_remote_config_get_long_with_info, firebase_remote_config_get_double_with_info, firebase_remote_config_get_string_with_info, firebase_remote_config_get_data_with_info, firebase_firestore_field_value_type, firebase_firestore_field_value_is_valid, firebase_firestore_field_value_is_null, firebase_firestore_field_value_is_boolean, firebase_firestore_field_value_is_integer, firebase_firestore_field_value_is_double, firebase_firestore_field_value_is_timestamp, firebase_firestore_field_value_is_string, firebase_firestore_field_value_is_blob, firebase_firestore_field_value_is_reference, firebase_firestore_field_value_is_geo_point, firebase_firestore_field_value_is_array, firebase_firestore_field_value_is_map, firebase_firestore_field_value_boolean_value, firebase_firestore_field_value_integer_value, firebase_firestore_field_value_double_value, firebase_firestore_field_value_string_value, firebase_firestore_field_value_blob_size, firebase_firestore_field_value_blob_copy, firebase_firestore_field_value_reference_value, firebase_firestore_field_value_timestamp_value, firebase_firestore_field_value_geo_point_value, firebase_firestore_field_value_array_value, firebase_firestore_field_value_map_value, firebase_firestore_field_value_to_string, firebase_firestore_query_get_firestore, firebase_firestore_document_ref_get_firestore, firebase_firestore_document_ref_to_string, firebase_firestore_document_ref_update_field_paths, firebase_firestore_write_batch_update_field_paths, firebase_firestore_write_batch_is_valid, firebase_firestore_settings_to_string, firebase_firestore_document_snapshot_is_valid, firebase_firestore_document_snapshot_to_string, firebase_firestore_document_snapshot_get_field_path, firebase_firestore_query_snapshot_is_valid, firebase_firestore_query_snapshot_get_query, firebase_firestore_listener_registration_is_valid, firebase_app_get_default_handle, firebase_app_get_instance, firebase_app_get_apps, firebase_app_initialize_with_options, firebase_app_initialize_from_json, firebase_app_handle_get_name, firebase_app_handle_get_options, firebase_app_get_default_options, firebase_app_release_handle, firebase_set_log_level, firebase_get_log_level, firebase_auth_get_app, firebase_database_get_app, firebase_database_get_instance_for_app, firebase_database_get_instance_for_app_url, firebase_firestore_get_app, firebase_firestore_get_instance_for_app, firebase_firestore_get_instance_for_app_database, firebase_storage_get_app, firebase_storage_get_instance_for_app, firebase_storage_get_instance_for_app_url, firebase_functions_get_app, firebase_functions_callable_get_functions, firebase_functions_get_instance_for_app, firebase_functions_get_instance_for_app_region, firebase_remote_config_get_app, firebase_firestore_field_value_boolean, firebase_firestore_field_value_string, firebase_firestore_field_value_array, firebase_firestore_field_value_map, firebase_remote_config_get_instance_for_app, firebase_analytics_initialize_for_app, firebase_messaging_initialize_for_app, firebase_messaging_initialize_for_app_with_options, firebase_ump_get_instance_for_app, firebase_auth_get_current_instance_handle, firebase_auth_get_instance_for_app, firebase_auth_use_instance, firebase_auth_instance_get_app, firebase_firestore_document_snapshot_metadata_to_string, firebase_firestore_query_snapshot_metadata_to_string, firebase_firestore_document_snapshot_reference, firebase_auth_game_center_auth_provider_get_credential_last_result
