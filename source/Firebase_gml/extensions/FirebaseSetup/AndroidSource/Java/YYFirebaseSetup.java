package ${YYAndroidPackageName};
import ${YYAndroidPackageName}.FirebaseUtils;
import android.app.Activity;

import android.util.Log;

import com.google.firebase.FirebaseApp;

public class YYFirebaseSetup extends RunnerSocial
{
	public YYFirebaseSetup() {
		// Initialize the cached instance
        FirebaseUtils.getInstance().registerInitFunction(()-> {
			Activity activity = RunnerActivity.CurrentActivity;
			FirebaseApp.initializeApp(activity);
        }, 1);
	}
	
	public void SDKFirebaseSetup_Init() {
		FirebaseUtils.getInstance().initializeAll();
	}
}

