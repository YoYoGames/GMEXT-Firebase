/**
 * @function firebase_crashlytics_set_collection_enabled
 * @desc **Firebase SDK:** [FirebaseCrashlytics.setCrashlyticsCollectionEnabled(boolean) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/crashlytics/FirebaseCrashlytics#setCrashlyticsCollectionEnabled%28boolean%29), [FIRCrashlytics setCrashlyticsCollectionEnabled: (iOS)](https://firebase.google.com/docs/reference/ios/firebasecrashlytics/api/reference/Classes/FIRCrashlytics#-setcrashlyticscollectionenabled:)
 *
 * This function turns automatic crash reporting on or off. It overrides the
 * `disableDataCollection` extension option (see ${page.extension_options}) and persists across
 * launches, so a consent screen calls it once: a game shipped with the option on calls
 * `firebase_crashlytics_set_collection_enabled(true)` when the player agrees, and from then on
 * every crash is reported. While collection is off, crashes are still written to the device and
 * kept; ${function.firebase_crashlytics_check_for_unsent_reports},
 * ${function.firebase_crashlytics_send_unsent_reports} and
 * ${function.firebase_crashlytics_delete_unsent_reports} deal with them. On iOS it does nothing until ${function.firebase_app_initialize} has run.
 *
 * @param {Bool} enabled `true` to report crashes automatically, `false` to keep them on the device.
 * @function_end
 */

/**
 * @function firebase_crashlytics_is_collection_enabled
 * @desc **Firebase SDK:** [FirebaseCrashlytics.isCrashlyticsCollectionEnabled() (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/crashlytics/FirebaseCrashlytics#isCrashlyticsCollectionEnabled%28%29), [FIRCrashlytics isCrashlyticsCollectionEnabled (iOS)](https://firebase.google.com/docs/reference/ios/firebasecrashlytics/api/reference/Classes/FIRCrashlytics#-iscrashlyticscollectionenabled)
 *
 * This function returns whether automatic crash reporting is on: the value set with
 * ${function.firebase_crashlytics_set_collection_enabled}, or the `disableDataCollection`
 * option's when nothing has been set. It returns `false` on iOS before
 * ${function.firebase_app_initialize} has run.
 *
 * @returns {Bool} `true` when crashes are reported automatically, `false` otherwise.
 * @function_end
 */

/**
 * @function firebase_crashlytics_did_crash_on_previous_execution
 * @desc **Firebase SDK:** [FirebaseCrashlytics.didCrashOnPreviousExecution() (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/crashlytics/FirebaseCrashlytics#didCrashOnPreviousExecution%28%29), [FIRCrashlytics didCrashDuringPreviousExecution (iOS)](https://firebase.google.com/docs/reference/ios/firebasecrashlytics/api/reference/Classes/FIRCrashlytics#-didcrashduringpreviousexecution)
 *
 * This function returns whether the previous run of the game ended in a crash Crashlytics
 * recorded. A game uses it to react at launch - offer to send the report when automatic
 * reporting is off, skip straight to the menu rather than resume, or reset a setting that
 * might be the cause. It returns `false` on iOS before ${function.firebase_app_initialize}
 * has run.
 *
 * @returns {Bool} `true` when the previous run crashed, `false` otherwise.
 * @function_end
 */

/**
 * @function firebase_crashlytics_log
 * @desc **Firebase SDK:** [FirebaseCrashlytics.log(java.lang.String) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/crashlytics/FirebaseCrashlytics#log%28java.lang.String%29), [FIRCrashlytics log: (iOS)](https://firebase.google.com/docs/reference/ios/firebasecrashlytics/api/reference/Classes/FIRCrashlytics#-log:)
 *
 * This function adds a line to the session's log, the breadcrumb trail that is attached to the
 * next crash or non-fatal report and shown with it in the console: what the game was doing
 * before it fell over. Log the events that place a crash - room changes, level starts, the
 * start and end of loading, a purchase flow's steps - not every frame; the SDK keeps the last
 * 64 KB of a session and drops the oldest lines beyond that. The line goes nowhere unless a
 * report follows. On iOS it does nothing until ${function.firebase_app_initialize} has run.
 *
 * @param {String} message The line to log.
 *
 * @example
 * ```gml
 * // Room Start
 * firebase_crashlytics_log($"room start: {room_get_name(room)}");
 * firebase_crashlytics_set_custom_key_string("room", room_get_name(room));
 * ```
 * The above code leaves a breadcrumb at every room start and keeps the current room in a custom
 * key, so that a report says both where the player had been and where they were.
 * @function_end
 */

