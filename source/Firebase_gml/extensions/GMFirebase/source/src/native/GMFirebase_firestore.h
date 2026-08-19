#pragma once

#include "native/GMFirebaseInternal_native.h"
#include "GMFirebase_common.h"
#include "firebase/firestore.h"

// ============================================================
// Value-copy registries
// ============================================================
// DocumentReference/CollectionReference/Query/DocumentSnapshot/QuerySnapshot/
// WriteBatch/FieldValue are all cheap SDK value objects with no stable
// address of their own (CollectionReference and Query in particular are
// reference-counted pimpl wrappers), so - per GMFirebase_common.h's
// documented convention - each type gets its own registry map + index
// counter and goes through registerFirebaseValue<T>()/validate_fb_ref_map.
// Declared extern here (rather than file-static) because both
// GMFirebase_firestore.cpp and GMFirebase_firestore_snapshot.cpp need to
// register/resolve every one of these types (e.g. AddSnapshotListener in the
// first file registers DocumentSnapshot/QuerySnapshot values that the second
// file's accessors then read back).

extern std::map<uint32_t, firebase::firestore::DocumentReference> g_fs_doc_ref_map;
extern uint32_t g_fs_doc_ref_index;

extern std::map<uint32_t, firebase::firestore::CollectionReference> g_fs_col_ref_map;
extern uint32_t g_fs_col_ref_index;

extern std::map<uint32_t, firebase::firestore::Query> g_fs_query_map;
extern uint32_t g_fs_query_index;

extern std::map<uint32_t, firebase::firestore::DocumentSnapshot> g_fs_doc_snapshot_map;
extern uint32_t g_fs_doc_snapshot_index;

extern std::map<uint32_t, firebase::firestore::QuerySnapshot> g_fs_query_snapshot_map;
extern uint32_t g_fs_query_snapshot_index;

extern std::map<uint32_t, firebase::firestore::WriteBatch> g_fs_write_batch_map;
extern uint32_t g_fs_write_batch_index;

// FieldValue serves two purposes: (1) sentinels that only ever make sense as
// an outbound Set()/Update()/WriteBatch write (Delete(), ServerTimestamp(),
// ArrayUnion/ArrayRemove, Increment) and (2) explicit-typed value
// constructors (Integer/Timestamp/GeoPoint/Reference/Blob/Null) that let
// script code opt into a precise Firestore type GML's all-double "real"
// can't otherwise express. Both flavors are minted by
// firestore_field_value_*() and registered here identically; gmValueToFieldValue()
// resolves a ref found nested inside a plain data map back to the concrete
// FieldValue it was registered with.
extern std::map<uint32_t, firebase::firestore::FieldValue> g_fs_field_value_map;
extern uint32_t g_fs_field_value_index;

extern std::map<uint32_t, firebase::firestore::FieldPath> g_fs_field_path_map;
extern uint32_t g_fs_field_path_index;
extern std::map<uint32_t, firebase::firestore::Filter> g_fs_filter_map;
extern uint32_t g_fs_filter_index;
extern std::map<uint32_t, firebase::firestore::AggregateQuery> g_fs_aggregate_query_map;
extern uint32_t g_fs_aggregate_query_index;
extern std::map<uint32_t, firebase::firestore::AggregateQuerySnapshot> g_fs_aggregate_snapshot_map;
extern uint32_t g_fs_aggregate_snapshot_index;

// Registers a value copy and returns a packed GM_FB_TYPE_FIRESTORE_* ref.
// Defined in GMFirebase_firestore.cpp (doc/col/query/batch/field_value) and
// GMFirebase_firestore_snapshot.cpp (doc_snapshot/query_snapshot).
uint64_t registerFirestoreDocRef(const firebase::firestore::DocumentReference& ref);
uint64_t registerFirestoreColRef(const firebase::firestore::CollectionReference& ref);
uint64_t registerFirestoreQuery(const firebase::firestore::Query& query);
uint64_t registerFirestoreWriteBatch(const firebase::firestore::WriteBatch& batch);
uint64_t registerFirestoreFieldValue(const firebase::firestore::FieldValue& value);
uint64_t registerFirestoreFieldPath(const firebase::firestore::FieldPath& value);
uint64_t registerFirestoreFilter(const firebase::firestore::Filter& value);
uint64_t registerFirestoreAggregateQuery(const firebase::firestore::AggregateQuery& value);
uint64_t registerFirestoreAggregateSnapshot(const firebase::firestore::AggregateQuerySnapshot& value);
uint64_t registerFirestoreDocSnapshot(const firebase::firestore::DocumentSnapshot& snapshot);
uint64_t registerFirestoreQuerySnapshot(const firebase::firestore::QuerySnapshot& snapshot);

