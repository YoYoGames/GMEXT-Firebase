package ${YYAndroidPackageName};

import com.google.firebase.appcheck.FirebaseAppCheck;
import com.google.firebase.appcheck.AppCheckToken;

${YYAndroid_AppCheck_Provider_Include}

import com.google.firebase.appcheck.playintegrity.PlayIntegrityAppCheckProviderFactory;
// import com.google.firebase.appcheck.debug.DebugAppCheckProviderFactory;

import androidx.annotation.NonNull;
import android.util.Log;

import java.lang.Exception;

import java.util.Map;
import java.util.HashMap;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;

public class YYFirebaseAppCheck
{
	FirebaseAppCheck appCheck;

	public YYFirebaseAppCheck() {
        // Initialize the cached instance
        FirebaseUtils.getInstance().registerInitFunction(()-> {
            appCheck = FirebaseAppCheck.getInstance();
			appCheck.installAppCheckProviderFactory(${YYAndroid_AppCheck_Provider}.getInstance());
        }, 6);
	}
	
	
	public void FirebaseAppCheck_GetToken(double _force_refresh)
	{
		FirebaseAppCheck.getInstance().getAppCheckToken(_force_refresh > 0.5).addOnCompleteListener(new OnCompleteListener<AppCheckToken>() 
		{
			@Override
			public void onComplete(@NonNull Task<AppCheckToken> task) 
			{
				Map<String, Object> data = new HashMap<>();
				if (task.isSuccessful()) 
				{
					String token = task.getResult().getToken();
					data.put("token", token);
					data.put("success", 1.0);
				}
				else
				{
					// data.put("error", errorMessage);
					data.put("success", 0.0);
				}

				FirebaseUtils.sendSocialAsyncEvent("FirebaseAppCheck_GetToken",data);
			}
		});
	}
	
	public void FirebaseAppCheck_LimitedUseToken()
	{
		FirebaseAppCheck.getInstance().getLimitedUseAppCheckToken().addOnCompleteListener(new OnCompleteListener<AppCheckToken>() 
		{
			@Override
			public void onComplete(@NonNull Task<AppCheckToken> task) 
			{
				Map<String, Object> data = new HashMap<>();
				if (task.isSuccessful()) 
				{
					String token = task.getResult().getToken();
					data.put("token", token);
					data.put("success", 1.0);
				}
				else
				{
					// data.put("error", errorMessage);
					data.put("success", 0.0);
				}

				FirebaseUtils.sendSocialAsyncEvent("FirebaseAppCheck_LimitedUseToken",data);
			}
		});
	}
}

