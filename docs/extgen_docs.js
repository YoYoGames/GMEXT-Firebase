/**
 * @function_partial firebase_auth_get_auth
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_auth_language_code
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_auth_set_language_code
 * @param {String} language_code
 * @function_end
 */

/**
 * @function_partial firebase_auth_use_app_language
 * @function_end
 */

/**
 * @function_partial firebase_auth_use_emulator
 * @param {String} host
 * @param {Real} port
 * @function_end
 */

/**
 * @function_partial firebase_auth_current_user
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_sign_out
 * @function_end
 */

/**
 * @function_partial firebase_auth_fetch_providers_for_email
 * @param {String} email
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_sign_in_with_custom_token
 * @param {String} custom_token
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_sign_in_with_credential
 * @param {Real} credential_ref
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_sign_in_and_retrieve_data_with_credential
 * @param {Real} credential_ref
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_sign_in_anonymously
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_sign_in_with_email_and_password
 * @param {String} email
 * @param {String} password
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_create_user_with_email_and_password
 * @param {String} email
 * @param {String} password
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_send_password_reset_email
 * @param {String} email
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_add_state_listener
 * @param {Function} callback
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_remove_state_listener
 * @param {Real} listener_ref
 * @function_end
 */

/**
 * @function_partial firebase_auth_add_id_token_listener
 * @param {Function} callback
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_remove_id_token_listener
 * @param {Real} listener_ref
 * @function_end
 */

/**
 * @function_partial firebase_auth_credential_provider
 * @param {Real} credential_ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_auth_credential_is_valid
 * @param {Real} credential_ref
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_auth_credential_release
 * @param {Real} credential_ref
 * @function_end
 */

/**
 * @function_partial firebase_auth_email_auth_provider_get_credential
 * @param {String} email
 * @param {String} password
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_facebook_auth_provider_get_credential
 * @param {String} access_token
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_game_center_auth_provider_get_credential
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_game_center_auth_provider_is_player_authenticated
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_auth_github_auth_provider_get_credential
 * @param {String} token
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_google_auth_provider_get_credential
 * @param {String} id_token
 * @param {String} access_token
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_oauth_provider_get_credential
 * @param {String} provider_id
 * @param {String} id_token
 * @param {String} access_token
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_oauth_provider_get_credential_with_nonce
 * @param {String} provider_id
 * @param {String} id_token
 * @param {String} raw_nonce
 * @param {String} access_token
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_play_games_auth_provider_get_credential
 * @param {String} server_auth_code
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_twitter_auth_provider_get_credential
 * @param {String} token
 * @param {String} secret
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_phone_verify_phone_number
 * @param {String} phone_number
 * @param {Real} timeout_ms
 * @param {Real} force_resending_token
 * @param {Function} [on_verification_completed]
 * @param {Function} [on_verification_failed]
 * @param {Function} [on_code_sent]
 * @param {Function} [on_timeout]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_phone_get_credential
 * @param {String} verification_id
 * @param {String} verification_code
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_phone_credential_sms_code
 * @param {Real} credential
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_auth_phone_resending_token_release
 * @param {Real} token
 * @function_end
 */

/**
 * @function_partial firebase_auth_phone_listener_release
 * @param {Real} listener
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_get_info
 * @param {Real} user
 * @returns {Struct.FirebaseAuthUserInfo}
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_release
 * @param {Real} user_ref
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_is_valid
 * @param {Real} user_ref
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_uid
 * @param {Real} user_ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_email
 * @param {Real} user_ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_display_name
 * @param {Real} user_ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_photo_url
 * @param {Real} user_ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_provider_id
 * @param {Real} user_ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_phone_number
 * @param {Real} user_ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_is_email_verified
 * @param {Real} user_ref
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_is_anonymous
 * @param {Real} user_ref
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_creation_timestamp
 * @param {Real} user_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_last_sign_in_timestamp
 * @param {Real} user_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_get_token
 * @param {Real} user_ref
 * @param {Bool} force_refresh
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_update_password
 * @param {Real} user_ref
 * @param {String} password
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_update_profile
 * @param {Real} user_ref
 * @param {String} display_name
 * @param {String} photo_url
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_send_email_verification
 * @param {Real} user_ref
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_send_email_verification_before_updating_email
 * @param {Real} user_ref
 * @param {String} new_email
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_reauthenticate
 * @param {Real} user_ref
 * @param {Real} credential_ref
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_reauthenticate_and_retrieve_data
 * @param {Real} user_ref
 * @param {Real} credential_ref
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_link_with_credential
 * @param {Real} user_ref
 * @param {Real} credential_ref
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_unlink
 * @param {Real} user_ref
 * @param {String} provider_id
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_reload
 * @param {Real} user_ref
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_delete
 * @param {Real} user_ref
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_federated_oauth_provider_create
 * @param {String} provider_id
 * @param {Any} scopes
 * @param {Any} custom_parameters
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_federated_oauth_provider_set_data
 * @param {Real} provider
 * @param {String} provider_id
 * @param {Any} scopes
 * @param {Any} custom_parameters
 * @function_end
 */

/**
 * @function_partial firebase_auth_federated_oauth_provider_release
 * @param {Real} provider
 * @function_end
 */

