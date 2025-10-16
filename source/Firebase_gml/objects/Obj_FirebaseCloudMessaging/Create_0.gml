
if (instance_number(object_index) > 1) {
	// Destroy if there is more than one created
	instance_destroy();
	return;
}

FirebaseCloudMessaging_RequestPermission()//This function it's only for ios at this moment
