

// Global namespace for Firebase Remote Config
window.FirebaseRemoteConfigExt = {
    remoteConfigInstance: null,
    remoteConfigModule: null,
    configUpdateListeners: [], // Array to store listeners for configuration changes
    pollingIntervalId: null,   // Track the polling interval ID for stopping

	/**
	 * Helper function to check if Remote Config is initialized.
	 * Logs an error if `remoteConfigInstance` is not ready.
	 * @return {boolean} `true` if `remoteConfigInstance` is ready, `false` otherwise.
	 */
	isRemoteConfigInitialized: function() {
		const context = window.FirebaseRemoteConfigExt;
		if (!context.remoteConfigInstance || !context.remoteConfigModule) {
			console.warn("Firebase Remote Config is not initialized. Please wait for initialization to complete.");
			return false;
		}
		return true;
	},

	/**
	 * Sends an async event with the specified type and data.
	 * This function constructs an event object and sends it using the GMS API.
	 * @param {string} eventType - The type of the event.
	 * @param {Object} data - A dictionary containing key-value pairs for the event.
	 */
	sendAsyncEvent: function(eventType, data) {
		const eventObject = { type: eventType };

		for (const key in data) {
			if (data.hasOwnProperty(key)) {
				const value = data[key];

				if (typeof value === 'string') {
					eventObject[key] = value;
				} else if (typeof value === 'number') {
					eventObject[key] = value;
				} else if (typeof value === 'boolean') {
					eventObject[key] = value ? 1 : 0;
				} else if (typeof value === 'object' && value !== null) {
					eventObject[key] = JSON.stringify(value);
				} else {
					eventObject[key] = String(value);
				}
			}
		}

		GMS_API.send_async_event_social(eventObject);
	},

    /**
     * Registers a callback function object for configuration changes.
     * @param {Object} listener - An object containing `onUpdate` and `onFailure` methods.
     * @return {Object} A control object with a `remove` method to stop the listener.
     */
    addConfigUpdateListener: function (listener) {
		const context = window.FirebaseRemoteConfigExt;

        if (typeof listener !== 'object' || (!listener.onUpdate && !listener.onFailure)) {
            console.error("Listener must be an object containing at least one of 'onUpdate' or 'onFailure' methods.");
            return null;
        }

        context.configUpdateListeners.push(listener);

        // Start polling when the first listener is added
        if (context.configUpdateListeners.length === 1) {
            context.startPollingForUpdates();
        }

        const removeListener = () => {
            const index = context.configUpdateListeners.indexOf(listener);
            if (index >= 0) {
                context.configUpdateListeners.splice(index, 1);
                console.log("Listener removed.");

                // Stop polling if no more listeners are registered
                if (context.configUpdateListeners.length === 0) {
                    context.stopPollingForUpdates();
                }
            }
        };

        return { remove: removeListener };
    },

    /**
     * Calls all registered listeners with the updated config values.
     */
    notifyConfigUpdateListeners: function (updatedKeys) {
		const context = window.FirebaseRemoteConfigExt;

        context.configUpdateListeners.forEach((listener) => {
            if (typeof listener.onUpdate === 'function') {
                try {
                    listener.onUpdate({ success: 1.0, keys: JSON.stringify(updatedKeys) });
                } catch (error) {
                    console.error("Error in config update listener:", error);
                }
            }
        });
    },

    /**
     * Calls all registered listeners when a configuration error occurs.
     * @param {Object} errorData - The error details to pass to each listener.
     */
    notifyErrorListeners: function (error) {
		const context = window.FirebaseRemoteConfigExt;

        context.configUpdateListeners.forEach((listener) => {
            if (typeof listener.onFailure === 'function') {
                try {
                    listener.onFailure({ success: 0.0, error: String(error) });
                } catch (error) {
                    console.error("Error in config error listener:", error);
                }
            }
        });
    },

    /**
     * Starts a polling mechanism to periodically check for configuration updates.
     * @param {number} [intervalMs=60000] - The polling interval in milliseconds.
     */
    startPollingForUpdates: function (intervalMs = 60000) {
		const context = window.FirebaseRemoteConfigExt;

        if (context.pollingIntervalId) {
            console.warn("Polling is already active.");
            return;
        }

        console.log(`Starting polling for Remote Config updates every ${intervalMs} ms.`);
        let previousValues = {};

        context.pollingIntervalId = setInterval(async () => {
            try {
                const result = await context.remoteConfigInstance.fetchAndActivate();
                if (result) {
                    const updatedValues = context.getAllConfigValues();
                    const updatedKeys = [];

                    for (const key in updatedValues) {
                        if (updatedValues[key] !== previousValues[key]) {
                            updatedKeys.push(key);
                        }
                    }

                    for (const key in previousValues) {
                        if (!(key in updatedValues)) {
                            updatedKeys.push(key);
                        }
                    }

                    previousValues = { ...updatedValues };
                    if (updatedKeys.length > 0) {
                        this.notifyConfigUpdateListeners(updatedKeys);
                    }
                }
            } catch (error) {
                context.notifyErrorListeners(error.message || "Unknown error");
            }
        }, intervalMs);
    },

    /**
     * Stops the polling mechanism for configuration updates.
     */
    stopPollingForUpdates: function () {
		const context = window.FirebaseRemoteConfigExt;

        if (context.pollingIntervalId) {
            clearInterval(context.pollingIntervalId);
            context.pollingIntervalId = null;
            console.log("Stopped polling for Remote Config updates.");
        }
    },
};

