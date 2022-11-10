
if(request_storage == async_load[?"listener"])
if(ds_map_exists(async_load,"success"))
{
	text = "Download"
	request_storage = noone
	if(async_load[?"success"])
	{
		porcent = 100
		img = sprite_add(async_load[?"localPath"],0,0,0,0,0)
		show_message_async("Download SUCCESS")
	}
	else
	{
		porcent = 0
		show_message_async(json_encode(async_load))
	}
}
else
{
	porcent = 100*async_load[?"transferred"]/async_load[?"total"]
	if(porcent < 0)
		porcent = 0
}
