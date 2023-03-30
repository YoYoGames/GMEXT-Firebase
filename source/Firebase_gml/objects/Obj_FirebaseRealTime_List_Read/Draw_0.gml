event_inherited()

string_function = "FirebaseRealTime().Path(\""+path+"\")"

if(!Obj_FirebaseRealTime_Query_OrderByValue.locked)
	string_function += ".OrderByValue()"

if(!Obj_FirebaseRealTime_Query_OrderByKey.locked)
	string_function += ".OrderByKey()"

if(!Obj_FirebaseRealTime_Query_OrderByChild.locked)
	string_function += ".OrderByChild(\""+Obj_FirebaseRealTime_Query_OrderByChild.value+"\")"

if(!Obj_FirebaseRealTime_Query_EqualTo.locked and Obj_FirebaseRealTime_Query_EqualTo.value != "")
	string_function += ".EqualTo("+string(Obj_FirebaseRealTime_Query_EqualTo.value)+")"
	
if(!Obj_FirebaseRealTime_Query_StartAt.locked and Obj_FirebaseRealTime_Query_StartAt.value != "")
	string_function += ".StartAt("+string(Obj_FirebaseRealTime_Query_StartAt.value)+")"

if(!Obj_FirebaseRealTime_Query_EndAt.locked and Obj_FirebaseRealTime_Query_EndAt.value != "")
	string_function += ".EndAt("+string(Obj_FirebaseRealTime_Query_EndAt.value)+")"

if(!Obj_FirebaseRealTime_Query_LimitToLast.locked)
	string_function += ".LimitToLast("+string(Obj_FirebaseRealTime_Query_LimitToLast.value)+")"

if(!Obj_FirebaseRealTime_Query_LimitToFirst.locked)
	string_function += ".LimitToFirst("+string(Obj_FirebaseRealTime_Query_LimitToFirst.value)+")"

string_function += ".Read()"

draw_set_font(Font_YoYo_20)
draw_set_halign(fa_center)
draw_set_valign(fa_center)

draw_text(room_width/2,120,string_function)
