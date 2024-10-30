package ${YYAndroidPackageName};
import ${YYAndroidPackageName}.FirebaseUtils;
import android.app.Activity;

import android.util.Log;

public class YYFirebaseSetup extends RunnerSocial
{
	public YYFirebaseSetup() {
		// Initialize the cached instance
        FirebaseUtils.getInstance().registerInitFunction(()-> {
			try {
				// Load the FirebaseApp class dynamically
				Class<?> firebaseAppClass = Class.forName("com.google.firebase.FirebaseApp");

				// Get the initializeApp method which takes Context and FirebaseOptions
				java.lang.reflect.Method initializeAppMethod = firebaseAppClass.getMethod("initializeApp", android.content.Context.class);

				// At this point, we can invoke the initializeApp method with the current activity
				Object currentActivity = RunnerActivity.CurrentActivity; // Get current activity
				initializeAppMethod.invoke(null, currentActivity);

				Log.i("yoyo", "Firebase initialized dynamically!");

			} catch (ClassNotFoundException e) {
				Log.i("yoyo", "FirebaseApp class not found, Firebase SDK might not be included.");
			} catch (NoSuchMethodException e) {
				Log.i("yoyo", "The method to initialize FirebaseApp was not found.");
			} catch (Exception e) {
				Log.i("yoyo", "Error using reflection.");
				e.printStackTrace();  // Handle other reflection exceptions
			}
        }, 1);
	}
	
	public void SDKFirebaseSetup_Init() {
		FirebaseUtils.getInstance().initializeAll();
	}
}

