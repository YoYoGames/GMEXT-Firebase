#include "GMFirebase_functions.h"

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

std::map<uint32_t, firebase::functions::HttpsCallableReference> g_firebase_functions_callable_map;
uint32_t g_firebase_functions_callable_index = 0;

uint64_t registerFunctionsCallable(const firebase::functions::HttpsCallableReference& ref)
{
	return packFirebaseRef(registerFirebaseValue(ref, g_firebase_functions_callable_index, g_firebase_functions_callable_map), GM_FB_TYPE_FUNCTIONS_CALLABLE);
}

namespace
{
	firebase::functions::Functions* resolveFunctions(uint64_t firebase_functions_ref)
	{
		firebase::functions::Functions* out = nullptr;
		validate_fb_ref_ptr(firebase_functions_ref, GM_FB_TYPE_FUNCTIONS, firebase::functions::Functions, out);
		return out;
	}

	firebase::functions::HttpsCallableReference* resolveCallable(uint64_t ref)
	{
		firebase::functions::HttpsCallableReference* out = nullptr;
		validate_fb_ref_map(ref, GM_FB_TYPE_FUNCTIONS_CALLABLE, firebase::functions::HttpsCallableReference, g_firebase_functions_callable_map, out);
		return out;
	}

	// callback(error_code, error_message, result). The result is the call's
	// arbitrarily-shaped firebase::Variant, written through
	// writeVariantToStream so it reaches GML as whatever it is (a real,
	// string, array or struct), or undefined on failure.
	void invokeCallableCallback(const std::optional<GMFunction>& callback,
		const firebase::Future<firebase::functions::HttpsCallableResult>& f)
	{
		if (!callback.has_value()) return;

		DataStream result;
		if (f.error() == 0 && f.result() != nullptr)
			writeVariantToStream(f.result()->data(), result);
		else
			result << std::optional<std::uint8_t>{};

		callback->call(static_cast<double>(f.error()), futureErrorMessage(f), result);
	}
}

// ============================================================
// Functions instance
// ============================================================

uint64_t firebase_functions_get_instance()
{
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_functions: no firebase::App - call firebase_app_initialize() first");
		return 0;
	}

	firebase::functions::Functions* functions = firebase::functions::Functions::GetInstance(app);
	if (functions == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_functions: Functions::GetInstance() returned null");
		return 0;
	}

	return registerFirebasePointer(functions, GM_FB_TYPE_FUNCTIONS);
}

uint64_t firebase_functions_get_instance_with_region(std::string_view region)
{
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_functions: no firebase::App - call firebase_app_initialize() first");
		return 0;
	}

	firebase::functions::Functions* functions = firebase::functions::Functions::GetInstance(app, std::string(region).c_str());
	if (functions == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_functions: Functions::GetInstance(region) returned null");
		return 0;
	}

	return registerFirebasePointer(functions, GM_FB_TYPE_FUNCTIONS);
}

void firebase_functions_use_functions_emulator(uint64_t firebase_functions_ref, std::string_view origin)
{
	firebase::functions::Functions* functions = resolveFunctions(firebase_functions_ref);
	if (functions == nullptr) return;
	functions->UseFunctionsEmulator(std::string(origin).c_str());
}

uint64_t firebase_functions_get_https_callable(uint64_t firebase_functions_ref, std::string_view name)
{
	firebase::functions::Functions* functions = resolveFunctions(firebase_functions_ref);
	if (functions == nullptr) return 0;
	return registerFunctionsCallable(functions->GetHttpsCallable(std::string(name).c_str()));
}

uint64_t firebase_functions_get_https_callable_with_options(uint64_t firebase_functions_ref, std::string_view name, double limited_use_app_check_token)
{
	firebase::functions::Functions* functions = resolveFunctions(firebase_functions_ref);
	if (functions == nullptr) return 0;

	firebase::functions::HttpsCallableOptions options;
	options.limited_use_app_check_token = (limited_use_app_check_token >= 0.5);
	return registerFunctionsCallable(functions->GetHttpsCallable(std::string(name).c_str(), options));
}

