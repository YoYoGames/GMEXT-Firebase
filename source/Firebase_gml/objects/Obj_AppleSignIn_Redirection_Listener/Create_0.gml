
search_url = extension_get_option_value("AppleSignIn", "REDIRECTION Search Url");

function create_code(digits = 14,characters = "0123456789")
{
	characters = string_replace(characters,"0","")//0 make issues.... just dont use it
	
	var str = ""
	repeat(digits)
		str += string_char_at(characters,irandom(string_length(characters)))
	
	return str
}

state = create_code()
var oauth_ins = instance_create_depth(0,0,0,Obj_AppleSignIn_Oauth_Http,{state: state})

client_id = oauth_ins.client_id
redirect_uri = oauth_ins.redirect_uri

// You have all you need we can destroy the OAuth url starter
instance_destroy(oauth_ins);

search_request = undefined;

alarm[0] = room_speed;
