
// Global namespace for Firebase Analytics
// Merge the new methods and properties into the existing FirebaseAnalyticsExt object
window.FirebaseAnalyticsExt = Object.assign(window.FirebaseAnalyticsExt || {}, {
	/**
	 * Helper function to check if analytics is initialized.
	 * Logs an error if `instance` is not ready.
	 * @return {boolean} `true` if `instance` is ready, `false` otherwise.
	 */
	isAnalyticsInitialized: function() {
		const context = window.FirebaseAnalyticsExt;
		if (!context.instance || !context.module) {
			console.warn("Firebase Analytics is not initialized. Please wait for initialization to complete.");
			return false;
		}
		return true;
	},

	/**
	 * Checks if the given event name is valid.
	 * An event name is valid if it does not start with reserved prefixes ("firebase_", "google_", "ga_"),
	 * starts with an alphabetic character, and contains only alphanumeric characters or underscores,
	 * with a total length between 1 and 40 characters.
	 * @param {string} eventName - The event name to validate.
	 * @return {boolean} `true` if the event name is valid, `false` otherwise.
	 */
	isValidEventName: function(eventName) {
		if (!eventName) {
			return false;  // Null or empty strings are not valid
		}
		// Define the regex pattern: Must start with a letter and be 1-40 characters long, without reserved prefixes.
		const pattern = /^(?!firebase_|google_|ga_)[a-zA-Z][a-zA-Z0-9_]{0,39}$/;
		return pattern.test(eventName);
	},

	/**
	 * Checks if the given property name is valid.
	 * A property name is valid if it does not start with reserved prefixes ("firebase_", "google_", "ga_"),
	 * starts with an alphabetic character, and contains only alphanumeric characters or underscores,
	 * with a total length between 1 and 24 characters.
	 * @param {string} propertyName - The property name to validate.
	 * @return {boolean} `true` if the property name is valid, `false` otherwise.
	 */
	isValidPropertyName: function(propertyName) {
		if (!propertyName) {
			return false;  // Null or empty strings are not valid
		}
		// Define the regex pattern: Must start with a letter and be 1-24 characters long, without reserved prefixes.
		const pattern = /^(?!firebase_|google_|ga_)[a-zA-Z][a-zA-Z0-9_]{0,23}$/;
		return pattern.test(propertyName);
	},

	/**
	 * Sends an async event with the specified type and data.
	 * This function constructs an event object and sends it using the GMS API.
	 * @param {string} eventType - The type of the event.
	 * @param {Object} data - A dictionary containing key-value pairs for the event.
	 */
	sendSocialAsyncEvent: function(eventType, data) {
		// Create a new event object
		const eventObject = { type: eventType };

		// Add each key-value pair from the data object to the event object
		for (const key in data) {
			if (data.hasOwnProperty(key)) {
				const value = data[key];

				// Determine the type and add it to the event object
				if (typeof value === 'string') {
					eventObject[key] = value;
				} else if (typeof value === 'number') {
					eventObject[key] = value;
				} else if (typeof value === 'boolean') {
					eventObject[key] = value ? 1 : 0;  // Convert booleans to 1 or 0
				} else if (typeof value === 'object' && value !== null) {
					eventObject[key] = JSON.stringify(value);  // Convert objects to JSON strings
				} else {
					// For other types, convert to string
					eventObject[key] = String(value);
				}
			}
		}

		// Send the constructed event using the GMS API
		GMS_API.send_async_event_social(eventObject);
	},
});

const FIREBASE_ANALYTICS_SUCCESS = 0.0;
const FIREBASE_ANALYTICS_ERROR_INVALID_PARAMETERS = -1.0;
const FIREBASE_ANALYTICS_ERROR_NOT_INITIALIZED = -2.0;
const FIREBASE_ANALYTICS_ERROR_UNSUPPORTED = -3.0;

