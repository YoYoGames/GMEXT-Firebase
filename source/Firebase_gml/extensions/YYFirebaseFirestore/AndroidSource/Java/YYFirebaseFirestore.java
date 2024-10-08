package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import ${YYAndroidPackageName}.FirebaseUtils; // Assuming FirebaseUtils is available

import com.yoyogames.runner.RunnerJNILib;

import com.google.firebase.firestore.*;

import com.google.android.gms.tasks.*;

import org.json.JSONObject;
import org.json.JSONArray;

import java.util.*;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

public class YYFirebaseFirestore extends RunnerSocial {

	private static final String LOG_TAG = "YYFirebaseFirestore";

    private HashMap<long, ListenerRegistration> listenerMap;

    public YYFirebaseFirestore() {
        listenerMap = new HashMap<>();
    }

    public double FirebaseFirestore_SDK(String fluentJson) {

        final long asyncId = FirebaseUtils.getInstance().getNextAsyncId();

        FirebaseUtils.getInstance().submitAsyncTask(() -> {

            JSONObject fluentObj;
            try {
                fluentObj = new JSONObject(fluentJson);
            } catch (JSONException e) {
                Log.e(LOG_TAG, "Invalid JSON input", e);
                sendFirestoreEvent("FirebaseFirestore_SDK", asyncId, null, 400, Map.of("errorMessage", "Invalid JSON input"));
                return;
            }

            String action = fluentObj.optString("action", null);
            if (action == null) {
                Log.e(LOG_TAG, "Action not specified in JSON");
                sendFirestoreEvent("FirebaseFirestore_SDK", asyncId, null, 400, Map.of("errorMessage", "Action not specified in JSON"));
                return;
            }

            boolean isDocument = fluentObj.optBoolean("isDocument", false);
            switch (action) {
                case "Set":
                    if (isDocument) { firestoreDocumentSet(asyncId, fluentObj); } else { firestoreCollectionAdd(asyncId, fluentObj); }
                    break;
                case "Update":
                    if (isDocument) { firestoreDocumentUpdate(asyncId, fluentObj); } else { Log.i(LOG_TAG, "Firestore: You can't update a Collection"); }
                    break;
                case "Read":
                    if (isDocument) { firestoreDocumentGet(asyncId, fluentObj); } else { firestoreCollectionGet(asyncId, fluentObj); }
                    break;
                case "Listener":
                    if (isDocument) { firestoreDocumentListener(asyncId, fluentObj); } else { firestoreCollectionListener(asyncId, fluentObj); }
                    break;
                case "Delete":
                    if (isDocument) { firestoreDocumentDelete(asyncId, fluentObj); } else { Log.i(LOG_TAG, "Firestore: You can't delete a Collection"); }
                    break;
                case "Query":
                    if (isDocument) { Log.i(LOG_TAG, "Firestore: You can't Query documents"); } else { firestoreCollectionQuery(asyncId, fluentObj); }
                    break;
                case "ListenerRemove":
                    firestoreListenerRemove(asyncId, fluentObj);
                    break;
                case "ListenerRemoveAll":
                    firestoreListenerRemoveAll(asyncId);
                    break;
                default:
                    sendFirestoreEvent("FirebaseFirestore_SDK", asyncId, null, 400, Map.of("errorMessage", "Unknown action: " + action));
                    break;
            }
        });

        return (double) asyncId;
    }

