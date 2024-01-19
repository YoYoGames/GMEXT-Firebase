
//JSON String use to be the slower option

//Struct example
//FirebaseRealTime().Path("Testing/Node").Set(
//	{
//		String: "Opera X YoYoyGames",
//		Double: 12345,
//		Node:{String: "Opera X YoYoyGames",Double: 12345,List:["data0","data1"]},
//		List:["data0","data1",{String: "Opera X YoYoyGames",Double: 12345,List:["data0","data1"]}]
//	})

//Array example
//FirebaseRealTime().Path("Testing/Node").Set(
//		["string",12345,[1,2,3,4,5],{String: "Opera X YoYoyGames",Double: 12345,List:["data0","data1"]}]
//	)



//JSON String Example

var map=ds_map_create()

ds_map_add(map,"Key","Value")
    
var map_=ds_map_create()
ds_map_add(map_,"Key1","Value1")
ds_map_add(map_,"Key2","Value2")
ds_map_add(map_,"Key3","Value3")
ds_map_add(map_,"Key4","Value4")
ds_map_add_map(map,"MapExample",map_)
//ds_map_destroy(map_)//Destoyed in parent (map)

var list=ds_list_create()
ds_list_add(list,"Value1")
ds_list_add(list,"Value2")
ds_list_add(list,"Value3")
ds_list_add(list,"Value4")
ds_map_add_list(map,"ListExample",list)
//ds_list_destroy(list)//Destoyed in parent (map)
    
//This add a timestamp!!!!!!!!!!!!!!!!!!!
var map_=ds_map_create()
ds_map_add(map_,".sv","timestamp")
ds_map_add_map(map,"Timestamp",map_)
//ds_map_destroy(map_)//Destoyed in parent (map)

//////////////////////////////////////////////////////Sending to Firebase
var json = json_encode(map)//transform to JSON String
ds_map_destroy(map)
FirebaseRealTime().Path("Testing/Node").Set(json)

//Sending to Firebase directly as ds_map

//FirebaseRealTime().Path("Testing/Node").Set(map)
//ds_map_destroy(map)//don't forget delete the map
//////////////////////////////////////////////////////Sending to Firebase END
