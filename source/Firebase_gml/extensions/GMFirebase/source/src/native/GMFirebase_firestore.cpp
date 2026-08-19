// Cloud Firestore - Firestore instance/settings, CollectionReference,
// DocumentReference, Query (also serves CollectionReference, since it
// publicly inherits from Query), WriteBatch, the FieldValue<->gm::wire
// converter and FieldValue sentinel/explicit-typed-value constructors.
//
// DocumentSnapshot, QuerySnapshot and ListenerRegistration removal live in
// GMFirebase_firebase_firestore_snapshot.cpp (sharing this file's header); Transaction
// is a deliberate stub (see firebase_firestore_run_transaction below).
#include "GMFirebase_firestore.h"
#include <cmath>

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

// ============================================================
// Value-copy registries (declared extern in GMFirebase_firestore.h)
// ============================================================

std::map<uint32_t, firebase::firestore::DocumentReference> g_fs_doc_ref_map;
uint32_t g_fs_doc_ref_index = 0;

std::map<uint32_t, firebase::firestore::CollectionReference> g_fs_col_ref_map;
uint32_t g_fs_col_ref_index = 0;

std::map<uint32_t, firebase::firestore::Query> g_fs_query_map;
uint32_t g_fs_query_index = 0;

std::map<uint32_t, firebase::firestore::WriteBatch> g_fs_write_batch_map;
uint32_t g_fs_write_batch_index = 0;

std::map<uint32_t, firebase::firestore::FieldValue> g_fs_field_value_map;
uint32_t g_fs_field_value_index = 0;

// g_fs_doc_snapshot_map/g_fs_doc_snapshot_index and
// g_fs_query_snapshot_map/g_fs_query_snapshot_index are defined in
// GMFirebase_firebase_firestore_snapshot.cpp.

uint64_t registerFirestoreDocRef(const firebase::firestore::DocumentReference& ref)
{
	uint32_t id = registerFirebaseValue(ref, g_fs_doc_ref_index, g_fs_doc_ref_map);
	return packFirebaseRef(id, GM_FB_TYPE_FIRESTORE_DOC_REF);
}

uint64_t registerFirestoreColRef(const firebase::firestore::CollectionReference& ref)
{
	uint32_t id = registerFirebaseValue(ref, g_fs_col_ref_index, g_fs_col_ref_map);
	return packFirebaseRef(id, GM_FB_TYPE_FIRESTORE_COL_REF);
}

uint64_t registerFirestoreQuery(const firebase::firestore::Query& query)
{
	uint32_t id = registerFirebaseValue(query, g_fs_query_index, g_fs_query_map);
	return packFirebaseRef(id, GM_FB_TYPE_FIRESTORE_QUERY);
}

uint64_t registerFirestoreWriteBatch(const firebase::firestore::WriteBatch& batch)
{
	uint32_t id = registerFirebaseValue(batch, g_fs_write_batch_index, g_fs_write_batch_map);
	return packFirebaseRef(id, GM_FB_TYPE_FIRESTORE_WRITE_BATCH);
}

uint64_t registerFirestoreFieldValue(const firebase::firestore::FieldValue& value)
{
	uint32_t id = registerFirebaseValue(value, g_fs_field_value_index, g_fs_field_value_map);
	return packFirebaseRef(id, GM_FB_TYPE_FIRESTORE_FIELD_VALUE);
}

// CollectionReference publicly inherits from Query - slicing it down to a
// plain Query copy just copies its shared internal pimpl pointer, so a
// single set of firebase_firestore_query_*() functions can serve both ref types
// without duplicating every Where/OrderBy/Limit/Get function.
bool resolveFirestoreQuery(uint64_t ref, firebase::firestore::Query& out)
{
	if (gm_fb_ref_ext(ref) == GM_FIREBASE_EXT)
	{
		if (gm_fb_ref_type(ref) == GM_FB_TYPE_FIRESTORE_QUERY)
		{
			auto it = g_fs_query_map.find(gm_fb_ref_id(ref));
			if (it != g_fs_query_map.end())
			{
				out = it->second;
				return true;
			}
		}
		else if (gm_fb_ref_type(ref) == GM_FB_TYPE_FIRESTORE_COL_REF)
		{
			auto it = g_fs_col_ref_map.find(gm_fb_ref_id(ref));
			if (it != g_fs_col_ref_map.end())
			{
				out = it->second; // CollectionReference -> Query slice
				return true;
			}
		}
	}

	setFirebaseLastError(-1, "invalid handle");
	return false;
}

firebase::firestore::Firestore* resolveFirestore(uint64_t instance_ref)
{
	firebase::firestore::Firestore* fs = nullptr;
	validate_fb_ref_ptr(instance_ref, GM_FB_TYPE_FIRESTORE, firebase::firestore::Firestore, fs);
	return fs;
}

// ============================================================
// FieldValue <-> gm::wire converters
// ============================================================

