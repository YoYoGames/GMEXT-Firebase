/**
 * @function_partial firebase_app_initialize
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_app_is_initialized
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_app_get_name
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_last_error_code
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_last_error_message
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_analytics_initialize
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_analytics_terminate
 * @function_end
 */

/**
 * @function_partial firebase_analytics_set_analytics_collection_enabled
 * @param {Real} enabled
 * @function_end
 */

/**
 * @function_partial firebase_analytics_set_consent
 * @param {Real} ad_storage
 * @param {Real} analytics_storage
 * @param {Real} ad_user_data
 * @param {Real} ad_personalization
 * @function_end
 */

/**
 * @function_partial firebase_analytics_log_event
 * @param {String} name
 * @function_end
 */

/**
 * @function_partial firebase_analytics_log_event_string
 * @param {String} name
 * @param {String} parameter_name
 * @param {String} parameter_value
 * @function_end
 */

/**
 * @function_partial firebase_analytics_log_event_number
 * @param {String} name
 * @param {String} parameter_name
 * @param {Real} parameter_value
 * @function_end
 */

/**
 * @function_partial firebase_analytics_log_event_params
 * @param {String} name
 * @param {Any} params
 * @function_end
 */

/**
 * @function_partial firebase_analytics_set_default_event_parameters
 * @param {Any} params
 * @function_end
 */

/**
 * @function_partial firebase_analytics_log_apple_transaction
 * @param {String} transaction_id
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_analytics_set_user_property
 * @param {String} name
 * @param {String} value
 * @function_end
 */

/**
 * @function_partial firebase_analytics_set_user_id
 * @param {String} user_id
 * @function_end
 */

/**
 * @function_partial firebase_analytics_set_session_timeout_duration
 * @param {Real} milliseconds
 * @function_end
 */

/**
 * @function_partial firebase_analytics_reset_analytics_data
 * @function_end
 */

/**
 * @function_partial firebase_analytics_get_analytics_instance_id
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_analytics_get_session_id
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_analytics_notify_app_lifecycle_termination
 * @function_end
 */

/**
 * @function_partial firebase_analytics_is_desktop_initialized
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_analytics_set_desktop_debug_mode
 * @param {Real} enabled
 * @function_end
 */

/**
 * @function_partial firebase_analytics_set_log_callback
 * @param {Function} [callback]
 * @function_end
 */

/**
 * @function_partial firebase_analytics_initiate_on_device_conversion_measurement_email
 * @param {String} email_address
 * @function_end
 */

/**
 * @function_partial firebase_analytics_initiate_on_device_conversion_measurement_phone
 * @param {String} phone_number
 * @function_end
 */

/**
 * @function_partial firebase_app_check_set_provider_factory
 * @param {Real} provider
 * @function_end
 */

/**
 * @function_partial firebase_app_check_debug_provider_set_debug_token
 * @param {String} token
 * @function_end
 */

/**
 * @function_partial firebase_app_check_set_token_auto_refresh_enabled
 * @param {Real} enabled
 * @function_end
 */

