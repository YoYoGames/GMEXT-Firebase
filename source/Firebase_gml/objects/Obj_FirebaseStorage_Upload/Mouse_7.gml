
if(request_storage == noone)
	event_inherited();
else
{
	FirebaseStorage_Cancel(request_storage)
	request_storage = noone
	text = "Upload"
}
