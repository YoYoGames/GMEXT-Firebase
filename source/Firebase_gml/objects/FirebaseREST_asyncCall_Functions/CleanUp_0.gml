/// @description Insert description here
// You can write your code in this editor

if (!is_undefined(timeout_time_source)) {
	call_cancel(timeout_time_source);
	timeout_time_source = undefined;
}