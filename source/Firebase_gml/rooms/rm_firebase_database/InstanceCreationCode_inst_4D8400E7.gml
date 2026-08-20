
text = ""
var _db = firebase_database_get_instance();
_ref = firebase_database_get_reference_at_path(_db, "demo/node");
_value = {k1:"v1",k2:{a: true,b: false},k3:[1,2,3]}