void pushFieldValueToArray(const firebase::firestore::FieldValue& v, gm::wire::ArrayStream& out)
{
	switch (v.type())
	{
	case firebase::firestore::FieldValue::Type::kBoolean:
		out.push(v.boolean_value());
		break;

	case firebase::firestore::FieldValue::Type::kInteger:
		// GML has no int64 - crosses as a double, same convention used
		// everywhere else in this extension. Use
		// firebase_firestore_field_value_integer() on the way back in if the exact
		// stored type matters.
		out.push(static_cast<double>(v.integer_value()));
		break;

	case firebase::firestore::FieldValue::Type::kDouble:
		out.push(v.double_value());
		break;

	case firebase::firestore::FieldValue::Type::kString:
		out.push(std::string_view{ v.string_value() });
		break;

	case firebase::firestore::FieldValue::Type::kBlob:
		out.push(std::string_view{ reinterpret_cast<const char*>(v.blob_value()), v.blob_size() });
		break;

	case firebase::firestore::FieldValue::Type::kReference:
		// Encoded as a plain GM_FB_TYPE_FIRESTORE_DOC_REF ref (a real number),
		// consistent with every other reference-typed value in this extension.
		out.push(static_cast<double>(registerFirestoreDocRef(v.reference_value())));
		break;

	case firebase::firestore::FieldValue::Type::kGeoPoint:
	{
		firebase::firestore::GeoPoint gp = v.geo_point_value();
		gm::wire::StructStream nested;
		nested.add("type", std::string_view{ "geopoint" });
		nested.add("latitude", gp.latitude());
		nested.add("longitude", gp.longitude());
		out.push(nested);
		break;
	}

	case firebase::firestore::FieldValue::Type::kTimestamp:
	{
		firebase::Timestamp ts = v.timestamp_value();
		gm::wire::StructStream nested;
		nested.add("type", std::string_view{ "timestamp" });
		nested.add("seconds", static_cast<double>(ts.seconds()));
		nested.add("nanoseconds", static_cast<double>(ts.nanoseconds()));
		out.push(nested);
		break;
	}

	case firebase::firestore::FieldValue::Type::kArray:
	{
		gm::wire::ArrayStream nested;
		for (const auto& elem : v.array_value())
			pushFieldValueToArray(elem, nested);
		out.push(nested);
		break;
	}

	case firebase::firestore::FieldValue::Type::kMap:
	{
		gm::wire::StructStream nested;
		for (const auto& kv : v.map_value())
			addFieldValueToStruct(kv.first.c_str(), kv.second, nested);
		out.push(nested);
		break;
	}

	case firebase::firestore::FieldValue::Type::kNull:
	case firebase::firestore::FieldValue::Type::kDelete:
	case firebase::firestore::FieldValue::Type::kServerTimestamp:
	case firebase::firestore::FieldValue::Type::kArrayUnion:
	case firebase::firestore::FieldValue::Type::kArrayRemove:
	case firebase::firestore::FieldValue::Type::kIncrementInteger:
	case firebase::firestore::FieldValue::Type::kIncrementDouble:
	default:
		// The sentinel kinds are write-only - the server always resolves
		// them to a concrete value before a document is ever read back, so
		// this default only defends against an invalid/default-constructed
		// FieldValue. No push(undefined) overload exists on ArrayStream, but
		// its inherited operator<< resolves std::optional<T> to a
		// GMKind::Undefined write, exactly like the Variant converters.
		out << std::optional<std::uint8_t>{};
		break;
	}
}

void addFieldValueToStruct(const char* key, const firebase::firestore::FieldValue& v, gm::wire::StructStream& out)
{
	switch (v.type())
	{
	case firebase::firestore::FieldValue::Type::kBoolean:
		out.add(key, v.boolean_value());
		break;

	case firebase::firestore::FieldValue::Type::kInteger:
		out.add(key, static_cast<double>(v.integer_value()));
		break;

	case firebase::firestore::FieldValue::Type::kDouble:
		out.add(key, v.double_value());
		break;

	case firebase::firestore::FieldValue::Type::kString:
		out.add(key, std::string_view{ v.string_value() });
		break;

	case firebase::firestore::FieldValue::Type::kBlob:
		out.add(key, std::string_view{ reinterpret_cast<const char*>(v.blob_value()), v.blob_size() });
		break;

	case firebase::firestore::FieldValue::Type::kReference:
		out.add(key, static_cast<double>(registerFirestoreDocRef(v.reference_value())));
		break;

	case firebase::firestore::FieldValue::Type::kGeoPoint:
	{
		firebase::firestore::GeoPoint gp = v.geo_point_value();
		gm::wire::StructStream nested;
		nested.add("type", std::string_view{ "geopoint" });
		nested.add("latitude", gp.latitude());
		nested.add("longitude", gp.longitude());
		out.add(key, nested);
		break;
	}

	case firebase::firestore::FieldValue::Type::kTimestamp:
	{
		firebase::Timestamp ts = v.timestamp_value();
		gm::wire::StructStream nested;
		nested.add("type", std::string_view{ "timestamp" });
		nested.add("seconds", static_cast<double>(ts.seconds()));
		nested.add("nanoseconds", static_cast<double>(ts.nanoseconds()));
		out.add(key, nested);
		break;
	}

	case firebase::firestore::FieldValue::Type::kArray:
	{
		gm::wire::ArrayStream nested;
		for (const auto& elem : v.array_value())
			pushFieldValueToArray(elem, nested);
		out.add(key, nested);
		break;
	}

	case firebase::firestore::FieldValue::Type::kMap:
	{
		gm::wire::StructStream nested;
		for (const auto& kv : v.map_value())
			addFieldValueToStruct(kv.first.c_str(), kv.second, nested);
		out.add(key, nested);
		break;
	}

	case firebase::firestore::FieldValue::Type::kNull:
	case firebase::firestore::FieldValue::Type::kDelete:
	case firebase::firestore::FieldValue::Type::kServerTimestamp:
	case firebase::firestore::FieldValue::Type::kArrayUnion:
	case firebase::firestore::FieldValue::Type::kArrayRemove:
	case firebase::firestore::FieldValue::Type::kIncrementInteger:
	case firebase::firestore::FieldValue::Type::kIncrementDouble:
	default:
		out.addKeyValue(key, std::optional<std::uint8_t>{});
		break;
	}
}

