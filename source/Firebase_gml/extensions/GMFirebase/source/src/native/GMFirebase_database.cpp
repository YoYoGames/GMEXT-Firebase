#include "GMFirebase_database.h"
#include <memory>

using firebase::database::Database;
using firebase::database::DatabaseReference;
using firebase::database::Query;
using firebase::database::DataSnapshot;
using firebase::database::Error;
using gm_enums::FirebaseError;

// FirebaseDatabaseError mirrors firebase::database::Error, the error_code every
// database callback receives. See GM_FB_PIN_ENUM in GMFirebase_common.h.
GM_FB_PIN_ENUM(gm_enums::FirebaseDatabaseError::None, firebase::database::kErrorNone);
GM_FB_PIN_ENUM(gm_enums::FirebaseDatabaseError::Disconnected, firebase::database::kErrorDisconnected);
GM_FB_PIN_ENUM(gm_enums::FirebaseDatabaseError::ExpiredToken, firebase::database::kErrorExpiredToken);
GM_FB_PIN_ENUM(gm_enums::FirebaseDatabaseError::InvalidToken, firebase::database::kErrorInvalidToken);
GM_FB_PIN_ENUM(gm_enums::FirebaseDatabaseError::MaxRetries, firebase::database::kErrorMaxRetries);
GM_FB_PIN_ENUM(gm_enums::FirebaseDatabaseError::NetworkError, firebase::database::kErrorNetworkError);
GM_FB_PIN_ENUM(gm_enums::FirebaseDatabaseError::OperationFailed, firebase::database::kErrorOperationFailed);
GM_FB_PIN_ENUM(gm_enums::FirebaseDatabaseError::OverriddenBySet, firebase::database::kErrorOverriddenBySet);
GM_FB_PIN_ENUM(gm_enums::FirebaseDatabaseError::PermissionDenied, firebase::database::kErrorPermissionDenied);
GM_FB_PIN_ENUM(gm_enums::FirebaseDatabaseError::Unavailable, firebase::database::kErrorUnavailable);
GM_FB_PIN_ENUM(gm_enums::FirebaseDatabaseError::UnknownError, firebase::database::kErrorUnknownError);
GM_FB_PIN_ENUM(gm_enums::FirebaseDatabaseError::WriteCanceled, firebase::database::kErrorWriteCanceled);
GM_FB_PIN_ENUM(gm_enums::FirebaseDatabaseError::InvalidVariantType, firebase::database::kErrorInvalidVariantType);
GM_FB_PIN_ENUM(gm_enums::FirebaseDatabaseError::ConflictingOperationInProgress, firebase::database::kErrorConflictingOperationInProgress);
GM_FB_PIN_ENUM(gm_enums::FirebaseDatabaseError::TransactionAbortedByUser, firebase::database::kErrorTransactionAbortedByUser);

// ============================================================
// Value-copy registries (DatabaseReference / Query)
// ============================================================
// DataSnapshot's map+index pair lives in GMFirebase_database_snapshot.cpp,
// next to the rest of the snapshot/listener implementation.

std::map<uint32_t, DatabaseReference> g_db_ref_map;
uint32_t g_db_ref_index = 0;

std::map<uint32_t, Query> g_db_query_map;
uint32_t g_db_query_index = 0;

uint64_t registerDatabaseReference(const DatabaseReference& ref)
{
	uint32_t id = registerFirebaseValue(ref, g_db_ref_index, g_db_ref_map);
	return packFirebaseRef(id, GM_FB_TYPE_DATABASE_REF);
}

uint64_t registerDatabaseQuery(const Query& query)
{
	uint32_t id = registerFirebaseValue(query, g_db_query_index, g_db_query_map);
	return packFirebaseRef(id, GM_FB_TYPE_DATABASE_QUERY);
}

static Database* resolve_database(uint64_t ref)
{
	Database* db = nullptr;
	validate_fb_ref_ptr(ref, GM_FB_TYPE_DATABASE, Database, db);
	return db;
}

static DatabaseReference* resolve_db_ref(uint64_t ref)
{
	DatabaseReference* r = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_DATABASE_REF, DatabaseReference, g_db_ref_map, r);
	return r;
}

