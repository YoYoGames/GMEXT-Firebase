// ##### extgen :: Auto-generated file do not edit!! #####

// #####################################################################
// # Macros
// #####################################################################

// #####################################################################
// # Enums
// #####################################################################

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
    EmailChangeNeedsVerification = 78
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
    Cache = 1,
    Server = 2
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

// #####################################################################
// # Constructors
// #####################################################################

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
    self.reference = undefined;
    self.parent = undefined;
    self.root = undefined;
    self.database = undefined;
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
    self.reference = undefined;

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
    self.reference = undefined;
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

// #####################################################################
// # Codecs
// #####################################################################

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

        // field: reference, type: UInt64
        if (!is_numeric(self.reference)) show_error($"{_where} :: self.reference expected number", true);
        buffer_write(_buffer, buffer_u64, self.reference);

        // field: parent, type: UInt64
        if (!is_numeric(self.parent)) show_error($"{_where} :: self.parent expected number", true);
        buffer_write(_buffer, buffer_u64, self.parent);

        // field: root, type: UInt64
        if (!is_numeric(self.root)) show_error($"{_where} :: self.root expected number", true);
        buffer_write(_buffer, buffer_u64, self.root);

        // field: database, type: UInt64
        if (!is_numeric(self.database)) show_error($"{_where} :: self.database expected number", true);
        buffer_write(_buffer, buffer_u64, self.database);

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

        // field: reference, type: UInt64
        self.reference = buffer_read(_buffer, buffer_u64);

        // field: parent, type: UInt64
        self.parent = buffer_read(_buffer, buffer_u64);

        // field: root, type: UInt64
        self.root = buffer_read(_buffer, buffer_u64);

        // field: database, type: UInt64
        self.database = buffer_read(_buffer, buffer_u64);

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

        // field: reference, type: UInt64
        if (!is_numeric(self.reference)) show_error($"{_where} :: self.reference expected number", true);
        buffer_write(_buffer, buffer_u64, self.reference);

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

        // field: reference, type: UInt64
        self.reference = buffer_read(_buffer, buffer_u64);

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

        // field: reference, type: UInt64
        if (!is_numeric(self.reference)) show_error($"{_where} :: self.reference expected number", true);
        buffer_write(_buffer, buffer_u64, self.reference);

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

        // field: reference, type: UInt64
        self.reference = buffer_read(_buffer, buffer_u64);

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

        // field: last_fetch_status, type: Float64
        if (!is_numeric(self.last_fetch_status)) show_error($"{_where} :: self.last_fetch_status expected number", true);
        buffer_write(_buffer, buffer_f64, self.last_fetch_status);

        // field: last_fetch_failure_reason, type: Float64
        if (!is_numeric(self.last_fetch_failure_reason)) show_error($"{_where} :: self.last_fetch_failure_reason expected number", true);
        buffer_write(_buffer, buffer_f64, self.last_fetch_failure_reason);

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

        // field: last_fetch_status, type: Float64
        self.last_fetch_status = buffer_read(_buffer, buffer_f64);

        // field: last_fetch_failure_reason, type: Float64
        self.last_fetch_failure_reason = buffer_read(_buffer, buffer_f64);

        // field: throttled_end_time, type: Float64
        self.throttled_end_time = buffer_read(_buffer, buffer_f64);

    }

    return _inst;
}

// #####################################################################
// # Functions
// #####################################################################

// Skipping function firebase_app_initialize (no wrapper is required)


// Skipping function firebase_app_is_initialized (no wrapper is required)


// Skipping function firebase_app_get_name (no wrapper is required)


// Skipping function firebase_last_error_code (no wrapper is required)


// Skipping function firebase_last_error_message (no wrapper is required)


// Skipping function firebase_analytics_initialize (no wrapper is required)


// Skipping function firebase_analytics_terminate (no wrapper is required)


// Skipping function firebase_analytics_set_analytics_collection_enabled (no wrapper is required)


