#include "GMFirebase_messaging.h"
#include <algorithm>
#include <cstring>

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

namespace
{
	firebase::messaging::PollableListener g_firebase_messaging_listener;

	// Most recently polled message/token, populated by
	// firebase_messaging_poll_message()/firebase_messaging_poll_token() and read back by the
	// per-field getters below. Not guarded by a mutex: like the rest of this
	// extension's poll-based state, this is only ever touched from the GML
	// step thread that calls firebase_messaging_poll_message()/getter pairs back to
	// back, never concurrently with itself.
	firebase::messaging::Message g_current_message;
	std::string g_current_token;
}

firebase::messaging::PollableListener& getMessagingListener()
{
	return g_firebase_messaging_listener;
}

// ============================================================
// Init / lifecycle
// ============================================================

double firebase_messaging_initialize()
{
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(-1, "firebase_messaging: no firebase::App - call firebase_app_initialize() first");
		return -1.0;
	}

	firebase::InitResult result = firebase::messaging::Initialize(*app, &g_firebase_messaging_listener);
	if (result != firebase::kInitResultSuccess)
		setFirebaseLastError(static_cast<int>(result), "firebase_firebase_messaging_initialize: Initialize() failed");
	return static_cast<double>(result);
}

void firebase_messaging_terminate()
{
	firebase::messaging::Terminate();
}

void firebase_messaging_set_token_registration_on_init_enabled(double enabled)
{
	firebase::messaging::SetTokenRegistrationOnInitEnabled(enabled >= 0.5);
}

double firebase_messaging_is_token_registration_on_init_enabled()
{
	return firebase::messaging::IsTokenRegistrationOnInitEnabled() ? 1.0 : 0.0;
}

double firebase_messaging_delivery_metrics_export_to_big_query_enabled()
{
	return firebase::messaging::DeliveryMetricsExportToBigQueryEnabled() ? 1.0 : 0.0;
}

void firebase_messaging_set_delivery_metrics_export_to_big_query(double enabled)
{
	firebase::messaging::SetDeliveryMetricsExportToBigQuery(enabled >= 0.5);
}

// ============================================================
// Permission / tokens / topics
// ============================================================

