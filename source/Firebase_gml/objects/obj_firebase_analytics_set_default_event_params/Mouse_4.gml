
firebase_analytics_set_default_event_parameters(
    [
        {
            name: "game_version",
            value: "1.4.2"
        },
        {
            name: "build_channel",
            value: "production"
        },
        {
            name: "content_version",
            value: 17
        }
    ]
);

//firebase_analytics_log_event will receive those defaults without adding them manually every time. Your binding explicitly exposes default event parameter arrays.
firebase_analytics_log_event(
    "game_started"
);
