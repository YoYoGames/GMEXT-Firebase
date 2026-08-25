#include "GMFirebase_common.h"
#include "firebase/version.h"

#if defined(__ANDROID__)
#include <jni.h>

// third_party/CMakeLists.txt renames ExtGen's generated JNI_OnLoad to
// GMFirebase_ExtGen_JNI_OnLoad for Android. This file then owns the real
// JNI_OnLoad, captures the JavaVM, and forwards to ExtGen's loader.
#ifdef JNI_OnLoad
#undef JNI_OnLoad
#endif

extern "C" jint GMFirebase_ExtGen_JNI_OnLoad(JavaVM* vm, void* reserved);
#endif

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

#if defined(__ANDROID__)
namespace
{
    JavaVM* g_firebase_java_vm = nullptr;

    void clearAndroidJniException(JNIEnv* env)
    {
        if (env != nullptr && env->ExceptionCheck())
            env->ExceptionClear();
    }

    JNIEnv* getAndroidJniEnv(std::string& error_message)
    {
        if (g_firebase_java_vm == nullptr)
        {
            error_message =
                "Android JavaVM was not captured by GMFirebase JNI_OnLoad";
            return nullptr;
        }

        // All public GMFirebase functions on Android are entered through
        // ExtGen's Java -> JNI bridge, so the calling thread is already
        // attached to the VM. Do not attach/detach it here.
        JNIEnv* env = nullptr;
        const jint env_result = g_firebase_java_vm->GetEnv(
            reinterpret_cast<void**>(&env),
            JNI_VERSION_1_6);

        if (env_result != JNI_OK || env == nullptr)
        {
            error_message =
                "current GameMaker thread has no Android JNIEnv (GetEnv=" +
                std::to_string(static_cast<int>(env_result)) + ")";
            return nullptr;
        }

        return env;
    }

    jobject getStaticObjectFieldReflective(JNIEnv* env, jclass owner, const char* field_name)
    {
        if (env == nullptr || owner == nullptr || field_name == nullptr)
            return nullptr;

        jclass class_class = env->FindClass("java/lang/Class");
        if (class_class == nullptr)
        {
            clearAndroidJniException(env);
            return nullptr;
        }

        jmethodID get_declared_field = env->GetMethodID(
            class_class,
            "getDeclaredField",
            "(Ljava/lang/String;)Ljava/lang/reflect/Field;");

        if (get_declared_field == nullptr)
        {
            clearAndroidJniException(env);
            env->DeleteLocalRef(class_class);
            return nullptr;
        }

        jstring java_field_name = env->NewStringUTF(field_name);
        jobject field = env->CallObjectMethod(owner, get_declared_field, java_field_name);

        if (java_field_name != nullptr)
            env->DeleteLocalRef(java_field_name);
        env->DeleteLocalRef(class_class);

        if (env->ExceptionCheck())
        {
            env->ExceptionClear();
            if (field != nullptr)
                env->DeleteLocalRef(field);
            return nullptr;
        }

        if (field == nullptr)
            return nullptr;

        jclass field_class = env->FindClass("java/lang/reflect/Field");
        if (field_class == nullptr)
        {
            clearAndroidJniException(env);
            env->DeleteLocalRef(field);
            return nullptr;
        }

        // CurrentActivity/ms_context have changed visibility/type across runner
        // versions. Reflection lets us read them without hard-coding a field
        // descriptor such as Landroid/content/Context;.
        jmethodID set_accessible = env->GetMethodID(field_class, "setAccessible", "(Z)V");
        if (set_accessible != nullptr)
        {
            env->CallVoidMethod(field, set_accessible, JNI_TRUE);
            clearAndroidJniException(env);
        }
        else
        {
            clearAndroidJniException(env);
        }

        jmethodID get_value = env->GetMethodID(
            field_class,
            "get",
            "(Ljava/lang/Object;)Ljava/lang/Object;");

        if (get_value == nullptr)
        {
            clearAndroidJniException(env);
            env->DeleteLocalRef(field_class);
            env->DeleteLocalRef(field);
            return nullptr;
        }

        jobject value = env->CallObjectMethod(field, get_value, static_cast<jobject>(nullptr));
        if (env->ExceptionCheck())
        {
            env->ExceptionClear();
            if (value != nullptr)
                env->DeleteLocalRef(value);
            value = nullptr;
        }

        env->DeleteLocalRef(field_class);
        env->DeleteLocalRef(field);
        return value;
    }

