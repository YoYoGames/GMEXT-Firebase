
event_inherited();

if(os_type == os_android or os_type == os_ios)
{
	var perms = ds_list_create();
	ds_list_add(perms, "public_profile", "user_friends");
	fb_login(perms);
	ds_list_destroy(perms);
}
else
{
	instance_create_depth(0,0,0,Obj_FacebookSignIn_OAuth)
}