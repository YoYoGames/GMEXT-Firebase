
show_debug_message(__google_signin_url_encode("https://googlesignin-tclduhxwfq-uc.a.run.app/"))
show_debug_message(__google_signin_url_encode("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"))
show_debug_message(__google_signin_url_encode("20722703459-2lblr1ppet3454b102121vn0s8gkqls2"))

randomize()

search_uri = extension_get_option_value("GoogleSignIn", "OAuth Search URL");

function create_code(digits = 4,characters = "0123456789")
{
	characters = string_replace(characters,"0","")//0 make issues.... just dont use it
	
	var str = ""
	repeat(digits)
		str += string_char_at(characters,irandom(string_length(characters)))
	
	return str
}

state = create_code()
show_debug_message("state:" + state)
var oauth_ins = instance_create_depth(0,0,0,Obj_GoogleSignIn_Oauth_Http,{state: state})

client_id = oauth_ins.client_id
redirect_url = oauth_ins.redirect_url

// You have all you need we can destroy the OAuth url starter
instance_destroy(oauth_ins);

search_request = undefined;

alarm[0] = room_speed;

