
if (listener_ref != 0)
{
    firebase_firestore_listener_registration_remove(
        listener_ref
    );

    listener_ref = 0;

    show_debug_message("Scores listener removed");
}
else
{
    scores_listener_start();
}
