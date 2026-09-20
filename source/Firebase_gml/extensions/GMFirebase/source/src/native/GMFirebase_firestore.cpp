// Cloud Firestore - Firestore instance/settings, CollectionReference,
// DocumentReference, Query (also serves CollectionReference, since it
// publicly inherits from Query), WriteBatch, the FieldValue<->gm::wire
// converter and FieldValue sentinel/explicit-typed-value constructors.
//
// DocumentSnapshot, QuerySnapshot and ListenerRegistration removal live in
// GMFirebase_firestore_snapshot.cpp (sharing this file's header); Transaction
// parks the SDK's executor thread (see firebase_firestore_run_transaction below).
#include "GMFirebase_firestore.h"
#include <algorithm>
#include <atomic>
#include <condition_variable>
#include <cstring>
#include <deque>
#include <functional>
#include <memory>

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

// ============================================================
// Enum mirrors (see GM_FB_PIN_ENUM in GMFirebase_common.h)
// ============================================================

GM_FB_PIN_ENUM(FirestoreError::Ok, firebase::firestore::kErrorOk);
GM_FB_PIN_ENUM(FirestoreError::Cancelled, firebase::firestore::kErrorCancelled);
GM_FB_PIN_ENUM(FirestoreError::Unknown, firebase::firestore::kErrorUnknown);
GM_FB_PIN_ENUM(FirestoreError::InvalidArgument, firebase::firestore::kErrorInvalidArgument);
GM_FB_PIN_ENUM(FirestoreError::DeadlineExceeded, firebase::firestore::kErrorDeadlineExceeded);
GM_FB_PIN_ENUM(FirestoreError::NotFound, firebase::firestore::kErrorNotFound);
GM_FB_PIN_ENUM(FirestoreError::AlreadyExists, firebase::firestore::kErrorAlreadyExists);
GM_FB_PIN_ENUM(FirestoreError::PermissionDenied, firebase::firestore::kErrorPermissionDenied);
GM_FB_PIN_ENUM(FirestoreError::ResourceExhausted, firebase::firestore::kErrorResourceExhausted);
GM_FB_PIN_ENUM(FirestoreError::FailedPrecondition, firebase::firestore::kErrorFailedPrecondition);
GM_FB_PIN_ENUM(FirestoreError::Aborted, firebase::firestore::kErrorAborted);
GM_FB_PIN_ENUM(FirestoreError::OutOfRange, firebase::firestore::kErrorOutOfRange);
GM_FB_PIN_ENUM(FirestoreError::Unimplemented, firebase::firestore::kErrorUnimplemented);
GM_FB_PIN_ENUM(FirestoreError::Internal, firebase::firestore::kErrorInternal);
GM_FB_PIN_ENUM(FirestoreError::Unavailable, firebase::firestore::kErrorUnavailable);
GM_FB_PIN_ENUM(FirestoreError::DataLoss, firebase::firestore::kErrorDataLoss);
GM_FB_PIN_ENUM(FirestoreError::Unauthenticated, firebase::firestore::kErrorUnauthenticated);
GM_FB_PIN_ENUM(FirestoreSource::Default, firebase::firestore::Source::kDefault);
GM_FB_PIN_ENUM(FirestoreSource::Server, firebase::firestore::Source::kServer);
GM_FB_PIN_ENUM(FirestoreSource::Cache, firebase::firestore::Source::kCache);
GM_FB_PIN_ENUM(FirestoreDirection::Ascending, firebase::firestore::Query::Direction::kAscending);
GM_FB_PIN_ENUM(FirestoreDirection::Descending, firebase::firestore::Query::Direction::kDescending);
GM_FB_PIN_ENUM(FirestoreAggregateSource::Server, firebase::firestore::AggregateSource::kServer);
GM_FB_PIN_ENUM(FirestoreLoadBundleTaskState::Error, firebase::firestore::LoadBundleTaskProgress::State::kError);
GM_FB_PIN_ENUM(FirestoreLoadBundleTaskState::InProgress, firebase::firestore::LoadBundleTaskProgress::State::kInProgress);
GM_FB_PIN_ENUM(FirestoreLoadBundleTaskState::Success, firebase::firestore::LoadBundleTaskProgress::State::kSuccess);
GM_FB_PIN_ENUM(FirestoreFieldValueType::Null, firebase::firestore::FieldValue::Type::kNull);
GM_FB_PIN_ENUM(FirestoreFieldValueType::Boolean, firebase::firestore::FieldValue::Type::kBoolean);
GM_FB_PIN_ENUM(FirestoreFieldValueType::Integer, firebase::firestore::FieldValue::Type::kInteger);
GM_FB_PIN_ENUM(FirestoreFieldValueType::Double, firebase::firestore::FieldValue::Type::kDouble);
GM_FB_PIN_ENUM(FirestoreFieldValueType::Timestamp, firebase::firestore::FieldValue::Type::kTimestamp);
GM_FB_PIN_ENUM(FirestoreFieldValueType::String, firebase::firestore::FieldValue::Type::kString);
GM_FB_PIN_ENUM(FirestoreFieldValueType::Blob, firebase::firestore::FieldValue::Type::kBlob);
GM_FB_PIN_ENUM(FirestoreFieldValueType::Reference, firebase::firestore::FieldValue::Type::kReference);
GM_FB_PIN_ENUM(FirestoreFieldValueType::GeoPoint, firebase::firestore::FieldValue::Type::kGeoPoint);
GM_FB_PIN_ENUM(FirestoreFieldValueType::Array, firebase::firestore::FieldValue::Type::kArray);
GM_FB_PIN_ENUM(FirestoreFieldValueType::Map, firebase::firestore::FieldValue::Type::kMap);
GM_FB_PIN_ENUM(FirestoreFieldValueType::Delete, firebase::firestore::FieldValue::Type::kDelete);
GM_FB_PIN_ENUM(FirestoreFieldValueType::ServerTimestamp, firebase::firestore::FieldValue::Type::kServerTimestamp);
GM_FB_PIN_ENUM(FirestoreFieldValueType::ArrayUnion, firebase::firestore::FieldValue::Type::kArrayUnion);
GM_FB_PIN_ENUM(FirestoreFieldValueType::ArrayRemove, firebase::firestore::FieldValue::Type::kArrayRemove);
GM_FB_PIN_ENUM(FirestoreFieldValueType::IncrementInteger, firebase::firestore::FieldValue::Type::kIncrementInteger);
GM_FB_PIN_ENUM(FirestoreFieldValueType::IncrementDouble, firebase::firestore::FieldValue::Type::kIncrementDouble);

// GML -> SDK. False for anything outside the enum; the caller records
// InvalidArgument.
static bool toSdkSource(FirestoreSource source, firebase::firestore::Source& out)
{
	switch (source)
	{
	case FirestoreSource::Default: out = firebase::firestore::Source::kDefault; return true;
	case FirestoreSource::Server: out = firebase::firestore::Source::kServer; return true;
	case FirestoreSource::Cache: out = firebase::firestore::Source::kCache; return true;
	default: return false;
	}
}

static bool toSdkDirection(FirestoreDirection direction, firebase::firestore::Query::Direction& out)
{
	switch (direction)
	{
	case FirestoreDirection::Ascending: out = firebase::firestore::Query::Direction::kAscending; return true;
	case FirestoreDirection::Descending: out = firebase::firestore::Query::Direction::kDescending; return true;
	default: return false;
	}
}

static bool toSdkAggregateSource(FirestoreAggregateSource source, firebase::firestore::AggregateSource& out)
{
	switch (source)
	{
	case FirestoreAggregateSource::Server: out = firebase::firestore::AggregateSource::kServer; return true;
	default: return false;
	}
}

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
std::map<uint32_t, std::vector<uint32_t>> g_fs_snapshot_blob_children;

std::map<uint32_t, firebase::firestore::FieldPath> g_fs_field_path_map;
uint32_t g_fs_field_path_index = 0;
std::map<uint32_t, firebase::firestore::Filter> g_fs_filter_map;
uint32_t g_fs_filter_index = 0;
std::map<uint32_t, firebase::firestore::AggregateQuery> g_fs_aggregate_query_map;
uint32_t g_fs_aggregate_query_index = 0;
std::map<uint32_t, firebase::firestore::AggregateQuerySnapshot> g_fs_aggregate_snapshot_map;
uint32_t g_fs_aggregate_snapshot_index = 0;

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

gm_structs::FirestoreBlob makeFirestoreBlob(const firebase::firestore::FieldValue& blob, uint64_t owner_snapshot)
{
	gm_structs::FirestoreBlob out;
	out.field_value = registerFirestoreFieldValue(blob);
	out.size = static_cast<double>(blob.blob_size());

	// Recorded after the registration, which takes the same lock.
	if (owner_snapshot != 0)
	{
		std::lock_guard<std::mutex> lock(g_firebase_value_registry_mutex);
		g_fs_snapshot_blob_children[gm_fb_ref_id(owner_snapshot)].push_back(gm_fb_ref_id(out.field_value));
	}
	return out;
}

gm_structs::FirestoreBlob makeFirestoreBlob(const std::uint8_t* data, std::size_t size, uint64_t owner_snapshot)
{
	return makeFirestoreBlob(firebase::firestore::FieldValue::Blob(data, size), owner_snapshot);
}

