
draw_self()

draw_set_valign(fa_left)
draw_set_halign(fa_left)
draw_set_font(Font_YoYo_20)
draw_text(bbox_right+10,y-30,"uid: " + FirebaseAuthentication_GetUID())
draw_text(bbox_right+10,y,"name: " + FirebaseAuthentication_GetDisplayName())
