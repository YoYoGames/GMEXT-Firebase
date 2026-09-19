#include "GMFirebase_messaging.h"
#include <algorithm>
#include <cstring>
#include <deque>
#include <memory>
#include <mutex>

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

// FirebaseMessagingError mirrors firebase::messaging::Error, the error_code
// the permission, registration, token and topic callbacks receive. See
// GM_FB_PIN_ENUM in GMFirebase_common.h.
GM_FB_PIN_ENUM(FirebaseMessagingError::None, firebase::messaging::kErrorNone);
GM_FB_PIN_ENUM(FirebaseMessagingError::FailedToRegisterForRemoteNotifications, firebase::messaging::kErrorFailedToRegisterForRemoteNotifications);
GM_FB_PIN_ENUM(FirebaseMessagingError::InvalidTopicName, firebase::messaging::kErrorInvalidTopicName);
GM_FB_PIN_ENUM(FirebaseMessagingError::NoRegistrationToken, firebase::messaging::kErrorNoRegistrationToken);
GM_FB_PIN_ENUM(FirebaseMessagingError::Unknown, firebase::messaging::kErrorUnknown);

// Firebase C++ SDK 13.12 deprecated the token-based FCM registration API in
// favor of the Installation-ID model (Register()/Unregister() and
// OnRegistrationReceived()), which this file exposes alongside. The token
// functions stay for the GML API that already exists; these macros silence
// -Werror,-Wdeprecated-declarations at the two SDK calls that remain, and go
// when firebase_messaging_get_token()/_delete_token() do.
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
	// The SDK delivers through one Listener with a method per event; each is a
	// GML callback held here rather than in the listener, because SetListener()
	// replays a pending registration id into the new listener from inside
	// Initialize(), so a slot has to exist before the listener does. Written
	// from the GML thread, read from whichever thread the SDK delivers on. The
	// callback is copied out under the lock and called outside it, so a
	// reassignment never races the call and the call never holds the lock -
	// OnMessage() already runs under the SDK's own listener lock.
	std::mutex g_messaging_mutex;
	std::optional<GMFunction> g_message_callback;
	std::optional<GMFunction> g_registration_callback;
	std::optional<GMFunction> g_unregistration_callback;

	// What arrived while its callback was not set. The SDK holds messages until
	// a listener exists (Android's storage file, iOS's launch notification) and
	// delivers them the moment Initialize() installs ours, so a game that
	// initialises in one event and sets the callback in the next would
	// otherwise lose the message that launched it. Messages keep their order up
	// to a cap (the SDK's own PollableListener has none, messaging/src/common.cc);
	// an id is state, not a stream, so only the latest of each is kept.
	constexpr size_t kMaxHeldMessages = 256;
	std::deque<FirebaseMessagingMessage> g_held_messages;
	std::optional<std::string> g_held_registration;
	std::optional<std::string> g_held_unregistration;

	// A message's binary payload, held until the game copies it out and
	// releases it (firebase_messaging_raw_data_copy / _release). Minted only for
	// a message that carries bytes; terminate frees whatever is left.
	using MessagingRawData = std::shared_ptr<std::vector<std::uint8_t>>;
	std::map<uint32_t, MessagingRawData> g_firebase_messaging_raw_data_map;
	uint32_t g_firebase_messaging_raw_data_index = 0;

	MessagingRawData* resolveRawData(uint64_t ref)
	{
		MessagingRawData* out = nullptr;
		validate_fb_ref_map(ref, GM_FB_TYPE_MESSAGING_RAW_DATA, MessagingRawData, g_firebase_messaging_raw_data_map, out);
		return out;
	}

	void releaseRawData(const std::optional<uint64_t>& ref)
	{
		if (ref.has_value())
			unregisterFirebaseValue(gm_fb_ref_id(*ref), g_firebase_messaging_raw_data_map);
	}

	FirebaseMessagingNotification makeMessagingNotification(const firebase::messaging::Notification& n)
	{
		FirebaseMessagingNotification out;
		out.title = n.title;
		out.body = n.body;
		out.icon = n.icon;
		out.sound = n.sound;
		out.badge = n.badge;
		out.tag = n.tag;
		out.color = n.color;
		out.click_action = n.click_action;
		out.body_loc_key = n.body_loc_key;
		out.body_loc_args = n.body_loc_args;
		out.title_loc_key = n.title_loc_key;
		out.title_loc_args = n.title_loc_args;
		if (n.android != nullptr)
			out.android = FirebaseMessagingAndroidNotificationParams{ n.android->channel_id };
		return out;
	}

	// The SDK's Message copied field for field. notification is only valid
	// during OnMessage(), which is the one place this runs.
	FirebaseMessagingMessage makeMessagingMessage(const firebase::messaging::Message& m)
	{
		FirebaseMessagingMessage out;
		out.from = m.from;
		out.to = m.to;
		out.collapse_key = m.collapse_key;
		// The sender's keys are its own, so the map stays a dynamic struct. A
		// gmval field carries exactly one encoded value, hence the single <<.
		StructStream data;
		for (const auto& kv : m.data)
			data.add(kv.first.c_str(), kv.second);
		out.data << data;
		if (!m.raw_data.empty())
		{
			auto bytes = std::make_shared<std::vector<std::uint8_t>>(m.raw_data.begin(), m.raw_data.end());
			out.raw_data = packFirebaseRef(registerFirebaseValue(bytes, g_firebase_messaging_raw_data_index, g_firebase_messaging_raw_data_map), GM_FB_TYPE_MESSAGING_RAW_DATA);
		}
		out.raw_data_size = static_cast<double>(m.raw_data.size());
		out.message_id = m.message_id;
		out.message_type = m.message_type;
		out.priority = m.priority;
		out.time_to_live = static_cast<double>(m.time_to_live);
		out.error = m.error;
		out.error_description = m.error_description;
		if (m.notification != nullptr)
			out.notification = makeMessagingNotification(*m.notification);
		out.notification_opened = m.notification_opened;
		out.link = m.link;
		out.original_priority = m.original_priority;
		out.sent_time = static_cast<double>(m.sent_time);
		return out;
	}

	// The one Listener the SDK gets. Each method builds the GML value, then
	// hands it to the callback or holds it; the call never happens under the
	// lock. OnTokenReceived() is not overridden: the SDK deprecated it, the base
	// class no-ops it, and Android forwards the same event to
	// OnRegistrationReceived().
	class GmMessagingListener : public firebase::messaging::Listener
	{
	public:
		void OnMessage(const firebase::messaging::Message& message) override
		{
			FirebaseMessagingMessage out = makeMessagingMessage(message);
			std::optional<GMFunction> callback;
			{
				std::lock_guard<std::mutex> lock(g_messaging_mutex);
				if (g_message_callback.has_value())
					callback = g_message_callback;
				else
				{
					if (g_held_messages.size() >= kMaxHeldMessages)
					{
						releaseRawData(g_held_messages.front().raw_data);
						g_held_messages.pop_front();
						LOG_WARNING("firebase_messaging: %zu messages held with no message callback set - dropping the oldest", kMaxHeldMessages);
					}
					g_held_messages.push_back(std::move(out));
				}
			}
			if (callback.has_value())
				callback->call(out);
		}

		void OnRegistrationReceived(const char* installation_id) override
		{
			deliverId(g_registration_callback, g_held_registration, installation_id);
		}

		void OnUnregistrationReceived(const char* installation_id) override
		{
			deliverId(g_unregistration_callback, g_held_unregistration, installation_id);
		}

	private:
		static void deliverId(const std::optional<GMFunction>& slot, std::optional<std::string>& held, const char* installation_id)
		{
			std::string id = installation_id != nullptr ? installation_id : "";
			std::optional<GMFunction> callback;
			{
				std::lock_guard<std::mutex> lock(g_messaging_mutex);
				if (slot.has_value())
					callback = slot;
				else
					held = id;
			}
			if (callback.has_value())
				callback->call(std::string_view{ id });
		}
	};

	// Handed to the SDK by address at Initialize(), so it has to outlive every
	// delivery: minted by the initialize entry points and deleted only after
	// SetListener(nullptr) has returned, which the SDK serialises against any
	// in-flight OnMessage() under its own listener lock. A static listener
	// would instead be destroyed at process exit in whatever order the
	// runtime chose, with the SDK's threads still able to deliver into it.
	// Null doubles as "not initialised" for every guard below.
	GmMessagingListener* g_firebase_messaging_listener = nullptr;

	// The SDK asserts (and aborts) inside RequestPermission/GetToken/
	// DeleteToken/Subscribe/Unsubscribe when Initialize() has not run, so
	// every entry point that reaches them rejects here first.
	bool messagingReady(const char* function)
	{
		if (g_firebase_messaging_listener != nullptr) return true;
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, std::string(function) + ": call firebase_messaging_initialize() first");
		return false;
	}

	// True once the SDK is initialised; the InitResult behind a failure is in
	// the last-error message.
	bool messagingInitialize(firebase::App* app, const firebase::messaging::MessagingOptions* options, const char* function)
	{
		if (g_firebase_messaging_listener != nullptr)
			return true;

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
			return false;
		}

		g_firebase_messaging_listener = listener;
		return true;
	}

	// Shared by the two id setters: assign the slot and, when it is now set,
	// hand over the id that was held - outside the lock.
	void setIdCallback(std::optional<GMFunction>& slot, std::optional<std::string>& held, const std::optional<GMFunction>& callback)
	{
		std::optional<std::string> pending;
		{
			std::lock_guard<std::mutex> lock(g_messaging_mutex);
			slot = callback;
			if (callback.has_value())
				pending.swap(held);
		}
		if (pending.has_value())
			callback->call(std::string_view{ *pending });
	}
}

