
package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

import android.app.Activity;
import android.os.Bundle;

import org.json.JSONObject;
import org.json.JSONArray;
import java.lang.Exception;

import com.google.firebase.analytics.FirebaseAnalytics;

import java.util.Iterator;
import java.util.Map;
import java.util.ArrayList;
import java.util.Collections;

import android.util.Log;

import java.util.HashMap;

public class YYFirebaseAnalytics extends RunnerSocial
{
	private static final int EVENT_OTHER_SOCIAL = 70;
	public static Activity activity = RunnerActivity.CurrentActivity;
	
	//////////////////////////////////////////////////// Firebase Analytics ///////////////////////////////////////////////////
	
	public void FirebaseAnalytics_SetAnalyticsCollectionEnabled(double enabled)
	{
		FirebaseAnalytics.getInstance(activity).setAnalyticsCollectionEnabled(enabled >= .5);
	}

	public void FirebaseAnalytics_LogEvent(String event,String jsonValues)
	{
		FirebaseAnalytics.getInstance(activity).logEvent(event,jsonStringToBundle(jsonValues));
	}
	
	public void FirebaseAnalytics_ResetAnalyticsData()
	{
		FirebaseAnalytics.getInstance(activity).resetAnalyticsData();
	}
		
	public void FirebaseAnalytics_SetDefaultEventParameters(String jsonValues)
	{
		FirebaseAnalytics.getInstance(activity).setDefaultEventParameters(jsonStringToBundle(jsonValues));
	}
		
	public void FirebaseAnalytics_SetSessionTimeoutDuration(double time)
	{
		FirebaseAnalytics.getInstance(activity).setSessionTimeoutDuration((long)time);
	}
		
	public void FirebaseAnalytics_SetUserId(String userID)
	{
		FirebaseAnalytics.getInstance(activity).setUserId(userID);
	}
		
	public void FirebaseAnalytics_SetUserProperty(String event,String value)
	{
		FirebaseAnalytics.getInstance(activity).setUserProperty(event,value);
	}
	
	public void FirebaseAnalytics_SetConsent(double ads,double analytics)
	{
		try
		{
			Map map = new HashMap();
			
			if(ads >= 0.5)
				map.put(FirebaseAnalytics.ConsentType.AD_STORAGE,FirebaseAnalytics.ConsentStatus.GRANTED);
			else
				map.put( FirebaseAnalytics.ConsentType.AD_STORAGE,FirebaseAnalytics.ConsentStatus.DENIED);
			
			if(analytics >= 0.5)
				map.put(FirebaseAnalytics.ConsentType.ANALYTICS_STORAGE,FirebaseAnalytics.ConsentStatus.GRANTED);
			else
				map.put( FirebaseAnalytics.ConsentType.ANALYTICS_STORAGE,FirebaseAnalytics.ConsentStatus.DENIED);
			
			FirebaseAnalytics.getInstance(activity).setConsent(map);
		} 
		catch (Exception e)
		{
			Log.i("yoyo","FirebaseAnalytics_SetConsent Exception: " + e.getMessage());
		}
	}

	private static Bundle jsonStringToBundle(String jsonString) {
        try {
            JSONObject jsonObject = new JSONObject(jsonString);
            return jsonObjectToBundle(jsonObject);
        } catch (Exception e) {
            Log.e("yoyo", "Failed to convert JSON string to Bundle.", e);
        }
        return new Bundle();
    }

    private static Bundle jsonObjectToBundle(JSONObject jsonObject) {
        Bundle bundle = new Bundle();

        if (jsonObject == null) {
            return bundle;
        }

        Iterator<String> keys = jsonObject.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            Object value = jsonObject.opt(key);

			Object convertedValue = convertJsonValue(value);
			if (convertedValue instanceof String) {
				bundle.putString(key, (String) convertedValue);
			} else if (convertedValue instanceof Long) {
				bundle.putLong(key, (Long) convertedValue);
			} else if (convertedValue instanceof Double) {
				bundle.putDouble(key, (Double) convertedValue);
			} else if (convertedValue instanceof Bundle) {
				bundle.putBundle(key, (Bundle) convertedValue);
			} else if (convertedValue instanceof ArrayList) {
				bundle.putParcelableArrayList(key, (ArrayList) convertedValue);
			} else {
				Log.w("yoyo", "Unsupported type for key: " + key + ", type: " + value.getClass().getName());
			}
        }

        return bundle;
    }

    private static ArrayList<Object> jsonArrayToArrayList(JSONArray jsonArray) {
        ArrayList<Object> list = new ArrayList<>();

        if (jsonArray == null) {
            return list;
        }

        for (int i = 0; i < jsonArray.length(); i++) {
            Object value = jsonArray.opt(i);

			Object convertedValue = convertJsonValue(value);
			if (convertedValue == null) break;

            list.add(convertedValue);
        }

        return list;
    }

    private static Object convertJsonValue(Object value) {
        if (value instanceof String) {
            return (String) value;
        } else if (value instanceof Integer) {
            return ((Integer) value).longValue();
        } else if (value instanceof Boolean) {
            return ((Boolean) value) ? 1L : 0L;
        } else if (value instanceof Double) {
            return (Double) value;
        } else if (value instanceof Long) {
            return (Long) value;
        } else if (value instanceof JSONObject) {
            return jsonObjectToBundle((JSONObject) value);
        } else if (value instanceof JSONArray) {
            return jsonArrayToArrayList((JSONArray) value);
        } else {
            Log.w("yoyo", "Unsupported type: " + value.getClass().getName());
            return null;
        }
    }
}

