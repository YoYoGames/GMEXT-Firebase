
package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import ${YYAndroidPackageName}.FirebaseUtils;

import android.app.Activity;

import java.util.Map;
import java.util.HashMap;

import org.json.JSONObject;
import org.json.JSONException;

import com.google.firebase.messaging.FirebaseMessaging;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;

import androidx.annotation.NonNull;

public class YYFirebaseCloudMessaging extends RunnerSocial {

	public void FirebaseCloudMessaging_GetToken() {
		FirebaseMessaging.getInstance().getToken().addOnCompleteListener(new OnCompleteListener<String>() {
            @Override
            public void onComplete(@NonNull Task<String> task) {   	
				Map<String, Object> extraData = new HashMap<>();
                boolean success = task.isSuccessful();
				extraData.put("success", success);
				if (success) {
					extraData.put("value", task.getResult());
				}
				FirebaseUtils.sendSocialAsyncEvent("FirebaseCloudMessaging_GetToken", extraData);
            }
        });
	}
	
	public void FirebaseCloudMessaging_SubscribeToTopic(final String topic) {
		FirebaseMessaging.getInstance().subscribeToTopic(topic).addOnCompleteListener(new OnCompleteListener<Void>() {
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
		FirebaseMessaging.getInstance().unsubscribeFromTopic(topic).addOnCompleteListener(new OnCompleteListener<Void>() {
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
		return FirebaseMessaging.getInstance().isAutoInitEnabled() ? 1.0 : 0.0;
	}

	public void FirebaseCloudMessaging_SetAutoInitEnabled(double enable) {
		FirebaseMessaging.getInstance().setAutoInitEnabled(enable > 0.5);
	}
	
	public void FirebaseCloudMessaging_DeleteToken() {
		FirebaseMessaging.getInstance().deleteToken().addOnCompleteListener(new OnCompleteListener<Void>() {
            @Override
            public void onComplete(@NonNull Task<Void> task) {  
				Map<String, Object> extraData = new HashMap<>();
                extraData.put("success", task.isSuccessful());
				FirebaseUtils.sendSocialAsyncEvent("FirebaseCloudMessaging_DeleteToken", extraData);
            }
        });
	}
}

