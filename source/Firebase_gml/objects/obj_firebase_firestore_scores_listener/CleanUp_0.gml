if (listener_ref != 0)
{
    firebase_firestore_listener_registration_remove(
        listener_ref
    );

    listener_ref = 0;
}


if (listener_query != 0)
{
    firebase_firestore_query_release(
        listener_query
    );

    listener_query = 0;
}


show_debug_message(
    "Scores listener cleaned up"
);