#include "GMFirebase_common.h"

// ============================================================
// App bootstrap
// ============================================================

firebase::App* g_firebase_app = nullptr;

firebase::App* getFirebaseApp()
{
	if (g_firebase_app != nullptr)
		return g_firebase_app;

#if defined(__ANDROID__)
	// Android requires the JNI env + activity; GMFirebase_app.cpp's
	// firebase_app_initialize() is expected to have already set
	// g_firebase_app via App::Create(jni_env, activity) before any other
	// module calls getFirebaseApp(). We do not attempt a JNI-less fallback.
	return nullptr;
#else
	g_firebase_app = firebase::App::Create();
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

uint64_t registerFirebasePointer(void* pointer, uint8_t type_code)
{
	if (pointer == nullptr)
	{
		setFirebaseLastError(-1, "cannot register null Firebase pointer");
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
		setFirebaseLastError(-1, "invalid handle");
		return nullptr;
	}

	std::lock_guard<std::mutex> lock(g_firebase_pointer_registry_mutex);
	const auto it = g_firebase_pointer_registry.find(gm_fb_ref_id(ref));
	if (it == g_firebase_pointer_registry.end() || it->second.type != expected_type || it->second.pointer == nullptr)
	{
		setFirebaseLastError(-1, "invalid or stale handle");
		return nullptr;
	}

	return it->second.pointer;
}

void* unregisterFirebasePointer(uint64_t ref, uint8_t expected_type)
{
	if (gm_fb_ref_ext(ref) != GM_FIREBASE_EXT || gm_fb_ref_type(ref) != expected_type)
	{
		setFirebaseLastError(-1, "invalid handle");
		return nullptr;
	}

	std::lock_guard<std::mutex> lock(g_firebase_pointer_registry_mutex);
	const uint32_t id = gm_fb_ref_id(ref);
	const auto it = g_firebase_pointer_registry.find(id);
	if (it == g_firebase_pointer_registry.end() || it->second.type != expected_type || it->second.pointer == nullptr)
	{
		setFirebaseLastError(-1, "invalid or stale handle");
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

firebase::Variant gmValueToVariant(const gm::wire::GMValue& value)
{
	using gm::wire::GMArrayView;
	using gm::wire::GMObjectView;

	if (value.is<double>())
		return firebase::Variant::FromDouble(value.as<double>());

	if (value.is<bool>())
		return firebase::Variant::FromBool(value.as<bool>());

	if (value.is<std::string_view>())
	{
		auto sv = value.as<std::string_view>();
		return firebase::Variant::FromMutableString(std::string(sv));
	}

	if (value.is<GMArrayView>())
	{
		std::vector<firebase::Variant> items;
		auto view = value.as<GMArrayView>();
		items.reserve(view.size());
		for (const auto& element : view)
			items.push_back(gmValueToVariant(element));
		return firebase::Variant(items);
	}

	if (value.is<GMObjectView>())
	{
		std::map<firebase::Variant, firebase::Variant> entries;
		auto view = value.as<GMObjectView>();
		for (const auto& pair : view)
			entries[firebase::Variant::FromMutableString(std::string(pair.first))] = gmValueToVariant(pair.second);
		return firebase::Variant(entries);
	}

	return firebase::Variant::Null();
}
