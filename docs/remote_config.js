/**
 * @function firebase_remote_config_get_instance
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#getinstance)
 *
 * This function returns a handle to Remote Config for the default Firebase App, creating the
 * instance on first use. The same handle comes back on every call, it lives as long as the game,
 * and there is nothing to release. It returns `0` when ${function.firebase_app_initialize} has not
 * succeeded, with ${function.firebase_last_error_code} set to `FirebaseError.NotInitialized`.
 *
 * The instance loads the values it activated last time from the device, so the game reads the
 * previous session's configuration at once and the current one after a fetch and an activation;
 * see the Values section of ${module.remote_config}.
 *
 * @returns {Real} The Remote Config handle, or `0` when the default app does not exist.
 *
 * @example
 * ```gml
 * // Create Event of a persistent controller, after firebase_app_initialize()
 * config = firebase_remote_config_get_instance();
 * firebase_remote_config_set_defaults(config, {
 *     daily_reward: 100,
 *     hard_mode_enabled: false,
 *     welcome_text: "Welcome back!"
 * }, undefined);
 *
 * firebase_remote_config_fetch_and_activate(config, function(_error, _message, _activated)
 * {
 *     if (_error != 0)
 *     {
 *         show_debug_message($"Remote Config fetch failed: {_message}");
 *     }
 *     daily_reward = firebase_remote_config_get_long(config, "daily_reward");
 *     hard_mode = firebase_remote_config_get_boolean(config, "hard_mode_enabled");
 *     welcome_text = firebase_remote_config_get_string(config, "welcome_text");
 * });
 * ```
 * The above code is the whole Remote Config flow: defaults so that every key has a value from the
 * first frame, one fetch-and-activate at start-up, and the values read in the callback - which reads
 * the fetched values on success and the defaults or the previous session's values on failure, so
 * the game is configured either way.
 * @function_end
 */

/**
 * @function firebase_remote_config_ensure_initialized
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::EnsureInitialized](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#ensureinitialized)
 *
 * This function waits for the instance to have loaded its stored values from the device and calls
 * back when it has. The value getters and the defaults call work before that, but on Android and
 * iOS they block the game until the load is done; a game that reads values in its first frames can
 * wait for this callback instead. The instance is loaded within a moment of
 * ${function.firebase_remote_config_get_instance}, so the callback comes quickly.
 * ${function.firebase_remote_config_ensure_initialized_info} is the same call with the fetch
 * state delivered too.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when the handle
 * is not valid.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the instance has loaded its stored values.
 * @member {Real} error_code `0` on success, `1` on failure.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_remote_config_set_config_settings
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::SetConfigSettings](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#setconfigsettings)
 *
 * This function sets the two settings a fetch obeys. `fetch_timeout_ms` is how long a fetch waits
 * to connect to the backend before failing; the default is 60 seconds. `minimum_fetch_interval_ms`
 * is how recent the stored values have to be for ${function.firebase_remote_config_fetch} to skip
 * the network and complete at once with what it has; the default is 12 hours, which keeps a
 * released game under the backend's throttling limit. During development set the interval to `0`
 * so that every fetch reaches the backend and a change published in the console shows up on the
 * next fetch - and put it back before release, because a game that fetches too often gets
 * throttled (`FirebaseRemoteConfigFetchFailureReason.Throttled` in
 * ${function.firebase_remote_config_get_info}). Both values must be zero or positive; a negative
 * or non-finite one is refused with `FirebaseError.InvalidArgument`.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when the handle
 * is not valid.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {Real} fetch_timeout_ms The connection timeout of a fetch, in milliseconds.
 * @param {Real} minimum_fetch_interval_ms How old the stored values may be before a fetch goes to the backend, in milliseconds.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the settings have been applied.
 * @member {Real} error_code `0` on success, `1` on failure.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @example
 * ```gml
 * // Development builds see console changes on every fetch
 * if (debug_mode)
 * {
 *     firebase_remote_config_set_config_settings(config, 60000, 0, undefined);
 * }
 * ```
 * The above code drops the minimum fetch interval to zero in debug builds only, keeping the
 * 60-second connection timeout, so that testing sees each published change without the release
 * build ever fetching more often than the default.
 * @function_end
 */

