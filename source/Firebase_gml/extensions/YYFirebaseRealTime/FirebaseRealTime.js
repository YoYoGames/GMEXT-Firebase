// Global namespace for Firebase Realtime
// Merge the new methods and properties into the existing FirebaseRealTimeExt object
window.FirebaseRealTimeExt = Object.assign(window.FirebaseRealTimeExt || {}, {

    // Map to store tasks by listener ID for cancellation
    pathMap: {},
    queryMap: {},

	/**
     * Helper function to check if database is initialized.
     * Logs an error if `module` is not ready.
     * @return {boolean} `true` if `module` is ready, `false` otherwise.
     */
    isRealtimeInitialized: function() {
        const context = window.FirebaseRealTimeExt;
        if (!context.instance || !context.module) {
            console.warn("Firebase Realtime Database is not initialized. Please wait for initialization to complete.");
            return false;
        }
        return true;
    },

	/**
	 * Sends a database event with the specified parameters.
     * @param {string} eventType - The type of event.
     * @param {number} asyncId - The unique async ID.
     * @param {string|null} path - The Firebase database path related to the event.
     * @param {number} status - The HTTP status code representing the result.
     * @param {object|null} extraData - Additional data to include in the event.
	 */
	sendDatabaseEvent: function(eventType, asyncId, path, status, additionalData) {
		const { sendSocialAsyncEvent } = window.FirebaseSetup;
		
		// Initialize a new data object
		const data = {
			listener: asyncId,
			path: path,
			status: status,
		};

		if (additionalData !== null && additionalData !== undefined) {
			// Merge additionalData into data
			Object.assign(data, additionalData);
		}

		sendSocialAsyncEvent(eventType, data);
	},

    /**
     * Creates a new ValueEventListener for listening to data changes in Firebase.
     *
     * @param {string} eventType - The type of the event.
     * @param {number} asyncId - The unique async ID.
     * @param {string} path - The Firebase database path related to the event.
     * @return {function} The ValueEventListener callback.
     */
    createValueEventListener: function(eventType, asyncId, path) {
        const { sendDatabaseEvent, getStatusFromError } = window.FirebaseRealTimeExt;

        const onDataChange = function(snapshot) {
            const extraData = {};

            if (snapshot.exists()) {
                let dataValue = snapshot.val();
                if (Array.isArray(dataValue)) {
                    if (snapshot.hasChildren()) {
                        const list = [];
                        snapshot.forEach(child => {
                            list.push(child.val());
                        })
                        dataValue = list;
                    }
                }
                extraData["value"] = dataValue;
            }

            sendDatabaseEvent(eventType, asyncId, path, 200, extraData);
        };

        const onError = (error) => {
            const status = getStatusFromError(error);
            sendDatabaseEvent(eventType, asyncId, path, status, { "errorMessage": error.message });
        };

        return { onDataChange: onDataChange, onError: onError };
    },

    /**
     * Maps a Firebase DatabaseError to an appropriate HTTP status code.
     *
     * @param {object} error - The Firebase DatabaseError object.
     * @return {number} The corresponding HTTP status code.
     */
    getStatusFromError: function(error) {
        switch (error.code) {
            case 'disconnected':
                return 400;
            case 'expired-token':
            case 'invalid-token':
            case 'permission-denied':
                return 401;
            case 'max-retries':
            case 'network-error':
            case 'operation-failed':
            case 'overridden-by-set':
            case 'unknown':
            case 'user-code-exception':
            case 'write-canceled':
                return 400;
            case 'unavailable':
                return 503;
            default:
                return 400;
        }
    },

    /**
     * Handles the "Set" action to write data to Firebase.
     *
     * @param {number} asyncId - The unique async ID.
     * @param {object} fluentObj - The JSON object containing parameters.
     */
    setValue: function(asyncId, fluentObj) {
        const { module, buildReference, sendDatabaseEvent, getStatusFromError } = window.FirebaseRealTimeExt;
        const value = fluentObj.value;
        const path = fluentObj.path;

        const dataRef = buildReference(fluentObj);

        module.set(dataRef, value)
            .then(() => {
                sendDatabaseEvent("FirebaseRealTime_Set", asyncId, path, 200, null);
            })
            .catch((error) => {
                const status = getStatusFromError(error);
                sendDatabaseEvent("FirebaseRealTime_Set", asyncId, path, status, { "errorMessage": error.message });
            });
    },

    /**
     * Handles the "Read" action to read data from Firebase.
     *
     * @param {number} asyncId - The unique async ID.
     * @param {object} fluentObj - The JSON object containing parameters.
     */
    readValue: function(asyncId, fluentObj) {
        const { module, sendDatabaseEvent, buildReference, buildQuery, createValueEventListener, getStatusFromError } = window.FirebaseRealTimeExt;
        const path = fluentObj.path;
        const dataRef = buildReference(fluentObj);
        const query = buildQuery(fluentObj, dataRef);

        if (!query) {
            console.error("FirebaseRealTimeExt: Failed to build query");
            sendDatabaseEvent("FirebaseRealTime_Read", asyncId, path, 400, { "errorMessage": "Failed to build query" });
            return;
        }

        const { onDataChange, onError } = createValueEventListener("FirebaseRealTime_Read", asyncId, path);

        module.get(query)
            .then((snapshot) => {
                onDataChange(snapshot);
            }).catch((error) => {
                onError(error);
            });
    },

    /**
     * Handles the "Listener" action to listen for data changes in Firebase.
     *
     * @param {number} asyncId - The unique async ID.
     * @param {object} fluentObj - The JSON object containing parameters.
     */
    listenValue: function(asyncId, fluentObj) {
        const { module, sendDatabaseEvent, buildReference, buildQuery, createValueEventListener, pathMap, queryMap } = window.FirebaseRealTimeExt;

        const path = fluentObj.path;
        const dataRef = buildReference(fluentObj);
        const query = buildQuery(fluentObj, dataRef);

        if (Object.values(pathMap).indexOf(path) >= 0) {
			sendFirestoreEvent("FirebaseRealTime_Listener", asyncId, path, 400, { "errorMessage": "Duplicate listener for specified path." });
            return;
		}

        if (!query) {
            console.error("FirebaseRealTimeExt: Failed to build query");
            sendDatabaseEvent("FirebaseRealTime_Listener", asyncId, path, 400, { "errorMessage": "Failed to build query" });
            return;
        }

        const { onDataChange, onError } = createValueEventListener("FirebaseRealTime_Listener", asyncId, path);

        module.onValue(query, onDataChange, onError);

        // Store listener and reference for future removal
        pathMap[asyncId] = path;
        queryMap[asyncId] = query;
    },

    /**
     * Handles the "Exists" action to check data existence in Firebase.
     *
     * @param {number} asyncId - The unique async ID.
     * @param {object} fluentObj - The JSON object containing parameters.
     */
    existsValue: function(asyncId, fluentObj) {
        const { module, sendDatabaseEvent, buildReference, getStatusFromError } = window.FirebaseRealTimeExt;

        const path = fluentObj.path;
        const dataRef = buildReference(fluentObj);

        module.get(dataRef)
            .then((snapshot) => {
                const exists = snapshot.exists() ? 1.0 : 0.0;
                sendDatabaseEvent("FirebaseRealTime_Exists", asyncId, path, 200, { "value": exists });
            })
            .catch((error) => {
                const status = getStatusFromError(error);
                sendDatabaseEvent("FirebaseRealTime_Exists", asyncId, path, status, { "errorMessage": error.message });
            });
    },

    /**
     * Handles the "Delete" action to remove data from Firebase.
     *
     * @param {number} asyncId - The unique async ID.
     * @param {object} fluentObj - The JSON object containing parameters.
     */
    deleteValue: function(asyncId, fluentObj) {
        const { module, sendDatabaseEvent, buildReference, getStatusFromError } = window.FirebaseRealTimeExt;

        const path = fluentObj.path;
        const dataRef = buildReference(fluentObj);

        module.remove(dataRef)
            .then(() => {
                sendDatabaseEvent("FirebaseRealTime_Delete", asyncId, path, 200, null);
            })
            .catch((error) => {
                const status = getStatusFromError(error);
                sendDatabaseEvent("FirebaseRealTime_Delete", asyncId, path, status, { "errorMessage": error.message });
            });
    },

    /**
     * Handles the "ListenerRemove" action to remove a specific Firebase listener.
     *
     * @param {number} asyncId - The unique async ID.
     * @param {object} fluentObj - The JSON object containing parameters.
     */
    removeListener: function(asyncId, fluentObj) {
        const { module, sendDatabaseEvent, queryMap, pathMap } = window.FirebaseRealTimeExt;

        const listenerToRemove = fluentObj.value;
        if (typeof listenerToRemove !== 'number') {
            console.error("FirebaseRealTimeExt: Unable to extract listener id.");
            sendDatabaseEvent("FirebaseRealTime_RemoveListener", asyncId, null, 400, { "errorMessage": "Unable to extract listener id." });
            return;
        }

        const query = queryMap[listenerToRemove];
        const path = pathMap[listenerToRemove];

        if (query && path) {
            module.off(query);
            delete pathMap[listenerToRemove];
            delete queryMap[listenerToRemove];
            sendDatabaseEvent("FirebaseRealTime_RemoveListener", asyncId, null, 200, { "value": listenerToRemove });
        } else {
            console.error(`FirebaseRealTimeExt: Listener or DatabaseReference not found for ID: ${listenerToRemove}`);
            sendDatabaseEvent("FirebaseRealTime_RemoveListener", asyncId, null, 400, { "errorMessage": `Listener or DatabaseReference not found for ID: ${listenerToRemove}` });
        }
    },

    /**
     * Handles the "ListenerRemoveAll" action to remove all Firebase listeners.
     *
     * @param {number} asyncId - The unique async ID.
     */
    removeAllListeners: function(asyncId) {
        const { module, sendDatabaseEvent, queryMap, pathMap } = window.FirebaseRealTimeExt;

        const removedListeners = [];

        for (const listenerId in pathMap) {
            if (pathMap.hasOwnProperty(listenerId)) {
                const query = queryMap[listenerId];
                const listener = pathMap[listenerId];
                if (dataRef && listener) {
                    module.off(query);
                    removedListeners.push(Number(listenerId));
                    delete pathMap[listenerId];
                    delete queryMap[listenerId];
                }
            }
        }

        sendDatabaseEvent("FirebaseRealTime_RemoveListeners", asyncId, null, 200, { "values": removedListeners });
    },

    /**
     * Generates a Firebase DatabaseReference based on the provided JSON parameters.
     *
     * @param {object} fluentObj - The JSON object containing parameters.
     * @return {object} The constructed DatabaseReference.
     */
    buildReference: function(fluentObj) {
        const { module, instance } = window.FirebaseRealTimeExt;
        
        let dataRef;
        if (!fluentObj.database) {
            dataRef = module.ref(instance);
        } else {
            const databaseUrl = fluentObj.database;
            if (databaseUrl) {
                dataRef = module.ref(instance, databaseUrl);
            } else {
                dataRef = module.ref(instance);
            }
        }

        const path = fluentObj.path;
        if (path) {
            dataRef = module.ref(instance, path);
        }

        const push = fluentObj.push;
        if (push) {
            dataRef = module.push(dataRef);
        }

        return dataRef;
    },

    /**
     * Constructs a Firebase Query based on the provided JSON parameters and DatabaseReference.
     *
     * @param {number} asyncId - The unique async ID.
     * @param {string} eventType - The type of event.
     * @param {object} fluentObj - The JSON object containing query parameters.
     * @param {object} dataRef - The DatabaseReference to build the query from.
     * @return {object|null} The constructed Query or null if failed.
     */
    buildQuery: function(fluentObj, dataRef) {
        const { module } = window.FirebaseRealTimeExt;

        let query = module.query(dataRef);

        const orderBy = fluentObj.orderBy;
        if (orderBy) {
            switch (orderBy) {
                case "$key":
                    query = module.query(query, module.orderByKey());
                    break;
                case "$value":
                    query = module.query(query, module.orderByValue());
                    break;
                case "$priority":
                    query = module.query(query, module.orderByPriority());
                    break;
                default:
                    query = module.query(query, module.orderByChild(orderBy));
                    break;
            }
        }

        // You can only use one of these (equalTo or <range>)
        const equalToVal = fluentObj.equalTo;
        if (equalToVal) {
            query = module.query(query, module.equalTo(equalToVal));
        } else {
            // You can only use one of these (startAt or startAfter)
            const startAtVal = fluentObj.startAt;
            if (startAtVal) {
                query = module.query(query, module.startAt(startAtVal));
            } else {
                const startAfterVal = fluentObj.startAfter;
                if (startAfterVal) {
                    query = module.query(query, module.startAfter(startAfterVal));
                }
            }
        
            // You can only use one of these (endAt or endBefore)
            const endAtVal = fluentObj.endAt;
            if (endAtVal) {
                query = module.query(query, module.endAt(endAtVal));
            } else {
                const endBeforeVal = fluentObj.endBefore;
                if (endBeforeVal) {
                    query = module.query(query, module.endBefore(endBeforeVal));
                }
            }
        }
        

        const limitToFirstVal = fluentObj.limitToFirst;
        if (Number.isInteger(limitToFirstVal)) {
            query = module.query(query, module.limitToFirst(limitToFirstVal));
        }

        const limitToLastVal = fluentObj.limitToLast;
        if (Number.isInteger(limitToLastVal)) {
            query = module.query(query, module.limitToLast(limitToLastVal));
        }

        return query;
    },
});

