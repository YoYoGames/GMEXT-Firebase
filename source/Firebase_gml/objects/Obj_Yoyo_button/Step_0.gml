
// Button is locked should't be interactable
if (locked) {
	image_index = 2
	return;
}

// Button is being hovered
if (mouse_check_button(mb_left) && point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
	// Set the hover image index
	image_index = 1
}
// Button is in it's normal state
else {
	image_index = 0
}