// ============================================================
// Init / lifecycle
// ============================================================

bool firebase_messaging_initialize()
{
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_messaging: no firebase::App - call firebase_app_initialize() first");
		return false;
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

	// A terminate is a full reset: the callbacks go back to GML, what was held
	// for them is dropped, and every payload handle still out is freed.
	{
		std::lock_guard<std::mutex> lock(g_messaging_mutex);
		g_message_callback.reset();
		g_registration_callback.reset();
		g_unregistration_callback.reset();
		g_held_messages.clear();
		g_held_registration.reset();
		g_held_unregistration.reset();
	}
	{
		std::lock_guard<std::mutex> lock(g_firebase_value_registry_mutex);
		g_firebase_messaging_raw_data_map.clear();
	}
}

// The setters/getters below are deliberately not gated on initialisation:
// the SDK records them as pending state before Initialize() and applies them
// during it, which is how FCM's consent flow disables registration before
// the first init. The token-named pair is the same SDK state under its
// pre-13.12 name (Android forwards one to the other, iOS reads the same
// autoInitEnabled), so both call the current entry points.
void firebase_messaging_set_registration_on_init_enabled(bool enabled)
{
	firebase::messaging::SetRegistrationOnInitEnabled(enabled);
}

bool firebase_messaging_is_registration_on_init_enabled()
{
	return firebase::messaging::IsRegistrationOnInitEnabled();
}

