
var _score = irandom_range(1,9999)
show_message_async(_score)

var _db = firebase_database_get_instance();
var _ref_scores = firebase_database_get_reference_at_path(_db,"scores");
var _ref_score = firebase_database_ref_push(_ref_scores);
var _ref_score_id = firebase_database_ref_key(_ref_score);

show_debug_message("Generated ID: " + _ref_score_id);

firebase_database_ref_set_value(
    _ref_score,
    {
        user: "USER_123",
        text: "Hello!",
        scored_at: firebase_database_server_timestamp(),
        score: _score
    },
    function(_error, _message)
    {
        if (_error == 0)
        {
            show_debug_message("Score submitted");
        }
        else
        {
            show_debug_message(_message);
        }
    }
);

firebase_database_ref_release(_ref_score);

