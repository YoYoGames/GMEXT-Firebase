event_inherited()

text = "Doc Listener"

player_listener = 0

function firestore_demo_listener_start()
{
    if (player_listener != 0)
    {
        show_debug_message("Listener already active");
        return;
    }

	var firestore = firebase_firestore_get_instance();

	var player_ref = firebase_firestore_document(
	        firestore,
	        "players/USER_123"
	    );


    player_listener =
        firebase_firestore_document_ref_add_snapshot_listener(
            player_ref,

            true, // include metadata changes

            function(_error, _message, _snapshot)
            {
                if (_error != 0)
                {
                    show_debug_message(
                        $"[LISTENER ERROR] {_message}"
                    );

                    return;
                }


                var _info =
                    firebase_firestore_document_snapshot_get_info(
                        _snapshot
                    );

                var _exists = _info.exists;
                var _id = _info.id;
                var _cached = _info.is_from_cache;
                var _pending = _info.has_pending_writes;


                show_debug_message("=== PLAYER CHANGED ===");
                show_debug_message($"ID = {_id}");
                show_debug_message($"Exists = {_exists}");
                show_debug_message($"From cache = {_cached}");
                show_debug_message($"Pending writes = {_pending}");


                if (_exists)
                {
                    var _data =
                        firebase_firestore_document_snapshot_get_data(
                            _snapshot,
                            FirestoreServerTimestampBehavior.Estimate
                        );

                    show_debug_message(
                        json_stringify(_data)
                    );
                }
                else
                {
                    show_debug_message(
                        "Document no longer exists"
                    );
                }


                firebase_firestore_document_snapshot_release(
                    _snapshot
                );
            }
        );

    firebase_firestore_document_ref_release(player_ref);


    show_debug_message(
        $"Listener = {player_listener}"
    );
}





function firestore_demo_listener_stop()
{
    if (player_listener == 0)
        return;

    firebase_firestore_listener_registration_remove(
        player_listener
    );

    player_listener = 0;

    show_debug_message("Listener removed");
}


