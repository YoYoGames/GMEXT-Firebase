package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import ${YYAndroidPackageName}.FirebaseUtils;

import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.firestore.DocumentReference;
import com.google.firebase.firestore.DocumentSnapshot;
import com.google.firebase.firestore.QuerySnapshot;
import com.google.firebase.firestore.ListenerRegistration;
import com.google.firebase.firestore.Query;
import com.google.firebase.firestore.EventListener;
import com.google.firebase.firestore.FirebaseFirestoreException;
import com.google.firebase.firestore.Query.Direction;

import com.google.android.gms.tasks.*;

import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

import java.util.Map;
import java.util.List;
import java.util.HashMap;
import java.util.ArrayList;

import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

public class YYFirebaseFirestore extends RunnerSocial {

	private static final String LOG_TAG = "YYFirebaseFirestore";

    private HashMap<Long, ListenerRegistration> listenerMap;
    private HashMap<Long, String> pathMap;

    public YYFirebaseFirestore() {
        listenerMap = new HashMap<>();
        pathMap = new HashMap<>();
    }

    // <editor-fold desc="Public API">

    // Action types
    private static final int ACTION_ADD = 0;
    private static final int ACTION_SET = 1;
    private static final int ACTION_UPDATE = 2;
    private static final int ACTION_READ = 3;
    private static final int ACTION_LISTEN = 4;
    private static final int ACTION_DELETE = 5;
    private static final int ACTION_QUERY = 6;
    private static final int ACTION_LISTENER_REMOVE = 7;
    private static final int ACTION_LISTENER_REMOVE_ALL = 8;

    public double FirebaseFirestore_SDK(String fluentJson) {

        final long asyncId = FirebaseUtils.getInstance().getNextAsyncId();

        FirebaseUtils.getInstance().submitAsyncTask(() -> {

            JSONObject fluentObj;
            try {
                fluentObj = new JSONObject(fluentJson);
            } catch (JSONException e) {
                Log.e(LOG_TAG, "Invalid JSON input", e);
                sendErrorEvent("FirebaseFirestore_SDK", asyncId, null, 400, "Invalid JSON input.");
                return;
            }

            int action = fluentObj.optInt("action", -1);
            if (action == -1) {
                Log.e(LOG_TAG, "Action not specified in JSON");
                sendErrorEvent("FirebaseFirestore_SDK", asyncId, null, 400, "Action not specified in JSON.");
                return;
            }

            boolean isDocument = fluentObj.optBoolean("isDocument", false);
            switch (action) {
                case ACTION_ADD:
                    if (isDocument) { 
                        sendErrorEvent("FirebaseFirestore_SDK", asyncId, null, 400, "You can't add to a document.");
                    } else {
                        collectionAdd(asyncId, fluentObj);
                    }
                    break;
                case ACTION_SET:
                    if (isDocument) { 
                        documentSet(asyncId, fluentObj);
                    } else {
                        sendErrorEvent("FirebaseFirestore_SDK", asyncId, null, 400, "You can't set a Collection.");
                    }
                    break;
                case ACTION_UPDATE:
                    if (isDocument) { 
                        documentUpdate(asyncId, fluentObj);
                    } else {
                        sendErrorEvent("FirebaseFirestore_SDK", asyncId, null, 400, "You can't update a Collection.");
                    }
                    break;
                case ACTION_READ:
                    if (isDocument) { 
                        documentGet(asyncId, fluentObj);
                    } else {
                        collectionGet(asyncId, fluentObj);
                    }
                    break;
                case ACTION_LISTEN:
                    if (isDocument) { 
                        documentListen(asyncId, fluentObj);
                    } else {
                        collectionListen(asyncId, fluentObj);
                    }
                    break;
                case ACTION_DELETE:
                    if (isDocument) { 
                        documentDelete(asyncId, fluentObj); 
                    } else { 
                        sendErrorEvent("FirebaseFirestore_SDK", asyncId, null, 400, "You can't delete a Collection.");
                    }
                    break;
                case ACTION_QUERY:
                    if (isDocument) {
                        sendErrorEvent("FirebaseFirestore_SDK", asyncId, null, 400, "You can't query documents.");
                    } else {
                        collectionQuery(asyncId, fluentObj);
                    }
                    break;
                case ACTION_LISTENER_REMOVE:
                    listenerRemove(asyncId, fluentObj);
                    break;
                case ACTION_LISTENER_REMOVE_ALL:
                    listenerRemoveAll(asyncId);
                    break;
                default:
                    sendErrorEvent("FirebaseFirestore_SDK", asyncId, null, 400, "Unknown action with code: " + action);
                    break;
            }
        });

        return (double) asyncId;
    }

