window.FirebaseSetup = Object.assign(window.FirebaseSetup || {}, {

	currentId: 5000,

	getNextAsyncId: function() {
		const context = window.FirebaseSetup;
		context.currentId++;
		return context.currentId;
	},

	/**
     * Submits an asynchronous task.
     *
     * @param {function} task - The task to execute asynchronously.
     */
    submitAsyncTask: function(task) {
        // Implement task submission logic, e.g., using Web Workers or simply executing the task.
        // For simplicity, we'll execute the task asynchronously using setTimeout.
        setTimeout(() => {
            try {
                task();
            } catch (error) {
                console.error("FirebaseSetup: Async task failed", error);
            }
        }, 0);
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

	/**
     * Retrieves a boolean extension option.
     *
     * @param {string} extension - The extension name.
     * @param {string} key - The option key.
     * @return {boolean} The option value.
     */
	extOptionGetBool: function(extension, key) {
		const value = GMS_API.extension_get_option_value(extension, key);

		if (typeof value === 'string') {
            return value.toLowerCase() === 'true';
        } else if (typeof value === 'number') {
            return value > 0.5;
        } else if (typeof value === 'boolean') {
            return value;
        } else {
            // Default to false if the value is of an unexpected type
            return false;
        }
	},
	
	/**
	 * Retrieves a string extension option.
	 *
	 * @param {string} extension - The extension name.
	 * @param {string} key - The option key.
	 * @return {string} The option value.
	 */
	extOptionGetString: function(extension, key) {
		const value = GMS_API.extension_get_option_value(extension, key);

		if (typeof value === 'string') {
            return value;
        } else {
            // Default to string version of value if the value is of an unexpected type
            return String(value);
        }
	},
	
	/**
	 * Retrieves an integer extension option.
	 *
	 * @param {string} extension - The extension name.
	 * @param {string} key - The option key.
	 * @return {number} The option value.
	 */
	extOptionGetInt: function(extension, key) {
		const value = GMS_API.extension_get_option_value(extension, key);

        if (typeof value === 'number') {
            return Math.floor(value);
        } else if (typeof value === 'string') {
            const parsedValue = parseInt(value, 10);
            if (!isNaN(parsedValue)) {
                return parsedValue;
            } else {
                return 0;
            }
        } else if (typeof value === 'boolean') {
            return value ? 1 : 0;
        } else {
            // Default to 0 if the value is of an unexpected type
            return 0;
        }
	},

});

function SDKFirebaseSetup_Init() {
	return true;
}