    bool isAndroidActivity(JNIEnv* env, jobject object)
    {
        if (env == nullptr || object == nullptr)
            return false;

        jclass activity_class = env->FindClass("android/app/Activity");
        if (activity_class == nullptr)
        {
            clearAndroidJniException(env);
            return false;
        }

        const bool result = env->IsInstanceOf(object, activity_class) == JNI_TRUE;
        env->DeleteLocalRef(activity_class);
        return result;
    }

    std::string getAndroidPackageName(JNIEnv* env, jobject context)
    {
        if (env == nullptr || context == nullptr)
            return {};

        jclass context_class = env->GetObjectClass(context);
        if (context_class == nullptr)
            return {};

        jmethodID get_package_name = env->GetMethodID(
            context_class,
            "getPackageName",
            "()Ljava/lang/String;");
        env->DeleteLocalRef(context_class);

        if (get_package_name == nullptr)
        {
            clearAndroidJniException(env);
            return {};
        }

        jstring package_name = static_cast<jstring>(env->CallObjectMethod(context, get_package_name));
        if (env->ExceptionCheck())
        {
            env->ExceptionClear();
            return {};
        }

        if (package_name == nullptr)
            return {};

        const char* chars = env->GetStringUTFChars(package_name, nullptr);
        std::string result = chars != nullptr ? chars : "";

        if (chars != nullptr)
            env->ReleaseStringUTFChars(package_name, chars);
        env->DeleteLocalRef(package_name);
        return result;
    }

    jclass loadAndroidClass(JNIEnv* env, jobject context, const std::string& class_name)
    {
        if (env == nullptr || context == nullptr || class_name.empty())
            return nullptr;

        jclass context_class = env->GetObjectClass(context);
        if (context_class == nullptr)
            return nullptr;

        jmethodID get_class_loader = env->GetMethodID(
            context_class,
            "getClassLoader",
            "()Ljava/lang/ClassLoader;");
        env->DeleteLocalRef(context_class);

        if (get_class_loader == nullptr)
        {
            clearAndroidJniException(env);
            return nullptr;
        }

        jobject class_loader = env->CallObjectMethod(context, get_class_loader);
        if (env->ExceptionCheck())
        {
            env->ExceptionClear();
            return nullptr;
        }

        if (class_loader == nullptr)
            return nullptr;

        jclass loader_class = env->GetObjectClass(class_loader);
        if (loader_class == nullptr)
        {
            env->DeleteLocalRef(class_loader);
            return nullptr;
        }

        jmethodID load_class = env->GetMethodID(
            loader_class,
            "loadClass",
            "(Ljava/lang/String;)Ljava/lang/Class;");

        if (load_class == nullptr)
        {
            clearAndroidJniException(env);
            env->DeleteLocalRef(loader_class);
            env->DeleteLocalRef(class_loader);
            return nullptr;
        }

        jstring java_class_name = env->NewStringUTF(class_name.c_str());
        jobject loaded_class = env->CallObjectMethod(class_loader, load_class, java_class_name);

        if (java_class_name != nullptr)
            env->DeleteLocalRef(java_class_name);
        env->DeleteLocalRef(loader_class);
        env->DeleteLocalRef(class_loader);

        if (env->ExceptionCheck())
        {
            env->ExceptionClear();
            if (loaded_class != nullptr)
                env->DeleteLocalRef(loaded_class);
            return nullptr;
        }

        return static_cast<jclass>(loaded_class);
    }

