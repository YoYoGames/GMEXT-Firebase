#include "GMFirebase_common.h"
#include "GMFirebase_core_client.h"

#include <mutex>
#include <string>

namespace
{
    std::mutex g_fallback_error_mutex;
    int g_fallback_error_code = 0;
    std::string g_fallback_error_message;

    void setFallbackError(int code, const std::string& message)
    {
        std::lock_guard<std::mutex> lock(g_fallback_error_mutex);
        g_fallback_error_code = code;
        g_fallback_error_message = message;
    }

    const GMFirebaseCoreAPI* coreOrRecordError()
    {
        const GMFirebaseCoreAPI* api = gmfirebaseGetCoreAPI();
        if (api == nullptr)
            setFallbackError(-1, "GMFirebaseCore is required but its native Core ABI could not be loaded");
        return api;
    }
}

firebase::App* getFirebaseApp()
{
    const GMFirebaseCoreAPI* api = coreOrRecordError();
    return api != nullptr
        ? static_cast<firebase::App*>(api->get_default_app())
        : nullptr;
}

uint64_t wrapFirebaseApp(firebase::App* app)
{
    const GMFirebaseCoreAPI* api = coreOrRecordError();
    return api != nullptr
        ? api->wrap_app(static_cast<void*>(app))
        : 0;
}

firebase::App* resolveFirebaseApp(uint64_t ref)
{
    const GMFirebaseCoreAPI* api = coreOrRecordError();
    return api != nullptr
        ? static_cast<firebase::App*>(api->resolve_app(ref))
        : nullptr;
}

void setFirebaseLastError(int code, const std::string& message)
{
    const GMFirebaseCoreAPI* api = gmfirebaseGetCoreAPI();
    if (api != nullptr)
        api->set_last_error(code, message.c_str());
    else
        setFallbackError(code, message);
}

double firebase_last_error_code()
{
    const GMFirebaseCoreAPI* api = gmfirebaseGetCoreAPI();
    if (api != nullptr)
        return static_cast<double>(api->get_last_error_code());

    std::lock_guard<std::mutex> lock(g_fallback_error_mutex);
    return static_cast<double>(g_fallback_error_code);
}

std::string firebase_last_error_message()
{
    const GMFirebaseCoreAPI* api = gmfirebaseGetCoreAPI();
    if (api != nullptr)
    {
        const char* message = api->get_last_error_message();
        return message != nullptr ? std::string(message) : std::string();
    }

    std::lock_guard<std::mutex> lock(g_fallback_error_mutex);
    return g_fallback_error_message;
}

uint64_t packFirebaseRef(uint32_t index, uint8_t type)
{
    const uint64_t ext_id = GM_FIREBASE_EXT;
    return (ext_id << 40) | (static_cast<uint64_t>(type) << 32) | index;
}

uint64_t registerFirebasePointer(void* pointer, uint8_t type_code)
{
    const GMFirebaseCoreAPI* api = coreOrRecordError();
    return api != nullptr ? api->register_pointer(pointer, type_code) : 0;
}

void* resolveFirebasePointer(uint64_t ref, uint8_t expected_type)
{
    const GMFirebaseCoreAPI* api = coreOrRecordError();
    return api != nullptr ? api->resolve_pointer(ref, expected_type) : nullptr;
}

void* unregisterFirebasePointer(uint64_t ref, uint8_t expected_type)
{
    const GMFirebaseCoreAPI* api = coreOrRecordError();
    return api != nullptr ? api->unregister_pointer(ref, expected_type) : nullptr;
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
