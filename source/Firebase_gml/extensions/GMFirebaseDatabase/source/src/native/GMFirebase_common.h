#pragma once

#include "firebase/app.h"
#include "firebase/future.h"
#include "firebase/log.h"
#include "firebase/variant.h"
#include <cstdint>
#include <map>
#include <mutex>
#include <optional>
#include <string>
#include <string_view>
#include <utility>
#include <vector>
#include <native/GMFirebaseDatabaseInternal_native.h>

// ============================================================
// App bootstrap
// ============================================================

// Default App used by the compatibility APIs. Additional named Apps may be
// represented by GM_FB_TYPE_APP handles and passed to explicit *_for_app APIs.
// The default firebase::App instance is owned by GMFirebaseCore.
// Product modules access it through getFirebaseApp() below; they do not
// define or mutate a module-local g_firebase_app.

firebase::App* getFirebaseApp();
uint64_t wrapFirebaseApp(firebase::App* app);
firebase::App* resolveFirebaseApp(uint64_t ref);

// ============================================================
// Last Error State
// ============================================================

// Firebase's C++ SDK has no single unified result enum (unlike FMOD_RESULT),
// so every module funnels both synchronous failures and Future<T> completion
// errors through this. Guarded by a mutex because Future<T>::OnCompletion
// callbacks can fire on Firebase's own background threads and may race a
// firebase_last_error_*() read happening on the GML thread.
struct FirebaseLastError
{
	int code = 0;
	std::string message;
};

void setFirebaseLastError(int code, const std::string& message);
double firebase_last_error_code();
std::string firebase_last_error_message();

// ============================================================
// Reference Layout
// ============================================================

// Every handle handed to GML is a plain 64-bit integer packed the same way as
// FMOD's packIndexIntoRef(), just under a different extension magic id so a
// ref minted by one extension can never be mistaken for the other's:
//
//     10bit      |     8bit      |      32bit
//   extension    |     type      |       ref
//
#define GM_FIREBASE_EXT 0x02

#define gm_fb_ref_ext(ref) ((uint32_t)(((uint64_t)(ref) >> 40) & 0x3FF))
#define gm_fb_ref_type(ref) ((uint8_t)(((uint64_t)(ref) >> 32) & 0xFF))
#define gm_fb_ref_id(ref) ((uint32_t)((uint64_t)(ref) & 0xFFFFFFFF))

uint64_t packFirebaseRef(uint32_t index, uint8_t type);

// ============================================================
// Type Codes
// ============================================================
// Every GML-facing handle contains ONLY a 32-bit registry id. Native pointers
// are never truncated into the handle payload (that is not safe on 64-bit
// processes). Pointer-backed types use the central pointer registry below;
// value-copy types (DatabaseReference/DocumentReference/etc.) use per-module
// value registries. In both cases the public ABI remains a single uint64.

// Auth
#define GM_FB_TYPE_AUTH_USER 0x01              // ptr: firebase::auth::User*
#define GM_FB_TYPE_AUTH_CREDENTIAL 0x02        // map: firebase::auth::Credential
#define GM_FB_TYPE_AUTH_STATE_LISTENER 0x03    // ptr: our AuthStateListener subclass
#define GM_FB_TYPE_AUTH_ID_TOKEN_LISTENER 0x04 // ptr: our IdTokenListener subclass
#define GM_FB_TYPE_AUTH_PHONE_CREDENTIAL 0x05  // map: firebase::auth::PhoneAuthCredential
#define GM_FB_TYPE_AUTH_PHONE_RESEND_TOKEN 0x06 // map: PhoneAuthProvider::ForceResendingToken
#define GM_FB_TYPE_AUTH_FEDERATED_PROVIDER 0x07 // ptr: heap-owned FederatedOAuthProvider
#define GM_FB_TYPE_AUTH_PHONE_LISTENER 0x08    // ptr: heap-owned PhoneAuthProvider::Listener
#define GM_FB_TYPE_AUTH 0x09                   // ptr: firebase::auth::Auth*

// Auth cross-file declarations are intentionally kept only in GMFirebaseAuth.

// Core App
#define GM_FB_TYPE_APP 0x80 // ptr: firebase::App*

