package ${YYAndroidPackageName};

import com.google.firebase.appcheck.FirebaseAppCheck;
import com.google.firebase.appcheck.playintegrity.PlayIntegrityAppCheckProviderFactory;

import androidx.annotation.NonNull;
import android.util.Log;

import java.lang.Exception;

public class YYFirebaseAppCheck
{
	FirebaseAppCheck appCheck;

	public YYFirebaseAppCheck() {
        // Initialize the cached instance
        FirebaseUtils.getInstance().registerInitFunction(()-> {
			Log.i("yoyo","Firebase init by: YYFirebaseAppCheck");
            appCheck = FirebaseAppCheck.getInstance();
			appCheck.installAppCheckProviderFactory(PlayIntegrityAppCheckProviderFactory.getInstance());
        }, 5);
	}
}