/**
 * @function_partial firebase_auth_sign_in_with_provider
 * @param {Real} provider
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_sign_in_with_custom_token_result
 * @param {String} custom_token
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_sign_in_and_retrieve_data_with_credential_result
 * @param {Real} credential
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_sign_in_anonymously_result
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_sign_in_with_email_and_password_result
 * @param {String} email
 * @param {String} password
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_create_user_with_email_and_password_result
 * @param {String} email
 * @param {String} password
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_provider_data_count
 * @param {Real} user
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_provider_data_at
 * @param {Real} user
 * @param {Real} index
 * @returns {Any}
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_reauthenticate_with_provider
 * @param {Real} user
 * @param {Real} provider
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_link_with_provider
 * @param {Real} user
 * @param {Real} provider
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_reauthenticate_and_retrieve_data_result
 * @param {Real} user
 * @param {Real} credential
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_link_with_credential_result
 * @param {Real} user
 * @param {Real} credential
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_user_update_phone_number_credential
 * @param {Real} user
 * @param {Real} phone_credential
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_auth_get_app
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_get_current_instance_handle
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_get_instance_for_app
 * @param {Real} app
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_use_instance
 * @param {Real} auth
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_instance_get_app
 * @param {Real} auth
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_auth_email_auth_provider_id
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_auth_facebook_auth_provider_id
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_auth_game_center_auth_provider_id
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_auth_github_auth_provider_id
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_auth_google_auth_provider_id
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_auth_microsoft_auth_provider_id
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_auth_play_games_auth_provider_id
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_auth_twitter_auth_provider_id
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_auth_yahoo_auth_provider_id
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_auth_game_center_auth_provider_get_credential_last_result
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @struct_partial FirebaseAuthUserInfo
 * @member {String} uid
 * @member {String} email
 * @member {String} display_name
 * @member {String} photo_url
 * @member {String} provider_id
 * @member {String} phone_number
 * @member {Bool} is_email_verified
 * @member {Bool} is_anonymous
 * @member {Bool} is_valid
 * @member {Real} creation_timestamp
 * @member {Real} last_sign_in_timestamp
 * @struct_end
 */

/**
 * @enum_partial FirebaseAuthError
 * @member None
 * @member Unimplemented
 * @member Failure
 * @member InvalidCustomToken
 * @member CustomTokenMismatch
 * @member InvalidCredential
 * @member UserDisabled
 * @member AccountExistsWithDifferentCredentials
 * @member OperationNotAllowed
 * @member EmailAlreadyInUse
 * @member RequiresRecentLogin
 * @member CredentialAlreadyInUse
 * @member InvalidEmail
 * @member WrongPassword
 * @member TooManyRequests
 * @member UserNotFound
 * @member ProviderAlreadyLinked
 * @member NoSuchProvider
 * @member InvalidUserToken
 * @member UserTokenExpired
 * @member NetworkRequestFailed
 * @member InvalidApiKey
 * @member AppNotAuthorized
 * @member UserMismatch
 * @member WeakPassword
 * @member NoSignedInUser
 * @member ApiNotAvailable
 * @member ExpiredActionCode
 * @member InvalidActionCode
 * @member InvalidMessagePayload
 * @member InvalidPhoneNumber
 * @member MissingPhoneNumber
 * @member InvalidRecipientEmail
 * @member InvalidSender
 * @member InvalidVerificationCode
 * @member InvalidVerificationId
 * @member MissingVerificationCode
 * @member MissingVerificationId
 * @member MissingEmail
 * @member MissingPassword
 * @member QuotaExceeded
 * @member RetryPhoneAuth
 * @member SessionExpired
 * @member AppNotVerified
 * @member AppVerificationFailed
 * @member CaptchaCheckFailed
 * @member InvalidAppCredential
 * @member MissingAppCredential
 * @member InvalidClientId
 * @member InvalidContinueUri
 * @member MissingContinueUri
 * @member KeychainError
 * @member MissingAppToken
 * @member MissingIosBundleId
 * @member NotificationNotForwarded
 * @member UnauthorizedDomain
 * @member WebContextAlreadyPresented
 * @member WebContextCancelled
 * @member DynamicLinkNotActivated
 * @member Cancelled
 * @member InvalidProviderId
 * @member WebInternalError
 * @member WebStorateUnsupported
 * @member TenantIdMismatch
 * @member UnsupportedTenantOperation
 * @member InvalidLinkDomain
 * @member RejectedCredential
 * @member PhoneNumberNotFound
 * @member InvalidTenantId
 * @member MissingClientIdentifier
 * @member MissingMultiFactorSession
 * @member MissingMultiFactorInfo
 * @member InvalidMultiFactorSession
 * @member MultiFactorInfoNotFound
 * @member AdminRestrictedOperation
 * @member UnverifiedEmail
 * @member SecondFactorAlreadyEnrolled
 * @member MaximumSecondFactorCountExceeded
 * @member UnsupportedFirstFactor
 * @member EmailChangeNeedsVerification
 * @enum_end
 */

/**
 * @const_partial macros
 * @const_end
 */