void releaseFirestoreSnapshotBlobs(uint32_t snapshot_id)
{
	std::lock_guard<std::mutex> lock(g_firebase_value_registry_mutex);
	auto it = g_fs_snapshot_blob_children.find(snapshot_id);
	if (it == g_fs_snapshot_blob_children.end()) return;

	// A child the game already released is simply gone from the map.
	for (uint32_t child : it->second)
		g_fs_field_value_map.erase(child);
	g_fs_snapshot_blob_children.erase(it);
}

uint64_t registerFirestoreFieldPath(const firebase::firestore::FieldPath& value)
{
	uint32_t id = registerFirebaseValue(value, g_fs_field_path_index, g_fs_field_path_map);
	return packFirebaseRef(id, GM_FB_TYPE_FIRESTORE_FIELD_PATH);
}
uint64_t registerFirestoreFilter(const firebase::firestore::Filter& value)
{
	uint32_t id = registerFirebaseValue(value, g_fs_filter_index, g_fs_filter_map);
	return packFirebaseRef(id, GM_FB_TYPE_FIRESTORE_FILTER);
}
uint64_t registerFirestoreAggregateQuery(const firebase::firestore::AggregateQuery& value)
{
	uint32_t id = registerFirebaseValue(value, g_fs_aggregate_query_index, g_fs_aggregate_query_map);
	return packFirebaseRef(id, GM_FB_TYPE_FIRESTORE_AGG_QUERY);
}
uint64_t registerFirestoreAggregateSnapshot(const firebase::firestore::AggregateQuerySnapshot& value)
{
	uint32_t id = registerFirebaseValue(value, g_fs_aggregate_snapshot_index, g_fs_aggregate_snapshot_map);
	return packFirebaseRef(id, GM_FB_TYPE_FIRESTORE_AGG_SNAPSHOT);
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
			std::lock_guard<std::mutex> lock(g_firebase_value_registry_mutex);
			auto it = g_fs_query_map.find(gm_fb_ref_id(ref));
			if (it != g_fs_query_map.end())
			{
				out = it->second;
				return true;
			}
		}
		else if (gm_fb_ref_type(ref) == GM_FB_TYPE_FIRESTORE_COL_REF)
		{
			std::lock_guard<std::mutex> lock(g_firebase_value_registry_mutex);
			auto it = g_fs_col_ref_map.find(gm_fb_ref_id(ref));
			if (it != g_fs_col_ref_map.end())
			{
				out = it->second; // CollectionReference -> Query slice
				return true;
			}
		}
	}

	setFirebaseLastError(GM_FB_ERROR_INVALID_HANDLE, "invalid handle");
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

gm_structs::FirestoreTimestamp makeFirestoreTimestamp(const firebase::Timestamp& ts)
{
	gm_structs::FirestoreTimestamp out;
	out.seconds = static_cast<double>(ts.seconds());
	out.nanoseconds = static_cast<double>(ts.nanoseconds());
	return out;
}

gm_structs::FirestoreGeoPoint makeFirestoreGeoPoint(const firebase::firestore::GeoPoint& gp)
{
	gm_structs::FirestoreGeoPoint out;
	out.latitude = gp.latitude();
	out.longitude = gp.longitude();
	return out;
}

gm_structs::FirestoreReference makeFirestoreReference(const firebase::firestore::DocumentReference& ref)
{
	gm_structs::FirestoreReference out;
	out.path = ref.path();
	return out;
}

namespace
{
	// One switch over FieldValue::Type for the three sinks below. emit() gets
	// each converted value and writes it wherever its sink puts one value: an
	// array element, a keyed struct field, or a bare stream value. owner is
	// the DocumentSnapshot ref the decode runs under, or 0 (see the header).
	template <class Emit>
	void visitFieldValue(const firebase::firestore::FieldValue& v, uint64_t owner, Emit&& emit)
	{
		switch (v.type())
		{
		case firebase::firestore::FieldValue::Type::kBoolean:
			emit(v.boolean_value());
			break;

		case firebase::firestore::FieldValue::Type::kInteger:
			// GML has no int64 - crosses as a double, same convention used
			// everywhere else in this extension. Use
			// firebase_firestore_field_value_integer() on the way back in if the exact
			// stored type matters.
			emit(static_cast<double>(v.integer_value()));
			break;

		case firebase::firestore::FieldValue::Type::kDouble:
			emit(v.double_value());
			break;

		case firebase::firestore::FieldValue::Type::kString:
			emit(std::string_view{ v.string_value() });
			break;

		case firebase::firestore::FieldValue::Type::kBlob:
			// No wire kind carries bytes to GML (a string stops the reader at
			// the first 0x00), so the bytes stay native behind a handle and
			// the game copies them into a buffer it sizes from the struct.
			emit(makeFirestoreBlob(v, owner));
			break;

		case firebase::firestore::FieldValue::Type::kReference:
			// The path, not a handle: a read registers nothing the caller would
			// have to release. firebase_firestore_document() resolves it.
			emit(makeFirestoreReference(v.reference_value()));
			break;

		case firebase::firestore::FieldValue::Type::kGeoPoint:
			emit(makeFirestoreGeoPoint(v.geo_point_value()));
			break;

		case firebase::firestore::FieldValue::Type::kTimestamp:
			emit(makeFirestoreTimestamp(v.timestamp_value()));
			break;

		case firebase::firestore::FieldValue::Type::kArray:
		{
			gm::wire::ArrayStream nested;
			for (const auto& elem : v.array_value())
				pushFieldValueToArray(elem, nested, owner);
			emit(nested);
			break;
		}

		case firebase::firestore::FieldValue::Type::kMap:
		{
			gm::wire::StructStream nested;
			for (const auto& kv : v.map_value())
				addFieldValueToStruct(kv.first.c_str(), kv.second, nested, owner);
			emit(nested);
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
			// FieldValue. Every sink writes an empty std::optional as
			// GMKind::Undefined, which is what a null needs to be.
			emit(std::optional<std::uint8_t>{});
			break;
		}
	}
}

void pushFieldValueToArray(const firebase::firestore::FieldValue& v, gm::wire::ArrayStream& out, uint64_t owner_snapshot)
{
	visitFieldValue(v, owner_snapshot, [&](const auto& value)
	{
		out << value;
	});
}

void addFieldValueToStruct(const char* key, const firebase::firestore::FieldValue& v, gm::wire::StructStream& out, uint64_t owner_snapshot)
{
	visitFieldValue(v, owner_snapshot, [&](const auto& value)
	{
		out.addKeyValue(key, value);
	});
}

void writeFieldValueToStream(const firebase::firestore::FieldValue& v, gm::wire::DataStream& out, uint64_t owner_snapshot)
{
	visitFieldValue(v, owner_snapshot, [&](const auto& value)
	{
		out << value;
	});
}

firebase::firestore::FieldValue gmValueToFieldValue(const gm::wire::GMValue& value)
{
	using gm::wire::GMArrayView;
	using gm::wire::GMObjectView;
	using firebase::firestore::FieldValue;

	// Same kind dispatch as gmValueToVariant(): is<T>() is an exact-kind test
	// and GML int32()/int64() values arrive as Int32/UInt64, not Double.
	switch (value.kind())
	{
	case gm::wire::GMKind::Double:
		return FieldValue::Double(value.as<double>());

	case gm::wire::GMKind::Int32:
		return FieldValue::Integer(value.as<std::int32_t>());

	case gm::wire::GMKind::UInt64:
	{
		// Every handle this extension hands out is a GML int64, and int64
		// crosses the wire as its own kind (buffer_u64), so a handle embedded
		// in document data - a FieldValue sentinel from
		// firebase_firestore_field_value_*(), or a document reference - is
		// recognised here by its ext/type bits (GMFirebase_common.h) and a
		// live registry entry. Anything else is an ordinary integer; a plain
		// GML real never reaches this branch.
		uint64_t u = value.as<std::uint64_t>();
		if (gm_fb_ref_ext(u) == GM_FIREBASE_EXT)
		{
			uint8_t type = gm_fb_ref_type(u);
			if (type == GM_FB_TYPE_FIRESTORE_FIELD_VALUE)
			{
				std::lock_guard<std::mutex> lock(g_firebase_value_registry_mutex);
				auto it = g_fs_field_value_map.find(gm_fb_ref_id(u));
				if (it != g_fs_field_value_map.end())
					return it->second;
			}
			else if (type == GM_FB_TYPE_FIRESTORE_DOC_REF)
			{
				std::lock_guard<std::mutex> lock(g_firebase_value_registry_mutex);
				auto it = g_fs_doc_ref_map.find(gm_fb_ref_id(u));
				if (it != g_fs_doc_ref_map.end())
					return FieldValue::Reference(it->second);
			}
		}
		return FieldValue::Integer(static_cast<std::int64_t>(u));
	}

	case gm::wire::GMKind::Bool:
		return FieldValue::Boolean(value.as<bool>());

	case gm::wire::GMKind::String:
		return FieldValue::String(std::string(value.as<std::string_view>()));

	case gm::wire::GMKind::Array:
	{
		std::vector<FieldValue> items;
		auto view = value.as<GMArrayView>();
		items.reserve(view.size());
		for (const auto& element : view)
			items.push_back(gmValueToFieldValue(element));
		return FieldValue::Array(std::move(items));
	}

	case gm::wire::GMKind::Struct:
	{
		firebase::firestore::MapFieldValue map;
		auto view = value.as<GMObjectView>();
		for (const auto& pair : view)
			map[std::string(pair.first)] = gmValueToFieldValue(pair.second);
		return FieldValue::Map(std::move(map));
	}

	case gm::wire::GMKind::Undefined:
		return FieldValue::Null();

	default:
		LOG_WARNING("gmValueToFieldValue: GML value kind %u cannot be sent to Firestore - sent as null", static_cast<unsigned>(value.kind()));
		return FieldValue::Null();
	}
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

std::vector<std::string> toStringVector(const std::vector<std::string_view>& views)
{
	std::vector<std::string> result;
	result.reserve(views.size());
	for (std::string_view view : views)
		result.emplace_back(view);
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

// The whole buffer is the blob. FieldValue::Blob copies the bytes, so the GML
// buffer is free as soon as this returns.
uint64_t firebase_firestore_field_value_blob(GMBuffer data)
{
	return registerFirestoreFieldValue(firebase::firestore::FieldValue::Blob(static_cast<const uint8_t*>(data.data()), static_cast<size_t>(data.length())));
}

uint64_t firebase_firestore_field_value_null()
{
	return registerFirestoreFieldValue(firebase::firestore::FieldValue::Null());
}

void firebase_firestore_field_value_release(uint64_t ref)
{
	if (gm_fb_ref_ext(ref) != GM_FIREBASE_EXT || gm_fb_ref_type(ref) != GM_FB_TYPE_FIRESTORE_FIELD_VALUE)
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_HANDLE, "invalid handle");
		return;
	}
	unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_field_value_map);
}

