event_inherited();

text = "Doc Read"



event_inherited()

text = "Doc Listener"

player_listener = 0

function firestore_demo_listener_start()
{
	var firestore = firebase_firestore_get_instance();

	var player_ref = firebase_firestore_document(
	        firestore,
	        "players/USER_123"
	    );
	
    if (player_listener != 0)
    {
        show_debug_message("Listener already active");
        return;
    }


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


                var _exists =
                    firebase_firestore_document_snapshot_exists(
                        _snapshot
                    );

                var _id =
                    firebase_firestore_document_snapshot_id(
                        _snapshot
                    );

                var _cached =
                    firebase_firestore_document_snapshot_metadata_is_from_cache(
                        _snapshot
                    );

                var _pending =
                    firebase_firestore_document_snapshot_metadata_has_pending_writes(
                        _snapshot
                    );


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


    show_debug_message(
        $"Listener = {player_listener}"
    );
}





function firestore_demo_listener_stop()
{
	var firestore = firebase_firestore_get_instance();

	var player_ref = firebase_firestore_document(
	        firestore,
	        "players/USER_123"
	    );
	
    if (player_listener == 0)
        return;

    firebase_firestore_listener_registration_remove(
        player_listener
    );

    player_listener = 0;

    show_debug_message("Listener removed");
}