// A DatabaseReference is a Query in the SDK, so the firebase_database_query_*
// family accepts either handle; the reference resolves to its own registry
// entry and is used through the base class.
static Query* resolve_db_query(uint64_t ref)
{
	if (gm_fb_ref_ext(ref) == GM_FIREBASE_EXT && gm_fb_ref_type(ref) == GM_FB_TYPE_DATABASE_REF)
		return resolve_db_ref(ref);
	Query* q = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_DATABASE_QUERY, Query, g_db_query_map, q);
	return q;
}

// ============================================================
// Database
// ============================================================

uint64_t firebase_database_get_instance()
{
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase app is not initialized");
		return 0;
	}

	firebase::InitResult init_result = firebase::kInitResultSuccess;
	Database* db = Database::GetInstance(app, &init_result);
	if (db == nullptr || init_result != firebase::kInitResultSuccess)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, firebaseInitResultMessage("failed to get Realtime Database instance", init_result));
		return 0;
	}

	return registerFirebasePointer(db, GM_FB_TYPE_DATABASE);
}

uint64_t firebase_database_get_instance_for_url(std::string_view url)
{
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, "firebase app is not initialized");
		return 0;
	}

	std::string url_str(url);
	firebase::InitResult init_result = firebase::kInitResultSuccess;
	Database* db = Database::GetInstance(app, url_str.c_str(), &init_result);
	if (db == nullptr || init_result != firebase::kInitResultSuccess)
	{
		setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, firebaseInitResultMessage("failed to get Realtime Database instance for url", init_result));
		return 0;
	}

	return registerFirebasePointer(db, GM_FB_TYPE_DATABASE);
}

std::string firebase_database_get_url(uint64_t db_ref)
{
	Database* db = resolve_database(db_ref);
	if (db == nullptr) return std::string();
	return std::string(db->url());
}

uint64_t firebase_database_get_reference(uint64_t db_ref)
{
	Database* db = resolve_database(db_ref);
	if (db == nullptr) return 0;
	return registerDatabaseReference(db->GetReference());
}

uint64_t firebase_database_get_reference_at_path(uint64_t db_ref, std::string_view path)
{
	Database* db = resolve_database(db_ref);
	if (db == nullptr) return 0;
	std::string path_str(path);
	return registerDatabaseReference(db->GetReference(path_str.c_str()));
}

uint64_t firebase_database_get_reference_from_url(uint64_t db_ref, std::string_view url)
{
	Database* db = resolve_database(db_ref);
	if (db == nullptr) return 0;
	std::string url_str(url);
	return registerDatabaseReference(db->GetReferenceFromUrl(url_str.c_str()));
}

bool firebase_database_go_offline(uint64_t db_ref)
{
	Database* db = resolve_database(db_ref);
	if (db == nullptr) return false;
	db->GoOffline();
	return true;
}

bool firebase_database_go_online(uint64_t db_ref)
{
	Database* db = resolve_database(db_ref);
	if (db == nullptr) return false;
	db->GoOnline();
	return true;
}

bool firebase_database_purge_outstanding_writes(uint64_t db_ref)
{
	Database* db = resolve_database(db_ref);
	if (db == nullptr) return false;
	db->PurgeOutstandingWrites();
	return true;
}

bool firebase_database_set_persistence_enabled(uint64_t db_ref, bool enabled)
{
	Database* db = resolve_database(db_ref);
	if (db == nullptr) return false;
	db->set_persistence_enabled(enabled);
	return true;
}

bool firebase_database_set_log_level(uint64_t db_ref, gm_enums::FirebaseLogLevel log_level)
{
	Database* db = resolve_database(db_ref);
	if (db == nullptr) return false;
	firebase::LogLevel sdk_level;
	if (!toSdkLogLevel(log_level, sdk_level))
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_database_set_log_level: log_level must be a FirebaseLogLevel value");
		return false;
	}
	db->set_log_level(sdk_level);
	return true;
}

gm_enums::FirebaseLogLevel firebase_database_get_log_level(uint64_t db_ref)
{
	Database* db = resolve_database(db_ref);
	if (db == nullptr) return gm_enums::FirebaseLogLevel::Verbose;
	return static_cast<gm_enums::FirebaseLogLevel>(db->log_level());
}

// ============================================================
// Query surface (shared by DatabaseReference and Query - DatabaseReference
// IS-A Query, so every one of these helpers just takes a Query* and works
// unmodified for either caller).
// ============================================================

