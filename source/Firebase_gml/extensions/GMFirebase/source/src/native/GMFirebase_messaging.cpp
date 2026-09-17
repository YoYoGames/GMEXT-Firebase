#include "GMFirebase_messaging.h"
#include <algorithm>
#include <cstring>
#include <deque>
#include <mutex>

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

// Firebase C++ SDK deprecated the token-based FCM registration API in favor of
// an Installation-ID-based model (Register()/Unregister()/OnRegistrationReceived),
// but that model doesn't hand back the ID synchronously the way GetToken()/DeleteToken()
// did. Keeping the deprecated calls preserves this extension's existing token-based
// GML API contract; these macros just silence -Werror,-Wdeprecated-declarations at the call sites.
#if defined(__clang__) || defined(__GNUC__)
#define GMF_DEPRECATED_PUSH() _Pragma("GCC diagnostic push") _Pragma("GCC diagnostic ignored \"-Wdeprecated-declarations\"")
#define GMF_DEPRECATED_POP() _Pragma("GCC diagnostic pop")
#elif defined(_MSC_VER)
#define GMF_DEPRECATED_PUSH() __pragma(warning(push)) __pragma(warning(disable : 4996))
#define GMF_DEPRECATED_POP() __pragma(warning(pop))
#else
#define GMF_DEPRECATED_PUSH()
#define GMF_DEPRECATED_POP()
#endif

namespace
{
	// The SDK's own PollableListener queues messages without a cap
	// (messaging/src/common.cc), so a game that stops polling - a room
	// transition, a long background stretch - would grow it for as long as the
	// process runs. This does the same job with a ceiling: the oldest message
	// is dropped once the queue is full, keeping the newest state, and the
	// drop is logged.
	class GmMessagingListener : public firebase::messaging::Listener
	{
	public:
		static constexpr size_t kMaxQueuedMessages = 256;

		void OnMessage(const firebase::messaging::Message& message) override
		{
			std::lock_guard<std::mutex> lock(mutex_);
			if (messages_.size() >= kMaxQueuedMessages)
			{
				messages_.pop_front();
				LOG_WARNING("firebase_messaging: %zu messages queued and none polled - dropping the oldest", kMaxQueuedMessages);
			}
			messages_.push_back(message);
		}

		void OnTokenReceived(const char* token) override
		{
			std::lock_guard<std::mutex> lock(mutex_);
			token_ = token != nullptr ? token : "";
			has_token_ = true;
		}

		bool pollMessage(firebase::messaging::Message& out)
		{
			std::lock_guard<std::mutex> lock(mutex_);
			if (messages_.empty()) return false;
			out = messages_.front();
			messages_.pop_front();
			return true;
		}

		bool pollToken(std::string& out)
		{
			std::lock_guard<std::mutex> lock(mutex_);
			if (!has_token_) return false;
			out.swap(token_);
			token_.clear();
			has_token_ = false;
			return true;
		}

	private:
		std::mutex mutex_;
		std::deque<firebase::messaging::Message> messages_;
		std::string token_;
		bool has_token_ = false;
	};

	// Handed to the SDK by address at Initialize(), so it has to outlive every
	// delivery: minted by the initialize entry points and deleted only after
	// SetListener(nullptr) has returned, which the SDK serialises against any
	// in-flight OnMessage() under its own listener lock. A static listener
	// would instead be destroyed at process exit in whatever order the
	// runtime chose, with the SDK's threads still able to deliver into it.
	// Null doubles as "not initialised" for every guard below.
	GmMessagingListener* g_firebase_messaging_listener = nullptr;

	// Most recently polled message/token, populated by
	// firebase_messaging_poll_message()/firebase_messaging_poll_token() and read back by the
	// per-field getters below. Not guarded by a mutex: like the rest of this
	// extension's poll-based state, this is only ever touched from the GML
	// step thread that calls firebase_messaging_poll_message()/getter pairs back to
	// back, never concurrently with itself.
	firebase::messaging::Message g_current_message;
	std::string g_current_token;

	// The SDK asserts (and aborts) inside RequestPermission/GetToken/
	// DeleteToken/Subscribe/Unsubscribe when Initialize() has not run, so
	// every entry point that reaches them rejects here first.
	bool messagingReady(const char* function)
	{
		if (g_firebase_messaging_listener != nullptr) return true;
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, std::string(function) + ": call firebase_messaging_initialize() first");
		return false;
	}

	double messagingInitialize(firebase::App* app, const firebase::messaging::MessagingOptions* options, const char* function)
	{
		if (g_firebase_messaging_listener != nullptr)
			return static_cast<double>(firebase::kInitResultSuccess);

		auto* listener = new GmMessagingListener();
		firebase::InitResult result = options != nullptr
			? firebase::messaging::Initialize(*app, listener, *options)
			: firebase::messaging::Initialize(*app, listener);
		if (result != firebase::kInitResultSuccess)
		{
			setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, firebaseInitResultMessage((std::string(function) + ": Initialize() failed").c_str(), result));
			// On Android the SDK stores the listener before the checks that can
			// fail, so unset it before the object goes away.
			firebase::messaging::SetListener(nullptr);
			delete listener;
			return static_cast<double>(result);
		}

		g_firebase_messaging_listener = listener;
		return static_cast<double>(result);
	}
}

// ============================================================
// Init / lifecycle
// ============================================================

double firebase_messaging_initialize()
{
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_messaging: no firebase::App - call firebase_app_initialize() first");
		return -1.0;
	}

	return messagingInitialize(app, nullptr, "firebase_messaging_initialize");
}

