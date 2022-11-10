package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.RunnerActivity;
import com.yoyogames.runner.RunnerJNILib;

import android.app.Activity;

import org.json.JSONObject;
import org.json.JSONException;

import java.util.Map;

import android.util.Log;
import android.content.Intent;

// import com.google.firebase.iid.FirebaseInstanceId;//deprecated
// import com.google.firebase.iid.InstanceIdResult;//deprecated

import com.google.firebase.messaging.RemoteMessage;
import com.google.firebase.messaging.FirebaseMessagingService;

public class YYFirebaseMessagingService extends FirebaseMessagingService
{
	Activity activity = RunnerActivity.CurrentActivity;
	private static final int EVENT_OTHER_SOCIAL = 70;
	private static final int EVENT_OTHER_NOTIFICATION = 71;
	
	@Override 
	public void onMessageReceived(RemoteMessage remoteMessage) 
	{
		////https://firebase.google.com/docs/cloud-messaging/android/receive
		//This event only can be triggerend if is in Foreground or if in background with only data, we ignore the case of only data in background
		//so if we only triggered async calls is correctly
		
		String messageType = remoteMessage.getMessageType();
		
		Intent intent = new Intent(activity, RunnerActivity.class);
		
		intent.putExtra("google.message_id",remoteMessage.getMessageId());
		intent.putExtra("SentTime",remoteMessage.getSentTime());
		intent.putExtra("To",remoteMessage.getTo());
		intent.putExtra("From",remoteMessage.getFrom());
		intent.putExtra("MessageType",remoteMessage.getMessageType());
		intent.putExtra("CollapseKey",remoteMessage.getCollapseKey());
		intent.putExtra("Ttl",remoteMessage.getTtl());
		
		if(remoteMessage.getNotification() != null)
		{
			intent.putExtra("Title",remoteMessage.getNotification().getTitle());
			intent.putExtra("Body",remoteMessage.getNotification().getBody());
		}
			
		Map<String, String> extraData = remoteMessage.getData();
		if(extraData != null)
		for(Map.Entry<String, String> entry : extraData.entrySet()) 
			intent.putExtra(entry.getKey(),entry.getValue());
		
		Object[] argArray = new Object[1];	
		argArray[0] = intent;
		RunnerJNILib.CallExtensionFunction("LocalNotifications","HandleIntent_AsyncCall",1,argArray);
	}
	
	@Override
	public void onNewToken(String token)
	{
		int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
		RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseMessaging_OnNewToken");
		RunnerJNILib.DsMapAddString(dsMapIndex,"value",token);
		RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
	}
}