/**
 * @function firebase_remote_config_get_config_settings_fetch_timeout
 * @desc **Firebase C++ SDK:** [firebase::remote_config::ConfigSettings](https://firebase.google.com/docs/reference/cpp/struct/firebase/remote-config/config-settings#fetch_timeout_in_milliseconds)
 *
 * This function returns how long a fetch waits to connect to the backend before failing, as set with ${function.firebase_remote_config_set_config_settings}
 * or the default.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @returns {Real} The fetch timeout in milliseconds, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_remote_config_get_config_settings_minimum_fetch_interval
 * @desc **Firebase C++ SDK:** [firebase::remote_config::ConfigSettings](https://firebase.google.com/docs/reference/cpp/struct/firebase/remote-config/config-settings#minimum_fetch_interval_in_milliseconds)
 *
 * This function returns how old the stored values may be before a fetch goes to the backend rather than completing with what it has, as set with ${function.firebase_remote_config_set_config_settings}
 * or the default.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @returns {Real} The minimum fetch interval in milliseconds, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_remote_config_fetch
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::Fetch](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#fetch)
 *
 * This function fetches the current parameter values from the backend into a holding area - the
 * values the game reads do not change until ${function.firebase_remote_config_activate} moves them
 * over, which lets the game pick a moment (a loading screen, the next session) when a change will
 * not disturb play. When the stored values are younger than the minimum fetch interval (12 hours
 * by default), the call completes at once without touching the network. The callback's
 * `error_code` is `1` for a fetch that failed; ${function.firebase_remote_config_get_info} says
 * why, and `Throttled` there means the game has fetched too often and must wait until the info's
 * `throttled_end_time`. ${function.firebase_remote_config_fetch_and_activate} does both steps in
 * one call.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when the handle
 * is not valid.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the fetch has completed or failed.
 * @member {Real} error_code `0` on success, `1` on failure.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_remote_config_fetch_with_expiration
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::Fetch](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#fetch_1)
 *
 * This function is ${function.firebase_remote_config_fetch} with its own freshness limit instead of
 * the instance's minimum fetch interval: stored values younger than `cache_expiration_in_seconds`
 * are kept and the call completes at once; `0` always goes to the backend. A negative or
 * non-finite value is refused with `FirebaseError.InvalidArgument`.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when the handle
 * is not valid.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {Real} cache_expiration_in_seconds How old the stored values may be, in seconds; `0` to fetch regardless.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the fetch has completed or failed.
 * @member {Real} error_code `0` on success, `1` on failure.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_remote_config_fetch_and_activate
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::FetchAndActivate](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#fetchandactivate)
 *
 * This function is ${function.firebase_remote_config_fetch} followed by
 * ${function.firebase_remote_config_activate}: the usual call at start-up, after which the getters
 * return the current values. The minimum fetch interval applies to the fetch, so within 12 hours
 * of the last one (by default) the call completes at once with `activated` `false` and the stored
 * values stay - which is the intended behaviour for a released game. On a failed fetch
 * `error_code` is `1` and the getters keep returning what they returned before.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when the handle
 * is not valid.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the fetch and the activation have completed, or the fetch failed.
 * @member {Real} error_code `0` on success, `1` on failure.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Bool} activated `true` when this call activated newly fetched values, `false` when there were none or on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_remote_config_activate
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::Activate](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#activate)
 *
 * This function makes the values of the last successful fetch the ones the getters return, and
 * stores them on the device for the next launch. The callback's `activated` is `false` when there
 * was nothing new to activate - no fetch since the last activation, or a fetch that brought the
 * same version - which is not an error.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when the handle
 * is not valid.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the activation has completed.
 * @member {Real} error_code `0` on success, `1` on failure.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Bool} activated `true` when fetched values were activated, `false` when there were none to activate or on failure.
 * @event_end
 *
 * @example
 * ```gml
 * // A real-time update arrived: apply it at the next room change
 * listener = firebase_remote_config_add_config_update_listener(config, function(_error, _message, _keys)
 * {
 *     if (_error == FirebaseRemoteConfigError.None) config_pending = true;
 * });
 *
 * // Room Start Event
 * if (config_pending)
 * {
 *     config_pending = false;
 *     firebase_remote_config_activate(config, function(_error, _message, _activated)
 *     {
 *         if (_activated) apply_config();
 *     });
 * }
 * ```
 * The above code lets the SDK fetch a published change in the background and defers the
 * activation to a room start, so that values never change mid-level; `apply_config` re-reads the
 * getters once the new values are live.
 * @function_end
 */

/**
 * @function firebase_remote_config_get_boolean
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::GetBoolean](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#getboolean)
 *
 * This function returns a parameter's value as a boolean. A console value of `true`, `1`, `t`,
 * `yes`, `y` or `on` (in any case) reads as `true`; `false`, `0`, `f`, `no`, `n`, `off` and an empty
 * value read as `false`; anything else fails the conversion and reads as `false`, which
 * ${function.firebase_remote_config_get_boolean_with_info} can tell apart. The value comes from the last activation, or the default set with
 * ${function.firebase_remote_config_set_defaults}, or - with neither - the static value.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {String} key The parameter's key.
 * @returns {Bool} `true` for a true value, otherwise `false`.
 * @function_end
 */

