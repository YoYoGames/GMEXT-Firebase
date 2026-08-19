#include "GMFirebase_database.h"

using firebase::database::Database;
using firebase::database::DatabaseReference;
using firebase::database::Query;
using firebase::database::DataSnapshot;
using firebase::database::Error;

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

static Query* resolve_db_query(uint64_t ref)
{
	Query* q = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_DATABASE_QUERY, Query, g_db_query_map, q);
	return q;
}

static std::string futureErrorMessage(const char* message)
{
	return message != nullptr ? std::string(message) : std::string();
}

// ============================================================
// Database
// ============================================================

uint64_t firebase_database_get_instance()
{
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(-1, "firebase app is not initialized");
		return 0;
	}

	firebase::InitResult init_result = firebase::kInitResultSuccess;
	Database* db = Database::GetInstance(app, &init_result);
	if (db == nullptr || init_result != firebase::kInitResultSuccess)
	{
		setFirebaseLastError((int)init_result, "failed to get Realtime Database instance");
		return 0;
	}

	return registerFirebasePointer(db, GM_FB_TYPE_DATABASE);
}

uint64_t firebase_database_get_instance_for_url(std::string_view url)
{
	firebase::App* app = getFirebaseApp();
	if (app == nullptr)
	{
		setFirebaseLastError(-1, "firebase app is not initialized");
		return 0;
	}

	std::string url_str(url);
	firebase::InitResult init_result = firebase::kInitResultSuccess;
	Database* db = Database::GetInstance(app, url_str.c_str(), &init_result);
	if (db == nullptr || init_result != firebase::kInitResultSuccess)
	{
		setFirebaseLastError((int)init_result, "failed to get Realtime Database instance for url");
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

double firebase_database_go_offline(uint64_t db_ref)
{
	Database* db = resolve_database(db_ref);
	if (db == nullptr) return 0;
	db->GoOffline();
	return 1;
}

double firebase_database_go_online(uint64_t db_ref)
{
	Database* db = resolve_database(db_ref);
	if (db == nullptr) return 0;
	db->GoOnline();
	return 1;
}

double firebase_database_purge_outstanding_writes(uint64_t db_ref)
{
	Database* db = resolve_database(db_ref);
	if (db == nullptr) return 0;
	db->PurgeOutstandingWrites();
	return 1;
}

double firebase_database_set_persistence_enabled(uint64_t db_ref, double enabled)
{
	Database* db = resolve_database(db_ref);
	if (db == nullptr) return 0;
	db->set_persistence_enabled(enabled != 0);
	return 1;
}

double firebase_database_set_log_level(uint64_t db_ref, gm_enums::FirebaseLogLevel log_level)
{
	Database* db = resolve_database(db_ref);
	if (db == nullptr) return 0;
	db->set_log_level((firebase::LogLevel)(int)log_level);
	return 1;
}

gm_enums::FirebaseLogLevel firebase_database_get_log_level(uint64_t db_ref)
{
	Database* db = resolve_database(db_ref);
	if (db == nullptr) return (gm_enums::FirebaseLogLevel)0;
	return (gm_enums::FirebaseLogLevel)(int)db->log_level();
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

static double query_set_keep_synchronized(Query* q, double keep_sync)
{
	if (q == nullptr) return 0;
	q->SetKeepSynchronized(keep_sync != 0);
	return 1;
}

static double query_is_valid(Query* q)
{
	if (q == nullptr) return 0;
	return q->is_valid() ? 1 : 0;
}

static double query_get_value(Query* q, const std::optional<gm::wire::GMFunction>& callback)
{
	if (q == nullptr) return 0;
	q->GetValue().OnCompletion([callback](const firebase::Future<DataSnapshot>& future) {
		if (!callback) return;
		if (future.error() == firebase::database::kErrorNone && future.result() != nullptr)
		{
			uint64_t snapshot_ref = registerDatabaseSnapshot(*future.result());
			callback->call((double)future.error(), futureErrorMessage(future.error_message()), snapshot_ref);
		}
		else
		{
			callback->call((double)future.error(), futureErrorMessage(future.error_message()), (uint64_t)0);
		}
	});
	return 1;
}

static uint64_t query_add_value_listener(Query* q,
	const std::optional<gm::wire::GMFunction>& on_value_changed,
	const std::optional<gm::wire::GMFunction>& on_cancelled)
{
	if (q == nullptr) return 0;
	GMFirebaseValueListener* listener = new GMFirebaseValueListener();
	listener->on_value_changed = on_value_changed;
	listener->on_cancelled = on_cancelled;
	q->AddValueListener(listener);
	return registerFirebasePointer(listener, GM_FB_TYPE_DATABASE_VALUE_LISTENER);
}

static double query_remove_value_listener(Query* q, uint64_t listener_ref)
{
	if (q == nullptr) return 0;
	GMFirebaseValueListener* listener = nullptr;
	validate_fb_ref_ptr(listener_ref, GM_FB_TYPE_DATABASE_VALUE_LISTENER, GMFirebaseValueListener, listener);
	if (listener == nullptr) return 0;
	q->RemoveValueListener(listener);
	listener = static_cast<GMFirebaseValueListener*>(unregisterFirebasePointer(listener_ref, GM_FB_TYPE_DATABASE_VALUE_LISTENER));
	delete listener;
	return 1;
}

static double query_remove_all_value_listeners(Query* q)
{
	if (q == nullptr) return 0;
	// Does not (and cannot) delete the GMFirebaseValueListener heap instances
	// this query's equivalents were registered with - GML must still call
	// remove_value_listener on each ref it holds to free them.
	q->RemoveAllValueListeners();
	return 1;
}

static uint64_t query_add_child_listener(Query* q,
	const std::optional<gm::wire::GMFunction>& on_child_added,
	const std::optional<gm::wire::GMFunction>& on_child_changed,
	const std::optional<gm::wire::GMFunction>& on_child_moved,
	const std::optional<gm::wire::GMFunction>& on_child_removed,
	const std::optional<gm::wire::GMFunction>& on_cancelled)
{
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

static double query_remove_child_listener(Query* q, uint64_t listener_ref)
{
	if (q == nullptr) return 0;
	GMFirebaseChildListener* listener = nullptr;
	validate_fb_ref_ptr(listener_ref, GM_FB_TYPE_DATABASE_CHILD_LISTENER, GMFirebaseChildListener, listener);
	if (listener == nullptr) return 0;
	q->RemoveChildListener(listener);
	listener = static_cast<GMFirebaseChildListener*>(unregisterFirebasePointer(listener_ref, GM_FB_TYPE_DATABASE_CHILD_LISTENER));
	delete listener;
	return 1;
}

static double query_remove_all_child_listeners(Query* q)
{
	if (q == nullptr) return 0;
	q->RemoveAllChildListeners();
	return 1;
}

// ---- firebase_database_ref_* (operate on a GM_FB_TYPE_DATABASE_REF handle) ----

uint64_t firebase_database_ref_order_by_child(uint64_t ref, std::string_view path) { return query_order_by_child(resolve_db_ref(ref), path); }
uint64_t firebase_database_ref_order_by_key(uint64_t ref) { return query_order_by_key(resolve_db_ref(ref)); }
uint64_t firebase_database_ref_order_by_value(uint64_t ref) { return query_order_by_value(resolve_db_ref(ref)); }
uint64_t firebase_database_ref_order_by_priority(uint64_t ref) { return query_order_by_priority(resolve_db_ref(ref)); }
uint64_t firebase_database_ref_start_at(uint64_t ref, const gm::wire::GMValue& order_value) { return query_start_at(resolve_db_ref(ref), order_value); }
uint64_t firebase_database_ref_start_at_key(uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key) { return query_start_at_key(resolve_db_ref(ref), order_value, child_key); }
uint64_t firebase_database_ref_end_at(uint64_t ref, const gm::wire::GMValue& order_value) { return query_end_at(resolve_db_ref(ref), order_value); }
uint64_t firebase_database_ref_end_at_key(uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key) { return query_end_at_key(resolve_db_ref(ref), order_value, child_key); }
uint64_t firebase_database_ref_equal_to(uint64_t ref, const gm::wire::GMValue& order_value) { return query_equal_to(resolve_db_ref(ref), order_value); }
uint64_t firebase_database_ref_equal_to_key(uint64_t ref, const gm::wire::GMValue& order_value, std::string_view child_key) { return query_equal_to_key(resolve_db_ref(ref), order_value, child_key); }
uint64_t firebase_database_ref_limit_to_first(uint64_t ref, double limit) { return query_limit_to_first(resolve_db_ref(ref), limit); }
uint64_t firebase_database_ref_limit_to_last(uint64_t ref, double limit) { return query_limit_to_last(resolve_db_ref(ref), limit); }
double firebase_database_ref_set_keep_synchronized(uint64_t ref, double keep_sync) { return query_set_keep_synchronized(resolve_db_ref(ref), keep_sync); }
double firebase_database_ref_get_value(uint64_t ref, const std::optional<gm::wire::GMFunction>& callback) { return query_get_value(resolve_db_ref(ref), callback); }
uint64_t firebase_database_ref_add_value_listener(uint64_t ref, const std::optional<gm::wire::GMFunction>& on_value_changed, const std::optional<gm::wire::GMFunction>& on_cancelled) { return query_add_value_listener(resolve_db_ref(ref), on_value_changed, on_cancelled); }
double firebase_database_ref_remove_value_listener(uint64_t ref, uint64_t listener_ref) { return query_remove_value_listener(resolve_db_ref(ref), listener_ref); }
double firebase_database_ref_remove_all_value_listeners(uint64_t ref) { return query_remove_all_value_listeners(resolve_db_ref(ref)); }
uint64_t firebase_database_ref_add_child_listener(uint64_t ref,
	const std::optional<gm::wire::GMFunction>& on_child_added,
	const std::optional<gm::wire::GMFunction>& on_child_changed,
	const std::optional<gm::wire::GMFunction>& on_child_moved,
	const std::optional<gm::wire::GMFunction>& on_child_removed,
	const std::optional<gm::wire::GMFunction>& on_cancelled)
{
	return query_add_child_listener(resolve_db_ref(ref), on_child_added, on_child_changed, on_child_moved, on_child_removed, on_cancelled);
}
double firebase_database_ref_remove_child_listener(uint64_t ref, uint64_t listener_ref) { return query_remove_child_listener(resolve_db_ref(ref), listener_ref); }
double firebase_database_ref_remove_all_child_listeners(uint64_t ref) { return query_remove_all_child_listeners(resolve_db_ref(ref)); }

// ---- firebase_database_query_* (operate on a GM_FB_TYPE_DATABASE_QUERY handle) ----

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
double firebase_database_query_set_keep_synchronized(uint64_t ref, double keep_sync) { return query_set_keep_synchronized(resolve_db_query(ref), keep_sync); }
double firebase_database_query_is_valid(uint64_t ref) { return query_is_valid(resolve_db_query(ref)); }
double firebase_database_query_get_value(uint64_t ref, const std::optional<gm::wire::GMFunction>& callback) { return query_get_value(resolve_db_query(ref), callback); }
uint64_t firebase_database_query_add_value_listener(uint64_t ref, const std::optional<gm::wire::GMFunction>& on_value_changed, const std::optional<gm::wire::GMFunction>& on_cancelled) { return query_add_value_listener(resolve_db_query(ref), on_value_changed, on_cancelled); }
double firebase_database_query_remove_value_listener(uint64_t ref, uint64_t listener_ref) { return query_remove_value_listener(resolve_db_query(ref), listener_ref); }
double firebase_database_query_remove_all_value_listeners(uint64_t ref) { return query_remove_all_value_listeners(resolve_db_query(ref)); }
uint64_t firebase_database_query_add_child_listener(uint64_t ref,
	const std::optional<gm::wire::GMFunction>& on_child_added,
	const std::optional<gm::wire::GMFunction>& on_child_changed,
	const std::optional<gm::wire::GMFunction>& on_child_moved,
	const std::optional<gm::wire::GMFunction>& on_child_removed,
	const std::optional<gm::wire::GMFunction>& on_cancelled)
{
	return query_add_child_listener(resolve_db_query(ref), on_child_added, on_child_changed, on_child_moved, on_child_removed, on_cancelled);
}
double firebase_database_query_remove_child_listener(uint64_t ref, uint64_t listener_ref) { return query_remove_child_listener(resolve_db_query(ref), listener_ref); }
double firebase_database_query_remove_all_child_listeners(uint64_t ref) { return query_remove_all_child_listeners(resolve_db_query(ref)); }

double firebase_database_query_release(uint64_t ref)
{
	if (gm_fb_ref_ext(ref) != GM_FIREBASE_EXT || gm_fb_ref_type(ref) != GM_FB_TYPE_DATABASE_QUERY) return 0;
	return unregisterFirebaseValue(gm_fb_ref_id(ref), g_db_query_map) ? 1 : 0;
}

// ============================================================
// DatabaseReference-only surface
// ============================================================

// Consolidates key/is_root/is_valid/get_reference/get_parent/get_root/
// get_database/get_url into a single call. `reference`/`parent`/`root` are
// newly registered GM_FB_TYPE_DATABASE_REF refs owned by the caller -
// release them with firebase_database_ref_release(). `database` is a
// GM_FB_TYPE_DATABASE ref (not owned/released, same as every other
// Database-returning getter in this extension). If `ref` is not a valid
// registered DatabaseReference, returns a default-constructed struct (key "",
// is_root/is_valid false, reference/parent/root/database 0, url "").
gm_structs::FirebaseDatabaseReferenceInfo firebase_database_ref_get(uint64_t ref)
{
	gm_structs::FirebaseDatabaseReferenceInfo out{};

	DatabaseReference* r = resolve_db_ref(ref);
	if (r == nullptr) return out;

	out.key = r->key_string();
	out.is_root = r->is_root();
	out.is_valid = r->is_valid();
	out.reference = query_get_reference(r);
	out.parent = registerDatabaseReference(r->GetParent());
	out.root = registerDatabaseReference(r->GetRoot());
	Database* db = r->database();
	out.database = db != nullptr ? registerFirebasePointer(db, GM_FB_TYPE_DATABASE) : 0;
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

double firebase_database_ref_go_online(uint64_t ref)
{
	DatabaseReference* r = resolve_db_ref(ref);
	if (r == nullptr) return 0;
	r->GoOnline();
	return 1;
}

double firebase_database_ref_go_offline(uint64_t ref)
{
	DatabaseReference* r = resolve_db_ref(ref);
	if (r == nullptr) return 0;
	r->GoOffline();
	return 1;
}

double firebase_database_ref_set_value(uint64_t ref, const gm::wire::GMValue& value, const std::optional<gm::wire::GMFunction>& callback)
{
	DatabaseReference* r = resolve_db_ref(ref);
	if (r == nullptr) return 0;
	r->SetValue(gmValueToVariant(value)).OnCompletion([callback](const firebase::Future<void>& future) {
		if (callback) callback->call((double)future.error(), futureErrorMessage(future.error_message()));
	});
	return 1;
}

double firebase_database_ref_set_priority(uint64_t ref, const gm::wire::GMValue& priority, const std::optional<gm::wire::GMFunction>& callback)
{
	DatabaseReference* r = resolve_db_ref(ref);
	if (r == nullptr) return 0;
	r->SetPriority(gmValueToVariant(priority)).OnCompletion([callback](const firebase::Future<void>& future) {
		if (callback) callback->call((double)future.error(), futureErrorMessage(future.error_message()));
	});
	return 1;
}

double firebase_database_ref_set_value_and_priority(uint64_t ref, const gm::wire::GMValue& value, const gm::wire::GMValue& priority, const std::optional<gm::wire::GMFunction>& callback)
{
	DatabaseReference* r = resolve_db_ref(ref);
	if (r == nullptr) return 0;
	r->SetValueAndPriority(gmValueToVariant(value), gmValueToVariant(priority)).OnCompletion([callback](const firebase::Future<void>& future) {
		if (callback) callback->call((double)future.error(), futureErrorMessage(future.error_message()));
	});
	return 1;
}

double firebase_database_ref_update_children(uint64_t ref, const gm::wire::GMValue& values, const std::optional<gm::wire::GMFunction>& callback)
{
	DatabaseReference* r = resolve_db_ref(ref);
	if (r == nullptr) return 0;
	r->UpdateChildren(gmValueToVariant(values)).OnCompletion([callback](const firebase::Future<void>& future) {
		if (callback) callback->call((double)future.error(), futureErrorMessage(future.error_message()));
	});
	return 1;
}

double firebase_database_ref_remove_value(uint64_t ref, const std::optional<gm::wire::GMFunction>& callback)
{
	DatabaseReference* r = resolve_db_ref(ref);
	if (r == nullptr) return 0;
	r->RemoveValue().OnCompletion([callback](const firebase::Future<void>& future) {
		if (callback) callback->call((double)future.error(), futureErrorMessage(future.error_message()));
	});
	return 1;
}

double firebase_database_ref_run_transaction(uint64_t ref, const std::optional<gm::wire::GMFunction>& callback)
{
	// Deliberate stub. RunTransaction()'s handler is invoked synchronously
	// (possibly multiple times, for optimistic-concurrency retries) directly
	// on the Realtime Database SDK's own run-loop thread, and must return a
	// TransactionResult (commit/abort) before that call unwinds. There is no
	// way to round-trip "pause this SDK thread, ask GML for a decision,
	// resume" over this wire without either a blocking cross-thread wait
	// (risking deadlock against the single-threaded GML step loop that is
	// also responsible for draining the DispatchQueue the answer would
	// arrive on) or a from-scratch mid-flight MutableData object model - both
	// out of scope for this pass. This always fails with
	// kErrorTransactionAbortedByUser so callers can detect it deterministically
	// instead of hanging; use ref_get_value()+ref_set_value() (accepting the
	// non-atomicity) as a manual fallback for now.
	(void)ref;
	setFirebaseLastError((int)firebase::database::kErrorTransactionAbortedByUser,
		"RunTransaction is not supported by this extension - synchronous mid-transaction GML callbacks cannot be round-tripped across the wire");
	if (callback)
	{
		callback->call((double)firebase::database::kErrorTransactionAbortedByUser,
			std::string("RunTransaction is not supported by this extension"), (uint64_t)0);
	}
	return 0;
}

double firebase_database_ref_release(uint64_t ref)
{
	if (gm_fb_ref_ext(ref) != GM_FIREBASE_EXT || gm_fb_ref_type(ref) != GM_FB_TYPE_DATABASE_REF) return 0;
	return unregisterFirebaseValue(gm_fb_ref_id(ref), g_db_ref_map) ? 1 : 0;
}
