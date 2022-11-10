
	
if(request_email == async_load[?"id"])
{
	if(async_load[?"status"] and async_load[?"result"] != "")
	{
		var str = async_load[?"result"]
		FirebaseAuthentication_SendPasswordResetEmail(str)
	}
	else
		text = "Forgot Pass?"
}
/*
if(request_code == async_load[?"id"])
{
	if(async_load[?"status"] and async_load[?"result"] != "")
	{
		code = async_load[?"result"]
		text = "Forgot Pass?"
		FirebaseAuthentication_VerifyPasswordResetCode(code,
			function(event,status,data)
			{
				var ins = instance_create_depth(0,0,0,Obj_Debug_FallText_Authentication)
				ins.text = event + "-" + string(status) + " -> " + string(data)
				if(status == 200)
				{
					ins.color = c_white
					request_password = get_string_async("New Password:","MyNewPassword123")
				}
				else
					ins.color = c_red
			})
	}
	else
		text = "Forgot Pass?"
}
	
if(request_password == async_load[?"id"])
{
	if(async_load[?"status"] and async_load[?"result"] != "")
	{
		var str = async_load[?"result"]
		FirebaseAuthentication_ConfirmPasswordReset(code,str)
	}
	else
		text = "Forgot Pass?"
}
*/