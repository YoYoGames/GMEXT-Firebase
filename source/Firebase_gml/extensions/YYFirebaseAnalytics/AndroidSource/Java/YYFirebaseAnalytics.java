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
import java.util.regex.Pattern;

public class YYFirebaseAnalytics extends RunnerSocial {
    private static final int EVENT_OTHER_SOCIAL = 70;
    private static final String TAG = "YYFirebaseAnalytics";

    // Error Codes
    public static final double FIREBASE_ANALYTICS_ASYNC = 1.0;
    public static final double FIREBASE_ANALYTICS_SUCCESS = 0.0;
    public static final double FIREBASE_ANALYTICS_ERROR_INVALID_PARAMETERS = -1.0;

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
    }

    public double FirebaseAnalytics_LogEvent(String event, String jsonValues) {
        if (!isValidEventName(event)) {
            return FIREBASE_ANALYTICS_ERROR_INVALID_PARAMETERS;
        }

        final String methodName = "FirebaseAnalytics_LogEvent";
        executorService.submit(() -> {
            Map<String, Object> data = new HashMap<>();
            try {
                Bundle params = parseJsonStringToBundle(jsonValues, methodName);
                analytics.logEvent(event, params);
                data.put("success", 1.0);
            } catch (Exception e) {  // Catch all exceptions in a single block
                data.put("error", e.toString());
                data.put("success", 0.0);
            }
            sendAsyncEvent(methodName, data);
        });
        return FIREBASE_ANALYTICS_ASYNC;
    }

    public void FirebaseAnalytics_ResetAnalyticsData() {
        analytics.resetAnalyticsData();
    }

    public double FirebaseAnalytics_SetDefaultEventParameters(String jsonValues) {
        final String methodName = "FirebaseAnalytics_SetDefaultEventParameters";
        
        if (isStringNullOrEmpty(jsonValues)) {
            Log.w(TAG, methodName + " :: json is empty, clearing default parameters");
            analytics.setDefaultEventParameters(null);
            return FIREBASE_ANALYTICS_SUCCESS;
        }

        executorService.submit(() -> {
            Map<String, Object> data = new HashMap<>();
            try {
                Bundle params = parseJsonStringToBundle(jsonValues, methodName);
                analytics.setDefaultEventParameters(params);
                data.put("success", 1.0);
            } catch (Exception e) {
                data.put("error", e.toString());
                data.put("success", 0.0);
            }
            sendAsyncEvent(methodName, data);
        });
        return FIREBASE_ANALYTICS_ASYNC;
    }

    public void FirebaseAnalytics_SetSessionTimeoutDuration(double time) {
        analytics.setSessionTimeoutDuration((long) time);
    }

    public void FirebaseAnalytics_SetUserId(String userID) {
        if (isStringNullOrEmpty(userID)) {
            Log.w(TAG, "FirebaseAnalytics_SetUserId :: userID is null, clearing user ID");
            userID = null;
        }

        analytics.setUserId(userID);
    }

    public double FirebaseAnalytics_SetUserProperty(String name, String value) {
        if (!isValidPropertyName(name)) {
            return FIREBASE_ANALYTICS_ERROR_INVALID_PARAMETERS;
        }

        if (isStringNullOrEmpty(value)) {
            Log.w(TAG, "FirebaseAnalytics_SetUserProperty :: property value is empty, clearing property");
            value = null;
        }

        analytics.setUserProperty(name, value);
        return FIREBASE_ANALYTICS_SUCCESS;
    }

    public void FirebaseAnalytics_SetConsent(double adsConsent, double analyticsConsent) {
        Map<FirebaseAnalytics.ConsentType, FirebaseAnalytics.ConsentStatus> consentMap = new HashMap<>();

        consentMap.put(FirebaseAnalytics.ConsentType.AD_STORAGE,
                adsConsent >= 0.5 ? FirebaseAnalytics.ConsentStatus.GRANTED : FirebaseAnalytics.ConsentStatus.DENIED);

        consentMap.put(FirebaseAnalytics.ConsentType.ANALYTICS_STORAGE,
                analyticsConsent >= 0.5 ? FirebaseAnalytics.ConsentStatus.GRANTED : FirebaseAnalytics.ConsentStatus.DENIED);

        analytics.setConsent(consentMap);
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

    private boolean isStringNullOrEmpty(String string) {
        return string == null || string.isEmpty();
    }

    private boolean isValidEventName(String eventName) {
        if (eventName == null) {
            return false;  // Null strings are not valid
        }
        // Define the regex pattern
        String pattern = "^(?!firebase_|google_|ga_)[a-zA-Z][a-zA-Z0-9_]{0,39}$";
        return Pattern.matches(pattern, eventName);
    }

    private boolean isValidPropertyName(String propertyName) {
        if (propertyName == null) {
            return false;  // Null strings are not valid
        }
        // Define the regex pattern
        String pattern = "^(?!firebase_|google_|ga_)[a-zA-Z][a-zA-Z0-9_]{0,23}$";
        return Pattern.matches(pattern, propertyName);
    }

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
