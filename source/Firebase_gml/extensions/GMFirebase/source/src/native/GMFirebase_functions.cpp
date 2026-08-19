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

	void reportFutureError(int error, const char* error_message)
	{
		if (error != 0)
			setFirebaseLastError(error, error_message ? error_message : "");
	}

	// Builds the callback's complete argument list as a single ArrayStream:
	// leading (error_code, error_message) scalars followed by the call
	// result's arbitrarily-shaped firebase::Variant data, appended as
	// whatever top-level element shape it actually is (scalar/array/struct)
	// via pushVariantToArray. GMFunction::call_with_args() then treats each
	// top-level element of this stream as one callback argument.
	void invokeCallableCallback(const std::optional<GMFunction>& callback,
		const firebase::Future<firebase::functions::HttpsCallableResult>& f)
	{
		if (!callback.has_value()) return;

		ArrayStream args;
		args.push(static_cast<double>(f.error()));
		args.push(std::string_view{ f.error_message() ? f.error_message() : "" });
		if (f.error() == 0 && f.result() != nullptr)
			pushVariantToArray(f.result()->data(), args);
		else
			args << std::optional<std::uint8_t>{};

		callback->call_with_args(args);
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
		setFirebaseLastError(-1, "firebase_functions: no firebase::App - call firebase_app_initialize() first");
		return 0;
	}

	firebase::functions::Functions* functions = firebase::functions::Functions::GetInstance(app);
	if (functions == nullptr)
	{
		setFirebaseLastError(-1, "firebase_functions: Functions::GetInstance() returned null");
		return 0;
	}

	return registerFirebasePointer(functions, GM_FB_TYPE_FUNCTIONS);
}

uint64_t firebase_functions_get_instance_with_region(std::string_view region)
{
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(-1, "firebase_functions: no firebase::App - call firebase_app_initialize() first");
		return 0;
	}

	firebase::functions::Functions* functions = firebase::functions::Functions::GetInstance(app, std::string(region).c_str());
	if (functions == nullptr)
	{
		setFirebaseLastError(-1, "firebase_functions: Functions::GetInstance(region) returned null");
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

// callback(error_code: real, error_message: string, data: gmval)
double firebase_functions_callable_call(uint64_t ref, const std::optional<GMFunction>& callback)
{
	firebase::functions::HttpsCallableReference* self = resolveCallable(ref);
	if (self == nullptr) return 0.0;

	self->Call().OnCompletion([callback](const firebase::Future<firebase::functions::HttpsCallableResult>& f)
	{
		reportFutureError(f.error(), f.error_message());
		invokeCallableCallback(callback, f);
	});
	return 1.0;
}

// data: arbitrary GML value (real/string/bool/array/struct), reconstructed
// into a firebase::Variant via gmValueToVariant before being sent.
// callback(error_code: real, error_message: string, data: gmval)
double firebase_functions_callable_call_with_data(uint64_t ref, const GMValue& data, const std::optional<GMFunction>& callback)
{
	firebase::functions::HttpsCallableReference* self = resolveCallable(ref);
	if (self == nullptr) return 0.0;

	firebase::Variant variant = gmValueToVariant(data);
	self->Call(variant).OnCompletion([callback](const firebase::Future<firebase::functions::HttpsCallableResult>& f)
	{
		reportFutureError(f.error(), f.error_message());
		invokeCallableCallback(callback, f);
	});
	return 1.0;
}
