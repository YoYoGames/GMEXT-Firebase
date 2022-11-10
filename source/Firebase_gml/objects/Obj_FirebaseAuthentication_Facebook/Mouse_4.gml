
event_inherited();

var perms = ds_list_create();
ds_list_add(perms, "public_profile", "user_friends");
//fb_login(perms, fb_login_default);
fb_login(perms, FacebookExtension2_LOGIN_TYPE_SYSTEM_ACCOUNT);
ds_list_destroy(perms);
