
package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

import android.app.Activity;

import org.json.JSONObject;
import org.json.JSONException;

import com.google.firebase.messaging.FirebaseMessaging;
// import com.google.firebase.iid.InstanceIdResult;
// import com.google.firebase.iid.FirebaseInstanceId;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;

import androidx.annotation.NonNull;

public class YYFirebaseCloudMessaging extends RunnerSocial
{
	private static final int EVENT_OTHER_SOCIAL = 70;
	private static final int EVENT_OTHER_NOTIFICATION = 71;
	public static Activity activity = RunnerActivity.CurrentActivity;
	
	public void onStart() 
	{
	}

	public void onStop() 
	{
	}
	
	public void onPause() 
	{
	}
	
	public void onResume()
	{
	}
	
	public YYFirebaseCloudMessaging()
	{
	}
	
	/////////////////////////////////Firebase Cloud Messaging
	
	public void FirebaseCloudMessaging_GetToken()
	{
		FirebaseMessaging.getInstance().getToken().addOnCompleteListener(new OnCompleteListener<String>() 
		{
            @Override
            public void onComplete(@NonNull Task<String> task) 
			{   	
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseCloudMessaging_GetToken");
				if(task.isSuccessful()) 
				{
					String token = task.getResult();
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",1);
					RunnerJNILib.DsMapAddString(dsMapIndex,"value",token);
                }
				else
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",0);
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }
        });
	}
	
	
	public void FirebaseCloudMessaging_SubscribeToTopic(final String Topic)
	{
		FirebaseMessaging.getInstance().subscribeToTopic(Topic).addOnCompleteListener(new OnCompleteListener<Void>() 
		{
            @Override
            public void onComplete(@NonNull Task<Void> task) 
			{   	
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseCloudMessaging_SubscribeToTopic");	
				RunnerJNILib.DsMapAddString(dsMapIndex,"topic",Topic);
				if(task.isSuccessful()) 
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",1);
				else
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",0);
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }
        });
	}
	
	public void FirebaseCloudMessaging_UnsubscribeFromTopic(final String Topic)
	{	
		FirebaseMessaging.getInstance().unsubscribeFromTopic(Topic).addOnCompleteListener(new OnCompleteListener<Void>() 
		{
            @Override
            public void onComplete(@NonNull Task<Void> task) 
			{  		
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseCloudMessaging_UnsubscribeFromTopic");	
				RunnerJNILib.DsMapAddString(dsMapIndex,"topic",Topic);
				if(task.isSuccessful())
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",1);
				else
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",0);
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }
        });
	}

	public double FirebaseCloudMessaging_IsAutoInitEnabled()
	{
		if(FirebaseMessaging.getInstance().isAutoInitEnabled())
			return(1);
		else
			return(0);
	}

	public void FirebaseCloudMessaging_SetAutoInitEnabled(double eneable)
	{
		FirebaseMessaging.getInstance().setAutoInitEnabled(eneable > 0.5);
	}
	
	public void FirebaseCloudMessaging_DeleteToken()
	{
		FirebaseMessaging.getInstance().deleteToken().addOnCompleteListener(new OnCompleteListener<Void>() 
		{
            @Override
            public void onComplete(@NonNull Task<Void> task) 
			{  		
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseCloudMessaging_DeleteToken");
				if(task.isSuccessful()) 
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",1);
				else
					RunnerJNILib.DsMapAddDouble(dsMapIndex,"success",0);
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
            }
        });
	}
}

