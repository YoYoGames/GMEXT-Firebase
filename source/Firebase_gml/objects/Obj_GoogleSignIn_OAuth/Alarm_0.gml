
var post_data = json_stringify({state: state})

var headers = ds_map_create();
ds_map_add(headers, "Content-Type", "application/json");

search_request = http_request(search_uri, "POST", headers, post_data);