// ============================================================
// Firestore instance / settings / lifecycle
// ============================================================

namespace
{
	// Instances whose Terminate() has completed, with the handle each was
	// registered under, waiting to be deleted. The SDK erases a terminated
	// instance from its own cache but never deletes it, and the completion
	// runs on the Firestore core's own executor, where ~FirestoreInternal's
	// Dispose() of that core cannot run. The handle stays live meanwhile so
	// clear_persistence can follow terminate the way the SDK requires; the
	// next get_instance* - the call that mints a replacement - unregisters
	// and deletes on the GML thread. Keyed by pointer so a second terminate
	// on the same handle parks nothing twice.
	std::mutex g_terminated_firestores_mutex;
	std::map<firebase::firestore::Firestore*, uint64_t> g_terminated_firestores;

	// Defined with the transaction bridge below: ~FirestoreInternal joins the
	// transaction executor, so a parked attempt has to return first.
	void abortParkedFirestoreTransactions(firebase::firestore::Firestore* fs);

	void deleteTerminatedFirestores()
	{
		std::map<firebase::firestore::Firestore*, uint64_t> done;
		{
			std::lock_guard<std::mutex> lock(g_terminated_firestores_mutex);
			done.swap(g_terminated_firestores);
		}
		for (const auto& entry : done)
		{
			unregisterFirebasePointer(entry.second, GM_FB_TYPE_FIRESTORE);
			abortParkedFirestoreTransactions(entry.first);
			delete entry.first;
		}
	}
}

uint64_t firebase_firestore_get_instance()
{
	deleteTerminatedFirestores();

	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_firestore_get_instance: no firebase::App - call firebase_app_initialize() first");
		return 0;
	}

	firebase::InitResult init_result = firebase::kInitResultSuccess;
	firebase::firestore::Firestore* fs = firebase::firestore::Firestore::GetInstance(app, &init_result);
	if (fs == nullptr || init_result != firebase::kInitResultSuccess)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_firestore_get_instance: Firestore::GetInstance() failed");
		return 0;
	}

	return registerFirebasePointer(fs, GM_FB_TYPE_FIRESTORE);
}

uint64_t firebase_firestore_get_instance_for_database(std::string_view database_name)
{
	deleteTerminatedFirestores();

	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_firestore_get_instance_for_database: no firebase::App - call firebase_app_initialize() first");
		return 0;
	}

	std::string name(database_name);
	firebase::InitResult init_result = firebase::kInitResultSuccess;
	firebase::firestore::Firestore* fs = firebase::firestore::Firestore::GetInstance(app, name.c_str(), &init_result);
	if (fs == nullptr || init_result != firebase::kInitResultSuccess)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase_firestore_get_instance_for_database: Firestore::GetInstance() failed");
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

void firebase_firestore_set_log_level(FirebaseLogLevel level)
{
	firebase::LogLevel sdk_level;
	if (!toSdkLogLevel(level, sdk_level))
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_firestore_set_log_level: level must be a FirebaseLogLevel value");
		return;
	}
	firebase::firestore::Firestore::set_log_level(sdk_level);
}

