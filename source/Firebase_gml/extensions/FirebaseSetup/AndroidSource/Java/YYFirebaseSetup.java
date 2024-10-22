package ${YYAndroidPackageName};
import ${YYAndroidPackageName}.FirebaseUtils;
import android.app.Activity;

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

import android.util.Log;

import com.google.firebase.FirebaseApp;

public class YYFirebaseSetup extends RunnerSocial
{
	public YYFirebaseSetup() {
	}
	
	public void FirebaseSetup_Init()
	{
		if(RunnerJNILib.extGetVersion("YYFirebaseAppCheck") != null)
			return;
		
		Log.i("yoyo","Firebase init by: YYFirebaseSetup");
		
		FirebaseUtils.getInstance().submitAsyncTask(() -> {
			Activity activity = RunnerActivity.CurrentActivity;
			FirebaseApp.initializeApp(activity);
		});
	}
}

