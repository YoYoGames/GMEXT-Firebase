
randomize()

search_url = extension_get_option_value("FacebookExtension2", "searchURL");

function create_code(digits = 4,characters = "0123456789")
{
	characters = string_replace(characters,"0","")//0 make issues.... just dont use it
	
	var str = ""
	repeat(digits)
		str += string_char_at(characters,irandom(string_length(characters)))
	
	return str
}

state = create_code()
var oauth_ins = instance_create_depth(0,0,0,Obj_FacebookSignIn_Oauth_Http,{state: state})

client_id = oauth_ins.client_id
redirect_url = oauth_ins.redirect_url

show_debug_message("_redirect_url: 1" + __facebook_signin_url_encode(redirect_url))

// You have all you need we can destroy the OAuth url starter
instance_destroy(oauth_ins);

search_request = undefined;

alarm[0] = room_speed;