static uint64_t query_order_by_child(Query* q, std::string_view path)
{
	if (q == nullptr) return 0;
	std::string path_str(path);
	return registerDatabaseQuery(q->OrderByChild(path_str.c_str()));
}

static uint64_t query_order_by_key(Query* q)
{
	if (q == nullptr) return 0;
	return registerDatabaseQuery(q->OrderByKey());
}

static uint64_t query_order_by_value(Query* q)
{
	if (q == nullptr) return 0;
	return registerDatabaseQuery(q->OrderByValue());
}

static uint64_t query_order_by_priority(Query* q)
{
	if (q == nullptr) return 0;
	return registerDatabaseQuery(q->OrderByPriority());
}

static uint64_t query_start_at(Query* q, const gm::wire::GMValue& order_value)
{
	if (q == nullptr) return 0;
	return registerDatabaseQuery(q->StartAt(gmValueToVariant(order_value)));
}

static uint64_t query_start_at_key(Query* q, const gm::wire::GMValue& order_value, std::string_view child_key)
{
	if (q == nullptr) return 0;
	std::string key_str(child_key);
	return registerDatabaseQuery(q->StartAt(gmValueToVariant(order_value), key_str.c_str()));
}

static uint64_t query_end_at(Query* q, const gm::wire::GMValue& order_value)
{
	if (q == nullptr) return 0;
	return registerDatabaseQuery(q->EndAt(gmValueToVariant(order_value)));
}

static uint64_t query_end_at_key(Query* q, const gm::wire::GMValue& order_value, std::string_view child_key)
{
	if (q == nullptr) return 0;
	std::string key_str(child_key);
	return registerDatabaseQuery(q->EndAt(gmValueToVariant(order_value), key_str.c_str()));
}

static uint64_t query_equal_to(Query* q, const gm::wire::GMValue& order_value)
{
	if (q == nullptr) return 0;
	return registerDatabaseQuery(q->EqualTo(gmValueToVariant(order_value)));
}

static uint64_t query_equal_to_key(Query* q, const gm::wire::GMValue& order_value, std::string_view child_key)
{
	if (q == nullptr) return 0;
	std::string key_str(child_key);
	return registerDatabaseQuery(q->EqualTo(gmValueToVariant(order_value), key_str.c_str()));
}

static uint64_t query_limit_to_first(Query* q, double limit)
{
	if (q == nullptr) return 0;
	return registerDatabaseQuery(q->LimitToFirst((size_t)limit));
}

static uint64_t query_limit_to_last(Query* q, double limit)
{
	if (q == nullptr) return 0;
	return registerDatabaseQuery(q->LimitToLast((size_t)limit));
}

static uint64_t query_get_reference(Query* q)
{
	if (q == nullptr) return 0;
	return registerDatabaseReference(q->GetReference());
}

static bool query_set_keep_synchronized(Query* q, bool keep_sync)
{
	if (q == nullptr) return false;
	q->SetKeepSynchronized(keep_sync);
	return true;
}

static bool query_is_valid(Query* q)
{
	if (q == nullptr) return false;
	return q->is_valid();
}

static FirebaseError query_get_value(Query* q, const char* function, const std::optional<gm::wire::GMFunction>& callback)
{
	if (q == nullptr) return FirebaseError::InvalidHandle;
	firebase::Future<DataSnapshot> pending = q->GetValue();
	if (!firebaseFutureArmed(pending, function)) return FirebaseError::InvalidHandle;
	pending.OnCompletion([callback](const firebase::Future<DataSnapshot>& future) {
		completeFuture(callback, future, registerDatabaseSnapshot);
	});
	return FirebaseError::Ok;
}

static uint64_t query_add_value_listener(Query* q,
	const std::optional<gm::wire::GMFunction>& on_value_changed,
	const std::optional<gm::wire::GMFunction>& on_cancelled)
{
	// A listener with nothing to call is a no-op the game would still have
	// to remove; refused like every other registration in this extension.
	if (!on_value_changed.has_value() && !on_cancelled.has_value())
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_database add_value_listener: at least one callback is required");
		return 0;
	}
	if (q == nullptr) return 0;
	GMFirebaseValueListener* listener = new GMFirebaseValueListener();
	listener->on_value_changed = on_value_changed;
	listener->on_cancelled = on_cancelled;
	q->AddValueListener(listener);
	return registerFirebasePointer(listener, GM_FB_TYPE_DATABASE_VALUE_LISTENER);
}