/**
 * @function_partial firebase_app_check_get_token
 * @param {Real} force_refresh
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_app_check_get_limited_use_token
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_app_check_add_listener
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_app_check_remove_listener
 * @param {Real} listener_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_installations_get_id
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_installations_get_token
 * @param {Real} force_refresh
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_installations_delete
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

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
 * @returns {Real}
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
 * @function_partial firebase_database_get_instance
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_get_instance_for_url
 * @param {String} url
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_get_url
 * @param {Real} db_ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_database_get_reference
 * @param {Real} db_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_get_reference_at_path
 * @param {Real} db_ref
 * @param {String} path
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_get_reference_from_url
 * @param {Real} db_ref
 * @param {String} url
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_go_offline
 * @param {Real} db_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_go_online
 * @param {Real} db_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_purge_outstanding_writes
 * @param {Real} db_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_set_persistence_enabled
 * @param {Real} db_ref
 * @param {Real} enabled
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_set_log_level
 * @param {Real} db_ref
 * @param {Enum.FirebaseLogLevel} log_level
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_get_log_level
 * @param {Real} db_ref
 * @returns {Enum.FirebaseLogLevel}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_order_by_child
 * @param {Real} ref
 * @param {String} path
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_order_by_key
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_order_by_value
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_order_by_priority
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_start_at
 * @param {Real} ref
 * @param {Any} order_value
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_start_at_key
 * @param {Real} ref
 * @param {Any} order_value
 * @param {String} child_key
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_end_at
 * @param {Real} ref
 * @param {Any} order_value
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_end_at_key
 * @param {Real} ref
 * @param {Any} order_value
 * @param {String} child_key
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_equal_to
 * @param {Real} ref
 * @param {Any} order_value
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_equal_to_key
 * @param {Real} ref
 * @param {Any} order_value
 * @param {String} child_key
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_limit_to_first
 * @param {Real} ref
 * @param {Real} limit
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_limit_to_last
 * @param {Real} ref
 * @param {Real} limit
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_get_reference
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_set_keep_synchronized
 * @param {Real} ref
 * @param {Real} keep_sync
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_is_valid
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_get_value
 * @param {Real} ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_add_value_listener
 * @param {Real} ref
 * @param {Function} [on_value_changed]
 * @param {Function} [on_cancelled]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_remove_value_listener
 * @param {Real} ref
 * @param {Real} listener_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_remove_all_value_listeners
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_add_child_listener
 * @param {Real} ref
 * @param {Function} [on_child_added]
 * @param {Function} [on_child_changed]
 * @param {Function} [on_child_moved]
 * @param {Function} [on_child_removed]
 * @param {Function} [on_cancelled]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_remove_child_listener
 * @param {Real} ref
 * @param {Real} listener_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_remove_all_child_listeners
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_order_by_child
 * @param {Real} ref
 * @param {String} path
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_order_by_key
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_order_by_value
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_order_by_priority
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_start_at
 * @param {Real} ref
 * @param {Any} order_value
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_start_at_key
 * @param {Real} ref
 * @param {Any} order_value
 * @param {String} child_key
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_end_at
 * @param {Real} ref
 * @param {Any} order_value
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_end_at_key
 * @param {Real} ref
 * @param {Any} order_value
 * @param {String} child_key
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_equal_to
 * @param {Real} ref
 * @param {Any} order_value
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_equal_to_key
 * @param {Real} ref
 * @param {Any} order_value
 * @param {String} child_key
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_limit_to_first
 * @param {Real} ref
 * @param {Real} limit
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_limit_to_last
 * @param {Real} ref
 * @param {Real} limit
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_get_reference
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_set_keep_synchronized
 * @param {Real} ref
 * @param {Real} keep_sync
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_is_valid
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_get_value
 * @param {Real} ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_add_value_listener
 * @param {Real} ref
 * @param {Function} [on_value_changed]
 * @param {Function} [on_cancelled]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_remove_value_listener
 * @param {Real} ref
 * @param {Real} listener_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_remove_all_value_listeners
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_add_child_listener
 * @param {Real} ref
 * @param {Function} [on_child_added]
 * @param {Function} [on_child_changed]
 * @param {Function} [on_child_moved]
 * @param {Function} [on_child_removed]
 * @param {Function} [on_cancelled]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_remove_child_listener
 * @param {Real} ref
 * @param {Real} listener_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_remove_all_child_listeners
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_query_release
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_key
 * @param {Real} ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_is_root
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_get_parent
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_get_root
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_child
 * @param {Real} ref
 * @param {String} path
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_push
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_get_database
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_get_url
 * @param {Real} ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_go_online
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_go_offline
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_set_value
 * @param {Real} ref
 * @param {Any} value
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_set_priority
 * @param {Real} ref
 * @param {Any} priority
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_set_value_and_priority
 * @param {Real} ref
 * @param {Any} value
 * @param {Any} priority
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_update_children
 * @param {Real} ref
 * @param {Any} values
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_remove_value
 * @param {Real} ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_run_transaction
 * @param {Real} ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_ref_release
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_snapshot_exists
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_snapshot_is_valid
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_snapshot_child
 * @param {Real} ref
 * @param {String} path
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_snapshot_has_child
 * @param {Real} ref
 * @param {String} path
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_snapshot_has_children
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_snapshot_children_count
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_snapshot_get_children
 * @param {Real} ref
 * @returns {Any}
 * @function_end
 */

/**
 * @function_partial firebase_database_snapshot_key
 * @param {Real} ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_database_snapshot_get_reference
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_database_snapshot_get_info
 * @param {Real} ref
 * @returns {Struct.FirebaseDataSnapshotInfo}
 * @function_end
 */

