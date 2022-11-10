
if(listener == noone)
	listener = FirebaseRealTime().Path("Testing/String").Listener()
else
{    
    FirebaseRealTime().Path("Testing/String").ListenerRemove(listener)
    listener = noone
}

