
draw_set_valign(fa_left)
draw_set_halign(fa_left)
draw_set_color(c_white)
draw_set_font(fnt_gm_15)

var a = 0
with(Obj_FirebaseREST_Listener_RealTime)
{
	if(variable_global_exists("YYFirebaseIdToken"))
	{
		var urlHide = string_replace(url,YYFirebaseIdToken,"token")
		draw_text(10,50+a*20,string(id) + ": " + string(alarm[0]) + " -> " + urlHide)
	}
	else
		draw_text(10,50+a*20,string(id) + ": " + string(alarm[0]) + " -> " + url)
	
	a ++
}
