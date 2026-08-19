
var _firestore =
    firebase_firestore_get_instance();

var _player =
    firebase_firestore_document(
        _firestore,
        "players/USER_123"
    );

firebase_firestore_document_ref_get(
    _player,
    FirestoreSource.Default,
    function(_error, _message, _snapshot)
    {
        if (_error != FirestoreError.Ok)
        {
            show_debug_message(_message);
            return;
        }

        if (firebase_firestore_document_snapshot_exists(
            _snapshot
        ))
        {
            var _data =
                firebase_firestore_document_snapshot_get_data(
                    _snapshot,
                    FirestoreServerTimestampBehavior.None
                );

            show_debug_message(
                "Player: " + _data.name
            );

            show_debug_message(
                "Score: "
                + string(_data.score)
            );
        }

        firebase_firestore_document_snapshot_release(
            _snapshot
        );
    }
);