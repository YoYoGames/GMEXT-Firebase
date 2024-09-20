/// @description Initialize variables

event_inherited();

text = "Create W. Icon (5s)"

uid = "AndroidIcon"
seconds = 5
title = "Large Icon!"
msg = "It's nice or what?!"
data = ""

filename = "android_notification_icon.png"
icon_spr = sprite_duplicate(Spr_LocalNotifications_Create_Android)
sprite_save(icon_spr,0,filename)
sprite_delete(icon_spr)
