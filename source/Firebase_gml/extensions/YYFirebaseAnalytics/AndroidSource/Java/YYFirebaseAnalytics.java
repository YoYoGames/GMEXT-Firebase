package com.yoyogames.YoyoPlayServices;

import android.content.Context;
import android.os.Bundle;
import android.util.Log;

import com.google.firebase.analytics.FirebaseAnalytics;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Iterator;
import java.util.Map;
import java.util.HashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class YYFirebaseAnalytics extends RunnerSocial {
    private static final String TAG = "YYFirebaseAnalytics";
    private final ExecutorService executorService = Executors.newSingleThreadExecutor();
    private FirebaseAnalytics analytics;

    public YYFirebaseAnalytics() {
        // Initialize FirebaseAnalytics with application context to avoid memory leaks
        Context context = RunnerActivity.CurrentActivity.getApplicationContext();
        if (context != null) {
            analytics = FirebaseAnalytics.getInstance(context);
        } else {
            Log.e(TAG, "Context is null, cannot initialize FirebaseAnalytics");
        }
    }

    // <editor-fold desc="General API">

    public void FirebaseAnalytics_SetAnalyticsCollectionEnabled(double enabled) {
        analytics.setAnalyticsCollectionEnabled(enabled >= 0.5);
        Log.d(TAG, "SetAnalyticsCollectionEnabled: " + (enabled >= 0.5));
    }

    public void FirebaseAnalytics_LogEvent(String event, String jsonValues) {
        final String methodName = "FirebaseAnalytics_LogEvent";
        executorService.submit(() -> {
            try {
                Bundle params = parseJsonStringToBundle(jsonValues, methodName);
                analytics.logEvent(event, params);
                Log.d(TAG, methodName + " :: Event logged: " + event);
            } catch (JSONException e) {
                Log.e(TAG, methodName + " :: JSON parsing error", e);
            } catch (Exception e) {
                Log.e(TAG, methodName + " :: Exception", e);
            }
        });
    }

    public void FirebaseAnalytics_ResetAnalyticsData() {
        analytics.resetAnalyticsData();
        Log.d(TAG, "ResetAnalyticsData called");
    }

    public void FirebaseAnalytics_SetDefaultEventParameters(String jsonValues) {
        final String methodName = "FirebaseAnalytics_SetDefaultEventParameters";
        executorService.submit(() -> {
            try {
                Bundle params = parseJsonStringToBundle(jsonValues, methodName);
                analytics.setDefaultEventParameters(params);
                Log.d(TAG, methodName + " :: Default event parameters set");
            } catch (JSONException e) {
                Log.e(TAG, methodName + " :: JSON parsing error", e);
            } catch (Exception e) {
                Log.e(TAG, methodName + " :: Exception", e);
            }
        });
    }

    public void FirebaseAnalytics_SetSessionTimeoutDuration(double time) {
        analytics.setSessionTimeoutDuration((long) time);
        Log.d(TAG, "SetSessionTimeoutDuration: " + (long) time);
    }

    public void FirebaseAnalytics_SetUserId(String userID) {
        if (userID != null) {
            analytics.setUserId(userID);
            Log.d(TAG, "SetUserId: " + userID);
        } else {
            Log.w(TAG, "FirebaseAnalytics_SetUserId :: userID is null, clearing user ID");
            analytics.setUserId(null); // Clear the user ID
        }
    }

    public void FirebaseAnalytics_SetUserProperty(String name, String value) {
        analytics.setUserProperty(name, value);
        Log.d(TAG, "SetUserProperty: " + name + " = " + value);
    }

    public void FirebaseAnalytics_SetConsent(double adsConsent, double analyticsConsent) {
        try {
            Map<FirebaseAnalytics.ConsentType, FirebaseAnalytics.ConsentStatus> consentMap = new HashMap<>();

            consentMap.put(FirebaseAnalytics.ConsentType.AD_STORAGE,
                    adsConsent >= 0.5 ? FirebaseAnalytics.ConsentStatus.GRANTED : FirebaseAnalytics.ConsentStatus.DENIED);

            consentMap.put(FirebaseAnalytics.ConsentType.ANALYTICS_STORAGE,
                    analyticsConsent >= 0.5 ? FirebaseAnalytics.ConsentStatus.GRANTED : FirebaseAnalytics.ConsentStatus.DENIED);

            analytics.setConsent(consentMap);
            Log.d(TAG, "SetConsent: AdsConsent=" + (adsConsent >= 0.5) + ", AnalyticsConsent=" + (analyticsConsent >= 0.5));
        } catch (Exception e) {
            Log.e(TAG, "FirebaseAnalytics_SetConsent :: Exception", e);
        }
    }

    // </editor-fold>

    // <editor-fold desc="Application Lifecycle">

    @Override
    public void onDestroy() {
        super.onDestroy();
        shutdownExecutor();
    }

    // </editor-fold>

    // <editor-fold desc="Helper Methods">

    /**
     * Parses a JSON string to a Bundle for Firebase Analytics.
     *
     * @param jsonString The JSON string to parse.
     * @param methodName The method name for logging purposes.
     * @return A Bundle containing the parsed data.
     * @throws JSONException If parsing fails.
     */
    private Bundle parseJsonStringToBundle(String jsonString, final String methodName) throws JSONException {
        if (jsonString == null || jsonString.isEmpty()) {
            Log.w(TAG, methodName + " :: JSON string is null or empty");
            return null;
        }

        JSONObject jsonObject = new JSONObject(jsonString);
        return parseJsonObjectToBundle(jsonObject, methodName);
    }

    private Bundle parseJsonObjectToBundle(JSONObject jsonObject, final String methodName) throws JSONException {
        Bundle bundle = new Bundle();

        Iterator<String> keys = jsonObject.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            Object value = jsonObject.get(key);

            if (value instanceof JSONArray) {
                JSONArray array = (JSONArray) value;
                Bundle[] bundleArray = parseJsonArrayToBundleArray(array, methodName);
                bundle.putParcelableArray(key, bundleArray);
            } else if (value instanceof JSONObject) {
                Bundle nestedBundle = parseJsonObjectToBundle((JSONObject) value, methodName);
                bundle.putBundle(key, nestedBundle);
            } else {
                // Handle primitive types
                putPrimitiveInBundle(bundle, key, value, methodName);
            }
        }

        return bundle;
    }

    private Bundle[] parseJsonArrayToBundleArray(JSONArray jsonArray, final String methodName) throws JSONException {
        int length = jsonArray.length();
        Bundle[] bundleArray = new Bundle[length];

        for (int i = 0; i < length; i++) {
            Object value = jsonArray.get(i);

            if (value instanceof JSONObject) {
                // Recursively convert JSONObject to Bundle
                bundleArray[i] = parseJsonObjectToBundle((JSONObject) value, methodName);
            } else {
                Log.w(TAG, methodName + " :: Unsupported type inside array: " + value.getClass().getSimpleName());
                // Create a Bundle with a single key "value"
                Bundle tempBundle = new Bundle();
                putPrimitiveInBundle(tempBundle, "value", value, methodName);
                bundleArray[i] = tempBundle;
            }
        }

        return bundleArray;
    }

    private void putPrimitiveInBundle(Bundle bundle, String key, Object value, final String methodName) {
        if (value instanceof String) {
            bundle.putString(key, (String) value);
        } else if (value instanceof Integer) {
            bundle.putInt(key, (Integer) value);
        } else if (value instanceof Long) {
            bundle.putLong(key, (Long) value);
        } else if (value instanceof Double) {
            bundle.putDouble(key, (Double) value);
        } else if (value instanceof Float) {
            bundle.putFloat(key, (Float) value);
        } else if (value instanceof Boolean) {
            bundle.putBoolean(key, (Boolean) value);
        } else {
            Log.w(TAG, methodName + " :: Unsupported type " + value.getClass().getSimpleName() + " for key: " + key);
            bundle.putString(key, value.toString());
        }
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
