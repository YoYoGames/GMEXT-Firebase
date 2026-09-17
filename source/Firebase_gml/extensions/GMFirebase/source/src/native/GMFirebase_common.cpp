#include "GMFirebase_common.h"
#include <fstream>

#if FIREBASE_PLATFORM_WINDOWS
#include <windows.h>
#elif FIREBASE_PLATFORM_OSX
#include <climits>
#include <CoreFoundation/CoreFoundation.h>
#elif FIREBASE_PLATFORM_LINUX
#include <climits>
#include <unistd.h>
#endif

// ============================================================
// App bootstrap
// ============================================================

firebase::App* g_firebase_app = nullptr;

#if FIREBASE_PLATFORM_DESKTOP
namespace
{
	// Where the staged google-services(-desktop).json lives. post_build_step
	// stages a copy beside the built executable on every desktop platform. On
	// macOS specifically, GameMaker's own generated Xcode project *also*
	// stages google-services.json as an Included File via a "Copy Files"
	// build phase with dstSubfolderSpec=7 (Resources) -- i.e. into
	// <App>.app/Contents/Resources/, not Contents/MacOS/ where the executable
	// itself lives (confirmed by inspecting the generated
	// Firebase.xcodeproj/project.pbxproj). So on macOS the executable's own
	// directory is the wrong place to look; the bundle's Resources directory
	// (via CFBundleCopyResourcesDirectoryURL) is the location that is
	// actually guaranteed to contain the file. UTF-8, with a trailing
	// separator; empty when it cannot be determined.
	std::string getConfigSearchDir()
	{
		TRACE("[GMFirebase] getConfigSearchDir() FIREBASE_PLATFORM_OSX=%d FIREBASE_PLATFORM_WINDOWS=%d FIREBASE_PLATFORM_LINUX=%d\n",
			(int)FIREBASE_PLATFORM_OSX, (int)FIREBASE_PLATFORM_WINDOWS, (int)FIREBASE_PLATFORM_LINUX);

#if FIREBASE_PLATFORM_WINDOWS
		// The wide API: the A variant returns the ANSI code page, which is not
		// UTF-8 and fails on any user directory with a non-ASCII character.
		wchar_t path[MAX_PATH];
		DWORD len = GetModuleFileNameW(nullptr, path, MAX_PATH);
		TRACE("[GMFirebase] getConfigSearchDir() GetModuleFileNameW len=%lu\n", (unsigned long)len);
		if (len == 0 || len == MAX_PATH) return std::string();
		std::wstring full(path, len);
		size_t slash = full.find_last_of(L"/\\");
		if (slash == std::wstring::npos) return std::string();
		std::wstring wide_dir = full.substr(0, slash + 1);
		int needed = WideCharToMultiByte(CP_UTF8, 0, wide_dir.c_str(), static_cast<int>(wide_dir.size()), nullptr, 0, nullptr, nullptr);
		if (needed <= 0) return std::string();
		std::string dir(static_cast<size_t>(needed), '\0');
		WideCharToMultiByte(CP_UTF8, 0, wide_dir.c_str(), static_cast<int>(wide_dir.size()), &dir[0], needed, nullptr, nullptr);
#elif FIREBASE_PLATFORM_OSX
		CFBundleRef bundle = CFBundleGetMainBundle();
		if (!bundle)
		{
			TRACE("[GMFirebase] getConfigSearchDir() CFBundleGetMainBundle() returned null\n");
			return std::string();
		}
		CFURLRef resourcesUrl = CFBundleCopyResourcesDirectoryURL(bundle);
		if (!resourcesUrl)
		{
			TRACE("[GMFirebase] getConfigSearchDir() CFBundleCopyResourcesDirectoryURL() returned null\n");
			return std::string();
		}
		char path[PATH_MAX];
		Boolean ok = CFURLGetFileSystemRepresentation(resourcesUrl, TRUE, reinterpret_cast<UInt8*>(path), sizeof(path));
		CFRelease(resourcesUrl);
		if (!ok)
		{
			TRACE("[GMFirebase] getConfigSearchDir() CFURLGetFileSystemRepresentation() failed\n");
			return std::string();
		}
		TRACE("[GMFirebase] getConfigSearchDir() resources dir=%s\n", path);
		std::string dir(path);
		if (!dir.empty() && dir.back() != '/') dir += '/';
#elif FIREBASE_PLATFORM_LINUX
		char path[PATH_MAX];
		ssize_t len = readlink("/proc/self/exe", path, sizeof(path) - 1);
		TRACE("[GMFirebase] getConfigSearchDir() readlink len=%zd\n", len);
		if (len <= 0) return std::string();
		std::string full(path, static_cast<size_t>(len));
		size_t slash = full.find_last_of("/\\");
		if (slash == std::string::npos) return std::string();
		std::string dir = full.substr(0, slash + 1);
#else
		TRACE("[GMFirebase] getConfigSearchDir() no platform branch compiled in\n");
		return std::string();
#endif
		TRACE("[GMFirebase] getConfigSearchDir() dir=%s\n", dir.c_str());
		return dir;
	}

