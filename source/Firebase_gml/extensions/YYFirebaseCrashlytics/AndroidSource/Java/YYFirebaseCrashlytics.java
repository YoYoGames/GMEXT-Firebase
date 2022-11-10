
package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

import com.google.firebase.crashlytics.FirebaseCrashlytics;
// import com.google.firebase.crashlytics.CustomKeysAndValues;
import android.app.Activity;
import androidx.annotation.NonNull;
import android.util.Log;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;

 import java.lang.Exception;
// import org.json.JSONObject;
// import java.util.Iterator;

public class YYFirebaseCrashlytics
{
	private static final int EVENT_OTHER_SOCIAL = 70;
	private static Activity activity = RunnerActivity.CurrentActivity;
	
	//https://firebase.google.com/docs/reference/android/com/crashlytics/sdk/android/crashlytics/Crashlytics.html
	
	public void FirebaseCrashlytics_SetUserIdentifier(String user_id)
	{
		FirebaseCrashlytics.getInstance().setUserId(user_id);
	}

	public void FirebaseCrashlytics_SetCustomKey(String key,String value)
	{
		FirebaseCrashlytics.getInstance().setCustomKey(key,value);
	}

	public void FirebaseCrashlytics_SetCustomKey(String key,double value)
	{
		FirebaseCrashlytics.getInstance().setCustomKey(key,(float)value);
	}
	
	// public void FirebaseCrashlytics_SetCustomKeys(String json_str)
	// {
		
		// JSONObject jsonObject = jsonToJSONObject(json_str);
		
		// Iterator<String> keys = jsonObject.keys();


        // CustomKeysAndValues.Builder builder = new CustomKeysAndValues.Builder();
				
		// while(keys.hasNext()) 
		// {
			// String key = keys.next();
			// if (jsonObject.get(key) instanceof String)
				// builder.putString(jsonObject.get(key));
			// else
				// builder.putDouble(jsonObject.get(key));
		// }
		
		// FirebaseCrashlytics.getInstance().setCustomKeys(builder.build);
	// }
	
	public void FirebaseCrashlytics_Log(String message)
	{
		FirebaseCrashlytics.getInstance().log(message);
	}
	
	public void FirebaseCrashlytics_Crash(final String message) throws Exception
	{
		RunnerActivity.ViewHandler.post( new Runnable() 
		{
			public void run() throws RuntimeException
		    {
				throw new RuntimeException(message);
		    }
		});
	}
	
	public void FirebaseCrashlytics_RecordException(String message)
	{	
		FirebaseCrashlytics.getInstance().recordException(new Throwable(message));
	}
	
	public void FirebaseCrashlytics_CrashlyticsCollectionEnabled_Set(double bool)
	{	
		FirebaseCrashlytics.getInstance().setCrashlyticsCollectionEnabled(bool >= 0.5);
	}
	
	
	public double FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check()
	{	
		Log.i("yoyo","FirebaseCrashlytics_CrashlyticsCollectionEnabled_Check: This function is not compatible with Android");
		return 0.0;
		
		// //FirebaseCrashlytics.getInstance().isCrashlyticsCollectionEnabled
		// if(BuildConfig.DEBUG)//https://stackoverflow.com/a/62915831
		// // if(FirebaseCrashlytics.getInstance().isCrashlyticsCollectionEnabled)
			// return 1.0;
		// else
			// return 0.0;
	}
	
	public double FirebaseCrashlytics_DidCrashOnPreviousExecution()
	{	
		if(FirebaseCrashlytics.getInstance().didCrashOnPreviousExecution())
			return 1.0;
		else
			return 0.0;
	}
	
	public void FirebaseCrashlytics_UnsentReports_Delete()
	{	
		FirebaseCrashlytics.getInstance().deleteUnsentReports();
	}
	
	public void FirebaseCrashlytics_UnsentReports_Send()
	{	
		FirebaseCrashlytics.getInstance().sendUnsentReports();
	}
	
	public void FirebaseCrashlytics_UnsentReports_Check()
	{
		FirebaseCrashlytics.getInstance().checkForUnsentReports().addOnCompleteListener(activity,new OnCompleteListener<Boolean>() 
		{
			@Override
			public void onComplete(@NonNull Task<Boolean> task) 
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString( dsMapIndex, "type", "FirebaseCrashlytics_UnsentReports_Check" );
				
				if (task.isSuccessful() && task.getResult())
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "value", 1 );
				else 
					RunnerJNILib.DsMapAddDouble( dsMapIndex, "value", 0 );
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
			}
		});
	}
	
	// public static JSONObject jsonToJSONObject(String json_str)
	// {
		// try
		// {
			// return new JSONObject(json_str);
		// }
		// catch(Exception e)
		// {
			// return new JSONObject("{}");
		// }	
	// }
}

