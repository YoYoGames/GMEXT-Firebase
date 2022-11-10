//Remember index your Database :)
//https://firebase.google.com/docs/database/security/indexing-data

var builder = FirebaseRealTime().Path(path).OrderByValue().LimitToLast(3)

if(!Obj_FirebaseRealTime_Query_OrderByValue.locked)
	builder = builder.OrderByValue()

if(!Obj_FirebaseRealTime_Query_OrderByKey.locked)
	builder = builder.OrderByKey()

if(!Obj_FirebaseRealTime_Query_OrderByChild.locked)
	builder = builder.OrderByChild(Obj_FirebaseRealTime_Query_OrderByChild.value)

if(!Obj_FirebaseRealTime_Query_EqualTo.locked)
	builder = builder.EqualTo(Obj_FirebaseRealTime_Query_EqualTo.value)
	
if(!Obj_FirebaseRealTime_Query_StartAt.locked)
	builder = builder.StartAt(Obj_FirebaseRealTime_Query_StartAt.value)

if(!Obj_FirebaseRealTime_Query_EndAt.locked)
	builder = builder.EndAt(Obj_FirebaseRealTime_Query_EndAt.value)

if(!Obj_FirebaseRealTime_Query_LimitToLast.locked)
	builder = builder.LimitToLast(Obj_FirebaseRealTime_Query_LimitToLast.value)

if(!Obj_FirebaseRealTime_Query_LimitToFirst.locked)
	builder = builder.LimitToFirst(Obj_FirebaseRealTime_Query_LimitToFirst.value)
	
builder.Read();
