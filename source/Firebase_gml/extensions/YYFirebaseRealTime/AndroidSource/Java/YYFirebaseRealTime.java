package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import ${YYAndroidPackageName}.ListenerIDGenerator;
import com.yoyogames.runner.RunnerJNILib;

import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.ValueEventListener;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.Query;

import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.HashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import android.util.Log;
import android.app.Activity;

public class YYFirebaseRealTime extends RunnerSocial {

    private static final int EVENT_SOCIAL = 70;
    private static final long MAX_DOUBLE_SAFE = 9007199254740992L; // 2^53
    public static Activity activity;

    private HashMap<Long, ValueEventListener> listenerMap;
    private HashMap<Long, DatabaseReference> referenceMap;
    private final ExecutorService executorService = Executors.newFixedThreadPool(Runtime.getRuntime().availableProcessors());

    public YYFirebaseRealTime() {
        listenerMap = new HashMap<>();
        referenceMap = new HashMap<>();
    }

    /**
     * Gracefully shuts down the ExecutorService.
     * Should be called when the instance is no longer needed to prevent memory leaks.
     */
    public void shutdown() {
        executorService.shutdown();
        try {
            if (!executorService.awaitTermination(60, TimeUnit.SECONDS)) {
                executorService.shutdownNow();
                if (!executorService.awaitTermination(60, TimeUnit.SECONDS)) {
                    Log.e("YYFirebaseRealTime", "ExecutorService did not terminate");
                }
            }
        } catch (InterruptedException ie) {
            executorService.shutdownNow();
            Thread.currentThread().interrupt();
        }
    }

    /**
     * Main SDK method to handle Firebase Real-Time actions based on the input JSON.
     *
     * @param fluentJson The JSON string containing the action and parameters.
     * @return The async ID as a double.
     */
    public double FirebaseRealTime_SDK(String fluentJson) {
        final long asyncId = getNextAsyncId();

        executorService.submit(() -> {
            JSONObject fluentObj;

            try {
                fluentObj = new JSONObject(fluentJson);
            } catch (JSONException e) {
                Log.e("YYFirebaseRealTime", "Invalid JSON input", e);
                sendDatabaseEvent("FirebaseRealTime_SDK_Error", asyncId, null, 400, Map.of("errorMessage", "Invalid JSON input"));
                return;
            }

            String action = fluentObj.optString("_action", null);
            if (action == null) {
                Log.e("YYFirebaseRealTime", "Action not specified in JSON");
                sendDatabaseEvent("FirebaseRealTime_SDK_Error", asyncId, null, 400, Map.of("errorMessage", "Action not specified in JSON"));
                return;
            }

            switch (action) {
                case "Set":
                    setValue(asyncId, fluentObj);
                    break;
                case "Read":
					readValue(asyncId, fluentObj);
					break;
                case "Listener":
                    listenValue(asyncId, fluentObj);
                    break;
                case "Exists":
                    existsValue(asyncId, fluentObj);
                    break;
                case "Delete":
                    deleteValue(asyncId, fluentObj);
                    break;
                case "ListenerRemove":
                    removeListener(asyncId, fluentObj);
                    break;
                case "ListenerRemoveAll":
                    removeAllListeners(asyncId);
                    break;
                default:
                    sendDatabaseEvent("FirebaseRealTime_SDK", asyncId, null, 400, Map.of("errorMessage", "Unknown action: " + action));
                    break;
            }
        });

        return (double) asyncId;
    }

    /**
     * Handles the "Set" action to write data to Firebase.
     *
	 * @param asyncId The unique async ID.
     * @param fluentObj The JSON object containing parameters.
     */
    private void setValue(final long asyncId, final JSONObject fluentObj) {
		Object value = fluentObj.opt("_value");
		String path = fluentObj.optString("_path", null);
		if (value instanceof String) {
			try {
				value = convertJsonObjectToMap(new JSONObject((String) value));
			} catch (JSONException e) {
				Map<String, Object> extraData = Map.of("errorMessage", "Invalid JSON in 'value'");
				sendDatabaseEvent("FirebaseRealTime_Set", asyncId, path, 400, extraData);
				return;
			} catch (Exception e) {
				Map<String, Object> extraData = Map.of("errorMessage", "Error parsing 'value' to Map");
				sendDatabaseEvent("FirebaseRealTime_Set", asyncId, path, 500, extraData);
				return;
			}
		}

		DatabaseReference reference = buildReference(fluentObj);
		reference.setValue(value, (error, ref) -> {
			int status = (error == null) ? 200 : mapDatabaseErrorToHttpStatus(error);
			Map<String, Object> extraData = (error != null) ? Map.of("errorMessage", error.getMessage()) : null;

			sendDatabaseEvent("FirebaseRealTime_Set", asyncId, path, status, extraData);
		});
    }

