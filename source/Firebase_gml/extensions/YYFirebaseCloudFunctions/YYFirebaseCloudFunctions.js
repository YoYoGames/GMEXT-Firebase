// Global namespace for Firebase Functions
// Merge the new methods and properties into the existing FirebaseFunctionsExt object
window.FirebaseFunctionsExt = Object.assign(window.FirebaseFunctionsExt || {}, {
    
	/**
     * Helper function to check if functions is initialized.
     * Logs an error if `module` is not ready.
     * @return {boolean} `true` if `module` is ready, `false` otherwise.
     */
    isFunctionsInitialized: function() {
        const context = window.FirebaseFunctionsExt;
        if (!context.instance || !context.module) {
            console.warn("Firebase Functions is not initialized. Please wait for initialization to complete.");
            return false;
        }
        return true;
    },

    /**
     * Parses a string representation of data and converts it into the appropriate JavaScript object.
     *
     * @param {string} data - The string representation of the data to be parsed.
     * @return {any} The parsed data as an appropriate JavaScript object.
     * @throws {Error} If an error occurs during parsing.
     */
    parseDataString: function(data) {
        if (!data || data.length === 0) {
            return data;
        }

        const lowercaseData = data.toLowerCase();

        if (lowercaseData === "@@null$$") {
            return null;
        } else if (lowercaseData === "@@true$$") {
            return true;
        } else if (lowercaseData === "@@false$$") {
            return false;
        }

        // Try parsing as JSON object or array
        try {
            return JSON.parse(data);
        } catch (e) {
            // Not a valid JSON
        }

        // Try parsing as number
        if (!isNaN(data)) {
            if (data.includes('.')) {
                return parseFloat(data);
            } else {
                return parseInt(data, 10);
            }
        }

        // Return as string
        return data;
    },

    /**
     * Sends a functions event with the specified parameters.
     *
     * @param {string} eventType - The type of event.
     * @param {number} asyncId - The unique async ID.
     * @param {number} status - The HTTP status code representing the result.
     * @param {object|null} extraData - Additional data to include in the event.
     */
    sendFunctionsEvent: function(eventType, asyncId, status, extraData) {
        const { sendSocialAsyncEvent } = window.FirebaseSetup;

        const data = {
            listener: asyncId,
            status: status,
        };

        if (extraData !== null && extraData !== undefined) {
            Object.assign(data, extraData);
        }

        sendSocialAsyncEvent(eventType, data);
    },

    /**
     * Sends an error event with the specified parameters.
     *
     * @param {string} eventType - The type of event.
     * @param {number} asyncId - The unique async ID.
     * @param {number} statusCode - The HTTP status code representing the error.
     * @param {string} errorMessage - The error message to include.
     */
    sendErrorEvent: function(eventType, asyncId, statusCode, errorMessage) {
        const { sendFunctionsEvent } = window.FirebaseFunctionsExt;

        const extraData = { "error":  statusCode, "errorMessage": errorMessage };
        sendFunctionsEvent(eventType, asyncId, statusCode, extraData);
    },
});

const FIREBASE_FUNCTIONS_SUCCESS = 0.0;
const FIREBASE_FUNCTIONS_ERROR_NOT_FOUND = -1.0;
const FIREBASE_FUNCTIONS_ERROR_INVALID_PARAMETERS = -2.0;
const FIREBASE_FUNCTIONS_ERROR_NOT_INITIALIZED = -3.0;
const FIREBASE_FUNCTIONS_ERROR_UNSUPPORTED = -4.0;

/**
 * Initializes Firebase Cloud Functions.
 */
function SDKFirebaseCloudFunctions_Init() {
    const { extOptionGetBool, extOptionGetString, extOptionGetInt } = window.FirebaseSetup;
    const { module, instance, isFunctionsInitialized } = window.FirebaseFunctionsExt;

    if (!isFunctionsInitialized()) {
        return FIREBASE_FUNCTIONS_ERROR_NOT_INITIALIZED;
    }

    const useEmulator = extOptionGetBool("YYFirebaseCloudFunctions", "useEmulator");
    if (useEmulator) {
        const host = extOptionGetString("YYFirebaseCloudFunctions", "emulatorHost");
        const port = extOptionGetInt("YYFirebaseCloudFunctions", "emulatorPort");

        module.connectFunctionsEmulator(instance, host, port);
    }
}

/**
 * Calls a Firebase Cloud Function with the specified name, data, and timeout.
 *
 * @param {string} functionName - The name of the Cloud Function to call.
 * @param {string} data - The data to send to the Cloud Function, represented as a string.
 * @param {number} timeoutSeconds - The timeout in seconds. If negative, timeout is not set.
 * @return {number} The async ID.
 */
function SDKFirebaseCloudFunctions_Call(functionName, data, timeoutSeconds) {
    const { getNextAsyncId, submitAsyncTask } = window.FirebaseSetup;
    const { module, instance, isFunctionsInitialized, sendFunctionsEvent, sendErrorEvent, parseDataString } = window.FirebaseFunctionsExt
    
    if (!isFunctionsInitialized()) {
        return FIREBASE_FUNCTIONS_ERROR_NOT_INITIALIZED;
    }

    const asyncId = getNextAsyncId();

    // Submit async task
    submitAsyncTask(() => {
        let parsedData;

        // Parse the data
        try {
            parsedData = parseDataString(data);
        } catch (e) {
            console.error("Invalid data input", e);
            sendErrorEvent("FirebaseCloudFunctions_Call", asyncId, 400, "Invalid data input");
            return;
        }

        if (!instance) {
            console.error("Firebase Functions instance is not initialized.");
            sendErrorEvent("FirebaseCloudFunctions_Call", asyncId, 500, "Firebase Functions not initialized");
            return;
        }

        // Get the callable function reference
        const callable = module.httpsCallable(instance, functionName);

        // Note: The Firebase Web SDK does not support setting timeouts per call directly.
        let callPromise = callable(parsedData);

        if (timeoutSeconds > 0) {
            const timeoutPromise = new Promise((_, reject) => {
                setTimeout(() => {
                    reject(new Error('Deadline Exceeded'));
                }, timeoutSeconds * 1000);
            });

            callPromise = Promise.race([callPromise, timeoutPromise]);
        }

        callPromise
            .then(result => {
                const responseData = result.data;

                const extraData = {
                    value: responseData
                };

                sendFunctionsEvent("FirebaseCloudFunctions_Call", asyncId, 200, extraData);
            })
            .catch(error => {
                let errorCode = error.code ?? 400;
                let errorMessage = error.message ?? "Unknown error";
                sendErrorEvent("FirebaseCloudFunctions_Call", asyncId, errorCode, errorMessage);
            });
    });

    return asyncId;
}
