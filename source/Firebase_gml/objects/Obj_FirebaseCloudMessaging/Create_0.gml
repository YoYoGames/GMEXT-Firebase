/// @description Insert description here
// You can write your code in this editor

if (instance_number(object_index) > 1) {
	// Destroy if there is more than one created
	instance_destroy();
	return;
}