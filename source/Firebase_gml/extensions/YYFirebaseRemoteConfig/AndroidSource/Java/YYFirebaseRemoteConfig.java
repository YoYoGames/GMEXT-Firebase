
package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

import com.google.firebase.remoteconfig.FirebaseRemoteConfig;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigSettings;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigValue;

import android.app.Activity;
import androidx.annotation.NonNull;
import android.util.Log;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;

import org.json.JSONObject;
import org.json.JSONArray;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.lang.Exception;

public class YYFirebaseRemoteConfig
{
	private static final int EVENT_OTHER_SOCIAL = 70;
	private static Activity activity = RunnerActivity.CurrentActivity;
	
	//https://firebase.google.com/docs/reference/android/com/crashlytics/sdk/android/crashlytics/Crashlytics.html
	
	public void FirebaseRemoteConfig_Initialize(double milisecs)//3600
	{
		FirebaseRemoteConfigSettings configSettings = new FirebaseRemoteConfigSettings.Builder().setMinimumFetchIntervalInSeconds((long)milisecs).build();
		FirebaseRemoteConfig.getInstance().setConfigSettingsAsync(configSettings);
	}
	
	public void FirebaseRemoteConfig_FetchAndActivate()
	{
		FirebaseRemoteConfig.getInstance().fetchAndActivate().addOnCompleteListener(activity,new OnCompleteListener<Boolean>()
		{
            @Override
            public void onComplete(@NonNull Task<Boolean> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseRemoteConfig_FetchAndActivate");	
				if (task.isSuccessful() && task.getResult())
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",1);		                    
				else 
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",0);				
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }
        });
	}

	public void FirebaseRemoteConfig_Reset()
	{
		FirebaseRemoteConfig.getInstance().reset().addOnCompleteListener(activity,new OnCompleteListener<Void>() 
		{
			@Override
			public void onComplete(@NonNull Task<Void> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseRemoteConfig_Reset");
				if(task.isSuccessful())
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",1);
				else 
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",0);
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		});
	}
	
	public void FirebaseRemoteConfig_SetDefaultsAsync(String json)
	{
		FirebaseRemoteConfig.getInstance().setDefaultsAsync(jsonToMap(json)).addOnCompleteListener(activity,new OnCompleteListener<Void>() 
		{
			@Override
			public void onComplete(@NonNull Task<Void> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseRemoteConfig_setDefaultsAsync");		
				if(task.isSuccessful()) 
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",1);
				else 
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",0);
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
			}
		});
	}
	
	public String FirebaseRemoteConfig_GetKeys()
	{
        Map<String, FirebaseRemoteConfigValue> map = FirebaseRemoteConfig.getInstance().getAll();
         
        JSONArray mArray = new JSONArray();
        for (String key : map.keySet())
            mArray.put(key);
		
		return mArray.toString();
	}
	
	public String FirebaseRemoteConfig_GetString(String key)
	{
		return FirebaseRemoteConfig.getInstance().getString(key);
	}

	public double FirebaseRemoteConfig_GetDouble(String key)
	{		
		return FirebaseRemoteConfig.getInstance().getDouble(key);
	}
	
	public static Map<String,Object> jsonToMap(String jsonStr)
	{
		try
		{
			JSONObject json = new JSONObject(jsonStr);
			Map<String,Object> retMap = new HashMap<String,Object>();
			if(json != JSONObject.NULL) 
				retMap = toMap(json);
			return retMap;
		}
		catch(Exception e)
		{
			return new HashMap<String,Object>();
		}	
	}
	
	public static Map<String,Object> toMap(JSONObject object) throws Exception 
	{
		Map<String,Object> map = new HashMap<String,Object>();
		Iterator<String> keysItr = object.keys();
		while(keysItr.hasNext()) 
		{
			String key = keysItr.next();
			Object value = object.get(key);

			if(value instanceof JSONArray) 
			{
				value = toList((JSONArray) value);
			}
			else 
			if(value instanceof JSONObject) 
			{
				value = toMap((JSONObject) value);
			}
				
			map.put(key,value);
		}
		return map;
	}
	
	public static List<Object> toList(JSONArray array) throws Exception 
	{
		List<Object> list = new ArrayList<Object>();
		for(int i = 0; i < array.length(); i++) 
		{
			Object value = array.get(i);
			if(value instanceof JSONArray) 
			{
				value = toList((JSONArray) value);
			}
			else 
				if(value instanceof JSONObject) 
				{
					value = toMap((JSONObject) value);
				}
			list.add(value);
		}
		return list;
	}
}