/**
 * @function firebase_remote_config_get_long
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::GetLong](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#getlong)
 *
 * This function returns a parameter's value as a whole number. A value that is not one - `1.5`,
 * `abc`, empty - fails the conversion and reads as `0`, which
 * ${function.firebase_remote_config_get_long_with_info} can tell apart. The value comes from the last activation, or the default set with
 * ${function.firebase_remote_config_set_defaults}, or - with neither - the static value.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {String} key The parameter's key.
 * @returns {Real} The value, or `0`.
 * @function_end
 */

/**
 * @function firebase_remote_config_get_double
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::GetDouble](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#getdouble)
 *
 * This function returns a parameter's value as a number, whole or decimal. A value that is not a
 * number fails the conversion and reads as `0`, which
 * ${function.firebase_remote_config_get_double_with_info} can tell apart. The value comes from the last activation, or the default set with
 * ${function.firebase_remote_config_set_defaults}, or - with neither - the static value.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {String} key The parameter's key.
 * @returns {Real} The value, or `0`.
 * @function_end
 */

/**
 * @function firebase_remote_config_get_string
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::GetString](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#getstring)
 *
 * This function returns a parameter's value as text - the form every value has in the console, so
 * the conversion cannot fail. A JSON parameter arrives here too, ready for `json_parse`. The value comes from the last activation, or the default set with
 * ${function.firebase_remote_config_set_defaults}, or - with neither - the static value.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {String} key The parameter's key.
 * @returns {String} The value, or an empty string.
 * @function_end
 */

/**
 * @function firebase_remote_config_get_data_size
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::GetData](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#getdata)
 *
 * This function returns the size in bytes of a parameter's value as raw data - the bytes of the
 * same text ${function.firebase_remote_config_get_string} returns - to size the buffer for
 * ${function.firebase_remote_config_get_data}.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {String} key The parameter's key.
 * @returns {Real} The size in bytes, or `0`.
 * @function_end
 */

/**
 * @function firebase_remote_config_get_data
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::GetData](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#getdata)
 *
 * This function copies a parameter's value as raw bytes into a buffer the game created, from the
 * buffer's start and up to its size, and returns how many bytes it wrote. Size the buffer with
 * ${function.firebase_remote_config_get_data_size}. The bytes are the UTF-8 of the value's text;
 * this is the way to take a large value straight into a buffer without a GML string in between. The value comes from the last activation, or the default set with
 * ${function.firebase_remote_config_set_defaults}, or - with neither - the static value.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {String} key The parameter's key.
 * @param {Buffer} out_buffer The buffer to copy into.
 * @returns {Real} The number of bytes copied.
 * @function_end
 */

/**
 * @function firebase_remote_config_get_keys_by_prefix
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::GetKeysByPrefix](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#getkeysbyprefix)
 *
 * This function hands the callback an array of the parameter keys that start with a prefix - a
 * naming convention such as `level_3_` groups a set of parameters the game can then read in a loop.
 * An empty prefix gives every key. The callback is called with that one argument before the function returns - it
 * is the shape the value takes, not a wait - so the result can be used right away, and the
 * function's return only says whether the callback was called.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when the handle
 * is not valid.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {String} prefix The start of the keys wanted.
 * @param {Function} [callback] The function to call with the array of keys, as its one argument.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the callback was called, otherwise the reason it was not.
 * @function_end
 */

/**
 * @function firebase_remote_config_get_keys
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::GetKeys](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#getkeys)
 *
 * This function hands the callback an array of every parameter key the instance knows: the
 * activated values' keys and the defaults' keys together. The callback is called with that one argument before the function returns - it
 * is the shape the value takes, not a wait - so the result can be used right away, and the
 * function's return only says whether the callback was called.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when the handle
 * is not valid.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {Function} [callback] The function to call with the array of keys, as its one argument.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the callback was called, otherwise the reason it was not.
 * @function_end
 */

