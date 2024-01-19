
randomize()

//Struct
FirebaseFirestore("Collection/Document").Update({value: choose("Opera","YoYoGames","GameMaker","Firebase"), points: random(999999)})

//JSON String
//var map = ds_map_create()
//map[?"value"] = "Opera"
//map[?"points"] = random(999999)
//var json = json_encode(map)
//ds_map_destroy(map)
//FirebaseFirestore("Collection/Document").Update(json)

//DS MAP
//var map = ds_map_create()
//map[?"value"] = "Opera"
//map[?"points"] = random(999999)
//var json = json_encode(map)
//FirebaseFirestore("Collection/Document").Update(json)
//ds_map_destroy(map)

