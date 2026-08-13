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
