package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import ${YYAndroidPackageName}.FirebaseUtils;

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

public class YYFirebaseRemoteConfig extends RunnerSocial implements ConfigUpdateListener {

    private static final String LOG_TAG = "YYFirebaseRemoteConfig";

    // Error Codes
    public static final double FIREBASE_REMOTE_CONFIG_SUCCESS = 0.0;
    public static final double FIREBASE_REMOTE_CONFIG_ERROR_UNSUPPORTED = -1.0;

    private FirebaseRemoteConfig remoteConfig;
    private boolean updateListenerEnabled = false;

    public YYFirebaseRemoteConfig() {
        // Get the application context
        remoteConfig = FirebaseRemoteConfig.getInstance();
    }

    // <editor-fold desc="Setup">

    public double FirebaseRemoteConfig_Initialize(double seconds) {
        FirebaseRemoteConfigSettings configSettings = new FirebaseRemoteConfigSettings.Builder()
                .setMinimumFetchIntervalInSeconds((long) seconds)
                .build();
        remoteConfig.setConfigSettingsAsync(configSettings);
        return FIREBASE_REMOTE_CONFIG_SUCCESS;
    }

    // </editor-fold>

    // <editor-fold desc="Remote Config Methods">

    public double FirebaseRemoteConfig_FetchAndActivate() {
        remoteConfig.fetchAndActivate()
                .addOnCompleteListener(new OnCompleteListener<Boolean>() {
                    @Override
                    public void onComplete(@NonNull Task<Boolean> task) {
                        Map<String, Object> data = new HashMap<>();
                        if (task.isSuccessful()) {
                            boolean updated = task.getResult();
                            data.put("success", updated ? 1.0 : 0.0);
                        } else {
                            data.put("success", 0.0);
                            Exception e = task.getException();
                            if (e != null) {
                                String errorMessage = e.getMessage();
                                data.put("error", errorMessage);
                            } else {
                                data.put("error", "Failed with unknown error");
                            }
                        }
                        FirebaseUtils.sendSocialAsyncEvent("FirebaseRemoteConfig_FetchAndActivate", data);
                    }
                });
        return FIREBASE_REMOTE_CONFIG_SUCCESS;
    }

    public double FirebaseRemoteConfig_Reset() {
        remoteConfig.reset()
                .addOnCompleteListener(new OnCompleteListener<Void>() {
                    @Override
                    public void onComplete(@NonNull Task<Void> task) {
                        Map<String, Object> data = new HashMap<>();
                        if (task.isSuccessful()) {
                            data.put("success", 1.0);
                        } else {
                            data.put("success", 0.0);
                            Exception e = task.getException();
                            if (e != null) {
                                String errorMessage = e.getMessage();
                                data.put("error", errorMessage);
                            } else {
                                data.put("error", "Failed with unknown error");
                            }
                        }
                        FirebaseUtils.sendSocialAsyncEvent("FirebaseRemoteConfig_Reset", data);
                    }
                });
        return FIREBASE_REMOTE_CONFIG_SUCCESS;
    }

    public double FirebaseRemoteConfig_SetDefaultsAsync(final String json) {
        // Offload JSON parsing to background thread

        final String methodName = "FirebaseRemoteConfig_SetDefaultsAsync";

        FirebaseUtils.getInstance().submitAsyncTask(new Runnable() {
            @Override
            public void run() {
                final Map<String, Object> defaultsMap = jsonStringToMap(json, methodName);
                if (defaultsMap.isEmpty()) {
                    Log.e(LOG_TAG, "SetDefaultsAsync failed: Invalid JSON");
                    Map<String, Object> data = new HashMap<>();
                    data.put("success", 0.0);
                    data.put("error", "Invalid JSON");
                    FirebaseUtils.sendSocialAsyncEvent(methodName, data);
                    return;
                }

                remoteConfig.setDefaultsAsync(defaultsMap)
                        .addOnCompleteListener(new OnCompleteListener<Void>() {
                            @Override
                            public void onComplete(@NonNull Task<Void> task) {
                                Map<String, Object> data = new HashMap<>();
                                if (task.isSuccessful()) {
                                    data.put("success", 1.0);
                                } else {
                                    data.put("success", 0.0);
                                    Exception e = task.getException();
                                    if (e != null) {
                                        String errorMessage = e.getMessage();
                                        data.put("error", errorMessage);
                                    } else {
                                        data.put("error", "Failed with unknown error");
                                    }
                                }
                                FirebaseUtils.sendSocialAsyncEvent(methodName, data);
                            }
                        });
            }
        });
        return FIREBASE_REMOTE_CONFIG_SUCCESS;
    }

    public String FirebaseRemoteConfig_GetKeys() {
        Map<String, FirebaseRemoteConfigValue> map = remoteConfig.getAll();
        JSONArray jsonArray = new JSONArray();
        for (String key : map.keySet()) {
            jsonArray.put(key);
        }
        String keysString = jsonArray.toString();
        return keysString;
    }

    public String FirebaseRemoteConfig_GetString(String key) {
        if (remoteConfig.getKeysByPrefix(key).isEmpty()) {
            Log.w(LOG_TAG, "FirebaseRemoteConfig_GetString: Key not found - " + key);
        }
        String value = remoteConfig.getString(key);
        return value;
    }

    public double FirebaseRemoteConfig_GetDouble(String key) {
        if (remoteConfig.getKeysByPrefix(key).isEmpty()) {
            Log.w(LOG_TAG, "FirebaseRemoteConfig_GetDouble: Key not found - " + key);
        }
        double value = remoteConfig.getDouble(key);
        return value;
    }

    public double FirebaseRemoteConfig_AddOnConfigUpdateListener() {
        remoteConfig.addOnConfigUpdateListener(this);
        
        if (updateListenerEnabled) {
            Log.w(LOG_TAG, "FirebaseRemoteConfig_AddOnConfigUpdateListener :: Multiple listeners are not supported.");
            return FIREBASE_REMOTE_CONFIG_ERROR_UNSUPPORTED;
        }
        
        updateListenerEnabled = true;
        return FIREBASE_REMOTE_CONFIG_SUCCESS;
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
            Log.e(LOG_TAG, "ConfigUpdateListener onError: " + errorMessage);
        } else {
            Log.e(LOG_TAG, "ConfigUpdateListener onError: Unknown error");
        }
        FirebaseUtils.sendSocialAsyncEvent("FirebaseRemoteConfig_AddOnConfigUpdateListener", data);
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
            data.put("keys", keysString);
            data.put("success", 1.0);
        } else {
            Log.e(LOG_TAG, "ConfigUpdateListener onUpdate: ConfigUpdate is null");
            data.put("success", 0.0);
            data.put("error", "ConfigUpdate is null");
        }
        FirebaseUtils.sendSocialAsyncEvent("FirebaseRemoteConfig_AddOnConfigUpdateListener", data);
    }

    // </editor-fold>

    // <editor-fold desc="Helper Methods">

    private Map<String, Object> jsonStringToMap(String jsonStr, final String methodName) {
        try {
            JSONObject json = new JSONObject(jsonStr);
            return jsonObjectToMap(json);
        } catch (JSONException e) {
            Log.e(LOG_TAG, methodName + " :: Error parsing JSON: " + e.getMessage());
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

    // </editor-fold>
}
