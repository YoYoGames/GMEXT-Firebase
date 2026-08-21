var firestore = firebase_firestore_get_instance();

var scores = firebase_firestore_collection(
        firestore,
        "scores"
    );

    var _timestamp =
        firebase_firestore_field_value_server_timestamp();


    var _started =
        firebase_firestore_collection_ref_add(
            scores,

            {
                user: "USER_123",
                score: irandom_range(1000, 9999),
                mode: choose("ranked", "casual", "tournament"),
                tags: ["season_2", "online"],
                created_at: _timestamp
            },

            function(_error, _message, _document)
            {
                if (_error != 0)
                {
                    show_debug_message(
                        $"[ADD ERROR] {_message}"
                    );

                    return;
                }


                show_debug_message(
                    $"Created ID: {firebase_firestore_document_ref_id(_document)}"
                );

                show_debug_message(
                    $"Path: {firebase_firestore_document_ref_path(_document)}"
                );


                firebase_firestore_document_ref_release(
                    _document
                );
            }
        );


    firebase_firestore_field_value_release(_timestamp);

    show_debug_message($"ADD started = {_started}");