static bool query_remove_value_listener(Query* q, uint64_t listener_ref)
{
	if (q == nullptr) return false;
	GMFirebaseValueListener* listener = nullptr;
	validate_fb_ref_ptr(listener_ref, GM_FB_TYPE_DATABASE_VALUE_LISTENER, GMFirebaseValueListener, listener);
	if (listener == nullptr) return false;
	q->RemoveValueListener(listener);
	listener = static_cast<GMFirebaseValueListener*>(unregisterFirebasePointer(listener_ref, GM_FB_TYPE_DATABASE_VALUE_LISTENER));
	delete listener;
	return true;
}

static bool query_remove_all_value_listeners(Query* q)
{
	if (q == nullptr) return false;
	// Does not (and cannot) delete the GMFirebaseValueListener heap instances
	// this query's equivalents were registered with - GML must still call
	// remove_value_listener on each ref it holds to free them.
	q->RemoveAllValueListeners();
	return true;
}

static uint64_t query_add_child_listener(Query* q,
	const std::optional<gm::wire::GMFunction>& on_child_added,
	const std::optional<gm::wire::GMFunction>& on_child_changed,
	const std::optional<gm::wire::GMFunction>& on_child_moved,
	const std::optional<gm::wire::GMFunction>& on_child_removed,
	const std::optional<gm::wire::GMFunction>& on_cancelled)
{
	if (!on_child_added.has_value() && !on_child_changed.has_value() && !on_child_moved.has_value()
		&& !on_child_removed.has_value() && !on_cancelled.has_value())
	{
		setFirebaseLastError(GM_FB_ERROR_INVALID_ARGUMENT, "firebase_database add_child_listener: at least one callback is required");
		return 0;
	}
	if (q == nullptr) return 0;
	GMFirebaseChildListener* listener = new GMFirebaseChildListener();
	listener->on_child_added = on_child_added;
	listener->on_child_changed = on_child_changed;
	listener->on_child_moved = on_child_moved;
	listener->on_child_removed = on_child_removed;
	listener->on_cancelled = on_cancelled;
	q->AddChildListener(listener);
	return registerFirebasePointer(listener, GM_FB_TYPE_DATABASE_CHILD_LISTENER);
}

static bool query_remove_child_listener(Query* q, uint64_t listener_ref)
{
	if (q == nullptr) return false;
	GMFirebaseChildListener* listener = nullptr;
	validate_fb_ref_ptr(listener_ref, GM_FB_TYPE_DATABASE_CHILD_LISTENER, GMFirebaseChildListener, listener);
	if (listener == nullptr) return false;
	q->RemoveChildListener(listener);
	listener = static_cast<GMFirebaseChildListener*>(unregisterFirebasePointer(listener_ref, GM_FB_TYPE_DATABASE_CHILD_LISTENER));
	delete listener;
	return true;
}

static bool query_remove_all_child_listeners(Query* q)
{
	if (q == nullptr) return false;
	q->RemoveAllChildListeners();
	return true;
}

// ---- firebase_database_query_* (a GM_FB_TYPE_DATABASE_REF or GM_FB_TYPE_DATABASE_QUERY handle) ----