/**
 * @function firebase_crashlytics_set_user_id
 * @desc **Firebase SDK:** [FirebaseCrashlytics.setUserId(java.lang.String) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/crashlytics/FirebaseCrashlytics#setUserId%28java.lang.String%29), [FIRCrashlytics setUserID: (iOS)](https://firebase.google.com/docs/reference/ios/firebasecrashlytics/api/reference/Classes/FIRCrashlytics#-setuserid:)
 *
 * This function attaches an identifier to the session's reports, so that a player's crash can be
 * found from a support request - the console lets you search reports by it. Use an id that
 * means something to you and nothing to anyone else: the Authentication user id
 * (the `uid` of ${function.firebase_auth_user_get_info} is the usual one), never a name or an e-mail address. An
 * empty string clears it. The id is part of what a player's data request covers. On iOS it does nothing until ${function.firebase_app_initialize} has run.
 *
 * @param {String} user_id The identifier, or an empty string for none.
 * @function_end
 */

/**
 * @function firebase_crashlytics_set_custom_key_string
 * @desc **Firebase SDK:** [FirebaseCrashlytics.setCustomKey(java.lang.String,java.lang.String) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/crashlytics/FirebaseCrashlytics#setCustomKey%28java.lang.String,java.lang.String%29), [FIRCrashlytics setCustomValue:forKey: (iOS)](https://firebase.google.com/docs/reference/ios/firebasecrashlytics/api/reference/Classes/FIRCrashlytics#-setcustomvalue:forkey:)
 *
 * This function sets a custom key on the session: a name-value pair sent with every report from
 * now on and shown in the console with it, for the state a crash needs explaining with - the
 * level, the difficulty, whether a save was loaded, the graphics preset. Setting a key again
 * replaces its value. The SDK keeps up to 64 keys per session, each name and value up to 1 KB;
 * beyond that, new keys are dropped. On iOS it does nothing until ${function.firebase_app_initialize} has run.
 *
 * @param {String} key The key's name.
 * @param {String} value The value.
 * @function_end
 */

/**
 * @function firebase_crashlytics_set_custom_key_real
 * @desc **Firebase SDK:** [FirebaseCrashlytics.setCustomKey(java.lang.String,double) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/crashlytics/FirebaseCrashlytics#setCustomKey%28java.lang.String,double%29), [FIRCrashlytics setCustomValue:forKey: (iOS)](https://firebase.google.com/docs/reference/ios/firebasecrashlytics/api/reference/Classes/FIRCrashlytics#-setcustomvalue:forkey:)
 *
 * This function sets a custom key on the session: a name-value pair sent with every report from
 * now on and shown in the console with it, for the state a crash needs explaining with - the
 * level, the difficulty, whether a save was loaded, the graphics preset. Setting a key again
 * replaces its value. The SDK keeps up to 64 keys per session, each name and value up to 1 KB;
 * beyond that, new keys are dropped. On iOS it does nothing until ${function.firebase_app_initialize} has run.
 *
 * @param {String} key The key's name.
 * @param {Real} value The value, stored as a double.
 * @function_end
 */

/**
 * @function firebase_crashlytics_set_custom_key_bool
 * @desc **Firebase SDK:** [FirebaseCrashlytics.setCustomKey(java.lang.String,boolean) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/crashlytics/FirebaseCrashlytics#setCustomKey%28java.lang.String,boolean%29), [FIRCrashlytics setCustomValue:forKey: (iOS)](https://firebase.google.com/docs/reference/ios/firebasecrashlytics/api/reference/Classes/FIRCrashlytics#-setcustomvalue:forkey:)
 *
 * This function sets a custom key on the session: a name-value pair sent with every report from
 * now on and shown in the console with it, for the state a crash needs explaining with - the
 * level, the difficulty, whether a save was loaded, the graphics preset. Setting a key again
 * replaces its value. The SDK keeps up to 64 keys per session, each name and value up to 1 KB;
 * beyond that, new keys are dropped.
 * The value reaches the console as `true` or `false` on both platforms. On iOS it does nothing until ${function.firebase_app_initialize} has run.
 *
 * @param {String} key The key's name.
 * @param {Bool} value The value.
 * @function_end
 */