    jobject getCurrentAndroidApplication(JNIEnv* env)
    {
        // Fallback only. Normally FindClass(RunnerJNILib) succeeds because this
        // function is called from ExtGen's Java -> JNI bridge and therefore has
        // the application's ClassLoader available.
        jclass activity_thread = env->FindClass("android/app/ActivityThread");
        if (activity_thread == nullptr)
        {
            clearAndroidJniException(env);
            return nullptr;
        }

        jmethodID current_application = env->GetStaticMethodID(
            activity_thread,
            "currentApplication",
            "()Landroid/app/Application;");

        if (current_application == nullptr)
        {
            clearAndroidJniException(env);
            env->DeleteLocalRef(activity_thread);
            return nullptr;
        }

        jobject application = env->CallStaticObjectMethod(activity_thread, current_application);
        env->DeleteLocalRef(activity_thread);

        if (env->ExceptionCheck())
        {
            env->ExceptionClear();
            if (application != nullptr)
                env->DeleteLocalRef(application);
            return nullptr;
        }

        return application;
    }

    jclass getRunnerJniClass(JNIEnv* env)
    {
        jclass runner_jni = env->FindClass("com/yoyogames/runner/RunnerJNILib");
        if (runner_jni != nullptr)
            return runner_jni;

        clearAndroidJniException(env);

        jobject application = getCurrentAndroidApplication(env);
        if (application == nullptr)
            return nullptr;

        runner_jni = loadAndroidClass(env, application, "com.yoyogames.runner.RunnerJNILib");
        env->DeleteLocalRef(application);
        return runner_jni;
    }

    jobject getGameMakerAndroidContext(JNIEnv* env, jclass runner_jni)
    {
        // Preferred public GameMaker accessor.
        jmethodID get_application_context = env->GetStaticMethodID(
            runner_jni,
            "GetApplicationContext",
            "()Landroid/content/Context;");

        if (get_application_context != nullptr)
        {
            jobject context = env->CallStaticObjectMethod(runner_jni, get_application_context);
            if (!env->ExceptionCheck() && context != nullptr)
                return context;

            clearAndroidJniException(env);
            if (context != nullptr)
                env->DeleteLocalRef(context);
        }
        else
        {
            clearAndroidJniException(env);
        }

        // Older/different runner layouts expose the context as ms_context.
        return getStaticObjectFieldReflective(env, runner_jni, "ms_context");
    }

    jobject getGameMakerAndroidActivity(JNIEnv* env, std::string& error_message)
    {
        jclass runner_jni = getRunnerJniClass(env);
        if (runner_jni == nullptr)
        {
            error_message = "GameMaker RunnerJNILib class was not found";
            return nullptr;
        }

        jobject context = getGameMakerAndroidContext(env, runner_jni);
        env->DeleteLocalRef(runner_jni);

        if (context == nullptr)
        {
            error_message = "GameMaker Android Context is unavailable";
            return nullptr;
        }

        // Some runner versions keep the Activity itself in ms_context.
        if (isAndroidActivity(env, context))
            return context;

        // Current GameMaker Android projects place RunnerActivity in the game
        // package and expose the live instance through CurrentActivity.
        const std::string package_name = getAndroidPackageName(env, context);
        if (package_name.empty())
        {
            env->DeleteLocalRef(context);
            error_message = "GameMaker Android package name is unavailable";
            return nullptr;
        }

        jclass runner_activity = loadAndroidClass(
            env,
            context,
            package_name + ".RunnerActivity");

        env->DeleteLocalRef(context);

        if (runner_activity == nullptr)
        {
            error_message = "GameMaker RunnerActivity class was not found";
            return nullptr;
        }

        jobject activity = getStaticObjectFieldReflective(
            env,
            runner_activity,
            "CurrentActivity");

        env->DeleteLocalRef(runner_activity);

        if (activity == nullptr || !isAndroidActivity(env, activity))
        {
            if (activity != nullptr)
                env->DeleteLocalRef(activity);
            error_message = "GameMaker RunnerActivity.CurrentActivity is unavailable";
            return nullptr;
        }

        return activity;
    }

