package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import ${YYAndroidPackageName}.FirebaseUtils;

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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import android.util.Log;
import android.app.Activity;

public class YYFirebaseRealTime extends RunnerSocial {

    private static final String LOG_TAG = "YYFirebaseRealTime";

    private HashMap<Long, ValueEventListener> listenerMap;
    private HashMap<Long, DatabaseReference> referenceMap;

    public YYFirebaseRealTime() {
        listenerMap = new HashMap<>();
        referenceMap = new HashMap<>();
    }

    /**
     * Main SDK method to handle Firebase Real-Time actions based on the input JSON.
     *
     * @param fluentJson The JSON string containing the action and parameters.
     * @return The async ID as a double.
     */
    public double FirebaseRealTime_SDK(String fluentJson) {
        final long asyncId = getNextAsyncId();

        FirebaseUtils.getInstance().submitAsyncTask(() -> {
            JSONObject fluentObj;

            try {
                fluentObj = new JSONObject(fluentJson);
            } catch (JSONException e) {
                Log.e(LOG_TAG, "Invalid JSON input", e);
                sendDatabaseEvent("FirebaseRealTime_SDK", asyncId, null, 400, Map.of("errorMessage", "Invalid JSON input"));
                return;
            }

            String action = fluentObj.optString("action", null);
            if (action == null) {
                Log.e(LOG_TAG, "Action not specified in JSON");
                sendDatabaseEvent("FirebaseRealTime_SDK", asyncId, null, 400, Map.of("errorMessage", "Action not specified in JSON"));
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
		Object value = fluentObj.opt("value");
		String path = fluentObj.optString("path", null);
		
        value = FirebaseUtils.convertJSON(value);

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
		ValueEventListener eventListener = createValueEventListener("FirebaseRealTime_Read", asyncId, fluentObj.optString("path", null));

		DatabaseReference dataRef = buildReference(fluentObj);
		Query query = buildQuery(asyncId, "FirebaseRealTime_Read", fluentObj, dataRef);

        if (query == null) return;

		query.addListenerForSingleValueEvent(eventListener);
    }

    /**
     * Handles the "Listener" action to listen for data changes in Firebase.
     *
	 * @param asyncId The unique async ID.
     * @param fluentObj The JSON object containing parameters.
     */
    private void listenValue(final long asyncId, final JSONObject fluentObj) {
		ValueEventListener eventListener = createValueEventListener("FirebaseRealTime_Listener", asyncId, fluentObj.optString("path", null));

		DatabaseReference dataRef = buildReference(fluentObj);
		Query query = buildQuery(asyncId, "FirebaseRealTime_Listener", fluentObj, dataRef);

        if (query == null) return;

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
                    if (dataValue instanceof List) {
                        if (dataSnapshot.hasChildren()) {
                            List<Object> list = new ArrayList<>();
                            for (DataSnapshot child : dataSnapshot.getChildren()) {
                                list.add(child.getValue());
                            }
                            dataValue = list;
                        }
                    }
                    extraData.put("value", dataValue);
                }

                sendDatabaseEvent(eventType, asyncId, path, 200, extraData);
            }

            @Override
            public void onCancelled(DatabaseError error) {
                Map<String, Object> extraData = Map.of("errorMessage", error.getMessage());
                sendDatabaseEvent(eventType, asyncId, path, mapDatabaseErrorToHttpStatus(error), extraData);
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

			sendDatabaseEvent("FirebaseRealTime_Delete", asyncId, fluentObj.optString("path", null), status, extraData);
		});
    }

    /**
     * Handles the "Exists" action to check data existence in Firebase.
     *
	 * @param asyncId The unique async ID.
     * @param fluentObj The JSON object containing parameters.
     */
    private void existsValue(final long asyncId, final JSONObject fluentObj) {
		String path = fluentObj.optString("path", null);
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
		long listenerToRemove = fluentObj.optLong("value", -1L);
		String path = fluentObj.optString("path", null);
		if (listenerToRemove == -1L) {
			Map<String, Object> extraData = Map.of("errorMessage", "Unable to extract listener id.");
			sendDatabaseEvent("FirebaseRealTime_RemoveListener", -1L, path, 400, extraData);
			return;
		}

		DatabaseReference dataRef = referenceMap.remove(listenerToRemove);
		ValueEventListener listener = listenerMap.remove(listenerToRemove);

		if (dataRef != null && listener != null) {
			dataRef.removeEventListener(listener);
			Map<String, Object> extraData = Map.of("value", listenerToRemove);
			sendDatabaseEvent("FirebaseRealTime_RemoveListener", asyncId, path, 200, extraData);
		} else {
			Map<String, Object> extraData = Map.of("errorMessage", "Listener or DatabaseReference not found for ID: " + listenerToRemove);
			sendDatabaseEvent("FirebaseRealTime_RemoveListener", asyncId, path, 400, extraData);
		}
    }