/**
 * @function firebase_crashlytics_record_error
 * @desc **Firebase SDK:** [FirebaseCrashlytics.recordException(java.lang.Throwable,com.google.firebase.crashlytics.CustomKeysAndValues) (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/crashlytics/FirebaseCrashlytics#recordException%28java.lang.Throwable,com.google.firebase.crashlytics.CustomKeysAndValues%29), [FIRCrashlytics recordError: (iOS)](https://firebase.google.com/docs/reference/ios/firebasecrashlytics/api/reference/Classes/FIRCrashlytics#-recorderror:)
 *
 * This function records a non-fatal error: something the game caught and survived - a failed
 * save, a server reply it could not parse, a state it should never be in - reported to the
 * console as an issue of its own, with the session's log, custom keys and user id attached.
 * The console groups these by `domain` and `code`, so give every distinct kind of error its own
 * pair and keep `message` for the particulars (on Android the pair becomes the reported
 * exception's frame, on iOS the `NSError` domain and code). Non-fatal reports are batched and
 * sent with the next launch; the SDK keeps the most recent eight of a session. On iOS it does nothing until ${function.firebase_app_initialize} has run.
 *
 * @param {String} domain What part of the game the error belongs to, e.g. `"save"` or `"backend"`; an empty string is reported as `GMFirebaseCrashlytics`.
 * @param {Real} code A number telling this kind of error from the domain's others.
 * @param {String} message The particulars: what happened, with the values that matter.
 *
 * @example
 * ```gml
 * try
 * {
 *     load_save(slot);
 * }
 * catch (_e)
 * {
 *     firebase_crashlytics_record_error("save", 1, $"{_e.message} (slot {slot})");
 *     start_new_game();
 * }
 * ```
 * The above code reports a save file that failed to load as a non-fatal error and carries on, so
 * the console shows how often it happens and on which saves, without the player losing their
 * session.
 * @function_end
 */

/**
 * @function firebase_crashlytics_check_for_unsent_reports
 * @desc **Firebase SDK:** [FirebaseCrashlytics.checkForUnsentReports() (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/crashlytics/FirebaseCrashlytics#checkForUnsentReports%28%29), [FIRCrashlytics checkForUnsentReportsWithCompletion: (iOS)](https://firebase.google.com/docs/reference/ios/firebasecrashlytics/api/reference/Classes/FIRCrashlytics#-checkforunsentreportswithcompletion:)
 *
 * This function asks whether crash reports are waiting on the device - the ones written while
 * automatic reporting was off. It is the first step of an ask-before-sending flow: check, and when
 * there are reports ask the player, then ${function.firebase_crashlytics_send_unsent_reports} or
 * ${function.firebase_crashlytics_delete_unsent_reports}. With automatic reporting on there is
 * nothing to ask about; the SDK sends reports at launch by itself. On iOS the SDK answers the
 * question once per run: a second call fails with a message saying so, and the extension
 * reports it as a failure rather than as "no reports". The callback fires with `success` `false`
 * and a message, at once, on iOS before ${function.firebase_app_initialize} has run and on
 * Android when the default Firebase App does not exist.
 *
 * @param {Function} callback The function to call with the answer.
 *
 * @event callback
 * @desc Fires once with the answer.
 * @member {Bool} success `true` when the question was answered, `false` when it could not be.
 * @member {Bool} has_unsent_reports `true` when reports are waiting on the device; `false` otherwise, and always when `success` is `false`.
 * @member {String} error_message Why the question could not be answered, or an empty string.
 * @event_end
 *
 * @example
 * ```gml
 * firebase_crashlytics_check_for_unsent_reports(function(_success, _has_reports, _error)
 * {
 *     if (!_success || !_has_reports) exit;
 *     // The last run crashed and the report is still on the device: ask
 *     if (show_question("The game crashed last time. Send the crash report to help fix it?"))
 *     {
 *         firebase_crashlytics_send_unsent_reports();
 *     }
 *     else
 *     {
 *         firebase_crashlytics_delete_unsent_reports();
 *     }
 * });
 * ```
 * The above code is the ask-before-sending flow for a game shipped with `disableDataCollection`
 * on: it runs at launch, and only when a report is actually waiting does the player see a
 * question.
 * @function_end
 */

/**
 * @function firebase_crashlytics_send_unsent_reports
 * @desc **Firebase SDK:** [FirebaseCrashlytics.sendUnsentReports() (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/crashlytics/FirebaseCrashlytics#sendUnsentReports%28%29), [FIRCrashlytics sendUnsentReports (iOS)](https://firebase.google.com/docs/reference/ios/firebasecrashlytics/api/reference/Classes/FIRCrashlytics#-sendunsentreports)
 *
 * This function uploads the crash reports waiting on the device, for a game that keeps
 * automatic reporting off and asks first (see
 * ${function.firebase_crashlytics_check_for_unsent_reports}). With automatic reporting on it has
 * nothing to do. On iOS it does nothing until ${function.firebase_app_initialize} has run.
 *
 * @function_end
 */