    // </editor-fold>

    // <editor-fold desc="Collection API">
    
    private void collectionAdd(final long asyncId, final JSONObject fluentObj) {

		final String path = fluentObj.optString("path", null);
        if (!validatePath(path, "FirebaseFirestore_Collection_Add", asyncId)) {
            return;
        }

		Object value = fluentObj.optJSONObject("value");
		Map<String, Object> dataMap = (Map<String, Object>)FirebaseUtils.convertJSON(value);
        if (dataMap == null) {
            sendErrorEvent("FirebaseFirestore_Collection_Add", asyncId, path, 400, "Invalid value parameter.");
            return;
        }

        FirebaseFirestore.getInstance()
            .collection(path)
            .add(dataMap)
            .addOnCompleteListener(new OnCompleteListener<DocumentReference>() {
                @Override
                public void onComplete(@NonNull Task<DocumentReference> task) {
                    Map<String, Object> extraData = new HashMap<>();
                    if (task.isSuccessful()) {
                        sendFirestoreEvent("FirebaseFirestore_Collection_Add", asyncId, path, 200, null);
                    } else {
                        sendErrorEvent("FirebaseFirestore_Collection_Add", asyncId, path, task.getException());
                    }
                }
            });
    }

    private void collectionGet(final long asyncId, final JSONObject fluentObj) {
        final String path = fluentObj.optString("path", null);
        if (!validatePath(path, "FirebaseFirestore_Collection_Read", asyncId)) {
            return;
        }

		FirebaseFirestore.getInstance()
            .collection(path)
            .get()
            .addOnCompleteListener(new OnCompleteListener<QuerySnapshot>() {
                @Override
                public void onComplete(@NonNull Task<QuerySnapshot> task) {
                    if (task.isSuccessful()) {
                        Map<String, Object> extraData = new HashMap<>();
                        extraData.put("value", convertQuerySnapshotToMap(task.getResult()));
                        sendFirestoreEvent("FirebaseFirestore_Collection_Read", asyncId, path, 200, extraData);                        
                    } else {
                        sendErrorEvent("FirebaseFirestore_Collection_Read", asyncId, path, task.getException());
                    }
                    
                }
            });
    }

    private static final int QUERY_SORT_ASCN = 0;
    private static final int QUERY_SORT_DESC = 1;

    private void collectionQuery(final long asyncId, final JSONObject fluentObj) {
		final String path = fluentObj.optString("path", null);
        if (!validatePath(path, "FirebaseFirestore_Collection_Query", asyncId)) {
            return;
        }

        Query query = FirebaseFirestore.getInstance().collection(path);

        // Build query based on operations
		JSONArray operations = fluentObj.optJSONArray("operations");
        if (operations != null) {
            query = applyQueryOperations(query, operations, "FirebaseFirestore_Collection_Query", asyncId, path);
        }

		String orderBy = fluentObj.optString("orderBy", null);
		if (orderBy != null) {
			int sort = fluentObj.optInt("sort", QUERY_SORT_ASCN);
			if (sort != QUERY_SORT_ASCN) {
				switch (sort) {
					case QUERY_SORT_ASCN:
						query = query.orderBy(orderBy, Query.Direction.ASCENDING);
						break;
					case QUERY_SORT_DESC:
						query = query.orderBy(orderBy, Query.Direction.DESCENDING);
						break;
                    default:
                        query = query.orderBy(orderBy, Query.Direction.ASCENDING);
                        break;
				}
			} else {
				query = query.orderBy(orderBy);
			}
		}

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
        
        int limitToFirst = fluentObj.optInt("limitToFirst", -1);
        if (limitToFirst > 0) {
            query = query.limit(limitToFirst);
        }

        int limitToLast = fluentObj.optInt("limitToLast", -1);
        if (limitToLast > 0) {
            query = query.limitToLast(limitToLast);
        }

        query.get().addOnCompleteListener(new OnCompleteListener<QuerySnapshot>() {
            @Override
            public void onComplete(@NonNull Task<QuerySnapshot> task) {
                if (task.isSuccessful()) {
                    Map<String, Object> extraData = new HashMap<>();
                    extraData.put("value", convertQuerySnapshotToMap(task.getResult()));
                    sendFirestoreEvent("FirebaseFirestore_Collection_Query", asyncId, path, 200, extraData);
                } else {
                    sendErrorEvent("FirebaseFirestore_Collection_Query", asyncId, path, task.getException());
                }
                
            }
        });
    }

