/**
 * @function firebase_functions_get_instance
 * @desc **Firebase C++ SDK:** [firebase::functions::Functions::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/functions/functions#getinstance)
 *
 * This function returns a handle to Cloud Functions for the default Firebase App, calling functions
 * deployed in the default region (`us-central1`), and creates the instance on first use. The same
 * handle comes back on every call, it lives as long as the game, and there is nothing to release.
 * Callables start from it: ${function.firebase_functions_get_https_callable} names a function by
 * its deployed name. It returns `0` when ${function.firebase_app_initialize} has not succeeded,
 * with ${function.firebase_last_error_code} set to `FirebaseError.NotInitialized`.
 *
 * @returns {Real} The Cloud Functions handle, or `0` when the default app does not exist.
 * @function_end
 */

/**
 * @function firebase_functions_get_instance_with_region
 * @desc **Firebase C++ SDK:** [firebase::functions::Functions::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/functions/functions#getinstance_1)
 *
 * This function is ${function.firebase_functions_get_instance} for functions deployed in another
 * region - the region a function was deployed to is part of its address, so a function in
 * `europe-west1` is reached through an instance for `europe-west1`. Each region has its own
 * instance, and each comes back as the same handle on every call.
 *
 * @param {String} region The region's id (`"europe-west1"`, `"asia-northeast1"`).
 * @returns {Real} The Cloud Functions handle for that region, or `0` when the default app does not exist.
 * @function_end
 */

/**
 * @function firebase_functions_use_functions_emulator
 * @desc **Firebase C++ SDK:** [firebase::functions::Functions::UseFunctionsEmulator](https://firebase.google.com/docs/reference/cpp/class/firebase/functions/functions#usefunctionsemulator)
 *
 * This function points an instance at the Functions emulator of the Firebase Local Emulator Suite,
 * so that calls reach the functions running on the development machine instead of the deployed
 * ones. Call it right after obtaining the instance, before any callable is made from it; the
 * callables made afterwards go to the emulator. The emulator's default port is `5001`.
 *
 * @param {Real} functions_ref The Cloud Functions handle from ${function.firebase_functions_get_instance}.
 * @param {String} origin The emulator's origin, scheme and port included (`"http://127.0.0.1:5001"`).
 * @function_end
 */

/**
 * @function firebase_functions_get_https_callable
 * @desc **Firebase C++ SDK:** [firebase::functions::Functions::GetHttpsCallable](https://firebase.google.com/docs/reference/cpp/class/firebase/functions/functions#gethttpscallable)
 *
 * This function returns a callable for a deployed function, by the name it was exported under. A
 * callable is an address, not a connection: nothing is sent until
 * ${function.firebase_functions_callable_call} or ${function.firebase_functions_callable_call_with_data},
 * a name that does not exist fails only then (`NotFound`, code `5`), and one callable can be called
 * any number of times. Release it with ${function.firebase_functions_callable_release}.
 *
 * @param {Real} functions_ref The Cloud Functions handle from ${function.firebase_functions_get_instance}.
 * @param {String} name The function's deployed name (`"claimDailyReward"`).
 * @returns {Real} A callable handle to release with ${function.firebase_functions_callable_release}, or `0` when the handle is not valid.
 *
 * @example
 * ```gml
 * // Create Event of a persistent controller
 * functions = firebase_functions_get_instance();
 * claim_reward = firebase_functions_get_https_callable(functions, "claimDailyReward");
 *
 * // The "Claim" button
 * firebase_functions_callable_call_with_data(claim_reward, { day: current_day },
 *     function(_error, _message, _data)
 *     {
 *         if (_error != 0)
 *         {
 *             show_debug_message($"claimDailyReward failed ({_error}): {_message}");
 *             exit;
 *         }
 *         coins += _data.coins;
 *         show_message(_data.text);
 *     });
 *
 * // Clean Up Event
 * firebase_functions_callable_release(claim_reward);
 * ```
 * The above code makes one callable at start-up and calls it whenever the player claims, passing a
 * struct the function receives as its `data` and reading the struct the function returned. The
 * function decides on the server whether the claim is allowed, which is the point of putting it
 * there rather than in the game.
 * @function_end
 */

