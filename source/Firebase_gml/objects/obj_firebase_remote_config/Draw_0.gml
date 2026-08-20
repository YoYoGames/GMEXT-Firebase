// Inherit the parent event
event_inherited();

draw_set_valign(fa_left)
draw_set_halign(fa_left)
draw_set_font(fnt_gm_15)
draw_text(10,400,json_stringify(my_remote_configs,true))
