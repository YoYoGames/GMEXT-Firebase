randomize()

//Struct
FirebaseFirestore("Collection").Set({value:choose("Opera","YoYoGames","GameMaker","Firebase"), points: irandom(999)})

//JSON String
//var map = ds_map_create()
//map[?"value"] = choose("Opera","YoYoGames","GameMaker","Firebase")
//map[?"points"] = irandom(999)
//var json = json_encode(map)
//ds_map_destroy(map)
//FirebaseFirestore("Collection").Set(json)

//DS MAP
//var map = ds_map_create()
//map[?"value"] = choose("Opera","YoYoGames","GameMaker","Firebase")
//map[?"points"] = irandom(999)
//FirebaseFirestore("Collection").Set(map)
//ds_map_destroy(map)
