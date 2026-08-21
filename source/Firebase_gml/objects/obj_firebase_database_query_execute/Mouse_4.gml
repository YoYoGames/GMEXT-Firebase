show_debug_message("=== QUERY START ===");

if (query_running)
{
    show_debug_message("[ERROR] Query already running");
    exit;
}


// ----------------------------------------------------
// REFERENCE + ORDER
// ----------------------------------------------------

var _db = firebase_database_get_instance();
var _scores = firebase_database_get_reference_at_path(_db, "scores");

var _by_score = !obj_firebase_database_query_by_score.locked;
var _by_timestamp = !obj_firebase_database_query_by_timestamp.locked;

if (_by_score == _by_timestamp)
{
    show_debug_message("[ERROR] Select exactly one: score / scored_at");
    firebase_database_ref_release(_scores);
    exit;
}

var _field = _by_score ? "score" : "scored_at";
var _query = firebase_database_ref_order_by_child(_scores, _field);

firebase_database_ref_release(_scores);

show_debug_message($"[ORDER] {_field} -> {_query}");


// ----------------------------------------------------
// FILTERS
// ----------------------------------------------------

var _start = !obj_firebase_database_query_start_at.locked;
var _equal = !obj_firebase_database_query_equal_at.locked;
var _end   = !obj_firebase_database_query_end_at.locked;

if (_equal && (_start || _end))
{
    show_debug_message("[ERROR] EqualTo can't be combined with StartAt/EndAt");
    firebase_database_query_release(_query);
    exit;
}


if (_equal)
{
    var _prev = _query;
    var _value = obj_firebase_database_query_equal_at.value;

    _query = firebase_database_query_equal_to(_prev, _value);
    firebase_database_query_release(_prev);

    show_debug_message($"[FILTER] EqualTo({_value})");
}
else
{
    if (_start)
    {
        var _prev = _query;
        var _value = obj_firebase_database_query_start_at.value;

        _query = firebase_database_query_start_at(_prev, _value);
        firebase_database_query_release(_prev);

        show_debug_message($"[FILTER] StartAt({_value})");
    }

    if (_end)
    {
        var _prev = _query;
        var _value = obj_firebase_database_query_end_at.value;

        _query = firebase_database_query_end_at(_prev, _value);
        firebase_database_query_release(_prev);

        show_debug_message($"[FILTER] EndAt({_value})");
    }
}


// ----------------------------------------------------
// LIMIT
// ----------------------------------------------------

var _first = !obj_firebase_database_query_limit_to_first.locked;
var _last  = !obj_firebase_database_query_limit_to_last.locked;

if (_first && _last)
{
    show_debug_message("[ERROR] Select only one limit");
    firebase_database_query_release(_query);
    exit;
}


if (_first)
{
    var _prev = _query;
    var _value = obj_firebase_database_query_limit_to_first.value;

    _query = firebase_database_query_limit_to_first(_prev, _value);
    firebase_database_query_release(_prev);

    show_debug_message($"[LIMIT] First({_value})");
}


if (_last)
{
    var _prev = _query;
    var _value = obj_firebase_database_query_limit_to_last.value;

    _query = firebase_database_query_limit_to_last(_prev, _value);
    firebase_database_query_release(_prev);

    show_debug_message($"[LIMIT] Last({_value})");
}


// ----------------------------------------------------
// VALIDATE FINAL QUERY
// ----------------------------------------------------

if (_query == 0 || !firebase_database_query_is_valid(_query))
{
    show_debug_message("[ERROR] Final query invalid");
    exit;
}

active_query_ref = _query;
query_running = true;

show_debug_message($"[QUERY] Final handle = {active_query_ref}");


// ----------------------------------------------------
// EXECUTE
// ----------------------------------------------------

var _started = firebase_database_query_get_value(
    active_query_ref,

    function(_error, _message, _snapshot)
    {
        show_debug_message($"[CALLBACK] error={_error} snapshot={_snapshot}");

        if (_error != 0)
        {
            show_debug_message($"[ERROR] {_message}");
        }
        else if (_snapshot == 0)
        {
            show_debug_message("[ERROR] Snapshot is 0");
        }
        else
        {
            var _children = firebase_database_snapshot_get_children(_snapshot);

            show_debug_message($"[RESULTS] {array_length(_children)}");

            for (var i = 0; i < array_length(_children); i++)
            {
                var _child = _children[i];
                var _id = firebase_database_snapshot_key(_child);
                var _data = firebase_database_snapshot_get_value(_child);

                show_debug_message($"[{i}] {_id} -> {json_stringify(_data)}");

                firebase_database_snapshot_release(_child);
            }

            firebase_database_snapshot_release(_snapshot);
        }


        // Final query is safe to release now.
        if (!is_undefined(active_query_ref))
        {
            firebase_database_query_release(active_query_ref);
            active_query_ref = undefined;
        }

        query_running = false;

        show_debug_message("=== QUERY COMPLETE ===");
    }
);


// ----------------------------------------------------
// CHECK IF REQUEST ACTUALLY STARTED
// ----------------------------------------------------

show_debug_message($"[GET] started = {_started}");

if (!_started)
{
    show_debug_message($"[ERROR] {firebase_last_error_code()}: {firebase_last_error_message()}");

    if (!is_undefined(active_query_ref))
    {
        firebase_database_query_release(active_query_ref);
        active_query_ref = undefined;
    }

    query_running = false;
}

