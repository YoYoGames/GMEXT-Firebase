
if (query_running)
{
    show_debug_message("Query already running");
    exit;
}

var _firestore = firebase_firestore_get_instance();
var _scores = firebase_firestore_collection(
    _firestore,
    "scores"
);


// ----------------------------------------------------
// mode == "ranked"
// ----------------------------------------------------

var _query = firebase_firestore_query_where_equal_to(
    _scores,
    "mode",
    "ranked"
);

firebase_firestore_collection_ref_release(_scores);


// ----------------------------------------------------
// Highest score first
// ----------------------------------------------------

var _previous = _query;

_query = firebase_firestore_query_order_by(
    _previous,
    "score",
    FirestoreDirection.Descending
);

firebase_firestore_query_release(_previous);


// ----------------------------------------------------
// Top 10
// ----------------------------------------------------

_previous = _query;

_query = firebase_firestore_query_limit(
    _previous,
    10
);

firebase_firestore_query_release(_previous);


// Keep final query alive during async operation.
query_ref = _query;
query_running = true;


show_debug_message("=== QUERY RANKED SCORES ===");


var _started = firebase_firestore_query_get(
    query_ref,
    FirestoreSource.Default,

    function(_error, _message, _snapshot)
    {
        if (_error != 0)
        {
            show_debug_message(
                $"[QUERY ERROR] {_message}"
            );
        }
        else
        {
            var _documents =
                firebase_firestore_query_snapshot_documents(
                    _snapshot
                );


            show_debug_message(
                $"Found {array_length(_documents)} documents"
            );


            for (
                var i = 0;
                i < array_length(_documents);
                i++
            )
            {
                var _doc = _documents[i];

                var _id =
                    firebase_firestore_document_snapshot_id(
                        _doc
                    );

                var _data =
                    firebase_firestore_document_snapshot_get_data(
                        _doc,
                        FirestoreServerTimestampBehavior.None
                    );


                show_debug_message(
                    $"#{i + 1} [{_id}] "
                    + $"{_data.user} - "
                    + $"{_data.score} - "
                    + $"{_data.mode}"
                );


                // Timestamp
                if (
                    variable_struct_exists(
                        _data,
                        "created_at"
                    )
                )
                {
                    var _time = _data.created_at;

                    show_debug_message(
                        $"    timestamp = {_time.seconds}.{_time.nanoseconds}"
                    );
                }


                // Tags
                if (
                    variable_struct_exists(
                        _data,
                        "tags"
                    )
                )
                {
                    show_debug_message(
                        $"    tags = {json_stringify(_data.tags)}"
                    );
                }


                firebase_firestore_document_snapshot_release(
                    _doc
                );
            }


            firebase_firestore_query_snapshot_release(
                _snapshot
            );
        }


        // Query operation finished.
        if (query_ref != 0)
        {
            firebase_firestore_query_release(
                query_ref
            );

            query_ref = 0;
        }

        query_running = false;

        show_debug_message("=== QUERY COMPLETE ===");
    }
);


show_debug_message(
    $"Query started = {_started}"
);


if (!_started)
{
    show_debug_message(
        $"[ERROR] {firebase_last_error_code()}: "
        + $"{firebase_last_error_message()}"
    );

    firebase_firestore_query_release(
        query_ref
    );

    query_ref = 0;
    query_running = false;
}

