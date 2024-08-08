package ${YYAndroidPackageName};
import ${YYAndroidPackageName}.RunnerActivity;
import com.yoyogames.runner.RunnerJNILib;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.os.Build;

import android.app.NotificationManager;
import android.app.NotificationChannel;
import android.app.Notification;
import android.app.PendingIntent;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;
import androidx.core.app.NotificationCompat;
import androidx.core.app.TaskStackBuilder;

import android.os.Build;
import android.graphics.Color;

import java.io.File;
import android.graphics.BitmapFactory;
import android.graphics.Bitmap;

public class LocalNotifications_BroadcastReceiver extends BroadcastReceiver
{
	private static final String DEFAULT_CHANNEL_ID = "GMS2DefaultChannel";
		
	@Override
	public void onReceive(Context context, Intent intent) 
	{
		boolean app_running = (RunnerActivity.CurrentActivity != null && !RunnerActivity.CurrentActivity.mbAppSuspended);
		if(app_running)
		{
			Object[] argArray = new Object[1];	
			argArray[0] = intent;
			RunnerJNILib.CallExtensionFunction("LocalNotifications","HandleIntent_AsyncCall",1,argArray);
		}
		else
			HandleIntent_Notification(context,intent);
    }

	public void HandleIntent_Notification(Context context,Intent intent)
	{
		Bundle extras = intent.getExtras();
		
		if(extras == null)
			return;
		
		String title = extras.getString(LocalNotifications.KEY_NTF_TITLE);
		String message = extras.getString(LocalNotifications.KEY_NTF_MESSAGE);
		String data = extras.getString(LocalNotifications.KEY_NTF_DATA);
		String ID = extras.getString(LocalNotifications.KEY_NTF_ID);
		
		//Craeting a new intent due if not not works :)
		// Intent resultIntent = new Intent(context, RunnerActivity.class);
		// resultIntent.setFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);
		Intent resultIntent = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
		resultIntent.setFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);
		
		resultIntent.putExtras(intent);

		// TaskStackBuilder stackBuilder = TaskStackBuilder.create(context);
		// stackBuilder.addNextIntentWithParentStack(resultIntent);
		// PendingIntent resultPendingIntent = stackBuilder.getPendingIntent(0,PendingIntent.FLAG_IMMUTABLE);
		PendingIntent resultPendingIntent = PendingIntent.getActivity(context, (int)System.currentTimeMillis(), resultIntent, PendingIntent.FLAG_IMMUTABLE);

		NotificationCompat.Builder notificationBuilder = new NotificationCompat.Builder(context, DEFAULT_CHANNEL_ID)
			.setSmallIcon(R.drawable.notification_icon)
			.setDefaults(Notification.DEFAULT_ALL)
			.setColor(context.getResources().getColor(R.color.notification_color))
			.setContentTitle(title)
			.setContentText(message)
			.setContentIntent(resultPendingIntent)
			.setAutoCancel(true);
		
		String imagePath = extras.getString(LocalNotifications.KEY_NTF_PATH_ICON);
		if(imagePath != null)
		{
			File localFile = new File(context.getFilesDir() + "/" + imagePath);
			Bitmap bitmap;
			if(localFile.exists())
			{
				bitmap = BitmapFactory.decodeFile(context.getFilesDir() + "/" + imagePath);
				notificationBuilder.setLargeIcon(bitmap);
			}
		}
		
		NotificationManager notificationManager = (NotificationManager) context.getSystemService(context.NOTIFICATION_SERVICE);
		notificationManager.notify(LocalNotifications.getUniqueInteger(ID), notificationBuilder.build());
	}
}
