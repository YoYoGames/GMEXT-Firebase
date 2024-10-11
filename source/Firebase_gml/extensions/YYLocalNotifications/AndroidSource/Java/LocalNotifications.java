package ${YYAndroidPackageName};

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
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

import java.io.File;

import java.math.BigInteger;
import java.security.MessageDigest;

import androidx.annotation.RequiresApi;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONException;

public class LocalNotifications extends RunnerSocial {

    private static final long MAX_DOUBLE_SAFE = 9007199254740992L; // 2^53

    public static final String KEY_NTF_TITLE = "title";
    public static final String KEY_NTF_MESSAGE = "message";
    public static final String KEY_NTF_DATA = "data";
    public static final String KEY_NTF_TYPE = "type";
    public static final String KEY_NTF_ID = "id";
    public static final String KEY_NTF_PATH_ICON = "icon_path";

    public static final String DEFAULT_CHANNEL_ID = "GMS2DefaultChannel";

    private static final int EVENT_OTHER_NOTIFICATION = 71;

    public LocalNotifications() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
            setupChannels();
    }

    public void onResume() {
        int delayMs = 500;
        if (Build.VERSION.SDK_INT <= 8)
            delayMs = 3000; // 3 seconds

        Handler handler = new Handler(Looper.getMainLooper());
        handler.postDelayed(() -> {
            handleIntentAsync(RunnerActivity.CurrentActivity.getIntent());
        }, delayMs);
    }

    public void onNewIntent(Intent intent) {
        Handler handler = new Handler(Looper.getMainLooper());
        handler.postDelayed(() -> {
            handleIntentAsync(intent);
        }, 500);
    }

    public void LocalPushNotification_Create(String ID, double fireTime, String title, String message, String data) {
        LocalPushNotification_Create_Ext(ID, fireTime, title, message, data, null);
    }

    public void LocalPushNotification_Create_Ext(String ID, double fireTime, String title, String message, String data, String imagePath) {
        if (fireTime <= 0)
            return;

        long fireTimeMs = System.currentTimeMillis() + (long) (fireTime * 1000.0);

		Activity activity = RunnerActivity.CurrentActivity;

        Intent intent = new Intent(activity, LocalNotifications_BroadcastReceiver.class);
        intent.putExtra(KEY_NTF_TITLE, title);
        intent.putExtra(KEY_NTF_MESSAGE, message);
        intent.putExtra(KEY_NTF_ID, ID);
        intent.putExtra(KEY_NTF_DATA, data);

		if (imagePath != null) {
			File localFile = new File(activity.getFilesDir(), imagePath);
			if (localFile.exists())
			{
				intent.putExtra(KEY_NTF_PATH_ICON, imagePath);
			}
		}

        PendingIntent pendingIntent = PendingIntent.getBroadcast(
                activity,
                getUniqueInteger(ID),
                intent,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE
        );
        AlarmManager am = (AlarmManager) activity.getSystemService(Context.ALARM_SERVICE);
        am.set(AlarmManager.RTC_WAKEUP, fireTimeMs, pendingIntent);
    }

    public void LocalPushNotification_Cancel(String ID) {
		Activity activity = RunnerActivity.CurrentActivity;

        Context appContext = activity.getApplicationContext();
        Intent intent = new Intent(appContext, LocalNotifications_BroadcastReceiver.class);
        PendingIntent pendingIntent = PendingIntent.getBroadcast(
                appContext,
                getUniqueInteger(ID),
                intent,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE
        );
        pendingIntent.cancel();

        AlarmManager am = (AlarmManager) appContext.getSystemService(Context.ALARM_SERVICE);
        am.cancel(pendingIntent);
    }

    public static int getUniqueInteger(String name) {
        String plaintext = name;
        int hash = name.hashCode();
        MessageDigest m;
        try
        {
            m = MessageDigest.getInstance("MD5");
            m.reset();
            m.update(plaintext.getBytes());
            byte[] digest = m.digest();
            BigInteger bigInt = new BigInteger(1, digest);
            String hashtext = bigInt.toString(10);
            while (hashtext.length() < 32)
                hashtext = "0" + hashtext;

            int temp = 0;
            for (int i = 0; i < hashtext.length(); i++)
            {
                char c = hashtext.charAt(i);
                temp += (int) c;
            }
            return hash + temp;
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return hash;
    }

    public void handleIntentAsync(Intent intent) {
        Bundle bundle = intent.getExtras();
        if (bundle == null)
            return;

        if (!bundle.containsKey(KEY_NTF_ID))
        {
            Log.i("LocalNotifications", "Intent does not contain local notification ID.");
            return;
        }

		RunnerActivity.CurrentActivity.runOnUiThread(() -> {
            int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
            RunnerJNILib.DsMapAddString(dsMapIndex, "type", "Notification_Local");
            if (bundle != null) {
                for (String key : bundle.keySet()) {
                    Object value = bundle.get(key);
                    if (value instanceof String) {
                        RunnerJNILib.DsMapAddString(dsMapIndex, key, (String) value);
                    } else if (value instanceof Double || value instanceof Integer || value instanceof Float || value instanceof Boolean) {
                        // Convert Boolean to double (1.0 or 0.0)
                        double doubleValue;
                        if (value instanceof Boolean) {
                            doubleValue = (Boolean) value ? 1.0 : 0.0;
                        } else if (value instanceof Integer) {
                            doubleValue = ((Integer) value).doubleValue();
                        } else if (value instanceof Float) {
                            doubleValue = ((Float) value).doubleValue();
                        } else { // Double
                            doubleValue = (Double) value;
                        }
                        RunnerJNILib.DsMapAddDouble(dsMapIndex, key, doubleValue);
                    } else if (value instanceof Long) {
                        long longValue = (Long) value;
                        if (Math.abs(longValue) <= MAX_DOUBLE_SAFE) {
                            RunnerJNILib.DsMapAddDouble(dsMapIndex, key, (double) longValue);
                        } else {
                            String formattedLong = String.format("@i64@%016x$i64$", longValue);
                            RunnerJNILib.DsMapAddString(dsMapIndex, key, formattedLong);
                        }
                    } else if (value instanceof Map) {
                        String jsonString = new JSONObject((Map) value).toString();
                        RunnerJNILib.DsMapAddString(dsMapIndex, key, jsonString);
                    } else if (value instanceof List) {
                        String jsonString = new JSONArray((List) value).toString();
                        RunnerJNILib.DsMapAddString(dsMapIndex, key, jsonString);
                    } else {
                        // Convert other types to String
                        RunnerJNILib.DsMapAddString(dsMapIndex, key, value.toString());
                    }
                }
            }
            RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_NOTIFICATION);
        });



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
