
draw_set_valign(fa_left)
draw_set_halign(fa_left)
draw_set_font(fnt_gm_15)
draw_text(30,100,$"is_collection_enabled: {firebase_in_app_messaging_is_automatic_data_collection_enabled()}")
draw_text(30,120,$"are_messages_suppressed: {firebase_in_app_messaging_are_messages_suppressed()}")