void firebase_messaging_set_token_registration_on_init_enabled(bool enabled)
{
	firebase::messaging::SetRegistrationOnInitEnabled(enabled);
}

bool firebase_messaging_is_token_registration_on_init_enabled()
{
	return firebase::messaging::IsRegistrationOnInitEnabled();
}

bool firebase_messaging_delivery_metrics_export_to_big_query_enabled()
{
	return firebase::messaging::DeliveryMetricsExportToBigQueryEnabled();
}

void firebase_messaging_set_delivery_metrics_export_to_big_query(bool enabled)
{
	firebase::messaging::SetDeliveryMetricsExportToBigQuery(enabled);
}

// ============================================================
// Event callbacks
// ============================================================

// The three setters work before firebase_messaging_initialize() as well as
// after it - a slot is module state, not listener state - and hand over
// whatever arrived while the slot was empty, in order, outside the lock.
// undefined clears the slot, after which events are held again.
void firebase_messaging_set_message_callback(const std::optional<GMFunction>& callback)
{
	std::deque<FirebaseMessagingMessage> held;
	{
		std::lock_guard<std::mutex> lock(g_messaging_mutex);
		g_message_callback = callback;
		if (callback.has_value())
			held.swap(g_held_messages);
	}
	for (const FirebaseMessagingMessage& message : held)
		callback->call(message);
}