namespace
{
	// Reinterprets a plain inbound double as one of this extension's packed
	// refs (see GMFirebase_common.h's ext/type bit layout) if - and only if -
	// its value exactly matches the reserved bit pattern. Real user data
	// numbers never land in that range (the packed layout needs the
	// equivalent of roughly 2^40 or higher), so this is safe, the same
	// assumption every other packed-ref-as-double value in this extension
	// already relies on.
	bool tryDecodeFirestoreRefDouble(double d, uint64_t& out_ref)
	{
		if (d < 0.0 || std::floor(d) != d || d >= 18446744073709551615.0)
			return false;

		out_ref = static_cast<uint64_t>(d);
		return gm_fb_ref_ext(out_ref) == GM_FIREBASE_EXT;
	}
}

firebase::firestore::FieldValue gmValueToFieldValue(const gm::wire::GMValue& value)
{
	using gm::wire::GMArrayView;
	using gm::wire::GMObjectView;
	using firebase::firestore::FieldValue;

	if (value.is<double>())
	{
		double d = value.as<double>();
		uint64_t as_ref = 0;
		if (tryDecodeFirestoreRefDouble(d, as_ref))
		{
			uint8_t type = gm_fb_ref_type(as_ref);
			if (type == GM_FB_TYPE_FIRESTORE_FIELD_VALUE)
			{
				auto it = g_fs_field_value_map.find(gm_fb_ref_id(as_ref));
				if (it != g_fs_field_value_map.end())
					return it->second;
			}
			else if (type == GM_FB_TYPE_FIRESTORE_DOC_REF)
			{
				auto it = g_fs_doc_ref_map.find(gm_fb_ref_id(as_ref));
				if (it != g_fs_doc_ref_map.end())
					return FieldValue::Reference(it->second);
			}
		}
		return FieldValue::Double(d);
	}

	if (value.is<bool>())
		return FieldValue::Boolean(value.as<bool>());

	if (value.is<std::string_view>())
		return FieldValue::String(std::string(value.as<std::string_view>()));

	if (value.is<GMArrayView>())
	{
		std::vector<FieldValue> items;
		auto view = value.as<GMArrayView>();
		items.reserve(view.size());
		for (const auto& element : view)
			items.push_back(gmValueToFieldValue(element));
		return FieldValue::Array(std::move(items));
	}

	if (value.is<GMObjectView>())
	{
		firebase::firestore::MapFieldValue map;
		auto view = value.as<GMObjectView>();
		for (const auto& pair : view)
			map[std::string(pair.first)] = gmValueToFieldValue(pair.second);
		return FieldValue::Map(std::move(map));
	}

	return FieldValue::Null();
}

firebase::firestore::MapFieldValue gmValueToMapFieldValue(const gm::wire::GMValue& value)
{
	firebase::firestore::MapFieldValue result;
	if (!value.is<gm::wire::GMObjectView>())
		return result;

	auto view = value.as<gm::wire::GMObjectView>();
	for (const auto& pair : view)
		result[std::string(pair.first)] = gmValueToFieldValue(pair.second);
	return result;
}

std::vector<firebase::firestore::FieldValue> gmValueToFieldValueVector(const gm::wire::GMValue& value)
{
	std::vector<firebase::firestore::FieldValue> result;
	if (!value.is<gm::wire::GMArrayView>())
		return result;

	auto view = value.as<gm::wire::GMArrayView>();
	result.reserve(view.size());
	for (const auto& element : view)
		result.push_back(gmValueToFieldValue(element));
	return result;
}

std::vector<std::string> gmValueToStringVector(const gm::wire::GMValue& value)
{
	std::vector<std::string> result;
	if (!value.is<gm::wire::GMArrayView>())
		return result;

	auto view = value.as<gm::wire::GMArrayView>();
	result.reserve(view.size());
	for (const auto& element : view)
	{
		if (element.is<std::string_view>())
			result.emplace_back(element.as<std::string_view>());
	}
	return result;
}

// ============================================================
// FieldValue sentinels + explicit-typed value constructors
// ============================================================
// Every one of these mints a GM_FB_TYPE_FIRESTORE_FIELD_VALUE ref that only
// makes sense fed back into a data map passed to Set/Update/Add/WriteBatch
// (or, for firebase_firestore_field_value_reference, also usable directly wherever a
// FieldValue is expected, e.g. WhereEqualTo). gmValueToFieldValue() resolves
// the ref back to the concrete FieldValue it was registered with.

uint64_t firebase_firestore_field_value_delete()
{
	return registerFirestoreFieldValue(firebase::firestore::FieldValue::Delete());
}

uint64_t firebase_firestore_field_value_server_timestamp()
{
	return registerFirestoreFieldValue(firebase::firestore::FieldValue::ServerTimestamp());
}