// callback(error_code: real, error_message: string)
double firebase_messaging_request_permission(const std::optional<GMFunction>& callback)
{
	firebase::messaging::RequestPermission().OnCompletion([callback](const firebase::Future<void>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (callback.has_value())
			callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
}

// callback(error_code: real, error_message: string, token: string)
double firebase_messaging_get_token(const std::optional<GMFunction>& callback)
{
	firebase::messaging::GetToken().OnCompletion([callback](const firebase::Future<std::string>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (!callback.has_value()) return;
		std::string token = (f.error() == 0 && f.result() != nullptr) ? *f.result() : std::string();
		callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" }, std::string_view{ token });
	});
	return 1.0;
}

// callback(error_code: real, error_message: string)
double firebase_messaging_delete_token(const std::optional<GMFunction>& callback)
{
	firebase::messaging::DeleteToken().OnCompletion([callback](const firebase::Future<void>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (callback.has_value())
			callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
}

// callback(error_code: real, error_message: string)
double firebase_messaging_subscribe(std::string_view topic, const std::optional<GMFunction>& callback)
{
	firebase::messaging::Subscribe(std::string(topic).c_str()).OnCompletion([callback](const firebase::Future<void>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (callback.has_value())
			callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
}

// callback(error_code: real, error_message: string)
double firebase_messaging_unsubscribe(std::string_view topic, const std::optional<GMFunction>& callback)
{
	firebase::messaging::Unsubscribe(std::string(topic).c_str()).OnCompletion([callback](const firebase::Future<void>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (callback.has_value())
			callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
}

// ============================================================
// Poll buffer
// ============================================================

// Returns 1 and refreshes the getters below if a message was pending;
// 0 otherwise (call firebase_messaging_poll_message() in a loop, or once per step,
// until it returns 0).
double firebase_messaging_poll_message()
{
	firebase::messaging::Message message;
	if (!g_firebase_messaging_listener.PollMessage(&message))
		return 0.0;

	g_current_message = std::move(message);
	return 1.0;
}

// Returns 1 and refreshes firebase_messaging_current_token() if a freshly-generated
// registration token was pending; 0 otherwise.
double firebase_messaging_poll_token()
{
	std::string token;
	if (!g_firebase_messaging_listener.PollRegistrationToken(&token))
		return 0.0;

	g_current_token = std::move(token);
	return 1.0;
}

std::string firebase_messaging_current_token()
{
	return g_current_token;
}

// ============================================================
// Current message accessors (valid after firebase_messaging_poll_message() -> 1)
// ============================================================

std::string firebase_messaging_message_from()
{
	return g_current_message.from;
}

std::string firebase_messaging_message_to()
{
	return g_current_message.to;
}

std::string firebase_messaging_message_collapse_key()
{
	return g_current_message.collapse_key;
}

std::string firebase_messaging_message_message_id()
{
	return g_current_message.message_id;
}

std::string firebase_messaging_message_message_type()
{
	return g_current_message.message_type;
}

std::string firebase_messaging_message_priority()
{
	return g_current_message.priority;
}

std::string firebase_messaging_message_original_priority()
{
	return g_current_message.original_priority;
}

double firebase_messaging_message_time_to_live()
{
	return static_cast<double>(g_current_message.time_to_live);
}

double firebase_messaging_message_sent_time()
{
	return static_cast<double>(g_current_message.sent_time);
}

std::string firebase_messaging_message_error()
{
	return g_current_message.error;
}

std::string firebase_messaging_message_error_description()
{
	return g_current_message.error_description;
}

std::string firebase_messaging_message_link()
{
	return g_current_message.link;
}

double firebase_messaging_message_notification_opened()
{
	return g_current_message.notification_opened ? 1.0 : 0.0;
}

double firebase_messaging_message_data_count()
{
	return static_cast<double>(g_current_message.data.size());
}

std::string firebase_messaging_message_data_key_at(double index)
{
	size_t i = static_cast<size_t>(index);
	if (i >= g_current_message.data.size()) return std::string();

	auto it = g_current_message.data.begin();
	std::advance(it, i);
	return it->first;
}

std::string firebase_messaging_message_get_data(std::string_view key)
{
	auto it = g_current_message.data.find(std::string(key));
	return it != g_current_message.data.end() ? it->second : std::string();
}

double firebase_messaging_message_raw_data_size()
{
	return static_cast<double>(g_current_message.raw_data.size());
}

// Copies up to out_buffer.length() bytes into out_buffer; returns the
// number of bytes actually copied.
double firebase_messaging_message_raw_data_copy(GMBuffer out_buffer)
{
	const std::vector<unsigned char>& raw = g_current_message.raw_data;
	size_t to_copy = std::min(raw.size(), static_cast<size_t>(out_buffer.length()));
	if (to_copy > 0)
		std::memcpy(out_buffer.data(), raw.data(), to_copy);
	return static_cast<double>(to_copy);
}

// ============================================================
// Current message's notification (nullptr-safe: fields read as "" / 0 when
// the message carries no notification payload)
// ============================================================

double firebase_messaging_message_has_notification()
{
	return g_current_message.notification != nullptr ? 1.0 : 0.0;
}

std::string firebase_messaging_message_notification_title()
{
	return g_current_message.notification ? g_current_message.notification->title : std::string();
}

std::string firebase_messaging_message_notification_body()
{
	return g_current_message.notification ? g_current_message.notification->body : std::string();
}

std::string firebase_messaging_message_notification_icon()
{
	return g_current_message.notification ? g_current_message.notification->icon : std::string();
}

std::string firebase_messaging_message_notification_sound()
{
	return g_current_message.notification ? g_current_message.notification->sound : std::string();
}

std::string firebase_messaging_message_notification_badge()
{
	return g_current_message.notification ? g_current_message.notification->badge : std::string();
}

std::string firebase_messaging_message_notification_tag()
{
	return g_current_message.notification ? g_current_message.notification->tag : std::string();
}

std::string firebase_messaging_message_notification_color()
{
	return g_current_message.notification ? g_current_message.notification->color : std::string();
}

std::string firebase_messaging_message_notification_click_action()
{
	return g_current_message.notification ? g_current_message.notification->click_action : std::string();
}

std::string firebase_messaging_message_notification_body_loc_key()
{
	return g_current_message.notification ? g_current_message.notification->body_loc_key : std::string();
}

double firebase_messaging_message_notification_body_loc_args_count()
{
	if (!g_current_message.notification) return 0.0;
	return static_cast<double>(g_current_message.notification->body_loc_args.size());
}

std::string firebase_messaging_message_notification_body_loc_args_at(double index)
{
	if (!g_current_message.notification) return std::string();
	const std::vector<std::string>& args = g_current_message.notification->body_loc_args;
	size_t i = static_cast<size_t>(index);
	return i < args.size() ? args[i] : std::string();
}

std::string firebase_messaging_message_notification_title_loc_key()
{
	return g_current_message.notification ? g_current_message.notification->title_loc_key : std::string();
}

double firebase_messaging_message_notification_title_loc_args_count()
{
	if (!g_current_message.notification) return 0.0;
	return static_cast<double>(g_current_message.notification->title_loc_args.size());
}

std::string firebase_messaging_message_notification_title_loc_args_at(double index)
{
	if (!g_current_message.notification) return std::string();
	const std::vector<std::string>& args = g_current_message.notification->title_loc_args;
	size_t i = static_cast<size_t>(index);
	return i < args.size() ? args[i] : std::string();
}

std::string firebase_messaging_message_notification_android_channel_id()
{
	if (!g_current_message.notification || !g_current_message.notification->android) return std::string();
	return g_current_message.notification->android->channel_id;
}