/**
 * Enables or disables analytics data collection.
 * A value greater than or equal to `0.5` enables data collection.
 * @param {number} enabled - A number representing the boolean state (>= 0.5 for true).
 * @return {number} Returns `FIREBASE_ANALYTICS_SUCCESS` after execution, or an error code if not initialized.
 */
function FirebaseAnalytics_SetAnalyticsCollectionEnabled(enabled) {
	const { isAnalyticsInitialized, instance, module } = window.FirebaseAnalyticsExt;
	if (!isAnalyticsInitialized()) {
		return FIREBASE_ANALYTICS_ERROR_NOT_INITIALIZED;
	}
    module.setAnalyticsCollectionEnabled(instance, enabled >= 0.5);

	return FIREBASE_ANALYTICS_SUCCESS;
}

/**
 * Logs an event to Firebase Analytics with optional parameters.
 * If the event name is invalid, the function returns an error.
 * @param {string} event - The name of the event to log.
 * @param {Object|string} jsonValues - An object or a JSON string containing key-value pairs as event parameters.
 * @return {number} Returns `FIREBASE_ANALYTICS_SUCCESS` if successful, `FIREBASE_ANALYTICS_ERROR_INVALID_PARAMETERS` if the event name is invalid, or an error code if not initialized.
 */
function FirebaseAnalytics_LogEvent(event, jsonValues) {
	const { isAnalyticsInitialized, isValidEventName, sendSocialAsyncEvent, instance, module } = window.FirebaseAnalyticsExt;
	if (!isAnalyticsInitialized()) {
		return FIREBASE_ANALYTICS_ERROR_NOT_INITIALIZED;
	}
	
	// Validate event name before proceeding
    if (!isValidEventName(event)) {
        console.error("Invalid event name: " + event);
        return FIREBASE_ANALYTICS_ERROR_INVALID_PARAMETERS;
    }

    const data = {};  // Initialize the data object to store success or error states

    try {
        // Parse jsonValues if it's a string, otherwise use the object directly
        const params = typeof jsonValues === 'string' ? JSON.parse(jsonValues) : jsonValues || {};
        
        // Log the event with the parsed or provided parameters
        module.logEvent(instance, event, params);
        data.success = true;  // Indicate success
    } catch (error) {
        data.error = String(error);  // Capture and store the error message
        data.success = false;  // Indicate failure
    }

    // Send the async event with the result data
    sendSocialAsyncEvent("FirebaseAnalytics_LogEvent", data);

    return FIREBASE_ANALYTICS_SUCCESS;
}

/**
 * Resets all analytics data for the current app instance.
 * This functionality is not supported in the current Firebase Analytics JavaScript SDK.
 * @return {number} Returns `FIREBASE_ANALYTICS_ERROR_UNSUPPORTED` since this API is not implemented in the web SDK.
 */
function FirebaseAnalytics_ResetAnalyticsData() {
    console.warn("FirebaseAnalytics_ResetAnalyticsData :: This function is not supported in the current Firebase Analytics SDK.");
    return FIREBASE_ANALYTICS_ERROR_UNSUPPORTED;
}

/**
 * Sets the default parameters for all logged events using a JSON object or string.
 * If a parameter is invalid, the function logs the error and sets the state accordingly.
 * @param {Object|string} jsonValues - An object or a JSON string representing the default event parameters.
 * @return {number} Returns `FIREBASE_ANALYTICS_SUCCESS` after execution, or an error code if not initialized.
 */
function FirebaseAnalytics_SetDefaultEventParameters(jsonValues) {
	const { isAnalyticsInitialized, sendSocialAsyncEvent, instance, module } = window.FirebaseAnalyticsExt;

	if (!isAnalyticsInitialized()) {
		return FIREBASE_ANALYTICS_ERROR_NOT_INITIALIZED;
	}
	
	const data = {};  // Initialize the data object to store success or error states

    try {
        // If jsonValues is a string, parse it into an object. If it's already an object, use it directly.
        const params = typeof jsonValues === 'string' ? JSON.parse(jsonValues) : jsonValues || null;
        
        // Set default event parameters with the resolved params object
        module.setDefaultEventParameters(instance, params);
        data.success = true;  // Indicate success
    } catch (error) {
        data.error = String(error);  // Capture the error message
        data.success = false;  // Indicate failure
    }

    // Send the async event with the result data
    sendSocialAsyncEvent("FirebaseAnalytics_SetDefaultEventParameters", data);

    return FIREBASE_ANALYTICS_SUCCESS;
}