uint64_t firebase_firestore_field_value_array_union(const gm::wire::GMValue& values)
{
	return registerFirestoreFieldValue(firebase::firestore::FieldValue::ArrayUnion(gmValueToFieldValueVector(values)));
}

uint64_t firebase_firestore_field_value_array_remove(const gm::wire::GMValue& values)
{
	return registerFirestoreFieldValue(firebase::firestore::FieldValue::ArrayRemove(gmValueToFieldValueVector(values)));
}

uint64_t firebase_firestore_field_value_increment_integer(double value)
{
	return registerFirestoreFieldValue(firebase::firestore::FieldValue::Increment<int64_t>(static_cast<int64_t>(value)));
}

uint64_t firebase_firestore_field_value_increment_double(double value)
{
	return registerFirestoreFieldValue(firebase::firestore::FieldValue::Increment<double>(value));
}

uint64_t firebase_firestore_field_value_integer(double value)
{
	return registerFirestoreFieldValue(firebase::firestore::FieldValue::Integer(static_cast<int64_t>(value)));
}

uint64_t firebase_firestore_field_value_double(double value)
{
	return registerFirestoreFieldValue(firebase::firestore::FieldValue::Double(value));
}

uint64_t firebase_firestore_field_value_timestamp(double seconds, double nanoseconds)
{
	firebase::Timestamp ts(static_cast<int64_t>(seconds), static_cast<int32_t>(nanoseconds));
	return registerFirestoreFieldValue(firebase::firestore::FieldValue::Timestamp(ts));
}

uint64_t firebase_firestore_field_value_geo_point(double latitude, double longitude)
{
	firebase::firestore::GeoPoint gp(latitude, longitude);
	return registerFirestoreFieldValue(firebase::firestore::FieldValue::GeoPoint(gp));
}

uint64_t firebase_firestore_field_value_reference(uint64_t document_ref)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr)
		return 0;

	return registerFirestoreFieldValue(firebase::firestore::FieldValue::Reference(*doc));
}

uint64_t firebase_firestore_field_value_blob(std::string_view data)
{
	return registerFirestoreFieldValue(firebase::firestore::FieldValue::Blob(reinterpret_cast<const uint8_t*>(data.data()), data.size()));
}

uint64_t firebase_firestore_field_value_null()
{
	return registerFirestoreFieldValue(firebase::firestore::FieldValue::Null());
}

void firebase_firestore_field_value_release(uint64_t ref)
{
	if (gm_fb_ref_ext(ref) != GM_FIREBASE_EXT || gm_fb_ref_type(ref) != GM_FB_TYPE_FIRESTORE_FIELD_VALUE)
	{
		setFirebaseLastError(-1, "invalid handle");
		return;
	}
	unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_field_value_map);
}

// ============================================================
// Firestore instance / settings / lifecycle
// ============================================================

uint64_t firebase_firestore_get_instance()
{
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(-1, "firebase_firestore_get_instance: no firebase::App - call firebase_app_initialize() first");
		return 0;
	}

	firebase::InitResult init_result = firebase::kInitResultSuccess;
	firebase::firestore::Firestore* fs = firebase::firestore::Firestore::GetInstance(app, &init_result);
	if (fs == nullptr || init_result != firebase::kInitResultSuccess)
	{
		setFirebaseLastError(-1, "firebase_firestore_get_instance: Firestore::GetInstance() failed");
		return 0;
	}

	return registerFirebasePointer(fs, GM_FB_TYPE_FIRESTORE);
}

uint64_t firebase_firestore_get_instance_for_database(std::string_view database_name)
{
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(-1, "firebase_firestore_get_instance_for_database: no firebase::App - call firebase_app_initialize() first");
		return 0;
	}

	std::string name(database_name);
	firebase::InitResult init_result = firebase::kInitResultSuccess;
	firebase::firestore::Firestore* fs = firebase::firestore::Firestore::GetInstance(app, name.c_str(), &init_result);
	if (fs == nullptr || init_result != firebase::kInitResultSuccess)
	{
		setFirebaseLastError(-1, "firebase_firestore_get_instance_for_database: Firestore::GetInstance() failed");
		return 0;
	}

	return registerFirebasePointer(fs, GM_FB_TYPE_FIRESTORE);
}

std::string firebase_firestore_settings_get_host(uint64_t instance_ref)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return std::string();
	return fs->settings().host();
}

void firebase_firestore_settings_set_host(uint64_t instance_ref, std::string_view host)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return;
	firebase::firestore::Settings s = fs->settings();
	s.set_host(std::string(host));
	fs->set_settings(s);
}

bool firebase_firestore_settings_get_ssl_enabled(uint64_t instance_ref)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return false;
	return fs->settings().is_ssl_enabled();
}

void firebase_firestore_settings_set_ssl_enabled(uint64_t instance_ref, bool enabled)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return;
	firebase::firestore::Settings s = fs->settings();
	s.set_ssl_enabled(enabled);
	fs->set_settings(s);
}

bool firebase_firestore_settings_get_persistence_enabled(uint64_t instance_ref)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return false;
	return fs->settings().is_persistence_enabled();
}

void firebase_firestore_settings_set_persistence_enabled(uint64_t instance_ref, bool enabled)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return;
	firebase::firestore::Settings s = fs->settings();
	s.set_persistence_enabled(enabled);
	fs->set_settings(s);
}

double firebase_firestore_settings_get_cache_size_bytes(uint64_t instance_ref)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return 0.0;
	return static_cast<double>(fs->settings().cache_size_bytes());
}

