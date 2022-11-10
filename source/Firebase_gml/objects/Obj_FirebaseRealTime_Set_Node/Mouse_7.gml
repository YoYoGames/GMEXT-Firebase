
var map=ds_map_create()
ds_map_add(map,"Key1","Value1")
ds_map_add(map,"Key2","Value2")
ds_map_add(map,"Key3","Value3")
ds_map_add(map,"Key4","Value4")
    
    var map_=ds_map_create()
    ds_map_add(map_,"Key1","Value1")
    ds_map_add(map_,"Key2","Value2")
    ds_map_add(map_,"Key3","Value3")
    ds_map_add(map_,"Key4","Value4")
    ds_map_add_map(map,"Key5",map_)
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
    ds_map_add_map(map,"timestamp",map_)
    //ds_map_destroy(map_)//Destoyed in parent (map)
    
var json = json_encode(map)
ds_map_destroy(map)


FirebaseRealTime().Path("Testing/Node").Set(json)


/*
var struct = 
{
	String: "Opera X YoYoyGames",
	Double: 12345,
	Node:{String: "Opera X YoYoyGames",Double: 12345,List:["data0","data1"]},
	List:["data0","data1",{String: "Opera X YoYoyGames",Double: 12345,List:["data0","data1"]}]
}

FirebaseRealTime().Path("Testing/Struct").Set(json_stringify(struct))

