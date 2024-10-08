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
	sendAsyncEvent: function(eventType, data) {
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