
draw_set_valign(fa_left)
draw_set_halign(fa_left)
draw_set_font(fnt_gm_15)

var _x = 10;
var _y = 100;
var _line_height = 18;

var _user = firebase_auth_current_user();

if (is_undefined(_user))
{
    draw_text(_x, _y, "No user is signed in");
    exit;
}

var _info = firebase_auth_user_get_info(_user);

draw_text(_x, _y, $"UID: {_info.uid}");
_y += _line_height;

draw_text(_x, _y, $"Email: {_info.email}");
_y += _line_height;

draw_text(_x, _y, $"Name: {_info.display_name}");
_y += _line_height;

draw_text(_x, _y, $"Photo: {_info.photo_url}");
_y += _line_height;

draw_text(_x, _y, $"Provider: {_info.provider_id}");
_y += _line_height;

draw_text(_x, _y, $"Phone: {_info.phone_number}");
_y += _line_height;

draw_text(_x, _y, $"Email verified: {_info.is_email_verified}");
_y += _line_height;

draw_text(_x, _y, $"Anonymous: {_info.is_anonymous}");
_y += _line_height;

draw_text(_x, _y, $"Created: {_info.creation_timestamp}");
_y += _line_height;

draw_text(_x, _y, $"Last login: {_info.last_sign_in_timestamp}");

firebase_auth_user_release(_user);