// ============================================================
// Firestore instance access
// ============================================================
// firebase::firestore::Firestore* is a singleton-per-App/database, like
// getFirebaseApp()/getFirebaseAuth() elsewhere in this extension, so callers
// hand the GM_FB_TYPE_FIRESTORE ref returned by firestore_get_instance()
// around rather than re-resolving it from g_firebase_app on every call.
// Defined in GMFirebase_firestore.cpp.
firebase::firestore::Firestore* resolveFirestore(uint64_t instance_ref);

// CollectionReference publicly inherits from Query, so every Where/OrderBy/
// Limit/StartAt/.../Get/AddSnapshotListener function accepts either a
// GM_FB_TYPE_FIRESTORE_QUERY ref or a GM_FB_TYPE_FIRESTORE_COL_REF ref -
// slicing a stored CollectionReference down to a plain Query copy just
// copies its shared internal pimpl pointer, so this is safe and cheap.
// Returns false (and records a last-error) if `ref` is neither.
bool resolveFirestoreQuery(uint64_t ref, firebase::firestore::Query& out);

// ============================================================
// firebase::firestore::FieldValue <-> gm::wire converters
// ============================================================
// Firestore has its own richer value model than the plain firebase::Variant
// used by Realtime Database/Remote Config/Functions (see
// GMFirebase_common.h), so it gets its own converter pair here instead of
// reusing pushVariantToArray/addVariantToStruct/gmValueToVariant.
//
// Outbound (C++ -> GML): appended directly onto an in-progress
// ArrayStream/StructStream, exactly like the Variant converters - the same
// stream that ends up passed as a callback.call(...) argument or returned as
// a struct-typed value (DocumentSnapshot::Get/GetData return a StructStream
// directly as their C++ return type; see GMFirebase_firestore_snapshot.cpp).
// Composite value kinds that have no single GML primitive
// (Timestamp/GeoPoint) are encoded as a small tagged struct
// { type: "timestamp"|"geopoint", ... fields }; kReference is encoded as a
// plain GM_FB_TYPE_FIRESTORE_DOC_REF ref (a real number), consistent with
// every other reference-typed value in this extension.
void pushFieldValueToArray(const firebase::firestore::FieldValue& v, gm::wire::ArrayStream& out);
void addFieldValueToStruct(const char* key, const firebase::firestore::FieldValue& v, gm::wire::StructStream& out);

// Inbound (GML -> C++): reconstructs a FieldValue from a decoded incoming
// GMValue. Plain reals become FieldValue::Double() (GML has no separate
// int/double distinction - use firestore_field_value_integer() to force
// int64 storage). A double whose value exactly matches one of this
// extension's packed refs (see GMFirebase_common.h's ext/type bit layout) is
// resolved against g_fs_field_value_map (an explicit sentinel/typed value
// minted by firestore_field_value_*()) or g_fs_doc_ref_map (auto-detected
// DocumentReference -> FieldValue::Reference()) instead of being taken
// literally - real user data numbers never land in that reserved bit range,
// the same assumption every other packed-ref-as-double value in this
// extension already relies on.
firebase::firestore::FieldValue gmValueToFieldValue(const gm::wire::GMValue& value);

// Decodes an inbound gmval struct (field name -> value) into a MapFieldValue,
// for DocumentReference::Set/Update, CollectionReference::Add and
// WriteBatch::Set/Update.
firebase::firestore::MapFieldValue gmValueToMapFieldValue(const gm::wire::GMValue& value);

// Decodes an inbound gmval array into a FieldValue vector, for
// WhereArrayContainsAny/WhereIn/WhereNotIn, StartAt/StartAfter/EndBefore/EndAt
// (values overload) and the ArrayUnion/ArrayRemove sentinel constructors.
std::vector<firebase::firestore::FieldValue> gmValueToFieldValueVector(const gm::wire::GMValue& value);

// Decodes an inbound gmval array of strings, for
// firestore_document_ref_set_merge_fields/firestore_write_batch_set_merge_fields.
std::vector<std::string> gmValueToStringVector(const gm::wire::GMValue& value);
firebase::firestore::MapFieldPathValue gmValueToMapFieldPathValue(const gm::wire::GMValue& value);