    private void collectionListen(final long asyncId, final JSONObject fluentObj) {
		final String path = fluentObj.optString("path", null);
        if (!validatePath(path, "FirebaseFirestore_Collection_Listener", asyncId)) {
            return;
        }

        if (pathMap.containsValue(path)) {
            sendErrorEvent("FirebaseFirestore_Collection_Listener", asyncId, path, 400, "Duplicate listener for specified path.");
            return;
        }

        ListenerRegistration listenerRegistration = FirebaseFirestore.getInstance()
            .collection(path)
            .addSnapshotListener(new EventListener<QuerySnapshot>() {
                @Override
                public void onEvent(@Nullable QuerySnapshot querySnapshot, @Nullable FirebaseFirestoreException error) {
                    if (querySnapshot == null || error != null) {
                        int status = getStatusFromException(error);
                        sendErrorEvent("FirebaseFirestore_Collection_Listener", asyncId, path, status, error != null ? error.getMessage() : "Unknown error");
                    } else {
                        Map<String, Object> extraData = new HashMap<>();
                        extraData.put("value", convertQuerySnapshotToMap(querySnapshot));
                        sendFirestoreEvent("FirebaseFirestore_Collection_Listener", asyncId, path, 200, extraData);
                    }
                    
                }
            });
		listenerMap.put(asyncId, listenerRegistration);
		pathMap.put(asyncId, path);
    }

    // </editor-fold>

    // <editor-fold desc="Document API">

    private void documentSet(final long asyncId, final JSONObject fluentObj) {
        final String path = fluentObj.optString("path", null);
        if (!validatePath(path, "FirebaseFirestore_Document_Set", asyncId)) {
            return;
        }

		Object value = fluentObj.optJSONObject("value");
		Map<String, Object> dataMap = (Map<String, Object>)FirebaseUtils.convertJSON(value);
        if (dataMap == null) {
            sendErrorEvent("FirebaseFirestore_Document_Set", asyncId, path, 400, "Invalid value parameter.");
            return;
        }

        FirebaseFirestore.getInstance()
            .document(path)
            .set(dataMap)
            .addOnCompleteListener(new OnCompleteListener<Void>() {
                @Override
                public void onComplete(@NonNull Task<Void> task) {
                    if (task.isSuccessful())
                        sendFirestoreEvent("FirebaseFirestore_Document_Set", asyncId, path, 200, null);
                    else {
                        sendErrorEvent("FirebaseFirestore_Document_Set", asyncId, path, task.getException());
                    }
                }
            });
    }

    private void documentUpdate(final long asyncId, final JSONObject fluentObj) {
		final String path = fluentObj.optString("path", null);
        if (!validatePath(path, "FirebaseFirestore_Document_Update", asyncId)) {
            return;
        }

		Object value = fluentObj.optJSONObject("value");
		Map<String, Object> dataMap = (Map<String, Object>)FirebaseUtils.convertJSON(value);
        if (dataMap == null) {
            sendErrorEvent("FirebaseFirestore_Document_Update", asyncId, path, 400, "Invalid value parameter.");
            return;
        }

        FirebaseFirestore.getInstance()
            .document(path)
            .update(dataMap)
            .addOnCompleteListener(new OnCompleteListener<Void>() {
                @Override
                public void onComplete(@NonNull Task<Void> task) {
                    if (task.isSuccessful())
                        sendFirestoreEvent("FirebaseFirestore_Document_Update", asyncId, path, 200, null);
                    else {
                        sendErrorEvent("FirebaseFirestore_Document_Update", asyncId, path, task.getException());
                    }
                }
            });
    }

    private void documentGet(final long asyncId, final JSONObject fluentObj) {
		final String path = fluentObj.optString("path", null);
        if (!validatePath(path, "FirebaseFirestore_Document_Read", asyncId)) {
            return;
        }

        FirebaseFirestore.getInstance()
            .document(path)
            .get()
            .addOnSuccessListener(new OnSuccessListener<DocumentSnapshot>() {
                @Override
                public void onSuccess(DocumentSnapshot documentSnapshot) {                  
                    if (documentSnapshot.exists()) {
                        Map<String, Object> extraData = new HashMap<>();
                        extraData.put("value", documentSnapshot.getData());
                        sendFirestoreEvent("FirebaseFirestore_Document_Read", asyncId, path, 200, extraData);
                    } else {
                        sendErrorEvent("FirebaseFirestore_Document_Read", asyncId, path, 404, "Document not found.");
                    }
                }
            }).addOnFailureListener(new OnFailureListener() {
                @Override
                public void onFailure(@NonNull Exception e) {
                    sendErrorEvent("FirebaseFirestore_Document_Read", asyncId, path, e);
                }
            });
    }

