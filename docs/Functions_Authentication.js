/**
 * @function FirebaseAuthentication_ChangeDisplayName
 * @desc This function changes a user's display name and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * [[Warning: This function call requires re-authentication.]]
 * 
 * @param {string} name The new display name to be assigned to the current user.
 * 
 * @returns {real}
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_ChangeDisplayName"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [errorMessage] The readable error message
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_ChangeDisplayName("YoYoUser");
 * ```
 * In the code above we initiate a task to change the display name of the user. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseAuthentication_ChangeDisplayName")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("The display name was changed.");
 *     }
 *     else
 *     {
 *         show_debug_message("There was an error changing the display name.");
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_ChangeEmail
 * @desc This function changes a user's email and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * [[Warning: This function call requires re-authentication.]]
 * 
 * @param {string} email The new email address to be assigned to the current user.
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_ChangeEmail"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [errorMessage] The readable error message
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_ChangeEmail("YoYoUser@yoyo.com");
 * ```
 * In the code above we initiate a task to change the email of the user. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseAuthentication_ChangeEmail")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("The email was changed.");
 *     }
 *     else
 *     {
 *         show_debug_message("There was an error changing the email.");
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_ChangePassword
 * @desc This function changes a user's password and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * [[Warning: This function call requires re-authentication.]]
 * 
 * @param {string} password The new password for the current user account.
 * 
 * @returns {real}
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_ChangePassword"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [errorMessage] The readable error message
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_ChangePassword("Password123!");
 * ```
 * In the code above we initiate a task to change the password of the user. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseAuthentication_ChangePassword")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("The email was changed.");
 *     }
 *     else
 *     {
 *         show_debug_message("There was an error changing the email.");
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_ChangePhotoURL
 * @desc This function changes a user's photo URL and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * [[Warning: This function call requires re-authentication.]]
 * 
 * @param {string} url The new photo url to be assign to the current user account.
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_ChangePhotoURL"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_ChangePhotoURL(global.photoURL);
 * ```
 * In the code above we initiate a task to change the photo URL of the user to a new value store in a global variable (`global.photoURL`). The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseAuthentication_ChangePhotoURL")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("The photo URL was changed.");
 *     }
 *     else
 *     {
 *         show_debug_message("There was an error changing the photo URL.");
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_DeleteAccount
 * @desc This function deletes the current user account and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * [[Warning: This function call requires re-authentication.]]
 * 
 * @returns {real}
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_DeleteAccount"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_DeleteAccount();
 * ```
 * In the code above we initiate a task to delete the current user account. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseAuthentication_DeleteAccount")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("The account was deleted.");
 *     }
 *     else
 *     {
 *         show_debug_message("There was an error deleting the account.");
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_GetDisplayName
 * @desc This function returns the display name of the current user.
 * 
 * @returns {string}
 * @example
 * ```gml
 * var _displayName = FirebaseAuthentication_GetDisplayName();
 * ```
 * The code above will retrieve the current user's display name and store it in a local variable.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_GetEmail
 * @desc This function returns the email of the current user.
 * 
 * @returns {string}
 * @example
 * ```gml
 * var _email = FirebaseAuthentication_GetEmail();
 * ```
 * The code above will retrieve the current user's email and store it in a local variable.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_GetEmailVerified
 * @desc This function returns whether or not the email of the current user is verified.
 * 
 * @returns {bool}
 * @example
 * ```gml
 * var _emailVerified = FirebaseAuthentication_GetEmailVerified();
 * 
 * if (!_emailVerified)
 * {
 *     listenerId = FirebaseAuthentication_SendEmailVerification();
 * }
 * ```
 * The code above will check if the current user's email is verified, and if it's not, it'll call ${function.FirebaseAuthentication_SendEmailVerification} to start the verification process.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_GetIdToken
 * @desc This function requests a callback to get the current **idToken** and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_GetIdToken"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] The idToken (if status == 200)
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_GetIdToken();
 * ```
 * In the code above we request for the current session's **idToken**. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseAuthentication_ReauthenticateWithEmail")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message(json_parse(async_load[? "value"]));
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_GetLocalId
 * @desc This function returns the local identifier (uid) of the current user.
 * 
 * [[Note: This function returns the same value as ${function.FirebaseAuthentication_GetUID}.]]
 * 
 * @returns {string}
 * @example
 * ```gml
 * var _uid = FirebaseAuthentication_GetLocalId();
 * ```
 * The code above will retrieve the local identifier (uid) of the current user and store it in a local variable.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_GetPhotoUrl
 * @desc This function returns the URL of the current user's photo.
 * 
 * @returns {string}
 * @example
 * ```gml
 * var _photoUrl = FirebaseAuthentication_GetPhotoUrl();
 * ```
 * The code above will retrieve current user's photo URL and store it in a local variable.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_GetProviderUserInfo
 * @desc This function returns an array of structs with the information of each provider of the current user (or an empty string if unavailable).
 * Below is a sample of the returned information string parsed as an array (using the ${function.json_parse} function) for a user authenticated with Apple, Facebook, Google Play Games and Phone.
 * 
 * ```gml
 * [
 *     {
 *         "email":"**@privaterelay.appleid.com",
 *         "providerId":"apple.com",
 *         "rawId":"**",
 *         "federatedId":"**"
 *     },
 *     {
 *         "displayName":"**",
 *         "photoUrl":"https:**",
 *         "providerId":"facebook.com",
 *         "rawId":"**",
 *         "federatedId":"**"
 *     },
 *     {
 *         "displayName":"**",
 *         "photoUrl":"https:**",
 *         "providerId":"playgames.google.com",
 *         "rawId":"**",
 *         "federatedId":"**"
 *     },
 *     {
 *         "phoneNumber":"**",
 *         "providerId":"phone"
 *     }
 * ]
 * ```
 * 
 * @returns {string}
 *
 * @example
 * ```gml
 * var _providerUserInfo = FirebaseAuthentication_GetProviderUserInfo();
 * ```
 * The code above will return a JSON formatted string of an array containing provider information.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_GetUID
 * @desc This function returns the unique identifier (uid) of the current user.
 * 
 * [[Note: This function returns the same value as ${function.FirebaseAuthentication_GetLocalId}.]]
 * 
 * @returns {string}
 * @example
 * ```gml
 * var _uid = FirebaseAuthentication_GetUID();
 * ```
 * The code above will retrieve the unique identifier (`_uid`) of the current user and stores it in a local variable.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_GetUserData_raw
 * @desc This function returns a raw user representation as a JSON formatted string.
 * Below is a sample of the returned information string parsed as a struct (using the ${function.json_parse} function) with information for some of the supported providers: Apple, Facebook, Google Play Games and Phone.
 * 
 * ```gml
 * {
 *    "kind":"identitytoolkit#GetAccountInfoResponse",
 *    "users":[
 *       {
 *          "email":"**",
 *          "localId":"**8",
 *          "emailVerified":true,
 *          "phoneNumber":true,
 *          "providerUserInfo":[
 *             {
 *                "email":"**@privaterelay.appleid.com",
 *                "providerId":"apple.com",
 *                "rawId":"**",
 *                "federatedId":"**"
 *             },
 *             {
 *                "displayName":"**",
 *                "photoUrl":"https:**",
 *                "providerId":"facebook.com",
 *                "rawId":"**",
 *                "federatedId":"**"
 *             },
 *             {
 *                "displayName":"**",
 *                "photoUrl":"https:**",
 *                "providerId":"playgames.google.com",
 *                "rawId":"**",
 *                "federatedId":"**"
 *             },
 *             {
 *                "phoneNumber":"**",
 *                "providerId":"phone"
 *             }
 *          ]
 *       }
 *    ]
 * }
 * ```
 * [[Note: It is recommended to use one of the `FirebaseAuthentication_Get*` functions to get the information you need.]]
 * 
 * @param {any} arg The argument to be passed in
 * 
 * @returns {string}
 * @example
 * ```gml
 * var _raw_user_data = FirebaseAuthentication_GetUserData_raw();
 * ```
 * The code above will return a JSON formatted string of an array with raw user data.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_LinkWithEmailPassword
 * @desc This function establishes a link between an email/password pair and the current user (used for ${page.logins_authentication#Email_Authentication} based authentication). The returned value is a listener identifier that can be used for tracking progress on the request.
 * 
 * @param {string} email The email to link the current user to.
 * @param {string} pass The password to link to the current user account.
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_LinkWithEmailPassword"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] User raw data (if status == 200)
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_LinkWithEmailPassword("super_user@example.com", "myPass123!");
 * ```
 * In the code above we attempt to link the current user with a email/password pair. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseAuthentication_LinkWithEmailPassword")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message(json_parse(async_load[? "value"]));
 *     }
 *     else
 *     {
 *         show_debug_message("There was an error linking email/pass to current user.");
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_LinkWithOAuthCredential
 * @desc This function establishes a link between an OAuth credential and the current user  (used for ${page.logins_authentication#Apple_Authentication}, ?{page.logins_authentication#Facebook_Authentication}, ${page.logins_authentication#Google_Authentication} and ${page.logins_authentication#Google_Play_Services_Authentication} based authentications). The returned value is a listener identifier that can be used for tracking progress on the request.
 * 
 * @param {string} token The provider token.
 * @param {string} token_kind One of the provided strings `"id_token"`, `"access_token"` or `"serverAuthCode"`
 * @param {string} provider The provider identifier (e.g. `"apple.com"`, `"google.com"`, etc.)
 * @param {string} [redirect_uri] Only for REST API (can be checked on the Firebase Console for your provider)
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_LinkWithOAuthCredential"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] User raw data (if status == 200)
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_LinkWithOAuthCredential(token, token_kind, provider, redirect_uri);
 * ```
 * In the code above we attempt to link the current user with an OAuth credential. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseAuthentication_LinkWithEmailPassword")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message(json_parse(async_load[? "value"]));
 *     }
 *     else
 *     {
 *         show_debug_message("There was an error linking OAuth credential to current user.");
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_LinkWithPhoneNumber
 * @desc This function establishes a link between a phone number and the current user. The returned value is a listener identifier that can be used for tracking progress on the request.
 * 
 * @param {string} phone The phone number, including country number (i.e.: `"+44123456789"`)
 * @param {string} code The code from the SMS.
 * @param {string} session_info Session info from the re-catcha puzzle.
 * 
 * @returns {real}
 *
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_LinkWithPhoneNumber"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] User raw data (if status == 200)
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_LinkWithPhoneNumber(phone, code, sessionInfo);
 * ```
 * In the code above we attempt to link the current user with a phone number. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseAuthentication_LinkWithPhoneNumber")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message(json_parse(async_load[? "value"]));
 *     }
 *     else
 *     {
 *         show_debug_message("There was an error linking phone number to current user.");
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_ReauthenticateWithEmail
 * @desc This function re-authenticates the current user using an email/password (used for ${page.logins_authentication#Email_Authentication} based authentication). The returned value is a listener identifier that can be used for tracking progress on the request.
 * 
 * @param {string} email The email to link the current user to.
 * @param {string} pass The password to link to the current user account.
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_ReauthenticateWithEmail"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] User raw data (if status == 200)
 * @member {string} [errorMessage] The readable error message
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_ReauthenticateWithEmail("super_user@example.com", "myPass123!");
 * ```
 * In the code above we attempt to re-authenticate the current user with a email/password pair. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseAuthentication_ReauthenticateWithEmail")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message(json_parse(async_load[? "value"]));
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_ReauthenticateWithOAuth
 * @desc This function re-authenticates the current user using an OAuth credential (used for ${page.logins_authentication#Apple_Authentication}, ${page.logins_authentication#Facebook_Authentication}, ${page.logins_authentication#Google_Authentication} and ${page.logins_authentication#Google_Play_Services_Authentication}). The returned value is a listener identifier that can be used for tracking progress on the request.
 * 
 * @param {string} token The provider token.
 * @param {string} token_kind One of the provided strings `"id_token"` or `"access_token"` or `"serverAuthCode"`
 * @param {string} provider The provider identifier (i.e.: `"apple.com"`, `"google.com"`, etc.)
 * @param {string} redirect_uri Only for REST API (can be checked on the Firebase Console for your provider)
 * 
 * @returns {Real}
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_ReauthenticateWithOAuth"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] User raw data (if status == 200)
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_ReauthenticateWithOAuth(token, token_kind, provider, redirect_uri);
 * ```
 * In the code above we attempt to re-authenticate the current user with an OAuth credential. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseAuthentication_ReauthenticateWithOAuth")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message(json_parse(async_load[? "value"]));
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_ReauthenticateWithPhoneNumber
 * @desc This function re-authenticates the current user using a phone number. The returned value is a listener identifier that can be used for tracking progress on the request.
 * 
 * @param {string} phone The phone number, including country number (i.e.: `"+44123456789"`)
 * @param {string} code The code from the SMS.
 * @param {string} session_info Session info from the re-catcha puzzle.
 * 
 * @returns {real}
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_ReauthenticateWithPhoneNumber"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] User raw data (if status == 200)
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_ReauthenticateWithPhoneNumber(phone, code, sessionInfo);
 * ```
 * In the code above we try to re-authenticate the current user with a phone number. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseAuthentication_ReauthenticateWithPhoneNumber")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message(json_parse(async_load[? "value"]));
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_RecaptchaParams
 * @desc This function requests a **recaptchaSiteKey** and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * @returns {real}
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_RecaptchaParams"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] A JSON formatted string with **recaptchaSiteKey** (if status == 200)
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_RecaptchaParams();
 * ```
 * In the code above we attempt to get the recaptcha parameters that can be used for phone number authentication (see ${function.FirebaseAuthentication_LinkWithPhoneNumber}). The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * 
 * ```gml
 * if (async_load[? "type"] == "FirebaseAuthentication_RecaptchaParams")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         var data = json_decode(async_load[? "value"]);
 *         var recaptchaSiteKey = data.recaptchaSiteKey;
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_RefreshUserData
 * @desc This function can be used to refresh the user data and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * @returns {Real}
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_RefreshUserData"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] A JSON formatted string with the **recaptchaSiteKey** value (if status == 200)
 * @member {string} [errorMessage] The readable error message
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_RefreshUserData();
 * ```
 * In the code above we attempt to refresh the current user's data. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseAuthentication_RefreshUserData")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         var data = json_decode(async_load[? "value"]);
 *         show_debug_message(data);
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_SendEmailVerification
 * @desc This function sends an email verification to the current user (used for ${page.logins_authentication#Email_Authentication} based authentication) and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * @param {string} email The email to be verified.
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_SendEmailVerification"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_SendEmailVerification();
 * ```
 * In the code above we attempt to send an email verification to the current user. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseAuthentication_RefreshUserData")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("Email verification succeeded");
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_SendPasswordResetEmail
 * @desc This function sends a password reset email to the current user (used for ${page.logins_authentication#Email_Authentication} based authentication) and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * @param {string} email The email to send the password reset email to.
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member  {string} type The string `"FirebaseAuthentication_SendPasswordResetEmail"`
 * @member  {real} listener The asynchronous listener ID.
 * @member  {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member  {string} [value] The return value (if status == 200)
 * @member  {string} [errorMessage] The readable error message
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_SendPasswordResetEmail("myemail@example.com");
 * ```
 * In the code above we attempt to send a password reset email to the current user. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseAuthentication_SendPasswordResetEmail")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("Email verification succeeded");
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_SendVerificationCode
 * @desc This function sends a verification code and requests for a **sessionInfo**  key (used for ${page.logins_authentication#Phone_Authentication} based authentication), it then returns a listener identifier that can be used for tracking progress on the request.
 * 
 * @param {string} phoneNumber The phone number to send the verification code to, including country code (i.e.: `"+44123456789"`)
 * @param {string} recaptchaToken The recaptcha token (obtained from solving the reCAPTCHA puzzle).
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_SendVerificationCode"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] A JSON formatted string with the **sessionInfo**  **value (if status == 200)
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_SendVerificationCode(phoneNumber, recaptchaToken);
 * ```
 * In the code above we attempt to send a verification code to the current user. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseAuthentication_SendVerificationCode")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("Verification code sent!");
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_SignIn_Anonymously
 * @desc This function signs in a user anonymously and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * @returns {real}
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_SignIn_Anonymously"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] A JSON formatted string with the user's raw data (if status == 200)
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_SignIn_Anonymously();
 * ```
 * In the code above we attempt to sign in the current user anonymously. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseAuthentication_SignIn_Anonymously")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("Signed in successfully!");
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_SignIn_Email
 * @desc This function signs in a user with an email and password (used for ${page.logins_authentication#Email_Authentication} based authentication) and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * @param {string} email The email to sign in with.
 * @param {string} pass The password associated with the email above (not the actual email's password).
 * 
 * @returns {real}
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_SignIn_Email"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] A JSON formatted string with the user's raw data (if status == 200)
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_SignIn_Email("myemail@example.com", "mypass123!");
 * ```
 * In the code above we attempt to sign in the current user using an email/password. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseAuthentication_SignIn_Email")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("Signed in successfully!");
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_SignIn_OAuth
 * @desc This function signs in a user with an OAuth credential (used for ${page.logins_authentication#Apple_Authentication}, ${page.logins_authentication#Facebook_Authentication}, ${page.logins_authentication#Google_Authentication} and ${page.logins_authentication#Google_Play_Services_Authentication} based authentications) and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * @param {string} token The provider token.
 * @param {string} token_kind One of the provided strings `"id_token"`, `"access_token"` or `"serverAuthCode"`
 * @param {string} provider The provider identifier (i.e.: `"apple.com"`, `"google.com"`, etc.)
 * @param {string} [redirect_uri] The redirect URI if using REST API (can be checked on the Firebase Console for your provider)

 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_SignIn_OAuth"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] A JSON formatted string with the user's raw data (if status == 200)
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_SignIn_OAuth(token, token_kind, provider, redirect_uri);
 * ```
 * In the code above we attempt to sign in the current user using an OAuth credential. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "type"] == "FirebaseAuthentication_SignIn_OAuth")
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("Signed in successfully!");
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event **type**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_SignInWithCustomToken
 * @desc This function tries to sign in a user with a given custom token. Use this function after you retrieve a Firebase Auth Custom Token from your server (used with ${page.logins_authentication#Custom_Authentication}). The function returns a listener identifier that can be used for tracking progress on the request.
 * 
 * @param {string} customToken The user's Firebase custom token.
 * 
 * @returns {real}
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_SignInWithCustomToken"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] A JSON formatted string with the user's raw data (if status == 200)
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_SignIn_OAuth(token, token_kind, provider, redirect_uri);
 * ```
 * In the code above we attempt to sign in the current user using an OAuth credential. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "id"] == listenerId)
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("Signed in successfully!");
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event listener **id**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_SignInWithPhoneNumber
 * @desc This function signs in a user with a phone number (used for ${page.logins_authentication#Phone_Authentication} based authentication) and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * @param {string} phone The phone number, including country code (i.e.: `"+44123456789"`)
 * @param {string} code The code from the SMS.
 * @param {string} session_info Session info from the re-captcha puzzle.
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_SignInWithPhoneNumber"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] A JSON formatted string with the user's raw data (if status == 200)
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_SignInWithPhoneNumber(phone, code, sessionInfo);
 * ```
 * In the code above we attempt to sign in the current user using a phone number. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * 
 * ```gml
 * if (async_load[? "id"] == listenerId)
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("Signed in successfully!");
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event listener **id**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_SignOut
 * @desc This function signs out the current user.
 * 
 * @example
 * ```gml
 * FirebaseAuthentication_SignOut();
 * ```
 * The code above will log the current user out of the Firebase Authentication system.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_SignUp_Email
 * @desc This function signs up a user with an email and password (used for ${page.logins_authentication#Email_Authentication} based authentication) and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * @param {string} email The email to to be used during sign-up.
 * @param {string} pass The password to be associated with the email provided (not the actual email's password)
 * 
 * @returns {real}
 * 
 * @event social
 * @member {string} type The string `"FirebaseAuthentication_SignUp_Email"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] A JSON formatted string with the user's raw data (if status == 200)
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_SignUp_Email("myemail@example.com", "mypass123!");
 * ```
 * In the code above we attempt to sign up the current user using an email and password. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * 
 * ```gml
 * if (async_load[? "id"] == listenerId)
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("Signed up successfully!");
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event listener **id**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func FirebaseAuthentication_UnlinkProvider
 * @desc This function unlinks a provider from the current user and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * @param {string} provider_identifer The provider identifier (e.g. `"apple.com"`, `"google.com"`, `"phone"`, etc.)
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_UnlinkProvider"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_UnlinkProvider("apple.com");
 * ```
 * In the code above we attempt to unlink the provider `"apple.com"` from the current user. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * 
 * ```gml
 * if (async_load[? "id"] == listenerId)
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("Unliked provider successfully!");
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event listener **id**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func SDKFirebaseAuthentication_LinkWithGameCenter
 * @desc This function links a Game Center account to the current user (used for ${page.logins_authentication#GameCenter_Authentication}) based authentication) and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * [[Warning: This function is only available on iOS.]]
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_LinkWithGameCenter"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] A JSON formatted string with the user's raw data (if status == 200)
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_LinkWithGameCenter();
 * ```
 * In the code above we attempt to link the current user to a game center account. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * 
 * ```gml
 * if (async_load[? "id"] == listenerId)
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("Account linked successfully!");
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event listener **id**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func SDKFirebaseAuthentication_LinkWithProvider
 * @desc This function links the user account with a specific provider (the user needs to be signed in) and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * [[Warning: This function is only available on Android, iOS and Web.]]
 * 
 * @param {string} provider The provider identifier (i.e.: `"apple.com"`, `"google.com"`, etc.)
 * 
 * @returns {real}
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"SDKFirebaseAuthentication_LinkWithProvider"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] A JSON formatted string with the user's raw data (if status == 200)
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = SDKFirebaseAuthentication_LinkWithProvider("apple.com");
 * ```
 * In the code above we attempt to link the current user to the `"apple.com"` provider (see ${page.logins_authentication#Apple_Authentication} for more information on this authentication method). The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "id"] == listenerId)
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("Account linked successfully!");
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event listener **id**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func SDKFirebaseAuthentication_ReauthenticateWithGameCenter
 * @desc This function re-authenticates the user using a Game Center account (used for ${page.logins_authentication#GameCenter_Authentication} based authentication) and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * [[Warning: This function is only available on iOS.]]
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAuthentication_ReauthenticateWithGameCenter"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] A JSON formatted string with the user's raw data (if status == 200)
 * @member {string} [errorMessage] The readable error message 
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = FirebaseAuthentication_ReauthenticateWithGameCenter();
 * ```
 * In the code above we attempt to re-authenticate the current user using a game center account. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * ```gml
 * if (async_load[? "id"] == listenerId)
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("Account linked successfully!");
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event listener **id**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func SDKFirebaseAuthentication_ReauthenticateWithProvider
 * @desc This function re-authenticates the user account with a specific provider (the user needs to be signed in) and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * [[Warning: This function is only available on Android, iOS and Web.]]
 * 
 * @param {string} provider The provider identifier (i.e.: `"apple.com"`, `"google.com"`, etc.)
 * 
 * @returns {real}
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"SDKFirebaseAuthentication_ReauthenticateWithProvider"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] A JSON formatted string with the user's raw data (if status == 200)
 * @member {string} [errorMessage] The readable error message
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = SDKFirebaseAuthentication_ReauthenticateWithProvider("apple.com");
 * ```
 * In the code above we attempt to re-authenticate the current user to the `"apple.com"` provider (see ${page.logins_authentication#Apple_Authentication} for more information on this authentication method). The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * 
 * ```gml
 * if (async_load[? "id"] == listenerId)
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("Account re-authenticated successfully!");
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event listener **id**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func SDKFirebaseAuthentication_SignIn_GameCenter
 * @desc This function signs in the current user with a Game Center account (used for ${page.logins_authentication#GameCenter_Authentication} based authentication) and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * [[Warning: This function is only available on iOS.]]
 * 
 * @returns {real}
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"SDKFirebaseAuthentication_SignIn_GameCenter"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] A JSON formatted string with the user's raw data (if status == 200)
 * @member {string} [errorMessage] The readable error message
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = SDKFirebaseAuthentication_SignIn_GameCenter();
 * ```
 * In the code above we attempt to sign in the current using a game center account. The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * 
 * ```gml
 * if (async_load[? "id"] == listenerId)
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("Account linked successfully!");
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event listener **id**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */

