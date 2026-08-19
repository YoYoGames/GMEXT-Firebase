// Cloud Firestore - DocumentSnapshot, QuerySnapshot and ListenerRegistration
// removal. Shares GMFirebase_firestore.h's registries/converters with
// GMFirebase_firestore.cpp (e.g. AddSnapshotListener there registers the
// DocumentSnapshot/QuerySnapshot values this file's accessors read back).
#include "GMFirebase_firestore.h"

using namespace gm::wire;
using namespace gm_structs;
using namespace gm_enums;

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

// Consolidates firebase_firestore_document_snapshot_exists/id/reference/
// metadata_has_pending_writes/metadata_is_from_cache into a single call.
// `reference` is a newly registered DocumentReference ref owned by the
// caller - release it with firebase_firestore_document_ref_release().
FirestoreDocumentSnapshotInfo firebase_firestore_document_snapshot_get_info(uint64_t ref)
{
	FirestoreDocumentSnapshotInfo out{};

	firebase::firestore::DocumentSnapshot* snap = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
	if (snap == nullptr) return out;

	out.exists = snap->exists();
	out.id = snap->id();
	out.reference = registerFirestoreDocRef(snap->reference());
	out.has_pending_writes = snap->metadata().has_pending_writes();
	out.is_from_cache = snap->metadata().is_from_cache();

	return out;
}

// Returns { exists: bool, value: <field value, or undefined if not exists> }.
// See GMFirebase_firestore.h's converter section for how composite value
// kinds (Timestamp/GeoPoint/Reference/Array/Map) are encoded.
gm::wire::DataStream firebase_firestore_document_snapshot_get(uint64_t ref, std::string_view field, double server_timestamp_behavior)
{
	gm::wire::StructStream result;

	firebase::firestore::DocumentSnapshot* snap = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
	if (snap == nullptr)
	{
		result.add("exists", false);
		result.addKeyValue("value", std::optional<std::uint8_t>{});
	}
	else
	{
		auto stb = static_cast<firebase::firestore::DocumentSnapshot::ServerTimestampBehavior>(static_cast<int>(server_timestamp_behavior));
		std::string field_name(field);
		firebase::firestore::FieldValue value = snap->Get(field_name.c_str(), stb);

		bool exists = value.is_valid();
		result.add("exists", exists);
		if (exists)
			addFieldValueToStruct("value", value, result);
		else
			result.addKeyValue("value", std::optional<std::uint8_t>{});
	}

	gm::wire::DataStream out;
	out << result;
	return out;
}

// Returns the full field map as a struct, field name -> converted value.
gm::wire::DataStream firebase_firestore_document_snapshot_get_data(uint64_t ref, double server_timestamp_behavior)
{
	gm::wire::StructStream result;

	firebase::firestore::DocumentSnapshot* snap = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
	if (snap != nullptr)
	{
		auto stb = static_cast<firebase::firestore::DocumentSnapshot::ServerTimestampBehavior>(static_cast<int>(server_timestamp_behavior));
		firebase::firestore::MapFieldValue data = snap->GetData(stb);
		for (const auto& kv : data)
			addFieldValueToStruct(kv.first.c_str(), kv.second, result);
	}

	gm::wire::DataStream out;
	out << result;
	return out;
}

void firebase_firestore_document_snapshot_release(uint64_t ref)
{
	if (gm_fb_ref_ext(ref) != GM_FIREBASE_EXT || gm_fb_ref_type(ref) != GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT)
	{
		setFirebaseLastError(-1, "invalid handle");
		return;
	}
	unregisterFirebaseValue(gm_fb_ref_id(ref), g_fs_doc_snapshot_map);
}

// ============================================================
// QuerySnapshot
// ============================================================

// Consolidates firebase_firestore_query_snapshot_size/empty/
// metadata_has_pending_writes/metadata_is_from_cache into a single call.
// If `ref` is not a valid registered QuerySnapshot, returns a
// default-constructed struct (size 0, empty/has_pending_writes/
// is_from_cache false).
FirestoreQuerySnapshotInfo firebase_firestore_query_snapshot_get_info(uint64_t ref)
{
	FirestoreQuerySnapshotInfo out{};

	firebase::firestore::QuerySnapshot* snap = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_QUERY_SNAPSHOT, firebase::firestore::QuerySnapshot, g_fs_query_snapshot_map, snap);
	if (snap == nullptr) return out;

	out.size = static_cast<double>(snap->size());
	out.empty = snap->empty();
	out.has_pending_writes = snap->metadata().has_pending_writes();
	out.is_from_cache = snap->metadata().is_from_cache();

	return out;
}

// Returns an array of GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT refs (each newly
// registered), in the query's result order.
gm::wire::DataStream firebase_firestore_query_snapshot_documents(uint64_t ref)
{
	gm::wire::ArrayStream result;

	firebase::firestore::QuerySnapshot* snap = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_QUERY_SNAPSHOT, firebase::firestore::QuerySnapshot, g_fs_query_snapshot_map, snap);
	if (snap != nullptr)
	{
		for (const auto& doc : snap->documents())
			result.push(static_cast<double>(registerFirestoreDocSnapshot(doc)));
	}

	gm::wire::DataStream out;
	out << result;
	return out;
}

// Returns an array of
// { type: real (FirestoreDocumentChangeType), document: uint64 ref,
//   old_index: real (-1 if n/a), new_index: real (-1 if n/a) }.
gm::wire::DataStream firebase_firestore_query_snapshot_document_changes(uint64_t ref, bool include_metadata_changes)
{
	gm::wire::ArrayStream result;

	firebase::firestore::QuerySnapshot* snap = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_QUERY_SNAPSHOT, firebase::firestore::QuerySnapshot, g_fs_query_snapshot_map, snap);
	if (snap != nullptr)
	{
		auto mc = include_metadata_changes ? firebase::firestore::MetadataChanges::kInclude : firebase::firestore::MetadataChanges::kExclude;
		for (const auto& change : snap->DocumentChanges(mc))
		{
			gm::wire::StructStream entry;
			entry.add("type", static_cast<double>(change.type()));
			entry.add("document", static_cast<double>(registerFirestoreDocSnapshot(change.document())));

			std::size_t old_index = change.old_index();
			std::size_t new_index = change.new_index();
			entry.add("old_index", old_index == firebase::firestore::DocumentChange::npos ? -1.0 : static_cast<double>(old_index));
			entry.add("new_index", new_index == firebase::firestore::DocumentChange::npos ? -1.0 : static_cast<double>(new_index));

			result.push(entry);
		}
	}

	gm::wire::DataStream out;
	out << result;
	return out;
}

void firebase_firestore_query_snapshot_release(uint64_t ref)
{
	if (gm_fb_ref_ext(ref) != GM_FIREBASE_EXT || gm_fb_ref_type(ref) != GM_FB_TYPE_FIRESTORE_QUERY_SNAPSHOT)
	{
		setFirebaseLastError(-1, "invalid handle");
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