// Firebase Remote Config error codes
const FIREBASE_REMOTE_CONFIG_SUCCESS = 0.0;
const FIREBASE_REMOTE_CONFIG_ERROR_UNSUPPORTED = -1.0;
const FIREBASE_REMOTE_CONFIG_ERROR_NOT_INITIALIZED = -2.0;

// Dynamic import to initialize Firebase Remote Config asynchronously
import('https://www.gstatic.com/firebasejs/9.6.1/firebase-remote-config.js')
    .then((module) => {
        window.FirebaseRemoteConfigExt.remoteConfigInstance = module.getRemoteConfig();
		window.FirebaseRemoteConfigExt.remoteConfigModule = module;
        console.log("Firebase Remote Config initialized successfully.");
    })
    .catch((err) => {
        console.error("Failed to load Firebase Remote Config module:", err);
    });


/**
 * Initializes Firebase Remote Config with a specified minimum fetch interval.
 * @param {number} milliseconds Minimum fetch interval in milliseconds.
 * @return {number} Returns `FIREBASE_REMOTE_CONFIG_SUCCESS` if successful, or an error code if not initialized.
 */
function FirebaseRemoteConfig_Initialize(seconds) {
	const { isRemoteConfigInitialized, remoteConfigInstance } = window.FirebaseRemoteConfigExt;

	if (!isRemoteConfigInitialized()) {
		console.warn("Firebase Remote Config module is not yet loaded.");
		return FIREBASE_REMOTE_CONFIG_ERROR_NOT_INITIALIZED;
	}

	// Convert milliseconds to seconds as the fetch interval is set in seconds
	const minimumFetchIntervalSeconds = seconds;

	// Set the configuration settings for the Remote Config instance
	remoteConfigInstance.settings = {
		minimumFetchIntervalMillis: minimumFetchIntervalSeconds,
	};

	return FIREBASE_REMOTE_CONFIG_SUCCESS;
}

/**
 * Fetches and activates remote configuration values.
 * @return {number} A promise that resolves to `FIREBASE_REMOTE_CONFIG_SUCCESS` if successful.
 */
function FirebaseRemoteConfig_FetchAndActivate() {
	const { isRemoteConfigInitialized, remoteConfigModule, remoteConfigInstance, sendAsyncEvent } = window.FirebaseRemoteConfigExt;

	if (!isRemoteConfigInitialized()) {
		return FIREBASE_REMOTE_CONFIG_ERROR_NOT_INITIALIZED;
	}

	remoteConfigModule.fetchAndActivate(remoteConfigInstance)
		.then((result) => {
			sendAsyncEvent("FirebaseRemoteConfig_FetchAndActivate", { success: 1.0 });
		})
		.catch((error) => {
			sendAsyncEvent("FirebaseRemoteConfig_FetchAndActivate", { success: 0.0, error: String(error) });
		});
	
	return FIREBASE_REMOTE_CONFIG_SUCCESS;
}

/**
 * Resets the Firebase Remote Config instance.
 * This functionality is currently not supported in the web SDK.
 * @return {number} Returns `FIREBASE_REMOTE_CONFIG_ERROR_UNSUPPORTED`.
 */
function FirebaseRemoteConfig_Reset() {
	console.warn("FirebaseRemoteConfig_Reset :: Is not supported in the Firebase web SDK.");
	return FIREBASE_REMOTE_CONFIG_ERROR_UNSUPPORTED;
}

/**
 * Sets default remote configuration parameters using a JSON object or string.
 * @param {Object|string} json - A JSON object or string representing the default configuration.
 * @return {number} Returns `FIREBASE_REMOTE_CONFIG_SUCCESS` after setting defaults, or an error code if not initialized.
 */
