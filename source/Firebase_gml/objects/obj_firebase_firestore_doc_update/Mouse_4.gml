
	var firestore = firebase_firestore_get_instance();

	var player_ref = firebase_firestore_document(
	        firestore,
	        "players/USER_123"
	    );
	
    show_debug_message("=== UPDATE PLAYER ===");

    // Atomic: level += 1
    var _level_inc =
        firebase_firestore_field_value_increment_integer(1);

    // Atomic: rating += 0.25
    var _rating_inc =
        firebase_firestore_field_value_increment_double(0.25);

    // Add these only if not already present.
    var _tags_add =
        firebase_firestore_field_value_array_union(
            [
                "champion",
                "season_2"
            ]
        );

    // Remove every matching value.
    var _tags_remove =
        firebase_firestore_field_value_array_remove(
            [
                "mage"
            ]
        );

    // Server time.
    var _updated =
        firebase_firestore_field_value_server_timestamp();

    // Remove a field entirely.
    var _delete =
        firebase_firestore_field_value_delete();


    var _started = firebase_firestore_document_ref_update(
        player_ref,

        {
            level: _level_inc,
            rating: _rating_inc,

            // We'll use union here.
            tags: _tags_add,

            updated_at: _updated,

            temporary_field: _delete
        },

        function(_error, _message)
        {
            show_debug_message(
                _error == 0
                ? "Player updated"
                : $"[UPDATE ERROR] {_message}"
            );
        }
    );


    firebase_firestore_field_value_release(_level_inc);
    firebase_firestore_field_value_release(_rating_inc);
    firebase_firestore_field_value_release(_tags_add);
    firebase_firestore_field_value_release(_tags_remove);
    firebase_firestore_field_value_release(_updated);
    firebase_firestore_field_value_release(_delete);

    show_debug_message($"UPDATE started = {_started}");
