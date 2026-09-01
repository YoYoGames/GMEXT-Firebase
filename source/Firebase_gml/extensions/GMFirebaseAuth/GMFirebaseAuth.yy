{
  "$GMExtension": "",
  "%Name": "GMFirebaseAuth",
  "androidactivityinject": null,
  "androidclassname": "GMFirebaseAuth",
  "androidcodeinjection": "\u003CYYAndroidGradleDependencies\u003E\r\n\r\n    implementation \u0027com.google.firebase:firebase-auth\u0027\r\n\r\n\u003C/YYAndroidGradleDependencies\u003E\r\n",
  "androidinject": null,
  "androidmanifestinject": null,
  "androidPermissions": [],
  "androidProps": true,
  "androidsourcedir": "",
  "author": "",
  "classname": "GMFirebaseAuth",
  "copyToTargets": -1,
  "description": "",
  "exportToGame": true,
  "extensionVersion": "0.0.1",
  "files": [
    {
      "$GMExtensionFile": "v1",
      "%Name": "",
      "constants": [],
      "copyToTargets": -1,
      "filename": "GMFirebaseAuth.ext",
      "final": "",
      "functions": [
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_get_auth",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_get_auth",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_get_auth",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_language_code",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_language_code",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_language_code",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_set_language_code",
          "argCount": 1,
          "args": [
            1
          ],
          "documentation": "@param {String} language_code\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_set_language_code",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_set_language_code",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_use_app_language",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_use_app_language",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_use_app_language",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_use_emulator",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {String} host\r\n@param {Real} port\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_use_emulator",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_use_emulator",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_current_user",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_current_user",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_current_user",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_sign_out",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_sign_out",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_sign_out",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_fetch_providers_for_email",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_fetch_providers_for_email",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_fetch_providers_for_email",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_sign_in_with_custom_token",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_sign_in_with_custom_token",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_sign_in_with_custom_token",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_sign_in_with_credential",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_sign_in_with_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_sign_in_with_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_sign_in_and_retrieve_data_with_credential",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_sign_in_and_retrieve_data_with_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_sign_in_and_retrieve_data_with_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_sign_in_anonymously",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_sign_in_anonymously",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_sign_in_anonymously",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_sign_in_with_email_and_password",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_sign_in_with_email_and_password",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_sign_in_with_email_and_password",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_create_user_with_email_and_password",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_create_user_with_email_and_password",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_create_user_with_email_and_password",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_send_password_reset_email",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_send_password_reset_email",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_send_password_reset_email",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_add_state_listener",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_add_state_listener",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_add_state_listener",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_remove_state_listener",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_remove_state_listener",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_remove_state_listener",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_add_id_token_listener",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_add_id_token_listener",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_add_id_token_listener",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_remove_id_token_listener",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_remove_id_token_listener",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_remove_id_token_listener",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_credential_provider",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_credential_provider",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_credential_provider",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_credential_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_credential_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_credential_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_credential_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_credential_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_credential_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_email_auth_provider_get_credential",
          "argCount": 4,
          "args": [
            1,
            1,
            1,
            2
          ],
          "documentation": "@param {String} email\r\n@param {String} password\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_email_auth_provider_get_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_email_auth_provider_get_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_facebook_auth_provider_get_credential",
          "argCount": 3,
          "args": [
            1,
            1,
            2
          ],
          "documentation": "@param {String} access_token\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_facebook_auth_provider_get_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_facebook_auth_provider_get_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_game_center_auth_provider_get_credential",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_game_center_auth_provider_get_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_game_center_auth_provider_get_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_game_center_auth_provider_is_player_authenticated",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_game_center_auth_provider_is_player_authenticated",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_game_center_auth_provider_is_player_authenticated",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_github_auth_provider_get_credential",
          "argCount": 3,
          "args": [
            1,
            1,
            2
          ],
          "documentation": "@param {String} token\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_github_auth_provider_get_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_github_auth_provider_get_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_google_auth_provider_get_credential",
          "argCount": 4,
          "args": [
            1,
            1,
            1,
            2
          ],
          "documentation": "@param {String} id_token\r\n@param {String} access_token\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_google_auth_provider_get_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_google_auth_provider_get_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_oauth_provider_get_credential",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_oauth_provider_get_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_oauth_provider_get_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_oauth_provider_get_credential_with_nonce",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_oauth_provider_get_credential_with_nonce",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_oauth_provider_get_credential_with_nonce",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_play_games_auth_provider_get_credential",
          "argCount": 3,
          "args": [
            1,
            1,
            2
          ],
          "documentation": "@param {String} server_auth_code\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_play_games_auth_provider_get_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_play_games_auth_provider_get_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_twitter_auth_provider_get_credential",
          "argCount": 4,
          "args": [
            1,
            1,
            1,
            2
          ],
          "documentation": "@param {String} token\r\n@param {String} secret\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_twitter_auth_provider_get_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_twitter_auth_provider_get_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_phone_verify_phone_number",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_phone_verify_phone_number",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_phone_verify_phone_number",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_phone_get_credential",
          "argCount": 4,
          "args": [
            1,
            1,
            1,
            2
          ],
          "documentation": "@param {String} verification_id\r\n@param {String} verification_code\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_phone_get_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_phone_get_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_phone_credential_sms_code",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_phone_credential_sms_code",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_phone_credential_sms_code",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_phone_resending_token_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_phone_resending_token_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_phone_resending_token_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_phone_listener_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_phone_listener_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_phone_listener_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_get_info",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_get_info",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_get_info",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_is_valid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_is_valid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_is_valid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_uid",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_uid",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_uid",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_email",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_email",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_email",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_display_name",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_display_name",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_display_name",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_photo_url",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_photo_url",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_photo_url",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_provider_id",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_provider_id",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_provider_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_phone_number",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_phone_number",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_phone_number",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_is_email_verified",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_is_email_verified",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_is_email_verified",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_is_anonymous",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_is_anonymous",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_is_anonymous",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_creation_timestamp",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_creation_timestamp",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_creation_timestamp",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_last_sign_in_timestamp",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_last_sign_in_timestamp",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_last_sign_in_timestamp",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_get_token",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_get_token",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_get_token",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_update_password",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_update_password",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_update_password",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_update_profile",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_update_profile",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_update_profile",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_send_email_verification",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_send_email_verification",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_send_email_verification",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_send_email_verification_before_updating_email",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_send_email_verification_before_updating_email",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_send_email_verification_before_updating_email",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_reauthenticate",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_reauthenticate",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_reauthenticate",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_reauthenticate_and_retrieve_data",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_reauthenticate_and_retrieve_data",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_reauthenticate_and_retrieve_data",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_link_with_credential",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_link_with_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_link_with_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_unlink",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_unlink",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_unlink",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_reload",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_reload",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_reload",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_delete",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_delete",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_delete",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_federated_oauth_provider_create",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_federated_oauth_provider_create",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_federated_oauth_provider_create",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_federated_oauth_provider_set_data",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_federated_oauth_provider_set_data",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_federated_oauth_provider_set_data",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_federated_oauth_provider_release",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_federated_oauth_provider_release",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_federated_oauth_provider_release",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_sign_in_with_provider",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_sign_in_with_provider",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_sign_in_with_provider",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_sign_in_with_custom_token_result",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_sign_in_with_custom_token_result",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_sign_in_with_custom_token_result",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_sign_in_and_retrieve_data_with_credential_result",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_sign_in_and_retrieve_data_with_credential_result",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_sign_in_and_retrieve_data_with_credential_result",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_sign_in_anonymously_result",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_sign_in_anonymously_result",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_sign_in_anonymously_result",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_sign_in_with_email_and_password_result",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_sign_in_with_email_and_password_result",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_sign_in_with_email_and_password_result",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_create_user_with_email_and_password_result",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_create_user_with_email_and_password_result",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_create_user_with_email_and_password_result",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_provider_data_count",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_provider_data_count",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_provider_data_count",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_provider_data_at",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_provider_data_at",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_provider_data_at",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_reauthenticate_with_provider",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_reauthenticate_with_provider",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_reauthenticate_with_provider",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_link_with_provider",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_link_with_provider",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_link_with_provider",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_reauthenticate_and_retrieve_data_result",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_reauthenticate_and_retrieve_data_result",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_reauthenticate_and_retrieve_data_result",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_link_with_credential_result",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_link_with_credential_result",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_link_with_credential_result",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_user_update_phone_number_credential",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_user_update_phone_number_credential",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_user_update_phone_number_credential",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_get_app",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_get_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_get_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_get_current_instance_handle",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_get_current_instance_handle",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_get_current_instance_handle",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_get_instance_for_app",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_get_instance_for_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_get_instance_for_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_use_instance",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_use_instance",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_use_instance",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_instance_get_app",
          "argCount": 4,
          "args": [
            1,
            2,
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@param {Pointer} _ret_buffer\r\n@param {Real} _ret_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_instance_get_app",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_instance_get_app",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_email_auth_provider_id",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_email_auth_provider_id",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_email_auth_provider_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_facebook_auth_provider_id",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_facebook_auth_provider_id",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_facebook_auth_provider_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_game_center_auth_provider_id",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_game_center_auth_provider_id",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_game_center_auth_provider_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_github_auth_provider_id",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_github_auth_provider_id",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_github_auth_provider_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_google_auth_provider_id",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_google_auth_provider_id",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_google_auth_provider_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_microsoft_auth_provider_id",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_microsoft_auth_provider_id",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_microsoft_auth_provider_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_play_games_auth_provider_id",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_play_games_auth_provider_id",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_play_games_auth_provider_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_twitter_auth_provider_id",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_twitter_auth_provider_id",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_twitter_auth_provider_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "firebase_auth_yahoo_auth_provider_id",
          "argCount": 0,
          "args": [],
          "documentation": "@returns {String}",
          "externalName": "__EXT_NATIVE__firebase_auth_yahoo_auth_provider_id",
          "help": "",
          "hidden": false,
          "kind": 4,
          "name": "firebase_auth_yahoo_auth_provider_id",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 1
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__firebase_auth_game_center_auth_provider_get_credential_last_result",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _arg_buffer\r\n@param {Real} _arg_buffer_length\r\n@returns {Real}",
          "externalName": "__EXT_NATIVE__firebase_auth_game_center_auth_provider_get_credential_last_result",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__firebase_auth_game_center_auth_provider_get_credential_last_result",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        },
        {
          "$GMExtensionFunction": "",
          "%Name": "__GMFirebaseAuth_invocation_handler",
          "argCount": 2,
          "args": [
            1,
            2
          ],
          "documentation": "@param {Pointer} _buffer_ptr\r\n@param {Real} _buffer_size",
          "externalName": "__EXT_NATIVE__GMFirebaseAuth_invocation_handler",
          "help": "",
          "hidden": true,
          "kind": 4,
          "name": "__GMFirebaseAuth_invocation_handler",
          "resourceType": "GMExtensionFunction",
          "resourceVersion": "2.0",
          "returnType": 2
        }
      ],
      "init": "",
      "kind": 4,
      "name": "",
      "origname": "",
      "ProxyFiles": [
        {
          "$GMProxyFile": "",
          "%Name": "GMFirebaseAuth.dll",
          "name": "GMFirebaseAuth.dll",
          "resourceType": "GMProxyFile",
          "resourceVersion": "2.0",
          "TargetMask": 6
        }
      ],
      "resourceType": "GMExtensionFile",
      "resourceVersion": "2.0",
      "uncompress": false,
      "usesRunnerInterface": false
    }
  ],
  "gradleinject": null,
  "hasConvertedCodeInjection": true,
  "helpfile": "",
  "HTML5CodeInjection": "",
  "html5Props": false,
  "IncludedResources": [],
  "installdir": "",
  "iosCocoaPodDependencies": "",
  "iosCocoaPods": "",
  "ioscodeinjection": "",
  "iosdelegatename": "",
  "iosplistinject": null,
  "iosProps": false,
  "iosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "license": "",
  "maccompilerflags": "",
  "maclinkerflags": "-ObjC",
  "macsourcedir": "",
  "name": "GMFirebaseAuth",
  "options": [],
  "optionsFile": "options.json",
  "packageId": "",
  "parent": {
    "name": "GMFirebaseAuth",
    "path": "folders/FirebaseCPP/GMFirebaseAuth.yy"
  },
  "productId": "",
  "resourceType": "GMExtension",
  "resourceVersion": "2.0",
  "sourcedir": "",
  "supportedTargets": -1,
  "tvosclassname": null,
  "tvosCocoaPodDependencies": "",
  "tvosCocoaPods": "",
  "tvoscodeinjection": "",
  "tvosdelegatename": null,
  "tvosmaccompilerflags": "",
  "tvosmaclinkerflags": "",
  "tvosplistinject": null,
  "tvosProps": false,
  "tvosSystemFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": []
}