    /**
     * Handles the "Read" action to read data from Firebase.
     *
	 * @param asyncId The unique async ID.
     * @param fluentObj The JSON object containing parameters.
     */
    private void readValue(final long asyncId, final JSONObject fluentObj) {
		ValueEventListener eventListener = createValueEventListener("FirebaseRealTime_Read", asyncId, fluentObj.optString("_path", null));

		DatabaseReference dataRef = buildReference(fluentObj);
		Query query = buildQuery(fluentObj, dataRef);

		query.addListenerForSingleValueEvent(eventListener);
    }

    /**
     * Handles the "Listener" action to listen for data changes in Firebase.
     *
	 * @param asyncId The unique async ID.
     * @param fluentObj The JSON object containing parameters.
     */
    private long listenValue(final long asyncId, final JSONObject fluentObj) {
		ValueEventListener eventListener = createValueEventListener("FirebaseRealTime_Listener", asyncId, fluentObj.optString("_path", null));

		DatabaseReference dataRef = buildReference(fluentObj);
		Query query = buildQuery(fluentObj, dataRef);

		listenerMap.put(asyncId, eventListener);
        referenceMap.put(asyncId, dataRef);

		query.addValueEventListener(eventListener);
    }

	/**
     * Creates a new ValueEventListener for listening data changes in Firebase.
     *
     * @param eventType The type of event.
     * @param asyncId The unique async ID.
     * @param path The Firebase database path related to the event.
     */
	private ValueEventListener createValueEventListener(final String eventType, final long asyncId, final String path) {
		return new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                Map<String, Object> extraData = new HashMap<>();

                if (dataSnapshot.exists()) {
                    Object dataValue = dataSnapshot.getValue();
                    if (dataValue instanceof Boolean || dataValue instanceof Number) {
                        extraData.put("value", ((Number) dataValue).doubleValue());
                    } else if (dataValue instanceof String) {
                        extraData.put("value", dataValue);
                    } else if (dataValue instanceof Map) {
                        extraData.put("value", convertMapToJsonString((Map<String, Object>) dataValue));
                    } else if (dataValue instanceof List) {
                        extraData.put("value", convertListToJsonString((List<Object>) dataValue));
                    } else {
                        extraData.put("value", String.valueOf(dataValue));
                    }
                }

                sendDatabaseEvent(eventType, asyncId, path, 200, extraData);
            }

