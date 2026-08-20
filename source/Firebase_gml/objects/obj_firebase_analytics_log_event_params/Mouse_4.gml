
firebase_analytics_log_event_params(
    "level_complete",
    [
        {
            name: "level",
            value: 12
        },
        {
            name: "score",
            value: 18500
        },
        {
            name: "difficulty",
            value: "hard"
        },
        {
            name: "duration_seconds",
            value: 241.8
        },
        {
            name: "deaths",
            value: 2
        }
    ]
);

//More examples:


//firebase_analytics_log_event_params(
//    "match_started",
//    [
//        {
//            name: "mode",
//            value: "ranked"
//        },
//        {
//            name: "map",
//            value: "temple"
//        },
//        {
//            name: "players",
//            value: 4
//        },
//        {
//            name: "region",
//            value: "eu"
//        }
//    ]
//);





//firebase_analytics_log_event_params(
//    "match_finished",
//    [
//        {
//            name: "mode",
//            value: "ranked"
//        },
//        {
//            name: "result",
//            value: "win"
//        },
//        {
//            name: "duration_seconds",
//            value: 413
//        },
//        {
//            name: "kills",
//            value: 7
//        },
//        {
//            name: "deaths",
//            value: 3
//        },
//        {
//            name: "rating_change",
//            value: 24
//        }
//    ]
//);




//firebase_analytics_log_event_params(
//    "unit_summoned",
//    [
//        {
//            name: "unit",
//            value: "cosmic_whale"
//        },
//        {
//            name: "level",
//            value: 3
//        },
//        {
//            name: "mana_cost",
//            value: 8
//        },
//        {
//            name: "game_mode",
//            value: "ranked"
//        }
//    ]
//);




//firebase_analytics_log_event_params(
//    "unit_destroyed",
//    [
//        {
//            name: "unit",
//            value: "golem"
//        },
//        {
//            name: "killer",
//            value: "fireball"
//        }
//    ]
//);



//firebase_analytics_log_event_params(
//    "earn_virtual_currency",
//    [
//        {
//            name: "virtual_currency_name",
//            value: "coins"
//        },
//        {
//            name: "value",
//            value: 250
//        },
//        {
//            name: "source",
//            value: "match_win"
//        }
//    ]
//);




//firebase_analytics_log_event_params(
//    "spend_virtual_currency",
//    [
//        {
//            name: "virtual_currency_name",
//            value: "gems"
//        },
//        {
//            name: "value",
//            value: 50
//        },
//        {
//            name: "item_name",
//            value: "witch_skin"
//        },
//        {
//            name: "item_type",
//            value: "skin"
//        }
//    ]
//);




//firebase_analytics_log_event_params(
//    "item_purchased",
//    [
//        {
//            name: "item_id",
//            value: "skin_witch_02"
//        },
//        {
//            name: "item_type",
//            value: "skin"
//        },
//        {
//            name: "currency",
//            value: "gems"
//        },
//        {
//            name: "price",
//            value: 300
//        }
//    ]
//);

//firebase_analytics_log_event_params(
//    "matchmaking_started",
//    [
//        {
//            name: "mode",
//            value: "ranked"
//        },
//        {
//            name: "region",
//            value: "eu"
//        }
//    ]
//);

//firebase_analytics_log_event_params(
//    "matchmaking_found",
//    [
//        {
//            name: "mode",
//            value: "ranked"
//        },
//        {
//            name: "wait_seconds",
//            value: 8.4
//        }
//    ]
//);


//firebase_analytics_log_event_params(
//    "matchmaking_cancelled",
//    [
//        {
//            name: "wait_seconds",
//            value: 22
//        }
//    ]
//);


//firebase_analytics_log_event_params(
//    "game_error",
//    [
//        {
//            name: "system",
//            value: "matchmaking"
//        },
//        {
//            name: "error_code",
//            value: 42
//        },
//        {
//            name: "stage",
//            value: "connect_server"
//        }
//    ]
//);