/**
 * Sets the duration of inactivity that causes a session to timeout, in milliseconds.
 * This functionality is not supported in the current Firebase Analytics JavaScript SDK.
 * @param {number} time - The session timeout duration in milliseconds.
 * @return {number} Returns `FIREBASE_ANALYTICS_ERROR_UNSUPPORTED` since this API is not implemented.
 */
function FirebaseAnalytics_SetSessionTimeoutDuration(time) {
    console.warn("FirebaseAnalytics_SetSessionTimeoutDuration :: This function is not supported in the current Firebase Analytics JavaScript SDK.");
    return FIREBASE_ANALYTICS_ERROR_UNSUPPORTED;
}

/**
 * Sets the user ID for Firebase Analytics.
 * If the user ID is empty or null, the ID is cleared.
 * @param {string} userID - The unique user identifier to associate with the session.
 * @return {number} Returns `FIREBASE_ANALYTICS_SUCCESS` after execution, or an error code if not initialized.
 */
function FirebaseAnalytics_SetUserId(userID) {
	const { isAnalyticsInitialized, instance, module } = window.FirebaseAnalyticsExt;

	if (!isAnalyticsInitialized()) {
		return FIREBASE_ANALYTICS_ERROR_NOT_INITIALIZED;
	}
	
	module.setUserId(instance, userID || null);  // If userID is empty, set to null to clear
	return FIREBASE_ANALYTICS_SUCCESS;
}

/**
 * Sets a user property for Firebase Analytics.
 * If the property name is invalid, the function logs the error and returns an error code.
 * @param {string} name - The name of the user property.
 * @param {string} value - The value of the user property.
 * @return {number} Returns `FIREBASE_ANALYTICS_SUCCESS` if successful, `FIREBASE_ANALYTICS_ERROR_INVALID_PARAMETERS` if the event name is invalid, or an error code if not initialized.
 */
function FirebaseAnalytics_SetUserProperty(name, value) {
	const { isAnalyticsInitialized, isValidPropertyName, instance, module } = window.FirebaseAnalyticsExt;

	if (!isAnalyticsInitialized()) {
		return FIREBASE_ANALYTICS_ERROR_NOT_INITIALIZED;
	}
	
	if (!isValidPropertyName(name)) {
        console.error("Invalid property name: " + name);
        return FIREBASE_ANALYTICS_ERROR_INVALID_PARAMETERS;
    }

    module.setUserProperties(instance, { [name]: value || null });  // If value is empty, set to null
	return FIREBASE_ANALYTICS_SUCCESS;
}

/**
 * Sets the user consent state for analytics and ad storage.
 * A value greater than or equal to `0.5` grants consent, while a value below `0.5` denies it.
 * @param {number} ads - Consent state for ad storage (>= 0.5 for GRANTED).
 * @param {number} analytics - Consent state for analytics storage (>= 0.5 for GRANTED).
 * @return {number} Returns `FIREBASE_ANALYTICS_SUCCESS` after execution, or an error code if not initialized.
 */
function FirebaseAnalytics_SetConsent(ads, analytics) {
	const { isAnalyticsInitialized, module } = window.FirebaseAnalyticsExt;

	if (!isAnalyticsInitialized()) {
		return FIREBASE_ANALYTICS_ERROR_NOT_INITIALIZED;
	}

	const consentMap = {
        ad_storage: ads >= 0.5 ? 'granted' : 'denied',
        analytics_storage: analytics >= 0.5 ? 'granted' : 'denied'
    };
    module.setConsent(consentMap);
	return FIREBASE_ANALYTICS_SUCCESS;
}