uint64_t firebase_database_query_order_by_child(uint64_t ref, std::string_view path) { return query_order_by_child(resolve_db_query(ref), path); }
uint64_t firebase_database_query_order_by_key(uint64_t ref) { return query_order_by_key(resolve_db_query(ref)); }
uint64_t firebase_database_query_order_by_value(uint64_t ref) { return query_order_by_value(resolve_db_query(ref)); }
uint64_t firebase_database_query_order_by_priority(uint64_t ref) { return query_order_by_priority(resolve_db_query(ref)); }
uint64_t firebase_database_query_start_at(uint64_t ref, const gm::wire::GMValue& order_value) { return query_start_at(resolve_db_query(ref), order_value); }
uint64_t firebase_database_query_start_at_key(uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key) { return query_start_at_key(resolve_db_query(ref), order_value, child_key); }
uint64_t firebase_database_query_end_at(uint64_t ref, const gm::wire::GMValue& order_value) { return query_end_at(resolve_db_query(ref), order_value); }
uint64_t firebase_database_query_end_at_key(uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key) { return query_end_at_key(resolve_db_query(ref), order_value, child_key); }
uint64_t firebase_database_query_equal_to(uint64_t ref, const gm::wire::GMValue& order_value) { return query_equal_to(resolve_db_query(ref), order_value); }
uint64_t firebase_database_query_equal_to_key(uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key) { return query_equal_to_key(resolve_db_query(ref), order_value, child_key); }
uint64_t firebase_database_query_limit_to_first(uint64_t ref, double limit) { return query_limit_to_first(resolve_db_query(ref), limit); }
uint64_t firebase_database_query_limit_to_last(uint64_t ref, double limit) { return query_limit_to_last(resolve_db_query(ref), limit); }
uint64_t firebase_database_query_get_reference(uint64_t ref) { return query_get_reference(resolve_db_query(ref)); }
bool firebase_database_query_set_keep_synchronized(uint64_t ref, bool keep_sync) { return query_set_keep_synchronized(resolve_db_query(ref), keep_sync); }
bool firebase_database_query_is_valid(uint64_t ref) { return query_is_valid(resolve_db_query(ref)); }
FirebaseError firebase_database_query_get_value(uint64_t ref, const std::optional<gm::wire::GMFunction>& callback) { return query_get_value(resolve_db_query(ref), "firebase_database_query_get_value", callback); }
uint64_t firebase_database_query_add_value_listener(uint64_t ref, const std::optional<gm::wire::GMFunction>& on_value_changed, const std::optional<gm::wire::GMFunction>& on_cancelled) { return query_add_value_listener(resolve_db_query(ref), on_value_changed, on_cancelled); }
bool firebase_database_query_remove_value_listener(uint64_t ref, uint64_t listener_ref) { return query_remove_value_listener(resolve_db_query(ref), listener_ref); }
bool firebase_database_query_remove_all_value_listeners(uint64_t ref) { return query_remove_all_value_listeners(resolve_db_query(ref)); }
uint64_t firebase_database_query_add_child_listener(uint64_t ref,
	const std::optional<gm::wire::GMFunction>& on_child_added,
	const std::optional<gm::wire::GMFunction>& on_child_changed,
	const std::optional<gm::wire::GMFunction>& on_child_moved,
	const std::optional<gm::wire::GMFunction>& on_child_removed,
	const std::optional<gm::wire::GMFunction>& on_cancelled)
{
	return query_add_child_listener(resolve_db_query(ref), on_child_added, on_child_changed, on_child_moved, on_child_removed, on_cancelled);
}
bool firebase_database_query_remove_child_listener(uint64_t ref, uint64_t listener_ref) { return query_remove_child_listener(resolve_db_query(ref), listener_ref); }
bool firebase_database_query_remove_all_child_listeners(uint64_t ref) { return query_remove_all_child_listeners(resolve_db_query(ref)); }

void firebase_database_query_release(uint64_t ref)
{
	if (resolve_db_query(ref) == nullptr) return;
	unregisterFirebaseValue(gm_fb_ref_id(ref), g_db_query_map);
}

// ============================================================
// DatabaseReference-only surface
// ============================================================

// The scalar view of a reference: key, is_root, is_valid and url. It carries
// no handles - get_parent/get_root/get_database/query_get_reference are the
// getters for those. undefined for a handle that does not resolve
// (InvalidHandle is already recorded); is_valid inside the struct is the
// SDK's own answer.
std::optional<gm_structs::FirebaseDatabaseReferenceInfo> firebase_database_ref_get(uint64_t ref)
{
	DatabaseReference* r = resolve_db_ref(ref);
	if (r == nullptr) return std::nullopt;

	gm_structs::FirebaseDatabaseReferenceInfo out{};
	out.key = r->key_string();
	out.is_root = r->is_root();
	out.is_valid = r->is_valid();
	out.url = r->url();

	return out;
}

uint64_t firebase_database_ref_child(uint64_t ref, std::string_view path)
{
	DatabaseReference* r = resolve_db_ref(ref);
	if (r == nullptr) return 0;
	std::string path_str(path);
	return registerDatabaseReference(r->Child(path_str.c_str()));
}

uint64_t firebase_database_ref_push(uint64_t ref)
{
	DatabaseReference* r = resolve_db_ref(ref);
	if (r == nullptr) return 0;
	return registerDatabaseReference(r->PushChild());
}