/**
 * @function firebase_remote_config_get_all
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::GetAll](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#getall)
 *
 * This function hands the callback a struct with one member per parameter key - the activated
 * value where there is one, the default otherwise. Each value is typed from its text: a whole
 * number or a decimal becomes a number, `true`/`false` a boolean, anything else a string - so a
 * version string like `"1.0"` arrives as the number `1` here, and a value that must stay text is
 * read with ${function.firebase_remote_config_get_string} instead. The callback is called with that one argument before the function returns - it
 * is the shape the value takes, not a wait - so the result can be used right away, and the
 * function's return only says whether the callback was called.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when the handle
 * is not valid.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {Function} [callback] The function to call with the struct of key to value, as its one argument.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the callback was called, otherwise the reason it was not.
 *
 * @example
 * ```gml
 * firebase_remote_config_get_all(config, function(_values)
 * {
 *     var _keys = variable_struct_get_names(_values);
 *     for (var _i = 0; _i < array_length(_keys); _i++)
 *     {
 *         show_debug_message($"{_keys[_i]} = {_values[$ _keys[_i]]}");
 *     }
 * });
 * ```
 * The above code lists every parameter with its value, which is the quickest way to see what a
 * build is running with.
 * @function_end
 */

/**
 * @function firebase_remote_config_set_defaults
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::SetDefaults](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#setdefaults)
 *
 * This function sets the value each parameter has until a fetched value is activated for it - and
 * keeps, for a parameter the console does not define at all. Pass a struct with one member per
 * key; each value is a number, a string or a boolean, and its type decides which getter reads it
 * back naturally. The call replaces every default set before, so set them all at once, right after
 * ${function.firebase_remote_config_get_instance} and before the first read. A member that is an
 * array, a struct or `undefined` is refused with `FirebaseError.InvalidArgument` and nothing is
 * set. The defaults are not stored on the device: set them at every launch.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when the handle
 * is not valid.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {Any} defaults A struct of key to number, string or boolean.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the defaults have been applied.
 * @member {Real} error_code `0` on success, `1` on failure.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_remote_config_set_custom_signals
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::SetCustomSignals](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#setcustomsignals)
 *
 * This function sets custom signals: key/value pairs about this player or device that the console's
 * conditions can target, so that a parameter can take one value for, say, players past level 20 or
 * on a given server region without the game knowing the rule. Pass a struct with one member per
 * signal; a value is a number or a string, and `undefined` removes the signal. The call merges with
 * the signals set before rather than replacing them, and the signals are sent with every fetch
 * from then on. Up to 100 signals may be set, with keys and string values limited to a few hundred
 * characters; beyond that the callback reports failure. A boolean, an array or a struct value is refused
 * with `FirebaseError.InvalidArgument` and nothing is set.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when the handle
 * is not valid.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {Any} signals A struct of key to number or string, or `undefined` to remove that signal.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the signals have been applied or refused.
 * @member {Real} error_code `0` on success, `1` on failure.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @event_end
 *
 * @example
 * ```gml
 * // Before the fetch, describe the player for the console's conditions
 * firebase_remote_config_set_custom_signals(config, {
 *     player_level: level,
 *     region: server_region,
 *     beta_tester: undefined   // no longer in the beta: remove the signal
 * }, function(_error, _message)
 * {
 *     firebase_remote_config_fetch_and_activate(config, on_config_ready);
 * });
 * ```
 * The above code sets two signals and removes a third, then fetches once they are in place so
 * that the backend evaluates the console's conditions against them.
 * @function_end
 */

/**
 * @function firebase_remote_config_get_info
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::GetInfo](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#getinfo)
 *
 * This function returns the state of the last fetch as a ${struct.FirebaseRemoteConfigInfo}: when
 * it completed, whether it succeeded, is still running or failed, why it failed, and - after a
 * `Throttled` failure - when the backend will accept a fetch again. For a handle that is not valid
 * the struct reads `Failure` / `Error` with the times at `0`.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @returns {Struct.FirebaseRemoteConfigInfo} The last fetch's state.
 * @function_end
 */

/**
 * @function firebase_remote_config_add_config_update_listener
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::AddOnConfigUpdateListener](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#addonconfigupdatelistener)
 *
 * This function starts listening for changes published in the console: the SDK keeps a connection
 * to the backend, fetches a new version as soon as it is published, and calls the listener with
 * the keys whose value changed - the fetch is done, and the game only has to
 * ${function.firebase_remote_config_activate} when it is ready for the change. Real-time updates
 * work on Android and iOS; on Windows, macOS and Linux the listener is accepted and never called,
 * and a game that wants fresh values there fetches on its own schedule. The listener stays until
 * ${function.firebase_remote_config_remove_config_update_listener}; the connection closes when the
 * last listener is removed.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {Function} [callback] The function to call on each update.
 * @returns {Real} A listener handle to remove with ${function.firebase_remote_config_remove_config_update_listener}, or `0` when the handle is not valid.
 *
 * @event callback
 * @desc Fires each time a new version has been fetched, or the connection failed.
 * @member {Enum.FirebaseRemoteConfigError} error_code `FirebaseRemoteConfigError.None` when an update was fetched, otherwise the reason.
 * @member {String} error_message A description of the failure, or an empty string on success.
 * @member {Array[String]} updated_keys The keys whose value, source or metadata changed since the activated version, including keys added and removed; empty on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_remote_config_remove_config_update_listener
 * @desc **Firebase C++ SDK:** [firebase::remote_config::ConfigUpdateListenerRegistration::Remove](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/config-update-listener-registration#remove)
 *
 * This function removes a real-time listener and frees its handle. When it was the last one, the
 * connection to the backend is closed; adding a listener again reopens it.
 *
 * @param {Real} reg_ref The listener handle from ${function.firebase_remote_config_add_config_update_listener}.
 * @returns {Bool} `true` when a listener was removed, `false` when the handle was not one.
 * @function_end
 */