    private void documentDelete(final long asyncId, final JSONObject fluentObj) {
		final String path = fluentObj.optString("path", null);
        if (!validatePath(path, "FirebaseFirestore_Document_Delete", asyncId)) {
            return;
        }

        FirebaseFirestore.getInstance()
            .document(path)
            .delete()
            .addOnCompleteListener(new OnCompleteListener<Void>() {
                @Override
                public void onComplete(@NonNull Task<Void> task) {
                    if (task.isSuccessful())
                        sendFirestoreEvent("FirebaseFirestore_Document_Delete", asyncId, path, 200, null);
                    else {
                        sendErrorEvent("FirebaseFirestore_Document_Delete", asyncId, path, task.getException());
                    }
                }
            });
    }

    private void documentListen(final long asyncId, final JSONObject fluentObj) {
		final String path = fluentObj.optString("path", null);
        if (!validatePath(path, "FirebaseFirestore_Document_Listener", asyncId)) {
            return;
        }

        if (pathMap.containsValue(path)) {
            sendErrorEvent("FirebaseFirestore_Document_Listener", asyncId, path, 400, "Duplicate listener for specified path.");
            return;
        }

        ListenerRegistration listenerRegistration = FirebaseFirestore.getInstance()
            .document(path)
            .addSnapshotListener(new EventListener<DocumentSnapshot>() {
                @Override
                public void onEvent(@Nullable DocumentSnapshot documentSnapshot, @Nullable FirebaseFirestoreException e) {
                    int status;
                    Map<String, Object> extraData = new HashMap<>();
                    if (documentSnapshot == null || e != null) {
                        status = getStatusFromException(e);
                        extraData.put("errorMessage", e != null ? e.getMessage() : "Unknown error");
                    } else if (documentSnapshot.exists()) {
                        status = 200;
                        extraData.put("value", documentSnapshot.getData());
                    } else {
                        status = 404;
                        extraData.put("errorMessage", "DOCUMENT NOT FOUND");
                    }
                    sendFirestoreEvent("FirebaseFirestore_Document_Listener", asyncId, path, status, extraData);
                }
            });

		listenerMap.put(asyncId, listenerRegistration);
        pathMap.put(asyncId, path);
    }

    // </editor-fold>

    // <editor-fold desc="Listener API">

    private void listenerRemove(final long asyncId, final JSONObject fluentObj) {

		long listenerToRemove = fluentObj.optLong("value", -1L);
		if (listenerToRemove == -1L) {
			sendErrorEvent("FirebaseFirestore_RemoveListener", -1L, null, 400, "Unable to extract listener id.");
			return;
		}

		ListenerRegistration registration = listenerMap.remove(listenerToRemove);
		String path = pathMap.remove(listenerToRemove);

		if (registration != null) {
			registration.remove();
			sendFirestoreEvent("FirebaseFirestore_RemoveListener", asyncId, path, 200, Map.of("value", listenerToRemove));
		} else {
			sendErrorEvent("FirebaseFirestore_RemoveListener", asyncId, path, 400, "Listener or DatabaseReference not found for ID: " + listenerToRemove);
		}
    }

    private void listenerRemoveAll(final long asyncId) {
		List<Object> removedListeners = new ArrayList<>();

		for (Long listenerToRemove : listenerMap.keySet()) {
			ListenerRegistration listenerRegistration = listenerMap.get(listenerToRemove);
			if (listenerRegistration != null) {
				listenerRegistration.remove();
				removedListeners.add(listenerToRemove);
			}
		}
		listenerMap.clear();
        pathMap.clear();

		sendFirestoreEvent("FirebaseFirestore_RemoveListeners", asyncId, null, 200, Map.of("values", removedListeners));
    }

    // </editor-fold>

    // <editor-fold desc="Helper Methods">

    private static final int QUERY_FILTER_LT = 0;
    private static final int QUERY_FILTER_LT_EQ = 1;
    private static final int QUERY_FILTER_GT = 2;
    private static final int QUERY_FILTER_GT_EQ = 3;
    private static final int QUERY_FILTER_EQ = 4;
    private static final int QUERY_FILTER_NEQ = 5;

