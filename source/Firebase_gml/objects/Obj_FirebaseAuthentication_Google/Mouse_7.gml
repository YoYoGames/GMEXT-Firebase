
if(os_browser != browser_not_a_browser)
{
	show_debug_message("GML: GoogleSignIn_Show()")
	GoogleSignIn_Show()
}

if(os_type == os_android)
	GoogleSignIn_Show()
else
if(os_type == os_ios)
	GoogleSignIn_Show()
else
	instance_create_depth(0,0,0,Obj_GoogleSignIn_OAuth)