FirebaseError firebase_firestore_enable_network(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return FirebaseError::InvalidHandle;

	fs->EnableNetwork().OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

FirebaseError firebase_firestore_disable_network(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return FirebaseError::InvalidHandle;

	fs->DisableNetwork().OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

// After the callback only clear_persistence may still use `instance_ref`;
// the SDK erases the instance from its cache here, and the extension deletes
// the object on the next get_instance* (see g_terminated_firestores).
FirebaseError firebase_firestore_terminate(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return FirebaseError::InvalidHandle;

	fs->Terminate().OnCompletion([fs, instance_ref, callback](const firebase::Future<void>& f)
	{
		{
			std::lock_guard<std::mutex> lock(g_terminated_firestores_mutex);
			g_terminated_firestores.emplace(fs, instance_ref);
		}
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

FirebaseError firebase_firestore_clear_persistence(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return FirebaseError::InvalidHandle;

	fs->ClearPersistence().OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

FirebaseError firebase_firestore_wait_for_pending_writes(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return FirebaseError::InvalidHandle;

	fs->WaitForPendingWrites().OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

// ============================================================
// Transaction
// ============================================================
// The SDK runs the update function on its own transaction executor - a
// thread pool kept for exactly this on every platform (firestore_main.cc for
// desktop and iOS, the Java SDK's transaction executor on Android) - and
// expects it to return only once the transaction is decided. That thread is
// parked here: each run of the update function registers an attempt, hands
// the handle to update_callback, then executes whatever the game posts
// through firebase_firestore_transaction_*, in order, until commit or abort.
// Everything that touches the Transaction runs on that one thread: Get()
// blocks on the server round trip, and the core Transaction has no locks of
// its own, so a write from the GML thread during a read would race the
// lookup's completion. The GML thread only converts and queues.
//
// A user error returned from the update function is retried by the SDK
// unless its code is one it treats as permanent and outside its own retry
// list (transaction_runner.cc: Aborted, AlreadyExists, FailedPrecondition and
// every non-permanent code retry with backoff up to max_attempts), so a game
// abort returns kErrorInvalidArgument - the non-retryable code the Unity
// SDK's bridge uses - and the completion reports it to GML as Aborted from
// the run's own flag.

namespace
{
	struct FirestoreTransactionRun
	{
		firebase::firestore::Firestore* firestore = nullptr;
		std::atomic<bool> aborted_by_game{ false };
	};

	struct FirestoreTransactionAttempt;
	using FirestoreTransactionCommand = std::function<void(firebase::firestore::Transaction&, FirestoreTransactionAttempt&)>;

	struct FirestoreTransactionAttempt
	{
		std::mutex mutex;
		std::condition_variable wake;
		std::deque<FirestoreTransactionCommand> commands;
		bool finished = false;
		firebase::firestore::Error result = firebase::firestore::kErrorOk;
		std::string message;
		std::shared_ptr<FirestoreTransactionRun> run;
	};

	std::map<uint32_t, std::shared_ptr<FirestoreTransactionAttempt>> g_fs_transaction_map;
	uint32_t g_fs_transaction_index = 0;

	void finishFirestoreTransaction(FirestoreTransactionAttempt& attempt, firebase::firestore::Error result, std::string message)
	{
		{
			std::lock_guard<std::mutex> lock(attempt.mutex);
			attempt.finished = true;
			attempt.result = result;
			attempt.message = std::move(message);
		}
		attempt.wake.notify_all();
	}

	// The GML thread's view of a handle. An attempt that finished on the
	// executor thread (a command that threw) is dropped here, on the thread
	// that owns every erase, and answers InvalidHandle from then on.
	std::shared_ptr<FirestoreTransactionAttempt> resolveFirestoreTransaction(uint64_t ref)
	{
		std::shared_ptr<FirestoreTransactionAttempt>* slot = nullptr;
		validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_TRANSACTION, std::shared_ptr<FirestoreTransactionAttempt>, g_fs_transaction_map, slot);
		if (slot == nullptr) return nullptr;

		std::shared_ptr<FirestoreTransactionAttempt> attempt = *slot;
		bool finished = false;
		{
			std::lock_guard<std::mutex> lock(attempt->mutex);
			finished = attempt->finished;
		}
		if (finished)
		{
			unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_transaction_map);
			setFirebaseLastError(GM_FB_ERROR_INVALID_HANDLE, "invalid handle");
			return nullptr;
		}
		return attempt;
	}

	void postFirestoreTransactionCommand(FirestoreTransactionAttempt& attempt, FirestoreTransactionCommand command)
	{
		{
			std::lock_guard<std::mutex> lock(attempt.mutex);
			attempt.commands.push_back(std::move(command));
		}
		attempt.wake.notify_one();
	}

	// The command runs later on the executor thread, after the game may have
	// released the document handle, so it takes a copy.
	bool copyFirestoreDocumentRef(uint64_t document_ref, firebase::firestore::DocumentReference& out)
	{
		firebase::firestore::DocumentReference* doc = nullptr;
		validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
		if (doc == nullptr) return false;
		out = *doc;
		return true;
	}

	// The update function, once per attempt on the SDK's transaction
	// executor; returns when the game has committed or aborted.
	firebase::firestore::Error runFirestoreTransactionAttempt(const std::shared_ptr<FirestoreTransactionRun>& run, const gm::wire::GMFunction& update_callback, firebase::firestore::Transaction& transaction, std::string& error_message)
	{
		auto attempt = std::make_shared<FirestoreTransactionAttempt>();
		attempt->run = run;
		uint32_t id = registerFirebaseValue(attempt, g_fs_transaction_index, g_fs_transaction_map);
		update_callback.call(packFirebaseRef(id, GM_FB_TYPE_FIRESTORE_TRANSACTION));

		for (;;)
		{
			FirestoreTransactionCommand command;
			{
				std::unique_lock<std::mutex> lock(attempt->mutex);
				attempt->wake.wait(lock, [&]
				{
					return attempt->finished || !attempt->commands.empty();
				});
				if (attempt->finished)
				{
					error_message = attempt->message;
					return attempt->result;
				}
				command = std::move(attempt->commands.front());
				attempt->commands.pop_front();
			}
#if defined(__cpp_exceptions)
			try
			{
				command(transaction, *attempt);
			}
			catch (const std::exception& e)
			{
				finishFirestoreTransaction(*attempt, firebase::firestore::kErrorInvalidArgument, e.what());
			}
#else
			command(transaction, *attempt);
#endif
		}
	}

	// Every attempt parked on `fs`, released so ~FirestoreInternal can join
	// its transaction executor. Called on the GML thread before the delete.
	void abortParkedFirestoreTransactions(firebase::firestore::Firestore* fs)
	{
		std::vector<std::shared_ptr<FirestoreTransactionAttempt>> parked;
		{
			std::lock_guard<std::mutex> lock(g_firebase_value_registry_mutex);
			for (auto it = g_fs_transaction_map.begin(); it != g_fs_transaction_map.end();)
			{
				if (it->second->run->firestore == fs)
				{
					parked.push_back(it->second);
					it = g_fs_transaction_map.erase(it);
				}
				else
				{
					++it;
				}
			}
		}
		for (const auto& attempt : parked)
			finishFirestoreTransaction(*attempt, firebase::firestore::kErrorInvalidArgument, "the Firestore instance was terminated");
	}
}

FirebaseError firebase_firestore_run_transaction(uint64_t instance_ref, double max_attempts, const std::optional<gm::wire::GMFunction>& update_callback, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::Firestore* fs = resolveFirestore(instance_ref);
	if (fs == nullptr) return FirebaseError::InvalidHandle;
	if (!update_callback.has_value())
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_firestore_run_transaction: update_callback is required");
		return FirebaseError::InvalidArgument;
	}
	if (!(max_attempts >= 1))
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_firestore_run_transaction: max_attempts must be at least 1");
		return FirebaseError::InvalidArgument;
	}

	auto run = std::make_shared<FirestoreTransactionRun>();
	run->firestore = fs;
	firebase::firestore::TransactionOptions options;
	options.set_max_attempts(max_attempts > INT32_MAX ? INT32_MAX : static_cast<int32_t>(max_attempts));
	gm::wire::GMFunction update = *update_callback;

	fs->RunTransaction(options, [run, update](firebase::firestore::Transaction& transaction, std::string& error_message) -> firebase::firestore::Error
	{
		return runFirestoreTransactionAttempt(run, update, transaction, error_message);
	}).OnCompletion([run, callback](const firebase::Future<void>& f)
	{
		if (!callback.has_value()) return;
		if (run->aborted_by_game && f.error() == firebase::firestore::kErrorInvalidArgument)
			callback->call(static_cast<double>(firebase::firestore::kErrorAborted), futureErrorMessage(f));
		else
			completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

FirebaseError firebase_firestore_transaction_get(uint64_t transaction_ref, uint64_t document_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	std::shared_ptr<FirestoreTransactionAttempt> attempt = resolveFirestoreTransaction(transaction_ref);
	if (!attempt) return FirebaseError::InvalidHandle;
	firebase::firestore::DocumentReference doc;
	if (!copyFirestoreDocumentRef(document_ref, doc)) return FirebaseError::InvalidHandle;

	postFirestoreTransactionCommand(*attempt, [doc, callback](firebase::firestore::Transaction& transaction, FirestoreTransactionAttempt&)
	{
		firebase::firestore::Error error = firebase::firestore::kErrorOk;
		std::string message;
		firebase::firestore::DocumentSnapshot snapshot = transaction.Get(doc, &error, &message);
		if (!callback.has_value()) return;
		std::optional<uint64_t> snapshot_ref;
		if (error == firebase::firestore::kErrorOk) snapshot_ref = registerFirestoreDocSnapshot(snapshot);
		callback->call(static_cast<double>(error), message, snapshot_ref);
	});
	return FirebaseError::Ok;
}

bool firebase_firestore_transaction_set(uint64_t transaction_ref, uint64_t document_ref, const gm::wire::GMValue& data)
{
	std::shared_ptr<FirestoreTransactionAttempt> attempt = resolveFirestoreTransaction(transaction_ref);
	if (!attempt) return false;
	firebase::firestore::DocumentReference doc;
	if (!copyFirestoreDocumentRef(document_ref, doc)) return false;

	postFirestoreTransactionCommand(*attempt, [doc, fields = gmValueToMapFieldValue(data)](firebase::firestore::Transaction& transaction, FirestoreTransactionAttempt&)
	{
		transaction.Set(doc, fields);
	});
	return true;
}

bool firebase_firestore_transaction_set_merge(uint64_t transaction_ref, uint64_t document_ref, const gm::wire::GMValue& data)
{
	std::shared_ptr<FirestoreTransactionAttempt> attempt = resolveFirestoreTransaction(transaction_ref);
	if (!attempt) return false;
	firebase::firestore::DocumentReference doc;
	if (!copyFirestoreDocumentRef(document_ref, doc)) return false;

	postFirestoreTransactionCommand(*attempt, [doc, fields = gmValueToMapFieldValue(data)](firebase::firestore::Transaction& transaction, FirestoreTransactionAttempt&)
	{
		transaction.Set(doc, fields, firebase::firestore::SetOptions::Merge());
	});
	return true;
}

bool firebase_firestore_transaction_set_merge_fields(uint64_t transaction_ref, uint64_t document_ref, const gm::wire::GMValue& data, const std::vector<std::string_view>& fields)
{
	std::shared_ptr<FirestoreTransactionAttempt> attempt = resolveFirestoreTransaction(transaction_ref);
	if (!attempt) return false;
	firebase::firestore::DocumentReference doc;
	if (!copyFirestoreDocumentRef(document_ref, doc)) return false;

	auto options = firebase::firestore::SetOptions::MergeFields(toStringVector(fields));
	postFirestoreTransactionCommand(*attempt, [doc, values = gmValueToMapFieldValue(data), options](firebase::firestore::Transaction& transaction, FirestoreTransactionAttempt&)
	{
		transaction.Set(doc, values, options);
	});
	return true;
}

bool firebase_firestore_transaction_update(uint64_t transaction_ref, uint64_t document_ref, const gm::wire::GMValue& data)
{
	std::shared_ptr<FirestoreTransactionAttempt> attempt = resolveFirestoreTransaction(transaction_ref);
	if (!attempt) return false;
	firebase::firestore::DocumentReference doc;
	if (!copyFirestoreDocumentRef(document_ref, doc)) return false;

	postFirestoreTransactionCommand(*attempt, [doc, fields = gmValueToMapFieldValue(data)](firebase::firestore::Transaction& transaction, FirestoreTransactionAttempt&)
	{
		transaction.Update(doc, fields);
	});
	return true;
}

bool firebase_firestore_transaction_delete(uint64_t transaction_ref, uint64_t document_ref)
{
	std::shared_ptr<FirestoreTransactionAttempt> attempt = resolveFirestoreTransaction(transaction_ref);
	if (!attempt) return false;
	firebase::firestore::DocumentReference doc;
	if (!copyFirestoreDocumentRef(document_ref, doc)) return false;

	postFirestoreTransactionCommand(*attempt, [doc](firebase::firestore::Transaction& transaction, FirestoreTransactionAttempt&)
	{
		transaction.Delete(doc);
	});
	return true;
}

// The handle is gone the moment the game commits or aborts; the command
// itself runs after every read and write posted before it.
bool firebase_firestore_transaction_commit(uint64_t transaction_ref)
{
	std::shared_ptr<FirestoreTransactionAttempt> attempt = resolveFirestoreTransaction(transaction_ref);
	if (!attempt) return false;
	unregisterFirebaseValue(gm_fb_ref_id(transaction_ref), g_fs_transaction_map);

	postFirestoreTransactionCommand(*attempt, [](firebase::firestore::Transaction&, FirestoreTransactionAttempt& a)
	{
		finishFirestoreTransaction(a, firebase::firestore::kErrorOk, std::string());
	});
	return true;
}

bool firebase_firestore_transaction_abort(uint64_t transaction_ref, std::string_view error_message)
{
	std::shared_ptr<FirestoreTransactionAttempt> attempt = resolveFirestoreTransaction(transaction_ref);
	if (!attempt) return false;
	unregisterFirebaseValue(gm_fb_ref_id(transaction_ref), g_fs_transaction_map);

	postFirestoreTransactionCommand(*attempt, [message = std::string(error_message)](firebase::firestore::Transaction&, FirestoreTransactionAttempt& a)
	{
		a.run->aborted_by_game = true;
		finishFirestoreTransaction(a, firebase::firestore::kErrorInvalidArgument, message);
	});
	return true;
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

FirebaseError firebase_firestore_collection_ref_add(uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::CollectionReference* col = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_COL_REF, firebase::firestore::CollectionReference, g_fs_col_ref_map, col);
	if (col == nullptr) return FirebaseError::InvalidHandle;

	firebase::firestore::MapFieldValue map = gmValueToMapFieldValue(data);
	col->Add(map).OnCompletion([callback](const firebase::Future<firebase::firestore::DocumentReference>& f)
	{
		completeFuture(callback, f, [](const firebase::firestore::DocumentReference& doc) -> std::optional<uint64_t>
		{
			return registerFirestoreDocRef(doc);
		});
	});
	return FirebaseError::Ok;
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
		setFirebaseLastError(GM_FB_ERROR_INVALID_HANDLE, "invalid handle");
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

FirebaseError firebase_firestore_document_ref_get(uint64_t ref, FirestoreSource source, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return FirebaseError::InvalidHandle;

	firebase::firestore::Source src;
	if (!toSdkSource(source, src))
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_firestore_document_ref_get: source must be a FirestoreSource value");
		return FirebaseError::InvalidArgument;
	}
	doc->Get(src).OnCompletion([callback](const firebase::Future<firebase::firestore::DocumentSnapshot>& f)
	{
		completeFuture(callback, f, [](const firebase::firestore::DocumentSnapshot& snapshot) -> std::optional<uint64_t>
		{
			return registerFirestoreDocSnapshot(snapshot);
		});
	});
	return FirebaseError::Ok;
}

FirebaseError firebase_firestore_document_ref_set(uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return FirebaseError::InvalidHandle;

	doc->Set(gmValueToMapFieldValue(data)).OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

FirebaseError firebase_firestore_document_ref_set_merge(uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return FirebaseError::InvalidHandle;

	doc->Set(gmValueToMapFieldValue(data), firebase::firestore::SetOptions::Merge()).OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

FirebaseError firebase_firestore_document_ref_set_merge_fields(uint64_t ref, const gm::wire::GMValue& data, const std::vector<std::string_view>& fields, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return FirebaseError::InvalidHandle;

	auto options = firebase::firestore::SetOptions::MergeFields(toStringVector(fields));
	doc->Set(gmValueToMapFieldValue(data), options).OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

FirebaseError firebase_firestore_document_ref_update(uint64_t ref, const gm::wire::GMValue& data, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return FirebaseError::InvalidHandle;

	doc->Update(gmValueToMapFieldValue(data)).OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

FirebaseError firebase_firestore_document_ref_delete(uint64_t ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return FirebaseError::InvalidHandle;

	doc->Delete().OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

// Returns a GM_FB_TYPE_FIRESTORE_LISTENER_REG ref for
// firebase_firestore_listener_registration_remove(). Firebase invokes the listener on
// its own background/UI thread; GMFunction::call() is internally
// mutex-guarded, so `cb` is dispatched directly with no extra queue.
uint64_t firebase_firestore_document_ref_add_snapshot_listener(uint64_t ref, bool include_metadata_changes, const std::optional<gm::wire::GMFunction>& callback)
{
	if (!callback.has_value())
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_firestore_document_ref_add_snapshot_listener: a callback is required");
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
		setFirebaseLastError(GM_FB_ERROR_INVALID_HANDLE, "invalid handle");
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

uint64_t firebase_firestore_query_order_by(uint64_t ref, std::string_view field, FirestoreDirection direction)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	firebase::firestore::Query::Direction dir;
	if (!toSdkDirection(direction, dir))
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_firestore_query_order_by: direction must be a FirestoreDirection value");
		return 0;
	}
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

FirebaseError firebase_firestore_query_get(uint64_t ref, FirestoreSource source, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return FirebaseError::InvalidHandle;

	firebase::firestore::Source src;
	if (!toSdkSource(source, src))
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_firestore_query_get: source must be a FirestoreSource value");
		return FirebaseError::InvalidArgument;
	}
	q.Get(src).OnCompletion([callback](const firebase::Future<firebase::firestore::QuerySnapshot>& f)
	{
		completeFuture(callback, f, [](const firebase::firestore::QuerySnapshot& snapshot) -> std::optional<uint64_t>
		{
			return registerFirestoreQuerySnapshot(snapshot);
		});
	});
	return FirebaseError::Ok;
}

// Returns a GM_FB_TYPE_FIRESTORE_LISTENER_REG ref for
// firebase_firestore_listener_registration_remove().
uint64_t firebase_firestore_query_add_snapshot_listener(uint64_t ref, bool include_metadata_changes, const std::optional<gm::wire::GMFunction>& callback)
{
	if (!callback.has_value())
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_firestore_query_add_snapshot_listener: a callback is required");
		return 0;
	}

	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;

	auto mc = include_metadata_changes ? firebase::firestore::MetadataChanges::kInclude : firebase::firestore::MetadataChanges::kExclude;
	gm::wire::GMFunction cb = callback.value();

	firebase::firestore::ListenerRegistration* reg = new firebase::firestore::ListenerRegistration(
		q.AddSnapshotListener(mc, [cb](const firebase::firestore::QuerySnapshot& snapshot, firebase::firestore::Error error, const std::string& error_message)
	{
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
		setFirebaseLastError(GM_FB_ERROR_INVALID_HANDLE, "invalid handle");
		return;
	}
	unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_query_map);
}

// ============================================================
// WriteBatch
// ============================================================

bool firebase_firestore_write_batch_set(uint64_t batch_ref, uint64_t document_ref, const gm::wire::GMValue& data)
{
	firebase::firestore::WriteBatch* batch = nullptr;
	validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, batch);
	if (batch == nullptr) return false;

	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return false;

	batch->Set(*doc, gmValueToMapFieldValue(data));
	return true;
}

bool firebase_firestore_write_batch_set_merge(uint64_t batch_ref, uint64_t document_ref, const gm::wire::GMValue& data)
{
	firebase::firestore::WriteBatch* batch = nullptr;
	validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, batch);
	if (batch == nullptr) return false;

	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return false;

	batch->Set(*doc, gmValueToMapFieldValue(data), firebase::firestore::SetOptions::Merge());
	return true;
}

bool firebase_firestore_write_batch_set_merge_fields(uint64_t batch_ref, uint64_t document_ref, const gm::wire::GMValue& data, const std::vector<std::string_view>& fields)
{
	firebase::firestore::WriteBatch* batch = nullptr;
	validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, batch);
	if (batch == nullptr) return false;

	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return false;

	auto options = firebase::firestore::SetOptions::MergeFields(toStringVector(fields));
	batch->Set(*doc, gmValueToMapFieldValue(data), options);
	return true;
}

bool firebase_firestore_write_batch_update(uint64_t batch_ref, uint64_t document_ref, const gm::wire::GMValue& data)
{
	firebase::firestore::WriteBatch* batch = nullptr;
	validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, batch);
	if (batch == nullptr) return false;

	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return false;

	batch->Update(*doc, gmValueToMapFieldValue(data));
	return true;
}

bool firebase_firestore_write_batch_delete(uint64_t batch_ref, uint64_t document_ref)
{
	firebase::firestore::WriteBatch* batch = nullptr;
	validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, batch);
	if (batch == nullptr) return false;

	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (doc == nullptr) return false;

	batch->Delete(*doc);
	return true;
}

FirebaseError firebase_firestore_write_batch_commit(uint64_t batch_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::WriteBatch* batch = nullptr;
	validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, batch);
	if (batch == nullptr) return FirebaseError::InvalidHandle;

	batch->Commit().OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

void firebase_firestore_write_batch_release(uint64_t batch_ref)
{
	if (gm_fb_ref_ext(batch_ref) != GM_FIREBASE_EXT || gm_fb_ref_type(batch_ref) != GM_FB_TYPE_FIRESTORE_WRITE_BATCH)
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_HANDLE, "invalid handle");
		return;
	}
	unregisterFirebaseValue(gm_fb_ref_id(batch_ref), g_fs_write_batch_map);
}

// ============================================================
// Firebase C++ 13.11: FieldPath, Filter, aggregate queries, bundles
// ============================================================

namespace
{
	firebase::firestore::FieldPath* resolveFieldPath(uint64_t ref)
	{
		firebase::firestore::FieldPath* out = nullptr;
		validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_FIELD_PATH, firebase::firestore::FieldPath, g_fs_field_path_map, out);
		return out;
	}

	firebase::firestore::Filter* resolveFilter(uint64_t ref)
	{
		firebase::firestore::Filter* out = nullptr;
		validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_FILTER, firebase::firestore::Filter, g_fs_filter_map, out);
		return out;
	}

	firebase::firestore::AggregateQuery* resolveAggregateQuery(uint64_t ref)
	{
		firebase::firestore::AggregateQuery* out = nullptr;
		validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_AGG_QUERY, firebase::firestore::AggregateQuery, g_fs_aggregate_query_map, out);
		return out;
	}

	firebase::firestore::AggregateQuerySnapshot* resolveAggregateSnapshot(uint64_t ref)
	{
		firebase::firestore::AggregateQuerySnapshot* out = nullptr;
		validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_AGG_SNAPSHOT, firebase::firestore::AggregateQuerySnapshot, g_fs_aggregate_snapshot_map, out);
		return out;
	}

	// Handle arrays arrive as uint64[]; an unknown handle is skipped, as before.
	std::vector<firebase::firestore::FieldPath> toFieldPathVector(const std::vector<uint64_t>& refs)
	{
		std::vector<firebase::firestore::FieldPath> out;
		out.reserve(refs.size());
		for (uint64_t ref : refs)
		{
			auto* fp = resolveFieldPath(ref);
			if (fp) out.push_back(*fp);
		}
		return out;
	}

	std::vector<firebase::firestore::Filter> toFilterVector(const std::vector<uint64_t>& refs)
	{
		std::vector<firebase::firestore::Filter> out;
		out.reserve(refs.size());
		for (uint64_t ref : refs)
		{
			auto* filter = resolveFilter(ref);
			if (filter) out.push_back(*filter);
		}
		return out;
	}

	gm_structs::FirestoreLoadBundleTaskProgress makeLoadBundleProgress(const firebase::firestore::LoadBundleTaskProgress& p)
	{
		gm_structs::FirestoreLoadBundleTaskProgress out;
		out.documents_loaded = static_cast<double>(p.documents_loaded());
		out.total_documents = static_cast<double>(p.total_documents());
		out.bytes_loaded = static_cast<double>(p.bytes_loaded());
		out.total_bytes = static_cast<double>(p.total_bytes());
		out.state = static_cast<gm_enums::FirestoreLoadBundleTaskState>(p.state());
		return out;
	}
}

