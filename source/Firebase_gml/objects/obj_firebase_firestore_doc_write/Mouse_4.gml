var _firestore =
    firebase_firestore_get_instance();

var _player =
    firebase_firestore_document(
        _firestore,
        "players/USER_123"
    );

firebase_firestore_document_ref_set(
	    _player,
	    {
	        name: "Player",
	        level: 7,
	        score: 12500,
	        premium: true
	    },
	    function(_error, _message)
	    {
	        if (_error == FirestoreError.Ok)
	        {
	            show_debug_message(
	                "Firestore write OK"
	            );
	        }
	        else
	        {
	            show_debug_message(_message);
	        }
	    }
	);
