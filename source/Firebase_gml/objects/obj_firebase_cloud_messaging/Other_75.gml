
if (async_load[? "type"] == "permission_request_result")
{
    var _permission =
        "android.permission.POST_NOTIFICATIONS";

    if (ds_map_exists(async_load, _permission))
    {
        show_debug_message({
            permission: _permission,
            result: async_load[? _permission]
        });
    }
}
