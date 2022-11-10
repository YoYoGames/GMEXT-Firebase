
if(listener == noone)
	listener = FirebaseRealTime().Path("Testing/Double").Listener()
else
{    
    FirebaseRealTime().Path("Testing/Double").ListenerRemove(listener)
    listener = noone
}

