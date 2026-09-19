// Cloud Firestore - DocumentSnapshot, QuerySnapshot and ListenerRegistration
// removal. Shares GMFirebase_firestore.h's registries/converters with
// GMFirebase_firestore.cpp (e.g. AddSnapshotListener there registers the
// DocumentSnapshot/QuerySnapshot values this file's accessors read back).
#include "GMFirebase_firestore.h"
#include <utility>

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

// ============================================================
// Enum mirrors (see GM_FB_PIN_ENUM in GMFirebase_common.h)
// ============================================================

GM_FB_PIN_ENUM(FirestoreServerTimestampBehavior::None, firebase::firestore::DocumentSnapshot::ServerTimestampBehavior::kNone);
GM_FB_PIN_ENUM(FirestoreServerTimestampBehavior::Estimate, firebase::firestore::DocumentSnapshot::ServerTimestampBehavior::kEstimate);
GM_FB_PIN_ENUM(FirestoreServerTimestampBehavior::Previous, firebase::firestore::DocumentSnapshot::ServerTimestampBehavior::kPrevious);
// The SDK's kDefault is an alias of kNone, not a fourth value.
GM_FB_PIN_ENUM(FirestoreServerTimestampBehavior::None, firebase::firestore::DocumentSnapshot::ServerTimestampBehavior::kDefault);
GM_FB_PIN_ENUM(FirestoreDocumentChangeType::Added, firebase::firestore::DocumentChange::Type::kAdded);
GM_FB_PIN_ENUM(FirestoreDocumentChangeType::Modified, firebase::firestore::DocumentChange::Type::kModified);
GM_FB_PIN_ENUM(FirestoreDocumentChangeType::Removed, firebase::firestore::DocumentChange::Type::kRemoved);

// GML -> SDK. False for anything outside the enum; the caller records
// InvalidArgument.
static bool toSdkServerTimestampBehavior(FirestoreServerTimestampBehavior behavior, firebase::firestore::DocumentSnapshot::ServerTimestampBehavior& out)
{
	using Sdk = firebase::firestore::DocumentSnapshot::ServerTimestampBehavior;
	switch (behavior)
	{
	case FirestoreServerTimestampBehavior::None: out = Sdk::kNone; return true;
	case FirestoreServerTimestampBehavior::Estimate: out = Sdk::kEstimate; return true;
	case FirestoreServerTimestampBehavior::Previous: out = Sdk::kPrevious; return true;
	default: return false;
	}
}

// ============================================================
// Value-copy registries (declared extern in GMFirebase_firestore.h)
// ============================================================

std::map<uint32_t, firebase::firestore::DocumentSnapshot> g_fs_doc_snapshot_map;
uint32_t g_fs_doc_snapshot_index = 0;

std::map<uint32_t, firebase::firestore::QuerySnapshot> g_fs_query_snapshot_map;
uint32_t g_fs_query_snapshot_index = 0;

uint64_t registerFirestoreDocSnapshot(const firebase::firestore::DocumentSnapshot& snapshot)
{
	uint32_t id = registerFirebaseValue(snapshot, g_fs_doc_snapshot_index, g_fs_doc_snapshot_map);
	return packFirebaseRef(id, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT);
}

uint64_t registerFirestoreQuerySnapshot(const firebase::firestore::QuerySnapshot& snapshot)
{
	uint32_t id = registerFirebaseValue(snapshot, g_fs_query_snapshot_index, g_fs_query_snapshot_map);
	return packFirebaseRef(id, GM_FB_TYPE_FIRESTORE_QUERY_SNAPSHOT);
}

// ============================================================
// DocumentSnapshot
// ============================================================

// The snapshot's scalars (exists, id, metadata flags) in a single call. It
// carries no handle: firebase_firestore_document_snapshot_reference() is the
// getter that registers one the caller owns. undefined for a handle that does
// not resolve (InvalidHandle is already recorded).
std::optional<FirestoreDocumentSnapshotInfo> firebase_firestore_document_snapshot_get_info(uint64_t ref)
{
	firebase::firestore::DocumentSnapshot* snap = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
	if (snap == nullptr) return std::nullopt;

	FirestoreDocumentSnapshotInfo out{};
	out.exists = snap->exists();
	out.id = snap->id();
	out.has_pending_writes = snap->metadata().has_pending_writes();
	out.is_from_cache = snap->metadata().is_from_cache();

	return out;
}

namespace
{
	// exists distinguishes a missing field from a present Firestore null; the
	// value is undefined in both cases. An invalid FieldValue is what Get()
	// returns for a missing field. A snapshot that does not resolve is not a
	// lookup at all - the callers return undefined for that.
	gm_structs::FirestoreFieldLookup makeFieldLookup(const firebase::firestore::FieldValue& value, uint64_t owner_snapshot)
	{
		gm_structs::FirestoreFieldLookup out;
		out.exists = value.is_valid();
		if (out.exists)
			writeFieldValueToStream(value, out.value, owner_snapshot);
		else
			out.value << std::optional<std::uint8_t>{};
		return out;
	}
}