    /**
     * Sends a Firestore event by assembling common data and delegating to FirebaseUtils.sendAsyncEvent.
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

        // Assuming FirebaseUtils.sendAsyncEvent is available
        FirebaseUtils.sendAsyncEvent(eventType, data);
    }

	// Helper method to send error events
	private void sendErrorEvent(String eventType, long asyncId, String path, int status, String errorMessage) {
		Map<String, Object> data = new HashMap<>();
		data.put("errorMessage", errorMessage);
		sendFirestoreEvent(eventType, asyncId, path, status, data);
	}

    private void firestoreCollectionAdd(final long asyncId, final JSONObject fluentObj) {
		final String path = fluentObj.optString("path", null);

		if (operationObj.isNull("value")) {
			sendErrorEvent("FirebaseFirestore_Collection_Add", asyncId, path, 400, "Value parameter is null.");
			return;
		}

		Object value = operationObj.opt("value");
		value = FirebaseUtils.convertJSON(value);

        FirebaseFirestore.getInstance()
            .collection(path)
            .add(value)
            .addOnCompleteListener(new OnCompleteListener<DocumentReference>() {
                @Override
                public void onComplete(@NonNull Task<DocumentReference> task) {
                    int status;
                    Map<String, Object> extraData = new HashMap<>();
                    if (task.isSuccessful()) {
                        status = 200;
                    } else {
                        status = getStatusFromException(task.getException());
                        extraData.put("errorMessage", task.getException().getMessage());
                    }
                    sendFirestoreEvent("FirebaseFirestore_Collection_Add", asyncId, path, status, extraData);
                }
            });
    }

    private void firestoreCollectionGet(final long asyncId, final JSONObject fluentObj) {
        final String path = fluentObj.optString("path", null);
		FirebaseFirestore.getInstance()
            .collection(path)
            .get()
            .addOnCompleteListener(new OnCompleteListener<QuerySnapshot>() {
                @Override
                public void onComplete(@NonNull Task<QuerySnapshot> task) {
                    int status;
                    Map<String, Object> extraData = new HashMap<>();
                    if (task.isSuccessful()) {
                        status = 200;
                        extraData.put("value", querySnapshotToMap(task.getResult()));
                    } else {
                        status = getStatusFromException(task.getException());
                        extraData.put("errorMessage", task.getException().getMessage());
                    }
                    sendFirestoreEvent("FirebaseFirestore_Collection_Read", asyncId, path, status, extraData);
                }
            });
    }

    private void firestoreCollectionListener(final long asyncId, final JSONObject fluentObj) {
		final String path = fluentObj.optString("path", null);
        ListenerRegistration listenerRegistration = FirebaseFirestore.getInstance()
            .collection(path)
            .addSnapshotListener(new EventListener<QuerySnapshot>() {
                @Override
                public void onEvent(@Nullable QuerySnapshot querySnapshot, @Nullable FirebaseFirestoreException error) {
                    int status;
                    Map<String, Object> extraData = new HashMap<>();
                    if (querySnapshot == null || error != null) {
                        status = getStatusFromException(error);
                        extraData.put("errorMessage", error != null ? error.getMessage() : "Unknown error");
                    } else {
                        status = 200;
                        extraData.put("value", querySnapshotToMap(querySnapshot));
                    }
                    sendFirestoreEvent("FirebaseFirestore_Collection_Listener", asyncId, path, status, extraData);
                }
            });
		listenerMap.put(asyncId, listenerRegistration);
    }

    private void firestoreCollectionQuery(final long asyncId, final JSONObject fluentObj) {
		final String path = fluentObj.optString("path", null);
        Query query = FirebaseFirestore.getInstance().collection(path);

        // Build query based on operations
		JSONArray operations = fluentJson.optJSONArray("operations");
        if (operations != null) {
            for (int a = 0; a < operations.length(); a++) {
                
                JSONObject operationObj = operations.optJSONObject(a);
				if (operationObj == null) {
					continue;
				}
                 
				if (operationObj.isNull("value")) {
					sendErrorEvent("FirebaseFirestore_Collection_Query", asyncId, path, 400, "Value parameter is null.");
					return;
				}
				
				Object value = operationObj.opt("value");
				String fieldPath = operationObj.optString("path", null);

				if (fieldPath == null) {
					continue;
				}
                
				String operation = operationObj.optString("operation");
				switch (operation) {
                    case "EQUAL":
                        query = query.whereEqualTo(fieldPath, value);
                        break;
                    case "GREATER_THAN_OR_EQUAL":
                        query = query.whereGreaterThanOrEqualTo(fieldPath, value);
                        break;
                    case "GREATER_THAN":
                        query = query.whereGreaterThan(fieldPath, value);
                        break;
                    case "LESS_THAN_OR_EQUAL":
                        query = query.whereLessThanOrEqualTo(fieldPath, value);
                        break;
                    case "LESS_THAN":
                        query = query.whereLessThan(fieldPath, value);
                        break;
                }
            }
        }

		String orderBy = fluentObj.optString("orderBy", null);
		if (orderBy != null) {
			String orderDirection = fluentObj.optString("orderDirection", null);
			if (orderDirection != null) {
				switch (orderDirection) {
					case "ASCENDING":
						query = query.orderBy(orderBy, Query.Direction.ASCENDING);
						break;
					case "DESCENDING":
						query = query.orderBy(orderBy, Query.Direction.DESCENDING);
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
        if (limitToFirst != -1) {
            query = query.limit(limitToFirst);
        }

        int limitToLast = fluentObj.optInt("limitToLast", -1);
        if (limitToLast != -1) {
            query = query.limitToLast(limitToLast);
        }

        query.get().addOnCompleteListener(new OnCompleteListener<QuerySnapshot>() {
            @Override
            public void onComplete(@NonNull Task<QuerySnapshot> task) {
                int status;
                Map<String, Object> extraData = new HashMap<>();
                if (task.isSuccessful()) {
                    status = 200;
                    extraData.put("value", querySnapshotToMap(task.getResult()));
                } else {
                    status = getStatusFromException(task.getException());
                    extraData.put("errorMessage", task.getException().getMessage());
                }
                sendFirestoreEvent("FirebaseFirestore_Collection_Query", asyncId, path, status, extraData);
            }
        });
    }

    private void firestoreDocumentSet(final long asyncId, final JSONObject fluentObj) {
		final String path = fluentObj.optString("path", null);

		if (operationObj.isNull("value")) {
			sendErrorEvent("FirebaseFirestore_Document_Set", asyncId, path, 400, "Value parameter is null.");
			return;
		}

		Object value = fluentObj.opt("value");

		value = FirebaseUtils.convertJSON(value);

        FirebaseFirestore.getInstance()
            .document(path)
            .set(value)
            .addOnCompleteListener(new OnCompleteListener<Void>() {
                @Override
                public void onComplete(@NonNull Task<Void> task) {
                    int status;
                    Map<String, Object> extraData = new HashMap<>();
                    if (task.isSuccessful())
                        status = 200;
                    else {
                        status = getStatusFromException(task.getException());
                        extraData.put("errorMessage", task.getException().getMessage());
                    }
                    sendFirestoreEvent("FirebaseFirestore_Document_Set", asyncId, path, status, extraData);
                }
            });
    }

    private void firestoreDocumentUpdate(final long asyncId, final JSONObject fluentObj) {
		final String path = fluentObj.optString("path", null);

		if (operationObj.isNull("value")) {
			sendErrorEvent("FirebaseFirestore_Document_Update", asyncId, path, 400, "Value parameter is null.");
			return;
		}

		Object value = fluentObj.opt("value");

		value = FirebaseUtils.convertJSON(value);

        FirebaseFirestore.getInstance()
            .document(path)
            .update(value)
            .addOnCompleteListener(new OnCompleteListener<Void>() {
                @Override
                public void onComplete(@NonNull Task<Void> task) {
                    int status;
                    Map<String, Object> extraData = new HashMap<>();
                    if (task.isSuccessful())
                        status = 200;
                    else {
                        status = getStatusFromException(task.getException());
                        extraData.put("errorMessage", task.getException().getMessage());
                    }
                    sendFirestoreEvent("FirebaseFirestore_Document_Update", asyncId, path, status, extraData);
                }
            });
    }

    private void firestoreDocumentGet(final long asyncId, final JSONObject fluentObj) {
		final String path = fluentObj.optString("path", null);
        FirebaseFirestore.getInstance()
            .document(path)
            .get()
            .addOnSuccessListener(new OnSuccessListener<DocumentSnapshot>() {
                @Override
                public void onSuccess(DocumentSnapshot documentSnapshot) {
                    int status;
                    Map<String, Object> extraData = new HashMap<>();
                    if (documentSnapshot.exists()) {
                        status = 200;
                        extraData.put("value", documentSnapshot.getData());
                    } else {
                        status = 404;
                        extraData.put("errorMessage", "DOCUMENT NOT FOUND");
                    }
                    sendFirestoreEvent("FirebaseFirestore_Document_Read", asyncId, path, status, extraData);
                }
            }).addOnFailureListener(new OnFailureListener() {
                @Override
                public void onFailure(@NonNull Exception e) {
                    int status = getStatusFromException(e);
                    Map<String, Object> extraData = new HashMap<>();
                    extraData.put("errorMessage", e.getMessage());
                    sendFirestoreEvent("FirebaseFirestore_Document_Read", asyncId, path, status, extraData);
                }
            });
    }

    private void firestoreDocumentDelete(final long asyncId, final JSONObject fluentObj) {
		final String path = fluentObj.optString("path", null);
        FirebaseFirestore.getInstance()
            .document(path)
            .delete()
            .addOnCompleteListener(new OnCompleteListener<Void>() {
                @Override
                public void onComplete(@NonNull Task<Void> task) {
                    int status;
                    Map<String, Object> extraData = new HashMap<>();
                    if (task.isSuccessful())
                        status = 200;
                    else {
                        status = getStatusFromException(task.getException());
                        extraData.put("errorMessage", task.getException().getMessage());
                    }
                    sendFirestoreEvent("FirebaseFirestore_Document_Delete", asyncId, path, status, extraData);
                }
            });
    }

    private void firestoreDocumentListener(final long asyncId, final JSONObject fluentObj) {
		final String path = fluentObj.optString("path", null);
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
    }

    private void firestoreListenerRemove(final long asyncId, final JSONObject fluentObj) {

		long listenerToRemove = fluentObj.optLong("value", -1L);
		if (listenerToRemove == -1L) {
			Map<String, Object> extraData = Map.of("errorMessage", "Unable to extract listener id.");
			sendFirestoreEvent("FirebaseFirestore_RemoveListener", -1L, null, 400, extraData);
			return;
		}

		ListenerRegistration registration = listenerMap.remove(listenerToRemove);

		if (registration != null) {
			registration.remove();
			Map<String, Object> extraData = Map.of("value", listenerToRemove);
			sendFirestoreEvent("FirebaseFirestore_RemoveListener", asyncId, null, 200, extraData);
		} else {
			Map<String, Object> extraData = Map.of("errorMessage", "Listener or DatabaseReference not found for ID: " + listenerToRemove);
			sendFirestoreEvent("FirebaseFirestore_RemoveListener", asyncId, null, 400, extraData);
		}
    }

    private void firestoreListenerRemoveAll(final long asyncId) {
		List<Object> removedListeners = new ArrayList<>();

		for (Long listenerToRemove : referenceMap.keySet()) {
			ListenerRegistration listenerRegistration = listenerMap.get(listenerToRemove);
			if (listenerRegistration != null) {
				listenerRegistration.remove();
				removedListeners.add(listenerToRemove);
			}
		}
		listenerMap.clear();

		Map<String, Object> extraData = Map.of("values", removedListeners);
		sendDatabaseEvent("FirebaseFirestore_RemoveListeners", asyncId, null, 200, extraData);

        
    }

    private Object querySnapshotToMap(QuerySnapshot querySnapshot) {
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
}
