

    show_debug_message("=== LEVEL UP PLAYER (TRANSACTION) ===");

    var firestore = firebase_firestore_get_instance();

    // The update callback runs once per attempt, with a fresh transaction
    // handle; the SDK runs it again when players/USER_123 changed on the
    // server between the read and the commit. The handle is kept in an
    // instance variable: a GML function literal does not capture the local
    // variables of the function around it.
    var _result = firebase_firestore_run_transaction(
        firestore,
        5,
        function(_transaction_ref)
        {
            transaction_ref = _transaction_ref;
            show_debug_message($"Transaction attempt started (handle {transaction_ref})");

            var _firestore = firebase_firestore_get_instance();
            var _player_ref = firebase_firestore_document(_firestore, "players/USER_123");

            firebase_firestore_transaction_get(
                transaction_ref,
                _player_ref,
                function(_error, _message, _snapshot)
                {
                    if (_error != FirestoreError.Ok)
                    {
                        show_debug_message($"[TRANSACTION GET ERROR] {_message}");
                        firebase_firestore_transaction_abort(transaction_ref, _message);
                        return;
                    }

                    var _level = 0;
                    if (firebase_firestore_document_snapshot_get_info(_snapshot).exists)
                    {
                        var _data = firebase_firestore_document_snapshot_get_data(_snapshot, FirestoreServerTimestampBehavior.None);
                        _level = _data[$ "level"] ?? 0;
                    }
                    show_debug_message($"Transaction read level = {_level}");

                    var _doc_ref = firebase_firestore_document_snapshot_reference(_snapshot);
                    firebase_firestore_transaction_set_merge(transaction_ref, _doc_ref, { level: _level + 1 });
                    firebase_firestore_transaction_commit(transaction_ref);

                    firebase_firestore_document_ref_release(_doc_ref);
                    firebase_firestore_document_snapshot_release(_snapshot);
                }
            );

            firebase_firestore_document_ref_release(_player_ref);
        },
        function(_error, _message)
        {
            show_debug_message(
                _error == FirestoreError.Ok
                ? "Transaction committed: level + 1"
                : $"[TRANSACTION ERROR] ({_error}) {_message}"
            );
        }
    );

    if (_result != FirebaseError.Ok)
    {
        show_debug_message($"[TRANSACTION CALL ERROR] ({_result}) {firebase_last_error_message()}");
    }