/**
 * @function firebase_remote_config_ensure_initialized_info
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::EnsureInitialized](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#ensureinitialized)
 *
 * This function is ${function.firebase_remote_config_ensure_initialized} with the callback also
 * receiving a ${struct.FirebaseRemoteConfigInfo}: when the last fetch happened and how it went, as
 * ${function.firebase_remote_config_get_info} would report it.
 *
 * The function returns `FirebaseError.InvalidHandle` without calling the callback when the handle
 * is not valid.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {Function} [callback] The function to call with the result.
 * @returns {Enum.FirebaseError} `FirebaseError.Ok` when the call reached the SDK, otherwise the reason the callback will not fire.
 *
 * @event callback
 * @desc Fires once when the instance has loaded its stored values.
 * @member {Real} error_code `0` on success, `1` on failure.
 * @member {String} error_message The SDK's description of the failure, or an empty string on success.
 * @member {Struct.FirebaseRemoteConfigInfo} info The state of the last fetch, or `undefined` on failure.
 * @event_end
 * @function_end
 */

/**
 * @function firebase_remote_config_get_boolean_with_info
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::GetBoolean](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#getboolean_1)
 *
 * This function is ${function.firebase_remote_config_get_boolean} returning a ${struct.FirebaseRemoteConfigBooleanInfo}: the value together with where it came
 * from - a fetched value, the default, or the static value for a parameter nobody defined - and
 * whether the conversion succeeded. It is the way to tell a genuine `0` or empty string from a
 * missing or malformed parameter.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {String} key The parameter's key.
 * @returns {Struct.FirebaseRemoteConfigBooleanInfo} The value with its source, or `undefined` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_remote_config_get_long_with_info
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::GetLong](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#getlong_1)
 *
 * This function is ${function.firebase_remote_config_get_long} returning a ${struct.FirebaseRemoteConfigLongInfo}: the value together with where it came
 * from - a fetched value, the default, or the static value for a parameter nobody defined - and
 * whether the conversion succeeded. It is the way to tell a genuine `0` or empty string from a
 * missing or malformed parameter.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {String} key The parameter's key.
 * @returns {Struct.FirebaseRemoteConfigLongInfo} The value with its source, or `undefined` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_remote_config_get_double_with_info
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::GetDouble](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#getdouble_1)
 *
 * This function is ${function.firebase_remote_config_get_double} returning a ${struct.FirebaseRemoteConfigDoubleInfo}: the value together with where it came
 * from - a fetched value, the default, or the static value for a parameter nobody defined - and
 * whether the conversion succeeded. It is the way to tell a genuine `0` or empty string from a
 * missing or malformed parameter.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {String} key The parameter's key.
 * @returns {Struct.FirebaseRemoteConfigDoubleInfo} The value with its source, or `undefined` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_remote_config_get_string_with_info
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::GetString](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#getstring_1)
 *
 * This function is ${function.firebase_remote_config_get_string} returning a ${struct.FirebaseRemoteConfigStringInfo}: the value together with where it came
 * from - a fetched value, the default, or the static value for a parameter nobody defined - and
 * whether the conversion succeeded. It is the way to tell a genuine `0` or empty string from a
 * missing or malformed parameter.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {String} key The parameter's key.
 * @returns {Struct.FirebaseRemoteConfigStringInfo} The value with its source, or `undefined` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_remote_config_get_data_with_info
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::GetData](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#getdata_1)
 *
 * This function is ${function.firebase_remote_config_get_data} returning a
 * ${struct.FirebaseRemoteConfigDataInfo}: how many bytes were copied, the value's full size, where
 * the value came from and whether the conversion succeeded. When `bytes_copied` is less than `size`
 * the buffer was too small.
 *
 * @param {Real} rc_ref The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @param {String} key The parameter's key.
 * @param {Buffer} out_buffer The buffer to copy into.
 * @returns {Struct.FirebaseRemoteConfigDataInfo} The copy's result with the value's source, or `undefined` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_remote_config_get_app
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::app](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#app)
 *
 * This function returns a handle to the Firebase App a Remote Config instance belongs to. Release
 * it with ${function.firebase_app_release_handle}.
 *
 * @param {Real} remote_config The Remote Config handle from ${function.firebase_remote_config_get_instance}.
 * @returns {Real} An app handle, or `0` when the handle is not valid.
 * @function_end
 */

