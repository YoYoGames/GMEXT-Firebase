

    show_debug_message("=== DELETE PLAYER ===");
	
	var firestore = firebase_firestore_get_instance();

	var player_ref = firebase_firestore_document(
	        firestore,
	        "players/USER_123"
	    );

    firebase_firestore_document_ref_delete(
        player_ref,
        function(_error, _message)
        {
            show_debug_message(
                _error == 0
                ? "Document deleted"
                : $"[DELETE ERROR] {_message}"
            );
        }
    );