	// Reads one staged config file. Capped at 512 KB, the SDK's own limit for
	// the same file.
	bool readConfigFile(const std::string& path, std::string& out)
	{
#if FIREBASE_PLATFORM_WINDOWS
		int needed = MultiByteToWideChar(CP_UTF8, 0, path.c_str(), static_cast<int>(path.size()), nullptr, 0);
		if (needed <= 0) return false;
		std::wstring wide_path(static_cast<size_t>(needed), L'\0');
		MultiByteToWideChar(CP_UTF8, 0, path.c_str(), static_cast<int>(path.size()), &wide_path[0], needed);
		std::ifstream file(wide_path.c_str(), std::ios::binary);
#else
		std::ifstream file(path.c_str(), std::ios::binary);
#endif
		if (!file) return false;
		file.seekg(0, std::ios::end);
		const std::streamoff length = file.tellg();
		if (length < 0 || length > 512 * 1024) return false;
		file.seekg(0, std::ios::beg);
		out.assign(static_cast<size_t>(length), '\0');
		return length == 0 || static_cast<bool>(file.read(&out[0], length));
	}

	// App::Create() with no arguments only looks for the config in the
	// process's current working directory. The public way to point it at the
	// staged file is to read that file and hand the SDK its contents; the
	// filenames and their order are the SDK's own (app_desktop.cc).
	firebase::App* createDesktopApp()
	{
		std::string dir = getConfigSearchDir();
		if (dir.empty())
		{
			TRACE("[GMFirebase] getFirebaseApp() config directory unknown, using the SDK's working-directory search\n");
			return firebase::App::Create();
		}

		static const char* const kConfigNames[] = { "google-services-desktop.json", "google-services.json" };
		for (const char* name : kConfigNames)
		{
			const std::string path = dir + name;
			std::string contents;
			if (!readConfigFile(path, contents))
				continue;

			firebase::AppOptions options;
			if (firebase::AppOptions::LoadFromJsonConfig(contents.c_str(), &options) == nullptr)
			{
				TRACE("[GMFirebase] %s is not a valid Firebase config\n", path.c_str());
				continue;
			}

			TRACE("[GMFirebase] getFirebaseApp() loaded %s\n", path.c_str());
			return firebase::App::Create(options);
		}

		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_app_initialize: no google-services-desktop.json or google-services.json in " + dir);
		return nullptr;
	}
}
#endif // FIREBASE_PLATFORM_DESKTOP

firebase::App* getFirebaseApp()
{
	TRACE("[GMFirebase] getFirebaseApp() called\n");

	if (g_firebase_app != nullptr)
	{
		TRACE("[GMFirebase] getFirebaseApp() returning existing app\n");
		return g_firebase_app;
	}

#if defined(__ANDROID__)
	// Android requires the JNI env + activity; GMFirebase_app.cpp's
	// firebase_app_initialize() is expected to have already set
	// g_firebase_app via App::Create(jni_env, activity) before any other
	// module calls getFirebaseApp(). We do not attempt a JNI-less fallback.
	TRACE("[GMFirebase] getFirebaseApp() Android path with no existing app -> nullptr\n");
	return nullptr;
#else
#if FIREBASE_PLATFORM_DESKTOP
	g_firebase_app = createDesktopApp();
#else
	// iOS: the SDK reads GoogleService-Info.plist from the bundle itself.
	TRACE( "[GMFirebase] getFirebaseApp() calling firebase::App::Create()\n");
	g_firebase_app = firebase::App::Create();
#endif
	TRACE( "[GMFirebase] firebase::App::Create() returned %p\n", (void*)g_firebase_app);
	return g_firebase_app;
#endif
}