/**
 * @function_partial firebase_database_snapshot_get_value
 * @param {Real} ref
 * @returns {Struct.FirebaseDataSnapshot}
 * @function_end
 */

/**
 * @function_partial firebase_database_snapshot_get_priority
 * @param {Real} ref
 * @returns {Any}
 * @function_end
 */

/**
 * @function_partial firebase_database_snapshot_release
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_get_instance
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_get_instance_for_database
 * @param {String} database_name
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_settings_get_host
 * @param {Real} instance_ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_settings_set_host
 * @param {Real} instance_ref
 * @param {String} host
 * @function_end
 */

/**
 * @function_partial firebase_firestore_settings_get_ssl_enabled
 * @param {Real} instance_ref
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_settings_set_ssl_enabled
 * @param {Real} instance_ref
 * @param {Bool} enabled
 * @function_end
 */

/**
 * @function_partial firebase_firestore_settings_get_persistence_enabled
 * @param {Real} instance_ref
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_settings_set_persistence_enabled
 * @param {Real} instance_ref
 * @param {Bool} enabled
 * @function_end
 */

/**
 * @function_partial firebase_firestore_settings_get_cache_size_bytes
 * @param {Real} instance_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_settings_set_cache_size_bytes
 * @param {Real} instance_ref
 * @param {Real} bytes
 * @function_end
 */

/**
 * @function_partial firebase_firestore_collection
 * @param {Real} instance_ref
 * @param {String} path
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document
 * @param {Real} instance_ref
 * @param {String} path
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_collection_group
 * @param {Real} instance_ref
 * @param {String} collection_id
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_batch
 * @param {Real} instance_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_set_log_level
 * @param {Real} level
 * @function_end
 */

/**
 * @function_partial firebase_firestore_enable_network
 * @param {Real} instance_ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_disable_network
 * @param {Real} instance_ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_terminate
 * @param {Real} instance_ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_clear_persistence
 * @param {Real} instance_ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_wait_for_pending_writes
 * @param {Real} instance_ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_run_transaction
 * @param {Real} instance_ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_collection_ref_id
 * @param {Real} ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_collection_ref_path
 * @param {Real} ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_collection_ref_parent
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_collection_ref_document
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_collection_ref_document_path
 * @param {Real} ref
 * @param {String} path
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_collection_ref_add
 * @param {Real} ref
 * @param {Any} data
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_collection_ref_is_valid
 * @param {Real} ref
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_collection_ref_release
 * @param {Real} ref
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document_ref_id
 * @param {Real} ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document_ref_path
 * @param {Real} ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document_ref_parent
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document_ref_collection
 * @param {Real} ref
 * @param {String} path
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document_ref_get
 * @param {Real} ref
 * @param {Real} source
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document_ref_set
 * @param {Real} ref
 * @param {Any} data
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document_ref_set_merge
 * @param {Real} ref
 * @param {Any} data
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document_ref_set_merge_fields
 * @param {Real} ref
 * @param {Any} data
 * @param {Any} fields
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document_ref_update
 * @param {Real} ref
 * @param {Any} data
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document_ref_delete
 * @param {Real} ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document_ref_add_snapshot_listener
 * @param {Real} ref
 * @param {Bool} include_metadata_changes
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document_ref_is_valid
 * @param {Real} ref
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document_ref_release
 * @param {Real} ref
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_where_equal_to
 * @param {Real} ref
 * @param {String} field
 * @param {Any} value
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_where_not_equal_to
 * @param {Real} ref
 * @param {String} field
 * @param {Any} value
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_where_less_than
 * @param {Real} ref
 * @param {String} field
 * @param {Any} value
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_where_less_than_or_equal_to
 * @param {Real} ref
 * @param {String} field
 * @param {Any} value
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_where_greater_than
 * @param {Real} ref
 * @param {String} field
 * @param {Any} value
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_where_greater_than_or_equal_to
 * @param {Real} ref
 * @param {String} field
 * @param {Any} value
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_where_array_contains
 * @param {Real} ref
 * @param {String} field
 * @param {Any} value
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_where_array_contains_any
 * @param {Real} ref
 * @param {String} field
 * @param {Any} values
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_where_in
 * @param {Real} ref
 * @param {String} field
 * @param {Any} values
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_where_not_in
 * @param {Real} ref
 * @param {String} field
 * @param {Any} values
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_order_by
 * @param {Real} ref
 * @param {String} field
 * @param {Real} direction
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_limit
 * @param {Real} ref
 * @param {Real} limit
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_limit_to_last
 * @param {Real} ref
 * @param {Real} limit
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_start_at_snapshot
 * @param {Real} ref
 * @param {Real} snapshot_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_start_at_values
 * @param {Real} ref
 * @param {Any} values
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_start_after_snapshot
 * @param {Real} ref
 * @param {Real} snapshot_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_start_after_values
 * @param {Real} ref
 * @param {Any} values
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_end_before_snapshot
 * @param {Real} ref
 * @param {Real} snapshot_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_end_before_values
 * @param {Real} ref
 * @param {Any} values
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_end_at_snapshot
 * @param {Real} ref
 * @param {Real} snapshot_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_end_at_values
 * @param {Real} ref
 * @param {Any} values
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_get
 * @param {Real} ref
 * @param {Real} source
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_add_snapshot_listener
 * @param {Real} ref
 * @param {Bool} include_metadata_changes
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_is_valid
 * @param {Real} ref
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_release
 * @param {Real} ref
 * @function_end
 */

