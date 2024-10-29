/// @description Insert description here
// You can write your code in this editor

// feather ignore GM1043

timeout_time_source = call_later(timeout, time_source_units_seconds, function() { 
	timeout_time_source = undefined;
	instance_destroy();
}, false);