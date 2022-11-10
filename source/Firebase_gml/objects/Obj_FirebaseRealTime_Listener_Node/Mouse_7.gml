
if(listener == noone)
	listener = FirebaseRealTime().Path("Testing/Node").Listener()
else
{    
    FirebaseRealTime().Path("Testing/Node").ListenerRemove(listener)
    listener = noone
}