void firebase_firestore_settings_set_cache_size_bytes(uint64_t instance_ref, double bytes)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return;
	firebase::firestore::Settings s = fs->settings();
	s.set_cache_size_bytes(static_cast<int64_t>(bytes));
	fs->set_settings(s);
}

uint64_t firebase_firestore_collection(uint64_t instance_ref, std::string_view path)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return 0;
	return registerFirestoreColRef(fs->Collection(std::string(path)));
}

uint64_t firebase_firestore_document(uint64_t instance_ref, std::string_view path)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return 0;
	return registerFirestoreDocRef(fs->Document(std::string(path)));
}

uint64_t firebase_firestore_collection_group(uint64_t instance_ref, std::string_view collection_id)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return 0;
	return registerFirestoreQuery(fs->CollectionGroup(std::string(collection_id)));
}

uint64_t firebase_firestore_batch(uint64_t instance_ref)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return 0;
	return registerFirestoreWriteBatch(fs->batch());
}

void firebase_firestore_set_log_level(double level)
{
	firebase::firestore::Firestore::set_log_level(static_cast<firebase::LogLevel>(static_cast<int>(level)));
}

double firebase_firestore_enable_network(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return 0.0;

	fs->EnableNetwork().OnCompletion([callback](const firebase::Future<void>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (callback.has_value())
			callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
}

double firebase_firestore_disable_network(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return 0.0;

	fs->DisableNetwork().OnCompletion([callback](const firebase::Future<void>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (callback.has_value())
			callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
}

// After this future completes, `instance_ref` (and every ref derived from
// it) must not be used again - the underlying Firestore* is destroyed.
double firebase_firestore_terminate(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return 0.0;

	fs->Terminate().OnCompletion([callback](const firebase::Future<void>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (callback.has_value())
			callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
}

double firebase_firestore_clear_persistence(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return 0.0;

	fs->ClearPersistence().OnCompletion([callback](const firebase::Future<void>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (callback.has_value())
			callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
}

double firebase_firestore_wait_for_pending_writes(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return 0.0;

	fs->WaitForPendingWrites().OnCompletion([callback](const firebase::Future<void>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (callback.has_value())
			callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
}

// ============================================================
// Transaction - deliberate stub for this pass
// ============================================================
// firebase::firestore::Transaction cannot be copied and is only valid inside
// the std::function<Error(Transaction&, std::string&)> RunTransaction hands
// it to, where every Get/Set/Update/Delete call must complete synchronously
// before that function returns (RunTransaction retries the whole function on
// contention). Bridging that into a GML callback safely - keeping the
// Transaction& alive and re-entrant-safe for the duration of a GML callback
// invocation, handling retries, and surfacing Get()'s out-parameter error
// reporting - is a substantial piece of work of its own and was explicitly
// scoped out of this pass. Callers get a clear, typed "not implemented yet"
// error instead of a partially-working handle.
double firebase_firestore_run_transaction(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	(void)instance_ref;

	const int code = firebase::firestore::kErrorUnimplemented;
	const char* message = "firebase_firestore_run_transaction: Transaction is not implemented in this build of GMFirebase yet.";
	setFirebaseLastError(code, message);
	if (callback.has_value())
		callback->call((double)code, std::string_view{ message });
	return 0.0;
}

// ============================================================
// CollectionReference
// ============================================================

std::string firebase_firestore_collection_ref_id(uint64_t ref)
{
	firebase::firestore::CollectionReference* col = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_COL_REF, firebase::firestore::CollectionReference, g_fs_col_ref_map, col);
	if (col == nullptr) return std::string();
	return col->id();
}

std::string firebase_firestore_collection_ref_path(uint64_t ref)
{
	firebase::firestore::CollectionReference* col = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_COL_REF, firebase::firestore::CollectionReference, g_fs_col_ref_map, col);
	if (col == nullptr) return std::string();
	return col->path();
}

uint64_t firebase_firestore_collection_ref_parent(uint64_t ref)
{
	firebase::firestore::CollectionReference* col = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_COL_REF, firebase::firestore::CollectionReference, g_fs_col_ref_map, col);
	if (col == nullptr) return 0;
	return registerFirestoreDocRef(col->Parent());
}

uint64_t firebase_firestore_collection_ref_document(uint64_t ref)
{
	firebase::firestore::CollectionReference* col = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_COL_REF, firebase::firestore::CollectionReference, g_fs_col_ref_map, col);
	if (col == nullptr) return 0;
	return registerFirestoreDocRef(col->Document());
}

uint64_t firebase_firestore_collection_ref_document_path(uint64_t ref, std::string_view path)
{
	firebase::firestore::CollectionReference* col = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_COL_REF, firebase::firestore::CollectionReference, g_fs_col_ref_map, col);
	if (col == nullptr) return 0;
	return registerFirestoreDocRef(col->Document(std::string(path)));
}

double firebase_firestore_collection_ref_add(uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::CollectionReference* col = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_COL_REF, firebase::firestore::CollectionReference, g_fs_col_ref_map, col);
	if (col == nullptr) return 0.0;

	firebase::firestore::MapFieldValue map = gmValueToMapFieldValue(data);
	col->Add(map).OnCompletion([callback](const firebase::Future<firebase::firestore::DocumentReference>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (!callback.has_value())
			return;

		std::optional<uint64_t> doc_ref;
		if (f.error() == 0 && f.result() != nullptr)
			doc_ref = registerFirestoreDocRef(*f.result());

		callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" }, doc_ref);
	});
	return 1.0;
}

bool firebase_firestore_collection_ref_is_valid(uint64_t ref)
{
	firebase::firestore::CollectionReference* col = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_COL_REF, firebase::firestore::CollectionReference, g_fs_col_ref_map, col);
	if (col == nullptr) return false;
	return col->is_valid();
}

void firebase_firestore_collection_ref_release(uint64_t ref)
{
	if (gm_fb_ref_ext(ref) != GM_FIREBASE_EXT || gm_fb_ref_type(ref) != GM_FB_TYPE_FIRESTORE_COL_REF)
	{
		setFirebaseLastError(-1, "invalid handle");
		return;
	}
	unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_col_ref_map);
}

// ============================================================
// DocumentReference
// ============================================================

std::string firebase_firestore_document_ref_id(uint64_t ref)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return std::string();
	return doc->id();
}

std::string firebase_firestore_document_ref_path(uint64_t ref)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return std::string();
	return doc->path();
}