uint64_t wrapFirebaseApp(firebase::App* app)
{
	return app ? registerFirebasePointer(app, GM_FB_TYPE_APP) : 0;
}

firebase::App* resolveFirebaseApp(uint64_t ref)
{
	return static_cast<firebase::App*>(resolveFirebasePointer(ref, GM_FB_TYPE_APP));
}

// ============================================================
// Last Error State
// ============================================================

static std::mutex g_firebase_last_error_mutex;
static FirebaseLastError g_firebase_last_error;

void setFirebaseLastError(int code, const std::string& message)
{
	std::lock_guard<std::mutex> lock(g_firebase_last_error_mutex);
	g_firebase_last_error.code = code;
	g_firebase_last_error.message = message;
}

double firebase_last_error_code()
{
	std::lock_guard<std::mutex> lock(g_firebase_last_error_mutex);
	return static_cast<double>(g_firebase_last_error.code);
}

std::string firebase_last_error_message()
{
	std::lock_guard<std::mutex> lock(g_firebase_last_error_mutex);
	return g_firebase_last_error.message;
}

std::string firebaseInitResultMessage(const char* what, firebase::InitResult result)
{
	std::string message(what);
	if (result == firebase::kInitResultFailedMissingDependency)
		message += ": missing dependency (Google Play services)";
	else
		message += ": InitResult " + std::to_string(static_cast<int>(result));
	return message;
}

// ============================================================
// Reference Layout
// ============================================================

uint64_t packFirebaseRef(uint32_t index, uint8_t type)
{
	uint64_t ext_id = GM_FIREBASE_EXT;
	uint64_t packed = (ext_id << 40) | ((uint64_t)type << 32) | index;
	return packed;
}

// ============================================================
// Pointer-backed handle registry
// ============================================================

namespace
{
	struct FirebasePointerEntry
	{
		uint8_t type = 0;
		void* pointer = nullptr;
	};

	std::mutex g_firebase_pointer_registry_mutex;
	std::map<uint32_t, FirebasePointerEntry> g_firebase_pointer_registry;
	std::map<std::pair<uint8_t, uintptr_t>, uint32_t> g_firebase_pointer_reverse;
	uint32_t g_firebase_pointer_registry_index = 0;
}

// Shared by every module's value-copy registry; see GMFirebase_common.h.
std::mutex g_firebase_value_registry_mutex;

uint64_t registerFirebasePointer(void* pointer, uint8_t type_code)
{
	if (pointer == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "cannot register null Firebase pointer");
		return 0;
	}

	std::lock_guard<std::mutex> lock(g_firebase_pointer_registry_mutex);
	const auto reverse_key = std::make_pair(type_code, reinterpret_cast<uintptr_t>(pointer));
	const auto existing = g_firebase_pointer_reverse.find(reverse_key);
	if (existing != g_firebase_pointer_reverse.end())
		return packFirebaseRef(existing->second, type_code);

	uint32_t id = ++g_firebase_pointer_registry_index;
	// 0 is reserved as the invalid/null handle. If uint32_t ever wraps during
	// one process lifetime, keep advancing until an unused non-zero id is found.
	while (id == 0 || g_firebase_pointer_registry.find(id) != g_firebase_pointer_registry.end())
		id = ++g_firebase_pointer_registry_index;

	g_firebase_pointer_registry.emplace(id, FirebasePointerEntry{ type_code, pointer });
	g_firebase_pointer_reverse.emplace(reverse_key, id);
	return packFirebaseRef(id, type_code);
}

