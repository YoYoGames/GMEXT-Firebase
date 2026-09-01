// Cloud Firestore - DocumentSnapshot/QuerySnapshot/ListenerRegistration thin
// forwarder over GMFirebaseCore's Firestore ABI. See GMFirebase_firestore.cpp
// for the split's rationale; this file covers the entry points that were
// split into GMFirebase_core_firestore_snapshot.cpp on the Core side.
#include "GMFirebase_common.h"
#include "GMFirebase_core_firestore_client.h"

using namespace gm::wire;
using namespace gm_structs;

namespace
{
    void reportCoreUnavailable()
    {
        setFirebaseLastError(-1, "GMFirebaseCore firestore module is not available");
    }

    gm_structs::FirestoreDocumentSnapshotInfo toGmStruct(const GMFirebaseFirestoreDocumentSnapshotInfo& in)
    {
        gm_structs::FirestoreDocumentSnapshotInfo out{};
        out.exists = in.exists;
        out.id = in.id;
        out.reference = in.reference;
        out.has_pending_writes = in.has_pending_writes;
        out.is_from_cache = in.is_from_cache;
        return out;
    }

    gm_structs::FirestoreQuerySnapshotInfo toGmStruct(const GMFirebaseFirestoreQuerySnapshotInfo& in)
    {
        gm_structs::FirestoreQuerySnapshotInfo out{};
        out.size = in.size;
        out.empty = in.empty;
        out.has_pending_writes = in.has_pending_writes;
        out.is_from_cache = in.is_from_cache;
        return out;
    }
}

gm_structs::FirestoreDocumentSnapshotInfo firebase_firestore_document_snapshot_get_info(std::uint64_t ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return gm_structs::FirestoreDocumentSnapshotInfo{}; }
    return toGmStruct(api->document_snapshot_get_info(ref));
}

gm::wire::DataStream firebase_firestore_document_snapshot_get(std::uint64_t ref, std::string_view field, double server_timestamp_behavior)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return gm::wire::DataStream(); }
    return api->document_snapshot_get(ref, field, server_timestamp_behavior);
}

gm::wire::DataStream firebase_firestore_document_snapshot_get_data(std::uint64_t ref, double server_timestamp_behavior)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return gm::wire::DataStream(); }
    return api->document_snapshot_get_data(ref, server_timestamp_behavior);
}

void firebase_firestore_document_snapshot_release(std::uint64_t ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api != nullptr) api->document_snapshot_release(ref);
}

gm_structs::FirestoreQuerySnapshotInfo firebase_firestore_query_snapshot_get_info(std::uint64_t ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return gm_structs::FirestoreQuerySnapshotInfo{}; }
    return toGmStruct(api->query_snapshot_get_info(ref));
}

gm::wire::DataStream firebase_firestore_query_snapshot_documents(std::uint64_t ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return gm::wire::DataStream(); }
    return api->query_snapshot_documents(ref);
}

gm::wire::DataStream firebase_firestore_query_snapshot_document_changes(std::uint64_t ref, bool include_metadata_changes)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return gm::wire::DataStream(); }
    return api->query_snapshot_document_changes(ref, include_metadata_changes);
}

void firebase_firestore_query_snapshot_release(std::uint64_t ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api != nullptr) api->query_snapshot_release(ref);
}

void firebase_firestore_listener_registration_remove(std::uint64_t ref)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api != nullptr) api->listener_registration_remove(ref);
}

bool firebase_firestore_document_snapshot_is_valid(std::uint64_t snapshot)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->document_snapshot_is_valid(snapshot);
}

std::string firebase_firestore_document_snapshot_to_string(std::uint64_t snapshot)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->document_snapshot_to_string(snapshot) : std::string();
}

gm::wire::DataStream firebase_firestore_document_snapshot_get_field_path(std::uint64_t snapshot, std::uint64_t field_path, double server_timestamp_behavior)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return gm::wire::DataStream(); }
    return api->document_snapshot_get_field_path(snapshot, field_path, server_timestamp_behavior);
}

bool firebase_firestore_query_snapshot_is_valid(std::uint64_t snapshot)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->query_snapshot_is_valid(snapshot);
}

std::uint64_t firebase_firestore_query_snapshot_get_query(std::uint64_t snapshot)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->query_snapshot_get_query(snapshot);
}

bool firebase_firestore_listener_registration_is_valid(std::uint64_t listener)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->listener_registration_is_valid(listener);
}

std::string firebase_firestore_document_snapshot_metadata_to_string(std::uint64_t snapshot)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->document_snapshot_metadata_to_string(snapshot) : std::string();
}

std::string firebase_firestore_query_snapshot_metadata_to_string(std::uint64_t snapshot)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->query_snapshot_metadata_to_string(snapshot) : std::string();
}

bool firebase_firestore_document_snapshot_exists(std::uint64_t snapshot)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->document_snapshot_exists(snapshot);
}

std::string firebase_firestore_document_snapshot_id(std::uint64_t snapshot)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->document_snapshot_id(snapshot) : std::string();
}

std::uint64_t firebase_firestore_document_snapshot_reference(std::uint64_t snapshot)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    if (api == nullptr) { reportCoreUnavailable(); return 0; }
    return api->document_snapshot_reference(snapshot);
}

bool firebase_firestore_document_snapshot_metadata_has_pending_writes(std::uint64_t snapshot)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->document_snapshot_metadata_has_pending_writes(snapshot);
}

bool firebase_firestore_document_snapshot_metadata_is_from_cache(std::uint64_t snapshot)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->document_snapshot_metadata_is_from_cache(snapshot);
}

double firebase_firestore_query_snapshot_size(std::uint64_t snapshot)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr ? api->query_snapshot_size(snapshot) : 0.0;
}

bool firebase_firestore_query_snapshot_empty(std::uint64_t snapshot)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api == nullptr || api->query_snapshot_empty(snapshot);
}

bool firebase_firestore_query_snapshot_metadata_has_pending_writes(std::uint64_t snapshot)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->query_snapshot_metadata_has_pending_writes(snapshot);
}

bool firebase_firestore_query_snapshot_metadata_is_from_cache(std::uint64_t snapshot)
{
    const auto* api = gmfirebaseGetCoreFirestoreAPI();
    return api != nullptr && api->query_snapshot_metadata_is_from_cache(snapshot);
}