/**
 * @function firebase_remote_config_get_instance_for_app
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfig::GetInstance](https://firebase.google.com/docs/reference/cpp/class/firebase/remote-config/remote-config#getinstance)
 *
 * This function returns a handle to Remote Config for another Firebase App, created with
 * ${function.firebase_app_initialize_with_options} or ${function.firebase_app_initialize_from_json}.
 * It returns `0` with ${function.firebase_last_error_code} set when the app handle is not valid or
 * the instance could not be created.
 *
 * @param {Real} app An app handle.
 * @returns {Real} The Remote Config handle, or `0` on failure.
 * @function_end
 */

/**
 * @struct FirebaseRemoteConfigInfo
 * @desc **Firebase C++ SDK:** [firebase::remote_config::ConfigInfo](https://firebase.google.com/docs/reference/cpp/struct/firebase/remote-config/config-info)
 *
 * The state of the last fetch, from ${function.firebase_remote_config_get_info} and
 * ${function.firebase_remote_config_ensure_initialized_info}.
 *
 * @member {Real} fetch_time When the last fetch completed, in milliseconds since the Unix epoch; `0` when none has been attempted.
 * @member {Enum.FirebaseRemoteConfigLastFetchStatus} last_fetch_status Whether the last fetch succeeded, failed or is still running.
 * @member {Enum.FirebaseRemoteConfigFetchFailureReason} last_fetch_failure_reason Why the last fetch failed; `Invalid` while none has.
 * @member {Real} throttled_end_time After a `Throttled` failure, when the backend will accept a fetch again, in milliseconds since the Unix epoch.
 * @struct_end
 */

/**
 * @struct FirebaseRemoteConfigBooleanInfo
 * @desc **Firebase C++ SDK:** [firebase::remote_config::ValueInfo](https://firebase.google.com/docs/reference/cpp/struct/firebase/remote-config/value-info)
 *
 * A parameter's boolean value with where it came from, from ${function.firebase_remote_config_get_boolean_with_info}.
 *
 * @member {Bool} value The value, converted as ${function.firebase_remote_config_get_boolean} converts it.
 * @member {Enum.FirebaseRemoteConfigValueSource} source Whether the value was fetched, is the default, or is the static value of a parameter nobody defined.
 * @member {Bool} conversion_successful `true` when the parameter's text converted to this type, `false` when it did not and `value` is the static value.
 * @struct_end
 */

/**
 * @struct FirebaseRemoteConfigLongInfo
 * @desc **Firebase C++ SDK:** [firebase::remote_config::ValueInfo](https://firebase.google.com/docs/reference/cpp/struct/firebase/remote-config/value-info)
 *
 * A parameter's whole-number value with where it came from, from ${function.firebase_remote_config_get_long_with_info}.
 *
 * @member {Real} value The value, converted as ${function.firebase_remote_config_get_long} converts it.
 * @member {Enum.FirebaseRemoteConfigValueSource} source Whether the value was fetched, is the default, or is the static value of a parameter nobody defined.
 * @member {Bool} conversion_successful `true` when the parameter's text converted to this type, `false` when it did not and `value` is the static value.
 * @struct_end
 */

/**
 * @struct FirebaseRemoteConfigDoubleInfo
 * @desc **Firebase C++ SDK:** [firebase::remote_config::ValueInfo](https://firebase.google.com/docs/reference/cpp/struct/firebase/remote-config/value-info)
 *
 * A parameter's number value with where it came from, from ${function.firebase_remote_config_get_double_with_info}.
 *
 * @member {Real} value The value, converted as ${function.firebase_remote_config_get_double} converts it.
 * @member {Enum.FirebaseRemoteConfigValueSource} source Whether the value was fetched, is the default, or is the static value of a parameter nobody defined.
 * @member {Bool} conversion_successful `true` when the parameter's text converted to this type, `false` when it did not and `value` is the static value.
 * @struct_end
 */

