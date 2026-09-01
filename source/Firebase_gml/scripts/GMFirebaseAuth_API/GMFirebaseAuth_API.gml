// ##### extgen :: Auto-generated file do not edit!! #####

// #####################################################################
// # Macros
// #####################################################################

// #####################################################################
// # Enums
// #####################################################################

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

// #####################################################################
// # Functions
// #####################################################################

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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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
 * @param {String} _provider_id
 * @param {Any} _scopes
 * @param {Any} _custom_parameters
 * @returns {Real}
 */
function firebase_auth_federated_oauth_provider_create(_provider_id, _scopes, _custom_parameters)
{
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _provider_id, type: String
    if (!is_string(_provider_id)) show_error($"{_GMFUNCTION_} :: _provider_id expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_provider_id));
    buffer_write(__args_buffer__, buffer_string, _provider_id);

    // param: _scopes, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _scopes);

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
 * @param {Any} _scopes
 * @param {Any} _custom_parameters
 */
function firebase_auth_federated_oauth_provider_set_data(_provider, _provider_id, _scopes, _custom_parameters)
{
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _provider, type: UInt64
    if (!is_numeric(_provider)) show_error($"{_GMFUNCTION_} :: _provider expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _provider);

    // param: _provider_id, type: String
    if (!is_string(_provider_id)) show_error($"{_GMFUNCTION_} :: _provider_id expected string", true);
    buffer_write(__args_buffer__, buffer_u32, string_byte_length(_provider_id));
    buffer_write(__args_buffer__, buffer_string, _provider_id);

    // param: _scopes, type: Any

    __ext_core_buffer_marshal_value(__args_buffer__, _scopes);

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
    var __available__ = __GMFirebaseAuth_is_available();
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
 */
function firebase_auth_sign_in_with_provider(_provider, _callback)
{
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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

    var __return_value__ = __firebase_auth_sign_in_with_provider(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _custom_token
 * @param {Function} _callback
 */
function firebase_auth_sign_in_with_custom_token_result(_custom_token, _callback)
{
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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

    var __return_value__ = __firebase_auth_sign_in_with_custom_token_result(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _credential
 * @param {Function} _callback
 */
function firebase_auth_sign_in_and_retrieve_data_with_credential_result(_credential, _callback)
{
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _credential, type: UInt64
    if (!is_numeric(_credential)) show_error($"{_GMFUNCTION_} :: _credential expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _credential);

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

    var __return_value__ = __firebase_auth_sign_in_and_retrieve_data_with_credential_result(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Function} _callback
 */
function firebase_auth_sign_in_anonymously_result(_callback)
{
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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

    var __return_value__ = __firebase_auth_sign_in_anonymously_result(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _email
 * @param {String} _password
 * @param {Function} _callback
 */
function firebase_auth_sign_in_with_email_and_password_result(_email, _password, _callback)
{
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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

    var __return_value__ = __firebase_auth_sign_in_with_email_and_password_result(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {String} _email
 * @param {String} _password
 * @param {Function} _callback
 */
function firebase_auth_create_user_with_email_and_password_result(_email, _password, _callback)
{
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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

    var __return_value__ = __firebase_auth_create_user_with_email_and_password_result(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user
 * @returns {Real}
 */
function firebase_auth_user_provider_data_count(_user)
{
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user, type: UInt64
    if (!is_numeric(_user)) show_error($"{_GMFUNCTION_} :: _user expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user);

    var __return_value__ = __firebase_auth_user_provider_data_count(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user
 * @param {Real} _index
 * @returns {Any}
 */
function firebase_auth_user_provider_data_at(_user, _index)
{
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __decoders__ = __GMFirebaseAuth_get_decoders();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user, type: UInt64
    if (!is_numeric(_user)) show_error($"{_GMFUNCTION_} :: _user expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user);

    // param: _index, type: Float64
    if (!is_numeric(_index)) show_error($"{_GMFUNCTION_} :: _index expected number", true);
    buffer_write(__args_buffer__, buffer_f64, _index);

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_user_provider_data_at(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__), buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = __ext_core_buffer_unmarshal_value(__ret_buffer__, __decoders__);
    return __result__;
}

/**
 * @param {Real} _user
 * @param {Real} _provider
 * @param {Function} _callback
 */
function firebase_auth_user_reauthenticate_with_provider(_user, _provider, _callback)
{
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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

    var __return_value__ = __firebase_auth_user_reauthenticate_with_provider(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user
 * @param {Real} _provider
 * @param {Function} _callback
 */
function firebase_auth_user_link_with_provider(_user, _provider, _callback)
{
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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

    var __return_value__ = __firebase_auth_user_link_with_provider(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user
 * @param {Real} _credential
 * @param {Function} _callback
 */
function firebase_auth_user_reauthenticate_and_retrieve_data_result(_user, _credential, _callback)
{
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user, type: UInt64
    if (!is_numeric(_user)) show_error($"{_GMFUNCTION_} :: _user expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user);

    // param: _credential, type: UInt64
    if (!is_numeric(_credential)) show_error($"{_GMFUNCTION_} :: _credential expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _credential);

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

    var __return_value__ = __firebase_auth_user_reauthenticate_and_retrieve_data_result(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user
 * @param {Real} _credential
 * @param {Function} _callback
 */
function firebase_auth_user_link_with_credential_result(_user, _credential, _callback)
{
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

    var __args_buffer__ = __ext_core_get_args_buffer();

    // param: _user, type: UInt64
    if (!is_numeric(_user)) show_error($"{_GMFUNCTION_} :: _user expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _user);

    // param: _credential, type: UInt64
    if (!is_numeric(_credential)) show_error($"{_GMFUNCTION_} :: _credential expected number", true);
    buffer_write(__args_buffer__, buffer_u64, _credential);

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

    var __return_value__ = __firebase_auth_user_link_with_credential_result(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @param {Real} _user
 * @param {Real} _phone_credential
 * @param {Function} _callback
 */
function firebase_auth_user_update_phone_number_credential(_user, _phone_credential, _callback)
{
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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

    var __return_value__ = __firebase_auth_user_update_phone_number_credential(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/**
 * @returns {Real}
 */
function firebase_auth_get_app()
{
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __ret_buffer__ = __ext_core_get_ret_buffer();

    var __return_value__ = __firebase_auth_get_app(buffer_get_address(__ret_buffer__), buffer_get_size(__ret_buffer__));

    var __result__ = undefined;
    __result__ = buffer_read(__ret_buffer__, buffer_u64);
    return __result__;
}

/**
 * @returns {Real}
 */
function firebase_auth_get_current_instance_handle()
{
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
 * @returns {Real}
 */
function firebase_auth_use_instance(_auth)
{
    var __available__ = __GMFirebaseAuth_is_available();
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
    var __available__ = __GMFirebaseAuth_is_available();
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
 */
function firebase_auth_game_center_auth_provider_get_credential_last_result(_callback)
{
    var __available__ = __GMFirebaseAuth_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMFirebaseAuth_get_dispatcher();

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

    var __return_value__ = __firebase_auth_game_center_auth_provider_get_credential_last_result(buffer_get_address(__args_buffer__), buffer_tell(__args_buffer__));

    return __return_value__;
}

/// @ignore
function __GMFirebaseAuth_get_decoders()
{
    static __decoders__ = [
        __FirebaseAuthUserInfo_decode
    ];
    return __decoders__;
}
/// @ignore
function __GMFirebaseAuth_get_dispatcher()
{
    static __dispatcher__ = new __GMNativeFunctionDispatcher(__GMFirebaseAuth_invocation_handler, __GMFirebaseAuth_get_decoders());
    return __dispatcher__;
}
/// @ignore
function __GMFirebaseAuth_is_available()
{
    static __available__ = extension_exists("GMFirebaseAuth");
    return __available__;
}