const FIREBASE_DATABASE_SUCCESS = 0.0;
const FIREBASE_DATABASE_ERROR_NOT_FOUND = -1.0;
const FIREBASE_DATABASE_ERROR_INVALID_PARAMETERS = -2.0;
const FIREBASE_DATABASE_ERROR_NOT_INITIALIZED = -3.0;
const FIREBASE_DATABASE_ERROR_UNSUPPORTED = -4.0;

/**
 * Main SDK method to handle Firebase Realtime actions based on the input JSON.
 *
 * @param {string} fluentJson - The JSON string containing the action and parameters.
 * @return {number} The async ID.
 */
function FirebaseRealTime_SDK(fluentJson) {
    const { getNextAsyncId } = window.FirebaseSetup;
    const { isRealtimeInitialized, sendDatabaseEvent, setValue, readValue, listenValue, existsValue, deleteValue, removeListener, removeAllListeners } = window.FirebaseRealTimeExt;

    if (!isRealtimeInitialized()) {
        return FIREBASE_DATABASE_ERROR_NOT_INITIALIZED;
    }

    const asyncId = getNextAsyncId();

    // Submit async task
    FirebaseSetup.submitAsyncTask(() => {
        let fluentObj;
        try {
            fluentObj = JSON.parse(fluentJson);
        } catch (e) {
            console.error("FirebaseRealTimeExt: Invalid JSON input", e);
            sendDatabaseEvent("FirebaseRealTime_SDK", asyncId, null, 400, { "errorMessage": "Invalid JSON input" });
            return;
        }

        const action = fluentObj.action;
        if (!action) {
            console.error("FirebaseRealTimeExt: Action not specified in JSON");
            sendDatabaseEvent("FirebaseRealTime_SDK", asyncId, null, 400, { "errorMessage": "Action not specified in JSON" });
            return;
        }

        switch (action) {
            case 0: // Set
                setValue(asyncId, fluentObj);
                break;
            case 1: // Read
                readValue(asyncId, fluentObj);
                break;
            case 2: // Listener
                listenValue(asyncId, fluentObj);
                break;
            case 3: // Exists
                existsValue(asyncId, fluentObj);
                break;
            case 4: // Delete
                deleteValue(asyncId, fluentObj);
                break;
            case 5: // ListenerRemove
                removeListener(asyncId, fluentObj);
                break;
            case 6: // ListenerRemoveAll
                removeAllListeners(asyncId);
                break;
            default:
                console.error(`FirebaseRealTimeExt: Unknown action: ${action}`);
                sendDatabaseEvent("FirebaseRealTime_SDK", asyncId, null, 400, { "errorMessage": `Unknown action: ${action}` });
                break;
        }
    });

    return asyncId;
}

