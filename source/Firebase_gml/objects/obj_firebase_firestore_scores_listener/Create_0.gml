event_inherited();

text = "Collection Listener"

listener_ref = 0;
listener_query = 0;

var _firestore =
    firebase_firestore_get_instance();

var _scores =
    firebase_firestore_collection(
        _firestore,
        "scores"
    );


// ----------------------------------------------------
// Latest first
// ----------------------------------------------------

var _query =
    firebase_firestore_query_order_by(
        _scores,
        "created_at",
        FirestoreDirection.Descending
    );

firebase_firestore_collection_ref_release(
    _scores
);


// ----------------------------------------------------
// Latest 10
// ----------------------------------------------------

var _previous = _query;

_query =
    firebase_firestore_query_limit(
        _previous,
        10
    );

firebase_firestore_query_release(
    _previous
);


// Keep query alive for lifetime of listener.
listener_query = _query;


show_debug_message(
    "=== START SCORES LISTENER ==="
);


listener_ref =
    firebase_firestore_query_add_snapshot_listener(
        listener_query,

        false,

        function(_error, _message, _snapshot)
        {
            if (_error != 0)
            {
                show_debug_message(
                    $"[LISTENER ERROR] {_message}"
                );

                return;
            }


            show_debug_message("");
            show_debug_message(
                "=== SCORES CHANGED ==="
            );


            var _documents =
                firebase_firestore_query_snapshot_documents(
                    _snapshot
                );


            show_debug_message(
                $"Latest scores: {array_length(_documents)}"
            );


            for (
                var i = 0;
                i < array_length(_documents);
                i++
            )
            {
                var _doc =
                    _documents[i];

                var _id =
                    firebase_firestore_document_snapshot_id(
                        _doc
                    );

                var _data =
                    firebase_firestore_document_snapshot_get_data(
                        _doc,
                        FirestoreServerTimestampBehavior.Estimate
                    );


                show_debug_message(
                    $"#{i + 1} "
                    + $"[{_id}] "
                    + $"{_data.user} "
                    + $"score={_data.score} "
                    + $"mode={_data.mode}"
                );


                firebase_firestore_document_snapshot_release(
                    _doc
                );
            }


            firebase_firestore_query_snapshot_release(
                _snapshot
            );
        }
    );


show_debug_message(
    $"Listener = {listener_ref}"
);