/**
 * @function firebase_functions_get_https_callable_with_options
 * @desc **Firebase C++ SDK:** [firebase::functions::Functions::GetHttpsCallable](https://firebase.google.com/docs/reference/cpp/class/firebase/functions/functions#gethttpscallable_1)
 *
 * This function is ${function.firebase_functions_get_https_callable} with the one option a
 * callable has: whether each call carries a limited-use App Check token instead of the ordinary
 * one. A limited-use token is meant to be consumed by the function (`consumeAppCheckToken` on the
 * server side), so that a request captured in transit cannot be replayed; it costs a token
 * exchange per call, and needs App Check set up (see ${module.app_check}). The option is fixed for
 * the life of the callable.
 *
 * @param {Real} functions_ref The Cloud Functions handle from ${function.firebase_functions_get_instance}.
 * @param {String} name The function's deployed name.
 * @param {Real} limited_use_app_check_token `1` to send a limited-use App Check token with each call - one the function can consume so that a captured request cannot be replayed - `0` for the ordinary token.
 * @returns {Real} A callable handle to release with ${function.firebase_functions_callable_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_functions_get_https_callable_from_url
 * @desc **Firebase C++ SDK:** [firebase::functions::Functions::GetHttpsCallableFromURL](https://firebase.google.com/docs/reference/cpp/class/firebase/functions/functions#gethttpscallablefromurl)
 *
 * This function returns a callable for a function by its full URL rather than its name - the way
 * to reach a function behind a custom domain, or a 2nd-generation function through the Cloud Run
 * URL the console shows for it. The instance's region does not apply, since the URL carries the
 * address. Release it with ${function.firebase_functions_callable_release}.
 *
 * @param {Real} functions_ref The Cloud Functions handle from ${function.firebase_functions_get_instance}.
 * @param {String} url The function's HTTPS URL.
 * @returns {Real} A callable handle to release with ${function.firebase_functions_callable_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_functions_get_https_callable_from_url_with_options
 * @desc **Firebase C++ SDK:** [firebase::functions::Functions::GetHttpsCallableFromURL](https://firebase.google.com/docs/reference/cpp/class/firebase/functions/functions#gethttpscallablefromurl_1)
 *
 * This function is ${function.firebase_functions_get_https_callable_from_url} with the
 * limited-use App Check token option of
 * ${function.firebase_functions_get_https_callable_with_options}.
 *
 * @param {Real} functions_ref The Cloud Functions handle from ${function.firebase_functions_get_instance}.
 * @param {String} url The function's HTTPS URL.
 * @param {Real} limited_use_app_check_token `1` to send a limited-use App Check token with each call - one the function can consume so that a captured request cannot be replayed - `0` for the ordinary token.
 * @returns {Real} A callable handle to release with ${function.firebase_functions_callable_release}, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_functions_callable_is_valid
 * @desc **Firebase C++ SDK:** [firebase::functions::HttpsCallableReference::is_valid](https://firebase.google.com/docs/reference/cpp/class/firebase/functions/https-callable-reference#is_valid)
 *
 * This function returns whether the handle refers to a usable callable - `0` for a released
 * handle.
 *
 * @param {Real} ref A callable handle.
 * @returns {Real} `1` when the callable can be called, otherwise `0`.
 * @function_end
 */

/**
 * @function firebase_functions_callable_release
 * @desc This function releases a callable handle. A call already in flight completes and its callback
 * fires whether or not the callable has been released, so a callable can be released as soon as
 * the calls that need it have been started.
 *
 * @param {Real} ref The handle to release.
 * @function_end
 */