/**
 * @function_partial firebase_firestore_write_batch_set
 * @param {Real} batch_ref
 * @param {Real} document_ref
 * @param {Any} data
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_write_batch_set_merge
 * @param {Real} batch_ref
 * @param {Real} document_ref
 * @param {Any} data
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_write_batch_set_merge_fields
 * @param {Real} batch_ref
 * @param {Real} document_ref
 * @param {Any} data
 * @param {Any} fields
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_write_batch_update
 * @param {Real} batch_ref
 * @param {Real} document_ref
 * @param {Any} data
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_write_batch_delete
 * @param {Real} batch_ref
 * @param {Real} document_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_write_batch_commit
 * @param {Real} batch_ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_write_batch_release
 * @param {Real} batch_ref
 * @function_end
 */

/**
 * @function_partial firebase_firestore_field_value_delete
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_field_value_server_timestamp
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_field_value_array_union
 * @param {Any} values
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_field_value_array_remove
 * @param {Any} values
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_field_value_increment_integer
 * @param {Real} value
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_field_value_increment_double
 * @param {Real} value
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_field_value_integer
 * @param {Real} value
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_field_value_double
 * @param {Real} value
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_field_value_timestamp
 * @param {Real} seconds
 * @param {Real} nanoseconds
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_field_value_geo_point
 * @param {Real} latitude
 * @param {Real} longitude
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_field_value_reference
 * @param {Real} document_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_field_value_blob
 * @param {String} data
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_field_value_null
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_field_value_release
 * @param {Real} ref
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document_snapshot_exists
 * @param {Real} ref
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document_snapshot_id
 * @param {Real} ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document_snapshot_reference
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document_snapshot_metadata_has_pending_writes
 * @param {Real} ref
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document_snapshot_metadata_is_from_cache
 * @param {Real} ref
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document_snapshot_get
 * @param {Real} ref
 * @param {String} field
 * @param {Real} server_timestamp_behavior
 * @returns {Any}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document_snapshot_get_data
 * @param {Real} ref
 * @param {Real} server_timestamp_behavior
 * @returns {Any}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_document_snapshot_release
 * @param {Real} ref
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_snapshot_size
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_snapshot_empty
 * @param {Real} ref
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_snapshot_metadata_has_pending_writes
 * @param {Real} ref
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_snapshot_metadata_is_from_cache
 * @param {Real} ref
 * @returns {Bool}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_snapshot_documents
 * @param {Real} ref
 * @returns {Any}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_snapshot_document_changes
 * @param {Real} ref
 * @param {Bool} include_metadata_changes
 * @returns {Any}
 * @function_end
 */

/**
 * @function_partial firebase_firestore_query_snapshot_release
 * @param {Real} ref
 * @function_end
 */

/**
 * @function_partial firebase_firestore_listener_registration_remove
 * @param {Real} ref
 * @function_end
 */

/**
 * @function_partial firebase_storage_get_instance
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_get_instance_with_url
 * @param {String} url
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_url
 * @param {Real} storage_ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_storage_get_reference
 * @param {Real} storage_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_get_reference_path
 * @param {Real} storage_ref
 * @param {String} path
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_get_reference_from_url
 * @param {Real} storage_ref
 * @param {String} url
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_max_download_retry_time
 * @param {Real} storage_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_set_max_download_retry_time
 * @param {Real} storage_ref
 * @param {Real} seconds
 * @function_end
 */