uint64_t firebase_firestore_field_path_create(const std::vector<std::string_view>& components)
{
	return registerFirestoreFieldPath(firebase::firestore::FieldPath(toStringVector(components)));
}

uint64_t firebase_firestore_field_path_document_id()
{
	return registerFirestoreFieldPath(firebase::firestore::FieldPath::DocumentId());
}

bool firebase_firestore_field_path_is_valid(uint64_t ref)
{
	auto* value = resolveFieldPath(ref);
	return value && value->is_valid();
}

std::string firebase_firestore_field_path_to_string(uint64_t ref)
{
	auto* value = resolveFieldPath(ref);
	return value ? value->ToString() : std::string();
}

void firebase_firestore_field_path_release(uint64_t ref)
{
	if (gm_fb_ref_ext(ref) == GM_FIREBASE_EXT && gm_fb_ref_type(ref) == GM_FB_TYPE_FIRESTORE_FIELD_PATH)
		unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_field_path_map);
	else
		setFirebaseLastError(GM_FB_ERROR_INVALID_HANDLE, "invalid Firestore FieldPath handle");
}

#define GM_FS_FILTER_STRING_ONE(fn_name, sdk_name) \
	uint64_t fn_name(std::string_view field, const gm::wire::GMValue& value) \
	{ \
		return registerFirestoreFilter(firebase::firestore::Filter::sdk_name(std::string(field), gmValueToFieldValue(value))); \
	}