bool firebase_database_ref_go_online(uint64_t ref)
{
	DatabaseReference* r = resolve_db_ref(ref);
	if (r == nullptr) return false;
	r->GoOnline();
	return true;
}

bool firebase_database_ref_go_offline(uint64_t ref)
{
	DatabaseReference* r = resolve_db_ref(ref);
	if (r == nullptr) return false;
	r->GoOffline();
	return true;
}

FirebaseError firebase_database_ref_set_value(uint64_t ref, const gm::wire::GMValue& value, const std::optional<gm::wire::GMFunction>& callback)
{
	DatabaseReference* r = resolve_db_ref(ref);
	if (r == nullptr) return FirebaseError::InvalidHandle;
	firebase::Future<void> pending = r->SetValue(gmValueToVariant(value));
	if (!firebaseFutureArmed(pending, "firebase_database_ref_set_value")) return FirebaseError::InvalidHandle;
	pending.OnCompletion([callback](const firebase::Future<void>& future) {
		completeFuture(callback, future);
	});
	return FirebaseError::Ok;
}

FirebaseError firebase_database_ref_set_priority(uint64_t ref, const gm::wire::GMValue& priority, const std::optional<gm::wire::GMFunction>& callback)
{
	DatabaseReference* r = resolve_db_ref(ref);
	if (r == nullptr) return FirebaseError::InvalidHandle;
	firebase::Future<void> pending = r->SetPriority(gmValueToVariant(priority));
	if (!firebaseFutureArmed(pending, "firebase_database_ref_set_priority")) return FirebaseError::InvalidHandle;
	pending.OnCompletion([callback](const firebase::Future<void>& future) {
		completeFuture(callback, future);
	});
	return FirebaseError::Ok;
}

FirebaseError firebase_database_ref_set_value_and_priority(uint64_t ref, const gm::wire::GMValue& value, const gm::wire::GMValue& priority, const std::optional<gm::wire::GMFunction>& callback)
{
	DatabaseReference* r = resolve_db_ref(ref);
	if (r == nullptr) return FirebaseError::InvalidHandle;
	firebase::Future<void> pending = r->SetValueAndPriority(gmValueToVariant(value), gmValueToVariant(priority));
	if (!firebaseFutureArmed(pending, "firebase_database_ref_set_value_and_priority")) return FirebaseError::InvalidHandle;
	pending.OnCompletion([callback](const firebase::Future<void>& future) {
		completeFuture(callback, future);
	});
	return FirebaseError::Ok;
}

FirebaseError firebase_database_ref_update_children(uint64_t ref, const gm::wire::GMValue& values, const std::optional<gm::wire::GMFunction>& callback)
{
	DatabaseReference* r = resolve_db_ref(ref);
	if (r == nullptr) return FirebaseError::InvalidHandle;
	firebase::Future<void> pending = r->UpdateChildren(gmValueToVariant(values));
	if (!firebaseFutureArmed(pending, "firebase_database_ref_update_children")) return FirebaseError::InvalidHandle;
	pending.OnCompletion([callback](const firebase::Future<void>& future) {
		completeFuture(callback, future);
	});
	return FirebaseError::Ok;
}

FirebaseError firebase_database_ref_remove_value(uint64_t ref, const std::optional<gm::wire::GMFunction>& callback)
{
	DatabaseReference* r = resolve_db_ref(ref);
	if (r == nullptr) return FirebaseError::InvalidHandle;
	firebase::Future<void> pending = r->RemoveValue();
	if (!firebaseFutureArmed(pending, "firebase_database_ref_remove_value")) return FirebaseError::InvalidHandle;
	pending.OnCompletion([callback](const firebase::Future<void>& future) {
		completeFuture(callback, future);
	});
	return FirebaseError::Ok;
}