/**
 * @function_partial firebase_storage_max_upload_retry_time
 * @param {Real} storage_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_set_max_upload_retry_time
 * @param {Real} storage_ref
 * @param {Real} seconds
 * @function_end
 */

/**
 * @function_partial firebase_storage_max_operation_retry_time
 * @param {Real} storage_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_set_max_operation_retry_time
 * @param {Real} storage_ref
 * @param {Real} seconds
 * @function_end
 */

/**
 * @function_partial firebase_storage_use_emulator
 * @param {Real} storage_ref
 * @param {String} host
 * @param {Real} port
 * @function_end
 */

/**
 * @function_partial firebase_storage_ref_child
 * @param {Real} ref
 * @param {String} path
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_ref_get_parent
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_ref_bucket
 * @param {Real} ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_storage_ref_full_path
 * @param {Real} ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_storage_ref_name
 * @param {Real} ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_storage_ref_is_valid
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_ref_storage
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_ref_delete
 * @param {Real} ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_ref_get_download_url
 * @param {Real} ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_ref_get_metadata
 * @param {Real} ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_ref_update_metadata
 * @param {Real} ref
 * @param {Real} metadata_ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_ref_put_bytes
 * @param {Real} ref
 * @param {Buffer} data
 * @param {Real} metadata_ref
 * @param {Function} [progress_callback]
 * @param {Real} controller_ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_ref_put_file
 * @param {Real} ref
 * @param {String} local_path
 * @param {Real} metadata_ref
 * @param {Function} [progress_callback]
 * @param {Real} controller_ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_ref_get_bytes
 * @param {Real} ref
 * @param {Buffer} data
 * @param {Function} [progress_callback]
 * @param {Real} controller_ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_ref_get_file
 * @param {Real} ref
 * @param {String} local_path
 * @param {Function} [progress_callback]
 * @param {Real} controller_ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_ref_list
 * @param {Real} ref
 * @param {Real} max_results
 * @param {String} page_token
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_create
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_release
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_is_valid
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_bucket
 * @param {Real} ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_cache_control
 * @param {Real} ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_set_cache_control
 * @param {Real} ref
 * @param {String} value
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_content_disposition
 * @param {Real} ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_set_content_disposition
 * @param {Real} ref
 * @param {String} value
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_content_encoding
 * @param {Real} ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_set_content_encoding
 * @param {Real} ref
 * @param {String} value
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_content_language
 * @param {Real} ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_set_content_language
 * @param {Real} ref
 * @param {String} value
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_content_type
 * @param {Real} ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_set_content_type
 * @param {Real} ref
 * @param {String} value
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_creation_time
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_generation
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_metadata_generation
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_name
 * @param {Real} ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_path
 * @param {Real} ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_get_reference
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_size_bytes
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_updated_time
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_custom_metadata_count
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_custom_metadata_key_at
 * @param {Real} ref
 * @param {Real} index
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_get_custom_metadata
 * @param {Real} ref
 * @param {String} key
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_storage_metadata_set_custom_metadata
 * @param {Real} ref
 * @param {String} key
 * @param {String} value
 * @function_end
 */

/**
 * @function_partial firebase_storage_controller_create
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_controller_release
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_controller_is_valid
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_controller_pause
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_controller_resume
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_controller_cancel
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_controller_is_paused
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_controller_bytes_transferred
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_controller_total_byte_count
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_controller_get_reference
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_list_result_release
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_list_result_is_valid
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_list_result_item_count
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_list_result_item_at
 * @param {Real} ref
 * @param {Real} index
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_list_result_prefix_count
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_list_result_prefix_at
 * @param {Real} ref
 * @param {Real} index
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_storage_list_result_next_page_token
 * @param {Real} ref
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_functions_get_instance
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_functions_get_instance_with_region
 * @param {String} region
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_functions_use_functions_emulator
 * @param {Real} functions_ref
 * @param {String} origin
 * @function_end
 */

