
	var firestore = firebase_firestore_get_instance();

	var player_ref = firebase_firestore_document(
	        firestore,
	        "players/USER_123"
	    );
	
    firebase_firestore_document_ref_set_merge(
        player_ref,

        {
            title: "Grand Master",
            favorite_unit: "cosmic_whale"
        },

        function(_error, _message)
        {
            show_debug_message(
                _error == 0
                ? "Merge successful"
                : $"[MERGE ERROR] {_message}"
            );
        }
    );
