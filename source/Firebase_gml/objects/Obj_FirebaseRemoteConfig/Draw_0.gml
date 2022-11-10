/// @description Draw keys

// Set text draw variables
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_set_font(Font_YoYo_20)
draw_set_color(c_white)

// This function call will return an json formatted string of an array
// containing all the existing keys (default + remote). You can use the
// method json_parse to convert the json string into an array you can iterate upon.
var keysJSON = FirebaseRemoteConfig_GetKeys();

if(!is_string(keysJSON)) exit
if(keysJSON == "") exit

// Draw the array text to the screen
draw_text(50,100,"keys: " + keysJSON);

// Parse the keys into an array
var keys = json_parse(keysJSON);
var count = array_length(keys);

// Iterate over all the keys
for(var i = 0 ; i < count; i++)
{
	var key = keys[i];
	// Draw their string converted value to the screen.
	// Getting key values can be achieved using one of two functions
	// 
	// FirebaseRemoteConfig_GetString(key) : this returns a string
	// FirebaseRemoteConfig_GetDouble(key) : this returns a double
	//
	draw_text(50, 130 + 30*i, key + ": " + FirebaseRemoteConfig_GetString(key));
}