/**
 * @function_partial firebase_functions_get_https_callable
 * @param {Real} functions_ref
 * @param {String} name
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_functions_get_https_callable_with_options
 * @param {Real} functions_ref
 * @param {String} name
 * @param {Real} limited_use_app_check_token
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_functions_get_https_callable_from_url
 * @param {Real} functions_ref
 * @param {String} url
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_functions_get_https_callable_from_url_with_options
 * @param {Real} functions_ref
 * @param {String} url
 * @param {Real} limited_use_app_check_token
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_functions_callable_is_valid
 * @param {Real} ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_functions_callable_call
 * @param {Real} ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_functions_callable_call_with_data
 * @param {Real} ref
 * @param {Any} data
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_get_instance
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_ensure_initialized
 * @param {Real} rc_ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_set_config_settings
 * @param {Real} rc_ref
 * @param {Real} fetch_timeout_ms
 * @param {Real} minimum_fetch_interval_ms
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_get_config_settings_fetch_timeout
 * @param {Real} rc_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_get_config_settings_minimum_fetch_interval
 * @param {Real} rc_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_fetch
 * @param {Real} rc_ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_fetch_with_expiration
 * @param {Real} rc_ref
 * @param {Real} cache_expiration_in_seconds
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_fetch_and_activate
 * @param {Real} rc_ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_activate
 * @param {Real} rc_ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_get_boolean
 * @param {Real} rc_ref
 * @param {String} key
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_get_long
 * @param {Real} rc_ref
 * @param {String} key
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_get_double
 * @param {Real} rc_ref
 * @param {String} key
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_get_string
 * @param {Real} rc_ref
 * @param {String} key
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_get_data_size
 * @param {Real} rc_ref
 * @param {String} key
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_get_data
 * @param {Real} rc_ref
 * @param {String} key
 * @param {Buffer} out_buffer
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_get_keys_by_prefix
 * @param {Real} rc_ref
 * @param {String} prefix
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_get_keys
 * @param {Real} rc_ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_get_all
 * @param {Real} rc_ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_set_defaults
 * @param {Real} rc_ref
 * @param {Any} defaults
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_get_info
 * @param {Real} rc_ref
 * @returns {Struct.FirebaseRemoteConfigInfo}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_add_config_update_listener
 * @param {Real} rc_ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_remote_config_remove_config_update_listener
 * @param {Real} reg_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_initialize
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_terminate
 * @function_end
 */

/**
 * @function_partial firebase_messaging_set_token_registration_on_init_enabled
 * @param {Real} enabled
 * @function_end
 */

/**
 * @function_partial firebase_messaging_is_token_registration_on_init_enabled
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_delivery_metrics_export_to_big_query_enabled
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_set_delivery_metrics_export_to_big_query
 * @param {Real} enabled
 * @function_end
 */

/**
 * @function_partial firebase_messaging_request_permission
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_get_token
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_delete_token
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_subscribe
 * @param {String} topic
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_unsubscribe
 * @param {String} topic
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_poll_message
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_poll_token
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_current_token
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_from
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_to
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_collapse_key
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_message_id
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_message_type
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_priority
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_original_priority
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_time_to_live
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_sent_time
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_error
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_error_description
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_link
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_notification_opened
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_data_count
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_data_key_at
 * @param {Real} index
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_get_data
 * @param {String} key
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_raw_data_size
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_raw_data_copy
 * @param {Buffer} out_buffer
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_has_notification
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_notification_title
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_notification_body
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_notification_icon
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_notification_sound
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_notification_badge
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_notification_tag
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_notification_color
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_notification_click_action
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_notification_body_loc_key
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_notification_body_loc_args_count
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_notification_body_loc_args_at
 * @param {Real} index
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_notification_title_loc_key
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_notification_title_loc_args_count
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_notification_title_loc_args_at
 * @param {Real} index
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_messaging_message_notification_android_channel_id
 * @returns {String}
 * @function_end
 */

/**
 * @function_partial firebase_ump_get_instance
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_ump_get_consent_status
 * @param {Real} consent_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_ump_get_consent_form_status
 * @param {Real} consent_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_ump_get_privacy_options_requirement_status
 * @param {Real} consent_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_ump_can_request_ads
 * @param {Real} consent_ref
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_ump_reset
 * @param {Real} consent_ref
 * @function_end
 */

