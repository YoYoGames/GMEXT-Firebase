
draw_set_valign(fa_left)
draw_set_halign(fa_left)
draw_set_color(c_white)
draw_set_font(Font_YoYo_20)

var a = 0
with(Obj_FirebaseREST_Listener_Authentication)
{
    draw_text(10,50+a*20,string(id) + ": " + string(alarm[0]) + " -> " + url)
	a ++
}