function FirebaseRemoteConfig_SetDefaultsAsync(json) {
	const { isRemoteConfigInitialized, remoteConfigInstance, sendAsyncEvent } = window.FirebaseRemoteConfigExt;

	if (!isRemoteConfigInitialized()) {
		return FIREBASE_REMOTE_CONFIG_ERROR_NOT_INITIALIZED;
	}

	const data = {};  // Initialize the data object to store success or error states

	try {
		// If json is a string, parse it into an object.
		const defaults = typeof json === 'string' ? JSON.parse(json) : json || {};

		// Set the defaults in the Remote Config instance
		remoteConfigInstance.defaultConfig = defaults;
		data.success = 1.0;

	} catch (error) {
		data.success = 0.0;
		data.error = String(error);
	}

	sendAsyncEvent("FirebaseRemoteConfig_SetDefaultsAsync", data);

	return FIREBASE_REMOTE_CONFIG_SUCCESS;
}

/**
 * Gets all the keys currently stored in the Remote Config.
 * @return {Array<string>} An array of keys, or an empty array if not initialized.
 */
function FirebaseRemoteConfig_GetKeys() {
	const { isRemoteConfigInitialized, remoteConfigModule, remoteConfigInstance } = window.FirebaseRemoteConfigExt;

	if (!isRemoteConfigInitialized()) {
		return [];
	}

	let keyValues = remoteConfigModule.getAll(remoteConfigInstance);

	return JSON.stringify(Object.keys(keyValues));
}

/**
 * Gets a string value from the remote configuration.
 * @param {string} key - The key for the remote configuration parameter.
 * @return {string|null} The value of the specified key, or `null` if not found.
 */
function FirebaseRemoteConfig_GetString(key) {
	const { isRemoteConfigInitialized, remoteConfigModule, remoteConfigInstance } = window.FirebaseRemoteConfigExt;

	if (!isRemoteConfigInitialized()) {
		console.warn("Remote Config is not initialized.");
		return "";
	}

	return remoteConfigModule.getString(remoteConfigInstance, key);
}

/**
 * Gets a double value from the remote configuration.
 * @param {string} key - The key for the remote configuration parameter.
 * @return {number} The value of the specified key, or `0` if not found.
 */
function FirebaseRemoteConfig_GetDouble(key) {
	const { isRemoteConfigInitialized, remoteConfigModule, remoteConfigInstance } = window.FirebaseRemoteConfigExt;

	if (!isRemoteConfigInitialized()) {
		console.warn("Remote Config is not initialized.");
		return 0;
	}

	return remoteConfigModule.getNumber(remoteConfigInstance, key);
}

/**
 * Registers a listener for Firebase Remote Config updates.
 * This listener will listen for changes in configuration and report them through the `onUpdate` callback.
 * If an error occurs during the fetch process, the `onFailure` callback will be triggered.
 * 
 * When the listener is registered, it starts a polling mechanism to periodically check for configuration updates.
 * The polling interval is set to 60 seconds (60000 milliseconds) by default.
 * 
 * The registered listener sends an asynchronous event named `FirebaseRemoteConfig_AddOnConfigUpdateListener` 
 * with the following data structure:
 * 
 * - **On Success (`onUpdate`)**: `{ success: 1.0, keys: [Array of Updated Keys] }`
 * - **On Failure (`onFailure`)**: `{ success: 0.0, error: "Error Message" }`
 * 
 * @function FirebaseRemoteConfig_AddOnConfigUpdateListener
 * @memberof FirebaseRemoteConfigExt
 * @returns {number} Returns `FIREBASE_REMOTE_CONFIG_SUCCESS` if the listener was registered successfully, 
 *                   or `FIREBASE_REMOTE_CONFIG_ERROR_NOT_INITIALIZED` if the Remote Config module is not initialized.
 */
function FirebaseRemoteConfig_AddOnConfigUpdateListener() {
	const { isRemoteConfigInitialized, configUpdateListeners, addConfigUpdateListener, sendAsyncEvent } = window.FirebaseRemoteConfigExt;

	if (!isRemoteConfigInitialized()) {
		return FIREBASE_REMOTE_CONFIG_ERROR_NOT_INITIALIZED;
	}

	if (configUpdateListeners.length > 0) {
		console.warn("FirebaseRemoteConfig_AddOnConfigUpdateListener :: Multiple listeners are not supported.");
		return FIREBASE_REMOTE_CONFIG_ERROR_UNSUPPORTED;
	}

	addConfigUpdateListener({
		onUpdate: (updateData) => {
			sendAsyncEvent("FirebaseRemoteConfig_AddOnConfigUpdateListener", updateData);
		},
		onFailure: (failureData) => {
			sendAsyncEvent("FirebaseRemoteConfig_AddOnConfigUpdateListener", failureData);
		},
	});

	return FIREBASE_REMOTE_CONFIG_SUCCESS;
}

