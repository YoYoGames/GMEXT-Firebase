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

bool firebase_database_snapshot_is_valid(uint64_t ref)
{
	DataSnapshot* s = resolve_db_snapshot(ref);
	if (s == nullptr) return false;
	return s->is_valid();
}

uint64_t firebase_database_snapshot_child(uint64_t ref, std::string_view path)
{
	DataSnapshot* s = resolve_db_snapshot(ref);
	if (s == nullptr) return 0;
	std::string path_str(path);
	return registerDatabaseSnapshot(s->Child(path_str.c_str()));
}

bool firebase_database_snapshot_has_child(uint64_t ref, std::string_view path)
{
	DataSnapshot* s = resolve_db_snapshot(ref);
	if (s == nullptr) return false;
	std::string path_str(path);
	return s->HasChild(path_str.c_str());
}

// Returns an array of GM_FB_TYPE_DATA_SNAPSHOT refs, one per child, in
// Query-defined iteration order. Each ref is independently owned and must be
// released with firebase_database_snapshot_release() by the caller.
std::vector<std::uint64_t> firebase_database_snapshot_get_children(uint64_t ref)
{
	std::vector<std::uint64_t> refs;
	DataSnapshot* s = resolve_db_snapshot(ref);
	if (s != nullptr)
	{
		std::vector<DataSnapshot> children = s->children();
		refs.reserve(children.size());
		for (const DataSnapshot& child : children)
			refs.push_back(registerDatabaseSnapshot(child));
	}
	return refs;
}

uint64_t firebase_database_snapshot_get_reference(uint64_t ref)
{
	DataSnapshot* s = resolve_db_snapshot(ref);
	if (s == nullptr) return 0;
	return registerDatabaseReference(s->GetReference());
}

// Returns everything about the snapshot at this location - except its value/
// priority, see firebase_database_snapshot_get_value()/get_priority() below,
// and its reference, which firebase_database_snapshot_get_reference()
// registers as a handle the caller owns - as a FirebaseDataSnapshotInfo
// struct. undefined for a handle that does not resolve (InvalidHandle is
// already recorded); is_valid inside the struct is the SDK's own answer.
std::optional<gm_structs::FirebaseDataSnapshotInfo> firebase_database_snapshot_get_info(uint64_t ref)
{
	DataSnapshot* s = resolve_db_snapshot(ref);
	if (s == nullptr) return std::nullopt;

	gm_structs::FirebaseDataSnapshotInfo info{};
	info.key = s->key_string();
	info.exists = s->exists();
	info.is_valid = s->is_valid();
	info.has_children = s->has_children();
	info.children_count = static_cast<double>(s->children_count());

	return info;
}

// Materializes only the Firebase value at this location. This deliberately
// does NOT construct a GameMaker snapshot wrapper: DataSnapshot identity stays
// in the uint64 handle and GML allocation happens only for the value tree the
// caller explicitly requested.
gm::wire::DataStream firebase_database_snapshot_get_value(uint64_t ref)
{
	gm::wire::DataStream out;
	DataSnapshot* s = resolve_db_snapshot(ref);
	if (s == nullptr)
		out << std::optional<std::uint8_t>{};
	else
		writeVariantToStream(s->value(), out);
	return out;
}

// Same lazy-materialization rule as get_value(), applied to the snapshot's
// priority.
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

void firebase_database_snapshot_release(uint64_t ref)
{
	if (resolve_db_snapshot(ref) == nullptr) return;
	unregisterFirebaseValue(gm_fb_ref_id(ref), g_db_snapshot_map);
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
