package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import ${YYAndroidPackageName}.FirebaseUtils;

import android.util.Log;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;

import com.google.firebase.crashlytics.FirebaseCrashlytics;
import com.google.firebase.crashlytics.CustomKeysAndValues;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.Iterator;
import java.util.Map;
import java.util.HashMap;

public class YYFirebaseCrashlytics extends RunnerSocial {

    private static final String LOG_TAG = "YYFirebaseCrashlytics";
    private static final String CRASHLYTICS_PREFS = "YYFirebaseCrashlyticsPrefs";

    // Error Codes
    public static final double FIREBASE_CRASHLYTICS_SUCCESS = 0.0;
    public static final double FIREBASE_CRASHLYTICS_ERROR_INVALID_PARAMETERS = -1.0;

    private FirebaseCrashlytics crashlytics;
    private Boolean isAutoDataCollectionEnabled = false;

    public YYFirebaseCrashlytics() {
        // Initialize the cached instance
        crashlytics = FirebaseCrashlytics.getInstance();

        FirebaseUtils.getInstance().submitAsyncTask(() -> {
            // Obtain the application context
            Context appContext = RunnerActivity.CurrentActivity.getApplicationContext();

            // Access SharedPreferences directly
            SharedPreferences prefs = appContext.getSharedPreferences(CRASHLYTICS_PREFS, Context.MODE_PRIVATE);

            if (prefs.contains("CrashlyticsCollectionEnabled")) {
                // Retrieve the value
                isAutoDataCollectionEnabled = prefs.getBoolean("CrashlyticsCollectionEnabled", true); // Default to true
            } else {
                try {
                    ApplicationInfo ai = appContext.getPackageManager().getApplicationInfo(appContext.getPackageName(), PackageManager.GET_META_DATA);
                    Bundle bundle = ai.metaData;
                    isAutoDataCollectionEnabled = bundle.getBoolean("firebase_crashlytics_collection_enabled", true); // Default to true
                } catch (PackageManager.NameNotFoundException e) {
                    Log.e(LOG_TAG, "Failed to load meta-data, NameNotFound: " + e.getMessage());
                } catch (NullPointerException e) {
                    Log.e(LOG_TAG, "Failed to load meta-data, NullPointer: " + e.getMessage());
                }
            }
        });
    }

    // <editor-fold desc="User Identification and Custom Keys">

    public double FirebaseCrashlytics_SetUserIdentifier(final String userId) {
        crashlytics.setUserId(userId);
        return FIREBASE_CRASHLYTICS_SUCCESS;
    }

    public double FirebaseCrashlytics_SetCustomKey(final String key, final String value) {
        crashlytics.setCustomKey(key, value);
        return FIREBASE_CRASHLYTICS_SUCCESS;
    }

    public double FirebaseCrashlytics_SetCustomKeys(final String jsonString) {

        if (isStringNullOrEmpty(jsonString)) {
            return FIREBASE_CRASHLYTICS_ERROR_INVALID_PARAMETERS;
        }

        final String methodName = "FirebaseCrashlytics_SetCustomKeys";

        FirebaseUtils.getInstance().submitAsyncTask(() -> {
            Map<String, Object> data = new HashMap<>();
            try {
                // Create a new builder instance for batch setting custom keys
                CustomKeysAndValues.Builder builder = new CustomKeysAndValues.Builder();
    
                // Parse the JSON string and iterate over the keys
                JSONObject jsonObject = new JSONObject(jsonString);
                Iterator<String> keys = jsonObject.keys();
                
                while (keys.hasNext()) {
                    String key = keys.next();
                    Object value = jsonObject.get(key);
    
                    // Add values to the builder based on their type
                    if (value instanceof String) {
                        builder.putString(key, (String) value);
                    } else if (value instanceof Integer) {
                        builder.putInt(key, (Integer) value);
                    } else if (value instanceof Long) {
                        builder.putLong(key, (Long) value);
                    } else if (value instanceof Double) {
                        builder.putDouble(key, (Double) value);
                    } else if (value instanceof Boolean) {
                        builder.putBoolean(key, (Boolean) value);
                    } else {
                        Log.w(LOG_TAG, methodName + " :: Unsupported value type for key: " + key);
                    }
                }
    
                // Use the builder to set the custom keys in a single call
                crashlytics.setCustomKeys(builder.build());
                data.put("success", 1.0);
    
            } catch (Exception e) {
                data.put("success", 0.0);
                data.put("error", e.toString());
            }
    
            // Send asynchronous event to indicate completion
            FirebaseUtils.sendSocialAsyncEvent(methodName, data);
        });

        return FIREBASE_CRASHLYTICS_SUCCESS;
    }