uint64_t firebase_firestore_document_ref_parent(uint64_t ref)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return 0;
	return registerFirestoreColRef(doc->Parent());
}

uint64_t firebase_firestore_document_ref_collection(uint64_t ref, std::string_view path)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return 0;
	return registerFirestoreColRef(doc->Collection(std::string(path)));
}

double firebase_firestore_document_ref_get(uint64_t ref, double source, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return 0.0;

	auto src = static_cast<firebase::firestore::Source>(static_cast<int>(source));
	doc->Get(src).OnCompletion([callback](const firebase::Future<firebase::firestore::DocumentSnapshot>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (!callback.has_value())
			return;

		std::optional<uint64_t> snapshot_ref;
		if (f.error() == 0 && f.result() != nullptr)
			snapshot_ref = registerFirestoreDocSnapshot(*f.result());

		callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" }, snapshot_ref);
	});
	return 1.0;
}

double firebase_firestore_document_ref_set(uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return 0.0;

	doc->Set(gmValueToMapFieldValue(data)).OnCompletion([callback](const firebase::Future<void>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (callback.has_value())
			callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
}

double firebase_firestore_document_ref_set_merge(uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return 0.0;

	doc->Set(gmValueToMapFieldValue(data), firebase::firestore::SetOptions::Merge()).OnCompletion([callback](const firebase::Future<void>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (callback.has_value())
			callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
}

double firebase_firestore_document_ref_set_merge_fields(uint64_t ref, const gm::wire::GMValue& data, const gm::wire::GMValue& fields, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return 0.0;

	auto options = firebase::firestore::SetOptions::MergeFields(gmValueToStringVector(fields));
	doc->Set(gmValueToMapFieldValue(data), options).OnCompletion([callback](const firebase::Future<void>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (callback.has_value())
			callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
}

double firebase_firestore_document_ref_update(uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return 0.0;

	doc->Update(gmValueToMapFieldValue(data)).OnCompletion([callback](const firebase::Future<void>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (callback.has_value())
			callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
}

double firebase_firestore_document_ref_delete(uint64_t ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return 0.0;

	doc->Delete().OnCompletion([callback](const firebase::Future<void>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (callback.has_value())
			callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
}

// Returns a GM_FB_TYPE_FIRESTORE_LISTENER_REG ref for
// firebase_firestore_listener_registration_remove(). Firebase invokes the listener on
// its own background/UI thread; GMFunction::call() is internally
// mutex-guarded, so `cb` is dispatched directly with no extra queue.
uint64_t firebase_firestore_document_ref_add_snapshot_listener(uint64_t ref, bool include_metadata_changes, const std::optional<gm::wire::GMFunction>& callback)
{
	if (!callback.has_value())
	{
		setFirebaseLastError(-1, "firebase_firestore_document_ref_add_snapshot_listener: a callback is required");
		return 0;
	}

	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return 0;

	auto mc = include_metadata_changes ? firebase::firestore::MetadataChanges::kInclude : firebase::firestore::MetadataChanges::kExclude;
	gm::wire::GMFunction cb = callback.value();

	firebase::firestore::ListenerRegistration* reg = new firebase::firestore::ListenerRegistration(
		doc->AddSnapshotListener(mc, [cb](const firebase::firestore::DocumentSnapshot& snapshot, firebase::firestore::Error error, const std::string& error_message)
		{
			if (error != firebase::firestore::kErrorOk)
				setFirebaseLastError((int)error, error_message);

			uint64_t snapshot_ref = 0;
			if (error == firebase::firestore::kErrorOk)
				snapshot_ref = registerFirestoreDocSnapshot(snapshot);

			cb.call((double)error, std::string_view{ error_message }, snapshot_ref);
		}));

	return registerFirebasePointer(reg, GM_FB_TYPE_FIRESTORE_LISTENER_REG);
}

bool firebase_firestore_document_ref_is_valid(uint64_t ref)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return false;
	return doc->is_valid();
}

void firebase_firestore_document_ref_release(uint64_t ref)
{
	if (gm_fb_ref_ext(ref) != GM_FIREBASE_EXT || gm_fb_ref_type(ref) != GM_FB_TYPE_FIRESTORE_DOC_REF)
	{
		setFirebaseLastError(-1, "invalid handle");
		return;
	}
	unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_doc_ref_map);
}

// ============================================================
// Query (also serves CollectionReference refs - see resolveFirestoreQuery)
// ============================================================

uint64_t firebase_firestore_query_where_equal_to(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	return registerFirestoreQuery(q.WhereEqualTo(std::string(field), gmValueToFieldValue(value)));
}

uint64_t firebase_firestore_query_where_not_equal_to(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	return registerFirestoreQuery(q.WhereNotEqualTo(std::string(field), gmValueToFieldValue(value)));
}

uint64_t firebase_firestore_query_where_less_than(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	return registerFirestoreQuery(q.WhereLessThan(std::string(field), gmValueToFieldValue(value)));
}

uint64_t firebase_firestore_query_where_less_than_or_equal_to(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	return registerFirestoreQuery(q.WhereLessThanOrEqualTo(std::string(field), gmValueToFieldValue(value)));
}

uint64_t firebase_firestore_query_where_greater_than(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	return registerFirestoreQuery(q.WhereGreaterThan(std::string(field), gmValueToFieldValue(value)));
}

uint64_t firebase_firestore_query_where_greater_than_or_equal_to(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	return registerFirestoreQuery(q.WhereGreaterThanOrEqualTo(std::string(field), gmValueToFieldValue(value)));
}

uint64_t firebase_firestore_query_where_array_contains(uint64_t ref, std::string_view field, const gm::wire::GMValue& value)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	return registerFirestoreQuery(q.WhereArrayContains(std::string(field), gmValueToFieldValue(value)));
}

uint64_t firebase_firestore_query_where_array_contains_any(uint64_t ref, std::string_view field, const gm::wire::GMValue& values)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	return registerFirestoreQuery(q.WhereArrayContainsAny(std::string(field), gmValueToFieldValueVector(values)));
}

uint64_t firebase_firestore_query_where_in(uint64_t ref, std::string_view field, const gm::wire::GMValue& values)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	return registerFirestoreQuery(q.WhereIn(std::string(field), gmValueToFieldValueVector(values)));
}

uint64_t firebase_firestore_query_where_not_in(uint64_t ref, std::string_view field, const gm::wire::GMValue& values)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	return registerFirestoreQuery(q.WhereNotIn(std::string(field), gmValueToFieldValueVector(values)));
}

uint64_t firebase_firestore_query_order_by(uint64_t ref, std::string_view field, double direction)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	auto dir = static_cast<firebase::firestore::Query::Direction>(static_cast<int>(direction));
	return registerFirestoreQuery(q.OrderBy(std::string(field), dir));
}

uint64_t firebase_firestore_query_limit(uint64_t ref, double limit)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	return registerFirestoreQuery(q.Limit(static_cast<int32_t>(limit)));
}

uint64_t firebase_firestore_query_limit_to_last(uint64_t ref, double limit)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	return registerFirestoreQuery(q.LimitToLast(static_cast<int32_t>(limit)));
}

uint64_t firebase_firestore_query_start_at_snapshot(uint64_t ref, uint64_t snapshot_ref)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	firebase::firestore::DocumentSnapshot* snap = nullptr;
	validate_fb_ref_map(snapshot_ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
	if (snap == nullptr) return 0;
	return registerFirestoreQuery(q.StartAt(*snap));
}

uint64_t firebase_firestore_query_start_at_values(uint64_t ref, const gm::wire::GMValue& values)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	return registerFirestoreQuery(q.StartAt(gmValueToFieldValueVector(values)));
}

