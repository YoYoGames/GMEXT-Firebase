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
// registered with. The heap pointer itself is packed as the
// GM_FB_TYPE_DATABASE_LISTENER ref GML gets back from
// add_value_listener/add_child_listener, to be handed back later to
// remove_value_listener/remove_child_listener (which also deletes it).
//
// A ref minted by add_value_listener must only ever be passed back to
// remove_value_listener, and one minted by add_child_listener only to
// remove_child_listener - the two are different C++ types living under the
// same type code (there is only one "our own listener" slot reserved in
// GMFirebase_common.h), so crossing them is undefined behavior.

class GMFirebaseValueListener : public firebase::database::ValueListener
{
public:
	std::optional<gm::wire::GMFunction> on_value_changed;
	std::optional<gm::wire::GMFunction> on_cancelled;

	void OnValueChanged(const firebase::database::DataSnapshot& snapshot) override;
	void OnCancelled(const firebase::database::Error& error, const char* error_message) override;
};

class GMFirebaseChildListener : public firebase::database::ChildListener
{
public:
	std::optional<gm::wire::GMFunction> on_child_added;
	std::optional<gm::wire::GMFunction> on_child_changed;
	std::optional<gm::wire::GMFunction> on_child_moved;
	std::optional<gm::wire::GMFunction> on_child_removed;
	std::optional<gm::wire::GMFunction> on_cancelled;

	void OnChildAdded(const firebase::database::DataSnapshot& snapshot, const char* previous_sibling_key) override;
	void OnChildChanged(const firebase::database::DataSnapshot& snapshot, const char* previous_sibling_key) override;
	void OnChildMoved(const firebase::database::DataSnapshot& snapshot, const char* previous_sibling_key) override;
	void OnChildRemoved(const firebase::database::DataSnapshot& snapshot) override;
	void OnCancelled(const firebase::database::Error& error, const char* error_message) override;
};
