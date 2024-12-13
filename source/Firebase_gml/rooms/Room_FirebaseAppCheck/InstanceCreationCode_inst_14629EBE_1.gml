
text = "Back"

goto = asset_get_index("Room_Firebase");
if (goto == -1) {
	instance_destroy();
}