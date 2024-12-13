/// @ignore
function __facebook_signin_url_encode(_orig) {
    
	static _output_buffer = buffer_create(1, buffer_grow, 1);
	
    static _hex = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"];

	buffer_seek(_output_buffer, buffer_seek_start, 0);
	
	var _i = 1;
    repeat (string_length(_orig)) {
        //var _code = buffer_read(_input_buffer, buffer_u8);
		var _char = string_char_at(_orig, _i++);
		var _code = ord(_char);

        // Check if character is unreserved (ALPHA / DIGIT / "-" / "." / "_" / "~")
        if ((_code >= 65 && _code <= 90) ||    // A-Z
            (_code >= 97 && _code <= 122) ||   // a-z
            (_code >= 48 && _code <= 57) ||    // 0-9
            _code == 45 ||                    // -
            _code == 46 ||                    // .
            _code == 95 ||                    // _
            _code == 126) {                   // ~
			// Write directly to the output buffer
            buffer_write(_output_buffer, buffer_u8, _code);
        } else {
            // Use bitwise operations to get high and low nibbles
            var _high = (_code & $F0) >> 4;
            var _low = _code & $0F;
			buffer_write(_output_buffer, buffer_text, "%" + _hex[_high] + _hex[_low]);
        }
    }
	buffer_write(_output_buffer, buffer_u8, 0);
	
    return buffer_peek(_output_buffer, 0, buffer_string);
}

/// @ignore
function __facebook_signin_exchange_code(_client_id, _redirect_url, _client_secret, _code) {
    static _FACEBOOK_TOKEN_ENDPOINT = "https://graph.facebook.com/v21.0/oauth/access_token";
	
	show_debug_message("_redirect_url: 2 " + __facebook_signin_url_encode(_redirect_url))
    var post_data = 
                    "?code=" + _code +
                    "&redirect_uri=" + __facebook_signin_url_encode(_redirect_url) +
					"&client_secret=" + __facebook_signin_url_encode(_client_secret) + 
                    "&client_id=" + __facebook_signin_url_encode(_client_id)
    
	var _url = _FACEBOOK_TOKEN_ENDPOINT + post_data
	
    var headers = ds_map_create();
    //ds_map_add(headers, "Content-Type", "application/x-www-form-urlencoded");
    
    return http_request(_url, "GET", headers, ""/*post_data*/);
}