void firebase_messaging_set_registration_callback(const std::optional<GMFunction>& callback)
{
	setIdCallback(g_registration_callback, g_held_registration, callback);
}

void firebase_messaging_set_unregistration_callback(const std::optional<GMFunction>& callback)
{
	setIdCallback(g_unregistration_callback, g_held_unregistration, callback);
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
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

// callback(error_code: real, error_message: string)
// The installation id itself reaches GML through OnRegistrationReceived ->
// the registration callback, which the SDK fires on completion whether or
// not the app was already registered.
FirebaseError firebase_messaging_register(const std::optional<GMFunction>& callback)
{
	if (!messagingReady("firebase_messaging_register"))
		return FirebaseError::NotInitialized;

	firebase::messaging::Register().OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

// callback(error_code: real, error_message: string)
FirebaseError firebase_messaging_unregister(const std::optional<GMFunction>& callback)
{
	if (!messagingReady("firebase_messaging_unregister"))
		return FirebaseError::NotInitialized;

	firebase::messaging::Unregister().OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
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
		completeFuture(callback, f, [](const std::string& token) { return std::string_view{ token }; });
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
		completeFuture(callback, f);
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
		completeFuture(callback, f);
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
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

// ============================================================
// Binary payload
// ============================================================

// Copies up to out_buffer.length() bytes into out_buffer; returns the
// number of bytes actually copied, 0 with the last error set for a handle
// that is not a live payload.
double firebase_messaging_raw_data_copy(uint64_t raw_data_ref, GMBuffer out_buffer)
{
	MessagingRawData* self = resolveRawData(raw_data_ref);
	if (self == nullptr) return 0.0;

	const std::vector<std::uint8_t>& bytes = **self;
	size_t n = std::min<size_t>(bytes.size(), static_cast<size_t>(out_buffer.length()));
	if (n) std::memcpy(out_buffer.data(), bytes.data(), n);
	return static_cast<double>(n);
}

void firebase_messaging_raw_data_release(uint64_t raw_data_ref)
{
	MessagingRawData* self = resolveRawData(raw_data_ref);
	if (self == nullptr) return;
	unregisterFirebaseValue(gm_fb_ref_id(raw_data_ref), g_firebase_messaging_raw_data_map);
}

// Firebase C++ MessagingOptions overload.
bool firebase_messaging_initialize_with_options(bool suppress_notification_permission_prompt)
{
    firebase::App* app = getFirebaseApp();
    if (app == nullptr)
    {
        setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_messaging: no firebase::App - call firebase_app_initialize() first");
        return false;
    }
    firebase::messaging::MessagingOptions options;
    options.suppress_notification_permission_prompt = suppress_notification_permission_prompt;
    return messagingInitialize(app, &options, "firebase_messaging_initialize_with_options");
}

bool firebase_messaging_initialize_for_app(uint64_t app_ref)
{
    auto* app = resolveFirebaseApp(app_ref); if (!app) return false;
    return messagingInitialize(app, nullptr, "firebase_messaging_initialize_for_app");
}

bool firebase_messaging_initialize_for_app_with_options(uint64_t app_ref, bool suppress_notification_permission_prompt)
{
    auto* app = resolveFirebaseApp(app_ref); if (!app) return false;
    firebase::messaging::MessagingOptions options;
    options.suppress_notification_permission_prompt = suppress_notification_permission_prompt;
    return messagingInitialize(app, &options, "firebase_messaging_initialize_for_app_with_options");
}
