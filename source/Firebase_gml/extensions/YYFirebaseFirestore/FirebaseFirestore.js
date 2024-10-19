
// Global namespace for Firebase Firestore
window.FirebaseFirestoreExt = Object.assign(window.FirebaseFirestoreExt || {}, {

    // Map to store listeners by async ID for removal
    listenerMap: {},
	pathMap: {},

	// Help Methods

    /**
     * Helper function to check if Firestore is initialized.
     * Logs an error if `module` is not ready.
     * @return {boolean} `true` if `module` is ready, `false` otherwise.
     */
    isFirestoreInitialized: function() {
        const context = window.FirebaseFirestoreExt;
        if (!context.instance || !context.module) {
            console.warn("Firebase Firestore is not initialized. Please wait for initialization to complete.");
            return false;
        }
        return true;
    },

    sendFirestoreEvent: function(eventType, asyncId, path, status, additionalData) {
		const { sendSocialAsyncEvent } = window.FirebaseSetup;
	
		const data = {
			listener: asyncId,
			path: path,
			status: status,
		};
	
		if (additionalData !== null && additionalData !== undefined) {
			Object.assign(data, additionalData);
		}
	
		sendSocialAsyncEvent(eventType, data);
	},

	sendErrorEvent: function(eventType, asyncId, path, error) {
		const { getStatusFromError, sendErrorEventWithMessage } = window.FirebaseFirestoreExt;
		const status = getStatusFromError(error);
		sendErrorEventWithMessage(eventType, asyncId, path, status, error.message);
	},

	sendErrorEventWithMessage: function(eventType, asyncId, path, message) {
		const { sendFirestoreEvent } = window.FirebaseFirestoreExt;
		sendFirestoreEvent(eventType, asyncId, path, 400, { "errorMessage": message });
	},

	getCollectionRef: function(path) {
		const { module, instance } = window.FirebaseFirestoreExt;
		return module.collection(instance, path);
	},

	getDocumentRef: function(path) {
		const { module, instance } = window.FirebaseFirestoreExt;
		return module.doc(instance, path);
	},

	getStatusFromError: function(error) {
		switch (error.code) {
			case 'aborted':
			case 'cancelled':
			case 'data-loss':
			case 'deadline-exceeded':
			case 'failed-precondition':
			case 'internal':
			case 'out-of-range':
			case 'resource-exhausted':
			case 'unimplemented':
			case 'unknown':
				return 400;
			case 'already-exists':
				return 409;
			case 'permission-denied':
				return 403;
			case 'not-found':
				return 404;
			case 'unauthenticated':
				return 401;
			case 'unavailable':
				return 503;
			default:
				return 400;
		}
	},

	// Collection API

	collectionAdd: function(asyncId, fluentObj) {
		const { module, getCollectionRef, sendErrorEventWithMessage, sendErrorEvent, sendFirestoreEvent } = window.FirebaseFirestoreExt;
		const path = fluentObj.path;
		const value = fluentObj.value;

		if (!path || !value) {
			sendErrorEventWithMessage("FirebaseFirestore_Collection_Add", asyncId, path, "Path or value is missing.");
			return;
		}

		const collectionRef = getCollectionRef(path);

		module.addDoc(collectionRef, value)
			.then(() => {
				sendFirestoreEvent("FirebaseFirestore_Collection_Add", asyncId, path, 200, null);
			})
			.catch((error) => {
				sendErrorEvent("FirebaseFirestore_Collection_Add", asyncId, path, error);
			});
		
	},

	collectionGet: function(asyncId, fluentObj) {
		const { module, getCollectionRef, sendErrorEvent, sendErrorEventWithMessage, sendFirestoreEvent } = window.FirebaseFirestoreExt;
		const path = fluentObj.path;
	
		if (!path) {
			sendErrorEventWithMessage("FirebaseFirestore_Collection_Read", asyncId, path, "Path is missing.");
			return;
		}
	
		const collectionRef = getCollectionRef(path);
		module.getDocs(collectionRef)
			.then((querySnapshot) => {
				const data = {};
				querySnapshot.forEach((doc) => {
					data[doc.id] = doc.data();
				});
				sendFirestoreEvent("FirebaseFirestore_Collection_Read", asyncId, path, 200, { "value": data });
			})
			.catch((error) => {
				sendErrorEvent("FirebaseFirestore_Collection_Read", asyncId, path, error);
			});
		
	},
	
	collectionQuery: function(asyncId, fluentObj) {
		const { module, getCollectionRef, sendErrorEventWithMessage, sendErrorEvent, sendFirestoreEvent } = window.FirebaseFirestoreExt;
		const path = fluentObj.path;
	
		if (!path) {
			sendErrorEventWithMessage("FirebaseFirestore_Collection_Query", asyncId, path, "Path is missing.");
			return;
		}
	
		let query = getCollectionRef(path);
	
		// Apply filter operations
		const operations = fluentObj.operations;
		if (Array.isArray(operations)) {
			operations.forEach((operation) => {
				const fieldPath = operation.path;
				const op = operation.operation;
				const value = operation.value;
	
				if (!fieldPath || !op || value === undefined) {
					return;
				}
	
				switch (op) {
					case 0: // FIRESTORE_QUERY_FILTER_LT
						query = module.query(query, module.where(fieldPath, "<", value));
						break;
					case 1: // FIRESTORE_QUERY_FILTER_LT_EQ
						query = module.query(query, module.where(fieldPath, "<=", value));
						break;
					case 2: // FIRESTORE_QUERY_FILTER_GT
						query = module.query(query, module.where(fieldPath, ">", value));
						break;
					case 3: // FIRESTORE_QUERY_FILTER_GT_EQ
						query = module.query(query, module.where(fieldPath, ">=", value));
						break;
					case 4: // FIRESTORE_QUERY_FILTER_EQ
						query = module.query(query, module.where(fieldPath, "==", value));
						break;
					case 5: // FIRESTORE_QUERY_FILTER_NEQ
						query = module.query(query, module.where(fieldPath, "!=", value));
						break;
				}
			});
		}
	
		// Apply orderBy and sort
		const orderByField = fluentObj.orderBy;
		if (orderByField) {
			const direction = fluentObj.sort === 1 ? "desc" : "asc";
			query = module.query(query, module.orderBy(orderByField, direction));
		}
	
		// Apply limits
		const limitToFirst = fluentObj.limitToFirst;
		if (limitToFirst) {
			query = module.query(query, module.limit(limitToFirst));
		}
	
		const limitToLast = fluentObj.limitToLast;
		if (limitToLast) {
			query = module.query(query, module.limitToLast(limitToLast));
		}

		module.getDocs(query)
			.then((querySnapshot) => {
				const data = {};
				querySnapshot.forEach((doc) => {
					data[doc.id] = doc.data();
				});
				sendFirestoreEvent("FirebaseFirestore_Collection_Query", asyncId, path, 200, { "value": data });
			})
			.catch((error) => {
				sendErrorEvent("FirebaseFirestore_Collection_Query", asyncId, path, error);
			});
	},

	collectionListen: function(asyncId, fluentObj) {
		const { module, getCollectionRef, sendErrorEventWithMessage, sendErrorEvent, sendFirestoreEvent, listenerMap, pathMap } = window.FirebaseFirestoreExt;
		const path = fluentObj.path;

		if (!path) {
			sendErrorEventWithMessage("FirebaseFirestore_Collection_Listener", asyncId, path, "Path is missing.");
			return;
		}

		if (Object.values(pathMap).indexOf(path) >= 0) {
			sendErrorEventWithMessage("FirebaseFirestore_Collection_Listener", asyncId, path, "Duplicate listener for specified path.");
            return;
		}

		const collectionRef = getCollectionRef(path);

		const unsubscribe = module.onSnapshot(collectionRef, (querySnapshot) => {
			const data = {};
			querySnapshot.forEach((doc) => {
				data[doc.id] = doc.data();
			});
			sendFirestoreEvent("FirebaseFirestore_Collection_Listener", asyncId, path, 200, { "value": data });
		}, (error) => {
			sendErrorEvent("FirebaseFirestore_Collection_Listener", asyncId, path, error);
		});
		
	
		// Store the unsubscribe function for later removal
		if (unsubscribe) {
			pathMap[asyncId] = path;
			listenerMap[asyncId] = unsubscribe;
		}
	},

	// Document API

	documentSet: function(asyncId, fluentObj) {
		const { module, getDocumentRef, sendErrorEventWithMessage, sendErrorEvent, sendFirestoreEvent } = window.FirebaseFirestoreExt;
		const path = fluentObj.path;
		const value = fluentObj.value;

		if (!path || !value) {
			sendErrorEventWithMessage("FirebaseFirestore_Document_Set", asyncId, path, "Path or value is missing.");
			return;
		}
	
		const docRef = getDocumentRef(path);

		module.setDoc(docRef, value)
			.then(() => {
				sendFirestoreEvent("FirebaseFirestore_Document_Set", asyncId, path, 200, null);
			})
			.catch((error) => {
				sendErrorEvent("FirebaseFirestore_Document_Set", asyncId, path, error);
			});
		
	},

	documentUpdate: function(asyncId, fluentObj) {
		const { module, getDocumentRef, sendErrorEventWithMessage, sendErrorEvent, sendFirestoreEvent } = window.FirebaseFirestoreExt;
		const path = fluentObj.path;
		const value = fluentObj.value;
	
		if (!path || !value) {
			sendErrorEventWithMessage("FirebaseFirestore_Document_Update", asyncId, path, "Path or value is missing.");
			return;
		}
	
		const docRef = getDocumentRef(path);
	
		module.updateDoc(docRef, value)
			.then(() => {
				sendFirestoreEvent("FirebaseFirestore_Document_Update", asyncId, path, 200, null);
			})
			.catch((error) => {
				sendErrorEvent("FirebaseFirestore_Document_Update", asyncId, path, error);
			});
	},

	documentGet: function(asyncId, fluentObj) {
		const { module, getDocumentRef, sendErrorEventWithMessage, sendErrorEvent, sendFirestoreEvent } = window.FirebaseFirestoreExt;
		const path = fluentObj.path;

		if (!path) {
			sendErrorEventWithMessage("FirebaseFirestore_Document_Read", asyncId, path, "Path is missing.");
			return;
		}
	
		const docRef = getDocumentRef(path);
		module.getDoc(docRef)
			.then((docSnapshot) => {
				if (docSnapshot.exists()) {
					sendFirestoreEvent("FirebaseFirestore_Document_Read", asyncId, path, 200, { "value": docSnapshot.data() });
				} else {
					sendFirestoreEvent("FirebaseFirestore_Document_Read", asyncId, path, 404, { "errorMessage": "Document not found" });
				}
			})
			.catch((error) => {
				sendErrorEvent("FirebaseFirestore_Document_Read", asyncId, path, error);
			});

	},

	documentDelete: function(asyncId, fluentObj) {
		const { module, getDocumentRef, sendErrorEventWithMessage, sendErrorEvent, sendFirestoreEvent } = window.FirebaseFirestoreExt;
		const path = fluentObj.path;
	
		if (!path) {
			sendErrorEventWithMessage("FirebaseFirestore_Document_Delete", asyncId, path, "Path is missing.");
			return;
		}
	
		const docRef = getDocumentRef(path);
	
		module.deleteDoc(docRef)
			.then(() => {
				sendFirestoreEvent("FirebaseFirestore_Document_Delete", asyncId, path, 200, null);
			})
			.catch((error) => {
				sendErrorEvent("FirebaseFirestore_Document_Delete", asyncId, path, error);
			});
	},

	documentListen: function(asyncId, fluentObj) {
		const { module, getDocumentRef, sendErrorEventWithMessage, sendErrorEvent, sendFirestoreEvent, listenerMap, pathMap } = window.FirebaseFirestoreExt;
		const path = fluentObj.path;

		if (!path) {
			sendErrorEventWithMessage("FirebaseFirestore_Document_Listener", asyncId, path, "Path is missing.");
			return;
		}

		if (Object.values(pathMap).indexOf(path) >= 0) {
			sendErrorEventWithMessage("FirebaseFirestore_Document_Listener", asyncId, path, "Duplicate listener for specified path.");
            return;
		}

		const docRef = getDocumentRef(path);

		const unsubscribe = module.onSnapshot(docRef, (docSnapshot) => {
			if (docSnapshot.exists()) {
				sendFirestoreEvent("FirebaseFirestore_Document_Listener", asyncId, path, 200, { "value": docSnapshot.data() });
			} else {
				sendFirestoreEvent("FirebaseFirestore_Document_Listener", asyncId, path, 404, { "errorMessage": "Document not found" });
			}
		}, (error) => {
			sendErrorEvent("FirebaseFirestore_Document_Listener", asyncId, path, error);
		});
		
	
		// Store the unsubscribe function for later removal
		if (unsubscribe) {
			pathMap[asyncId] = path;
			listenerMap[asyncId] = unsubscribe;
		}
	},

	// Listener API

	listenerRemove: function(asyncId, fluentObj) {
		const { sendErrorEventWithMessage, sendErrorEvent, sendFirestoreEvent, listenerMap } = window.FirebaseFirestoreExt;
	
		const listenerId = fluentObj.value;
		if (typeof listenerId !== 'number') {
			sendErrorEventWithMessage("FirebaseFirestore_RemoveListener", asyncId, null, "Invalid listener ID.");
			return;
		}
	
		const unsubscribe = listenerMap[listenerId];
	
		if (unsubscribe) {
			unsubscribe();
			delete listenerMap[listenerId];
			sendFirestoreEvent("FirebaseFirestore_RemoveListener", asyncId, null, 200, { "value": listenerId });
		} else {
			sendErrorEventWithMessage("FirebaseFirestore_RemoveListener", asyncId, null, "Listener not found for ID: '" + listenerId + "'");
		}
	},

	listenerRemoveAll: function(asyncId) {
		const { sendFirestoreEvent, listenerMap } = window.FirebaseFirestoreExt;
	
		const removedListeners = [];
	
		for (const listenerId in listenerMap) {
			if (listenerMap.hasOwnProperty(listenerId)) {
				const unsubscribe = listenerMap[listenerId];
				unsubscribe();
				removedListeners.push(Number(listenerId));
				delete listenerMap[listenerId];
			}
		}
	
		sendFirestoreEvent("FirebaseFirestore_RemoveListeners", asyncId, null, 200, { "values": removedListeners });
	},
});

