
switch(async_load[?"type"])
{
	
	case "FirebaseAuthentication_Tools_WebView_onUserClose":
		if(os_type == os_android or os_type == os_ios)
			FirebaseAuthentication_Tools_WebView_Delete()
	break
	
	case "FirebaseAuthentication_Tools_WebView_onCloseWindow":
	break
	
	case "FirebaseRealTime_Delete":
		if(async_load[?"listener"] == request_recatch_delete)
			FirebaseAuthentication_RecaptchaParams()
	break
	
	case "FirebaseAuthentication_RecaptchaParams":
		
		if(async_load[?"status"] == 200)
		{
			//request_recaptchaToken = get_string_async("recaptchaToken:","")
			listener_reCaptcha = FirebaseRealTime().Path("reCaptcha/"+request_reCaptcha_web).Listener()
			
			var map = json_decode(async_load[?"value"])
			var recaptchaSiteKey = map[?"recaptchaSiteKey"]
			ds_map_destroy(map)
			
			var url = "https://yoyoplayservices-13954376.web.app/" //<---- Change here
			url = url + "?recaptchaSiteKey=" + recaptchaSiteKey + "&uid="+request_reCaptcha_web
			
			if(os_browser != browser_not_a_browser)
				FirebaseAuthentication_Tools_UrlOpen(url)//On Web
			else
			switch(os_type)
			{
				case os_android: 
				case os_ios:
						FirebaseAuthentication_Tools_WebView_Create(url)
				break
				
				default:
					url_open(url)
				break
			}
		}

	break
	
	case "FirebaseRealTime_Listener":
	
		if(listener_reCaptcha == async_load[?"listener"])
		if(ds_map_exists(async_load,"value"))
		if(!is_undefined(async_load[?"value"]))
		{
			recaptchaToken = async_load[?"value"]
			request_phone = get_string_async("Phone:","")
			
			//not add the request identifiquer here, just delete it if is possible
			/*request_recatch_delete = */FirebaseRealTime().Path("reCaptcha/"+request_reCaptcha_web).Delete()
			FirebaseRealTime().ListenerRemove(listener_reCaptcha)
			listener_reCaptcha = noone
			
			if(os_type == os_android or os_type == os_ios)
				FirebaseAuthentication_Tools_WebView_Delete()
		}
		
	break;
	
	case "FirebaseAuthentication_SendVerificationCode":
		
		if(async_load[?"status"] == 200)
		{
			var map = json_decode(async_load[?"value"])
			sessionInfo = map[?"sessionInfo"]
			ds_map_destroy(map)
			
			request_code = get_string_async("Code:","")
		}
		
	break
	
	case "FirebaseAuthentication_SignInWithPhoneNumber":
	case "FirebaseAuthentication_LinkWithPhoneNumber":

		//Do something at end....
		if(async_load[?"status"] == 200)
			show_debug_message("Phone Auth Done")
		else
			show_debug_message("Phone Auth Failed")
			
	break
}
				
				