/**
 * @function firebase_functions_callable_call
 * @desc **Firebase C++ SDK:** [firebase::functions::HttpsCallableReference::Call](https://firebase.google.com/docs/reference/cpp/class/firebase/functions/https-callable-reference#call)
 *
 * This function calls the function with no argument - its `data` is `null` - and hands the
 * callback what it returned. The SDK sends the player's Authentication token when someone is signed in (${module.auth}) and
 * the App Check token when App Check is set up, so the function knows who is calling without the
 * game passing anything. The callback's `error_code` is `0` when the function returned normally;
 * when the function threw an `HttpsError`, it is that error's code as the Error codes section of
 * ${module.functions} lists them and `error_message` is the message the function gave; a function
 * that crashed reads `Internal` (code `13`), one that does not exist `NotFound` (code `5`), and a
 * network failure `Unavailable` (code `14`) or `DeadlineExceeded` (code `4`).
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when the callable
 * handle is not valid.
 *
 * @param {Real} ref A callable handle.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the function has returned or the call failed.
 * @member {Real} error_code `0` on success, otherwise one of the codes listed under Error codes on the ${module.functions} page.
 * @member {String} error_message The message the function threw, or the SDK's description of a transport failure, or an empty string on success.
 * @member {Any} data The value the function returned, converted as the Data section of ${module.functions} describes; `undefined` when it returned nothing or on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_functions_callable_call_with_data
 * @desc **Firebase C++ SDK:** [firebase::functions::HttpsCallableReference::Call](https://firebase.google.com/docs/reference/cpp/class/firebase/functions/https-callable-reference#call_1)
 *
 * This function calls the function with an argument - the value the function receives as its
 * `data`, converted as the Data section of ${module.functions} describes: a struct arrives as an
 * object with the same members, an array as an array, and so on - and hands the callback what it
 * returned. The SDK sends the player's Authentication token when someone is signed in (${module.auth}) and
 * the App Check token when App Check is set up, so the function knows who is calling without the
 * game passing anything. The callback's `error_code` is `0` when the function returned normally;
 * when the function threw an `HttpsError`, it is that error's code as the Error codes section of
 * ${module.functions} lists them and `error_message` is the message the function gave; a function
 * that crashed reads `Internal` (code `13`), one that does not exist `NotFound` (code `5`), and a
 * network failure `Unavailable` (code `14`) or `DeadlineExceeded` (code `4`).
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when the callable
 * handle is not valid.
 *
 * @param {Real} ref A callable handle.
 * @param {Any} data The value to send: a number, string, boolean, array, struct, or `undefined` for null.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the function has returned or the call failed.
 * @member {Real} error_code `0` on success, otherwise one of the codes listed under Error codes on the ${module.functions} page.
 * @member {String} error_message The message the function threw, or the SDK's description of a transport failure, or an empty string on success.
 * @member {Any} data The value the function returned, converted as the Data section of ${module.functions} describes; `undefined` when it returned nothing or on failure.
 * @event_end
 *
 * @example
 * ```gml
 * // Submit a score the server validates and ranks
 * submit_score = firebase_functions_get_https_callable(functions, "submitScore");
 * firebase_functions_callable_call_with_data(submit_score,
 *     { level: level_id, score: score, replay: replay_events },
 *     function(_error, _message, _data)
 *     {
 *         if (_error == 7)      // PermissionDenied: the function rejected the replay
 *         {
 *             show_debug_message($"Score rejected: {_message}");
 *         }
 *         else if (_error == 0)
 *         {
 *             show_debug_message($"Rank {_data.rank} of {_data.total}");
 *         }
 *         firebase_functions_callable_release(submit_score);
 *     });
 * ```
 * The above code sends a struct holding the score and the replay that proves it; the function
 * verifies the replay on the server and either throws `permission-denied`, which reaches the
 * callback as code `7` with the function's message, or returns the rank as a struct. The callable
 * is released in the callback because nothing else uses it.
 * @function_end
 */

/**
 * @function firebase_functions_get_app
 * @desc **Firebase C++ SDK:** [firebase::functions::Functions::app](https://firebase.google.com/docs/reference/cpp/class/firebase/functions/functions#app)
 *
 * This function returns a handle to the Firebase App a Cloud Functions instance belongs to. Release
 * it with ${function.firebase_app_release_handle}.
 *
 * @param {Real} functions The Cloud Functions handle from ${function.firebase_functions_get_instance}.
 * @returns {Real} An app handle, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_functions_callable_get_functions
 * @desc **Firebase C++ SDK:** [firebase::functions::HttpsCallableReference::functions](https://firebase.google.com/docs/reference/cpp/class/firebase/functions/https-callable-reference#functions)
 *
 * This function returns the Cloud Functions instance a callable was made from - the same handle
 * ${function.firebase_functions_get_instance} or ${function.firebase_functions_get_instance_with_region}
 * returned, with nothing to release.
 *
 * @param {Real} callable A callable handle.
 * @returns {Real} The Cloud Functions handle, or `0` when the callable handle is not valid.
 * @function_end
 */

/**
 * @function firebase_functions_get_instance_for_app
 * @desc **Firebase C++ SDK:** [firebase::functions::Functions::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/functions/functions#getinstance)
 *
 * This function returns a handle to Cloud Functions for another Firebase App, created with
 * ${function.firebase_app_initialize_with_options} or ${function.firebase_app_initialize_from_json},
 * in the default region. It returns `0` when the app handle is not valid or the instance could not
 * be created.
 *
 * @param {Real} app An app handle.
 * @returns {Real} The Cloud Functions handle, or `0` on failure.
 * @function_end
 */

/**
 * @function firebase_functions_get_instance_for_app_region
 * @desc **Firebase C++ SDK:** [firebase::functions::Functions::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/functions/functions#getinstance_1)
 *
 * This function is ${function.firebase_functions_get_instance_for_app} for a region of that
 * app's project.
 *
 * @param {Real} app An app handle.
 * @param {String} region The region's id.
 * @returns {Real} The Cloud Functions handle, or `0` on failure.
 * @function_end
 */

