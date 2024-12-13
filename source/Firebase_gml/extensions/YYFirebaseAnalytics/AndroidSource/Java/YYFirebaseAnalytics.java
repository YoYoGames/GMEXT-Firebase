package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import ${YYAndroidPackageName}.FirebaseUtils;

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
import java.util.regex.Pattern;

public class YYFirebaseAnalytics extends RunnerSocial {

    private static final String LOG_TAG = "YYFirebaseAnalytics";

    // Error Codes
    public static final double FIREBASE_ANALYTICS_SUCCESS = 0.0;
    public static final double FIREBASE_ANALYTICS_ERROR_INVALID_PARAMETERS = -1.0;
    
    private FirebaseAnalytics analytics;

    public YYFirebaseAnalytics() {
        // Initialize FirebaseAnalytics with application context to avoid memory leaks
        Context context = RunnerActivity.CurrentActivity.getApplicationContext();
        if (context != null) {
            analytics = FirebaseAnalytics.getInstance(context);
        } else {
            Log.e(LOG_TAG, "Context is null, cannot initialize FirebaseAnalytics");
        }
    }

    // <editor-fold desc="General API">

    public double FirebaseAnalytics_SetAnalyticsCollectionEnabled(double enabled) {
        analytics.setAnalyticsCollectionEnabled(enabled >= 0.5);
        return FIREBASE_ANALYTICS_SUCCESS;
    }

    public double FirebaseAnalytics_LogEvent(String event, String jsonValues) {
        if (!isValidEventName(event)) {
            return FIREBASE_ANALYTICS_ERROR_INVALID_PARAMETERS;
        }

        final String methodName = "FirebaseAnalytics_LogEvent";
        FirebaseUtils.getInstance().submitAsyncTask(() -> {
            Map<String, Object> data = new HashMap<>();
            try {
                Bundle params = parseJsonStringToBundle(jsonValues, methodName);
                analytics.logEvent(event, params);
                data.put("success", 1.0);
            } catch (Exception e) {  // Catch all exceptions in a single block
                data.put("error", e.toString());
                data.put("success", 0.0);
            }
            FirebaseUtils.sendSocialAsyncEvent(methodName, data);
        });
        return FIREBASE_ANALYTICS_SUCCESS;
    }

    public double FirebaseAnalytics_ResetAnalyticsData() {
        analytics.resetAnalyticsData();
        return FIREBASE_ANALYTICS_SUCCESS;
    }

    public double FirebaseAnalytics_SetDefaultEventParameters(String jsonValues) {
        final String methodName = "FirebaseAnalytics_SetDefaultEventParameters";
        FirebaseUtils.getInstance().submitAsyncTask(() -> {
            Map<String, Object> data = new HashMap<>();
            
            try {
                Bundle params = isStringNullOrEmpty(jsonValues) ? null : parseJsonStringToBundle(jsonValues, methodName);
                analytics.setDefaultEventParameters(params);
                data.put("success", 1.0);
            } catch (Exception e) {
                data.put("error", e.toString());
                data.put("success", 0.0);
            }
            
            FirebaseUtils.sendSocialAsyncEvent(methodName, data);
        });
        return FIREBASE_ANALYTICS_SUCCESS;
    }

    public double FirebaseAnalytics_SetSessionTimeoutDuration(double time) {
        analytics.setSessionTimeoutDuration((long) time);
        return FIREBASE_ANALYTICS_SUCCESS;
    }

    public double FirebaseAnalytics_SetUserId(String userID) {
        if (isStringNullOrEmpty(userID)) {
            Log.w(LOG_TAG, "FirebaseAnalytics_SetUserId :: userID is null, clearing user ID");
            userID = null;
        }

        analytics.setUserId(userID);
        return FIREBASE_ANALYTICS_SUCCESS;
    }

    public double FirebaseAnalytics_SetUserProperty(String name, String value) {
        if (!isValidPropertyName(name)) {
            return FIREBASE_ANALYTICS_ERROR_INVALID_PARAMETERS;
        }

        if (isStringNullOrEmpty(value)) {
            Log.w(LOG_TAG, "FirebaseAnalytics_SetUserProperty :: property value is empty, clearing property");
            value = null;
        }

        analytics.setUserProperty(name, value);
        return FIREBASE_ANALYTICS_SUCCESS;
    }

    public double FirebaseAnalytics_SetConsent(double adsConsent, double analyticsConsent) {
        Map<FirebaseAnalytics.ConsentType, FirebaseAnalytics.ConsentStatus> consentMap = new HashMap<>();

        consentMap.put(FirebaseAnalytics.ConsentType.AD_STORAGE,
                adsConsent >= 0.5 ? FirebaseAnalytics.ConsentStatus.GRANTED : FirebaseAnalytics.ConsentStatus.DENIED);

        consentMap.put(FirebaseAnalytics.ConsentType.ANALYTICS_STORAGE,
                analyticsConsent >= 0.5 ? FirebaseAnalytics.ConsentStatus.GRANTED : FirebaseAnalytics.ConsentStatus.DENIED);

        analytics.setConsent(consentMap);
        return FIREBASE_ANALYTICS_SUCCESS;
    }

    // </editor-fold>

    // <editor-fold desc="Helper Methods">

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
            Log.w(LOG_TAG, methodName + " :: JSON string is null or empty");
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
                Log.w(LOG_TAG, methodName + " :: Unsupported type inside array: " + value.getClass().getSimpleName());
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
            Log.w(LOG_TAG, methodName + " :: Unsupported type " + value.getClass().getSimpleName() + " for key: " + key);
            bundle.putString(key, value.toString());
        }
    }

    // </editor-fold>
}
