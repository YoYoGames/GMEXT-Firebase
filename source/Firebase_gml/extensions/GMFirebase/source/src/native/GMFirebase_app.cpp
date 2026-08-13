#include "GMFirebase_common.h"

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
	// stubbed: Android callers get a clean, reported failure instead of a
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
