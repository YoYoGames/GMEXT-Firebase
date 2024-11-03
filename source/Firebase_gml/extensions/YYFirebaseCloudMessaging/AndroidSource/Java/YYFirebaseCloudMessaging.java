
package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import ${YYAndroidPackageName}.FirebaseUtils;
import ${YYAndroidPackageName}.FirebaseMessageData;

import android.app.Activity;
import android.content.Intent;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;

import java.util.Map;
import java.util.HashMap;

import com.google.firebase.messaging.FirebaseMessaging;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;

import android.util.Log;

import androidx.annotation.NonNull;

public class YYFirebaseCloudMessaging extends RunnerSocial {

	private static final int EVENT_OTHER_NOTIFICATION = 71;

	private FirebaseMessaging messaging;

	public YYFirebaseCloudMessaging() {
		// Initialize the cached instance
		FirebaseUtils.getInstance().registerInitFunction(()-> {
			messaging = FirebaseMessaging.getInstance();
		}, 10);
	}

    public void onStart() {
        Activity activity = RunnerActivity.CurrentActivity;
        Intent intent = activity.getIntent();

        final FirebaseMessageData messageData = FirebaseMessageData.fromIntent(intent);
        if (messageData == null) {
            return;
        }
        
        Handler handler = new Handler(Looper.getMainLooper());
        handler.postDelayed(() -> {
            onFirebaseMessageReceived(messageData);

            // Clear the notification data from the Intent so it's not processed again
            FirebaseMessageData.clearFromIntent(intent);
        }, 1000);
    }

	public void onNewIntent(Intent intent) {
		final FirebaseMessageData messageData = FirebaseMessageData.fromIntent(intent);
        if (messageData == null) {
			return;
		}

		Handler handler = new Handler(Looper.getMainLooper());
		handler.postDelayed(() -> {
			onFirebaseMessageReceived(messageData);
		}, 500);
    }

	public void FirebaseCloudMessaging_GetToken() {
		messaging.getToken().addOnCompleteListener(new OnCompleteListener<String>() {
            @Override
			public void onComplete(@NonNull Task<String> task) {
				Map<String, Object> extraData = new HashMap<>();
				boolean success = task.isSuccessful();
				extraData.put("success", success);
				if (success) {
					extraData.put("value", task.getResult());
				} else {
					Exception e = task.getException();
					if (e != null) {
						extraData.put("errorMessage", e.getMessage());
					}
				}
				FirebaseUtils.sendSocialAsyncEvent("FirebaseCloudMessaging_GetToken", extraData);
			}
        });
	}
	
	public void FirebaseCloudMessaging_SubscribeToTopic(final String topic) {
		messaging.subscribeToTopic(topic).addOnCompleteListener(new OnCompleteListener<Void>() {
            @Override
            public void onComplete(@NonNull Task<Void> task) {   	
				Map<String, Object> extraData = new HashMap<>();
                extraData.put("topic", topic);
                extraData.put("success", task.isSuccessful());
				FirebaseUtils.sendSocialAsyncEvent("FirebaseCloudMessaging_SubscribeToTopic", extraData);
            }
        });
	}
	
	public void FirebaseCloudMessaging_UnsubscribeFromTopic(final String topic) {	
		messaging.unsubscribeFromTopic(topic).addOnCompleteListener(new OnCompleteListener<Void>() {
            @Override
            public void onComplete(@NonNull Task<Void> task) {
				Map<String, Object> extraData = new HashMap<>();
                extraData.put("topic", topic);
                extraData.put("success", task.isSuccessful());
				FirebaseUtils.sendSocialAsyncEvent("FirebaseCloudMessaging_UnsubscribeFromTopic", extraData);
            }
        });
	}

	public double FirebaseCloudMessaging_IsAutoInitEnabled() {
		return messaging.isAutoInitEnabled() ? 1.0 : 0.0;
	}

	public void FirebaseCloudMessaging_SetAutoInitEnabled(double enable) {
		messaging.setAutoInitEnabled(enable > 0.5);
	}
	
	public void FirebaseCloudMessaging_DeleteToken() {
		messaging.deleteToken().addOnCompleteListener(new OnCompleteListener<Void>() {
            @Override
            public void onComplete(@NonNull Task<Void> task) {  
				Map<String, Object> extraData = new HashMap<>();
                extraData.put("success", task.isSuccessful());
				FirebaseUtils.sendSocialAsyncEvent("FirebaseCloudMessaging_DeleteToken", extraData);
            }
        });
	}

	public boolean onFirebaseMessageReceived(final FirebaseMessageData messageData) {

        // If app is not running or is suspended don't do anything
        boolean appRunning = (RunnerActivity.CurrentActivity != null && !RunnerActivity.CurrentActivity.mbAppSuspended);
        if (!appRunning) {
            return false;
        }

		Map<String, Object> extraData = new HashMap<>();		
		// Mimics the intent
		extraData.put("google.message_id",messageData.getId());
		extraData.put("google.original_priority",messageData.getOriginalPriority());
		extraData.put("google.delivered_priority",messageData.getDeliveredPriority());
		extraData.put("google.sent_time",messageData.getSentTime());
		extraData.put("google.ttl",messageData.getTtl());
		extraData.put("from",messageData.getFrom());
		extraData.put("collapse_key",messageData.getCollapseKey());

		extraData.putAll(messageData.getExtraData());

		FirebaseUtils.sendAsyncEvent(EVENT_OTHER_NOTIFICATION, "Notification_Remote", extraData);

        return true;
    }
}

