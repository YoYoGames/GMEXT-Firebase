
if(request_storage == async_load[?"listener"])
if(ds_map_exists(async_load,"success"))
{
	text = "Upload"
	request_storage = noone
	if(async_load[?"success"])
	{
		percent = 100
		img = sprite_add(async_load[?"localPath"],0,0,0,0,0)
		show_message_async("Upload SUCCESS")
	}
	else
	{
		percent = 0
		show_message_async(json_encode(async_load))
	}
}
else
{
	percent = 100*async_load[?"transferred"]/async_load[?"total"]
	if(percent < 0)
		percent = 0
}
