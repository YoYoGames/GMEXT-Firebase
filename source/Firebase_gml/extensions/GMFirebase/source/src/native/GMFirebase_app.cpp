#include "GMFirebase_common.h"
#include "firebase/version.h"

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

// ============================================================
// App core
// ============================================================

// Creates (or reuses) the single shared firebase::App instance every other
// product module attaches to via getFirebaseApp(). Must be called once,
// before any other GMFirebase_* module function, on every platform.
double firebase_app_initialize()
{
#if defined(__ANDROID__)
	// firebase::App::Create() on Android needs a JNIEnv* and the activity
	// jobject (firebase::App::Create(JNIEnv*, jobject)). extgen's accessor
	// for the Android JNI environment/activity handles is not confirmed for
	// this codebase yet, so rather than guess at that API this path is
	// unavailable until a confirmed native Extension Generator JNI/activity bridge is provided: Android callers get a clean, reported failure instead of a
	// silently wrong JNI call. Wire up App::Create(jni_env, activity) here
	// once the JNI accessor is confirmed.
	setFirebaseLastError(-1, "firebase_app_initialize: Android App acquisition is not implemented yet");
	return 0.0;
#else
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(-1, "firebase_app_initialize: failed to create firebase::App");
		return 0.0;
	}
	return 1.0;
#endif
}

// True once firebase_app_initialize() has successfully produced an App,
// without forcing creation the way getFirebaseApp() does.
double firebase_app_is_initialized()
{
	return g_firebase_app != nullptr ? 1.0 : 0.0;
}

// Empty string if the app has not been initialized yet.
std::string firebase_app_get_name()
{
	if (g_firebase_app == nullptr)
		return std::string();
	return std::string(g_firebase_app->name());
}

// ============================================================
// Utility
// ============================================================
//
// firebase_last_error_code()/firebase_last_error_message() are declared in
// the spec fragment for this group, but their implementations already live
// in GMFirebase_common.cpp under those exact names (every module funnels
// into them via setFirebaseLastError()) - defining them again here would be
// a duplicate symbol, so there is intentionally no wrapper body in this
// file.

// ============================================================
// AppOptions / multi-app / global log-level coverage
// ============================================================

namespace
{
    firebase::AppOptions gmValueToAppOptions(const gm::wire::GMValue& value)
    {
        firebase::AppOptions options;
        if (!value.is<gm::wire::GMObjectView>()) return options;
        auto obj = value.as<gm::wire::GMObjectView>();
        for (const auto& kv : obj)
        {
            if (!kv.second.is<std::string_view>()) continue;
            const std::string v(kv.second.as<std::string_view>());
            if (kv.first == "app_id") options.set_app_id(v.c_str());
            else if (kv.first == "api_key") options.set_api_key(v.c_str());
            else if (kv.first == "messaging_sender_id") options.set_messaging_sender_id(v.c_str());
            else if (kv.first == "database_url") options.set_database_url(v.c_str());
            else if (kv.first == "ga_tracking_id") options.set_ga_tracking_id(v.c_str());
            else if (kv.first == "storage_bucket") options.set_storage_bucket(v.c_str());
            else if (kv.first == "project_id") options.set_project_id(v.c_str());
        }
        return options;
    }

    gm::wire::DataStream appOptionsToGM(const firebase::AppOptions& options)
    {
        gm::wire::StructStream s;
        s.add("app_id", std::string_view{options.app_id() ? options.app_id() : ""});
        s.add("api_key", std::string_view{options.api_key() ? options.api_key() : ""});
        s.add("messaging_sender_id", std::string_view{options.messaging_sender_id() ? options.messaging_sender_id() : ""});
        s.add("database_url", std::string_view{options.database_url() ? options.database_url() : ""});
        s.add("ga_tracking_id", std::string_view{options.ga_tracking_id() ? options.ga_tracking_id() : ""});
        s.add("storage_bucket", std::string_view{options.storage_bucket() ? options.storage_bucket() : ""});
        s.add("project_id", std::string_view{options.project_id() ? options.project_id() : ""});
        gm::wire::DataStream out; out << s; return out;
    }
}

uint64_t firebase_app_get_default_handle()
{
    return wrapFirebaseApp(getFirebaseApp());
}

uint64_t firebase_app_get_instance(std::string_view name)
{
    std::string n(name);
    return wrapFirebaseApp(n.empty() ? firebase::App::GetInstance() : firebase::App::GetInstance(n.c_str()));
}

gm::wire::DataStream firebase_app_get_apps()
{
    gm::wire::ArrayStream a;
    for (auto* app : firebase::App::GetApps())
        if (app) a.push(static_cast<double>(wrapFirebaseApp(app)));
    gm::wire::DataStream out; out << a; return out;
}

uint64_t firebase_app_initialize_with_options(const gm::wire::GMValue& options_value, std::string_view name)
{
#if defined(__ANDROID__)
    (void)options_value; (void)name;
    setFirebaseLastError(-1, "firebase_app_initialize_with_options: Android requires JNIEnv/activity integration from the GameMaker runner");
    return 0;
#else
    auto options = gmValueToAppOptions(options_value);
    std::string n(name);
    firebase::App* app = n.empty() ? firebase::App::Create(options) : firebase::App::Create(options, n.c_str());
    if (!app) { setFirebaseLastError(-1, "firebase_app_initialize_with_options: Firebase App::Create returned null"); return 0; }
    if (n.empty() || n == firebase::kDefaultAppName) g_firebase_app = app;
    return wrapFirebaseApp(app);
#endif
}

uint64_t firebase_app_initialize_from_json(std::string_view json_config, std::string_view name)
{
    std::string json(json_config);
    firebase::AppOptions options;
    if (!firebase::AppOptions::LoadFromJsonConfig(json.c_str(), &options))
    {
        setFirebaseLastError(-1, "firebase_app_initialize_from_json: invalid Firebase JSON configuration");
        return 0;
    }
#if defined(__ANDROID__)
    (void)name;
    setFirebaseLastError(-1, "firebase_app_initialize_from_json: Android requires JNIEnv/activity integration from the GameMaker runner");
    return 0;
#else
    std::string n(name);
    firebase::App* app = n.empty() ? firebase::App::Create(options) : firebase::App::Create(options, n.c_str());
    if (!app) { setFirebaseLastError(-1, "firebase_app_initialize_from_json: Firebase App::Create returned null"); return 0; }
    if (n.empty() || n == firebase::kDefaultAppName) g_firebase_app = app;
    return wrapFirebaseApp(app);
#endif
}

std::string firebase_app_handle_get_name(uint64_t app_ref)
{
    auto* app = resolveFirebaseApp(app_ref); return app ? std::string(app->name()) : std::string();
}

gm::wire::DataStream firebase_app_handle_get_options(uint64_t app_ref)
{
    auto* app = resolveFirebaseApp(app_ref);
    return app ? appOptionsToGM(app->options()) : gm::wire::DataStream{};
}

gm::wire::DataStream firebase_app_get_default_options()
{
    auto* app = getFirebaseApp(); return app ? appOptionsToGM(app->options()) : gm::wire::DataStream{};
}

void firebase_app_release_handle(uint64_t app_ref)
{
    unregisterFirebasePointer(app_ref, GM_FB_TYPE_APP);
}

void firebase_set_log_level(double level)
{
    firebase::SetLogLevel(static_cast<firebase::LogLevel>(static_cast<int>(level)));
}

double firebase_get_log_level()
{
    return static_cast<double>(firebase::GetLogLevel());
}

std::string firebase_get_sdk_version()
{
    return FIREBASE_VERSION_NUMBER_STRING;
}
