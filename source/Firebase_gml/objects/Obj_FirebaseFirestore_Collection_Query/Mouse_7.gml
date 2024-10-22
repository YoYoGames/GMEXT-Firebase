
//Remember index your Database
//https://firebase.google.com/docs/database/security/indexing-data

var _builder = FirebaseFirestore(collection_path)

with (Obj_FirebaseFirestore_Collection_Query_OrderBy) {
	if (locked) break;
	
	var _order_by = value;
	with (Obj_FirebaseFirestore_Collection_Query_AscendingDescending) {
		if (locked) break;
		_builder = _builder.OrderBy(_order_by, value);
		
		break;
	}
	break;
}

with (Obj_FirebaseFirestore_Collection_Query_LessThan) {
	if (locked) break;
	_builder = _builder.WhereLessThan(path, value);
	break;
}

with (Obj_FirebaseFirestore_Collection_Query_LessEqualThan) {
	if (locked) break;
	_builder = _builder.WhereLessThanOrEqual(path, value);
	break;
}

with (Obj_FirebaseFirestore_Collection_Query_Greater) {
	if (locked) break;
	_builder = _builder.WhereGreaterThan(path, value);
	break;
}

with (Obj_FirebaseFirestore_Collection_Query_GreaterEqual) {
	if (locked) break;
	_builder = _builder.WhereGreaterThanOrEqual(path, value);
	break;
}

with (Obj_FirebaseFirestore_Collection_Query_Equal) {
	if (locked) break;
	_builder = _builder.WhereEqual(path, value);
	break;
}

with (Obj_FirebaseFirestore_Collection_Query_NotEqual) {
	if (locked) break;
	_builder = _builder.WhereNotEqual(path, value);
	break;
}

with (Obj_FirebaseFirestore_Collection_Query_StartAt) {
	if (locked) break;
	_builder = _builder.StartAt(value);
	break;
}

with (Obj_FirebaseFirestore_Collection_Query_EndAt) {
	if (locked) break;
	_builder = _builder.EndAt(value);
	break;
}

with (Obj_FirebaseFirestore_Collection_Query_Limit) {
	if (locked) break;
	_builder = _builder.Limit(value);
	break;
}

_builder.Query()
