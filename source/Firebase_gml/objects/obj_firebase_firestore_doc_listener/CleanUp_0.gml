
if (player_listener != 0)
{
    firebase_firestore_listener_registration_remove(
        player_listener
    );

    player_listener = 0;
}
