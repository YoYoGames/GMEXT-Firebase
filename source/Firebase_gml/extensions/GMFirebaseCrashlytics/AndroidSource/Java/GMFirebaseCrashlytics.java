
package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.GMExtWire.GMFunction;

import com.google.firebase.crashlytics.CustomKeysAndValues;
import com.google.firebase.crashlytics.FirebaseCrashlytics;

import java.lang.String;
import java.nio.ByteBuffer;

public final class GMFirebaseCrashlytics extends GMFirebaseCrashlyticsInternal
{
    private FirebaseCrashlytics crashlytics()
    {
        return FirebaseCrashlytics.getInstance();
    }

    public void firebase_crashlytics_set_collection_enabled(boolean enabled)
    {
        crashlytics().setCrashlyticsCollectionEnabled(enabled);
    }

    public boolean firebase_crashlytics_is_collection_enabled()
    {
        return crashlytics().isCrashlyticsCollectionEnabled();
    }

    public boolean firebase_crashlytics_did_crash_on_previous_execution()
    {
        return crashlytics().didCrashOnPreviousExecution();
    }

    public void firebase_crashlytics_log(String message)
    {
        crashlytics().log(message != null ? message : "");
    }

    public void firebase_crashlytics_set_user_id(String user_id)
    {
        crashlytics().setUserId(user_id != null ? user_id : "");
    }

    public void firebase_crashlytics_set_custom_key_string(String key, String value)
    {
        crashlytics().setCustomKey(
            key != null ? key : "",
            value != null ? value : ""
        );
    }

    public void firebase_crashlytics_set_custom_key_real(String key, double value)
    {
        crashlytics().setCustomKey(key != null ? key : "", value);
    }

    public void firebase_crashlytics_set_custom_key_bool(String key, boolean value)
    {
        crashlytics().setCustomKey(key != null ? key : "", value);
    }

    public void firebase_crashlytics_record_error(
        String domain,
        int code,
        String message)
    {
        String safeDomain = domain != null ? domain : "";
        String safeMessage = message != null ? message : "";

        RuntimeException exception = new RuntimeException(
            safeDomain.isEmpty()
                ? safeMessage
                : safeDomain + ": " + safeMessage
        );

        CustomKeysAndValues keys = new CustomKeysAndValues.Builder()
            .putString("gm_error_domain", safeDomain)
            .putString("gm_error_code", Integer.toString(code))
            .build();

        crashlytics().recordException(exception, keys);
    }

    public void firebase_crashlytics_check_for_unsent_reports(
        final GMFunction callback)
    {
        crashlytics().checkForUnsentReports().addOnCompleteListener(task ->
        {
            final boolean success = task.isSuccessful();
            final boolean hasUnsent =
                success && Boolean.TRUE.equals(task.getResult());
            final String error =
                success ? "" : errorMessage(task.getException());

            if (RunnerActivity.CurrentActivity != null)
            {
                RunnerActivity.CurrentActivity.runOnUiThread(
                    () -> callback.call(success, hasUnsent, error)
                );
            }
            else
            {
                callback.call(success, hasUnsent, error);
            }
        });
    }

    public void firebase_crashlytics_send_unsent_reports()
    {
        crashlytics().sendUnsentReports();
    }

    public void firebase_crashlytics_delete_unsent_reports()
    {
        crashlytics().deleteUnsentReports();
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
}