            @Override
            public void onCancelled(DatabaseError error) {
                Map<String, Object> extraData = Map.of("errorMessage", error.getMessage());

                sendDatabaseEvent("FirebaseRealTime_Listener", asyncId, path, mapDatabaseErrorToHttpStatus(error), extraData);
            }
        };
	}

    /**
     * Handles the "Delete" action to remove data from Firebase.
     *
	 * @param asyncId The unique async ID.
     * @param fluentObj The JSON object containing parameters.
     */
    private void deleteValue(final long asyncId, final JSONObject fluentObj) {
		DatabaseReference ref = buildReference(fluentObj);
		ref.removeValue((error, ref1) -> {
			int status = (error == null) ? 200 : mapDatabaseErrorToHttpStatus(error);
			Map<String, Object> extraData = (error != null) ? Map.of("errorMessage", error.getMessage()) : null;

			sendDatabaseEvent("FirebaseRealTime_Delete", asyncId, fluentObj.optString("_path", null), status, extraData);
		});
    }

    /**
     * Handles the "Exists" action to check data existence in Firebase.
     *
	 * @param asyncId The unique async ID.
     * @param fluentObj The JSON object containing parameters.
     */
    private void existsValue(final long asyncId, final JSONObject fluentObj) {
		String path = fluentObj.optString("_path", null);
		DatabaseReference ref = buildReference(fluentObj);
		ref.addListenerForSingleValueEvent(new ValueEventListener() {
			@Override
			public void onDataChange(DataSnapshot dataSnapshot) {
				Map<String, Object> extraData = Map.of("value", dataSnapshot.exists() ? 1.0 : 0.0);
				sendDatabaseEvent("FirebaseRealTime_Exists", asyncId, path, 200, extraData);
			}

			@Override
			public void onCancelled(DatabaseError error) {
				Map<String, Object> extraData = Map.of("errorMessage", error.getMessage());
				sendDatabaseEvent("FirebaseRealTime_Exists", asyncId, path, mapDatabaseErrorToHttpStatus(error), extraData);
			}
		});
    }

    /**
     * Handles the "ListenerRemove" action to remove a specific Firebase listener.
     *
	 * @param asyncId The unique async ID.
     * @param fluentObj The JSON object containing parameters.
     */
    private void removeListener(final long asyncId, JSONObject fluentObj) {
		long listenerToRemove = fluentObj.optLong("_value", -1L);
		long path = fluentObj.optString("_path", null);
		if (listenerToRemove == -1L) {
			Map<String, Object> extraData = Map.of("errorMessage", "Unable to extract listener id.");
			sendDatabaseEvent("FirebaseRealTime_RemoveListener", -1L, path, 400, extraData);
			return;
		}

		DatabaseReference dataRef = referenceMap.remove(listenerToRemove);
		ValueEventListener listener = listenerMap.remove(listenerToRemove);

		if (dataRef != null && listener != null) {
			dataRef.removeEventListener(listenerToRemove);
			Map<String, Object> extraData = Map.of("value", listenerToRemove);
			endDatabaseEvent("FirebaseRealTime_RemoveListener", asyncId, path, 200, extraData);
		} else {
			Map<String, Object> extraData = Map.of("errorMessage", "Listener or DatabaseReference not found for ID: " + listenerToRemove);
			sendDatabaseEvent("FirebaseRealTime_RemoveListener", asyncId, path, 400, extraData);
		}
    }

    /**
     * Handles the "ListenerRemoveAll" action to remove all Firebase listeners.
     */
    private void removeAllListeners(final long asyncId) {
		List<Object> removedListeners = new List<>();

		for (Long listenerToRemove : referenceMap.keySet()) {
			DatabaseReference dataRef = referenceMap.get(listenerToRemove);
			ValueEventListener listener = listenerMap.get(listenerToRemove);
			if (dataRef != null && listener != null) {
				dataRef.removeEventListener(listenerToRemove);
				removedListeners.add(listener);
			}
		}
		listenerMap.clear();
		referenceMap.clear();

		Map<String, Object> extraData = Map.of("values", convertListToJsonString(removedListeners));
		endDatabaseEvent("FirebaseRealTime_RemoveListener", asyncId, null, 200, extraData);
    }

    /**
     * Generates the next unique async ID using ListenerIDGenerator.
     *
     * @return The next async ID as a long.
     */
    private long getNextAsyncId() {
        return ListenerIDGenerator.getInstance().getNextListenerId();
    }

    /**
     * Creates a DatabaseReference based on the provided JSON parameters.
     *
     * @param fluentObj The JSON object containing parameters.
     * @return The constructed DatabaseReference.
     */
    private DatabaseReference buildReference(JSONObject fluentObj) {
        DatabaseReference dataRef;
        if (fluentObj.isNull("_database")) {
            dataRef = FirebaseDatabase.getInstance().getReference();
        } else {
            String databaseUrl = fluentObj.optString("_database", null);
            if (databaseUrl != null) {
                dataRef = FirebaseDatabase.getInstance(databaseUrl).getReference();
            } else {
                dataRef = FirebaseDatabase.getInstance().getReference();
            }
        }

        String path = fluentObj.optString("_path", null);
        if (path != null) {
            dataRef = dataRef.child(path);
        }

        boolean push = fluentObj.optBoolean("_push", false);
        if (push) {
            dataRef = dataRef.push();
        }

        return dataRef;
    }

    /**
     * Constructs a Firebase Query based on the provided JSON parameters and DatabaseReference.
     *
     * @param fluentObj The JSON object containing query parameters.
     * @param dataRef   The DatabaseReference to build the query from.
     * @return The constructed Query.
     */
    private Query buildQuery(JSONObject fluentObj, DatabaseReference dataRef) {
        Query query = dataRef;

        String orderBy = fluentObj.optString("_OrderBy", null);
        if (orderBy != null) {
            switch (orderBy) {
                case "key":
                    query = query.orderByKey();
                    break;
                case "value":
                    query = query.orderByValue();
                    break;
                default:
                    query = query.orderByChild(orderBy);
                    break;
            }
        }

        Object startValue = fluentObj.opt("_StartValue");
        if (startValue != null) {
            if (startValue instanceof String) {
                query = query.startAt((String) startValue);
            } else if (startValue instanceof Number) {
                query = query.startAt(((Number) startValue).doubleValue());
            }
        }

        Object endValue = fluentObj.opt("_EndValue");
        if (endValue != null) {
            if (endValue instanceof String) {
                query = query.endAt((String) endValue);
            } else if (endValue instanceof Number) {
                query = query.endAt(((Number) endValue).doubleValue());
            }
        }

        Object equalTo = fluentObj.opt("_EqualTo");
        if (equalTo != null) {
            if (equalTo instanceof String) {
                query = query.equalTo((String) equalTo);
            } else if (equalTo instanceof Number) {
                query = query.equalTo(((Number) equalTo).doubleValue());
            }
        }

        int limitKind = fluentObj.optInt("_LimitKind", -1);
        int limitValue = fluentObj.optInt("_LimitValue", -1);
        if (limitKind != -1 && limitValue != -1) {
            switch (limitKind) {
                case 0:
                    query = query.limitToFirst(limitValue);
                    break;
                case 1:
                    query = query.limitToLast(limitValue);
                    break;
                default:
                    break;
            }
        }

        return query;
    }

    /**
     * Converts a Map to a JSON string.
     *
     * @param map The Map to convert.
     * @return The JSON string representation of the map.
     */
    private static String convertMapToJsonString(Map<String, Object> map) {
        try {
            return new JSONObject(map).toString();
        } catch (Exception e) {
            Log.e("YYFirebaseRealTime", "Error converting map to JSON", e);
            return "{}";
        }
    }

    /**
     * Converts a List to a JSON string.
     *
     * @param list The List to convert.
     * @return The JSON string representation of the list.
     */
    private static String convertListToJsonString(List<Object> list) {
        try {
            JSONArray jsonArray = new JSONArray(list);
            return jsonArray.toString();
        } catch (Exception e) {
            Log.e("YYFirebaseRealTime", "Error converting list to JSON", e);
            return "[]";
        }
    }

    /**
     * Recursively converts a JSONObject to a Map.
     *
     * @param jsonObject The JSONObject to convert.
     * @return The resulting Map.
     * @throws Exception If an error occurs during conversion.
     */
    private static Map<String, Object> convertJsonObjectToMap(JSONObject jsonObject) throws Exception {
        Map<String, Object> map = new HashMap<>();
        Iterator<String> keysItr = jsonObject.keys();
        while (keysItr.hasNext()) {
            String key = keysItr.next();
            Object value = jsonObject.get(key);

            if (value instanceof JSONArray) {
                value = convertJsonArrayToList((JSONArray) value);
            } else if (value instanceof JSONObject) {
                value = convertJsonObjectToMap((JSONObject) value);
            }

            map.put(key, value);
        }
        return map;
    }

    /**
     * Recursively converts a JSONArray to a List.
     *
     * @param jsonArray The JSONArray to convert.
     * @return The resulting List.
     * @throws Exception If an error occurs during conversion.
     */
    private static List<Object> convertJsonArrayToList(JSONArray jsonArray) throws Exception {
        List<Object> list = new ArrayList<>();
        for (int i = 0; i < jsonArray.length(); i++) {
            Object value = jsonArray.get(i);
            if (value instanceof JSONArray) {
                value = convertJsonArrayToList((JSONArray) value);
            } else if (value instanceof JSONObject) {
                value = convertJsonObjectToMap((JSONObject) value);
            }
            list.add(value);
        }
        return list;
    }

    /**
     * Maps a Firebase DatabaseError to an appropriate HTTP status code.
     *
     * @param error The DatabaseError to map.
     * @return The corresponding HTTP status code as an int.
     */
    private int mapDatabaseErrorToHttpStatus(DatabaseError error) {
        switch (error.getCode()) {
            case DatabaseError.DISCONNECTED:
                return 400;
            case DatabaseError.EXPIRED_TOKEN:
            case DatabaseError.INVALID_TOKEN:
            case DatabaseError.PERMISSION_DENIED:
                return 401;
            case DatabaseError.MAX_RETRIES:
            case DatabaseError.NETWORK_ERROR:
            case DatabaseError.OPERATION_FAILED:
            case DatabaseError.OVERRIDDEN_BY_SET:
            case DatabaseError.UNKNOWN_ERROR:
            case DatabaseError.USER_CODE_EXCEPTION:
            case DatabaseError.WRITE_CANCELED:
                return 400;
            case DatabaseError.UNAVAILABLE:
                return 503;
            default:
                return 400;
        }
    }

    /**
     * Sends an asynchronous event to the game engine.
     *
     * @param eventType The type of event.
     * @param data      The data map containing event details.
     */
    private void sendAsyncEvent(String eventType, Map<String, Object> data) {
        RunnerActivity.CurrentActivity.runOnUiThread(() -> {
            int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
            RunnerJNILib.DsMapAddString(dsMapIndex, "type", eventType);
            if (data != null) {
                for (Map.Entry<String, Object> entry : data.entrySet()) {
                    String key = entry.getKey();
                    Object value = entry.getValue();
                    if (value instanceof String) {
                        RunnerJNILib.DsMapAddString(dsMapIndex, key, (String) value);
                    } else if (value instanceof Double || value instanceof Integer || value instanceof Float || value instanceof Boolean) {
                        // Convert Boolean to double (1.0 or 0.0)
                        double doubleValue;
                        if (value instanceof Boolean) {
                            doubleValue = (Boolean) value ? 1.0 : 0.0;
                        } else if (value instanceof Integer) {
                            doubleValue = ((Integer) value).doubleValue();
                        } else if (value instanceof Float) {
                            doubleValue = ((Float) value).doubleValue();
                        } else { // Double
                            doubleValue = (Double) value;
                        }
                        RunnerJNILib.DsMapAddDouble(dsMapIndex, key, doubleValue);
                    } else if (value instanceof Long) {
                        long longValue = (Long) value;
                        if (Math.abs(longValue) <= MAX_DOUBLE_SAFE) {
                            RunnerJNILib.DsMapAddDouble(dsMapIndex, key, (double) longValue);
                        } else {
                            String formattedLong = String.format("@i64@%016x$i64$", longValue);
                            RunnerJNILib.DsMapAddString(dsMapIndex, key, formattedLong);
                        }
                    } else {
                        // Convert other types to String
                        RunnerJNILib.DsMapAddString(dsMapIndex, key, value.toString());
                    }
                }
            }
            RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_SOCIAL);
        });
    }

    /**
     * Sends a database event by assembling common data and delegating to sendAsyncEvent.
     *
     * @param eventType The type of event.
     * @param asyncId The unique async ID.
     * @param path The Firebase database path related to the event.
     * @param status The HTTP status code representing the result.
     * @param extraData Additional data to include in the event.
     */
    private void sendDatabaseEvent(String eventType, long asyncId, String path, int status, Map<String, Object> extraData) {
        Map<String, Object> data = new HashMap<>();
        data.put("listener", asyncId);
        if (path != null) {
            data.put("path", path);
        }
        data.put("status", status);

        if (extraData != null) {
            data.putAll(extraData);
        }

        sendAsyncEvent(eventType, data);
    }
}
