draw_self()

draw_set_font(Font_YoYo_15)
draw_set_valign(fa_center)
draw_set_halign(fa_center)

if(listener == noone)
    draw_text(x,y,"Off")
else
    draw_text(x,y,"On")
