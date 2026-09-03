// Cloud Firestore - DocumentSnapshot, QuerySnapshot and ListenerRegistration
// removal. Ported from GMFirebaseFirestore/source/src/native/
// GMFirebase_firestore_snapshot.cpp as part of the Core-ABI-forwarder split:
// this file now lives in GMFirebaseCore (which alone links the Firebase SDK)
// and exposes its entry points through gmfirebase_core_resolve_firestore_proc()
// (see GMFirebase_core_firestore_resolver.cpp) instead of directly to GML.
// Shares GMFirebase_core_firestore_impl.h's registries/converters with
// GMFirebase_core_firestore.cpp (e.g. add_snapshot_listener there registers
// the DocumentSnapshot/QuerySnapshot values this file's accessors read back).
//
// Two deviations from the old monolith, both required by the split:
//  - Everything lives in namespace gmfb_firestore, with entry points renamed
//    to drop the firebase_firestore_ prefix (matching the symbol names the
//    proc resolver looks up).
//  - document_snapshot_get_info/query_snapshot_get_info return the
//    hand-written GMFirebaseFirestoreDocumentSnapshotInfo/
//    GMFirebaseFirestoreQuerySnapshotInfo mirrors (declared in
//    GMFirebase_core_firestore_types.h) instead of the old gm_structs::
//    equivalents - Core cannot depend on any product module's generated code.
//    addFieldValueToStruct() also takes its StructStream first (stream-first/
//    string-key order), per GMFirebase_core_firestore_impl.h's contract.

#include "GMFirebase_core_firestore_impl.h"
#include "GMFirebase_common.h"

using namespace gm::wire;

namespace gmfb_firestore
{
    // ============================================================
    // Value-copy registries (declared extern in GMFirebase_core_firestore_impl.h)
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

    // Consolidates document_snapshot_exists/id/reference/
    // metadata_has_pending_writes/metadata_is_from_cache into a single call.
    // `reference` is a newly registered DocumentReference ref owned by the
    // caller - release it with document_ref_release().
    GMFirebaseFirestoreDocumentSnapshotInfo document_snapshot_get_info(uint64_t ref)
    {
        GMFirebaseFirestoreDocumentSnapshotInfo out{};

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
    // See GMFirebase_core_firestore_impl.h's converter section for how
    // composite value kinds (Timestamp/GeoPoint/Reference/Array/Map) are encoded.
    gm::wire::DataStream document_snapshot_get(uint64_t ref, std::string_view field, double server_timestamp_behavior)
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
                addFieldValueToStruct(result, "value", value);
            else
                result.addKeyValue("value", std::optional<std::uint8_t>{});
        }

