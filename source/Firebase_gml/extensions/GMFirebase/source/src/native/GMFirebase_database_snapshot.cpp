#include "GMFirebase_database.h"

using firebase::database::DataSnapshot;
using firebase::database::DatabaseReference;
using firebase::database::Error;

// ============================================================
// Value-copy registry (DataSnapshot)
// ============================================================

std::map<uint32_t, DataSnapshot> g_db_snapshot_map;
uint32_t g_db_snapshot_index = 0;

uint64_t registerDatabaseSnapshot(const DataSnapshot& snapshot)
{
	uint32_t id = registerFirebaseValue(snapshot, g_db_snapshot_index, g_db_snapshot_map);
	return packFirebaseRef(id, GM_FB_TYPE_DATA_SNAPSHOT);
}

static DataSnapshot* resolve_db_snapshot(uint64_t ref)
{
	DataSnapshot* s = nullptr;
	validate_fb_ref_map(ref, GM_FB_TYPE_DATA_SNAPSHOT, DataSnapshot, g_db_snapshot_map, s);
	return s;
}

// ============================================================
// DataSnapshot
// ============================================================

double firebase_database_snapshot_exists(uint64_t ref)
{
	DataSnapshot* s = resolve_db_snapshot(ref);
	if (s == nullptr) return 0;
	return s->exists() ? 1 : 0;
}

double firebase_database_snapshot_is_valid(uint64_t ref)
{
	DataSnapshot* s = resolve_db_snapshot(ref);
	if (s == nullptr) return 0;
	return s->is_valid() ? 1 : 0;
}

uint64_t firebase_database_snapshot_child(uint64_t ref, std::string_view path)
{
	DataSnapshot* s = resolve_db_snapshot(ref);
	if (s == nullptr) return 0;
	std::string path_str(path);
	return registerDatabaseSnapshot(s->Child(path_str.c_str()));
}

double firebase_database_snapshot_has_child(uint64_t ref, std::string_view path)
{
	DataSnapshot* s = resolve_db_snapshot(ref);
	if (s == nullptr) return 0;
	std::string path_str(path);
	return s->HasChild(path_str.c_str()) ? 1 : 0;
}

double firebase_database_snapshot_has_children(uint64_t ref)
{
	DataSnapshot* s = resolve_db_snapshot(ref);
	if (s == nullptr) return 0;
	return s->has_children() ? 1 : 0;
}

double firebase_database_snapshot_children_count(uint64_t ref)
{
	DataSnapshot* s = resolve_db_snapshot(ref);
	if (s == nullptr) return 0;
	return (double)s->children_count();
}

// Returns an array of GM_FB_TYPE_DATA_SNAPSHOT refs, one per child, in
// Query-defined iteration order. Each ref is independently owned and must be
// released with firebase_database_snapshot_release() by the caller.
gm::wire::DataStream firebase_database_snapshot_get_children(uint64_t ref)
{
	gm::wire::ArrayStream arr;
	DataSnapshot* s = resolve_db_snapshot(ref);
	if (s != nullptr)
	{
		std::vector<DataSnapshot> children = s->children();
		for (const DataSnapshot& child : children)
			arr.push(registerDatabaseSnapshot(child));
	}

	gm::wire::DataStream out;
	out << arr;
	return out;
}

std::string firebase_database_snapshot_key(uint64_t ref)
{
	DataSnapshot* s = resolve_db_snapshot(ref);
	if (s == nullptr) return std::string();
	return s->key_string();
}

uint64_t firebase_database_snapshot_get_reference(uint64_t ref)
{
	DataSnapshot* s = resolve_db_snapshot(ref);
	if (s == nullptr) return 0;
	return registerDatabaseReference(s->GetReference());
}

// Returns the snapshot's value as-is: a real/string/bool/undefined for a
// scalar, or an array/struct for a vector/map, matching whatever shape the
// data at this location actually has. A Firebase Variant is dynamically
// typed with no fixed gmval shape of its own, so this writes directly onto
// the wire via writeVariantToStream() rather than through a spec type_hint.
std::optional<gm::wire::DataStream> firebase_database_snapshot_get_value(uint64_t ref)
{
	gm::wire::DataStream out;
	DataSnapshot* s = resolve_db_snapshot(ref);
	if (s == nullptr)
		out << std::optional<std::uint8_t>{};
	else
		writeVariantToStream(s->value(), out);

	return out;
}

// Same convention as get_value(), applied to the snapshot's priority instead.
gm::wire::DataStream firebase_database_snapshot_get_priority(uint64_t ref)
{
	gm::wire::DataStream out;
	DataSnapshot* s = resolve_db_snapshot(ref);
	if (s == nullptr)
		out << std::optional<std::uint8_t>{};
	else
		writeVariantToStream(s->priority(), out);

	return out;
}

double firebase_database_snapshot_release(uint64_t ref)
{
	if (gm_fb_ref_ext(ref) != GM_FIREBASE_EXT || gm_fb_ref_type(ref) != GM_FB_TYPE_DATA_SNAPSHOT) return 0;
	return unregisterFirebaseValue(gm_fb_ref_id(ref), g_db_snapshot_map) ? 1 : 0;
}

// ============================================================
// GMFirebaseValueListener
// ============================================================
// Both virtuals below can fire on a Firebase-owned background/run-loop
// thread; GMFunction::call() is documented as thread-safe (it locks
// DispatchQueue's mutex internally), so calling it directly here - with no
// queueing of our own - matches every other listener in this extension.

void GMFirebaseValueListener::OnValueChanged(const DataSnapshot& snapshot)
{
	if (!on_value_changed) return;
	uint64_t snapshot_ref = registerDatabaseSnapshot(snapshot);
	on_value_changed->call(snapshot_ref);
}

void GMFirebaseValueListener::OnCancelled(const Error& error, const char* error_message)
{
	if (!on_cancelled) return;
	on_cancelled->call((double)error, std::string(error_message != nullptr ? error_message : ""));
}

// ============================================================
// GMFirebaseChildListener
// ============================================================

void GMFirebaseChildListener::OnChildAdded(const DataSnapshot& snapshot, const char* previous_sibling_key)
{
	if (!on_child_added) return;
	uint64_t snapshot_ref = registerDatabaseSnapshot(snapshot);
	on_child_added->call(snapshot_ref, std::string(previous_sibling_key != nullptr ? previous_sibling_key : ""));
}

void GMFirebaseChildListener::OnChildChanged(const DataSnapshot& snapshot, const char* previous_sibling_key)
{
	if (!on_child_changed) return;
	uint64_t snapshot_ref = registerDatabaseSnapshot(snapshot);
	on_child_changed->call(snapshot_ref, std::string(previous_sibling_key != nullptr ? previous_sibling_key : ""));
}

void GMFirebaseChildListener::OnChildMoved(const DataSnapshot& snapshot, const char* previous_sibling_key)
{
	if (!on_child_moved) return;
	uint64_t snapshot_ref = registerDatabaseSnapshot(snapshot);
	on_child_moved->call(snapshot_ref, std::string(previous_sibling_key != nullptr ? previous_sibling_key : ""));
}

void GMFirebaseChildListener::OnChildRemoved(const DataSnapshot& snapshot)
{
	if (!on_child_removed) return;
	uint64_t snapshot_ref = registerDatabaseSnapshot(snapshot);
	on_child_removed->call(snapshot_ref);
}

void GMFirebaseChildListener::OnCancelled(const Error& error, const char* error_message)
{
	if (!on_cancelled) return;
	on_cancelled->call((double)error, std::string(error_message != nullptr ? error_message : ""));
}
