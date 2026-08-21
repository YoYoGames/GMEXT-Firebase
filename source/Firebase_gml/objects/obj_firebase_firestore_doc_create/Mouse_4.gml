//var _firestore =
//    firebase_firestore_get_instance();

//var _player =
//    firebase_firestore_document(
//        _firestore,
//        "players/USER_123"
//    );

//firebase_firestore_document_ref_set(
//	    _player,
//	    {
//	        name: "Player",
//	        level: 7,
//	        score: 12500,
//	        premium: true
//	    },
//	    function(_error, _message)
//	    {
//	        if (_error == FirestoreError.Ok)
//	        {
//	            show_debug_message(
//	                "Firestore write OK"
//	            );
//	        }
//	        else
//	        {
//	            show_debug_message(_message);
//	        }
//	    }
//	);


var firestore = firebase_firestore_get_instance();

var player_ref = firebase_firestore_document(
        firestore,
        "players/USER_123"
    );

show_debug_message("=== CREATE PLAYER ===");

var _created_at = firebase_firestore_field_value_server_timestamp();

// Explicit Firestore int64 instead of ordinary GML double.
var _level = firebase_firestore_field_value_integer(12);

// Explicit Firestore double.
var _rating = firebase_firestore_field_value_double(4.75);

// Firestore GeoPoint.
var _location = firebase_firestore_field_value_geo_point(
    51.2465,
    22.5684
);

// Explicit null.
var _null = firebase_firestore_field_value_null();

// Reference to ANOTHER Firestore document.
var _guild_ref = firebase_firestore_document(
    firestore,
    "guilds/GUILD_001"
);

var _guild_value = firebase_firestore_field_value_reference(
    _guild_ref
);


var _started = firebase_firestore_document_ref_set(
    player_ref,

    {
        // Native GML -> Firestore primitives
        name: "Player One",
        online: true,
        score: 7500.5,

        // Explicit Firestore types
        level: _level,
        rating: _rating,

        // Server-generated timestamp
        created_at: _created_at,

        // Geographic value
        location: _location,

        // Firestore DocumentReference
        guild: _guild_value,

        // Explicit Firestore null
        nickname: _null,

        // Normal Firestore array
        tags:
        [
            "ranked",
            "veteran",
            "mage"
        ],

        // Nested Firestore map
        stats:
        {
            wins: 12,
            losses: 4,
            kills: 85
        },

        // Array of maps
        characters:
        [
            {
                id: "witch",
                level: 5
            },
            {
                id: "golem",
                level: 3
            }
        ],

        // We'll remove this later using FieldValue.Delete()
        temporary_field: "delete me later"
    },

    function(_error, _message)
    {
        if (_error != 0)
        {
            show_debug_message($"[CREATE ERROR] {_message}");
            return;
        }

        show_debug_message("Player created successfully");
    }
);


// The GML handles have already been converted into the values
// supplied to Set(), so clean up our temporary FieldValue refs.

firebase_firestore_field_value_release(_created_at);
firebase_firestore_field_value_release(_level);
firebase_firestore_field_value_release(_rating);
firebase_firestore_field_value_release(_location);
firebase_firestore_field_value_release(_guild_value);
firebase_firestore_field_value_release(_null);

firebase_firestore_document_ref_release(_guild_ref);

show_debug_message($"CREATE started = {_started}");