/**
 * @func SDKFirebaseAuthentication_SignInWithProvider
 * @desc This function signs in the user using the browser account native to a specific provider and returns a listener identifier that can be used for tracking progress on the request.
 * 
 * [[Warning: This function is only available on Android, iOS and Web.]]
 * 
 * @param {string} provider The provider identifier (i.e.: `"apple.com"`, `"google.com"`, etc)
 * 
 * @returns {real}
 * @event social
 * @desc 
 * @member {string} type The string `"SDKFirebaseAuthentication_SignInWithProvider"`
 * @member {real} listener The asynchronous listener ID.
 * @member {real} status The HTTP status response code (see [reference](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes))
 * @member {string} [value] A JSON formatted string with the user's raw data
 * @member {string} [errorMessage] The readable error message
 * @event_end
 * 
 * @example
 * ```gml
 * listenerId = SDKFirebaseAuthentication_SignInWithProvider("apple.com");
 * ```
 * In the code above we attempt to sign in the current user using the `"apple.com"` provider (see ${page.logins_authentication#Apple_Authentication} for more information on this authentication method). The function call will then return a listener ID (`listenerId`) that can be used inside a ${event.social}.
 * 
 * ```gml
 * if (async_load[? "id"] == listenerId)
 * {
 *     if (async_load[? "status"] == 200)
 *     {
 *         show_debug_message("User signed in successfully!");
 *     }
 *     else
 *     {
 *         show_debug_message(async_load[? "errorMessage"]);
 *     }
 * }
 * ```
 * The code above matches the response against the correct event listener **id**, checks for a **status** value of `200` meaning that it was successful and logs the result of the task.
 * @function_end
 */
