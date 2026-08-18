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

// Returns everything about the snapshot at this location - except its value/
// priority, see firebase_database_snapshot_get_value()/get_priority() below -
// as a FirebaseDataSnapshotInfo struct. `reference` is a newly registered
// DatabaseReference ref that the caller owns and must release with
// firebase_database_ref_release(). If `ref` is not a valid registered
// snapshot, returns a default-constructed struct (key "",
// exists/is_valid/has_children false, children_count 0, reference 0) - same
// convention as firebase_remote_config_get_info().
gm_structs::FirebaseDataSnapshotInfo firebase_database_snapshot_get_info(uint64_t ref)
{
	gm_structs::FirebaseDataSnapshotInfo info{};

	DataSnapshot* s = resolve_db_snapshot(ref);
	if (s == nullptr) return info;

	info.key = s->key_string();
	info.exists = s->exists();
	info.is_valid = s->is_valid();
	info.has_children = s->has_children();
	info.children_count = static_cast<double>(s->children_count());
	info.reference = registerDatabaseReference(s->GetReference());

	return info;
}

// Returns everything about the snapshot at this location, including its
// dynamically-typed value/priority (undefined/bool/real/string/array/struct,
// arbitrarily nested for array/struct), mirroring whatever shape the data
// actually has. `reference` is a newly registered DatabaseReference ref that
// the caller owns and must release with firebase_database_ref_release(). If
// `ref` is not a valid registered snapshot, returns a default-constructed
// struct (key "", exists/is_valid/has_children false, children_count 0,
// reference 0, value/priority undefined) - same convention as
// firebase_database_snapshot_get_info().
gm_structs::FirebaseDataSnapshot firebase_database_snapshot_get_value(uint64_t ref)
{
	gm_structs::FirebaseDataSnapshot snapshot{};

	DataSnapshot* s = resolve_db_snapshot(ref);
	if (s == nullptr)
	{
		gm::wire::DataStream value_out;
		value_out << std::optional<std::uint8_t>{};
		snapshot.value = value_out;

		gm::wire::DataStream priority_out;
		priority_out << std::optional<std::uint8_t>{};
		snapshot.priority = priority_out;

		return snapshot;
	}

	gm::wire::DataStream value_out;
	writeVariantToStream(s->value(), value_out);
	snapshot.value = value_out;

	gm::wire::DataStream priority_out;
	writeVariantToStream(s->priority(), priority_out);
	snapshot.priority = priority_out;

	snapshot.key = s->key_string();
	snapshot.exists = s->exists();
	snapshot.is_valid = s->is_valid();
	snapshot.has_children = s->has_children();
	snapshot.children_count = static_cast<double>(s->children_count());
	snapshot.reference = registerDatabaseReference(s->GetReference());

	return snapshot;
}

// Same convention as get_value(), applied to the snapshot's priority instead.
gm::wire::DataStream firebase_database_snapshot_get_priority(uint64_t ref)
{
	gm::wire::DataStream out;
	// DataSnapshot* s = resolve_db_snapshot(ref);
	// if (s == nullptr)
	// 	out << std::optional<std::uint8_t>{};
	// else
	// 	writeVariantToStream(s->priority(), out);

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