FirebaseError firebase_database_ref_run_transaction(uint64_t ref, const std::optional<gm::wire::GMFunction>& callback)
{
	// Intentional limitation. RunTransaction()'s handler is invoked synchronously
	// (possibly multiple times, for optimistic-concurrency retries) directly
	// on the Realtime Database SDK's own run-loop thread, and must return a
	// TransactionResult (commit/abort) before that call unwinds. There is no
	// way to round-trip "pause this SDK thread, ask GML for a decision,
	// resume" over this wire without either a blocking cross-thread wait
	// (risking deadlock against the single-threaded GML step loop that is
	// also responsible for draining the DispatchQueue the answer would
	// arrive on) or a from-scratch mid-flight MutableData object model - both
	// out of scope for this pass. The call never reaches the SDK, so it fails
	// synchronously like every other pre-SDK failure and the callback is not
	// touched; use ref_get_value()+ref_set_value() (accepting the
	// non-atomicity) as a manual fallback for now.
	(void)ref;
	(void)callback;
	setFirebaseLastError(GM_FB_ERROR_UNSUPPORTED,
		"RunTransaction is not supported by this extension - synchronous mid-transaction GML callbacks cannot be round-tripped across the wire");
	return FirebaseError::Unsupported;
}

void firebase_database_ref_release(uint64_t ref)
{
	if (resolve_db_ref(ref) == nullptr) return;
	unregisterFirebaseValue(gm_fb_ref_id(ref), g_db_ref_map);
}

// ============================================================
// DatabaseReference handle getters + server timestamp + OnDisconnect
// ============================================================

bool firebase_database_ref_is_valid(uint64_t ref)
{
    DatabaseReference* r = resolve_db_ref(ref);
    return (r && r->is_valid());
}

uint64_t firebase_database_ref_get_parent(uint64_t ref)
{
    DatabaseReference* r = resolve_db_ref(ref);
    return r ? registerDatabaseReference(r->GetParent()) : 0;
}

uint64_t firebase_database_ref_get_root(uint64_t ref)
{
    DatabaseReference* r = resolve_db_ref(ref);
    return r ? registerDatabaseReference(r->GetRoot()) : 0;
}

uint64_t firebase_database_ref_get_database(uint64_t ref)
{
    DatabaseReference* r = resolve_db_ref(ref);
    Database* db = r ? r->database() : nullptr;
    return db ? registerFirebasePointer(db, GM_FB_TYPE_DATABASE) : 0;
}

gm::wire::DataStream firebase_database_server_timestamp()
{
    gm::wire::DataStream out;
    writeVariantToStream(firebase::database::ServerTimestamp(), out);
    return out;
}

namespace
{
#if !FIREBASE_PLATFORM_DESKTOP
    // On Android and iOS the SDK caches the DisconnectionHandler inside the
    // DatabaseReference's internal and deletes it with that internal; desktop
    // hands back a fresh caller-owned one per call. Minting from a private copy
    // of the reference gives GML the desktop contract everywhere: the handler
    // handle outlives the reference handle it came from and is released once.
    // Guarded by g_firebase_value_registry_mutex like every other map of SDK
    // value objects.
    std::map<firebase::database::DisconnectionHandler*, std::unique_ptr<DatabaseReference>> g_on_disconnect_owner;
#endif

    firebase::database::DisconnectionHandler* resolveOnDisconnect(uint64_t handler_ref)
    {
        firebase::database::DisconnectionHandler* handler = nullptr;
        validate_fb_ref_ptr(handler_ref, GM_FB_TYPE_DATABASE_ON_DISCONNECT, firebase::database::DisconnectionHandler, handler);
        return handler;
    }

    FirebaseError completeDisconnectFuture(firebase::Future<void> future, const char* function, const std::optional<gm::wire::GMFunction>& callback)
    {
        if (!firebaseFutureArmed(future, function)) return FirebaseError::InvalidHandle;
        future.OnCompletion([callback](const firebase::Future<void>& f)
        {
            completeFuture(callback, f);
        });
        return FirebaseError::Ok;
    }
}

uint64_t firebase_database_ref_on_disconnect(uint64_t ref)
{
    DatabaseReference* r = resolve_db_ref(ref);
    if (!r) return 0;
#if FIREBASE_PLATFORM_DESKTOP
    auto* handler = r->OnDisconnect();
    return handler ? registerFirebasePointer(handler, GM_FB_TYPE_DATABASE_ON_DISCONNECT) : 0;
#else
    // The copy's handler cache starts empty, so this is a new handler owned by
    // the copy. The unique_ptr keeps the copy where it is when it moves into
    // the map, which is what keeps the handler's owner fixed.
    auto owner = std::make_unique<DatabaseReference>(*r);
    auto* handler = owner->OnDisconnect();
    if (!handler) return 0;
    {
        std::lock_guard<std::mutex> lock(g_firebase_value_registry_mutex);
        g_on_disconnect_owner[handler] = std::move(owner);
    }
    return registerFirebasePointer(handler, GM_FB_TYPE_DATABASE_ON_DISCONNECT);
#endif
}

