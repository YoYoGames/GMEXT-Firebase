#pragma once

#include "firebase/app.h"
#include "firebase/future.h"
#include "firebase/log.h"
#include "firebase/variant.h"
#include <cstdint>
#include <cstdio>
#include <map>
#include <mutex>
#include <optional>
#include <string>
#include <string_view>
#include <type_traits>
#include <utility>
#include <vector>
#include <native/GMFirebaseInternal_native.h>

// ============================================================
// App bootstrap
// ============================================================

// Default App used by the compatibility APIs. Additional named Apps may be
// represented by GM_FB_TYPE_APP handles and passed to explicit *_for_app APIs.
extern firebase::App* g_firebase_app;

firebase::App* getFirebaseApp();
uint64_t wrapFirebaseApp(firebase::App* app);
firebase::App* resolveFirebaseApp(uint64_t ref);

// ============================================================
// Last Error State
// ============================================================

// The synchronous error channel. Written only by a failure that happens
// before the SDK is reached - an unresolved handle, a module used before its
// initialize, a rejected argument - on the thread that made the call, and read
// by GML right after that call returns. An SDK result is delivered to the
// call's own callback and never lands here: a completion lambda or listener
// override that writes this is a contract violation, not a race to lock
// around. The code is always one of the GM_FB_ERROR_* values below.
struct FirebaseLastError
{
	int code = 0;
	std::string message;
};

void setFirebaseLastError(int code, const std::string& message);
gm_enums::FirebaseError firebase_last_error_code();
std::string firebase_last_error_message();

// ============================================================
// Extension-originated error codes
// ============================================================

// Everything the extension reports on its own behalf - a handle that does not
// resolve, a module used before its initialize, a GML argument the SDK would
// reject, a platform that cannot do the call - uses these. They are the
// integer twins of gm_enums::FirebaseError, which is what every asynchronous
// entry point returns instead of touching its callback when the call never
// reached the SDK; the static_asserts keep the two in step. Every SDK error
// enum is zero or positive except the two Unimplemented values at -1, so
// nothing in this band can be read as an SDK result by mistake.
#define GM_FB_ERROR_INVALID_HANDLE (-1000)
#define GM_FB_ERROR_NOT_INITIALIZED (-1001)
#define GM_FB_ERROR_INVALID_ARGUMENT (-1002)
#define GM_FB_ERROR_UNSUPPORTED (-1003)

static_assert(static_cast<int>(gm_enums::FirebaseError::InvalidHandle) == GM_FB_ERROR_INVALID_HANDLE, "FirebaseError.InvalidHandle drifted from GM_FB_ERROR_INVALID_HANDLE");
static_assert(static_cast<int>(gm_enums::FirebaseError::NotInitialized) == GM_FB_ERROR_NOT_INITIALIZED, "FirebaseError.NotInitialized drifted from GM_FB_ERROR_NOT_INITIALIZED");
static_assert(static_cast<int>(gm_enums::FirebaseError::InvalidArgument) == GM_FB_ERROR_INVALID_ARGUMENT, "FirebaseError.InvalidArgument drifted from GM_FB_ERROR_INVALID_ARGUMENT");
static_assert(static_cast<int>(gm_enums::FirebaseError::Unsupported) == GM_FB_ERROR_UNSUPPORTED, "FirebaseError.Unsupported drifted from GM_FB_ERROR_UNSUPPORTED");

// The one InitResult failure the SDK defines is a missing dependency - Google
// Play services on Android. Name it in the message rather than storing the raw
// InitResult as the code, where 1 reads as kAuthErrorFailure.
std::string firebaseInitResultMessage(const char* what, firebase::InitResult result);

// ============================================================
// Enum mirrors
// ============================================================

