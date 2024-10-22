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

    // Action types
    private static final int ACTION_SET = 0;
    private static final int ACTION_READ = 1;
    private static final int ACTION_LISTEN = 2;
    private static final int ACTION_EXISTS = 3;
    private static final int ACTION_DELETE = 4;
    private static final int ACTION_LISTENER_REMOVE = 5;
    private static final int ACTION_LISTENER_REMOVE_ALL = 6;

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
                sendErrorEvent("FirebaseRealTime_SDK", asyncId, null, 400, "Invalid JSON input");
                return;
            }

            int action = fluentObj.optInt("action", -1);
            if (action == -1) {
                Log.e(LOG_TAG, "Action not specified in JSON");
                sendErrorEvent("FirebaseRealTime_SDK", asyncId, null, 400, "Action not specified in JSON.");
                return;
            }

            switch (action) {
                case ACTION_SET:
                    setValue(asyncId, fluentObj);
                    break;
                case ACTION_READ:
					readValue(asyncId, fluentObj);
					break;
                case ACTION_LISTEN:
                    listenValue(asyncId, fluentObj);
                    break;
                case ACTION_EXISTS:
                    existsValue(asyncId, fluentObj);
                    break;
                case ACTION_DELETE:
                    deleteValue(asyncId, fluentObj);
                    break;
                case ACTION_LISTENER_REMOVE:
                    removeListener(asyncId, fluentObj);
                    break;
                case ACTION_LISTENER_REMOVE_ALL:
                    removeAllListeners(asyncId);
                    break;
                default:
                    sendErrorEvent("FirebaseRealTime_SDK", asyncId, null, 400, "Unknown action: " + action);
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
            if (error != null) {
                sendErrorEvent("FirebaseRealTime_Set", asyncId, path, error);
            } else {
                sendDatabaseEvent("FirebaseRealTime_Set", asyncId, path, 200, null);
            }
		});
    }

    /**
     * Handles the "Read" action to read data from Firebase.
     *
	 * @param asyncId The unique async ID.
     * @param fluentObj The JSON object containing parameters.
     */
    private void readValue(final long asyncId, final JSONObject fluentObj) {
		DatabaseReference dataRef = buildReference(fluentObj);
		Query query = buildQuery(asyncId, "FirebaseRealTime_Read", fluentObj, dataRef);

        if (query == null) return;

        ValueEventListener eventListener = createValueEventListener("FirebaseRealTime_Read", asyncId, fluentObj.optString("path", null));
		query.addListenerForSingleValueEvent(eventListener);
    }

    /**
     * Handles the "Listener" action to listen for data changes in Firebase.
     *
	 * @param asyncId The unique async ID.
     * @param fluentObj The JSON object containing parameters.
     */
    private void listenValue(final long asyncId, final JSONObject fluentObj) {
		DatabaseReference reference = buildReference(fluentObj);
		Query query = buildQuery(asyncId, "FirebaseRealTime_Listener", fluentObj, reference);

        if (query == null) return;

        ValueEventListener eventListener = createValueEventListener("FirebaseRealTime_Listener", asyncId, fluentObj.optString("path", null));

		listenerMap.put(asyncId, eventListener);
        referenceMap.put(asyncId, reference);

		query.addValueEventListener(eventListener);
    }

    /**
     * Handles the "Delete" action to remove data from Firebase.
     *
	 * @param asyncId The unique async ID.
     * @param fluentObj The JSON object containing parameters.
     */
    private void deleteValue(final long asyncId, final JSONObject fluentObj) {
        final String path = fluentObj.optString("path", null);
		final DatabaseReference reference = buildReference(fluentObj);
		reference.removeValue((error, ref) -> {
            if (error != null) {
                sendErrorEvent("FirebaseRealTime_Delete", asyncId, path, error);
            } else {
                sendDatabaseEvent("FirebaseRealTime_Delete", asyncId, path, 200, null);
            }
		});
    }

    /**
     * Handles the "Exists" action to check data existence in Firebase.
     *
	 * @param asyncId The unique async ID.
     * @param fluentObj The JSON object containing parameters.
     */
    private void existsValue(final long asyncId, final JSONObject fluentObj) {
		final String path = fluentObj.optString("path", null);
		final DatabaseReference reference = buildReference(fluentObj);
		reference.addListenerForSingleValueEvent(new ValueEventListener() {
			@Override
			public void onDataChange(DataSnapshot dataSnapshot) {
				Map<String, Object> extraData = Map.of("value", dataSnapshot.exists() ? 1.0 : 0.0);
				sendDatabaseEvent("FirebaseRealTime_Exists", asyncId, path, 200, extraData);
			}

			@Override
			public void onCancelled(DatabaseError error) {
                sendErrorEvent("FirebaseRealTime_Exists", asyncId, path, error);
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
		if (listenerToRemove == -1L) {
			sendErrorEvent("FirebaseRealTime_RemoveListener", asyncId, null, 400, "Unable to extract listener id.");
			return;
		}

		DatabaseReference dataRef = referenceMap.remove(listenerToRemove);
		ValueEventListener listener = listenerMap.remove(listenerToRemove);

		if (dataRef != null && listener != null) {
			dataRef.removeEventListener(listener);
			Map<String, Object> extraData = Map.of("value", listenerToRemove);
			sendDatabaseEvent("FirebaseRealTime_RemoveListener", asyncId, null, 200, extraData);
		} else {
			sendErrorEvent("FirebaseRealTime_RemoveListener", asyncId, null, 400, "Listener or DatabaseReference not found for ID: " + listenerToRemove);
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

		Map<String, Object> extraData = Map.of("values", removedListeners);
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
                sendErrorEvent(eventType, asyncId, path, error);
            }
        };
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

        String orderBy = fluentObj.optString("orderBy", null);
        if (orderBy != null) {
            switch (orderBy) {
                case "$key":
                    query = query.orderByKey();
                    break;
                case "$value":
                    query = query.orderByValue();
                    break;
                case "$priority":
                    query = query.orderByPriority();
                    break;
                default:
                    query = query.orderByChild(orderBy);
                    break;
            }
        }

        // You can only use one of these (equalTo or <range>)
        if (!fluentObj.isNull("equalTo")) {
            Object equalTo = fluentObj.opt("equalTo");
            if (equalTo instanceof String) {
                query = query.equalTo((String) equalTo);
            } else if (equalTo instanceof Boolean) {
                query = query.equalTo(((Boolean) equalTo));
            } else if (equalTo instanceof Number) {
                query = query.equalTo(((Number) equalTo).doubleValue());
            }
        } else {
            // You can only use one of these (startAt or startAfter)
            if (!fluentObj.isNull("startAt")) {
                Object startValue = fluentObj.opt("startAt");
                if (startValue instanceof String) {
                    query = query.startAt((String) startValue);
                } else if (startValue instanceof Boolean) {
                    query = query.startAt(((Boolean) startValue));
                } else if (startValue instanceof Number) {
                    query = query.startAt(((Number) startValue).doubleValue());
                }
            }
            else if (!fluentObj.isNull("startAfter")) {
                Object startValue = fluentObj.opt("startAfter");
                if (startValue instanceof String) {
                    query = query.startAfter((String) startValue);
                } else if (startValue instanceof Boolean) {
                    query = query.startAfter(((Boolean) startValue));
                } else if (startValue instanceof Number) {
                    query = query.startAfter(((Number) startValue).doubleValue());
                }
            }

            // You can only use one of these (endAt or endBefore)
            if (!fluentObj.isNull("endAt")) {
                Object endValue = fluentObj.opt("endAt");
                if (endValue instanceof String) {
                    query = query.endAt((String) endValue);
                } else if (endValue instanceof Boolean) {
                    query = query.endAt(((Boolean) endValue));
                } else if (endValue instanceof Number) {
                    query = query.endAt(((Number) endValue).doubleValue());
                }
            }
            else if (!fluentObj.isNull("endBefore")) {
                Object endValue = fluentObj.opt("endBefore");
                if (endValue instanceof String) {
                    query = query.endBefore((String) endValue);
                } else if (endValue instanceof Boolean) {
                    query = query.endBefore(((Boolean) endValue));
                } else if (endValue instanceof Number) {
                    query = query.endBefore(((Number) endValue).doubleValue());
                }
            }
        }

        int limitToFirst = fluentObj.optInt("limitToFirst", -1);
        if (limitToFirst != -1) {
            query = query.limitToFirst(limitToFirst);
        }

        int limitToLast = fluentObj.optInt("limitToLast", -1);
        if (limitToLast != -1) {
            query = query.limitToLast(limitToLast);
        }

        return query;
    }

    /**
     * Maps a Firebase DatabaseError to an appropriate HTTP status code.
     *
     * @param error The DatabaseError to map.
     * @return The corresponding HTTP status code as an int.
     */
    private int getStatusFromError(DatabaseError error) {
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
     * Sends a database event by assembling common data and delegating to sendSocialAsyncEvent.
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

        FirebaseUtils.sendSocialAsyncEvent(eventType, data);
    }

	private void sendErrorEvent(String eventType, long asyncId, String path, int status, String errorMessage) {
		Map<String, Object> data = new HashMap<>();
		data.put("errorMessage", errorMessage);
		sendDatabaseEvent(eventType, asyncId, path, status, data);
	}

	private void sendErrorEvent(String eventType, long asyncId, String path, DatabaseError databaseError) {
		Map<String, Object> data = new HashMap<>();
        int status = getStatusFromError(databaseError);
        sendErrorEvent(eventType, asyncId, path, status, databaseError.getMessage());
	}

}