// See GMFirebase_firestore.h's converter section for how composite value
// kinds (Timestamp/GeoPoint/Blob/Reference/Array/Map) are encoded.
std::optional<gm_structs::FirestoreFieldLookup> firebase_firestore_document_snapshot_get(uint64_t ref, std::string_view field, FirestoreServerTimestampBehavior server_timestamp_behavior)
{
	firebase::firestore::DocumentSnapshot* snap = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
	if (snap == nullptr)
		return std::nullopt;

	firebase::firestore::DocumentSnapshot::ServerTimestampBehavior stb;
	if (!toSdkServerTimestampBehavior(server_timestamp_behavior, stb))
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_firestore_document_snapshot_get: server_timestamp_behavior must be a FirestoreServerTimestampBehavior value");
		return std::nullopt;
	}
	std::string field_name(field);
	return makeFieldLookup(snap->Get(field_name.c_str(), stb), ref);
}

// Returns the full field map as a struct, field name -> converted value.
gm::wire::DataStream firebase_firestore_document_snapshot_get_data(uint64_t ref, FirestoreServerTimestampBehavior server_timestamp_behavior)
{
	gm::wire::StructStream result;

	firebase::firestore::DocumentSnapshot* snap = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
	if (snap != nullptr)
	{
		firebase::firestore::DocumentSnapshot::ServerTimestampBehavior stb;
		if (toSdkServerTimestampBehavior(server_timestamp_behavior, stb))
		{
			firebase::firestore::MapFieldValue data = snap->GetData(stb);
			for (const auto& kv : data)
				addFieldValueToStruct(kv.first.c_str(), kv.second, result, ref);
		}
		else
			setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_firestore_document_snapshot_get_data: server_timestamp_behavior must be a FirestoreServerTimestampBehavior value");
	}

	gm::wire::DataStream out;
	out << result;
	return out;
}

// Also releases the blob handles read out of this snapshot that the game
// has not released itself (see makeFirestoreBlob).
void firebase_firestore_document_snapshot_release(uint64_t ref)
{
	if (gm_fb_ref_ext(ref) != GM_FIREBASE_EXT || gm_fb_ref_type(ref) != GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT)
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_HANDLE, "invalid handle");
		return;
	}
	releaseFirestoreSnapshotBlobs(gm_fb_ref_id(ref));
	unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_doc_snapshot_map);
}

// ============================================================
// QuerySnapshot
// ============================================================

// The snapshot's scalars (size, empty, metadata flags) in a single call.
// undefined for a handle that does not resolve (InvalidHandle is already
// recorded).
std::optional<FirestoreQuerySnapshotInfo> firebase_firestore_query_snapshot_get_info(uint64_t ref)
{
	firebase::firestore::QuerySnapshot* snap = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_QUERY_SNAPSHOT, firebase::firestore::QuerySnapshot, g_fs_query_snapshot_map, snap);
	if (snap == nullptr) return std::nullopt;

	FirestoreQuerySnapshotInfo out{};
	out.size = static_cast<double>(snap->size());
	out.empty = snap->empty();
	out.has_pending_writes = snap->metadata().has_pending_writes();
	out.is_from_cache = snap->metadata().is_from_cache();

	return out;
}

// Returns an array of GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT refs (each newly
// registered), in the query's result order.
std::vector<std::uint64_t> firebase_firestore_query_snapshot_documents(uint64_t ref)
{
	std::vector<std::uint64_t> result;

	firebase::firestore::QuerySnapshot* snap = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_QUERY_SNAPSHOT, firebase::firestore::QuerySnapshot, g_fs_query_snapshot_map, snap);
	if (snap != nullptr)
	{
		std::vector<firebase::firestore::DocumentSnapshot> documents = snap->documents();
		result.reserve(documents.size());
		for (const auto& doc : documents)
			result.push_back(registerFirestoreDocSnapshot(doc));
	}
	return result;
}

// Each document is a newly registered DocumentSnapshot ref; old_index and
// new_index are -1 where the SDK reports npos.
std::vector<gm_structs::FirestoreDocumentChange> firebase_firestore_query_snapshot_document_changes(uint64_t ref, bool include_metadata_changes)
{
	std::vector<gm_structs::FirestoreDocumentChange> result;

	firebase::firestore::QuerySnapshot* snap = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_QUERY_SNAPSHOT, firebase::firestore::QuerySnapshot, g_fs_query_snapshot_map, snap);
	if (snap != nullptr)
	{
		auto mc = include_metadata_changes ? firebase::firestore::MetadataChanges::kInclude : firebase::firestore::MetadataChanges::kExclude;
		std::vector<firebase::firestore::DocumentChange> changes = snap->DocumentChanges(mc);
		result.reserve(changes.size());
		for (const auto& change : changes)
		{
			gm_structs::FirestoreDocumentChange entry;
			entry.type = static_cast<gm_enums::FirestoreDocumentChangeType>(change.type());
			entry.document = registerFirestoreDocSnapshot(change.document());

			std::size_t old_index = change.old_index();
			std::size_t new_index = change.new_index();
			entry.old_index = old_index == firebase::firestore::DocumentChange::npos ? -1.0 : static_cast<double>(old_index);
			entry.new_index = new_index == firebase::firestore::DocumentChange::npos ? -1.0 : static_cast<double>(new_index);

			result.push_back(std::move(entry));
		}
	}
	return result;
}