// Every GMIDL enum that mirrors an SDK enum is pinned to it here or in the
// module that casts it, one static_assert per SDK enumerator. A value the SDK
// renumbers or adds fails the build instead of silently repointing a GML
// constant; when one fires, edit spec.gmidl and regenerate. GML -> SDK goes
// through a switch on the generated symbols with a default that rejects the
// rest; SDK -> GML is a static_cast the pins make safe.
#define GM_FB_PIN_ENUM(gm_value, sdk_value) \
	static_assert(static_cast<int>(gm_value) == static_cast<int>(sdk_value), #gm_value " drifted from " #sdk_value)

GM_FB_PIN_ENUM(gm_enums::FirebaseLogLevel::Verbose, firebase::kLogLevelVerbose);
GM_FB_PIN_ENUM(gm_enums::FirebaseLogLevel::Debug, firebase::kLogLevelDebug);
GM_FB_PIN_ENUM(gm_enums::FirebaseLogLevel::Info, firebase::kLogLevelInfo);
GM_FB_PIN_ENUM(gm_enums::FirebaseLogLevel::Warning, firebase::kLogLevelWarning);
GM_FB_PIN_ENUM(gm_enums::FirebaseLogLevel::Error, firebase::kLogLevelError);
GM_FB_PIN_ENUM(gm_enums::FirebaseLogLevel::Assert, firebase::kLogLevelAssert);

// False for anything outside the enum; the caller records InvalidArgument.
bool toSdkLogLevel(gm_enums::FirebaseLogLevel level, firebase::LogLevel& out);

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

// Auth - shared cross-file plumbing. Auth/User/Credential are each consumed
// from more than one of GMFirebase_auth*.cpp's three files, so the bits that
// need a single definition live here rather than being duplicated or made
// file-static like every other module's registries.
namespace firebase
{
	namespace auth
	{
		class Auth;
		class User;
		class Credential;
		class PhoneAuthCredential;
		struct AuthResult;
	}
}

// Auth is a singleton-per-App like g_firebase_app above (Firebase only ever
// hands back one Auth* per App), so - like the App bootstrap above - it is
// exposed as a lazily-created global accessor instead of minting a
// GM_FB_TYPE_* ref for it. Defined in GMFirebase_auth.cpp.
firebase::auth::Auth* getFirebaseAuth();

// firebase::auth::User is a view of its Auth instance's single current user
// (its only member is the AuthData*, and copies share it), so every User an
// Auth hands out is the same one. The extension keeps one heap User per Auth
// and this returns the same GM_FB_TYPE_AUTH_USER ref for every valid user
// from that Auth, or 0 when `user` is not valid. Nothing is ever freed;
// firebase_auth_user_release() is a no-op kept for API compatibility.
// Defined in GMFirebase_auth_user.cpp.
uint64_t wrapFirebaseUser(firebase::auth::Auth* auth, const firebase::auth::User& user);

// GM_FB_TYPE_AUTH_CREDENTIAL's registry: entries are minted in
// GMFirebase_auth_credential.cpp but looked up from GMFirebase_auth.cpp and
// GMFirebase_auth_user.cpp as sign-in/link/reauthenticate inputs, so unlike
// the file-static maps described above it must be visible to all three.
extern std::map<uint32_t, firebase::auth::Credential> g_auth_credential_map;
extern uint32_t g_auth_credential_index;

// Resolve either a generic Credential handle or a PhoneAuthCredential handle
// into a base Credential copy. This lets all existing sign-in/link/reauth APIs
// accept phone credentials without weakening handle type validation.
bool resolveFirebaseAuthCredential(uint64_t ref, firebase::auth::Credential& out);
uint64_t wrapFirebaseAuthCredential(const firebase::auth::Credential& credential);
bool firebase_auth_resolve_phone_credential(uint64_t ref, firebase::auth::PhoneAuthCredential& out);
// `user_ref` is the handle for result.user, wrapped by the caller (which
// knows the Auth it belongs to); left absent when result.user is not valid.
gm_structs::FirebaseAuthResult makeFirebaseAuthResult(uint64_t user_ref, const firebase::auth::AuthResult& result);

// GM_FB_TYPE_AUTH_FEDERATED_PROVIDER handles are minted in GMFirebase_auth.cpp
// and consumed by both the Auth and the User sign-in paths. Defined in
// GMFirebase_auth.cpp; null (with the last error set) for anything else.
namespace firebase
{
	namespace auth
	{
		class FederatedOAuthProvider;
	}
}
firebase::auth::FederatedOAuthProvider* resolveFederatedProvider(uint64_t provider_ref);

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
#define GM_FB_TYPE_DATABASE_ON_DISCONNECT 0x17 // ptr: DisconnectionHandler - caller-owned on desktop, owned by a private DatabaseReference copy elsewhere (GMFirebase_database.cpp)

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
#define GM_FB_TYPE_STORAGE_DOWNLOAD 0x35     // map: the bytes of a completed GetBytes

// Functions
#define GM_FB_TYPE_FUNCTIONS 0x40           // ptr: firebase::functions::Functions*
#define GM_FB_TYPE_FUNCTIONS_CALLABLE 0x41  // map: HttpsCallableReference

// Remote Config
#define GM_FB_TYPE_REMOTE_CONFIG 0x51   // ptr: firebase::remote_config::RemoteConfig*
#define GM_FB_TYPE_RC_LISTENER_REG 0x50 // ptr: heap-boxed ConfigUpdateListenerRegistration

// App Check
#define GM_FB_TYPE_APPCHECK_LISTENER 0x60 // ptr: our AppCheckListener subclass
#define GM_FB_TYPE_APPCHECK 0x61          // ptr: firebase::app_check::AppCheck*

// User Messaging Platform (UMP)
#define GM_FB_TYPE_UMP_CONSENT_INFO 0x70 // ptr: firebase::ump::ConsentInfo*

// Installations
#define GM_FB_TYPE_INSTALLATIONS 0x81 // ptr: firebase::installations::Installations*

// Cloud Messaging - a surface of global functions and callbacks, no
// per-instance handle (see GMFirebase_messaging.h); the one ref type is a
// received message's binary payload.
#define GM_FB_TYPE_MESSAGING_RAW_DATA 0x90 // map: the bytes of a received message

// ============================================================
// Validation Macros
// ============================================================

// A rejected ref leaves `output` at `sentinel` and records a generic error;
// every call site already checks for that sentinel before touching the handle.
#define gm_fb_ref_reject(output, sentinel) \
	{ \
		setFirebaseLastError(GM_FB_ERROR_INVALID_HANDLE, "invalid handle"); \
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

// One lock for every value-copy registry in the extension. Entries are
// inserted from Firebase completion and listener callbacks, which run on the
// SDK's own threads, and searched/erased from the GML thread by the resolve
// macros and the *_release functions - concurrent access to a std::map is
// undefined behaviour. The maps are tiny and every operation under the lock is
// a single lookup, so one process-wide mutex costs nothing and means no module
// can forget its own. Never call back into the SDK or a GMFunction while
// holding it. Defined in GMFirebase_common.cpp.
extern std::mutex g_firebase_value_registry_mutex;

// Payload is an index into a module-owned registry map; output is a pointer to
// the stored value (never null on success - map entries are never null). The
// pointer stays valid after the lock is dropped because std::map nodes are
// stable across other inserts/erases, and the only erases are the GML-thread
// *_release functions - the same thread that is about to use the pointer.
#define validate_fb_ref_map(ref, type_code, cpp_type, map, output) \
	{ \
		output = nullptr; \
		if (gm_fb_ref_ext(ref) == GM_FIREBASE_EXT && gm_fb_ref_type(ref) == (type_code)) \
		{ \
			std::lock_guard<std::mutex> _registry_lock(g_firebase_value_registry_mutex); \
			auto _search = (map).find(gm_fb_ref_id(ref)); \
			if (_search != (map).end()) \
				output = &_search->second; \
		} \
		if (output == nullptr) gm_fb_ref_reject(output, nullptr) \
	}

// Future<T>::OnCompletion() is a silent no-op on an invalid Future, and the SDK
// hands one back instead of failing when a User is no longer signed in (every
// User method, all three platforms) or a Database, Storage or Functions
// reference is invalid (a bad URL, a stale handler). Check before attaching:
// false has already recorded the last error, and the caller returns
// FirebaseError::InvalidHandle without touching its callback, the same as any
// other failure that never reached the SDK.
template <typename T>
inline bool firebaseFutureArmed(const firebase::Future<T>& future, const char* function)
{
	if (future.status() != firebase::kFutureStatusInvalid)
		return true;

	setFirebaseLastError(GM_FB_ERROR_INVALID_HANDLE, std::string(function) + ": the underlying object is not valid (user signed out, or an invalid reference)");
	return false;
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
	// The index increment sits under the same lock as the insert so two SDK
	// threads completing at once can never mint the same id.
	std::lock_guard<std::mutex> lock(g_firebase_value_registry_mutex);
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
	std::lock_guard<std::mutex> lock(g_firebase_value_registry_mutex);
	return map.erase(id) != 0;
}

// ============================================================
// Future completion
// ============================================================
//
// Every asynchronous entry point ends the same way: the Future completes on
// an SDK thread and the callback gets the error code, the error message and,
// when the GML contract carries the result, one value made from it. That
// ending is written here once. A module whose payload needs more than one
// conversion (a listener to free first, a DataStream that must hold a value
// either way) does that in its own lambda and still comes through here for
// the code and the message.

// error_message() is null on success on some platforms.
inline std::string_view futureErrorMessage(const firebase::FutureBase& f)
{
	const char* message = f.error_message();
	return std::string_view{ message ? message : "" };
}

// callback(error_code, error_message) - a Future<void>, or a Future whose
// result the GML contract does not carry.
template <typename T>
inline void completeFuture(const std::optional<gm::wire::GMFunction>& callback, const firebase::Future<T>& f)
{
	if (!callback.has_value()) return;
	callback->call(static_cast<double>(f.error()), futureErrorMessage(f));
}

// callback(error_code, error_message, value). convert runs on success with a
// non-null result; every other outcome sends a default-constructed value of
// convert's declared return type - 0, an empty string, an absent optional -
// so the argument's wire kind never depends on the outcome. Declare the
// return type on the convert when the failure value has to be an absent
// optional rather than a zero.
template <typename T, typename Convert>
inline void completeFuture(const std::optional<gm::wire::GMFunction>& callback, const firebase::Future<T>& f, Convert&& convert)
{
	if (!callback.has_value()) return;
	using Value = std::decay_t<decltype(convert(*f.result()))>;
	Value value = (f.error() == 0 && f.result() != nullptr) ? Value(convert(*f.result())) : Value{};
	callback->call(static_cast<double>(f.error()), futureErrorMessage(f), value);
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
// returned as a struct-typed value. The three functions are one conversion
// (visitVariant in GMFirebase_common.cpp) with three sinks.
void pushVariantToArray(const firebase::Variant& v, gm::wire::ArrayStream& out);
void addVariantToStruct(const char* key, const firebase::Variant& v, gm::wire::StructStream& out);

// Same conversion as pushVariantToArray(), but writes the value directly onto
// a top-level DataStream instead of boxing it as an array element - used for
// "Any"-typed returns where the caller wants the value itself (a plain real/
// string/array/struct/undefined), not a 1-element array wrapper.
void writeVariantToStream(const firebase::Variant& v, gm::wire::DataStream& out);

// Binary data on the way out. No wire kind carries bytes to GML (a string
// stops the reader at the first 0x00), so the bytes stay native behind a
// FieldValue handle and the generated FirestoreBlob struct carries that
// handle plus the size; the game copies the bytes out with
// firebase_firestore_field_value_blob_copy(). This overload copies the bytes
// into a new FieldValue for the Variant blob branch above; the Firestore
// kBlob branch registers its FieldValue directly (GMFirebase_firestore.h).
// Both are defined in GMFirebase_firestore.cpp, beside the registry.
// owner_snapshot: the DocumentSnapshot ref the decode runs under, or 0.
gm_structs::FirestoreBlob makeFirestoreBlob(const std::uint8_t* data, std::size_t size, uint64_t owner_snapshot);

// Inbound (GML -> C++): reconstructs a firebase::Variant from a decoded
// incoming GMValue, recursing through GMArrayView/GMObjectView for
// vector/map values. Reals, int32/int64, bools, strings, arrays, structs and
// undefined (null) convert; a GML pointer has no Firebase form and is sent
// as null with a logged warning.
firebase::Variant gmValueToVariant(const gm::wire::GMValue& value);

// A gmval field of a generated struct arrives as a gm::wire::DataStream
// holding exactly one encoded value. This re-reads it as the GMValue view the
// converters above take. The view borrows the stream's bytes, so the struct
// must outlive every use of the result - fine for a parameter struct, whose
// lifetime is the call.
gm::wire::GMValue gmValueView(const gm::wire::DataStream& stream);