/**
 * @struct FirebaseRemoteConfigStringInfo
 * @desc **Firebase C++ SDK:** [firebase::remote_config::ValueInfo](https://firebase.google.com/docs/reference/cpp/struct/firebase/remote-config/value-info)
 *
 * A parameter's string value with where it came from, from ${function.firebase_remote_config_get_string_with_info}.
 *
 * @member {String} value The value, converted as ${function.firebase_remote_config_get_string} converts it.
 * @member {Enum.FirebaseRemoteConfigValueSource} source Whether the value was fetched, is the default, or is the static value of a parameter nobody defined.
 * @member {Bool} conversion_successful `true` when the parameter's text converted to this type, `false` when it did not and `value` is the static value.
 * @struct_end
 */

/**
 * @struct FirebaseRemoteConfigDataInfo
 * @desc **Firebase C++ SDK:** [firebase::remote_config::ValueInfo](https://firebase.google.com/docs/reference/cpp/struct/firebase/remote-config/value-info)
 *
 * The result of copying a parameter's raw bytes, from ${function.firebase_remote_config_get_data_with_info}.
 *
 * @member {Real} bytes_copied How many bytes were written into the buffer.
 * @member {Real} size The value's full size in bytes; larger than `bytes_copied` when the buffer was too small.
 * @member {Enum.FirebaseRemoteConfigValueSource} source Whether the value was fetched, is the default, or is the static value of a parameter nobody defined.
 * @member {Bool} conversion_successful `true` when the value could be read as bytes.
 * @struct_end
 */

/**
 * @const FirebaseRemoteConfigLastFetchStatus
 * @desc **Firebase C++ SDK:** [firebase::remote_config::LastFetchStatus](https://firebase.google.com/docs/reference/cpp/namespace/firebase/remote-config#lastfetchstatus)
 *
 * How the last fetch went, in ${struct.FirebaseRemoteConfigInfo}.
 *
 * @member Success The last fetch succeeded and its values are ready to activate, if that has not been done.
 * @member Failure The last fetch failed; `last_fetch_failure_reason` says why.
 * @member Pending A fetch is in progress.
 * @const_end
 */

/**
 * @const FirebaseRemoteConfigFetchFailureReason
 * @desc **Firebase C++ SDK:** [firebase::remote_config::FetchFailureReason](https://firebase.google.com/docs/reference/cpp/namespace/firebase/remote-config#fetchfailurereason)
 *
 * Why the last fetch failed, in ${struct.FirebaseRemoteConfigInfo}.
 *
 * @member Invalid No fetch has failed.
 * @member Throttled The backend refused the fetch because the game fetches too often; `throttled_end_time` says when it will accept one again.
 * @member Error The fetch failed for another reason - no network, a timeout, a backend error.
 * @const_end
 */

/**
 * @const FirebaseRemoteConfigValueSource
 * @desc **Firebase C++ SDK:** [firebase::remote_config::ValueSource](https://firebase.google.com/docs/reference/cpp/namespace/firebase/remote-config#valuesource)
 *
 * Where a value came from, in the `*_with_info` structs.
 *
 * @member StaticValue Neither a fetched value nor a default exists for the key, so the type's static value was returned: `0`, `false` or an empty string.
 * @member RemoteValue The value was fetched from the backend and activated.
 * @member DefaultValue No fetched value exists for the key, so the default from ${function.firebase_remote_config_set_defaults} was returned.
 * @const_end
 */

/**
 * @const FirebaseRemoteConfigError
 * @desc **Firebase C++ SDK:** [firebase::remote_config::RemoteConfigError](https://firebase.google.com/docs/reference/cpp/namespace/firebase/remote-config#remoteconfigerror)
 *
 * The `error_code` a real-time listener receives. The fetch and activation callbacks do not use
 * it: their `error_code` is `0` or `1`, with the reason in ${function.firebase_remote_config_get_info}.
 *
 * @member Unimplemented Real-time updates are not available on this platform.
 * @member None An update was fetched.
 * @member ConfigUpdateStreamError The SDK could not connect to the backend.
 * @member ConfigUpdateMessageInvalid The backend sent a message the SDK could not parse.
 * @member ConfigUpdateNotFetched An update was announced but the SDK could not fetch the new version.
 * @member ConfigUpdateUnavailable The real-time update service is unavailable.
 * @const_end
 */