// Realtime Database
#define GM_FB_TYPE_DATABASE 0x10             // ptr: firebase::database::Database*
#define GM_FB_TYPE_DATABASE_REF 0x11         // map: firebase::database::DatabaseReference
#define GM_FB_TYPE_DATABASE_QUERY 0x12       // map: firebase::database::Query
#define GM_FB_TYPE_DATA_SNAPSHOT 0x13        // map: firebase::database::DataSnapshot
#define GM_FB_TYPE_DATABASE_VALUE_LISTENER 0x14 // ptr registry: GMFirebaseValueListener
#define GM_FB_TYPE_DATABASE_MUTABLE_DATA 0x15   // map: firebase::database::MutableData (transactions)
#define GM_FB_TYPE_DATABASE_CHILD_LISTENER 0x16 // ptr registry: GMFirebaseChildListener
#define GM_FB_TYPE_DATABASE_ON_DISCONNECT 0x17 // ptr: heap-owned DisconnectionHandler

// Firestore
#define GM_FB_TYPE_FIRESTORE 0x20              // ptr: firebase::firestore::Firestore*
#define GM_FB_TYPE_FIRESTORE_DOC_REF 0x21      // map: DocumentReference
#define GM_FB_TYPE_FIRESTORE_COL_REF 0x22      // map: CollectionReference
#define GM_FB_TYPE_FIRESTORE_QUERY 0x23        // map: Query
#define GM_FB_TYPE_FIRESTORE_DOC_SNAPSHOT 0x24 // map: DocumentSnapshot
#define GM_FB_TYPE_FIRESTORE_QUERY_SNAPSHOT 0x25 // map: QuerySnapshot
#define GM_FB_TYPE_FIRESTORE_LISTENER_REG 0x26 // ptr: heap-boxed ListenerRegistration
#define GM_FB_TYPE_FIRESTORE_WRITE_BATCH 0x27  // map: WriteBatch
#define GM_FB_TYPE_FIRESTORE_TRANSACTION 0x28  // ptr: Transaction* (borrowed, callback-scoped)
#define GM_FB_TYPE_FIRESTORE_FIELD_VALUE 0x29  // map: FieldValue (sentinels + explicit-typed values)
#define GM_FB_TYPE_FIRESTORE_FIELD_PATH 0x2A   // map: FieldPath
#define GM_FB_TYPE_FIRESTORE_FILTER 0x2B       // map: Filter
#define GM_FB_TYPE_FIRESTORE_AGG_QUERY 0x2C    // map: AggregateQuery
#define GM_FB_TYPE_FIRESTORE_AGG_SNAPSHOT 0x2D // map: AggregateQuerySnapshot

// Storage
#define GM_FB_TYPE_STORAGE 0x30              // ptr: firebase::storage::Storage*
#define GM_FB_TYPE_STORAGE_REF 0x31          // map: StorageReference
#define GM_FB_TYPE_STORAGE_METADATA 0x32     // map: Metadata
#define GM_FB_TYPE_STORAGE_CONTROLLER 0x33   // map: Controller
#define GM_FB_TYPE_STORAGE_LIST_RESULT 0x34  // map: ListResult

// Functions
#define GM_FB_TYPE_FUNCTIONS 0x40           // ptr: firebase::functions::Functions*
#define GM_FB_TYPE_FUNCTIONS_CALLABLE 0x41  // map: HttpsCallableReference

// Remote Config
#define GM_FB_TYPE_REMOTE_CONFIG 0x51   // ptr: firebase::remote_config::RemoteConfig*
#define GM_FB_TYPE_RC_LISTENER_REG 0x50 // ptr: heap-boxed ConfigUpdateListenerRegistration

// App Check
#define GM_FB_TYPE_APPCHECK_LISTENER 0x60 // ptr: our AppCheckListener subclass
#define GM_FB_TYPE_APPCHECK 0x61          // ptr: firebase::app_check::AppCheck*

// User Messaging Platform (UMP) - Cloud Messaging itself needs no ref types;
// its surface is a set of global functions plus a poll buffer (see
// GMFirebase_messaging.*), not per-instance handles.
#define GM_FB_TYPE_UMP_CONSENT_INFO 0x70 // ptr: firebase::ump::ConsentInfo*

// Installations
#define GM_FB_TYPE_INSTALLATIONS 0x81 // ptr: firebase::installations::Installations*

