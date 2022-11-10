
if(request_storage == async_load[?"listener"])
if(async_load[?"success"])
{
	//show_message_async(json_encode(async_load))
	
	var arrayOfFiles = json_parse(async_load[?"files"])
	var arrayOfFolder = json_parse(async_load[?"folders"])
	var pageToken = async_load[?"pageToken"];
	show_debug_message("files: " + string(arrayOfFiles))
	show_debug_message("folders: " + string(arrayOfFolder))
}