FirebaseError firebase_database_on_disconnect_cancel(uint64_t handler_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    auto* h = resolveOnDisconnect(handler_ref);
    return h ? completeDisconnectFuture(h->Cancel(), "firebase_database_on_disconnect_cancel", callback) : FirebaseError::InvalidHandle;
}

FirebaseError firebase_database_on_disconnect_remove_value(uint64_t handler_ref, const std::optional<gm::wire::GMFunction>& callback)
{
    auto* h = resolveOnDisconnect(handler_ref);
    return h ? completeDisconnectFuture(h->RemoveValue(), "firebase_database_on_disconnect_remove_value", callback) : FirebaseError::InvalidHandle;
}

FirebaseError firebase_database_on_disconnect_set_value(uint64_t handler_ref, const gm::wire::GMValue& value,
    const std::optional<gm::wire::GMFunction>& callback)
{
    auto* h = resolveOnDisconnect(handler_ref);
    return h ? completeDisconnectFuture(h->SetValue(gmValueToVariant(value)), "firebase_database_on_disconnect_set_value", callback) : FirebaseError::InvalidHandle;
}

FirebaseError firebase_database_on_disconnect_set_value_and_priority(uint64_t handler_ref,
    const gm::wire::GMValue& value, const gm::wire::GMValue& priority,
    const std::optional<gm::wire::GMFunction>& callback)
{
    auto* h = resolveOnDisconnect(handler_ref);
    return h ? completeDisconnectFuture(h->SetValueAndPriority(gmValueToVariant(value), gmValueToVariant(priority)), "firebase_database_on_disconnect_set_value_and_priority", callback) : FirebaseError::InvalidHandle;
}

FirebaseError firebase_database_on_disconnect_update_children(uint64_t handler_ref, const gm::wire::GMValue& values,
    const std::optional<gm::wire::GMFunction>& callback)
{
    auto* h = resolveOnDisconnect(handler_ref);
    return h ? completeDisconnectFuture(h->UpdateChildren(gmValueToVariant(values)), "firebase_database_on_disconnect_update_children", callback) : FirebaseError::InvalidHandle;
}

void firebase_database_on_disconnect_release(uint64_t handler_ref)
{
    auto* h = static_cast<firebase::database::DisconnectionHandler*>(
        unregisterFirebasePointer(handler_ref, GM_FB_TYPE_DATABASE_ON_DISCONNECT));
    if (!h) return;
#if FIREBASE_PLATFORM_DESKTOP
    delete h;
#else
    // Dropping the owning reference copy is what deletes the handler.
    std::lock_guard<std::mutex> lock(g_firebase_value_registry_mutex);
    g_on_disconnect_owner.erase(h);
#endif
}

uint64_t firebase_database_get_app(uint64_t db_ref)
{
    Database* db = resolve_database(db_ref);
    return db ? wrapFirebaseApp(db->app()) : 0;
}

uint64_t firebase_database_get_instance_for_app(uint64_t app_ref)
{
    auto* app = resolveFirebaseApp(app_ref); if (!app) return 0;
    firebase::InitResult init_result = firebase::kInitResultSuccess;
    auto* db = Database::GetInstance(app, &init_result);
    if (!db || init_result != firebase::kInitResultSuccess) { setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, firebaseInitResultMessage("failed to get Realtime Database instance for app", init_result)); return 0; }
    return registerFirebasePointer(db, GM_FB_TYPE_DATABASE);
}

uint64_t firebase_database_get_instance_for_app_url(uint64_t app_ref, std::string_view url)
{
    auto* app = resolveFirebaseApp(app_ref); if (!app) return 0;
    std::string u(url); firebase::InitResult init_result = firebase::kInitResultSuccess;
    auto* db = Database::GetInstance(app, u.c_str(), &init_result);
    if (!db || init_result != firebase::kInitResultSuccess) { setFirebaseLastError(GM_FB_ERROR_NOT_INITIALIZED, firebaseInitResultMessage("failed to get Realtime Database instance for app/url", init_result)); return 0; }
    return registerFirebasePointer(db, GM_FB_TYPE_DATABASE);
}