#define GM_FS_FILTER_STRING_MANY(fn_name, sdk_name) \
	uint64_t fn_name(std::string_view field, const gm::wire::GMValue& values) \
	{ \
		return registerFirestoreFilter(firebase::firestore::Filter::sdk_name(std::string(field), gmValueToFieldValueVector(values))); \
	}
#define GM_FS_FILTER_PATH_ONE(fn_name, sdk_name) \
	uint64_t fn_name(uint64_t field_path_ref, const gm::wire::GMValue& value) \
	{ \
		auto* fp = resolveFieldPath(field_path_ref); \
		return fp ? registerFirestoreFilter(firebase::firestore::Filter::sdk_name(*fp, gmValueToFieldValue(value))) : 0; \
	}
#define GM_FS_FILTER_PATH_MANY(fn_name, sdk_name) \
	uint64_t fn_name(uint64_t field_path_ref, const gm::wire::GMValue& values) \
	{ \
		auto* fp = resolveFieldPath(field_path_ref); \
		return fp ? registerFirestoreFilter(firebase::firestore::Filter::sdk_name(*fp, gmValueToFieldValueVector(values))) : 0; \
	}

GM_FS_FILTER_STRING_ONE(firebase_firestore_filter_equal_to, EqualTo)
GM_FS_FILTER_STRING_ONE(firebase_firestore_filter_not_equal_to, NotEqualTo)
GM_FS_FILTER_STRING_ONE(firebase_firestore_filter_less_than, LessThan)
GM_FS_FILTER_STRING_ONE(firebase_firestore_filter_less_than_or_equal_to, LessThanOrEqualTo)
GM_FS_FILTER_STRING_ONE(firebase_firestore_filter_greater_than, GreaterThan)
GM_FS_FILTER_STRING_ONE(firebase_firestore_filter_greater_than_or_equal_to, GreaterThanOrEqualTo)
GM_FS_FILTER_STRING_ONE(firebase_firestore_filter_array_contains, ArrayContains)
GM_FS_FILTER_STRING_MANY(firebase_firestore_filter_array_contains_any, ArrayContainsAny)
GM_FS_FILTER_STRING_MANY(firebase_firestore_filter_in, In)
GM_FS_FILTER_STRING_MANY(firebase_firestore_filter_not_in, NotIn)
GM_FS_FILTER_PATH_ONE(firebase_firestore_filter_equal_to_field_path, EqualTo)
GM_FS_FILTER_PATH_ONE(firebase_firestore_filter_not_equal_to_field_path, NotEqualTo)
GM_FS_FILTER_PATH_ONE(firebase_firestore_filter_less_than_field_path, LessThan)
GM_FS_FILTER_PATH_ONE(firebase_firestore_filter_less_than_or_equal_to_field_path, LessThanOrEqualTo)
GM_FS_FILTER_PATH_ONE(firebase_firestore_filter_greater_than_field_path, GreaterThan)
GM_FS_FILTER_PATH_ONE(firebase_firestore_filter_greater_than_or_equal_to_field_path, GreaterThanOrEqualTo)
GM_FS_FILTER_PATH_ONE(firebase_firestore_filter_array_contains_field_path, ArrayContains)
GM_FS_FILTER_PATH_MANY(firebase_firestore_filter_array_contains_any_field_path, ArrayContainsAny)
GM_FS_FILTER_PATH_MANY(firebase_firestore_filter_in_field_path, In)
GM_FS_FILTER_PATH_MANY(firebase_firestore_filter_not_in_field_path, NotIn)

#undef GM_FS_FILTER_STRING_ONE
#undef GM_FS_FILTER_STRING_MANY
#undef GM_FS_FILTER_PATH_ONE
#undef GM_FS_FILTER_PATH_MANY

uint64_t firebase_firestore_filter_and(const std::vector<uint64_t>& filters)
{
	return registerFirestoreFilter(firebase::firestore::Filter::And(toFilterVector(filters)));
}
uint64_t firebase_firestore_filter_or(const std::vector<uint64_t>& filters)
{
	return registerFirestoreFilter(firebase::firestore::Filter::Or(toFilterVector(filters)));
}
void firebase_firestore_filter_release(uint64_t ref)
{
	if (gm_fb_ref_ext(ref) == GM_FIREBASE_EXT && gm_fb_ref_type(ref) == GM_FB_TYPE_FIRESTORE_FILTER)
		unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_filter_map);
	else
		setFirebaseLastError(GM_FB_ERROR_INVALID_HANDLE, "invalid Firestore Filter handle");
}

uint64_t firebase_firestore_query_where_filter(uint64_t ref, uint64_t filter_ref)
{
	firebase::firestore::Query q;
	auto* filter = resolveFilter(filter_ref);
	return (filter && resolveFirestoreQuery(ref, q)) ? registerFirestoreQuery(q.Where(*filter)) : 0;
}

#define GM_FS_QUERY_PATH_ONE(fn_name, sdk_name) \
	uint64_t fn_name(uint64_t ref, uint64_t field_path_ref, const gm::wire::GMValue& value) \
	{ \
		firebase::firestore::Query q; \
		auto* fp = resolveFieldPath(field_path_ref); \
		return (fp && resolveFirestoreQuery(ref, q)) ? registerFirestoreQuery(q.sdk_name(*fp, gmValueToFieldValue(value))) : 0; \
	}
#define GM_FS_QUERY_PATH_MANY(fn_name, sdk_name) \
	uint64_t fn_name(uint64_t ref, uint64_t field_path_ref, const gm::wire::GMValue& values) \
	{ \
		firebase::firestore::Query q; \
		auto* fp = resolveFieldPath(field_path_ref); \
		return (fp && resolveFirestoreQuery(ref, q)) ? registerFirestoreQuery(q.sdk_name(*fp, gmValueToFieldValueVector(values))) : 0; \
	}