// ============================================================
// Validation Macros
// ============================================================

// A rejected ref leaves `output` at `sentinel` and records a generic error;
// every call site already checks for that sentinel before touching the handle.
#define gm_fb_ref_reject(output, sentinel) \
	{ \
		setFirebaseLastError(-1, "invalid handle"); \
		output = (sentinel); \
	}

// Pointer-backed handle registry. The registry owns identity only; object
// lifetime is still controlled by the module that allocated/obtained the
// pointer. registerFirebasePointer() deduplicates identical borrowed SDK
// singleton pointers, while unregisterFirebasePointer() removes an owned
// pointer before its module deletes it.
uint64_t registerFirebasePointer(void* pointer, uint8_t type_code);
void* resolveFirebasePointer(uint64_t ref, uint8_t expected_type);
void* unregisterFirebasePointer(uint64_t ref, uint8_t expected_type);

#define validate_fb_ref_ptr(ref, type_code, cpp_type, output) \
	{ \
		output = static_cast<cpp_type*>(resolveFirebasePointer((ref), (type_code))); \
	}

// Payload is an index into a module-owned registry map; output is a pointer to
// the stored value (never null on success - map entries are never null).
#define validate_fb_ref_map(ref, type_code, cpp_type, map, output) \
	{ \
		auto _search = (map).find(gm_fb_ref_id(ref)); \
		if (gm_fb_ref_ext(ref) == GM_FIREBASE_EXT && gm_fb_ref_type(ref) == (type_code) \
			&& _search != (map).end()) \
		{ \
			output = &_search->second; \
		} \
		else gm_fb_ref_reject(output, nullptr) \
	}

// ============================================================
// Generic value-copy registry helpers
// ============================================================
//
// Unlike FMOD (where every handle-carrying type is an SDK-owned pointer and
// every map lives centrally in GMFMOD_common.*), most Firebase reference
// types are cheap value objects with no address of their own. Rather than
// hand-write a registerX/unregisterX pair per type here, each module .cpp
// declares its own `static std::map<uint32_t, T> map_x;` + `static uint32_t
// index_x = 0;` and instantiates these header-only templates against its own
// T - no central instantiation list to keep in sync when a module is added.

template <typename T>
inline uint32_t registerFirebaseValue(T value, uint32_t& index, std::map<uint32_t, T>& map)
{
	uint32_t id = ++index;
	// Keep 0 reserved for invalid/null and never reuse a live id. In normal
	// operation ids are monotonic for the life of the process, which also means
	// a released stale GML handle cannot accidentally target a newer object.
	while (id == 0 || map.find(id) != map.end())
		id = ++index;

	map.emplace(id, std::move(value));
	return id;
}

template <typename T>
inline bool unregisterFirebaseValue(uint32_t id, std::map<uint32_t, T>& map)
{
	return map.erase(id) != 0;
}

// ============================================================
// firebase::Variant <-> gm::wire converters
// ============================================================
//
// Covers Realtime Database (values/priorities), Remote Config (GetAll/
// defaults) and Cloud Functions (call args/results) - the three products
// that speak firebase::Variant. Firestore uses its own richer FieldValue and
// gets a separate converter in GMFirebase_firestore.*.
//
// Outbound (C++ -> GML): a Variant has no meaning on its own on the wire, so
// rather than returning a GMValue (a read-only view over already-decoded
// bytes) we append it directly onto an in-progress ArrayStream/StructStream -
// the same stream that ends up passed as a callback.call(...) argument or
// returned as a struct-typed value.
void pushVariantToArray(const firebase::Variant& v, gm::wire::ArrayStream& out);
void addVariantToStruct(const char* key, const firebase::Variant& v, gm::wire::StructStream& out);

// Same conversion as pushVariantToArray(), but writes the value directly onto
// a top-level DataStream instead of boxing it as an array element - used for
// "Any"-typed returns where the caller wants the value itself (a plain real/
// string/array/struct/undefined), not a 1-element array wrapper.
void writeVariantToStream(const firebase::Variant& v, gm::wire::DataStream& out);

// Inbound (GML -> C++): reconstructs a firebase::Variant from a decoded
// incoming GMValue, recursing through GMArrayView/GMObjectView for
// vector/map values.
firebase::Variant gmValueToVariant(const gm::wire::GMValue& value);
