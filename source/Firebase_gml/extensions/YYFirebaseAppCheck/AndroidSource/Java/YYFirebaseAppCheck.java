
package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

import android.os.Process;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.ThreadPoolExecutor;
import 	java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadFactory;

import com.google.firebase.appcheck.FirebaseAppCheck;
import com.google.firebase.appcheck.playintegrity.PlayIntegrityAppCheckProviderFactory;
// import com.google.firebase.crashlytics.CustomKeysAndValues;
import android.app.Activity;
import androidx.annotation.NonNull;
import android.util.Log;

 import java.lang.Exception;
// import org.json.JSONObject;
// import java.util.Iterator;

import com.google.firebase.FirebaseApp;
import java.lang.Exception;

public class YYFirebaseAppCheck
{
	private static final int EVENT_OTHER_SOCIAL = 70;
	private static Activity activity = RunnerActivity.CurrentActivity;
	
	int NUMBER_OF_CORES = Runtime.getRuntime().availableProcessors();
	int KEEP_ALIVE_TIME = 250;
	TimeUnit KEEP_ALIVE_TIME_UNIT = TimeUnit.MILLISECONDS;
	BlockingQueue<Runnable> taskQueue = new LinkedBlockingQueue<Runnable>();
	ExecutorService executorService = new ThreadPoolExecutor(NUMBER_OF_CORES,NUMBER_OF_CORES*2,KEEP_ALIVE_TIME,KEEP_ALIVE_TIME_UNIT,taskQueue,new BackgroundThreadFactory());

	private static class BackgroundThreadFactory implements ThreadFactory 
	{
	  private static int sTag = 1;

	  @Override
	  public Thread newThread(Runnable runnable) 
	  {
		  Thread thread = new Thread(runnable);
		  thread.setName("FirebaseSetup" + sTag);
		  thread.setPriority(Process.THREAD_PRIORITY_BACKGROUND);

		  // A exception handler is created to log the exception from threads
		  thread.setUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() 
		  {
			  @Override
			  public void uncaughtException(Thread thread, Throwable ex) 
			  {
				  Log.e("yoyo", thread.getName() + " encountered an error: " + ex.getMessage());
			  }
		  });
		  return thread;
	  }
	}

	
	//https://firebase.google.com/docs/reference/android/com/crashlytics/sdk/android/crashlytics/Crashlytics.html
	
	public void FirebaseAppCheck_AppCheck_PlayIntegrity()
	{		
		FirebaseAppCheck firebaseAppCheck = FirebaseAppCheck.getInstance();
		firebaseAppCheck.installAppCheckProviderFactory(PlayIntegrityAppCheckProviderFactory.getInstance());
	}
	
	public void FirebaseAppCheck_Init_Extension()
	{
		if (strcmp(extGetVersion((char*)"YYFirebaseAppCheck"), "undefined") != 0)
		{
			Log.i("yoyo","Firebase init by: YYFirebaseAppCheck");
			
			FirebaseUtils.getInstance().submitAsyncTask(() -> {
				Activity activity = RunnerActivity.CurrentActivity;
				FirebaseApp.initializeApp(activity);
				FirebaseAppCheck_AppCheck_PlayIntegrity();
			});
		}
	}
}

