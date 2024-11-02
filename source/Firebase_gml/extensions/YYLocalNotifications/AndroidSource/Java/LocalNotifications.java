package ${YYAndroidPackageName};
import ${YYAndroidPackageName}.LocalNotificationReceiver;

import com.yoyogames.runner.RunnerJNILib;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.app.NotificationChannel;
import android.app.NotificationManager;

import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;

import androidx.annotation.RequiresApi;

public class LocalNotifications extends RunnerSocial implements NotificationCallback {

    public static final String DEFAULT_CHANNEL_ID = "GMLocalNotification";

    private static final int EVENT_OTHER_NOTIFICATION = 71;

    public LocalNotifications() {
        LocalNotificationReceiver.registerCallback(this);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
            setupChannels();
    }

    public void onStart() {
        Activity activity = RunnerActivity.CurrentActivity;
        Intent intent = activity.getIntent();

        final NotificationData notificationData = NotificationData.fromIntent(intent);
        if (notificationData == null) {
            return;
        }
        
        Handler handler = new Handler(Looper.getMainLooper());
        handler.postDelayed(() -> {
            onNotificationReceived(notificationData);

            // Clear the notification data from the Intent so it's not processed again
            NotificationData.clearFromIntent(intent);
        }, 1000);
    }

    public void onResume() {
        LocalNotificationReceiver.registerCallback(this);
    }

    public void onPause() {
        LocalNotificationReceiver.unregisterCallback(this);
    }

    public void onStop() {
        LocalNotificationReceiver.unregisterCallback(this);
    }

    public void onDestroy() {
        LocalNotificationReceiver.unregisterCallback(this);
    }

    public void onNewIntent(Intent intent) {
        final NotificationData notificationData = NotificationData.fromIntent(intent);
        if (notificationData == null) {
            return;
        }

        Handler handler = new Handler(Looper.getMainLooper());
        handler.postDelayed(() -> {
            onNotificationReceived(notificationData);
        }, 500);
    }

    public void LocalPushNotification_Create(String id, double fireTime, String title, String message, String data) {
        LocalPushNotification_Create_Ext(id, fireTime, title, message, data, null);
    }

    public void LocalPushNotification_Create_Ext(String id, double fireTime, String title, String message, String data, String imagePath) {
        if (fireTime <= 0)
            return;

        long fireTimeMs = System.currentTimeMillis() + (long) (fireTime * 1000.0);

		Activity activity = RunnerActivity.CurrentActivity;

        Intent intent = new Intent(activity, LocalNotificationReceiver.class);
        NotificationData notificationData = new NotificationData(id, title, message, data, imagePath);
        notificationData.toIntent(intent);

        PendingIntent pendingIntent = PendingIntent.getBroadcast(
                activity,
                NotificationData.getUniqueInteger(id),
                intent,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE
        );
        AlarmManager am = (AlarmManager) activity.getSystemService(Context.ALARM_SERVICE);
        am.set(AlarmManager.RTC_WAKEUP, fireTimeMs, pendingIntent);
    }

    public void LocalPushNotification_Cancel(String id) {
		Activity activity = RunnerActivity.CurrentActivity;

        Context appContext = activity.getApplicationContext();
        Intent intent = new Intent(appContext, LocalNotificationReceiver.class);
        PendingIntent pendingIntent = PendingIntent.getBroadcast(
                appContext,
                NotificationData.getUniqueInteger(id),
                intent,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE
        );
        pendingIntent.cancel();

        AlarmManager am = (AlarmManager) appContext.getSystemService(Context.ALARM_SERVICE);
        am.cancel(pendingIntent);
    }
    
    @Override
    public boolean onNotificationReceived(final NotificationData notificationData) {

        // If app is not running or is suspended don't do anything
        boolean appRunning = (RunnerActivity.CurrentActivity != null && !RunnerActivity.CurrentActivity.mbAppSuspended);
        if (!appRunning) {
            return false;
        }

		RunnerActivity.CurrentActivity.runOnUiThread(() -> {
            int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
            RunnerJNILib.DsMapAddString(dsMapIndex, "type", "Notification_Local");
            RunnerJNILib.DsMapAddString(dsMapIndex, "id", notificationData.getId());
            RunnerJNILib.DsMapAddString(dsMapIndex, "title", notificationData.getTitle());
            RunnerJNILib.DsMapAddString(dsMapIndex, "message", notificationData.getMessage());
            RunnerJNILib.DsMapAddString(dsMapIndex, "data", notificationData.getData());
            RunnerJNILib.DsMapAddString(dsMapIndex, "icon_path", notificationData.getImagePath());
            
            RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_NOTIFICATION);
        });

        return true;
    }

    @RequiresApi(api = Build.VERSION_CODES.O)
    private void setupChannels() {
		Activity activity = RunnerActivity.CurrentActivity;

        CharSequence adminChannelName = activity.getString(R.string.default_notification_channel_name);
        String adminChannelDescription = activity.getString(R.string.default_notification_channel_description);

        NotificationChannel adminChannel;
        adminChannel = new NotificationChannel(DEFAULT_CHANNEL_ID, adminChannelName, NotificationManager.IMPORTANCE_HIGH);
        adminChannel.setDescription(adminChannelDescription);
        adminChannel.enableLights(true);
        adminChannel.setLightColor(Color.RED);
        adminChannel.enableVibration(true);

        NotificationManager notificationManager = (NotificationManager) activity.getSystemService(Context.NOTIFICATION_SERVICE);
        if (notificationManager != null)
            notificationManager.createNotificationChannel(adminChannel);
    }
}