void firebase_firestore_query_snapshot_release(uint64_t ref)
{
	if (gm_fb_ref_ext(ref) != GM_FIREBASE_EXT || gm_fb_ref_type(ref) != GM_FB_TYPE_FIRESTORE_QUERY_SNAPSHOT)
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_HANDLE, "invalid handle");
		return;
	}
	unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_query_snapshot_map);
}

// ============================================================
// ListenerRegistration
// ============================================================
// Shared by firebase_firestore_document_ref_add_snapshot_listener() and
// firebase_firestore_query_add_snapshot_listener() - both heap-box their
// ListenerRegistration under the same GM_FB_TYPE_FIRESTORE_LISTENER_REG type
// code, so a single remove function serves either.

void firebase_firestore_listener_registration_remove(uint64_t ref)
{
	firebase::firestore::ListenerRegistration* reg = nullptr;
	validate_fb_ref_ptr(ref, GM_FB_TYPE_FIRESTORE_LISTENER_REG, firebase::firestore::ListenerRegistration, reg);
	if (reg == nullptr) return;

	reg->Remove();
	reg = static_cast<firebase::firestore::ListenerRegistration*>(unregisterFirebasePointer(ref, GM_FB_TYPE_FIRESTORE_LISTENER_REG));
	delete reg;
}

// ============================================================
// Remaining snapshot/listener accessors
// ============================================================

bool firebase_firestore_document_snapshot_is_valid(uint64_t ref)
{
	firebase::firestore::DocumentSnapshot* snap = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
	return snap && snap->is_valid();
}

std::string firebase_firestore_document_snapshot_to_string(uint64_t ref)
{
	firebase::firestore::DocumentSnapshot* snap = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
	return snap ? snap->ToString() : std::string();
}

std::optional<gm_structs::FirestoreFieldLookup> firebase_firestore_document_snapshot_get_field_path(uint64_t ref, uint64_t field_path_ref, FirestoreServerTimestampBehavior server_timestamp_behavior)
{
	firebase::firestore::DocumentSnapshot* snap = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
	firebase::firestore::FieldPath* path = nullptr;
	validate_fb_ref_map(field_path_ref, GM_FB_TYPE_FIRESTORE_FIELD_PATH, firebase::firestore::FieldPath, g_fs_field_path_map, path);
	if (!snap || !path)
		return std::nullopt;

	firebase::firestore::DocumentSnapshot::ServerTimestampBehavior stb;
	if (!toSdkServerTimestampBehavior(server_timestamp_behavior, stb))
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_firestore_document_snapshot_get_field_path: server_timestamp_behavior must be a FirestoreServerTimestampBehavior value");
		return std::nullopt;
	}
	return makeFieldLookup(snap->Get(*path, stb), ref);
}

bool firebase_firestore_query_snapshot_is_valid(uint64_t ref)
{
	firebase::firestore::QuerySnapshot* snap = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_QUERY_SNAPSHOT, firebase::firestore::QuerySnapshot, g_fs_query_snapshot_map, snap);
	return snap && snap->is_valid();
}

uint64_t firebase_firestore_query_snapshot_get_query(uint64_t ref)
{
	firebase::firestore::QuerySnapshot* snap = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_QUERY_SNAPSHOT, firebase::firestore::QuerySnapshot, g_fs_query_snapshot_map, snap);
	return snap ? registerFirestoreQuery(snap->query()) : 0;
}

bool firebase_firestore_listener_registration_is_valid(uint64_t ref)
{
	firebase::firestore::ListenerRegistration* reg = nullptr;
	validate_fb_ref_ptr(ref, GM_FB_TYPE_FIRESTORE_LISTENER_REG, firebase::firestore::ListenerRegistration, reg);
	return reg && reg->is_valid();
}

std::string firebase_firestore_document_snapshot_metadata_to_string(uint64_t ref)
{
	firebase::firestore::DocumentSnapshot* snap = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
	return snap ? snap->metadata().ToString() : std::string();
}

std::string firebase_firestore_query_snapshot_metadata_to_string(uint64_t ref)
{
	firebase::firestore::QuerySnapshot* snap = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_QUERY_SNAPSHOT, firebase::firestore::QuerySnapshot, g_fs_query_snapshot_map, snap);
	return snap ? snap->metadata().ToString() : std::string();
}

// The document's reference as a handle the caller owns; the snapshot's scalars
// come from firebase_firestore_document_snapshot_get_info.
uint64_t firebase_firestore_document_snapshot_reference(uint64_t ref)
{
	firebase::firestore::DocumentSnapshot* snap = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
	return snap ? registerFirestoreDocRef(snap->reference()) : 0;
}