const FIREBASE_FIRESTORE_SUCCESS = 0.0;
const FIREBASE_FIRESTORE_ERROR_NOT_FOUND = -1.0;
const FIREBASE_FIRESTORE_ERROR_INVALID_PARAMETERS = -2.0;
const FIREBASE_FIRESTORE_ERROR_NOT_INITIALIZED = -3.0;
const FIREBASE_FIRESTORE_ERROR_UNSUPPORTED = -4.0;

/**
 * Main SDK method to handle Firebase Firestore actions based on the input JSON.
 *
 * @param {string} fluentJson - The JSON string containing the action and parameters.
 * @return {number} The async ID.
 */
function FirebaseFirestore_SDK(fluentJson) {
    const { getNextAsyncId, submitAsyncTask } = window.FirebaseSetup;
    const { isFirestoreInitialized, sendErrorEventWithMessage } = window.FirebaseFirestoreExt;

    if (!isFirestoreInitialized()) {
        return FIREBASE_FIRESTORE_ERROR_NOT_INITIALIZED;
    }

    const asyncId = getNextAsyncId();

    submitAsyncTask(() => {
        let fluentObj;
        try {
            fluentObj = JSON.parse(fluentJson);
        } catch (e) {
            console.error("FirebaseFirestoreExt: Invalid JSON input", e);
            sendErrorEvent("FirebaseFirestore_SDK", asyncId, null, e);
            return;
        }

        const action = fluentObj.action;
        if (action === undefined || action === null) {
            console.error("FirebaseFirestoreExt: Action not specified in JSON");
            sendErrorEventWithMessage("FirebaseFirestore_SDK", asyncId, null, "Action not specified in JSON");
            return;
        }

        const { documentSet, documentUpdate, documentGet, documentListen, documentDelete, 
			collectionAdd, collectionGet, collectionListen, collectionQuery, 
			listenerRemove, listenerRemoveAll } = window.FirebaseFirestoreExt;

        const isDocument = fluentObj.isDocument;

        switch (action) {
            case 0: // ACTION_ADD
				if (isDocument) {
					sendErrorEventWithMessage("FirebaseFirestore_SDK", asyncId, null, "You can't add to a document.");
				} else {
					collectionAdd(asyncId, fluentObj);
				}
                break;
			case 1: // ACTION_SET
				if (isDocument) {
					documentSet(asyncId, fluentObj);
				} else {
					sendErrorEventWithMessage("FirebaseFirestore_SDK", asyncId, null, "You can't set a collection.");
				}
                break;
            case 2: // ACTION_UPDATE
                if (isDocument) {
                    documentUpdate(asyncId, fluentObj);
                } else {
                    sendErrorEventWithMessage("FirebaseFirestore_SDK", asyncId, null, "You can't update a collection.");
                }
                break;
            case 3: // ACTION_READ
				if (isDocument) {
					documentGet(asyncId, fluentObj);
				} else {
					collectionGet(asyncId, fluentObj);
				}
                break;
            case 4: // ACTION_LISTEN
				if (isDocument) {
					documentListen(asyncId, fluentObj);
				} else {
					collectionListen(asyncId, fluentObj);
				}
                break;
            case 5: // ACTION_DELETE
                if (isDocument) {
                    documentDelete(asyncId, fluentObj);
                } else {
                    sendErrorEventWithMessage("FirebaseFirestore_SDK", asyncId, null, "You can't delete a collection.");
                }
                break;
            case 6: // ACTION_QUERY
                if (isDocument) {
                    sendErrorEventWithMessage("FirebaseFirestore_SDK", asyncId, null, "You can't Query a document.");
                } else {
                    collectionQuery(asyncId, fluentObj);
                }
                break;
            case 7: // ACTION_LISTENER_REMOVE
                listenerRemove(asyncId, fluentObj);
                break;
            case 8: // ACTION_LISTENER_REMOVE_ALL
                listenerRemoveAll(asyncId);
                break;
            default:
                console.error("FirebaseFirestoreExt: Unknown action: '" + action + "'");
                sendErrorEventWithMessage("FirebaseFirestore_SDK", asyncId, null, "Unknown action: '" + action + "'");
                break;
        }
    });

    return asyncId;
}