uint64_t firebase_functions_get_https_callable_from_url(uint64_t firebase_functions_ref, std::string_view url)
{
	firebase::functions::Functions* functions = resolveFunctions(firebase_functions_ref);
	if (functions == nullptr) return 0;
	return registerFunctionsCallable(functions->GetHttpsCallableFromURL(std::string(url).c_str()));
}

uint64_t firebase_functions_get_https_callable_from_url_with_options(uint64_t firebase_functions_ref, std::string_view url, double limited_use_app_check_token)
{
	firebase::functions::Functions* functions = resolveFunctions(firebase_functions_ref);
	if (functions == nullptr) return 0;

	firebase::functions::HttpsCallableOptions options;
	options.limited_use_app_check_token = (limited_use_app_check_token >= 0.5);
	return registerFunctionsCallable(functions->GetHttpsCallableFromURL(std::string(url).c_str(), options));
}

// ============================================================
// HttpsCallableReference
// ============================================================

double firebase_functions_callable_is_valid(uint64_t ref)
{
	firebase::functions::HttpsCallableReference* self = resolveCallable(ref);
	if (self == nullptr) return 0.0;
	return self->is_valid() ? 1.0 : 0.0;
}

void firebase_functions_callable_release(uint64_t ref)
{
	if (resolveCallable(ref) == nullptr) return;
	unregisterFirebaseValue(gm_fb_ref_id(ref), g_firebase_functions_callable_map);
}

// callback(error_code: real, error_message: string, data: gmval)
FirebaseError firebase_functions_callable_call(uint64_t ref, const std::optional<GMFunction>& callback)
{
	firebase::functions::HttpsCallableReference* self = resolveCallable(ref);
	if (self == nullptr) return FirebaseError::InvalidHandle;

	firebase::Future<firebase::functions::HttpsCallableResult> future = self->Call();
	if (!firebaseFutureArmed(future, "firebase_functions_callable_call")) return FirebaseError::InvalidHandle;
	future.OnCompletion([callback](const firebase::Future<firebase::functions::HttpsCallableResult>& f)
	{
		invokeCallableCallback(callback, f);
	});
	return FirebaseError::Ok;
}

// data: arbitrary GML value (real/string/bool/array/struct), reconstructed
// into a firebase::Variant via gmValueToVariant before being sent.
// callback(error_code: real, error_message: string, data: gmval)
FirebaseError firebase_functions_callable_call_with_data(uint64_t ref, const GMValue& data, const std::optional<GMFunction>& callback)
{
	firebase::functions::HttpsCallableReference* self = resolveCallable(ref);
	if (self == nullptr) return FirebaseError::InvalidHandle;

	firebase::Variant variant = gmValueToVariant(data);
	firebase::Future<firebase::functions::HttpsCallableResult> future = self->Call(variant);
	if (!firebaseFutureArmed(future, "firebase_functions_callable_call_with_data")) return FirebaseError::InvalidHandle;
	future.OnCompletion([callback](const firebase::Future<firebase::functions::HttpsCallableResult>& f)
	{
		invokeCallableCallback(callback, f);
	});
	return FirebaseError::Ok;
}

uint64_t firebase_functions_get_app(uint64_t functions_ref)
{
    auto* functions = resolveFunctions(functions_ref); return functions ? wrapFirebaseApp(functions->app()) : 0;
}

uint64_t firebase_functions_callable_get_functions(uint64_t callable_ref)
{
    auto* callable = resolveCallable(callable_ref);
    auto* functions = callable ? callable->functions() : nullptr;
    return functions ? registerFirebasePointer(functions, GM_FB_TYPE_FUNCTIONS) : 0;
}

uint64_t firebase_functions_get_instance_for_app(uint64_t app_ref)
{
    auto* app = resolveFirebaseApp(app_ref); if (!app) return 0;
    auto* functions = firebase::functions::Functions::GetInstance(app);
    return functions ? registerFirebasePointer(functions, GM_FB_TYPE_FUNCTIONS) : 0;
}

uint64_t firebase_functions_get_instance_for_app_region(uint64_t app_ref, std::string_view region)
{
    auto* app = resolveFirebaseApp(app_ref); if (!app) return 0; std::string r(region);
    auto* functions = firebase::functions::Functions::GetInstance(app, r.c_str());
    return functions ? registerFirebasePointer(functions, GM_FB_TYPE_FUNCTIONS) : 0;
}
