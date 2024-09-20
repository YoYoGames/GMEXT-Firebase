
package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

import android.app.Activity;
import android.os.Bundle;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.google.firebase.analytics.FirebaseAnalytics;

import java.util.Iterator;
import java.util.Map;
import java.util.Collections;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import android.util.Log;

import java.util.HashMap;

public class YYFirebaseAnalytics extends RunnerSocial
{
	private static final String LOG_TAG = "yoyo";

	private static final ExecutorService executorService = Executors.newFixedThreadPool(1);

	// Cached Variables

	public static Activity activity = RunnerActivity.CurrentActivity;
	private FirebaseAnalytics firebaseAnalytics;

	public YYFirebaseAnalytics() {
        if (activity != null) {
            firebaseAnalytics = FirebaseAnalytics.getInstance(activity);
        } else {
            Log.e(LOG_TAG, "Activity is null, cannot initialize FirebaseAnalytics");
        }
    }

	//#region General API

	public void FirebaseAnalytics_SetAnalyticsCollectionEnabled(double enabled)
	{
		firebaseAnalytics.setAnalyticsCollectionEnabled(enabled >= .5);
	}

	public void FirebaseAnalytics_LogEvent(String event,String jsonValues)
	{
		final String methodName = "FirebaseAnalytics_LogEvent";
		executorService.submit(new Runnable() {
			@Override
			public void run() {
				try {
					Bundle params = jsonStringToBundle(jsonValues, methodName);
					firebaseAnalytics.logEvent(event, params);
				} catch (Exception e) {
					Log.e(LOG_TAG, methodName + " :: Thread exception", e);
				}
			}
		});
	}
	
	public void FirebaseAnalytics_ResetAnalyticsData()
	{
		firebaseAnalytics.resetAnalyticsData();
	}

	public void FirebaseAnalytics_SetDefaultEventParameters(String jsonValues)
	{
		final String methodName = "FirebaseAnalytics_SetDefaultEventParameters";
		executorService.submit(new Runnable() {
			@Override
			public void run() {
				try {
					Bundle params = jsonStringToBundle(jsonValues, methodName);
					firebaseAnalytics.setDefaultEventParameters(params);
				} catch (Exception e) {
					Log.e(LOG_TAG, methodName + " :: Thread exception", e);
				}
			}
		});
	}
		
	public void FirebaseAnalytics_SetSessionTimeoutDuration(double time)
	{
		firebaseAnalytics.setSessionTimeoutDuration((long)time);
	}
		
	public void FirebaseAnalytics_SetUserId(String userID)
	{
		if (userID != null) {
			firebaseAnalytics.setUserId(userID);
		} else {
			Log.w(LOG_TAG, "FirebaseAnalytics_SetUserId :: userID is null");
		}
	}
		
	public void FirebaseAnalytics_SetUserProperty(String event,String value)
	{
		firebaseAnalytics.setUserProperty(event,value);
	}
	
	public void FirebaseAnalytics_SetConsent(double ads, double analytics)
	{
		try
		{
			Map<FirebaseAnalytics.ConsentType, FirebaseAnalytics.ConsentStatus> map = new HashMap<>();
			
			if(ads >= 0.5)
				map.put(FirebaseAnalytics.ConsentType.AD_STORAGE,FirebaseAnalytics.ConsentStatus.GRANTED);
			else
				map.put(FirebaseAnalytics.ConsentType.AD_STORAGE,FirebaseAnalytics.ConsentStatus.DENIED);
			
			if(analytics >= 0.5)
				map.put(FirebaseAnalytics.ConsentType.ANALYTICS_STORAGE, FirebaseAnalytics.ConsentStatus.GRANTED);
			else
				map.put(FirebaseAnalytics.ConsentType.ANALYTICS_STORAGE, FirebaseAnalytics.ConsentStatus.DENIED);
			
			firebaseAnalytics.setConsent(map);
		} 
		catch (Exception e)
		{
			Log.i(LOG_TAG,"FirebaseAnalytics_SetConsent Exception: " + e.getMessage());
		}
	}

	//#endregion

	//#region Application Life Cicle

	@Override
	public void onDestroy() {
		super.onDestroy();
		shutdownExecutor();
	}

	//#endregion

	//#region Helper Methods

	/**
	 * Converts a JSON string to a Bundle for Firebase Analytics.
	 * Note: Nested bundles (JSONObjects inside JSONObjects) are not supported.
	 */
	private static Bundle jsonStringToBundle(String jsonString, final String methodName) {
		
		if (jsonString == null || jsonString.isEmpty())
        	return null;
		
		try {
			JSONObject jsonObject = new JSONObject(jsonString);
			return jsonObjectToBundle(jsonObject, methodName);
		} catch (JSONException e) {
			Log.e(LOG_TAG, methodName + " :: Failed to parse JSON string", e);
		}

		return null;
	}

	private static Bundle jsonObjectToBundle(JSONObject jsonObject, final String methodName) throws JSONException {
		
		Bundle bundle = new Bundle();
		
		Iterator<String> keys = jsonObject.keys();
		while (keys.hasNext()) {
			String key = keys.next();
			Object value = jsonObject.get(key);

			if (value instanceof JSONArray) {
				JSONArray array = (JSONArray) value;
				Bundle[] parcelableArray = jsonArrayToBundleArray(array, methodName);
				bundle.putParcelableArray(key, parcelableArray);
			} else {
				// Handle primitive types
				putPrimitiveInBundle(bundle, key, value, methodName);
			}
		}

		return bundle;
	}

	private static Bundle[] jsonArrayToBundleArray(JSONArray jsonArray, final String methodName) throws JSONException {
		int length = jsonArray.length();
        Bundle[] bundleArray = new Bundle[length];

		for (int i = 0; i < length; i++) {
			Object value = jsonArray.get(i);

			if (value instanceof JSONObject) {
				// Recursively convert JSONObject to Bundle
				bundleArray[i] = jsonObjectToBundle((JSONObject) value, methodName);
			} else {
				Log.w(LOG_TAG, "Unsupported type inside array: " + value.getClass().getSimpleName());
			}
		}

		return bundleArray;
	}

	private static void putPrimitiveInBundle(Bundle bundle, String key, Object value, final String methodName) {
        if (value instanceof String) {
            bundle.putString(key, (String) value);
		} else if (value instanceof Number) {
			// Convert all numbers to Double
			bundle.putDouble(key, ((Number) value).doubleValue());
		} else if (value instanceof Boolean) {
			// Convert boolean to double (1.0 for true, 0.0 for false)
			bundle.putDouble(key, (Boolean) value ? 1.0 : 0.0);
        } else {
            Log.w(LOG_TAG, methodName + " :: Unsupported type " + value.getClass().getSimpleName() + " for key: " + key);
        }
    }

	private void shutdownExecutor() {
		executorService.shutdown();
	}

	//#endregion
}