    /**
     * Handles the "ListenerRemoveAll" action to remove all Firebase listeners.
     */
    private void removeAllListeners(final long asyncId) {
		List<Object> removedListeners = new ArrayList<>();

		for (Long listenerToRemove : referenceMap.keySet()) {
			DatabaseReference dataRef = referenceMap.get(listenerToRemove);
			ValueEventListener listener = listenerMap.get(listenerToRemove);
			if (dataRef != null && listener != null) {
				dataRef.removeEventListener(listener);
				removedListeners.add(listenerToRemove);
			}
		}
		listenerMap.clear();
		referenceMap.clear();

		Map<String, Object> extraData = Map.of("values", convertListToJsonString(removedListeners));
		sendDatabaseEvent("FirebaseRealTime_RemoveListeners", asyncId, null, 200, extraData);
    }

    /**
     * Generates the next unique async ID using FirebaseUtils.
     *
     * @return The next async ID as a long.
     */
    private long getNextAsyncId() {
        return FirebaseUtils.getInstance().getNextAsyncId();
    }

    /**
     * Creates a DatabaseReference based on the provided JSON parameters.
     *
     * @param fluentObj The JSON object containing parameters.
     * @return The constructed DatabaseReference.
     */
    private DatabaseReference buildReference(JSONObject fluentObj) {
        DatabaseReference dataRef;
        if (fluentObj.isNull("database")) {
            dataRef = FirebaseDatabase.getInstance().getReference();
        } else {
            String databaseUrl = fluentObj.optString("database", null);
            if (databaseUrl != null) {
                dataRef = FirebaseDatabase.getInstance(databaseUrl).getReference();
            } else {
                dataRef = FirebaseDatabase.getInstance().getReference();
            }
        }

        String path = fluentObj.optString("path", null);
        if (path != null) {
            dataRef = dataRef.child(path);
        }

        boolean push = fluentObj.optBoolean("push", false);
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
    private Query buildQuery(final long asyncId, final String eventType, JSONObject fluentObj, DatabaseReference dataRef) {
        Query query = dataRef;

        JSONObject orderByObj = fluentObj.optJSONObject("order_by");
        if (orderByObj != null) {
            Iterator<String> keys = orderByObj.keys();
            String orderByType = keys.next();
            switch (orderByType) {
                case "key":
                    query = query.orderByKey();
                    break;
                case "value":
                    query = query.orderByValue();
                    break;
                case "child":
                    String childProp = orderByObj.optString("child", null);
                    if (childProp != null && !childProp.isEmpty()) {
                        query = query.orderByChild(childProp);
                    } else {
                        Log.w(LOG_TAG, "The 'child' key must have a non-empty value.");
                        sendDatabaseEvent(eventType, asyncId, null, 400, Map.of("errorMessage", "The 'child' key must have a non-empty value."));
                        return null;
                    }
                    break;
                default:
                    Log.w(LOG_TAG, "Unsupported order_by type: " + orderByType);
                    sendDatabaseEvent(eventType, asyncId, null, 400, Map.of("errorMessage", "Unsupported 'order_by' type."));
                    return null;
            }
        }

        if (!fluentObj.isNull("equal_to")) {
            Object equalTo = fluentObj.opt("equal_to");
            if (equalTo instanceof String) {
                query = query.equalTo((String) equalTo);
            } else if (equalTo instanceof Boolean) {
                query = query.equalTo(((Boolean) equalTo));
            } else if (equalTo instanceof Number) {
                query = query.equalTo(((Number) equalTo).doubleValue());
            }
        } else {
            // Check for range
            Object startValue = fluentObj.opt("start_at");
            if (startValue != null) {
                if (startValue instanceof String) {
                    query = query.startAt((String) startValue);
                } else if (startValue instanceof Boolean) {
                    query = query.startAt(((Boolean) startValue));
                } else if (startValue instanceof Number) {
                    query = query.startAt(((Number) startValue).doubleValue());
                }
            }

            Object endValue = fluentObj.opt("end_at");
            if (endValue != null) {
                if (endValue instanceof String) {
                    query = query.endAt((String) endValue);
                } else if (startValue instanceof Boolean) {
                    query = query.endAt(((Boolean) endValue));
                } else if (endValue instanceof Number) {
                    query = query.endAt(((Number) endValue).doubleValue());
                }
            }
        }
        

        int limitKind = fluentObj.optInt("limit_kind", -1);
        int limitValue = fluentObj.optInt("limit_value", -1);
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

        FirebaseUtils.sendAsyncEvent(eventType, data);
    }
}