/**
 * @module functions
 * @title Cloud Functions
 * @desc This module covers Cloud Functions for Firebase, on the calling side: HTTPS callable functions -
 * code deployed to Firebase that the game calls with a value and that answers with a value, for
 * everything a game must not trust the client with (granting rewards, validating scores, moving
 * currency between players, talking to a third-party API with a secret key). The functions
 * themselves are written in JavaScript, TypeScript or Python and deployed with the Firebase CLI;
 * ${page.setup_cloud_functions} walks through that. Everything on this side starts from the
 * handle of ${function.firebase_functions_get_instance}.
 *
 * ### Handles
 *
 * A callable reaches GML as a numeric handle to release with
 * ${function.firebase_functions_callable_release}; the Cloud Functions instance handle has no
 * release and lives as long as the game. A callable can be called any number of times, and can be
 * released as soon as its calls have been started - a call in flight completes on its own.
 *
 * ### Data
 *
 * The argument of ${function.firebase_functions_callable_call_with_data} and the result every call
 * hands back are converted between GML and the JSON the function sees: a number stays a number, a
 * string a string, `true`/`false` a boolean, an array an array, a struct an object with one
 * property per member (nested as deep as needed), and `undefined` is `null` - so the function's
 * `data` and its return value are ordinary JSON on the server, and ordinary values in GML. The
 * result comes back the same way; a function that returns nothing hands the callback `undefined`.
 *
 * ### Error codes
 *
 * Every call returns ${constant.FirebaseError} at once and delivers its outcome to a callback.
 * The callback's `error_code` is the standard code set callables use - the code a function
 * throws with its `HttpsError`, or the code the SDK assigns to a transport failure - as a plain
 * number:
 *
 * - `0` - success.
 * - `1` - `Cancelled`: the call was cancelled.
 * - `2` - `Unknown`: an error the SDK could not classify.
 * - `3` - `InvalidArgument`: the function rejected the argument.
 * - `4` - `DeadlineExceeded`: the call timed out before the function answered.
 * - `5` - `NotFound`: no function with that name or URL is deployed.
 * - `6` - `AlreadyExists`: the function reports that what the call would create already exists.
 * - `7` - `PermissionDenied`: the function refused the caller.
 * - `8` - `ResourceExhausted`: a quota or rate limit was hit.
 * - `9` - `FailedPrecondition`: the function reports that the system is not in the state the call needs.
 * - `10` - `Aborted`: the function aborted, typically a conflicting write.
 * - `11` - `OutOfRange`: the function reports an argument past its valid range.
 * - `12` - `Unimplemented`: the function reports the operation is not implemented.
 * - `13` - `Internal`: the function crashed, or threw something other than an `HttpsError`.
 * - `14` - `Unavailable`: the function or the network is unavailable; retry later.
 * - `15` - `DataLoss`: the function reports unrecoverable data loss.
 * - `16` - `Unauthenticated`: the function requires a signed-in caller and there is none.
 *
 * ### Console setup
 *
 * Functions are deployed from a project folder with the Firebase CLI, which needs the project on
 * the pay-as-you-go plan; the console's **Build > Functions** page lists what is deployed, with
 * each function's region, and the logs of every call. ${page.setup_cloud_functions} walks through
 * writing and deploying a first callable.
 *
 * @section_func Instance
 * @desc The Cloud Functions instance for a region, and the emulator:
 * @ref firebase_functions_get_instance
 * @ref firebase_functions_get_instance_with_region
 * @ref firebase_functions_get_instance_for_app
 * @ref firebase_functions_get_instance_for_app_region
 * @ref firebase_functions_get_app
 * @ref firebase_functions_use_functions_emulator
 * @section_end
 *
 * @section_func Callables
 * @desc A callable addresses one deployed function, by name or by URL:
 * @ref firebase_functions_get_https_callable
 * @ref firebase_functions_get_https_callable_with_options
 * @ref firebase_functions_get_https_callable_from_url
 * @ref firebase_functions_get_https_callable_from_url_with_options
 * @ref firebase_functions_callable_is_valid
 * @ref firebase_functions_callable_get_functions
 * @ref firebase_functions_callable_release
 * @section_end
 *
 * @section_func Calling
 * @desc Calling a function, with or without an argument:
 * @ref firebase_functions_callable_call
 * @ref firebase_functions_callable_call_with_data
 * @section_end
 *
 * @module_end
 */