    // </editor-fold>

    // <editor-fold desc="Logging and Exception Handling">

    public double FirebaseCrashlytics_Log(final String message) {
        crashlytics.log(message);
        return FIREBASE_CRASHLYTICS_SUCCESS;
    }

    public void FirebaseCrashlytics_Crash(final String message) {
        RunnerActivity.CurrentActivity.runOnUiThread(() -> {
            throw new RuntimeException("FirebaseCrashlytics_Crash :: " + message);
        });
    }

    public double FirebaseCrashlytics_RecordException(final String message) {
        Exception exception = new Exception("FirebaseCrashlytics_RecordException :: " + message);
        crashlytics.recordException(exception);
        return FIREBASE_CRASHLYTICS_SUCCESS;
    }

    // </editor-fold>

    // <editor-fold desc="Crashlytics Collection">

    public double FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set(final double bool) {
        isAutoDataCollectionEnabled = bool >= 0.5;
        crashlytics.setCrashlyticsCollectionEnabled(isAutoDataCollectionEnabled);

        FirebaseUtils.getInstance().submitAsyncTask(() -> {
            // Obtain the application context
            Context appContext = RunnerActivity.CurrentActivity.getApplicationContext();

            // Access SharedPreferences directly
            SharedPreferences prefs = appContext.getSharedPreferences(CRASHLYTICS_PREFS, Context.MODE_PRIVATE);

            // Save the new preference
            SharedPreferences.Editor editor = prefs.edit();
            editor.putBoolean("CrashlyticsCollectionEnabled", isAutoDataCollectionEnabled);
            boolean success = editor.commit(); // Returns true if the save was successful
        });
        
        return FIREBASE_CRASHLYTICS_SUCCESS;
    }

    public double FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check() {
        return isAutoDataCollectionEnabled ? 1.0 : 0.0;
    }

    public double FirebaseCrashlytics_DidCrashOnPreviousExecution() {
        boolean didCrash = crashlytics.didCrashOnPreviousExecution();
        return didCrash ? 1.0 : 0.0;
    }

    // </editor-fold>

    // <editor-fold desc="Unsent Reports Management">

    public double FirebaseCrashlytics_UnsentReports_Delete() {
        FirebaseUtils.getInstance().submitAsyncTask(() -> {
            crashlytics.deleteUnsentReports();
        });
        return FIREBASE_CRASHLYTICS_SUCCESS;
    }

    public double FirebaseCrashlytics_UnsentReports_Send() {
        FirebaseUtils.getInstance().submitAsyncTask(() -> {
            crashlytics.sendUnsentReports();
        });
        return FIREBASE_CRASHLYTICS_SUCCESS;
    }

    public double FirebaseCrashlytics_UnsentReports_Check() {
        crashlytics.checkForUnsentReports().addOnCompleteListener(task -> {
            Map<String, Object> data = new HashMap<>();
            if (task.isSuccessful() && task.getResult() != null) {
                data.put("value", 1.0);
            } else {
                data.put("value", 0.0);
            }
            FirebaseUtils.sendSocialAsyncEvent("FirebaseCrashlytics_UnsentReports_Check", data);
        });
        return FIREBASE_CRASHLYTICS_SUCCESS;
    }

    // </editor-fold>

    // <editor-fold desc="Helper Methods">

    private boolean isStringNullOrEmpty(String string) {
        return string == null || string.isEmpty();
    }

    // </editor-fold>

}
