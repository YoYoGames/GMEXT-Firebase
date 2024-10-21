package ${YYAndroidPackageName};
import ${YYAndroidPackageName}.FirebaseUtils;
import android.app.Activity;

import com.google.firebase.FirebaseApp;

public class YYFirebaseSetup extends RunnerSocial
{
	public YYFirebaseSetup() {
		FirebaseUtils.getInstance().submitAsyncTask(() -> {
			Activity activity = RunnerActivity.CurrentActivity;
			FirebaseApp.initializeApp(activity);
		});
	}
}

