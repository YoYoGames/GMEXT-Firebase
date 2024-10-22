
event_inherited();

var _string_function = "FirebaseFirestore(" + json_stringify(collection_path) + ")"

with (Obj_FirebaseFirestore_Collection_Query_OrderBy) {
	if (locked) break;

	var _order_by = value;
	with (Obj_FirebaseFirestore_Collection_Query_AscendingDescending) {
		if (locked) break;
		_string_function += ".OrderBy(" + json_stringify(_order_by) + "," + json_stringify(value) + ")";
		
		break;
	}
	break;
}

with (Obj_FirebaseFirestore_Collection_Query_LessThan) {
	if (locked) break;
	
	_string_function += ".WhereLessThan(" + json_stringify(path) + "," + json_stringify(value) + ")";
	break;
}
	
with (Obj_FirebaseFirestore_Collection_Query_LessEqualThan) {
	if (locked) break;
	
	_string_function += ".WhereLessThanOrEqual(" + json_stringify(path) + "," + json_stringify(value) + ")";
	break;
}

with (Obj_FirebaseFirestore_Collection_Query_Greater) {
	if (locked) break;
	
	_string_function += ".WhereGreaterThan(" + json_stringify(path) + "," + json_stringify(value)+ ")";
	break;
}

with (Obj_FirebaseFirestore_Collection_Query_GreaterEqual) {
	if (locked) break;
	
	_string_function += ".WhereGreaterThanOrEqual(" + json_stringify(path) + "," + json_stringify(value) + ")";
	break;
}

with (Obj_FirebaseFirestore_Collection_Query_Equal) {
	if (locked) break;
	
	_string_function += ".WhereEqual(" + json_stringify(path) + "," + json_stringify(value) + ")";
	break;
}

with (Obj_FirebaseFirestore_Collection_Query_NotEqual) {
	if (locked) break;
	
	_string_function += ".WhereNotEqual(" + json_stringify(path) + "," + json_stringify(value) + ")";
	break;
}

with (Obj_FirebaseFirestore_Collection_Query_StartAt) {
	if (locked) break;
	
	_string_function += ".StartAt(" + json_stringify(value) + ")";
	break;
}

with (Obj_FirebaseFirestore_Collection_Query_EndAt) {
	if (locked) break;
	
	_string_function += ".EndAt(" + json_stringify(value) + ")";
	break;
}

with (Obj_FirebaseFirestore_Collection_Query_Limit) {
	if (locked) break;
	
	_string_function += ".Limit(" + json_stringify(value) + ")";
	break;
}

_string_function += ".Query()"

draw_set_font(Font_YoYo_15);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(room_width/2, 120, _string_function);

