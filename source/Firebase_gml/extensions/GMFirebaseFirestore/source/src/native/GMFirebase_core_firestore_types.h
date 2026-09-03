#pragma once

#include <cstdint>
#include <string>

// Mirrors gm_structs::FirestoreDocumentSnapshotInfo (GMFirebaseFirestore's own
// extgen-generated type) field-for-field. Core cannot depend on a product
// module's generated code, so this hand-written twin is what crosses the ABI;
// Firestore's forwarder copies the fields into the real
// gm_structs::FirestoreDocumentSnapshotInfo it hands back to its generated
// stub.
//
// This header is duplicated verbatim between GMFirebaseCore and
// GMFirebaseFirestore (native/GMFirebase_core_firestore_types.h in both
// trees), mirroring the existing convention where GMFirebase_core_product_api.h
// is copied unchanged into every product module rather than shared via a
// common include path. Both copies must stay identical - this struct is
// passed by value across the Core<->module ABI boundary.
struct GMFirebaseFirestoreDocumentSnapshotInfo
{
    bool exists;
    std::string id;
    std::uint64_t reference;
    bool has_pending_writes;
    bool is_from_cache;
};

// Mirrors gm_structs::FirestoreQuerySnapshotInfo field-for-field.
struct GMFirebaseFirestoreQuerySnapshotInfo
{
    double size;
    bool empty;
    bool has_pending_writes;
    bool is_from_cache;
};
