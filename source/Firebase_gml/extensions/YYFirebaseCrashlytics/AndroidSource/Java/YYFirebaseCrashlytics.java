package com.yoyogames.YoyoPlayServices;

import android.os.Handler;
import android.os.Looper;
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

public class YYFirebaseCrashlytics {
	private static final int EVENT_OTHER_SOCIAL = 70;
	private static final String LOG_TAG = "YYFirebaseCrashlytics";
	private static final String CRASHLYTICS_PREFS = "YYFirebaseCrashlyticsPrefs";

	private final FirebaseCrashlytics crashlytics;
	private Boolean isAutoDataCollectionEnabled = false;

	public YYFirebaseCrashlytics() {
		// Initialize the cached instance
		crashlytics = FirebaseCrashlytics.getInstance();
	}

	public void FirebaseCrashlytics_Initialize() {
		// Obtain the application context
        Context appContext = RunnerActivity.CurrentActivity.getApplicationContext();

        // Access SharedPreferences directly
        SharedPreferences prefs = appContext.getSharedPreferences(CRASHLYTICS_PREFS, Context.MODE_PRIVATE);

		if (prefs.contains("CrashlyticsCollectionEnabled")) {
			// Retrieve the value
			isAutoDataCollectionEnabled = prefs.getBoolean("CrashlyticsCollectionEnabled", true); // Default to true
		}
		else {
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
    }

	public void FirebaseCrashlytics_SetUserIdentifier(String user_id) {
		crashlytics.setUserId(user_id);
	}

	public void FirebaseCrashlytics_SetCustomKey(String key, String value) {
		crashlytics.setCustomKey(key, value);
	}

	public void FirebaseCrashlytics_SetCustomKey(String key, double value) {
		crashlytics.setCustomKey(key, value);
	}

	public void FirebaseCrashlytics_SetCustomKeys(String json_str) {
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
					Log.w(LOG_TAG, "Unsupported value type for key: " + key);
				}
			}
		} catch (JSONException e) {
			Log.e(LOG_TAG, "Failed to parse JSON for custom keys", e);
		}
	}

	public void FirebaseCrashlytics_Log(String message) {
		crashlytics.log(message);
	}

	public void FirebaseCrashlytics_Crash(final String message) {
		Handler mainHandler = new Handler(Looper.getMainLooper());
		mainHandler.post(() -> {
            throw new RuntimeException(message);
        });
	}

	public void FirebaseCrashlytics_RecordException(String message) {
		Exception exception = new Exception(message);
		crashlytics.recordException(exception);
	}

	public void FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set(double bool) {
		isAutoDataCollectionEnabled = bool >= 0.5;

		// Obtain the application context
		Context appContext = RunnerActivity.CurrentActivity.getApplicationContext();

		// Access SharedPreferences directly
		SharedPreferences prefs = appContext.getSharedPreferences(CRASHLYTICS_PREFS, Context.MODE_PRIVATE);

		// Save the new preference
		SharedPreferences.Editor editor = prefs.edit();
		editor.putBoolean("CrashlyticsCollectionEnabled", isAutoDataCollectionEnabled);
		boolean success = editor.commit(); // Returns true if the save was successful

		Log.i(LOG_TAG, "Saved CrashlyticsCollectionEnabled: " + isAutoDataCollectionEnabled + ", success: " + success);

		crashlytics.setCrashlyticsCollectionEnabled(isAutoDataCollectionEnabled);
	}

	public double FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check() {
		return isAutoDataCollectionEnabled ? 1.0 : 0.0;
	}

	public double FirebaseCrashlytics_DidCrashOnPreviousExecution() {
		return crashlytics.didCrashOnPreviousExecution() ? 1.0 : 0.0;
	}

	public void FirebaseCrashlytics_UnsentReports_Delete() {
		crashlytics.deleteUnsentReports();
	}

	public void FirebaseCrashlytics_UnsentReports_Send() {
		crashlytics.sendUnsentReports();
	}

	public void FirebaseCrashlytics_UnsentReports_Check() {
		crashlytics.checkForUnsentReports().addOnCompleteListener(task -> {
            int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
            RunnerJNILib.DsMapAddString(dsMapIndex, "type", "FirebaseCrashlytics_UnsentReports_Check");

            if (task.isSuccessful() && task.getResult() != null && task.getResult()) {
                RunnerJNILib.DsMapAddDouble(dsMapIndex, "value", 1);
            } else {
                RunnerJNILib.DsMapAddDouble(dsMapIndex, "value", 0);
            }
            RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
        });
	}
}