uint64_t firebase_firestore_query_start_after_snapshot(uint64_t ref, uint64_t snapshot_ref)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	firebase::firestore::DocumentSnapshot* snap = nullptr;
	validate_fb_ref_map(snapshot_ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
	if (snap == nullptr) return 0;
	return registerFirestoreQuery(q.StartAfter(*snap));
}

uint64_t firebase_firestore_query_start_after_values(uint64_t ref, const gm::wire::GMValue& values)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	return registerFirestoreQuery(q.StartAfter(gmValueToFieldValueVector(values)));
}

uint64_t firebase_firestore_query_end_before_snapshot(uint64_t ref, uint64_t snapshot_ref)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	firebase::firestore::DocumentSnapshot* snap = nullptr;
	validate_fb_ref_map(snapshot_ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
	if (snap == nullptr) return 0;
	return registerFirestoreQuery(q.EndBefore(*snap));
}

uint64_t firebase_firestore_query_end_before_values(uint64_t ref, const gm::wire::GMValue& values)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	return registerFirestoreQuery(q.EndBefore(gmValueToFieldValueVector(values)));
}

uint64_t firebase_firestore_query_end_at_snapshot(uint64_t ref, uint64_t snapshot_ref)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	firebase::firestore::DocumentSnapshot* snap = nullptr;
	validate_fb_ref_map(snapshot_ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
	if (snap == nullptr) return 0;
	return registerFirestoreQuery(q.EndAt(*snap));
}

uint64_t firebase_firestore_query_end_at_values(uint64_t ref, const gm::wire::GMValue& values)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	return registerFirestoreQuery(q.EndAt(gmValueToFieldValueVector(values)));
}

