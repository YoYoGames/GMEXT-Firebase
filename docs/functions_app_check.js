// Functions

/**
 * @function FirebaseAppCheck_GetToken
 * @desc This function requests a Firebase App Check token.
 * 
 * [[Note: This method should be used **only** if you need to authorise requests to a non-Firebase backend. Requests to Firebase backends are authorised automatically if configured.]]
 * 
 * @param {boolean} force_refresh Whether the token should be refreshed automatically
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAppCheck_GetToken"`
 * @member {boolean} success Whether a token could be retrieved successfully
 * @member {string} [token] The token string (only present when `success` is `true`)
 * @event_end
 * 
 * @func_end
 */

/**
 * @function FirebaseAppCheck_LimitedUseToken
 * @desc This function gets a limited use App Check token intended for use with non-Firebase backend endpoints that are protected with [Replay Protection](https://firebase.google.com/docs/app-check/custom-resource-backend#replay-protection).
 * 
 * This method does not affect the token generation behaviour of the ${function.FirebaseAppCheck_GetToken} function.
 * 
 * [[Note: This method should be used **only** if you need to authorise requests to a non-Firebase backend. Requests to Firebase backends are authorised automatically if configured.]]
 * 
 * @event social
 * @desc 
 * @member {string} type The string `"FirebaseAppCheck_LimitedUseToken"`
 * @member {boolean} success Whether a token could be retrieved successfully
 * @member {string} [token] The token string (only present when `success` is `true`)
 * @event_end
 * 
 * @func_end
 */

// Modules

/**
 * @module app_check
 * @title App Check
 * @desc > **Reference**: [Firebase App Check](https://firebase.google.com/docs/app-check)
 * 
 * This module adds support for Firebase App Check to your game.
 * 
 * App Check is a Firebase feature used to make sure that requests originate from an authentic instance of your app or from an authentic, untampered device.
 * It works by attaching an attestation to every request made to the Firebase APIs. Requests from clients without a valid attestation will be rejected, as will any request originating from an app or platform you haven't authorised.
 * 
 * [[Warning: The Debug providers should **only** be used in debug builds and should never be used in a production version of your game!]]
 * 
 * @section Guides
 * @desc These are the guides for the App Check extension:
 * @ref page.guides_app_check
 * @section_end
 * 
 * @section_func Functions
 * @desc These are the functions in the App Check module:
 * @ref FirebaseAppCheck_GetToken
 * @ref FirebaseAppCheck_LimitedUseToken
 * @section_end
 * @module_end
 */