/**
 * @function_partial firebase_ump_request_consent_info_update
 * @param {Real} consent_ref
 * @param {Real} debug_geography
 * @param {Real} tag_for_under_age_of_consent
 * @param {Any} debug_device_ids
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_ump_load_consent_form
 * @param {Real} consent_ref
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_ump_show_consent_form
 * @param {Real} consent_ref
 * @param {Real} form_parent
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_ump_load_and_show_consent_form_if_required
 * @param {Real} consent_ref
 * @param {Real} form_parent
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @function_partial firebase_ump_show_privacy_options_form
 * @param {Real} consent_ref
 * @param {Real} form_parent
 * @param {Function} [callback]
 * @returns {Real}
 * @function_end
 */

/**
 * @struct_partial FirebaseDataSnapshotInfo
 * @member {String} key
 * @member {Bool} exists
 * @member {Bool} is_valid
 * @member {Bool} has_children
 * @member {Real} children_count
 * @member {Real} reference
 * @struct_end
 */

/**
 * @struct_partial FirebaseDataSnapshot
 * @member {String} key
 * @member {Bool} exists
 * @member {Bool} is_valid
 * @member {Bool} has_children
 * @member {Real} children_count
 * @member {Real} reference
 * @member {Any} [value]
 * @member {Any} priority
 * @struct_end
 */

/**
 * @struct_partial FirebaseRemoteConfigInfo
 * @member {Real} fetch_time
 * @member {Real} last_fetch_status
 * @member {Real} last_fetch_failure_reason
 * @member {Real} throttled_end_time
 * @struct_end
 */

/**
 * @enum_partial FirebaseAppCheckProvider
 * @member Debug
 * @member DeviceCheck
 * @member PlayIntegrity
 * @member AppAttest
 * @enum_end
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
 * @enum_partial FirebaseLogLevel
 * @member Verbose
 * @member Debug
 * @member Info
 * @member Warning
 * @member Error
 * @member Assert
 * @enum_end
 */

/**
 * @enum_partial FirebaseDatabaseError
 * @member None
 * @member Disconnected
 * @member ExpiredToken
 * @member InvalidToken
 * @member MaxRetries
 * @member NetworkError
 * @member OperationFailed
 * @member OverriddenBySet
 * @member PermissionDenied
 * @member Unavailable
 * @member UnknownError
 * @member WriteCanceled
 * @member InvalidVariantType
 * @member ConflictingOperationInProgress
 * @member TransactionAbortedByUser
 * @enum_end
 */

/**
 * @enum_partial FirestoreError
 * @member Ok
 * @member Cancelled
 * @member Unknown
 * @member InvalidArgument
 * @member DeadlineExceeded
 * @member NotFound
 * @member AlreadyExists
 * @member PermissionDenied
 * @member ResourceExhausted
 * @member FailedPrecondition
 * @member Aborted
 * @member OutOfRange
 * @member Unimplemented
 * @member Internal
 * @member Unavailable
 * @member DataLoss
 * @member Unauthenticated
 * @enum_end
 */

/**
 * @enum_partial FirestoreSource
 * @member Default
 * @member Cache
 * @member Server
 * @enum_end
 */

/**
 * @enum_partial FirestoreDirection
 * @member Ascending
 * @member Descending
 * @enum_end
 */

/**
 * @enum_partial FirestoreServerTimestampBehavior
 * @member None
 * @member Estimate
 * @member Previous
 * @enum_end
 */

/**
 * @enum_partial FirestoreDocumentChangeType
 * @member Added
 * @member Modified
 * @member Removed
 * @enum_end
 */

/**
 * @enum_partial FirebaseRemoteConfigLastFetchStatus
 * @member Success
 * @member Failure
 * @member Pending
 * @enum_end
 */

/**
 * @enum_partial FirebaseRemoteConfigFetchFailureReason
 * @member Invalid
 * @member Throttled
 * @member Error
 * @enum_end
 */

/**
 * @enum_partial FirebaseUmpConsentStatus
 * @member Unknown
 * @member Required
 * @member NotRequired
 * @member Obtained
 * @enum_end
 */

/**
 * @enum_partial FirebaseUmpConsentFormStatus
 * @member Unknown
 * @member Unavailable
 * @member Available
 * @enum_end
 */

/**
 * @enum_partial FirebaseUmpPrivacyOptionsRequirementStatus
 * @member Unknown
 * @member NotRequired
 * @member Required
 * @enum_end
 */

/**
 * @enum_partial FirebaseUmpConsentDebugGeography
 * @member Disabled
 * @member EEA
 * @member NonEEA
 * @enum_end
 */

/**
 * @const_partial macros
 * @const_end
 */

