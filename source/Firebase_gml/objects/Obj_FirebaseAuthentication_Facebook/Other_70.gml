
event_inherited()


var type = ds_map_find_value( async_load, "type");

//New permission handling 
if(string(type) == "facebook_login_result")
{
    var status = ds_map_find_value( async_load, "status");
    
    if(string(status )== "success")
    {
		token = fb_accesstoken()
		event_user(0)
    }
    else if(string(status) == "cancelled")
    {
		
    }
    else if(string(status) == "error")
    {
        var exception = ds_map_find_value(async_load,"exception");
		show_message_async(exception);
    }
}


