/// @description Draw permission

if(os_type == os_ios)
{
	draw_set_font(Font_YoYo_20)
	draw_set_valign(fa_left)
	draw_set_halign(fa_left)
	draw_text(50,100,"iOS_permission: " + iOS_permission_status)
}
