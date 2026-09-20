#include "GMFirebase_database.h"

using firebase::database::DataSnapshot;
using firebase::database::DatabaseReference;
using firebase::database::Error;
using firebase::database::Query;

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
// Listeners
// ============================================================
// Every virtual below fires on a Firebase-owned thread (the desktop worker,
// a JNI thread, the iOS main queue). GMFunction::call() locks DispatchQueue's
// mutex internally, so the call itself needs no queueing of our own; what
// does need care is the listener's own state, because on desktop a removal
// only flags the SDK registration and an event already dequeued can still
// arrive (GMFirebase_database.h). liveSlot copies the slot out under the
// listener lock and reads nothing on the listener afterwards, which is what
// lets a retired shell be reused while such an event is still on its way in.

std::mutex g_db_listener_mutex;

static std::optional<gm::wire::GMFunction> liveSlot(const bool& alive, const std::optional<gm::wire::GMFunction>& slot)
{
	std::lock_guard<std::mutex> lock(g_db_listener_mutex);
	if (!alive) return std::nullopt;
	return slot;
}

// ============================================================
// GMFirebaseValueListener
// ============================================================

void GMFirebaseValueListener::arm(const Query& q, std::optional<gm::wire::GMFunction> value_changed, std::optional<gm::wire::GMFunction> cancelled)
{
	query = q;
	std::lock_guard<std::mutex> lock(g_db_listener_mutex);
	alive = true;
	on_value_changed = std::move(value_changed);
	on_cancelled = std::move(cancelled);
}

void GMFirebaseValueListener::retire()
{
	// The slots are moved out under the lock and destroyed after it, so the
	// GML function ids are released - a dispatch-queue enqueue - outside it.
	std::optional<gm::wire::GMFunction> value_changed;
	std::optional<gm::wire::GMFunction> cancelled;
	{
		std::lock_guard<std::mutex> lock(g_db_listener_mutex);
		alive = false;
		value_changed.swap(on_value_changed);
		cancelled.swap(on_cancelled);
	}
	query = Query();
}

void GMFirebaseValueListener::OnValueChanged(const DataSnapshot& snapshot)
{
	auto callback = liveSlot(alive, on_value_changed);
	if (!callback) return;
	callback->call(registerDatabaseSnapshot(snapshot));
}

void GMFirebaseValueListener::OnCancelled(const Error& error, const char* error_message)
{
	auto callback = liveSlot(alive, on_cancelled);
	if (!callback) return;
	callback->call((double)error, std::string(error_message != nullptr ? error_message : ""));
}

// ============================================================
// GMFirebaseChildListener
// ============================================================

void GMFirebaseChildListener::arm(const Query& q, std::optional<gm::wire::GMFunction> child_added, std::optional<gm::wire::GMFunction> child_changed,
	std::optional<gm::wire::GMFunction> child_moved, std::optional<gm::wire::GMFunction> child_removed, std::optional<gm::wire::GMFunction> cancelled)
{
	query = q;
	std::lock_guard<std::mutex> lock(g_db_listener_mutex);
	alive = true;
	on_child_added = std::move(child_added);
	on_child_changed = std::move(child_changed);
	on_child_moved = std::move(child_moved);
	on_child_removed = std::move(child_removed);
	on_cancelled = std::move(cancelled);
}

void GMFirebaseChildListener::retire()
{
	std::optional<gm::wire::GMFunction> child_added;
	std::optional<gm::wire::GMFunction> child_changed;
	std::optional<gm::wire::GMFunction> child_moved;
	std::optional<gm::wire::GMFunction> child_removed;
	std::optional<gm::wire::GMFunction> cancelled;
	{
		std::lock_guard<std::mutex> lock(g_db_listener_mutex);
		alive = false;
		child_added.swap(on_child_added);
		child_changed.swap(on_child_changed);
		child_moved.swap(on_child_moved);
		child_removed.swap(on_child_removed);
		cancelled.swap(on_cancelled);
	}
	query = Query();
}

void GMFirebaseChildListener::OnChildAdded(const DataSnapshot& snapshot, const char* previous_sibling_key)
{
	auto callback = liveSlot(alive, on_child_added);
	if (!callback) return;
	callback->call(registerDatabaseSnapshot(snapshot), std::string(previous_sibling_key != nullptr ? previous_sibling_key : ""));
}

void GMFirebaseChildListener::OnChildChanged(const DataSnapshot& snapshot, const char* previous_sibling_key)
{
	auto callback = liveSlot(alive, on_child_changed);
	if (!callback) return;
	callback->call(registerDatabaseSnapshot(snapshot), std::string(previous_sibling_key != nullptr ? previous_sibling_key : ""));
}

void GMFirebaseChildListener::OnChildMoved(const DataSnapshot& snapshot, const char* previous_sibling_key)
{
	auto callback = liveSlot(alive, on_child_moved);
	if (!callback) return;
	callback->call(registerDatabaseSnapshot(snapshot), std::string(previous_sibling_key != nullptr ? previous_sibling_key : ""));
}

void GMFirebaseChildListener::OnChildRemoved(const DataSnapshot& snapshot)
{
	auto callback = liveSlot(alive, on_child_removed);
	if (!callback) return;
	callback->call(registerDatabaseSnapshot(snapshot));
}

void GMFirebaseChildListener::OnCancelled(const Error& error, const char* error_message)
{
	auto callback = liveSlot(alive, on_cancelled);
	if (!callback) return;
	callback->call((double)error, std::string(error_message != nullptr ? error_message : ""));
}