    firebase::App* createAndroidFirebaseApp(
        const firebase::AppOptions* options,
        const char* name,
        std::string& error_message)
    {
        error_message.clear();

        JNIEnv* env = getAndroidJniEnv(error_message);
        if (env == nullptr)
            return nullptr;

        jobject activity = getGameMakerAndroidActivity(env, error_message);
        if (activity == nullptr)
            return nullptr;

        firebase::App* app = nullptr;
        const bool has_name = name != nullptr && name[0] != '\0';

        if (options != nullptr)
        {
            app = has_name
                ? firebase::App::Create(*options, name, env, activity)
                : firebase::App::Create(*options, env, activity);
        }
        else
        {
            app = firebase::App::Create(env, activity);
        }

        env->DeleteLocalRef(activity);

        if (env->ExceptionCheck())
        {
            env->ExceptionClear();
            if (app == nullptr)
                error_message = "firebase::App::Create raised a Java exception on Android";
        }

        if (app == nullptr && error_message.empty())
            error_message = "firebase::App::Create returned null on Android";

        return app;
    }
}

// ExtGen already generates its own JNI_OnLoad. On Android, CMake renames that
// generated symbol to GMFirebase_ExtGen_JNI_OnLoad. This wrapper becomes the
// actual loader entry point, captures the VM for Firebase App creation, and
// then forwards to ExtGen so its own JNI state is initialized exactly as before.
extern "C" jint JNI_OnLoad(JavaVM* vm, void* reserved)
{
    if (vm == nullptr)
        return JNI_ERR;

    g_firebase_java_vm = vm;

    const jint result = GMFirebase_ExtGen_JNI_OnLoad(vm, reserved);
    if (result == JNI_ERR)
        g_firebase_java_vm = nullptr;

    return result;
}
#endif


// ============================================================
// App core
// ============================================================

// Creates (or reuses) the single shared firebase::App instance every other
// product module attaches to via getFirebaseApp(). Must be called once,
// before any other GMFirebase_* module function, on every platform.
double firebase_app_initialize()
{
#if defined(__ANDROID__)
    if (g_firebase_app != nullptr)
        return 1.0;

    // Reuse an already-created default C++ App if one exists.
    if (firebase::App* existing = firebase::App::GetInstance())
    {
        g_firebase_app = existing;
        return 1.0;
    }

    std::string android_error;
    g_firebase_app = createAndroidFirebaseApp(nullptr, nullptr, android_error);

    if (g_firebase_app == nullptr)
    {
        setFirebaseLastError(
            -1,
            "firebase_app_initialize: " +
                (android_error.empty()
                    ? std::string("failed to create Android firebase::App")
                    : android_error));
        return 0.0;
    }

    return 1.0;
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
    auto options = gmValueToAppOptions(options_value);
    std::string n(name);

#if defined(__ANDROID__)
    std::string android_error;
    firebase::App* app = createAndroidFirebaseApp(
        &options,
        n.empty() ? nullptr : n.c_str(),
        android_error);

    if (!app)
    {
        setFirebaseLastError(
            -1,
            "firebase_app_initialize_with_options: " +
                (android_error.empty()
                    ? std::string("Firebase App::Create returned null")
                    : android_error));
        return 0;
    }
#else
    firebase::App* app = n.empty() ? firebase::App::Create(options) : firebase::App::Create(options, n.c_str());
    if (!app) { setFirebaseLastError(-1, "firebase_app_initialize_with_options: Firebase App::Create returned null"); return 0; }
#endif

    if (n.empty() || n == firebase::kDefaultAppName) g_firebase_app = app;
    return wrapFirebaseApp(app);
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

    std::string n(name);

#if defined(__ANDROID__)
    std::string android_error;
    firebase::App* app = createAndroidFirebaseApp(
        &options,
        n.empty() ? nullptr : n.c_str(),
        android_error);

    if (!app)
    {
        setFirebaseLastError(
            -1,
            "firebase_app_initialize_from_json: " +
                (android_error.empty()
                    ? std::string("Firebase App::Create returned null")
                    : android_error));
        return 0;
    }
#else
    firebase::App* app = n.empty() ? firebase::App::Create(options) : firebase::App::Create(options, n.c_str());
    if (!app) { setFirebaseLastError(-1, "firebase_app_initialize_from_json: Firebase App::Create returned null"); return 0; }
#endif

    if (n.empty() || n == firebase::kDefaultAppName) g_firebase_app = app;
    return wrapFirebaseApp(app);
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