/**
 * @module remote_config
 * @title Remote Config
 * @desc This module covers Firebase Remote Config: parameters set in the Firebase console - a number, a
 * string, a boolean, a block of JSON - that the game reads at runtime, so that balance, feature
 * flags, event dates and text can change without a new build, and take different values for
 * different players through the console's conditions and the game's own custom signals.
 * Everything starts from the handle of ${function.firebase_remote_config_get_instance}.
 *
 * ### Values
 *
 * A parameter's value goes through three places. A fetch (${function.firebase_remote_config_fetch})
 * downloads the current values into a holding area; an activation
 * (${function.firebase_remote_config_activate}) makes them the values the getters return and
 * stores them on the device; ${function.firebase_remote_config_fetch_and_activate} does both. At
 * launch the getters return what was activated last time, then the defaults set with
 * ${function.firebase_remote_config_set_defaults}, then the type's static value - `0`, `false` or
 * an empty string - so a read never fails, and a game that sets defaults for every key it uses is
 * configured from the first frame whatever the network does.
 *
 * Every value is text in the console; the typed getters convert it, and the `*_with_info` getters
 * say whether the conversion worked and where the value came from.
 *
 * ### Fetching
 *
 * The stored values are considered fresh for the minimum fetch interval - 12 hours by default -
 * and a fetch within it completes at once without touching the network. That interval is what
 * keeps a released game under the backend's throttling; during development
 * ${function.firebase_remote_config_set_config_settings} brings it to `0`. On Android and iOS
 * ${function.firebase_remote_config_add_config_update_listener} fetches a change the moment it is
 * published, leaving only the activation to the game.
 *
 * Every asynchronous function returns ${constant.FirebaseError} at once and delivers its outcome
 * to a callback, whose `error_code` is `0` on success and `1` on failure - the reason is in
 * ${function.firebase_remote_config_get_info}. The real-time listener is the exception: its
 * `error_code` is a ${constant.FirebaseRemoteConfigError}.
 *
 * ### Console setup
 *
 * Parameters are created and published under **Run > Remote Config** in the Firebase console; a
 * change reaches the game once it is published, and once the game fetches. Conditions target
 * parameters by app, platform, version, language, country, user property, percentage of players,
 * and the custom signals set with ${function.firebase_remote_config_set_custom_signals}.
 * ${page.guides_remote_config} walks through it.
 *
 * @section_func Instance
 * @desc The instance, its initialisation, and the fetch settings:
 * @ref firebase_remote_config_get_instance
 * @ref firebase_remote_config_get_instance_for_app
 * @ref firebase_remote_config_get_app
 * @ref firebase_remote_config_ensure_initialized
 * @ref firebase_remote_config_ensure_initialized_info
 * @ref firebase_remote_config_set_config_settings
 * @ref firebase_remote_config_get_config_settings_fetch_timeout
 * @ref firebase_remote_config_get_config_settings_minimum_fetch_interval
 * @section_end
 *
 * @section_func Defaults and fetching
 * @desc Setting the defaults, fetching and activating values, reading the fetch state, and
 * describing the player for the console's conditions:
 * @ref firebase_remote_config_set_defaults
 * @ref firebase_remote_config_fetch
 * @ref firebase_remote_config_fetch_with_expiration
 * @ref firebase_remote_config_activate
 * @ref firebase_remote_config_fetch_and_activate
 * @ref firebase_remote_config_get_info
 * @ref firebase_remote_config_set_custom_signals
 * @section_end
 *
 * @section_func Reading values
 * @desc Reading a parameter by type, with or without its source, and listing the keys:
 * @ref firebase_remote_config_get_boolean
 * @ref firebase_remote_config_get_long
 * @ref firebase_remote_config_get_double
 * @ref firebase_remote_config_get_string
 * @ref firebase_remote_config_get_data_size
 * @ref firebase_remote_config_get_data
 * @ref firebase_remote_config_get_boolean_with_info
 * @ref firebase_remote_config_get_long_with_info
 * @ref firebase_remote_config_get_double_with_info
 * @ref firebase_remote_config_get_string_with_info
 * @ref firebase_remote_config_get_data_with_info
 * @ref firebase_remote_config_get_keys
 * @ref firebase_remote_config_get_keys_by_prefix
 * @ref firebase_remote_config_get_all
 * @section_end
 *
 * @section_func Real-time updates
 * @desc Being told when a new version is published:
 * @ref firebase_remote_config_add_config_update_listener
 * @ref firebase_remote_config_remove_config_update_listener
 * @section_end
 *
 * @section_struct Structs
 * @desc The following structs are used by this module:
 * @ref FirebaseRemoteConfigInfo
 * @ref FirebaseRemoteConfigBooleanInfo
 * @ref FirebaseRemoteConfigLongInfo
 * @ref FirebaseRemoteConfigDoubleInfo
 * @ref FirebaseRemoteConfigStringInfo
 * @ref FirebaseRemoteConfigDataInfo
 * @section_end
 *
 * @section_const Constants
 * @desc The following constants are used by this module:
 * @ref FirebaseRemoteConfigLastFetchStatus
 * @ref FirebaseRemoteConfigFetchFailureReason
 * @ref FirebaseRemoteConfigValueSource
 * @ref FirebaseRemoteConfigError
 * @section_end
 *
 * @module_end
 */
