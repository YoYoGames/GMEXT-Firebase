
if(file_exists(localfile))
	file_delete(localfile)

var spr = sprite_duplicate(Spr_FirebaseStorage_img)
sprite_save(spr,0,localfile)
sprite_delete(spr)

if(file_exists(localfile))
{
	show_debug_message("file_exists")
	request_storage = FirebaseStorage_Upload(localfile,path)
	text = "Cancel"
}
else
	show_debug_message("file NOT exists")