GM_FS_QUERY_PATH_ONE(firebase_firestore_query_where_equal_to_field_path, WhereEqualTo)
GM_FS_QUERY_PATH_ONE(firebase_firestore_query_where_not_equal_to_field_path, WhereNotEqualTo)
GM_FS_QUERY_PATH_ONE(firebase_firestore_query_where_less_than_field_path, WhereLessThan)
GM_FS_QUERY_PATH_ONE(firebase_firestore_query_where_less_than_or_equal_to_field_path, WhereLessThanOrEqualTo)
GM_FS_QUERY_PATH_ONE(firebase_firestore_query_where_greater_than_field_path, WhereGreaterThan)
GM_FS_QUERY_PATH_ONE(firebase_firestore_query_where_greater_than_or_equal_to_field_path, WhereGreaterThanOrEqualTo)
GM_FS_QUERY_PATH_ONE(firebase_firestore_query_where_array_contains_field_path, WhereArrayContains)
GM_FS_QUERY_PATH_MANY(firebase_firestore_query_where_array_contains_any_field_path, WhereArrayContainsAny)
GM_FS_QUERY_PATH_MANY(firebase_firestore_query_where_in_field_path, WhereIn)
GM_FS_QUERY_PATH_MANY(firebase_firestore_query_where_not_in_field_path, WhereNotIn)
#undef GM_FS_QUERY_PATH_ONE
#undef GM_FS_QUERY_PATH_MANY

uint64_t firebase_firestore_query_order_by_field_path(uint64_t ref, uint64_t field_path_ref, FirestoreDirection direction)
{
	firebase::firestore::Query q;
	auto* fp = resolveFieldPath(field_path_ref);
	if (!fp || !resolveFirestoreQuery(ref, q)) return 0;
	firebase::firestore::Query::Direction dir;
	if (!toSdkDirection(direction, dir))
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_firestore_query_order_by_field_path: direction must be a FirestoreDirection value");
		return 0;
	}
	return registerFirestoreQuery(q.OrderBy(*fp, dir));
}

uint64_t firebase_firestore_query_count(uint64_t ref)
{
	firebase::firestore::Query q;
	return resolveFirestoreQuery(ref, q) ? registerFirestoreAggregateQuery(q.Count()) : 0;
}

uint64_t firebase_firestore_aggregate_query_get_query(uint64_t ref)
{
	auto* q = resolveAggregateQuery(ref);
	return q ? registerFirestoreQuery(q->query()) : 0;
}

bool firebase_firestore_aggregate_query_is_valid(uint64_t ref)
{
	auto* q = resolveAggregateQuery(ref);
	return q && q->is_valid();
}

FirebaseError firebase_firestore_aggregate_query_get(uint64_t ref, FirestoreAggregateSource source, const std::optional<gm::wire::GMFunction>& callback)
{
	auto* q = resolveAggregateQuery(ref);
	if (!q) return FirebaseError::InvalidHandle;
	firebase::firestore::AggregateSource src;
	if (!toSdkAggregateSource(source, src))
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_firestore_aggregate_query_get: source must be a FirestoreAggregateSource value");
		return FirebaseError::InvalidArgument;
	}
	q->Get(src).OnCompletion(
		[callback](const firebase::Future<firebase::firestore::AggregateQuerySnapshot>& f)
	{
		completeFuture(callback, f, [](const firebase::firestore::AggregateQuerySnapshot& snapshot) -> std::optional<uint64_t>
		{
			return registerFirestoreAggregateSnapshot(snapshot);
		});
	});
	return FirebaseError::Ok;
}

void firebase_firestore_aggregate_query_release(uint64_t ref)
{
	if (gm_fb_ref_ext(ref) == GM_FIREBASE_EXT && gm_fb_ref_type(ref) == GM_FB_TYPE_FIRESTORE_AGG_QUERY)
		unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_aggregate_query_map);
	else
		setFirebaseLastError(GM_FB_ERROR_INVALID_HANDLE, "invalid AggregateQuery handle");
}

double firebase_firestore_aggregate_snapshot_count(uint64_t ref)
{
	auto* s = resolveAggregateSnapshot(ref);
	return s ? static_cast<double>(s->count()) : 0.0;
}
uint64_t firebase_firestore_aggregate_snapshot_get_query(uint64_t ref)
{
	auto* s = resolveAggregateSnapshot(ref);
	return s ? registerFirestoreAggregateQuery(s->query()) : 0;
}
bool firebase_firestore_aggregate_snapshot_is_valid(uint64_t ref)
{
	auto* s = resolveAggregateSnapshot(ref);
	return s && s->is_valid();
}
void firebase_firestore_aggregate_snapshot_release(uint64_t ref)
{
	if (gm_fb_ref_ext(ref) == GM_FIREBASE_EXT && gm_fb_ref_type(ref) == GM_FB_TYPE_FIRESTORE_AGG_SNAPSHOT)
		unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_aggregate_snapshot_map);
	else
		setFirebaseLastError(GM_FB_ERROR_INVALID_HANDLE, "invalid AggregateQuerySnapshot handle");
}

uint64_t firebase_firestore_add_snapshots_in_sync_listener(uint64_t instance_ref, const std::optional<gm::wire::GMFunction>& callback)
{
	if (!callback.has_value())
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_firestore_add_snapshots_in_sync_listener: a callback is required");
		return 0;
	}

	auto* fs = resolveFirestore(instance_ref);
	if (!fs) return 0;
	gm::wire::GMFunction cb = callback.value();
	auto reg = fs->AddSnapshotsInSyncListener([cb]()
	{
		cb.call();
	});
	auto* boxed = new firebase::firestore::ListenerRegistration(std::move(reg));
	return registerFirebasePointer(boxed, GM_FB_TYPE_FIRESTORE_LISTENER_REG);
}

FirebaseError firebase_firestore_load_bundle(uint64_t instance_ref, GMBuffer bundle,
	const std::optional<gm::wire::GMFunction>& progress_callback,
	const std::optional<gm::wire::GMFunction>& callback)
{
	auto* fs = resolveFirestore(instance_ref);
	if (!fs) return FirebaseError::InvalidHandle;
	std::string bytes(static_cast<const char*>(bundle.data()), static_cast<size_t>(bundle.length()));
	auto progress = [progress_callback](const firebase::firestore::LoadBundleTaskProgress& p)
	{
		if (progress_callback) progress_callback->call(makeLoadBundleProgress(p));
	};
	firebase::Future<firebase::firestore::LoadBundleTaskProgress> future = progress_callback
		? fs->LoadBundle(bytes, progress)
		: fs->LoadBundle(bytes);
	future.OnCompletion([callback](const firebase::Future<firebase::firestore::LoadBundleTaskProgress>& f)
	{
		completeFuture(callback, f, [](const firebase::firestore::LoadBundleTaskProgress& p) -> std::optional<gm_structs::FirestoreLoadBundleTaskProgress>
		{
			return makeLoadBundleProgress(p);
		});
	});
	return FirebaseError::Ok;
}

FirebaseError firebase_firestore_named_query(uint64_t instance_ref, std::string_view name, const std::optional<gm::wire::GMFunction>& callback)
{
	auto* fs = resolveFirestore(instance_ref);
	if (!fs) return FirebaseError::InvalidHandle;
	fs->NamedQuery(std::string(name)).OnCompletion([callback](const firebase::Future<firebase::firestore::Query>& f)
	{
		// An unknown name completes without error and with an invalid Query.
		completeFuture(callback, f, [](const firebase::firestore::Query& query) -> std::optional<uint64_t>
		{
			if (!query.is_valid()) return std::nullopt;
			return registerFirestoreQuery(query);
		});
	});
	return FirebaseError::Ok;
}

// SetOptions::MergeFieldPaths variants.
FirebaseError firebase_firestore_document_ref_set_merge_field_paths(uint64_t ref, const gm::wire::GMValue& data,
	const std::vector<uint64_t>& field_paths, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (!doc) return FirebaseError::InvalidHandle;
	auto options = firebase::firestore::SetOptions::MergeFieldPaths(toFieldPathVector(field_paths));
	doc->Set(gmValueToMapFieldValue(data), options).OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

bool firebase_firestore_write_batch_set_merge_field_paths(uint64_t batch_ref, uint64_t document_ref,
	const gm::wire::GMValue& data, const std::vector<uint64_t>& field_paths)
{
	firebase::firestore::WriteBatch* batch = nullptr;
	validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, batch);
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (!batch || !doc) return false;
	batch->Set(*doc, gmValueToMapFieldValue(data), firebase::firestore::SetOptions::MergeFieldPaths(toFieldPathVector(field_paths)));
	return true;
}

bool firebase_firestore_transaction_set_merge_field_paths(uint64_t transaction_ref, uint64_t document_ref,
	const gm::wire::GMValue& data, const std::vector<uint64_t>& field_paths)
{
	std::shared_ptr<FirestoreTransactionAttempt> attempt = resolveFirestoreTransaction(transaction_ref);
	if (!attempt) return false;
	firebase::firestore::DocumentReference doc;
	if (!copyFirestoreDocumentRef(document_ref, doc)) return false;

	auto options = firebase::firestore::SetOptions::MergeFieldPaths(toFieldPathVector(field_paths));
	postFirestoreTransactionCommand(*attempt, [doc, values = gmValueToMapFieldValue(data), options](firebase::firestore::Transaction& transaction, FirestoreTransactionAttempt&)
	{
		transaction.Set(doc, values, options);
	});
	return true;
}

// ============================================================
// Remaining value-object/accessor coverage
// ============================================================

namespace
{
	firebase::firestore::FieldValue* resolveFieldValueHandle(uint64_t ref)
	{
		firebase::firestore::FieldValue* out = nullptr;
		validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_FIELD_VALUE, firebase::firestore::FieldValue, g_fs_field_value_map, out);
		return out;
	}
}

firebase::firestore::MapFieldPathValue gmToMapFieldPathValue(const std::vector<gm_structs::FirestoreFieldPathValue>& entries)
{
	firebase::firestore::MapFieldPathValue out;
	for (const gm_structs::FirestoreFieldPathValue& entry : entries)
	{
		auto* path = resolveFieldPath(entry.field_path);
		if (path) out.emplace(*path, gmValueToFieldValue(gmValueView(entry.value)));
	}
	return out;
}

