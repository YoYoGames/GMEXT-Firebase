#pragma once

#include "native/GMFirebaseInternal_native.h"
#include "GMFirebase_common.h"
#include "firebase/database.h"

// ============================================================
// Value-copy registries
// ============================================================
// DatabaseReference/Query/DataSnapshot are cheap SDK value objects with no
// stable address of their own, so (per GMFirebase_common.h's documented
// convention) each type gets its own module-owned registry map + index
// counter and goes through registerFirebaseValue<T>()/validate_fb_ref_map.

extern std::map<uint32_t, firebase::database::DatabaseReference> g_db_ref_map;
extern uint32_t g_db_ref_index;

extern std::map<uint32_t, firebase::database::Query> g_db_query_map;
extern uint32_t g_db_query_index;

extern std::map<uint32_t, firebase::database::DataSnapshot> g_db_snapshot_map;
extern uint32_t g_db_snapshot_index;

// Registers a value copy and returns a packed GM_FB_TYPE_DATABASE_REF /
// GM_FB_TYPE_DATABASE_QUERY / GM_FB_TYPE_DATA_SNAPSHOT ref respectively.
// Defined in GMFirebase_database.cpp (ref/query) and
// GMFirebase_database_snapshot.cpp (snapshot).
uint64_t registerDatabaseReference(const firebase::database::DatabaseReference& ref);
uint64_t registerDatabaseQuery(const firebase::database::Query& query);
uint64_t registerDatabaseSnapshot(const firebase::database::DataSnapshot& snapshot);

// ============================================================
// Listeners
// ============================================================
// Heap-allocated subclasses, each owning the gm::wire::GMFunction(s) it was
// registered with. GML receives only a 32-bit registry id packed into the
// uint64 handle; the native pointer itself never crosses the ABI. Value and
// child listeners intentionally use different type codes, so passing a child
// listener handle to remove_value_listener (or vice versa) is rejected rather
// than reinterpreting one C++ listener type as the other.
//
// A removed listener is never deleted. On desktop Query::RemoveValueListener
// only flags the registration and schedules the real removal on the SDK's
// worker thread, so a callback can still be entering the listener when the
// call returns (event_registration.cc: a callback running at removal "must be
// handled by a mutex from within the callback"). Instead the listener is
// retired - its slots cleared and alive dropped under g_db_listener_mutex,
// which every OnX checks before reading a slot - and the shell goes back to a
// per-type pool for the next add. Android serialises removal in Java and iOS
// delivers on the game thread, so there the lock is simply uncontended.

extern std::mutex g_db_listener_mutex;

class GMFirebaseValueListener : public firebase::database::ValueListener
{
public:
	// alive and the slots are guarded by g_db_listener_mutex; query is only
	// touched from the GML thread.
	bool alive = false;
	firebase::database::Query query;
	std::optional<gm::wire::GMFunction> on_value_changed;
	std::optional<gm::wire::GMFunction> on_cancelled;

	void arm(const firebase::database::Query& q,
		std::optional<gm::wire::GMFunction> value_changed,
		std::optional<gm::wire::GMFunction> cancelled);
	void retire();

	void OnValueChanged(const firebase::database::DataSnapshot& snapshot) override;
	void OnCancelled(const firebase::database::Error& error, const char* error_message) override;
};

class GMFirebaseChildListener : public firebase::database::ChildListener
{
public:
	bool alive = false;
	firebase::database::Query query;
	std::optional<gm::wire::GMFunction> on_child_added;
	std::optional<gm::wire::GMFunction> on_child_changed;
	std::optional<gm::wire::GMFunction> on_child_moved;
	std::optional<gm::wire::GMFunction> on_child_removed;
	std::optional<gm::wire::GMFunction> on_cancelled;

	void arm(const firebase::database::Query& q,
		std::optional<gm::wire::GMFunction> child_added,
		std::optional<gm::wire::GMFunction> child_changed,
		std::optional<gm::wire::GMFunction> child_moved,
		std::optional<gm::wire::GMFunction> child_removed,
		std::optional<gm::wire::GMFunction> cancelled);
	void retire();

	void OnChildAdded(const firebase::database::DataSnapshot& snapshot, const char* previous_sibling_key) override;
	void OnChildChanged(const firebase::database::DataSnapshot& snapshot, const char* previous_sibling_key) override;
	void OnChildMoved(const firebase::database::DataSnapshot& snapshot, const char* previous_sibling_key) override;
	void OnChildRemoved(const firebase::database::DataSnapshot& snapshot) override;
	void OnCancelled(const firebase::database::Error& error, const char* error_message) override;
};