/**
 * @function firebase_crashlytics_delete_unsent_reports
 * @desc **Firebase SDK:** [FirebaseCrashlytics.deleteUnsentReports() (Android)](https://firebase.google.com/docs/reference/android/com/google/firebase/crashlytics/FirebaseCrashlytics#deleteUnsentReports%28%29), [FIRCrashlytics deleteUnsentReports (iOS)](https://firebase.google.com/docs/reference/ios/firebasecrashlytics/api/reference/Classes/FIRCrashlytics#-deleteunsentreports)
 *
 * This function discards the crash reports waiting on the device without sending them - the
 * player's "no" in an ask-before-sending flow. On iOS it does nothing until ${function.firebase_app_initialize} has run.
 *
 * @function_end
 */

/**
 * @function firebase_crashlytics_test_crash
 * @desc This function crashes the game on purpose - it throws an unhandled exception on the platform's
 * main thread - to check that Crashlytics is wired up: the console's setup screen waits for a
 * first report, and this is how to send one. Run the build from the device, not under the
 * debugger (Crashlytics on iOS does not record a crash while Xcode is attached), let it crash,
 * then start the game again: reports are uploaded at the next launch. It has no place in a
 * shipped build.
 *
 * @function_end
 */

/**
 * @module crashlytics
 * @title Crashlytics
 * @desc This module covers Firebase Crashlytics: crash reporting for Android and iOS. Once the
 * extension is in the project every crash of the game's process - a native crash in the runner,
 * an uncaught exception in platform code - is written to the device as it happens and uploaded
 * when the game next starts, symbolicated, grouped into issues and shown in the console with the
 * device, the OS, the app version and whatever context the game attached. The module is that
 * context and the consent switch: nothing in it has to be called for crashes to be reported.
 *
 * A GML runtime error is not a crash to Crashlytics: the runner shows its own dialog and ends the
 * game itself. ${function.firebase_crashlytics_record_error} is how the game reports those, and
 * its own caught errors, as non-fatal issues.
 *
 * ### Platforms
 *
 * The module is the `GMFirebaseCrashlytics` extension, built for Android and iOS only; in a
 * Windows, macOS or Linux build every function returns `undefined` at once and no callback ever
 * fires. On Android the SDK is active from process start, before any GML runs, and the NDK
 * library reports native crashes too. On iOS the SDK starts when ${function.firebase_app_initialize}
 * configures the default app, so a crash before that call is not reported and every function
 * here does nothing until it has run.
 *
 * ### Symbols
 *
 * Reports are only readable with the build's symbols, and the extension arranges their upload:
 * on Android the Crashlytics Gradle plugin, with native symbol upload on for release builds; on
 * iOS a `dwarf-with-dsym` build setting and a run-script phase that uploads the dSYM. The
 * run-script phase has to run after the app is built; see ${page.guides_crashlytics} for the
 * Xcode step that makes sure it does.
 *
 * ### Consent
 *
 * Crash reports are personal data. A game that asks before collecting ships with the
 * `disableDataCollection` option on (see ${page.extension_options}), which stores crashes on the
 * device without sending them, and then either turns automatic reporting on for good with
 * ${function.firebase_crashlytics_set_collection_enabled} once the player agrees, or asks each
 * time with ${function.firebase_crashlytics_check_for_unsent_reports},
 * ${function.firebase_crashlytics_send_unsent_reports} and
 * ${function.firebase_crashlytics_delete_unsent_reports}.
 *
 * ### Console setup
 *
 * Open **Crashlytics** under **Run** in the console, enable it for the app and, on the screen that
 * waits for a first crash, produce one with ${function.firebase_crashlytics_test_crash} from a
 * build running on a device without the debugger; the report arrives when the game is started
 * again. From then on issues appear as they are uploaded.
 *
 * @section_func Collection
 * @desc Turning automatic reporting on and off, and handling the reports kept while it is off:
 * @ref firebase_crashlytics_set_collection_enabled
 * @ref firebase_crashlytics_is_collection_enabled
 * @ref firebase_crashlytics_check_for_unsent_reports
 * @ref firebase_crashlytics_send_unsent_reports
 * @ref firebase_crashlytics_delete_unsent_reports
 * @section_end
 *
 * @section_func Context
 * @desc What the game attaches to its reports:
 * @ref firebase_crashlytics_log
 * @ref firebase_crashlytics_set_user_id
 * @ref firebase_crashlytics_set_custom_key_string
 * @ref firebase_crashlytics_set_custom_key_real
 * @ref firebase_crashlytics_set_custom_key_bool
 * @section_end
 *
 * @section_func Errors
 * @desc Non-fatal errors, the previous run, and the test crash:
 * @ref firebase_crashlytics_record_error
 * @ref firebase_crashlytics_did_crash_on_previous_execution
 * @ref firebase_crashlytics_test_crash
 * @section_end
 *
 * @module_end
 */
