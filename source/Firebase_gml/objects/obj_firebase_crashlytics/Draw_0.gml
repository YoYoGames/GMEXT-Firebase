
draw_set_valign(fa_left)
draw_set_halign(fa_left)
draw_set_font(fnt_gm_15)
draw_text(30,100,$"is_collection_enabled: {firebase_crashlytics_is_collection_enabled()}")
draw_text(30,120,$"did_crash_on_previous_execution: {firebase_crashlytics_did_crash_on_previous_execution()}")