// Null for a handle that does not resolve (InvalidHandle is already recorded),
// which is also what the SDK's type() answers for an invalid value.
gm_enums::FirestoreFieldValueType firebase_firestore_field_value_type(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	return v ? static_cast<FirestoreFieldValueType>(v->type()) : FirestoreFieldValueType::Null;
}
bool firebase_firestore_field_value_is_valid(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	return v && v->is_valid();
}
bool firebase_firestore_field_value_is_null(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	return v && v->is_null();
}
bool firebase_firestore_field_value_is_boolean(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	return v && v->is_boolean();
}
bool firebase_firestore_field_value_is_integer(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	return v && v->is_integer();
}
bool firebase_firestore_field_value_is_double(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	return v && v->is_double();
}
bool firebase_firestore_field_value_is_timestamp(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	return v && v->is_timestamp();
}
bool firebase_firestore_field_value_is_string(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	return v && v->is_string();
}
bool firebase_firestore_field_value_is_blob(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	return v && v->is_blob();
}
bool firebase_firestore_field_value_is_reference(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	return v && v->is_reference();
}
bool firebase_firestore_field_value_is_geo_point(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	return v && v->is_geo_point();
}
bool firebase_firestore_field_value_is_array(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	return v && v->is_array();
}
bool firebase_firestore_field_value_is_map(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	return v && v->is_map();
}
bool firebase_firestore_field_value_boolean_value(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	return v && v->is_boolean() ? v->boolean_value() : false;
}
double firebase_firestore_field_value_integer_value(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	return v && v->is_integer() ? static_cast<double>(v->integer_value()) : 0;
}
double firebase_firestore_field_value_double_value(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	return v && v->is_double() ? v->double_value() : 0;
}
std::string firebase_firestore_field_value_string_value(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	return v && v->is_string() ? v->string_value() : std::string();
}
double firebase_firestore_field_value_blob_size(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	return v && v->is_blob() ? static_cast<double>(v->blob_size()) : 0;
}
double firebase_firestore_field_value_blob_copy(uint64_t ref, GMBuffer out_buffer)
{
	auto* v = resolveFieldValueHandle(ref);
	if (!v || !v->is_blob()) return 0.0;
	size_t n = std::min(v->blob_size(), static_cast<size_t>(out_buffer.length()));
	if (n) std::memcpy(out_buffer.data(), v->blob_value(), n);
	return static_cast<double>(n);
}
uint64_t firebase_firestore_field_value_reference_value(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	return v && v->is_reference() ? registerFirestoreDocRef(v->reference_value()) : 0;
}
std::optional<gm_structs::FirestoreTimestamp> firebase_firestore_field_value_timestamp_value(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	if (!v || !v->is_timestamp()) return std::nullopt;
	return makeFirestoreTimestamp(v->timestamp_value());
}
std::optional<gm_structs::FirestoreGeoPoint> firebase_firestore_field_value_geo_point_value(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	if (!v || !v->is_geo_point()) return std::nullopt;
	return makeFirestoreGeoPoint(v->geo_point_value());
}
gm::wire::DataStream firebase_firestore_field_value_array_value(uint64_t ref)
{
	gm::wire::ArrayStream a;
	auto* v = resolveFieldValueHandle(ref);
	if (v && v->is_array())
		for (const auto& x : v->array_value())
			pushFieldValueToArray(x, a, 0);
	gm::wire::DataStream out;
	out << a;
	return out;
}
gm::wire::DataStream firebase_firestore_field_value_map_value(uint64_t ref)
{
	gm::wire::StructStream s;
	auto* v = resolveFieldValueHandle(ref);
	if (v && v->is_map())
		for (const auto& kv : v->map_value())
			addFieldValueToStruct(kv.first.c_str(), kv.second, s, 0);
	gm::wire::DataStream out;
	out << s;
	return out;
}
std::string firebase_firestore_field_value_to_string(uint64_t ref)
{
	auto* v = resolveFieldValueHandle(ref);
	return v ? v->ToString() : std::string();
}

uint64_t firebase_firestore_query_get_firestore(uint64_t ref)
{
	firebase::firestore::Query q;
	if (!resolveFirestoreQuery(ref, q)) return 0;
	auto* fs = q.firestore();
	return fs ? registerFirebasePointer(fs, GM_FB_TYPE_FIRESTORE) : 0;
}
uint64_t firebase_firestore_document_ref_get_firestore(uint64_t ref)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	auto* fs = doc ? doc->firestore() : nullptr;
	return fs ? registerFirebasePointer(fs, GM_FB_TYPE_FIRESTORE) : 0;
}
std::string firebase_firestore_document_ref_to_string(uint64_t ref)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	return doc ? doc->ToString() : std::string();
}

FirebaseError firebase_firestore_document_ref_update_field_paths(uint64_t ref, const std::vector<gm_structs::FirestoreFieldPathValue>& entries, const std::optional<gm::wire::GMFunction>& callback)
{
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (!doc) return FirebaseError::InvalidHandle;
	doc->Update(gmToMapFieldPathValue(entries)).OnCompletion([callback](const firebase::Future<void>& f)
	{
		completeFuture(callback, f);
	});
	return FirebaseError::Ok;
}

bool firebase_firestore_write_batch_update_field_paths(uint64_t batch_ref, uint64_t document_ref, const std::vector<gm_structs::FirestoreFieldPathValue>& entries)
{
	firebase::firestore::WriteBatch* batch = nullptr;
	validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, batch);
	firebase::firestore::DocumentReference* doc = nullptr;
	validate_fb_ref_map(document_ref, GM_FB_TYPE_FIRESTORE_DOC_REF, firebase::firestore::DocumentReference, g_fs_doc_ref_map, doc);
	if (!batch || !doc) return false;
	batch->Update(*doc, gmToMapFieldPathValue(entries));
	return true;
}

bool firebase_firestore_transaction_update_field_paths(uint64_t transaction_ref, uint64_t document_ref, const std::vector<gm_structs::FirestoreFieldPathValue>& entries)
{
	std::shared_ptr<FirestoreTransactionAttempt> attempt = resolveFirestoreTransaction(transaction_ref);
	if (!attempt) return false;
	firebase::firestore::DocumentReference doc;
	if (!copyFirestoreDocumentRef(document_ref, doc)) return false;

	postFirestoreTransactionCommand(*attempt, [doc, fields = gmToMapFieldPathValue(entries)](firebase::firestore::Transaction& transaction, FirestoreTransactionAttempt&)
	{
		transaction.Update(doc, fields);
	});
	return true;
}

bool firebase_firestore_write_batch_is_valid(uint64_t batch_ref)
{
	firebase::firestore::WriteBatch* batch = nullptr;
	validate_fb_ref_map(batch_ref, GM_FB_TYPE_FIRESTORE_WRITE_BATCH, firebase::firestore::WriteBatch, g_fs_write_batch_map, batch);
	return batch && batch->is_valid();
}

std::string firebase_firestore_settings_to_string(uint64_t instance_ref)
{
	auto* fs = resolveFirestore(instance_ref);
	return fs ? fs->settings().ToString() : std::string();
}

uint64_t firebase_firestore_get_app(uint64_t instance_ref)
{
	auto* fs = resolveFirestore(instance_ref);
	return fs ? wrapFirebaseApp(fs->app()) : 0;
}

uint64_t firebase_firestore_get_instance_for_app(uint64_t app_ref)
{
	auto* app = resolveFirebaseApp(app_ref);
	if (!app) return 0;
	firebase::InitResult result = firebase::kInitResultSuccess;
	auto* fs = firebase::firestore::Firestore::GetInstance(app, &result);
	if (!fs || result != firebase::kInitResultSuccess)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, firebaseInitResultMessage("failed to get Firestore instance for app", result));
		return 0;
	}
	return registerFirebasePointer(fs, GM_FB_TYPE_FIRESTORE);
}

uint64_t firebase_firestore_get_instance_for_app_database(uint64_t app_ref, std::string_view database_id)
{
	auto* app = resolveFirebaseApp(app_ref);
	if (!app) return 0;
	firebase::InitResult result = firebase::kInitResultSuccess;
	std::string db(database_id);
	auto* fs = firebase::firestore::Firestore::GetInstance(app, db.c_str(), &result);
	if (!fs || result != firebase::kInitResultSuccess)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, firebaseInitResultMessage("failed to get Firestore instance for app/database", result));
		return 0;
	}
	return registerFirebasePointer(fs, GM_FB_TYPE_FIRESTORE);
}

uint64_t firebase_firestore_field_value_boolean(bool value)
{
	return registerFirestoreFieldValue(firebase::firestore::FieldValue::Boolean(value));
}
uint64_t firebase_firestore_field_value_string(std::string_view value)
{
	return registerFirestoreFieldValue(firebase::firestore::FieldValue::String(std::string(value)));
}
uint64_t firebase_firestore_field_value_array(const gm::wire::GMValue& value)
{
	return registerFirestoreFieldValue(firebase::firestore::FieldValue::Array(gmValueToFieldValueVector(value)));
}
uint64_t firebase_firestore_field_value_map(const gm::wire::GMValue& value)
{
	return registerFirestoreFieldValue(firebase::firestore::FieldValue::Map(gmValueToMapFieldValue(value)));
}
