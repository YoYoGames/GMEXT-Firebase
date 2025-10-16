
draw_self()

draw_set_valign(fa_left)
draw_set_halign(fa_left)
draw_set_font(fnt_gm_15)
draw_text(bbox_right+10,y-30,"uid: " + FirebaseAuthentication_GetUID())
draw_text(bbox_right+10,y,"name: " + FirebaseAuthentication_GetDisplayName())
