package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

import com.google.firebase.remoteconfig.FirebaseRemoteConfig;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigSettings;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigValue;
import com.google.firebase.remoteconfig.ConfigUpdate;
import com.google.firebase.remoteconfig.ConfigUpdateListener;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigException;

import android.content.Context;
import android.util.Log;

import androidx.annotation.NonNull;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;

import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class YYFirebaseRemoteConfig extends RunnerSocial implements ConfigUpdateListener {
    private static final int EVENT_OTHER_SOCIAL = 70;
    private static final String TAG = "YYFirebaseRemoteConfig";
    private Context appContext;
    private FirebaseRemoteConfig remoteConfig;
    private final ExecutorService executorService = Executors.newSingleThreadExecutor();

    public YYFirebaseRemoteConfig() {
        // Get the application context
        appContext = RunnerActivity.CurrentActivity.getApplicationContext();
        remoteConfig = FirebaseRemoteConfig.getInstance();
    }

    // <editor-fold desc="Setup">

    public void FirebaseRemoteConfig_Initialize(double milisecs) {
        FirebaseRemoteConfigSettings configSettings = new FirebaseRemoteConfigSettings.Builder()
                .setMinimumFetchIntervalInSeconds((long) milisecs)
                .build();
        remoteConfig.setConfigSettingsAsync(configSettings);
        Log.d(TAG, "FirebaseRemoteConfig initialized with fetch interval: " + (long) milisecs + " seconds");
    }

    // </editor-fold>

    // <editor-fold desc="Remote Config Methods">

    public void FirebaseRemoteConfig_FetchAndActivate() {
        remoteConfig.fetchAndActivate()
                .addOnCompleteListener(new OnCompleteListener<Boolean>() {
                    @Override
                    public void onComplete(@NonNull Task<Boolean> task) {
                        Map<String, Object> data = new HashMap<>();
                        if (task.isSuccessful()) {
                            boolean updated = task.getResult();
                            data.put("success", updated ? 1.0 : 0.0);
                            Log.d(TAG, "Fetch and activate succeeded: " + updated);
                        } else {
                            data.put("success", 0.0);
                            Exception e = task.getException();
                            if (e != null) {
                                String errorMessage = e.getMessage();
                                data.put("error", errorMessage);
                                Log.e(TAG, "Fetch and activate failed: " + errorMessage);
                            } else {
                                Log.e(TAG, "Fetch and activate failed with unknown error");
                            }
                        }
                        sendAsyncEvent("FirebaseRemoteConfig_FetchAndActivate", data);
                    }
                });
    }

    public void FirebaseRemoteConfig_Reset() {
        remoteConfig.reset()
                .addOnCompleteListener(new OnCompleteListener<Void>() {
                    @Override
                    public void onComplete(@NonNull Task<Void> task) {
                        Map<String, Object> data = new HashMap<>();
                        if (task.isSuccessful()) {
                            data.put("success", 1.0);
                            Log.d(TAG, "FirebaseRemoteConfig reset succeeded");
                        } else {
                            data.put("success", 0.0);
                            Exception e = task.getException();
                            if (e != null) {
                                String errorMessage = e.getMessage();
                                data.put("error", errorMessage);
                                Log.e(TAG, "FirebaseRemoteConfig reset failed: " + errorMessage);
                            } else {
                                Log.e(TAG, "FirebaseRemoteConfig reset failed with unknown error");
                            }
                        }
                        sendAsyncEvent("FirebaseRemoteConfig_Reset", data);
                    }
                });
    }

    public void FirebaseRemoteConfig_SetDefaultsAsync(final String json) {
        // Offload JSON parsing to background thread

        final String methodName = "FirebaseRemoteConfig_SetDefaultsAsync";

        executorService.execute(new Runnable() {
            @Override
            public void run() {
                final Map<String, Object> defaultsMap = jsonStringToMap(json, methodName);
                if (defaultsMap.isEmpty()) {
                    Log.e(TAG, "SetDefaultsAsync failed: Invalid JSON");
                    Map<String, Object> data = new HashMap<>();
                    data.put("success", 0.0);
                    data.put("error", "Invalid JSON");
                    sendAsyncEvent(methodName, data);
                    return;
                }

                remoteConfig.setDefaultsAsync(defaultsMap)
                        .addOnCompleteListener(new OnCompleteListener<Void>() {
                            @Override
                            public void onComplete(@NonNull Task<Void> task) {
                                Map<String, Object> data = new HashMap<>();
                                if (task.isSuccessful()) {
                                    data.put("success", 1.0);
                                    Log.d(TAG, "SetDefaultsAsync succeeded");
                                } else {
                                    data.put("success", 0.0);
                                    Exception e = task.getException();
                                    String errorMessage = (e != null) ? e.getMessage() : "Unknown error";
                                    data.put("error", errorMessage);
                                    Log.e(TAG, "SetDefaultsAsync failed: " + errorMessage);
                                }
                                sendAsyncEvent(methodName, data);
                            }
                        });
            }
        });
    }

    public String FirebaseRemoteConfig_GetKeys() {
        Map<String, FirebaseRemoteConfigValue> map = remoteConfig.getAll();
        JSONArray jsonArray = new JSONArray();
        for (String key : map.keySet()) {
            jsonArray.put(key);
        }
        String keysString = jsonArray.toString();
        Log.d(TAG, "FirebaseRemoteConfig_GetKeys: " + keysString);
        return keysString;
    }

    public String FirebaseRemoteConfig_GetString(String key) {
        if (remoteConfig.getKeysByPrefix(key).isEmpty()) {
            Log.w(TAG, "FirebaseRemoteConfig_GetString: Key not found - " + key);
        }
        String value = remoteConfig.getString(key);
        Log.d(TAG, "FirebaseRemoteConfig_GetString: Key=" + key + ", Value=" + value);
        return value;
    }

    public double FirebaseRemoteConfig_GetDouble(String key) {
        if (remoteConfig.getKeysByPrefix(key).isEmpty()) {
            Log.w(TAG, "FirebaseRemoteConfig_GetDouble: Key not found - " + key);
        }
        double value = remoteConfig.getDouble(key);
        Log.d(TAG, "FirebaseRemoteConfig_GetDouble: Key=" + key + ", Value=" + value);
        return value;
    }

    public void FirebaseRemoteConfig_AddOnConfigUpdateListener() {
        remoteConfig.addOnConfigUpdateListener(this);
        Log.d(TAG, "FirebaseRemoteConfig_AddOnConfigUpdateListener: Listener added");
    }

    // </editor-fold>

    // <editor-fold desc="ConfigUpdateListener Implementation">

    @Override
    public void onError(FirebaseRemoteConfigException error) {
        Map<String, Object> data = new HashMap<>();
        data.put("success", 0.0);
        if (error != null) {
            String errorMessage = error.getMessage();
            data.put("error", errorMessage);
            Log.e(TAG, "ConfigUpdateListener onError: " + errorMessage);
        } else {
            Log.e(TAG, "ConfigUpdateListener onError: Unknown error");
        }
        sendAsyncEvent("FirebaseRemoteConfig_AddOnConfigUpdateListener", data);
    }

    @Override
    public void onUpdate(ConfigUpdate configUpdate) {
        Map<String, Object> data = new HashMap<>();
        if (configUpdate != null) {
            Iterator<String> keysIterator = configUpdate.getUpdatedKeys().iterator();
            JSONArray jsonArray = new JSONArray();
            while (keysIterator.hasNext()) {
                String key = keysIterator.next();
                jsonArray.put(key);
            }
            String keysString = jsonArray.toString();
            Log.d(TAG, "ConfigUpdateListener onUpdate: Keys=" + keysString);
            data.put("keys", keysString);
            data.put("success", 1.0);
        } else {
            Log.e(TAG, "ConfigUpdateListener onUpdate: ConfigUpdate is null");
            data.put("success", 0.0);
            data.put("error", "ConfigUpdate is null");
        }
        sendAsyncEvent("FirebaseRemoteConfig_AddOnConfigUpdateListener", data);
    }

    // </editor-fold>

	// <editor-fold desc="Application Lifecycle">

	@Override
	public void onDestroy() {
		super.onDestroy();
		shutdownExecutor();
	}

	// </editor-fold>

    // <editor-fold desc="Helper Methods">

    private Map<String, Object> jsonStringToMap(String jsonStr, final String methodName) {
        try {
            JSONObject json = new JSONObject(jsonStr);
            return jsonObjectToMap(json);
        } catch (JSONException e) {
            Log.e(TAG, methodName + " :: Error parsing JSON: " + e.getMessage());
            return new HashMap<>();
        }
    }

    private Map<String, Object> jsonObjectToMap(JSONObject jsonObject) throws JSONException {
        Map<String, Object> map = new HashMap<>();
        Iterator<String> keysItr = jsonObject.keys();
        while (keysItr.hasNext()) {
            String key = keysItr.next();
            Object value = jsonObject.get(key);

            if (value instanceof JSONArray) {
                value = jsonArrayToList((JSONArray) value);
            } else if (value instanceof JSONObject) {
                value = jsonObjectToMap((JSONObject) value);
            }
            map.put(key, value);
        }
        return map;
    }

    private List<Object> jsonArrayToList(JSONArray jsonArray) throws JSONException {
        List<Object> list = new ArrayList<>();
        for (int i = 0; i < jsonArray.length(); i++) {
            Object value = jsonArray.get(i);
            if (value instanceof JSONArray) {
                value = jsonArrayToList((JSONArray) value);
            } else if (value instanceof JSONObject) {
                value = jsonObjectToMap((JSONObject) value);
            }
            list.add(value);
        }
        return list;
    }

    // Helper method to send asynchronous events
    private void sendAsyncEvent(String eventType, Map<String, Object> data) {
        int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
        RunnerJNILib.DsMapAddString(dsMapIndex, "type", eventType);
        if (data != null) {
            for (Map.Entry<String, Object> entry : data.entrySet()) {
                String key = entry.getKey();
                Object value = entry.getValue();
                if (value instanceof String) {
                    RunnerJNILib.DsMapAddString(dsMapIndex, key, (String) value);
                } else if (value instanceof Double) {
                    RunnerJNILib.DsMapAddDouble(dsMapIndex, key, (Double) value);
                } else if (value instanceof Integer) {
                    RunnerJNILib.DsMapAddDouble(dsMapIndex, key, ((Integer) value).doubleValue());
                } else if (value instanceof Boolean) {
                    RunnerJNILib.DsMapAddDouble(dsMapIndex, key, (Boolean) value ? 1.0 : 0.0);
                } else if (value instanceof Long) {
                    RunnerJNILib.DsMapAddDouble(dsMapIndex, key, ((Long) value).doubleValue());
                } else if (value instanceof Float) {
                    RunnerJNILib.DsMapAddDouble(dsMapIndex, key, ((Float) value).doubleValue());
                } else {
                    // Convert other types to String
                    RunnerJNILib.DsMapAddString(dsMapIndex, key, value.toString());
                }
            }
        }
        RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
    }

    public void shutdownExecutor() {
		try {
			executorService.shutdown();
			Log.d(TAG, "ExecutorService shutdown initiated.");
		} catch (Exception e) {
			Log.e(TAG, "Error shutting down ExecutorService: " + e.getMessage());
		}
    }

    // </editor-fold>
}
