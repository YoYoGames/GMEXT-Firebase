
package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.GMExtWire.GMFunction;

import android.util.Log;

import com.google.firebase.crashlytics.CustomKeysAndValues;
import com.google.firebase.crashlytics.FirebaseCrashlytics;

import java.lang.String;
import java.nio.ByteBuffer;

public final class GMFirebaseCrashlytics extends GMFirebaseCrashlyticsInternal
{
    private static final String TAG = "GMFirebaseCrashlytics";

    private static final String DEFAULT_ERROR_DOMAIN = "GMFirebaseCrashlytics";

    private static final String NOT_INITIALIZED =
        "Firebase default app not initialized; is GMFirebase in the project?";

    private static volatile boolean loggedNotInitialized = false;

    // Null when there is no default FirebaseApp (no google-services.json, so
    // no FirebaseInitProvider resources): void functions no-op, getters return
    // false, the callback function fails synchronously. Mirrors the iOS helper.
    private FirebaseCrashlytics crashlytics()
    {
        try
        {
            return FirebaseCrashlytics.getInstance();
        }
        catch (RuntimeException error)
        {
            if (!loggedNotInitialized)
            {
                loggedNotInitialized = true;
                Log.e(TAG, NOT_INITIALIZED, error);
            }
            return null;
        }
    }

    public void firebase_crashlytics_set_collection_enabled(boolean enabled)
    {
        FirebaseCrashlytics instance = crashlytics();
        if (instance == null)
            return;

        instance.setCrashlyticsCollectionEnabled(enabled);
    }

    public boolean firebase_crashlytics_is_collection_enabled()
    {
        FirebaseCrashlytics instance = crashlytics();
        if (instance == null)
            return false;

        return instance.isCrashlyticsCollectionEnabled();
    }

    public boolean firebase_crashlytics_did_crash_on_previous_execution()
    {
        FirebaseCrashlytics instance = crashlytics();
        if (instance == null)
            return false;

        return instance.didCrashOnPreviousExecution();
    }

    public void firebase_crashlytics_log(String message)
    {
        FirebaseCrashlytics instance = crashlytics();
        if (instance == null)
            return;

        instance.log(message != null ? message : "");
    }

    public void firebase_crashlytics_set_user_id(String user_id)
    {
        FirebaseCrashlytics instance = crashlytics();
        if (instance == null)
            return;

        instance.setUserId(user_id != null ? user_id : "");
    }

    public void firebase_crashlytics_set_custom_key_string(String key, String value)
    {
        FirebaseCrashlytics instance = crashlytics();
        if (instance == null)
            return;

        instance.setCustomKey(
            key != null ? key : "",
            value != null ? value : ""
        );
    }

    public void firebase_crashlytics_set_custom_key_real(String key, double value)
    {
        FirebaseCrashlytics instance = crashlytics();
        if (instance == null)
            return;

        instance.setCustomKey(key != null ? key : "", value);
    }

    public void firebase_crashlytics_set_custom_key_bool(String key, boolean value)
    {
        FirebaseCrashlytics instance = crashlytics();
        if (instance == null)
            return;

        instance.setCustomKey(key != null ? key : "", value);
    }

    public void firebase_crashlytics_record_error(
        String domain,
        int code,
        String message)
    {
        FirebaseCrashlytics instance = crashlytics();
        if (instance == null)
            return;

        String safeDomain =
            domain != null && !domain.isEmpty() ? domain : DEFAULT_ERROR_DOMAIN;
        String safeMessage = message != null ? message : "";

        CustomKeysAndValues keys = new CustomKeysAndValues.Builder()
            .putString("gm_error_domain", safeDomain)
            .putString("gm_error_code", Integer.toString(code))
            .build();

        instance.recordException(
            new RecordedError(safeDomain, code, safeMessage),
            keys
        );
    }

    public void firebase_crashlytics_check_for_unsent_reports(
        final GMFunction callback)
    {
        FirebaseCrashlytics instance = crashlytics();
        if (instance == null)
        {
            callback.call(false, false, NOT_INITIALIZED);
            callback.release();
            return;
        }

        try
        {
            instance.checkForUnsentReports().addOnCompleteListener(task ->
            {
                final boolean success = task.isSuccessful();
                final boolean hasUnsent =
                    success && Boolean.TRUE.equals(task.getResult());
                final String error =
                    success ? "" : errorMessage(task.getException());

                // The bridge queue is safe from any thread, and this listener
                // already runs on the main thread.
                callback.call(success, hasUnsent, error);
                callback.release();
            });
        }
        catch (RuntimeException error)
        {
            callback.call(false, false, errorMessage(error));
            callback.release();
        }
    }

    public void firebase_crashlytics_send_unsent_reports()
    {
        FirebaseCrashlytics instance = crashlytics();
        if (instance == null)
            return;

        instance.sendUnsentReports();
    }

    public void firebase_crashlytics_delete_unsent_reports()
    {
        FirebaseCrashlytics instance = crashlytics();
        if (instance == null)
            return;

        instance.deleteUnsentReports();
    }

    public void firebase_crashlytics_test_crash()
    {
        if (RunnerActivity.CurrentActivity != null)
        {
            RunnerActivity.CurrentActivity.runOnUiThread(() ->
            {
                throw new RuntimeException(
                    "GMFirebase Crashlytics test crash"
                );
            });
            return;
        }

        throw new RuntimeException(
            "GMFirebase Crashlytics test crash"
        );
    }

    private static String errorMessage(Throwable error)
    {
        if (error == null)
            return "Unknown Crashlytics error.";

        String message = error.getMessage();
        return message != null ? message : error.toString();
    }

    // Crashlytics groups non-fatals by exception type and top frame, so one
    // RuntimeException thrown from record_error made every GML error a single
    // issue. A synthetic frame per domain and code groups them the way the
    // iOS NSError does.
    private static final class RecordedError extends Exception
    {
        RecordedError(String domain, int code, String message)
        {
            super(message);
            setStackTrace(new StackTraceElement[]
            {
                new StackTraceElement(domain, "code_" + code, null, -1)
            });
        }
    }
}
