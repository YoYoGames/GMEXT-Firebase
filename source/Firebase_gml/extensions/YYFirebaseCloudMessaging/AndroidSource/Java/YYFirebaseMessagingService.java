package ${YYAndroidPackageName};
import ${YYAndroidPackageName}.FirebaseUtils;

import android.app.Activity;

import org.json.JSONObject;
import org.json.JSONException;

import java.util.Map;
import java.util.HashMap;

import android.util.Log;

import com.google.firebase.messaging.RemoteMessage;
import com.google.firebase.messaging.FirebaseMessagingService;

public class YYFirebaseMessagingService extends FirebaseMessagingService {

    private static final int EVENT_OTHER_NOTIFICATION = 71;

    @Override
    public void onMessageReceived(RemoteMessage remoteMessage) {
		Map<String, Object> extraData = new HashMap<>();

        // Add notification title and body if available
        if (remoteMessage.getNotification() != null) {
            extraData.put("title", remoteMessage.getNotification().getTitle());
        	extraData.put("body", remoteMessage.getNotification().getBody());
        }

        // Add data payload
        Map<String, String> messageData = remoteMessage.getData();
		if (messageData != null) {
			extraData.putAll(messageData);
		}
        
		FirebaseUtils.sendAsyncEvent(EVENT_OTHER_NOTIFICATION, "Notification_Remote", extraData);
    }

    @Override
    public void onNewToken(String token) {
		Map<String, Object> extraData = new HashMap<>();
		extraData.put("value", token);
		FirebaseUtils.sendSocialAsyncEvent("FirebaseMessaging_OnNewToken", extraData);
    }
}