void* resolveFirebasePointer(uint64_t ref, uint8_t expected_type)
{
	if (gm_fb_ref_ext(ref) != GM_FIREBASE_EXT || gm_fb_ref_type(ref) != expected_type)
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_HANDLE, "invalid handle");
		return nullptr;
	}

	std::lock_guard<std::mutex> lock(g_firebase_pointer_registry_mutex);
	const auto it = g_firebase_pointer_registry.find(gm_fb_ref_id(ref));
	if (it == g_firebase_pointer_registry.end() || it->second.type != expected_type || it->second.pointer == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_HANDLE, "invalid or stale handle");
		return nullptr;
	}

	return it->second.pointer;
}

void* unregisterFirebasePointer(uint64_t ref, uint8_t expected_type)
{
	if (gm_fb_ref_ext(ref) != GM_FIREBASE_EXT || gm_fb_ref_type(ref) != expected_type)
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_HANDLE, "invalid handle");
		return nullptr;
	}

	std::lock_guard<std::mutex> lock(g_firebase_pointer_registry_mutex);
	const uint32_t id = gm_fb_ref_id(ref);
	const auto it = g_firebase_pointer_registry.find(id);
	if (it == g_firebase_pointer_registry.end() || it->second.type != expected_type || it->second.pointer == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_HANDLE, "invalid or stale handle");
		return nullptr;
	}

	void* pointer = it->second.pointer;
	g_firebase_pointer_reverse.erase(std::make_pair(expected_type, reinterpret_cast<uintptr_t>(pointer)));
	g_firebase_pointer_registry.erase(it);
	return pointer;
}

// ============================================================
// firebase::Variant <-> gm::wire converters
// ============================================================

void pushVariantToArray(const firebase::Variant& v, gm::wire::ArrayStream& out)
{
	switch (v.type())
	{
	case firebase::Variant::kTypeInt64:
		// GML has no int64 - every Firebase numeric value crosses the wire as
		// a double, same convention as everywhere else in this extension.
		out.push(static_cast<double>(v.int64_value()));
		break;

	case firebase::Variant::kTypeDouble:
		out.push(v.double_value());
		break;

	case firebase::Variant::kTypeBool:
		out.push(v.bool_value());
		break;

	case firebase::Variant::kTypeStaticString:
	case firebase::Variant::kTypeMutableString:
		out.push(std::string_view{ v.string_value() });
		break;

	case firebase::Variant::kTypeStaticBlob:
	case firebase::Variant::kTypeMutableBlob:
		// No dedicated binary kind is threaded through here; expose blob
		// bytes as a raw string so callers can still recover them.
		out.push(std::string_view{ reinterpret_cast<const char*>(v.blob_data()), v.blob_size() });
		break;

	case firebase::Variant::kTypeVector:
	{
		gm::wire::ArrayStream nested;
		for (const auto& elem : v.vector())
			pushVariantToArray(elem, nested);
		out.push(nested);
		break;
	}

	case firebase::Variant::kTypeMap:
	{
		gm::wire::StructStream nested;
		for (const auto& kv : v.map())
			addVariantToStruct(kv.first.AsString().string_value(), kv.second, nested);
		out.push(nested);
		break;
	}

	case firebase::Variant::kTypeNull:
	default:
		// No push(undefined) overload exists on ArrayStream, but its
		// inherited operator<< resolves std::optional<T> to a GMKind::Undefined
		// write, which is exactly what we want for a null element.
		out << std::optional<std::uint8_t>{};
		break;
	}
}

void writeVariantToStream(const firebase::Variant& v, gm::wire::DataStream& out)
{
	switch (v.type())
	{
	case firebase::Variant::kTypeInt64:
		// GML has no int64 - every Firebase numeric value crosses the wire as
		// a double, same convention as everywhere else in this extension.
		out << static_cast<double>(v.int64_value());
		break;

	case firebase::Variant::kTypeDouble:
		out << v.double_value();
		break;

	case firebase::Variant::kTypeBool:
		out << v.bool_value();
		break;

	case firebase::Variant::kTypeStaticString:
	case firebase::Variant::kTypeMutableString:
		out << std::string_view{ v.string_value() };
		break;

	case firebase::Variant::kTypeStaticBlob:
	case firebase::Variant::kTypeMutableBlob:
		// No dedicated binary kind is threaded through here; expose blob
		// bytes as a raw string so callers can still recover them.
		out << std::string_view{ reinterpret_cast<const char*>(v.blob_data()), v.blob_size() };
		break;

	case firebase::Variant::kTypeVector:
	{
		gm::wire::ArrayStream nested;
		for (const auto& elem : v.vector())
			pushVariantToArray(elem, nested);
		out << nested;
		break;
	}

	case firebase::Variant::kTypeMap:
	{
		gm::wire::StructStream nested;
		for (const auto& kv : v.map())
			addVariantToStruct(kv.first.AsString().string_value(), kv.second, nested);
		out << nested;
		break;
	}

	case firebase::Variant::kTypeNull:
	default:
		out << std::optional<std::uint8_t>{};
		break;
	}
}

