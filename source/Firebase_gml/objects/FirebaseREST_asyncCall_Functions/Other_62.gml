/// @description Insert description here
// You can write your code in this editor

if (request_id != async_load[? "id"]) return;

var _map = ds_map_create();
_map[? "listener"] = id;
_map[? "type"] = type;
_map[? "value"] = async_load[? "result"];
_map[? "status"] = async_load[?"http_status"];
	
event_perform_async(ev_async_social, _map);

instance_destroy();