void firebase_messaging_terminate()
{
	if (g_firebase_messaging_listener == nullptr) return;

	// Android and iOS Terminate() unset the listener themselves; the desktop
	// stub does not, and doing it first is what guarantees no delivery is
	// still running when the object is deleted.
	firebase::messaging::SetListener(nullptr);
	firebase::messaging::Terminate();
	delete g_firebase_messaging_listener;
	g_firebase_messaging_listener = nullptr;
	g_current_message = firebase::messaging::Message();
	g_current_token.clear();
}

// The four setters/getters below are deliberately not gated on initialisation:
// the SDK records them as pending state before Initialize() and applies them
// during it, which is how FCM's consent flow disables token registration
// before the first init.
void firebase_messaging_set_token_registration_on_init_enabled(double enabled)
{
	GMF_DEPRECATED_PUSH()
	firebase::messaging::SetTokenRegistrationOnInitEnabled(enabled >= 0.5);
	GMF_DEPRECATED_POP()
}

double firebase_messaging_is_token_registration_on_init_enabled()
{
	GMF_DEPRECATED_PUSH()
	bool enabled = firebase::messaging::IsTokenRegistrationOnInitEnabled();
	GMF_DEPRECATED_POP()
	return enabled ? 1.0 : 0.0;
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
FirebaseError firebase_messaging_request_permission(const std::optional<GMFunction>& callback)
{
	if (!messagingReady("firebase_messaging_request_permission"))
		return FirebaseError::NotInitialized;

	firebase::messaging::RequestPermission().OnCompletion([callback](const firebase::Future<void>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (callback.has_value())
			callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return FirebaseError::Ok;
}

// callback(error_code: real, error_message: string, token: string)
FirebaseError firebase_messaging_get_token(const std::optional<GMFunction>& callback)
{
	if (!messagingReady("firebase_messaging_get_token"))
		return FirebaseError::NotInitialized;

	GMF_DEPRECATED_PUSH()
	firebase::Future<std::string> future = firebase::messaging::GetToken();
	GMF_DEPRECATED_POP()
	future.OnCompletion([callback](const firebase::Future<std::string>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (!callback.has_value()) return;
		std::string token = (f.error() == 0 && f.result() != nullptr) ? *f.result() : std::string();
		callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" }, std::string_view{ token });
	});
	return FirebaseError::Ok;
}

// callback(error_code: real, error_message: string)
FirebaseError firebase_messaging_delete_token(const std::optional<GMFunction>& callback)
{
	if (!messagingReady("firebase_messaging_delete_token"))
		return FirebaseError::NotInitialized;

	GMF_DEPRECATED_PUSH()
	firebase::Future<void> future = firebase::messaging::DeleteToken();
	GMF_DEPRECATED_POP()
	future.OnCompletion([callback](const firebase::Future<void>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (callback.has_value())
			callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return FirebaseError::Ok;
}

// callback(error_code: real, error_message: string)
FirebaseError firebase_messaging_subscribe(std::string_view topic, const std::optional<GMFunction>& callback)
{
	if (!messagingReady("firebase_messaging_subscribe"))
		return FirebaseError::NotInitialized;

	firebase::messaging::Subscribe(std::string(topic).c_str()).OnCompletion([callback](const firebase::Future<void>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (callback.has_value())
			callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return FirebaseError::Ok;
}

// callback(error_code: real, error_message: string)
FirebaseError firebase_messaging_unsubscribe(std::string_view topic, const std::optional<GMFunction>& callback)
{
	if (!messagingReady("firebase_messaging_unsubscribe"))
		return FirebaseError::NotInitialized;

	firebase::messaging::Unsubscribe(std::string(topic).c_str()).OnCompletion([callback](const firebase::Future<void>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (callback.has_value())
			callback->call(static_cast<double>(f.error()), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return FirebaseError::Ok;
}

// ============================================================
// Poll buffer
// ============================================================

// Returns 1 and refreshes the getters below if a message was pending;
// 0 otherwise (call firebase_messaging_poll_message() in a loop, or once per step,
// until it returns 0).
double firebase_messaging_poll_message()
{
	if (!messagingReady("firebase_messaging_poll_message")) return 0.0;

	return g_firebase_messaging_listener->pollMessage(g_current_message) ? 1.0 : 0.0;
}

// Returns 1 and refreshes firebase_messaging_current_token() if a freshly-generated
// registration token was pending; 0 otherwise.
double firebase_messaging_poll_token()
{
	if (!messagingReady("firebase_messaging_poll_token")) return 0.0;

	return g_firebase_messaging_listener->pollToken(g_current_token) ? 1.0 : 0.0;
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

// Firebase C++ MessagingOptions overload.
double firebase_messaging_initialize_with_options(double suppress_notification_permission_prompt)
{
    firebase::App* app = getFirebaseApp();
    if (app == nullptr)
    {
        setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_messaging: no firebase::App - call firebase_app_initialize() first");
        return -1.0;
    }
    firebase::messaging::MessagingOptions options;
    options.suppress_notification_permission_prompt = suppress_notification_permission_prompt >= 0.5;
    return messagingInitialize(app, &options, "firebase_messaging_initialize_with_options");
}

double firebase_messaging_initialize_for_app(uint64_t app_ref)
{
    auto* app = resolveFirebaseApp(app_ref); if (!app) return -1.0;
    return messagingInitialize(app, nullptr, "firebase_messaging_initialize_for_app");
}

double firebase_messaging_initialize_for_app_with_options(uint64_t app_ref, double suppress_notification_permission_prompt)
{
    auto* app = resolveFirebaseApp(app_ref); if (!app) return -1.0;
    firebase::messaging::MessagingOptions options;
    options.suppress_notification_permission_prompt = suppress_notification_permission_prompt >= 0.5;
    return messagingInitialize(app, &options, "firebase_messaging_initialize_for_app_with_options");
}