double firebase_firestore_query_get(uint64_t ref, double source, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0.0;

	auto src = static_cast<firebase::firestore::Source>(static_cast<int>(source));
	q.Get(src).OnCompletion([callback](const firebase::Future<firebase::firestore::QuerySnapshot>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (!callback.has_value())
			return;

		std::optional<uint64_t> snapshot_ref;
		if (f.error() == 0 && f.result() != nullptr)
			snapshot_ref = registerFirestoreQuerySnapshot(*f.result());

		callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" }, snapshot_ref);
	});
	return 1.0;
}

// Returns a GM_FB_TYPE_FIRESTORE_LISTENER_REG ref for
// firebase_firestore_listener_registration_remove().
uint64_t firebase_firestore_query_add_snapshot_listener(uint64_t ref, bool include_metadata_changes, const std::optional<gm::wire::GMFunction>& callback)
{
	if (!callback.has_value())
	{
		setFirebaseLastError(-1, "firebase_firestore_query_add_snapshot_listener: a callback is required");
		return 0;
	}

	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;

	auto mc = include_metadata_changes ? firebase::firestore::MetadataChanges::kInclude : firebase::firestore::MetadataChanges::kExclude;
	gm::wire::GMFunction cb = callback.value();

	firebase::firestore::ListenerRegistration* reg = new firebase::firestore::ListenerRegistration(
		q.AddSnapshotListener(mc, [cb](const firebase::firestore::QuerySnapshot& snapshot, firebase::firestore::Error error, const std::string& error_message)
		{
			if (error != firebase::firestore::kErrorOk)
				setFirebaseLastError((int)error, error_message);

			uint64_t snapshot_ref = 0;
			if (error == firebase::firestore::kErrorOk)
				snapshot_ref = registerFirestoreQuerySnapshot(snapshot);

			cb.call((double)error, std::string_view{ error_message }, snapshot_ref);
		}));

	return registerFirebasePointer(reg, GM_FB_TYPE_FIRESTORE_LISTENER_REG);
}

bool firebase_firestore_query_is_valid(uint64_t ref)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return false;
	return q.is_valid();
}

void firebase_firestore_query_release(uint64_t ref)
{
	if (gm_fb_ref_ext(ref) != GM_FIREBASE_EXT || gm_fb_ref_type(ref) != GM_FB_TYPE_FIRESTORE_QUERY)
	{
		setFirebaseLastError(-1, "invalid handle");
		return;
	}
	unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_query_map);
}

// ============================================================
// WriteBatch
// ============================================================

double firebase_firestore_write_batch_set(uint64_t batch_ref, uint64_t document_ref, const gm::wire::GMValue& data)
{
	firebase::firestore::WriteBatch* batch = nullptr;
	validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, batch);
	if (batch == nullptr) return 0.0;

	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return 0.0;

	batch->Set(*doc, gmValueToMapFieldValue(data));
	return 1.0;
}

double firebase_firestore_write_batch_set_merge(uint64_t batch_ref, uint64_t document_ref, const gm::wire::GMValue& data)
{
	firebase::firestore::WriteBatch* batch = nullptr;
	validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, batch);
	if (batch == nullptr) return 0.0;

	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return 0.0;

	batch->Set(*doc, gmValueToMapFieldValue(data), firebase::firestore::SetOptions::Merge());
	return 1.0;
}

double firebase_firestore_write_batch_set_merge_fields(uint64_t batch_ref, uint64_t document_ref, const gm::wire::GMValue& data, const gm::wire::GMValue& fields)
{
	firebase::firestore::WriteBatch* batch = nullptr;
	validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, batch);
	if (batch == nullptr) return 0.0;

	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return 0.0;

	auto options = firebase::firestore::SetOptions::MergeFields(gmValueToStringVector(fields));
	batch->Set(*doc, gmValueToMapFieldValue(data), options);
	return 1.0;
}

double firebase_firestore_write_batch_update(uint64_t batch_ref, uint64_t document_ref, const gm::wire::GMValue& data)
{
	firebase::firestore::WriteBatch* batch = nullptr;
	validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, batch);
	if (batch == nullptr) return 0.0;

	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return 0.0;

	batch->Update(*doc, gmValueToMapFieldValue(data));
	return 1.0;
}

double firebase_firestore_write_batch_delete(uint64_t batch_ref, uint64_t document_ref)
{
	firebase::firestore::WriteBatch* batch = nullptr;
	validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, batch);
	if (batch == nullptr) return 0.0;

	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return 0.0;

	batch->Delete(*doc);
	return 1.0;
}

double firebase_firestore_write_batch_commit(uint64_t batch_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::WriteBatch* batch = nullptr;
	validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, batch);
	if (batch == nullptr) return 0.0;

	batch->Commit().OnCompletion([callback](const firebase::Future<void>& f)
	{
		if (f.error() != 0)
			setFirebaseLastError(f.error(), f.error_message() ? f.error_message() : "");
		if (callback.has_value())
			callback->call((double)f.error(), std::string_view{ f.error_message() ? f.error_message() : "" });
	});
	return 1.0;
}

void firebase_firestore_write_batch_release(uint64_t batch_ref)
{
	if (gm_fb_ref_ext(batch_ref) != GM_FIREBASE_EXT || gm_fb_ref_type(batch_ref) != GM_FB_TYPE_FIRESTORE_WRITE_BATCH)
	{
		setFirebaseLastError(-1, "invalid handle");
		return;
	}
	unregisterFirebaseValue(gm_fb_ref_id(batch_ref), g_fs_write_batch_map);
}
