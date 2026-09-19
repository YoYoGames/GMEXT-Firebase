
//var _firestore =
//    firebase_firestore_get_instance();

//var _player =
//    firebase_firestore_document(
//        _firestore,
//        "players/USER_123"
//    );

//firebase_firestore_document_ref_get(
//    _player,
//    FirestoreSource.Default,
//    function(_error, _message, _snapshot)
//    {
//        if (_error != FirestoreError.Ok)
//        {
//            show_debug_message(_message);
//            return;
//        }

//        if (firebase_firestore_document_snapshot_get_info(
//            _snapshot
//        ).exists)
//        {
//            var _data =
//                firebase_firestore_document_snapshot_get_data(
//                    _snapshot,
//                    FirestoreServerTimestampBehavior.None
//                );

//            show_debug_message(
//                "Player: " + _data.name
//            );

//            show_debug_message(
//                "Score: "
//                + string(_data.score)
//            );
//        }

//        firebase_firestore_document_snapshot_release(
//            _snapshot
//        );
//    }
//);


	var firestore = firebase_firestore_get_instance();

	var player_ref = firebase_firestore_document(
	        firestore,
	        "players/USER_123"
	    );

    show_debug_message("=== READ PLAYER ===");

    var _started = firebase_firestore_document_ref_get(
        player_ref,
        FirestoreSource.Default,

        function(_error, _message, _snapshot)
        {
            if (_error != 0)
            {
                show_debug_message($"[READ ERROR] {_message}");
                return;
            }

            var _info =
                firebase_firestore_document_snapshot_get_info(_snapshot);

            var _exists = _info.exists;
            var _id = _info.id;
            var _cached = _info.is_from_cache;
            var _pending = _info.has_pending_writes;


            show_debug_message($"ID = {_id}");
            show_debug_message($"Exists = {_exists}");
            show_debug_message($"From cache = {_cached}");
            show_debug_message($"Pending writes = {_pending}");


            if (_exists)
            {
                var _data =
                    firebase_firestore_document_snapshot_get_data(
                        _snapshot,
                        FirestoreServerTimestampBehavior.None
                    );

                show_debug_message(
                    $"DATA = {json_stringify(_data)}"
                );
            }


            firebase_firestore_document_snapshot_release(
                _snapshot
            );
        }
    );

    show_debug_message($"READ started = {_started == FirebaseError.Ok}");

    if (_started != FirebaseError.Ok)
    {
        show_debug_message($"[ERROR] {firebase_last_error_code()}: {firebase_last_error_message()}");
    }

    firebase_firestore_document_ref_release(player_ref);