        gm::wire::DataStream out;
        out << result;
        return out;
    }

    // Returns the full field map as a struct, field name -> converted value.
    gm::wire::DataStream document_snapshot_get_data(uint64_t ref, double server_timestamp_behavior)
    {
        gm::wire::StructStream result;

        firebase::firestore::DocumentSnapshot* snap = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
        if (snap != nullptr)
        {
            auto stb = static_cast<firebase::firestore::DocumentSnapshot::ServerTimestampBehavior>(static_cast<int>(server_timestamp_behavior));
            firebase::firestore::MapFieldValue data = snap->GetData(stb);
            for (const auto& kv : data)
                addFieldValueToStruct(result, kv.first, kv.second);
        }

        gm::wire::DataStream out;
        out << result;
        return out;
    }

    void document_snapshot_release(uint64_t ref)
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

    // Consolidates query_snapshot_size/empty/metadata_has_pending_writes/
    // metadata_is_from_cache into a single call. If `ref` is not a valid
    // registered QuerySnapshot, returns a default-constructed struct (size 0,
    // empty/has_pending_writes/is_from_cache false).
    GMFirebaseFirestoreQuerySnapshotInfo query_snapshot_get_info(uint64_t ref)
    {
        GMFirebaseFirestoreQuerySnapshotInfo out{};

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
    gm::wire::DataStream query_snapshot_documents(uint64_t ref)
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
    gm::wire::DataStream query_snapshot_document_changes(uint64_t ref, bool include_metadata_changes)
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

    void query_snapshot_release(uint64_t ref)
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
    // Shared by document_ref_add_snapshot_listener() and
    // query_add_snapshot_listener() - both heap-box their ListenerRegistration
    // under the same GM_FB_TYPE_FIRESTORE_LISTENER_REG type code, so a single
    // remove function serves either.

    void listener_registration_remove(uint64_t ref)
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

    bool document_snapshot_is_valid(uint64_t ref)
    {
        firebase::firestore::DocumentSnapshot* snap = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
        return snap && snap->is_valid();
    }

    std::string document_snapshot_to_string(uint64_t ref)
    {
        firebase::firestore::DocumentSnapshot* snap = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
        return snap ? snap->ToString() : std::string();
    }

    gm::wire::DataStream document_snapshot_get_field_path(uint64_t ref, uint64_t field_path_ref, double server_timestamp_behavior)
    {
        gm::wire::StructStream result;
        firebase::firestore::DocumentSnapshot* snap = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
        firebase::firestore::FieldPath* path = nullptr;
        validate_fb_ref_map(field_path_ref, GM_FB_TYPE_FIRESTORE_FIELD_PATH, firebase::firestore::FieldPath, g_fs_field_path_map, path);
        if (!snap || !path)
        {
            result.add("exists", false);
            result.addKeyValue("value", std::optional<std::uint8_t>{});
        }
        else
        {
            auto stb = static_cast<firebase::firestore::DocumentSnapshot::ServerTimestampBehavior>(static_cast<int>(server_timestamp_behavior));
            auto value = snap->Get(*path, stb);
            result.add("exists", value.is_valid());
            if (value.is_valid()) addFieldValueToStruct(result, "value", value);
            else result.addKeyValue("value", std::optional<std::uint8_t>{});
        }
        gm::wire::DataStream out; out << result; return out;
    }

    bool query_snapshot_is_valid(uint64_t ref)
    {
        firebase::firestore::QuerySnapshot* snap = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_QUERY_SNAPSHOT, firebase::firestore::QuerySnapshot, g_fs_query_snapshot_map, snap);
        return snap && snap->is_valid();
    }

    uint64_t query_snapshot_get_query(uint64_t ref)
    {
        firebase::firestore::QuerySnapshot* snap = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_QUERY_SNAPSHOT, firebase::firestore::QuerySnapshot, g_fs_query_snapshot_map, snap);
        return snap ? registerFirestoreQuery(snap->query()) : 0;
    }

    bool listener_registration_is_valid(uint64_t ref)
    {
        firebase::firestore::ListenerRegistration* reg = nullptr;
        validate_fb_ref_ptr(ref, GM_FB_TYPE_FIRESTORE_LISTENER_REG, firebase::firestore::ListenerRegistration, reg);
        return reg && reg->is_valid();
    }

    std::string document_snapshot_metadata_to_string(uint64_t ref)
    {
        firebase::firestore::DocumentSnapshot* snap = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
        return snap ? snap->metadata().ToString() : std::string();
    }

    std::string query_snapshot_metadata_to_string(uint64_t ref)
    {
        firebase::firestore::QuerySnapshot* snap = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_QUERY_SNAPSHOT, firebase::firestore::QuerySnapshot, g_fs_query_snapshot_map, snap);
        return snap ? snap->metadata().ToString() : std::string();
    }

    // ============================================================
    // Literal one-to-one snapshot accessors
    // ============================================================
    // These intentionally duplicate fields available through *_get_info().
    // They avoid allocating a GameMaker struct when a caller needs one scalar.

    bool document_snapshot_exists(uint64_t ref)
    {
        firebase::firestore::DocumentSnapshot* snap = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
        return snap && snap->exists();
    }

    std::string document_snapshot_id(uint64_t ref)
    {
        firebase::firestore::DocumentSnapshot* snap = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
        return snap ? snap->id() : std::string();
    }

    uint64_t document_snapshot_reference(uint64_t ref)
    {
        firebase::firestore::DocumentSnapshot* snap = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
        return snap ? registerFirestoreDocRef(snap->reference()) : 0;
    }

    bool document_snapshot_metadata_has_pending_writes(uint64_t ref)
    {
        firebase::firestore::DocumentSnapshot* snap = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
        return snap && snap->metadata().has_pending_writes();
    }

    bool document_snapshot_metadata_is_from_cache(uint64_t ref)
    {
        firebase::firestore::DocumentSnapshot* snap = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT, firebase::firestore::DocumentSnapshot, g_fs_doc_snapshot_map, snap);
        return snap && snap->metadata().is_from_cache();
    }

    double query_snapshot_size(uint64_t ref)
    {
        firebase::firestore::QuerySnapshot* snap = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_QUERY_SNAPSHOT, firebase::firestore::QuerySnapshot, g_fs_query_snapshot_map, snap);
        return snap ? static_cast<double>(snap->size()) : 0.0;
    }

    bool query_snapshot_empty(uint64_t ref)
    {
        firebase::firestore::QuerySnapshot* snap = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_QUERY_SNAPSHOT, firebase::firestore::QuerySnapshot, g_fs_query_snapshot_map, snap);
        return !snap || snap->empty();
    }

    bool query_snapshot_metadata_has_pending_writes(uint64_t ref)
    {
        firebase::firestore::QuerySnapshot* snap = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_QUERY_SNAPSHOT, firebase::firestore::QuerySnapshot, g_fs_query_snapshot_map, snap);
        return snap && snap->metadata().has_pending_writes();
    }

    bool query_snapshot_metadata_is_from_cache(uint64_t ref)
    {
        firebase::firestore::QuerySnapshot* snap = nullptr;
        validate_fb_ref_map(ref, GM_FB_TYPE_FIRESTORE_QUERY_SNAPSHOT, firebase::firestore::QuerySnapshot, g_fs_query_snapshot_map, snap);
        return snap && snap->metadata().is_from_cache();
    }
}
