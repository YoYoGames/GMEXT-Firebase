
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
	
	public static Bundle jsonStringToBundle(String jsonString)
	{
		try 
		{
			JSONObject jsonObject = new JSONObject(jsonString);
			Bundle bundle = new Bundle();
			Iterator iter = jsonObject.keys();
			while(iter.hasNext())
			{
				String key = (String)iter.next();
				Object aObj = jsonObject.get(key);
				if(aObj instanceof String)
					bundle.putString(key,jsonObject.getString(key));
				else if (aObj instanceof JSONArray){
					JSONArray jsonArray = jsonObject.getJSONArray(key);
					for(int i = 0; i < jsonArray.length(); i++)
					{
						JSONObject obj = jsonArray.getJSONObject(i);
						
						Bundle itemBundle = new Bundle();
						itemBundle.putString("item_id", obj.getString("item_id"));
						itemBundle.putString("item_name", obj.getString("item_name"));
						bundle.putParcelableArray(key, new Bundle[] {itemBundle});
					}
				} else
					bundle.putDouble(key,jsonObject.getDouble(key));
			}
			return bundle;
		} 
		catch (Exception e) 
		{
					Log.e("yoyo", "jsonStringToBundle Exception: " + e.getMessage(), e);
		}
		return new Bundle();
	}
}

