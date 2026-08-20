var _db = firebase_database_get_instance();
var _root = firebase_database_get_reference(_db);

var _updates = {};

variable_struct_set(
    _updates,
    "demo/string",
    "Hello World"
);

variable_struct_set(
    _updates,
    "demo/number",
    12345
);

variable_struct_set(
    _updates,
    "demo/node",
    {
        k1: "v1",
        k2:
        {
            a: true,
            b: false
        },
        k3: [1, 2, 3]
    }
);

firebase_database_ref_update_children(
    _root,
    _updates,

    function(_error, _message)
    {
        if (_error != 0)
        {
            show_debug_message(
                "Atomic update failed: " + _message
            );
            return;
        }

        show_debug_message(
            "All values updated successfully"
        );
    }
);

firebase_database_ref_release(_root);
