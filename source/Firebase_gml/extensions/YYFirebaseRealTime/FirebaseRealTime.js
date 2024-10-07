// Global namespace for Firebase Realtime
// Merge the new methods and properties into the existing FirebaseRealtimeExt object
window.FirebaseRealtimeExt = Object.assign(window.FirebaseRealtimeExt || {}, {

    // Map to store tasks by listener ID for cancellation
    listenerMap: {},
    referenceMap: {},

	/**
     * Helper function to check if storage is initialized.
     * Logs an error if `module` is not ready.
     * @return {boolean} `true` if `module` is ready, `false` otherwise.
     */
    isRealtimeInitialized: function() {
        const context = window.FirebaseRealtimeExt;
        if (!context.module) {
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
		const { sendAsyncEvent } = window.FirebaseSetup;
		
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

		sendAsyncEvent(eventType, data);
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
        const { sendDatabaseEvent } = window.FirebaseRealtimeExt;

        return function(snapshot) {
            const extraData = {};

            if (snapshot.exists()) {
                let dataValue = snapshot.val();

                // If dataValue is an array-like object, convert to Array
                if (Array.isArray(dataValue)) {
                    extraData["value"] = dataValue;
                }
                // If dataValue is an object, convert to List equivalent
                else if (typeof dataValue === 'object' && dataValue !== null) {
                    const list = [];
                    snapshot.forEach(childSnapshot => {
                        list.push(childSnapshot.val());
                    });
                    extraData["value"] = list;
                } else {
                    extraData["value"] = dataValue;
                }
            }

            sendDatabaseEvent(eventType, asyncId, path, 200, extraData);
        };
    },

    /**
     * Maps a Firebase DatabaseError to an appropriate HTTP status code.
     *
     * @param {object} error - The Firebase DatabaseError object.
     * @return {number} The corresponding HTTP status code.
     */
    mapDatabaseErrorToHttpStatus: function(error) {
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
        const { sendDatabaseEvent } = window.FirebaseRealtimeExt;
        const value = fluentObj.value;
        const path = fluentObj.path;

        const dataRef = this.buildReference(fluentObj);

        dataRef.set(value, (error) => {
            const status = error ? this.mapDatabaseErrorToHttpStatus(error) : 200;
            const extraData = error ? { "errorMessage": error.message } : null;
            sendDatabaseEvent("FirebaseRealTime_Set", asyncId, path, status, extraData);
        });
    },

    /**
     * Handles the "Read" action to read data from Firebase.
     *
     * @param {number} asyncId - The unique async ID.
     * @param {object} fluentObj - The JSON object containing parameters.
     */
    readValue: function(asyncId, fluentObj) {
        const { sendDatabaseEvent, buildReference, buildQuery, createValueEventListener, mapDatabaseErrorToHttpStatus } = window.FirebaseRealtimeExt;
        const path = fluentObj.path;
        const dataRef = buildReference(fluentObj);
        const query = buildQuery(asyncId, "FirebaseRealTime_Read", fluentObj, dataRef);

        if (!query) {
            console.error("FirebaseRealtimeExt: Failed to build query");
            sendDatabaseEvent("FirebaseRealTime_Read", asyncId, path, 400, { "errorMessage": "Failed to build query" });
            return;
        }

        const onDataChange = createValueEventListener("FirebaseRealTime_Read", asyncId, path);
        const onCancel = (error) => {
            const status = mapDatabaseErrorToHttpStatus(error);
            const extraData = { "errorMessage": error.message };
            sendDatabaseEvent("FirebaseRealTime_Read", asyncId, path, status, extraData);
        };

        query.once('value', onDataChange, onCancel);
    },

    /**
     * Handles the "Listener" action to listen for data changes in Firebase.
     *
     * @param {number} asyncId - The unique async ID.
     * @param {object} fluentObj - The JSON object containing parameters.
     */
    listenValue: function(asyncId, fluentObj) {
        const { sendDatabaseEvent, buildReference, buildQuery, createValueEventListener, mapDatabaseErrorToHttpStatus } = window.FirebaseRealtimeExt;

        const path = fluentObj.path;
        const dataRef = buildReference(fluentObj);
        const query = buildQuery(asyncId, "FirebaseRealTime_Listener", fluentObj, dataRef);

        if (!query) {
            console.error("FirebaseRealtimeExt: Failed to build query");
            sendDatabaseEvent("FirebaseRealTime_Listener", asyncId, path, 400, { "errorMessage": "Failed to build query" });
            return;
        }

        const onDataChange = createValueEventListener("FirebaseRealTime_Listener", asyncId, path);
        const onCancel = (error) => {
            const status = mapDatabaseErrorToHttpStatus(error);
            const extraData = { "errorMessage": error.message };
            sendDatabaseEvent("FirebaseRealTime_Listener", asyncId, path, status, extraData);
        };

        query.on('value', onDataChange, onCancel);

        // Store listener and reference for future removal
        this.listenerMap[asyncId] = onDataChange;
        this.referenceMap[asyncId] = dataRef;
    },

    /**
     * Handles the "Exists" action to check data existence in Firebase.
     *
     * @param {number} asyncId - The unique async ID.
     * @param {object} fluentObj - The JSON object containing parameters.
     */
    existsValue: function(asyncId, fluentObj) {
        const { sendDatabaseEvent, buildReference, mapDatabaseErrorToHttpStatus } = window.FirebaseRealtimeExt;

        const path = fluentObj.path;
        const dataRef = buildReference(fluentObj);

        dataRef.once('value', (snapshot) => {
            const exists = snapshot.exists() ? 1.0 : 0.0;
            sendDatabaseEvent("FirebaseRealTime_Exists", asyncId, path, 200, { "value": exists });
        }, (error) => {
            const status = mapDatabaseErrorToHttpStatus(error);
            const extraData = { "errorMessage": error.message };
            sendDatabaseEvent("FirebaseRealTime_Exists", asyncId, path, status, extraData);
        });
    },

    /**
     * Handles the "Delete" action to remove data from Firebase.
     *
     * @param {number} asyncId - The unique async ID.
     * @param {object} fluentObj - The JSON object containing parameters.
     */
    deleteValue: function(asyncId, fluentObj) {
        const { sendDatabaseEvent, buildReference, mapDatabaseErrorToHttpStatus } = window.FirebaseRealtimeExt;

        const path = fluentObj.path;
        const dataRef = buildReference(fluentObj);

        dataRef.remove((error) => {
            const status = error ? mapDatabaseErrorToHttpStatus(error) : 200;
            const extraData = error ? { "errorMessage": error.message } : null;
            sendDatabaseEvent("FirebaseRealTime_Delete", asyncId, path, status, extraData);
        });
    },

    /**
     * Handles the "ListenerRemove" action to remove a specific Firebase listener.
     *
     * @param {number} asyncId - The unique async ID.
     * @param {object} fluentObj - The JSON object containing parameters.
     */
    removeListener: function(asyncId, fluentObj) {
        const { sendDatabaseEvent, referenceMap, listenerMap } = window.FirebaseRealtimeExt;

        const listenerToRemove = fluentObj.value;
        if (typeof listenerToRemove !== 'number') {
            console.error("FirebaseRealtimeExt: Unable to extract listener id.");
            sendDatabaseEvent("FirebaseRealTime_RemoveListener", asyncId, null, 400, { "errorMessage": "Unable to extract listener id." });
            return;
        }

        const dataRef = referenceMap[listenerToRemove];
        const listener = listenerMap[listenerToRemove];

        if (dataRef && listener) {
            dataRef.off('value', listener);
            delete listenerMap[listenerToRemove];
            delete referenceMap[listenerToRemove];
            sendDatabaseEvent("FirebaseRealTime_RemoveListener", asyncId, null, 200, { "value": listenerToRemove });
        } else {
            console.error(`FirebaseRealtimeExt: Listener or DatabaseReference not found for ID: ${listenerToRemove}`);
            sendDatabaseEvent("FirebaseRealTime_RemoveListener", asyncId, null, 400, { "errorMessage": `Listener or DatabaseReference not found for ID: ${listenerToRemove}` });
        }
    },

    /**
     * Handles the "ListenerRemoveAll" action to remove all Firebase listeners.
     *
     * @param {number} asyncId - The unique async ID.
     */
    removeAllListeners: function(asyncId) {
        const { sendDatabaseEvent, referenceMap, listenerMap } = window.FirebaseRealtimeExt;

        const removedListeners = [];

        for (const listenerId in listenerMap) {
            if (this.listenerMap.hasOwnProperty(listenerId)) {
                const dataRef = referenceMap[listenerId];
                const listener = listenerMap[listenerId];
                if (dataRef && listener) {
                    dataRef.off('value', listener);
                    removedListeners.push(Number(listenerId));
                    delete listenerMap[listenerId];
                    delete referenceMap[listenerId];
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
        let dataRef;
        if (!fluentObj.database) {
            dataRef = firebase.database().ref();
        } else {
            const databaseUrl = fluentObj.database;
            if (databaseUrl) {
                dataRef = firebase.database().refFromURL(databaseUrl);
            } else {
                dataRef = firebase.database().ref();
            }
        }

        const path = fluentObj.path;
        if (path) {
            dataRef = dataRef.child(path);
        }

        const push = fluentObj.push;
        if (push) {
            dataRef = dataRef.push();
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
        let query = dataRef;

        const orderBy = fluentObj.orderBy;
        if (orderBy) {
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
        if (fluentObj.hasOwnProperty('equalTo')) {
            const equalTo = fluentObj.equalTo;
            query = query.equalTo(equalTo);
        } else {
            // You can only use one of these (startAt or startAfter)
            if (fluentObj.hasOwnProperty('startAt')) {
                const startAt = fluentObj.startAt;
                query = query.startAt(startAt);
            } else if (fluentObj.hasOwnProperty('startAfter')) {
                const startAfter = fluentObj.startAfter;
                query = query.startAfter(startAfter);
            }

            // You can only use one of these (endAt or endBefore)
            if (fluentObj.hasOwnProperty('endAt')) {
                const endAt = fluentObj.endAt;
                query = query.endAt(endAt);
            } else if (fluentObj.hasOwnProperty('endBefore')) {
                const endBefore = fluentObj.endBefore;
                query = query.endBefore(endBefore);
            }
        }

        const limitToFirst = fluentObj.limitToFirst;
        if (limitToFirst && Number.isInteger(limitToFirst)) {
            query = query.limitToFirst(limitToFirst);
        }

        const limitToLast = fluentObj.limitToLast;
        if (limitToLast && Number.isInteger(limitToLast)) {
            query = query.limitToLast(limitToLast);
        }

        return query;
    },
});

const FIREBASE_STORAGE_SUCCESS = 0.0;
const FIREBASE_STORAGE_ERROR_NOT_FOUND = -1.0;
const FIREBASE_STORAGE_ERROR_INVALID_PARAMETERS = -2.0;
const FIREBASE_STORAGE_ERROR_NOT_INITIALIZED = -3.0;
const FIREBASE_STORAGE_ERROR_UNSUPPORTED = -4.0;

/**
 * Main SDK method to handle Firebase Realtime actions based on the input JSON.
 *
 * @param {string} fluentJson - The JSON string containing the action and parameters.
 * @return {number} The async ID.
 */
function FirebaseRealTime_SDK(fluentJson) {
    const { getNextAsyncId } = window.FirebaseUtils;
    const { sendDatabaseEvent, setValue, readValue, listenValue, existsValue, deleteValue, removeListener, removeAllListeners } = window.FirebaseRealtimeExt;

    const asyncId = getNextAsyncId();

    // Submit async task
    FirebaseSetup.submitAsyncTask(() => {
        let fluentObj;
        try {
            fluentObj = JSON.parse(fluentJson);
        } catch (e) {
            console.error("FirebaseRealtimeExt: Invalid JSON input", e);
            sendDatabaseEvent("FirebaseRealTime_SDK", asyncId, null, 400, { "errorMessage": "Invalid JSON input" });
            return;
        }

        const action = fluentObj.action;
        if (!action) {
            console.error("FirebaseRealtimeExt: Action not specified in JSON");
            sendDatabaseEvent("FirebaseRealTime_SDK", asyncId, null, 400, { "errorMessage": "Action not specified in JSON" });
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
                console.error(`FirebaseRealtimeExt: Unknown action: ${action}`);
                sendDatabaseEvent("FirebaseRealTime_SDK", asyncId, null, 400, { "errorMessage": `Unknown action: ${action}` });
                break;
        }
    });

    return asyncId;
}