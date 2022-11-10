
package ${YYAndroidPackageName};
import com.yoyogames.runner.RunnerJNILib;

import android.util.Log;
import android.os.Build;
import android.os.Bundle;
import android.content.Context;
import android.app.Activity;
import android.app.AlarmManager;
import android.app.PendingIntent;

import android.content.Intent;

import java.security.MessageDigest;
import java.math.BigInteger;

import java.lang.Exception;

import android.app.NotificationManager;
import android.app.NotificationChannel;
import android.graphics.Color;

import androidx.annotation.RequiresApi;

public class LocalNotifications extends RunnerSocial
{
	// On the GML side we are inside a push notification event and we have already identified the
	// type as being "Notification_Local" so the prefix "YYNotification_" should not be needed
	// and would only amek the GML code more verbose.
	public static final String KEY_NTF_TITLE = "title";
	public static final String KEY_NTF_MESSAGE = "message";
	public static final String KEY_NTF_DATA = "data";
	public static final String KEY_NTF_TYPE = "type";
	public static final String KEY_NTF_ID = "id";
	
	public static final String DEFAULT_CHANNEL_ID = "GMS2DefaultChannel";
	
	//private static final int EVENT_OTHER_SOCIAL = 70;
	private static final int EVENT_OTHER_NOTIFICATION = 71;

	Activity activity = RunnerActivity.CurrentActivity;
	
	public LocalNotifications()
	{
		if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
			setupChannels();
	}

	public void onResume()
	{
		int ms = 500;
		if(Build.VERSION.SDK_INT <= 8)
			ms = 3000;// 3 seconds
			
		new java.util.Timer().schedule( new java.util.TimerTask()
		{
			@Override
			public void run() 
			{
				HandleIntent_AsyncCall(RunnerActivity.CurrentActivity.getIntent());
			}
		},ms);
	}
	
	public void onNewIntent(Intent intent)
	{
		new java.util.Timer().schedule( new java.util.TimerTask()
		{
			@Override
			public void run() 
			{
				HandleIntent_AsyncCall(intent);
			}
		},5000);
	}
	
	public void LocalPushNotification_Create(String ID ,double fireTime, String title, String message, String data)
	{
		if(fireTime <= 0)
			return;
		
		long fireTimeMs = System.currentTimeMillis() + (long)(fireTime*1000.0);

		Intent intent = new Intent(activity, LocalNotifications_BroadcastReceiver.class);
		intent.putExtra(KEY_NTF_TITLE,title);
		intent.putExtra(KEY_NTF_MESSAGE,message);
		intent.putExtra(KEY_NTF_ID,ID);
		intent.putExtra(KEY_NTF_DATA,data);
		
		PendingIntent pendingIntent = PendingIntent.getBroadcast(activity, getUniqueInteger(ID), intent, PendingIntent.FLAG_IMMUTABLE);
		AlarmManager am = (AlarmManager)activity.getSystemService(Context.ALARM_SERVICE);
		am.set(AlarmManager.RTC_WAKEUP, fireTimeMs, pendingIntent);
	}
	
	public void LocalPushNotification_Cancel(String ID)
	{
		Context appContext = activity.getApplicationContext();
		Intent intent = new Intent(appContext,LocalNotifications_BroadcastReceiver.class);
		PendingIntent pendingIntent = PendingIntent.getBroadcast(appContext,getUniqueInteger(ID),intent,PendingIntent.FLAG_IMMUTABLE);
		pendingIntent.cancel();
		
		AlarmManager am = (AlarmManager)appContext.getSystemService(Context.ALARM_SERVICE);
		am.cancel(pendingIntent);
	}
	
	public static int getUniqueInteger(String name)// Code from //https://stackoverflow.com/questions/17583565/get-unique-integer-value-from-string
	{
		String plaintext = name;
		int hash = name.hashCode();
		MessageDigest m;
		try 
		{
			m = MessageDigest.getInstance("MD5");
			m.reset();
			m.update(plaintext.getBytes());
			byte[] digest = m.digest();
			BigInteger bigInt = new BigInteger(1,digest);
			String hashtext = bigInt.toString(10);
			while(hashtext.length() < 32)
			  hashtext = "0"+hashtext;
			
			int temp = 0;
			for(int i =0; i<hashtext.length();i++)
			{
				char c = hashtext.charAt(i);
				temp += (int)c;
			}
			return hash+temp;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return hash;
	}
	
///////////////////////////////////////////////////////////////////// HANDLE INTENTS

	public void HandleIntent_AsyncCall(Intent intent)
	{
		Bundle bundle = intent.getExtras();
		if(bundle == null)
			return;
		
		if(!bundle.containsKey(KEY_NTF_ID))
		if(!bundle.containsKey("google.message_id"))		
		{
			Log.i("yoyo","Not a local notification and not from Firebase");
			return;
		}
		
		int dsMapIndex = RunnerJNILib.jCreateDsMap(null,null,null);
		
		if(bundle.containsKey(KEY_NTF_ID))
			RunnerJNILib.DsMapAddString(dsMapIndex,"type","Notification_Local");
		else
		if(bundle.containsKey("google.message_id")) // This value shouldn't probably be hard coded
			RunnerJNILib.DsMapAddString(dsMapIndex,"type","Notification_Remote");
		
		for (String key : bundle.keySet())
		{
			if(bundle.get(key) instanceof String)
				RunnerJNILib.DsMapAddString(dsMapIndex,key,(String)bundle.getString(key));
			// else
				// RunnerJNILib.DsMapAddDouble(dsMapIndex,key,(double)bundle.getDouble(key));
			intent.removeExtra(key);
		}
		
		RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_NOTIFICATION);
	}
	
	@RequiresApi(api = Build.VERSION_CODES.O)
	private void setupChannels()
	{
        CharSequence adminChannelName = RunnerActivity.CurrentActivity.getString(R.string.default_notification_channel_name);
        String adminChannelDescription = RunnerActivity.CurrentActivity.getString(R.string.default_notification_channel_description);

        NotificationChannel adminChannel;
        adminChannel = new NotificationChannel(DEFAULT_CHANNEL_ID, adminChannelName, NotificationManager.IMPORTANCE_HIGH);
        adminChannel.setDescription(adminChannelDescription);
        adminChannel.enableLights(true);
        adminChannel.setLightColor(Color.RED);
		adminChannel.enableVibration(true);
		
		NotificationManager notificationManager = (NotificationManager) RunnerActivity.CurrentActivity.getSystemService(RunnerActivity.CurrentActivity.NOTIFICATION_SERVICE);
		if(notificationManager != null) 
            notificationManager.createNotificationChannel(adminChannel);
	}
}

