package com.yoyogames.YoyoPlayServices;

import android.util.Log;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;

import com.google.firebase.crashlytics.FirebaseCrashlytics;

import com.yoyogames.runner.RunnerJNILib;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.Iterator;
import java.util.Map;
import java.util.HashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class YYFirebaseCrashlytics extends RunnerSocial {
    private static final int EVENT_OTHER_SOCIAL = 70;
    private static final String TAG = "YYFirebaseCrashlytics";
    private static final String CRASHLYTICS_PREFS = "YYFirebaseCrashlyticsPrefs";

    private final FirebaseCrashlytics crashlytics;
    private Boolean isAutoDataCollectionEnabled = false;
    private final ExecutorService executorService = Executors.newSingleThreadExecutor();

    public YYFirebaseCrashlytics() {
        // Initialize the cached instance
        crashlytics = FirebaseCrashlytics.getInstance();
    }

    // <editor-fold desc="Initialization">

    public void FirebaseCrashlytics_Initialize() {
        // Obtain the application context
        Context appContext = RunnerActivity.CurrentActivity.getApplicationContext();

        // Access SharedPreferences directly
        SharedPreferences prefs = appContext.getSharedPreferences(CRASHLYTICS_PREFS, Context.MODE_PRIVATE);

        if (prefs.contains("CrashlyticsCollectionEnabled")) {
            // Retrieve the value
            isAutoDataCollectionEnabled = prefs.getBoolean("CrashlyticsCollectionEnabled", true); // Default to true
            Log.d(TAG, "FirebaseCrashlytics_Initialize: Retrieved CrashlyticsCollectionEnabled from SharedPreferences: " + isAutoDataCollectionEnabled);
        } else {
            try {
                ApplicationInfo ai = appContext.getPackageManager().getApplicationInfo(appContext.getPackageName(), PackageManager.GET_META_DATA);
                Bundle bundle = ai.metaData;
                isAutoDataCollectionEnabled = bundle.getBoolean("firebase_crashlytics_collection_enabled", true); // Default to true
                Log.d(TAG, "FirebaseCrashlytics_Initialize: Retrieved CrashlyticsCollectionEnabled from meta-data: " + isAutoDataCollectionEnabled);
            } catch (PackageManager.NameNotFoundException e) {
                Log.e(TAG, "Failed to load meta-data, NameNotFound: " + e.getMessage());
            } catch (NullPointerException e) {
                Log.e(TAG, "Failed to load meta-data, NullPointer: " + e.getMessage());
            }
        }
    }

    // </editor-fold>

    // <editor-fold desc="User Identification and Custom Keys">

    public void FirebaseCrashlytics_SetUserIdentifier(final String user_id) {
        executorService.submit(() -> {
            crashlytics.setUserId(user_id);
            Log.d(TAG, "FirebaseCrashlytics_SetUserIdentifier: " + user_id);
        });
    }

    public void FirebaseCrashlytics_SetCustomKey(final String key, final String value) {
        executorService.submit(() -> {
            crashlytics.setCustomKey(key, value);
            Log.d(TAG, "FirebaseCrashlytics_SetCustomKey: " + key + " = " + value);
        });
    }

    public void FirebaseCrashlytics_SetCustomKey(final String key, final double value) {
        executorService.submit(() -> {
            crashlytics.setCustomKey(key, value);
            Log.d(TAG, "FirebaseCrashlytics_SetCustomKey: " + key + " = " + value);
        });
    }

    public void FirebaseCrashlytics_SetCustomKeys(final String json_str) {
        final String methodName = "FirebaseCrashlytics_SetCustomKeys";
        executorService.submit(() -> {
            try {
                JSONObject jsonObject = new JSONObject(json_str);
                Iterator<String> keys = jsonObject.keys();
                while (keys.hasNext()) {
                    String key = keys.next();
                    Object value = jsonObject.get(key);
                    if (value instanceof String) {
                        crashlytics.setCustomKey(key, (String) value);
                    } else if (value instanceof Integer) {
                        crashlytics.setCustomKey(key, (Integer) value);
                    } else if (value instanceof Long) {
                        crashlytics.setCustomKey(key, (Long) value);
                    } else if (value instanceof Double) {
                        crashlytics.setCustomKey(key, (Double) value);
                    } else if (value instanceof Boolean) {
                        crashlytics.setCustomKey(key, (Boolean) value);
                    } else {
                        Log.w(TAG, methodName + " :: Unsupported value type for key: " + key);
                    }
                }
                Log.d(TAG, methodName + ": Custom keys set from JSON.");
            } catch (JSONException e) {
                Log.e(TAG, methodName + " :: Failed to parse JSON for custom keys", e);
            } catch (Exception e) {
                Log.e(TAG, methodName + " :: Exception", e);
            }
        });
    }

    // </editor-fold>

    // <editor-fold desc="Logging and Exception Handling">

    public void FirebaseCrashlytics_Log(final String message) {
        executorService.submit(() -> {
            crashlytics.log(message);
            Log.d(TAG, "FirebaseCrashlytics_Log: " + message);
        });
    }

    public void FirebaseCrashlytics_Crash(final String message) {
        RunnerActivity.CurrentActivity.runOnUiThread(() -> {
            Log.d(TAG, "FirebaseCrashlytics_Crash: Throwing exception with message: " + message);
            throw new RuntimeException(message);
        });
    }

    public void FirebaseCrashlytics_RecordException(final String message) {
        executorService.submit(() -> {
            Exception exception = new Exception(message);
            crashlytics.recordException(exception);
            Log.d(TAG, "FirebaseCrashlytics_RecordException: Exception recorded with message: " + message);
        });
    }

    // </editor-fold>

    // <editor-fold desc="Crashlytics Collection">

    public void FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set(final double bool) {
        isAutoDataCollectionEnabled = bool >= 0.5;
        executorService.submit(() -> {
            // Obtain the application context
            Context appContext = RunnerActivity.CurrentActivity.getApplicationContext();

            // Access SharedPreferences directly
            SharedPreferences prefs = appContext.getSharedPreferences(CRASHLYTICS_PREFS, Context.MODE_PRIVATE);

            // Save the new preference
            SharedPreferences.Editor editor = prefs.edit();
            editor.putBoolean("CrashlyticsCollectionEnabled", isAutoDataCollectionEnabled);
            boolean success = editor.commit(); // Returns true if the save was successful

            Log.i(TAG, "Saved CrashlyticsCollectionEnabled: " + isAutoDataCollectionEnabled + ", success: " + success);

            crashlytics.setCrashlyticsCollectionEnabled(isAutoDataCollectionEnabled);
        });
    }

    public double FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check() {
        Log.d(TAG, "FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check: " + isAutoDataCollectionEnabled);
        return isAutoDataCollectionEnabled ? 1.0 : 0.0;
    }

    public double FirebaseCrashlytics_DidCrashOnPreviousExecution() {
        boolean didCrash = crashlytics.didCrashOnPreviousExecution();
        Log.d(TAG, "FirebaseCrashlytics_DidCrashOnPreviousExecution: " + didCrash);
        return didCrash ? 1.0 : 0.0;
    }

    // </editor-fold>

    // <editor-fold desc="Unsent Reports Management">

    public void FirebaseCrashlytics_UnsentReports_Delete() {
        executorService.submit(() -> {
            crashlytics.deleteUnsentReports();
            Log.d(TAG, "FirebaseCrashlytics_UnsentReports_Delete: Unsent reports deleted.");
        });
    }

    public void FirebaseCrashlytics_UnsentReports_Send() {
        executorService.submit(() -> {
            crashlytics.sendUnsentReports();
            Log.d(TAG, "FirebaseCrashlytics_UnsentReports_Send: Unsent reports sent.");
        });
    }

    public void FirebaseCrashlytics_UnsentReports_Check() {
        crashlytics.checkForUnsentReports().addOnCompleteListener(task -> {
            Map<String, Object> data = new HashMap<>();
            if (task.isSuccessful() && task.getResult() != null && task.getResult()) {
                data.put("value", 1.0);
                Log.d(TAG, "FirebaseCrashlytics_UnsentReports_Check: Unsent reports available.");
            } else {
                data.put("value", 0.0);
                Log.d(TAG, "FirebaseCrashlytics_UnsentReports_Check: No unsent reports.");
            }
            sendAsyncEvent("FirebaseCrashlytics_UnsentReports_Check", data);
        });
    }

    // </editor-fold>

    // <editor-fold desc="Activity Lifecycle">

    @Override
    public void onDestroy() {
        super.onDestroy();
        shutdownExecutor();
    }

    // </editor-fold>

    // <editor-fold desc="Helper Methods">

    private void sendAsyncEvent(String eventType, Map<String, Object> data) {
        RunnerActivity.CurrentActivity.runOnUiThread(() -> {
            int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
            RunnerJNILib.DsMapAddString(dsMapIndex, "type", eventType);
            if (data != null) {
                for (Map.Entry<String, Object> entry : data.entrySet()) {
                    String key = entry.getKey();
                    Object value = entry.getValue();
                    if (value instanceof String) {
                        RunnerJNILib.DsMapAddString(dsMapIndex, key, (String) value);
                    } else if (value instanceof Double) {
                        RunnerJNILib.DsMapAddDouble(dsMapIndex, key, (Double) value);
                    } else if (value instanceof Integer) {
                        RunnerJNILib.DsMapAddDouble(dsMapIndex, key, ((Integer) value).doubleValue());
                    } else if (value instanceof Boolean) {
                        RunnerJNILib.DsMapAddDouble(dsMapIndex, key, (Boolean) value ? 1.0 : 0.0);
                    } else if (value instanceof Long) {
                        RunnerJNILib.DsMapAddDouble(dsMapIndex, key, ((Long) value).doubleValue());
                    } else if (value instanceof Float) {
                        RunnerJNILib.DsMapAddDouble(dsMapIndex, key, ((Float) value).doubleValue());
                    } else {
                        // Convert other types to String
                        RunnerJNILib.DsMapAddString(dsMapIndex, key, value.toString());
                    }
                }
            }
            RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
        });
    }

    private void shutdownExecutor() {
        try {
            executorService.shutdown();
            Log.d(TAG, "ExecutorService shutdown initiated.");
        } catch (Exception e) {
            Log.e(TAG, "Error shutting down ExecutorService", e);
        }
    }

    // </editor-fold>

}
