package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.FirebaseUtils;
import ${YYAndroidPackageName}.FirebaseMessageData;

import android.app.Activity;

import java.util.Map;
import java.util.HashMap;

import android.util.Log;

import com.google.firebase.messaging.RemoteMessage;
import com.google.firebase.messaging.RemoteMessage.Notification;
import com.google.firebase.messaging.FirebaseMessagingService;

public class YYFirebaseMessagingService extends FirebaseMessagingService {

	private static final int EVENT_OTHER_NOTIFICATION = 71;

	@Override
	public void onMessageReceived(RemoteMessage remoteMessage) {

		Log.d("yoyo", "#############################################");
		Log.d("yoyo", "onMessageReceived");
		Log.d("yoyo", "#############################################");

		Map<String, Object> extraData = new HashMap<>();

		// Add notification title and body if available
		Notification notification = remoteMessage.getNotification();
		if (notification != null) {
			String title = notification.getTitle();
			extraData.put("title", title);
			extraData.put("Title", title);

			String body = notification.getBody();
			extraData.put("body", body);
			extraData.put("Body", body);
			
		}

		String from = remoteMessage.getFrom();
		String to = remoteMessage.getTo();
		String collapseKey = remoteMessage.getCollapseKey();
		String messageType = remoteMessage.getMessageType();
		int ttl = remoteMessage.getTtl();
		long sentTime = remoteMessage.getSentTime();

		// Mimics the intent
		extraData.put("google.message_id", remoteMessage.getMessageId());
		extraData.put("google.original_priority", getPriorityString(remoteMessage.getOriginalPriority()));
		extraData.put("google.delivered_priority", getPriorityString(remoteMessage.getPriority()));
		extraData.put("google.sent_time", sentTime);
		extraData.put("google.ttl", ttl);
		extraData.put("from", from);
		extraData.put("collapse_key", collapseKey);

		// Compatibility
		extraData.put("SentTime", sentTime);
		extraData.put("To", to);
		extraData.put("From", from);
		extraData.put("MessageType", messageType);
		extraData.put("CollapseKey", collapseKey);
		extraData.put("Ttl", ttl);

		Log.d("yoyo", "compat");

		// Add data payload
		Map<String, String> messageData = remoteMessage.getData();
		if (messageData != null) {
			extraData.putAll(messageData);
		}

		Log.d("yoyo", "extra");

		FirebaseUtils.sendAsyncEvent(EVENT_OTHER_NOTIFICATION, "Notification_Remote", extraData);

		Log.d("yoyo", "sent");
	}

	public String getPriorityString(int priorityValue) {
		switch (priorityValue) {
			case RemoteMessage.PRIORITY_HIGH:
				return "high";
			case RemoteMessage.PRIORITY_NORMAL:
				return "normal";
			case RemoteMessage.PRIORITY_UNKNOWN:
			default:
				return "unknown";
		}
	}

	@Override
	public void onNewToken(String token) {
		Map<String, Object> extraData = new HashMap<>();
		extraData.put("value", token);
		FirebaseUtils.sendSocialAsyncEvent("FirebaseMessaging_OnNewToken", extraData);
	}
}