    private Query applyQueryOperations(Query query, JSONArray operations, String eventType, long asyncId, String path) {
        for (int a = 0; a < operations.length(); a++) {
            
            JSONObject operationObj = operations.optJSONObject(a);
            if (operationObj == null) {
                continue;
            }
                
            if (operationObj.isNull("value")) {
                sendErrorEvent(eventType, asyncId, path, 400, "Value parameter is null.");
                continue;
            }
            
            Object value = operationObj.opt("value");
            String fieldPath = operationObj.optString("path", null);

            if (fieldPath == null) {
                continue;
            }
            
            int operation = operationObj.optInt("operation");
            switch (operation) {
                case QUERY_FILTER_LT:
                    query = query.whereLessThan(fieldPath, value);
                    break;
                case QUERY_FILTER_LT_EQ:
                    query = query.whereLessThanOrEqualTo(fieldPath, value);
                    break;
                case QUERY_FILTER_GT:
                    query = query.whereGreaterThan(fieldPath, value);
                    break;
                case QUERY_FILTER_GT_EQ:
                    query = query.whereGreaterThanOrEqualTo(fieldPath, value);
                    break;
                case QUERY_FILTER_EQ:
                    query = query.whereEqualTo(fieldPath, value);
                    break;
                case QUERY_FILTER_NEQ:
                    query = query.whereNotEqualTo(fieldPath, value);
                    break;
            }
        }
        return query;
    }

    private boolean validatePath(String path, String eventType, long asyncId) {
        if (path == null || path.isEmpty()) {
            sendErrorEvent(eventType, asyncId, null, 400, "Path parameter is missing or empty.");
            return false;
        }
        return true;
    }

    /**
     * Sends a Firestore event by assembling common data and delegating to FirebaseUtils.sendSocialAsyncEvent.
     *
     * @param eventType The type of event.
     * @param listenerId The unique listener ID.
     * @param path The Firestore document or collection path related to the event.
     * @param status The HTTP status code representing the result.
     * @param extraData Additional data to include in the event.
     */
    private void sendFirestoreEvent(String eventType, double listenerId, String path, int status, Map<String, Object> extraData) {
        Map<String, Object> data = new HashMap<>();
        data.put("listener", listenerId);
        if (path != null) {
            data.put("path", path);
        }
        data.put("status", status);

        if (extraData != null) {
            data.putAll(extraData);
        }

        // Assuming FirebaseUtils.sendSocialAsyncEvent is available
        FirebaseUtils.sendSocialAsyncEvent(eventType, data);
    }

	private void sendErrorEvent(String eventType, long asyncId, String path, int status, String errorMessage) {
		Map<String, Object> data = new HashMap<>();
		data.put("errorMessage", errorMessage);
		sendFirestoreEvent(eventType, asyncId, path, status, data);
	}

	private void sendErrorEvent(String eventType, long asyncId, String path, Exception exception) {
		Map<String, Object> data = new HashMap<>();
        int status = getStatusFromException(exception);
        sendErrorEvent(eventType, asyncId, path, status, exception.getMessage());
	}

    private Object convertQuerySnapshotToMap(QuerySnapshot querySnapshot) {
		Map<String, Object> map = new HashMap<>();
        for (DocumentSnapshot documentSnapshot : querySnapshot.getDocuments()) {
            Map<String, Object> document = documentSnapshot.getData();
			map.put(documentSnapshot.getId(), document);
        }
        return map;
    }

    private int getStatusFromException(Exception e) {
        int status = 400;
        if (e instanceof FirebaseFirestoreException) {
            FirebaseFirestoreException firestoreException = (FirebaseFirestoreException) e;
            switch (firestoreException.getCode()) {
                case ABORTED:
                case CANCELLED:
                case DATA_LOSS:
                case DEADLINE_EXCEEDED:
                case FAILED_PRECONDITION:
                case INTERNAL:
                case OUT_OF_RANGE:
                case RESOURCE_EXHAUSTED:
                case UNIMPLEMENTED:
                case UNKNOWN:
                    status = 400;
                    break;
                case ALREADY_EXISTS:
                    status = 409;
                    break;
                case PERMISSION_DENIED:
                    status = 403;
                    break;
                case NOT_FOUND:
                    status = 404;
                    break;
                case UNAUTHENTICATED:
                    status = 401;
                    break;
                case UNAVAILABLE:
                    status = 503;
                    break;
                default:
                    status = 400;
                    break;
            }
        }
        return status;
    }

    // </editor-fold>
}