void addVariantToStruct(const char* key, const firebase::Variant& v, gm::wire::StructStream& out)
{
	switch (v.type())
	{
	case firebase::Variant::kTypeInt64:
		out.add(key, static_cast<double>(v.int64_value()));
		break;

	case firebase::Variant::kTypeDouble:
		out.add(key, v.double_value());
		break;

	case firebase::Variant::kTypeBool:
		out.add(key, v.bool_value());
		break;

	case firebase::Variant::kTypeStaticString:
	case firebase::Variant::kTypeMutableString:
		out.add(key, std::string_view{ v.string_value() });
		break;

	case firebase::Variant::kTypeStaticBlob:
	case firebase::Variant::kTypeMutableBlob:
		out.add(key, std::string_view{ reinterpret_cast<const char*>(v.blob_data()), v.blob_size() });
		break;

	case firebase::Variant::kTypeVector:
	{
		gm::wire::ArrayStream nested;
		for (const auto& elem : v.vector())
			pushVariantToArray(elem, nested);
		out.add(key, nested);
		break;
	}

	case firebase::Variant::kTypeMap:
	{
		gm::wire::StructStream nested;
		for (const auto& kv : v.map())
			addVariantToStruct(kv.first.AsString().string_value(), kv.second, nested);
		out.add(key, nested);
		break;
	}

	case firebase::Variant::kTypeNull:
	default:
		out.addKeyValue(key, std::optional<std::uint8_t>{});
		break;
	}
}

// Dispatches on the wire kind rather than is<T>(), which is an exact-kind
// test: GML marshals int32()/int64() values and every bitwise-op result as
// Int32/UInt64, not Double, and those used to fall through to null.
firebase::Variant gmValueToVariant(const gm::wire::GMValue& value)
{
	using gm::wire::GMArrayView;
	using gm::wire::GMKind;
	using gm::wire::GMObjectView;

	switch (value.kind())
	{
	case GMKind::Double:
		return firebase::Variant::FromDouble(value.as<double>());

	case GMKind::Int32:
		return firebase::Variant::FromInt64(value.as<std::int32_t>());

	case GMKind::UInt64:
		// A GML int64 travels as its two's-complement buffer_u64.
		return firebase::Variant::FromInt64(static_cast<std::int64_t>(value.as<std::uint64_t>()));

	case GMKind::Bool:
		return firebase::Variant::FromBool(value.as<bool>());

	case GMKind::String:
		return firebase::Variant::FromMutableString(std::string(value.as<std::string_view>()));

	case GMKind::Array:
	{
		std::vector<firebase::Variant> items;
		auto view = value.as<GMArrayView>();
		items.reserve(view.size());
		for (const auto& element : view)
			items.push_back(gmValueToVariant(element));
		return firebase::Variant(items);
	}

	case GMKind::Struct:
	{
		std::map<firebase::Variant, firebase::Variant> entries;
		auto view = value.as<GMObjectView>();
		for (const auto& pair : view)
			entries[firebase::Variant::FromMutableString(std::string(pair.first))] = gmValueToVariant(pair.second);
		return firebase::Variant(entries);
	}

	case GMKind::Undefined:
		// GML undefined is Firebase null.
		return firebase::Variant::Null();

	default:
		// Only a GML pointer can reach here; Firebase has no representation
		// for it, and a silent null is how a wrong payload goes unnoticed.
		LOG_WARNING("gmValueToVariant: GML value kind %u cannot be sent to Firebase - sent as null", static_cast<unsigned>(value.kind()));
		return firebase::Variant::Null();
	}
}
