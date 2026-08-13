#pragma once

#include "native/GMFirebaseInternal_native.h"
#include "GMFirebase_common.h"
#include "firebase/storage.h"

// ============================================================
// Value-copy registries
// ============================================================
// StorageReference/Metadata/Controller/StorageListResult are all cheap SDK
// value objects with no stable address of their own (mirroring
// DatabaseReference/Query/DataSnapshot in GMFirebase_database.h), so each
// gets its own module-owned registry map + index counter and goes through
// registerFirebaseValue<T>()/validate_fb_ref_map, per the convention
// documented in GMFirebase_common.h.
//
// Controller is the one exception worth calling out: GML must call
// storage_controller_create() to mint a blank Controller() in
// g_storage_controller_map *before* starting an upload/download, so the
// resulting map-stable address can be handed to the SDK as the
// Controller* out-param and polled (pause/resume/cancel/progress) while the
// transfer is in flight; std::map's pointer-stability-across-insert
// guarantee is what makes that address usable for the lifetime of the
// transfer.

extern std::map<uint32_t, firebase::storage::StorageReference> g_storage_ref_map;
extern uint32_t g_storage_ref_index;

extern std::map<uint32_t, firebase::storage::Metadata> g_storage_metadata_map;
extern uint32_t g_storage_metadata_index;

extern std::map<uint32_t, firebase::storage::Controller> g_storage_controller_map;
extern uint32_t g_storage_controller_index;

extern std::map<uint32_t, firebase::storage::StorageListResult> g_storage_list_result_map;
extern uint32_t g_storage_list_result_index;

uint64_t registerStorageReference(const firebase::storage::StorageReference& ref);
uint64_t registerStorageMetadata(const firebase::storage::Metadata& metadata);
uint64_t registerStorageListResult(const firebase::storage::StorageListResult& result);

// ============================================================
// Listener
// ============================================================
// Heap-allocated per upload/download call so its address is stable for the
// duration of the async transfer; wraps a single "progress" GMFunction that
// both OnPaused/OnProgress forward into with a `paused` flag. bytes so far
// are read directly off the Controller* the SDK hands back into the
// callback (not off our own controller ref/registry), avoiding any need to
// round-trip a ref for the controller from inside the callback.
//
// Lifetime: `new`-ed immediately before the PutBytes/PutFile/GetBytes/
// GetFile call that takes it as `listener`, and `delete`-d inside that same
// call's Future<T>::OnCompletion lambda (which fires exactly once, when the
// transfer has truly finished one way or another).
class GMFirebaseStorageListener : public firebase::storage::Listener
{
public:
	explicit GMFirebaseStorageListener(const gm::wire::GMFunction& fn) : progress_callback(fn) {}

	void OnPaused(firebase::storage::Controller* controller) override;
	void OnProgress(firebase::storage::Controller* controller) override;

private:
	gm::wire::GMFunction progress_callback;
};