// Skipping function firebase_analytics_set_consent (no wrapper is required)


// Skipping function firebase_analytics_log_event (no wrapper is required)


// Skipping function firebase_analytics_log_event_string (no wrapper is required)


// Skipping function firebase_analytics_log_event_number (no wrapper is required)


/**
 * @param {String} _name
 * @param {Any} _params
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

    // param: _params, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _params);

    var __return_value__ = __firebase_analytics_log_event_params(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Any} _params
 */
function firebase_analytics_set_default_event_parameters(_params)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _params, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _params);

    var __return_value__ = __firebase_analytics_set_default_event_parameters(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _transaction_id
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_analytics_log_apple_transaction(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

// Skipping function firebase_analytics_set_user_property (no wrapper is required)


// Skipping function firebase_analytics_set_user_id (no wrapper is required)


// Skipping function firebase_analytics_set_session_timeout_duration (no wrapper is required)


// Skipping function firebase_analytics_reset_analytics_data (no wrapper is required)


/**
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_analytics_get_analytics_instance_id(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_analytics_get_session_id(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
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


// Skipping function firebase_app_check_set_provider_factory (no wrapper is required)


// Skipping function firebase_app_check_debug_provider_set_debug_token (no wrapper is required)


// Skipping function firebase_app_check_set_token_auto_refresh_enabled (no wrapper is required)


/**
 * @param {Real} _force_refresh
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_app_check_get_token(_force_refresh, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _force_refresh, type: Float64
    if (!is_numeric(_force_refresh)) show_error($"{_GMFUNCTION_} :: _force_refresh expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _force_refresh);

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

    var __return_value__ = __firebase_app_check_get_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_app_check_get_limited_use_token(_callback)
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

    var __return_value__ = __firebase_app_check_get_limited_use_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_app_check_add_listener(_callback)
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

    var __return_value__ = __firebase_app_check_add_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _listener_ref
 * @returns {Real}
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
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_installations_get_id(_callback)
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

    var __return_value__ = __firebase_installations_get_id(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _force_refresh
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_installations_get_token(_force_refresh, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _force_refresh, type: Float64
    if (!is_numeric(_force_refresh)) show_error($"{_GMFUNCTION_} :: _force_refresh expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _force_refresh);

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

    var __return_value__ = __firebase_installations_get_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_installations_delete(_callback)
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

    var __return_value__ = __firebase_installations_delete(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
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

    var __return_value__ = __firebase_auth_fetch_providers_for_email(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _custom_token
 * @param {Function} _callback
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

    var __return_value__ = __firebase_auth_sign_in_with_custom_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _credential_ref
 * @param {Function} _callback
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

    var __return_value__ = __firebase_auth_sign_in_with_credential(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _credential_ref
 * @param {Function} _callback
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

    var __return_value__ = __firebase_auth_sign_in_and_retrieve_data_with_credential(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Function} _callback
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

    var __return_value__ = __firebase_auth_sign_in_anonymously(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _email
 * @param {String} _password
 * @param {Function} _callback
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

    var __return_value__ = __firebase_auth_sign_in_with_email_and_password(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _email
 * @param {String} _password
 * @param {Function} _callback
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

    var __return_value__ = __firebase_auth_create_user_with_email_and_password(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _email
 * @param {Function} _callback
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

    var __return_value__ = __firebase_auth_send_password_reset_email(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
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

    var __return_value__ = __firebase_auth_game_center_auth_provider_get_credential(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
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

// Skipping function firebase_auth_phone_verify_phone_number (no wrapper is required)


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
    __result__ = __FirebaseAuthUserInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
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
 * @returns {String}
 */
function firebase_auth_user_uid(_user_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    var __return_value__ = __firebase_auth_user_uid(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @returns {String}
 */
function firebase_auth_user_email(_user_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    var __return_value__ = __firebase_auth_user_email(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @returns {String}
 */
function firebase_auth_user_display_name(_user_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    var __return_value__ = __firebase_auth_user_display_name(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @returns {String}
 */
function firebase_auth_user_photo_url(_user_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    var __return_value__ = __firebase_auth_user_photo_url(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @returns {String}
 */
function firebase_auth_user_provider_id(_user_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    var __return_value__ = __firebase_auth_user_provider_id(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @returns {String}
 */
function firebase_auth_user_phone_number(_user_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    var __return_value__ = __firebase_auth_user_phone_number(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @returns {Bool}
 */
function firebase_auth_user_is_email_verified(_user_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    var __return_value__ = __firebase_auth_user_is_email_verified(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @returns {Bool}
 */
function firebase_auth_user_is_anonymous(_user_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    var __return_value__ = __firebase_auth_user_is_anonymous(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @returns {Real}
 */
function firebase_auth_user_creation_timestamp(_user_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    var __return_value__ = __firebase_auth_user_creation_timestamp(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @returns {Real}
 */
function firebase_auth_user_last_sign_in_timestamp(_user_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user_ref, type: UInt64
    if (!is_numeric(_user_ref)) show_error($"{_GMFUNCTION_} :: _user_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user_ref);

    var __return_value__ = __firebase_auth_user_last_sign_in_timestamp(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @param {Bool} _force_refresh
 * @param {Function} _callback
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

    var __return_value__ = __firebase_auth_user_get_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @param {String} _password
 * @param {Function} _callback
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

    var __return_value__ = __firebase_auth_user_update_password(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @param {String} _display_name
 * @param {String} _photo_url
 * @param {Function} _callback
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

    var __return_value__ = __firebase_auth_user_update_profile(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @param {Function} _callback
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

    var __return_value__ = __firebase_auth_user_send_email_verification(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @param {String} _new_email
 * @param {Function} _callback
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

    var __return_value__ = __firebase_auth_user_send_email_verification_before_updating_email(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @param {Real} _credential_ref
 * @param {Function} _callback
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

    var __return_value__ = __firebase_auth_user_reauthenticate(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @param {Real} _credential_ref
 * @param {Function} _callback
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

    var __return_value__ = __firebase_auth_user_reauthenticate_and_retrieve_data(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @param {Real} _credential_ref
 * @param {Function} _callback
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

    var __return_value__ = __firebase_auth_user_link_with_credential(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @param {String} _provider_id
 * @param {Function} _callback
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

    var __return_value__ = __firebase_auth_user_unlink(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @param {Function} _callback
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

    var __return_value__ = __firebase_auth_user_reload(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user_ref
 * @param {Function} _callback
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

    var __return_value__ = __firebase_auth_user_delete(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
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
 * @returns {Real}
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
 * @returns {Real}
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
 * @returns {Real}
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
 * @param {Real} _enabled
 * @returns {Real}
 */
function firebase_database_set_persistence_enabled(_db_ref, _enabled)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _db_ref, type: UInt64
    if (!is_numeric(_db_ref)) show_error($"{_GMFUNCTION_} :: _db_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _db_ref);

    // param: _enabled, type: Float64
    if (!is_numeric(_enabled)) show_error($"{_GMFUNCTION_} :: _enabled expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _enabled);

    var __return_value__ = __firebase_database_set_persistence_enabled(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _db_ref
 * @param {Enum.FirebaseLogLevel} _log_level
 * @returns {Real}
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
function firebase_database_ref_order_by_child(_ref, _path)
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

    var __return_value__ = __firebase_database_ref_order_by_child(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_order_by_key(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_order_by_key(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_order_by_value(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_order_by_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_order_by_priority(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_ref_order_by_priority(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _order_value
 * @returns {Real}
 */
function firebase_database_ref_start_at(_ref, _order_value)
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

    var __return_value__ = __firebase_database_ref_start_at(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

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
function firebase_database_ref_start_at_key(_ref, _order_value, _child_key)
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

    var __return_value__ = __firebase_database_ref_start_at_key(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _order_value
 * @returns {Real}
 */
function firebase_database_ref_end_at(_ref, _order_value)
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

    var __return_value__ = __firebase_database_ref_end_at(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

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
function firebase_database_ref_end_at_key(_ref, _order_value, _child_key)
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

    var __return_value__ = __firebase_database_ref_end_at_key(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Any} _order_value
 * @returns {Real}
 */
function firebase_database_ref_equal_to(_ref, _order_value)
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

    var __return_value__ = __firebase_database_ref_equal_to(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

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
function firebase_database_ref_equal_to_key(_ref, _order_value, _child_key)
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

    var __return_value__ = __firebase_database_ref_equal_to_key(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _limit
 * @returns {Real}
 */
function firebase_database_ref_limit_to_first(_ref, _limit)
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

    var __return_value__ = __firebase_database_ref_limit_to_first(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _limit
 * @returns {Real}
 */
function firebase_database_ref_limit_to_last(_ref, _limit)
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

    var __return_value__ = __firebase_database_ref_limit_to_last(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _keep_sync
 * @returns {Real}
 */
function firebase_database_ref_set_keep_synchronized(_ref, _keep_sync)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _keep_sync, type: Float64
    if (!is_numeric(_keep_sync)) show_error($"{_GMFUNCTION_} :: _keep_sync expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _keep_sync);

    var __return_value__ = __firebase_database_ref_set_keep_synchronized(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_database_ref_get_value(_ref, _callback)
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

    var __return_value__ = __firebase_database_ref_get_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _on_value_changed
 * @param {Function} _on_cancelled
 * @returns {Real}
 */
function firebase_database_ref_add_value_listener(_ref, _on_value_changed, _on_cancelled)
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

    var __return_value__ = __firebase_database_ref_add_value_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _listener_ref
 * @returns {Real}
 */
function firebase_database_ref_remove_value_listener(_ref, _listener_ref)
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

    var __return_value__ = __firebase_database_ref_remove_value_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_remove_all_value_listeners(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_ref_remove_all_value_listeners(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

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
function firebase_database_ref_add_child_listener(_ref, _on_child_added, _on_child_changed, _on_child_moved, _on_child_removed, _on_cancelled)
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

    var __return_value__ = __firebase_database_ref_add_child_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _listener_ref
 * @returns {Real}
 */
function firebase_database_ref_remove_child_listener(_ref, _listener_ref)
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

    var __return_value__ = __firebase_database_ref_remove_child_listener(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_ref_remove_all_child_listeners(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_ref_remove_all_child_listeners(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
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
 * @param {Real} _keep_sync
 * @returns {Real}
 */
function firebase_database_query_set_keep_synchronized(_ref, _keep_sync)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _keep_sync, type: Float64
    if (!is_numeric(_keep_sync)) show_error($"{_GMFUNCTION_} :: _keep_sync expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _keep_sync);

    var __return_value__ = __firebase_database_query_set_keep_synchronized(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
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
 * @returns {Real}
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

    var __return_value__ = __firebase_database_query_get_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
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
 * @returns {Real}
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
 * @returns {Real}
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
 * @returns {Real}
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
 * @returns {Real}
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
 * @returns {Real}
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
    __result__ = __FirebaseDatabaseReferenceInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
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
 * @returns {Real}
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
 * @returns {Real}
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
 * @returns {Real}
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

    var __return_value__ = __firebase_database_ref_set_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Any} _priority
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_database_ref_set_priority(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Any} _value
 * @param {Any} _priority
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_database_ref_set_value_and_priority(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Any} _values
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_database_ref_update_children(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_database_ref_remove_value(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_database_ref_run_transaction(_ref, _callback)
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

    var __return_value__ = __firebase_database_ref_run_transaction(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
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
 * @returns {Real}
 */
function firebase_database_snapshot_exists(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_snapshot_exists(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
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
 * @returns {Real}
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
 * @returns {Real}
 */
function firebase_database_snapshot_has_children(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_snapshot_has_children(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
 */
function firebase_database_snapshot_children_count(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_snapshot_children_count(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @returns {Any}
 */
function firebase_database_snapshot_get_children(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebase_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_database_snapshot_get_children(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {String}
 */
function firebase_database_snapshot_key(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __return_value__ = __firebase_database_snapshot_key(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
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
    __result__ = __FirebaseDataSnapshotInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
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
 * @returns {Real}
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

// Skipping function firebase_firestore_set_log_level (no wrapper is required)


/**
 * @param {Real} _instance_ref
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_firestore_enable_network(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_firestore_disable_network(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_firestore_terminate(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_firestore_clear_persistence(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_firestore_wait_for_pending_writes(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _instance_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_firestore_run_transaction(_instance_ref, _callback)
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

    var __return_value__ = __firebase_firestore_run_transaction(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

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
 * @returns {Real}
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

    var __return_value__ = __firebase_firestore_collection_ref_add(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
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
 * @param {Real} _source
 * @param {Function} _callback
 * @returns {Real}
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

    // param: _source, type: Float64
    if (!is_numeric(_source)) show_error($"{_GMFUNCTION_} :: _source expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _source);

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

    var __return_value__ = __firebase_firestore_document_ref_get(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Any} _data
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_firestore_document_ref_set(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Any} _data
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_firestore_document_ref_set_merge(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Any} _data
 * @param {Any} _fields
 * @param {Function} _callback
 * @returns {Real}
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

    // param: _fields, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _fields);

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

    var __return_value__ = __firebase_firestore_document_ref_set_merge_fields(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Any} _data
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_firestore_document_ref_update(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_firestore_document_ref_delete(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
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
 * @param {Real} _direction
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

    // param: _direction, type: Float64
    if (!is_numeric(_direction)) show_error($"{_GMFUNCTION_} :: _direction expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _direction);

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
 * @param {Real} _source
 * @param {Function} _callback
 * @returns {Real}
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

    // param: _source, type: Float64
    if (!is_numeric(_source)) show_error($"{_GMFUNCTION_} :: _source expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _source);

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

    var __return_value__ = __firebase_firestore_query_get(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
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
 * @returns {Real}
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
 * @returns {Real}
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
 * @param {Any} _fields
 * @returns {Real}
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

    // param: _fields, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _fields);

    var __return_value__ = __firebase_firestore_write_batch_set_merge_fields(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _batch_ref
 * @param {Real} _document_ref
 * @param {Any} _data
 * @returns {Real}
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
 * @returns {Real}
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
 * @returns {Real}
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

    var __return_value__ = __firebase_firestore_write_batch_commit(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
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
 * @param {String} _data
 * @returns {Real}
 */
function firebase_firestore_field_value_blob(_data)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_field_value_blob(_data, buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

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
    __result__ = __FirestoreDocumentSnapshotInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {String} _field
 * @param {Real} _server_timestamp_behavior
 * @returns {Any}
 */
function firebase_firestore_document_snapshot_get(_ref, _field, _server_timestamp_behavior)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebase_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    // param: _field, type: String
    if (!is_string(_field)) show_error($"{_GMFUNCTION_} :: _field expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_field));
    buffer_write(__args_buffer__, buffer_string, _field);

    // param: _server_timestamp_behavior, type: Float64
    if (!is_numeric(_server_timestamp_behavior)) show_error($"{_GMFUNCTION_} :: _server_timestamp_behavior expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _server_timestamp_behavior);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_document_snapshot_get(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Real} _server_timestamp_behavior
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

    // param: _server_timestamp_behavior, type: Float64
    if (!is_numeric(_server_timestamp_behavior)) show_error($"{_GMFUNCTION_} :: _server_timestamp_behavior expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _server_timestamp_behavior);

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
    __result__ = __FirestoreQuerySnapshotInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Any}
 */
function firebase_firestore_query_snapshot_documents(_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebase_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _ref, type: UInt64
    if (!is_numeric(_ref)) show_error($"{_GMFUNCTION_} :: _ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _ref);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_firestore_query_snapshot_documents(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _ref
 * @param {Bool} _include_metadata_changes
 * @returns {Any}
 */
function firebase_firestore_query_snapshot_document_changes(_ref, _include_metadata_changes)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebase_get_decoders();

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
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
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
 * @returns {Real}
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
 * @returns {Real}
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

    var __return_value__ = __firebase_storage_ref_delete(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_storage_ref_get_download_url(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_storage_ref_get_metadata(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Real} _metadata_ref
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_storage_ref_update_metadata(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Id.Buffer} _data
 * @param {Real} _metadata_ref
 * @param {Function} _progress_callback
 * @param {Real} _controller_ref
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_storage_ref_put_bytes(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _local_path
 * @param {Real} _metadata_ref
 * @param {Function} _progress_callback
 * @param {Real} _controller_ref
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_storage_ref_put_file(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Id.Buffer} _data
 * @param {Function} _progress_callback
 * @param {Real} _controller_ref
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_storage_ref_get_bytes(_ref, _data, _progress_callback, _controller_ref, _callback)
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

    var __return_value__ = __firebase_storage_ref_get_bytes(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {String} _local_path
 * @param {Function} _progress_callback
 * @param {Real} _controller_ref
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_storage_ref_get_file(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Real} _max_results
 * @param {String} _page_token
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_storage_ref_list(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
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
 * @returns {Real}
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
 * @returns {Real}
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
 * @returns {Real}
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
 * @returns {Real}
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
 * @returns {Real}
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
 * @returns {Real}
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
 * @returns {Real}
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
 * @returns {Real}
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
 * @returns {Real}
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
 * @returns {Real}
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
 * @returns {Real}
 */
function firebase_functions_get_https_callable(_functions_ref, _name)
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

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_get_https_callable(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _functions_ref
 * @param {String} _name
 * @param {Real} _limited_use_app_check_token
 * @returns {Real}
 */
function firebase_functions_get_https_callable_with_options(_functions_ref, _name, _limited_use_app_check_token)
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

    // param: _limited_use_app_check_token, type: Float64
    if (!is_numeric(_limited_use_app_check_token)) show_error($"{_GMFUNCTION_} :: _limited_use_app_check_token expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _limited_use_app_check_token);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_get_https_callable_with_options(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _functions_ref
 * @param {String} _url
 * @returns {Real}
 */
function firebase_functions_get_https_callable_from_url(_functions_ref, _url)
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

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_get_https_callable_from_url(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _functions_ref
 * @param {String} _url
 * @param {Real} _limited_use_app_check_token
 * @returns {Real}
 */
function firebase_functions_get_https_callable_from_url_with_options(_functions_ref, _url, _limited_use_app_check_token)
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

    // param: _limited_use_app_check_token, type: Float64
    if (!is_numeric(_limited_use_app_check_token)) show_error($"{_GMFUNCTION_} :: _limited_use_app_check_token expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _limited_use_app_check_token);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_functions_get_https_callable_from_url_with_options(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @param {Real} _ref
 * @returns {Real}
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
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_functions_callable_call(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _ref
 * @param {Any} _data
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_functions_callable_call_with_data(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
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
 * @returns {Real}
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

    var __return_value__ = __firebase_remote_config_ensure_initialized(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {Real} _fetch_timeout_ms
 * @param {Real} _minimum_fetch_interval_ms
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_remote_config_set_config_settings(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
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
 * @returns {Real}
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

    var __return_value__ = __firebase_remote_config_fetch(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {Real} _cache_expiration_in_seconds
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_remote_config_fetch_with_expiration(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_remote_config_fetch_and_activate(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_remote_config_activate(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {String} _key
 * @returns {Real}
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
 * @returns {Real}
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

    var __return_value__ = __firebase_remote_config_get_keys_by_prefix(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_remote_config_get_keys(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_remote_config_get_all(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _rc_ref
 * @param {Any} _defaults
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_remote_config_set_defaults(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
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
    __result__ = __FirebaseRemoteConfigInfo_decode(__ret_buffer__, buffer_tell(__ret_buffer__));
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
 * @returns {Real}
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


// Skipping function firebase_messaging_set_token_registration_on_init_enabled (no wrapper is required)


// Skipping function firebase_messaging_is_token_registration_on_init_enabled (no wrapper is required)


// Skipping function firebase_messaging_delivery_metrics_export_to_big_query_enabled (no wrapper is required)


// Skipping function firebase_messaging_set_delivery_metrics_export_to_big_query (no wrapper is required)


/**
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_messaging_request_permission(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_messaging_get_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_messaging_delete_token(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _topic
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_messaging_subscribe(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _topic
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_messaging_unsubscribe(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

// Skipping function firebase_messaging_poll_message (no wrapper is required)


// Skipping function firebase_messaging_poll_token (no wrapper is required)


// Skipping function firebase_messaging_current_token (no wrapper is required)


// Skipping function firebase_messaging_message_from (no wrapper is required)


// Skipping function firebase_messaging_message_to (no wrapper is required)


// Skipping function firebase_messaging_message_collapse_key (no wrapper is required)


// Skipping function firebase_messaging_message_message_id (no wrapper is required)


// Skipping function firebase_messaging_message_message_type (no wrapper is required)


// Skipping function firebase_messaging_message_priority (no wrapper is required)


// Skipping function firebase_messaging_message_original_priority (no wrapper is required)


// Skipping function firebase_messaging_message_time_to_live (no wrapper is required)


// Skipping function firebase_messaging_message_sent_time (no wrapper is required)


// Skipping function firebase_messaging_message_error (no wrapper is required)


// Skipping function firebase_messaging_message_error_description (no wrapper is required)


// Skipping function firebase_messaging_message_link (no wrapper is required)


// Skipping function firebase_messaging_message_notification_opened (no wrapper is required)


// Skipping function firebase_messaging_message_data_count (no wrapper is required)


// Skipping function firebase_messaging_message_data_key_at (no wrapper is required)


// Skipping function firebase_messaging_message_get_data (no wrapper is required)


// Skipping function firebase_messaging_message_raw_data_size (no wrapper is required)


/**
 * @param {Id.Buffer} _out_buffer
 * @returns {Real}
 */
function firebase_messaging_message_raw_data_copy(_out_buffer)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _out_buffer, type: Buffer
    if (!buffer_exists(_out_buffer)) show_error($"{_GMFUNCTION_} :: _out_buffer expected Id.Buffer", true);
    __GMFirebase_queue_buffer(buffer_get_address(_out_buffer), buffer_get_size(_out_buffer));

    var __return_value__ = __firebase_messaging_message_raw_data_copy(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

// Skipping function firebase_messaging_message_has_notification (no wrapper is required)


// Skipping function firebase_messaging_message_notification_title (no wrapper is required)


// Skipping function firebase_messaging_message_notification_body (no wrapper is required)


// Skipping function firebase_messaging_message_notification_icon (no wrapper is required)


// Skipping function firebase_messaging_message_notification_sound (no wrapper is required)


// Skipping function firebase_messaging_message_notification_badge (no wrapper is required)


// Skipping function firebase_messaging_message_notification_tag (no wrapper is required)


// Skipping function firebase_messaging_message_notification_color (no wrapper is required)


// Skipping function firebase_messaging_message_notification_click_action (no wrapper is required)


// Skipping function firebase_messaging_message_notification_body_loc_key (no wrapper is required)


// Skipping function firebase_messaging_message_notification_body_loc_args_count (no wrapper is required)


// Skipping function firebase_messaging_message_notification_body_loc_args_at (no wrapper is required)


// Skipping function firebase_messaging_message_notification_title_loc_key (no wrapper is required)


// Skipping function firebase_messaging_message_notification_title_loc_args_count (no wrapper is required)


// Skipping function firebase_messaging_message_notification_title_loc_args_at (no wrapper is required)


// Skipping function firebase_messaging_message_notification_android_channel_id (no wrapper is required)


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
 * @param {Real} _consent_ref
 * @returns {Real}
 */
function firebase_ump_get_consent_status(_consent_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    var __return_value__ = __firebase_ump_get_consent_status(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _consent_ref
 * @returns {Real}
 */
function firebase_ump_get_consent_form_status(_consent_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    var __return_value__ = __firebase_ump_get_consent_form_status(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _consent_ref
 * @returns {Real}
 */
function firebase_ump_get_privacy_options_requirement_status(_consent_ref)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    var __return_value__ = __firebase_ump_get_privacy_options_requirement_status(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _consent_ref
 * @returns {Real}
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
 * @param {Real} _debug_geography
 * @param {Real} _tag_for_under_age_of_consent
 * @param {Any} _debug_device_ids
 * @param {Function} _callback
 * @returns {Real}
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

    // param: _debug_geography, type: Float64
    if (!is_numeric(_debug_geography)) show_error($"{_GMFUNCTION_} :: _debug_geography expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _debug_geography);

    // param: _tag_for_under_age_of_consent, type: Float64
    if (!is_numeric(_tag_for_under_age_of_consent)) show_error($"{_GMFUNCTION_} :: _tag_for_under_age_of_consent expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _tag_for_under_age_of_consent);

    // param: _debug_device_ids, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _debug_device_ids);

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

    var __return_value__ = __firebase_ump_request_consent_info_update(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _consent_ref
 * @param {Function} _callback
 * @returns {Real}
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

    var __return_value__ = __firebase_ump_load_consent_form(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _consent_ref
 * @param {Real} _form_parent
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_ump_show_consent_form(_consent_ref, _form_parent, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    // param: _form_parent, type: UInt64
    if (!is_numeric(_form_parent)) show_error($"{_GMFUNCTION_} :: _form_parent expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _form_parent);

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

    var __return_value__ = __firebase_ump_show_consent_form(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _consent_ref
 * @param {Real} _form_parent
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_ump_load_and_show_consent_form_if_required(_consent_ref, _form_parent, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    // param: _form_parent, type: UInt64
    if (!is_numeric(_form_parent)) show_error($"{_GMFUNCTION_} :: _form_parent expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _form_parent);

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

    var __return_value__ = __firebase_ump_load_and_show_consent_form_if_required(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _consent_ref
 * @param {Real} _form_parent
 * @param {Function} _callback
 * @returns {Real}
 */
function firebase_ump_show_privacy_options_form(_consent_ref, _form_parent, _callback)
{
    var __available__ = __GMFirebase_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebase_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _consent_ref, type: UInt64
    if (!is_numeric(_consent_ref)) show_error($"{_GMFUNCTION_} :: _consent_ref expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _consent_ref);

    // param: _form_parent, type: UInt64
    if (!is_numeric(_form_parent)) show_error($"{_GMFUNCTION_} :: _form_parent expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _form_parent);

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

    var __return_value__ = __firebase_ump_show_privacy_options_form(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/// @ignore
function __GMFirebase_get_decoders()
{
    static __decoders__ = [
        __FirebaseAuthUserInfo_decode,
        __FirebaseDatabaseReferenceInfo_decode,
        __FirebaseDataSnapshotInfo_decode,
        __FirestoreDocumentSnapshotInfo_decode,
        __FirestoreQuerySnapshotInfo_decode,
        __FirebaseRemoteConfigInfo_decode
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
