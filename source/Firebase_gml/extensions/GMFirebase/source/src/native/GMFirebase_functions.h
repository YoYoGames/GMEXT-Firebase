#pragma once

#include "native/GMFirebaseInternal_native.h"
#include "GMFirebase_common.h"
#include "firebase/functions.h"

// ============================================================
// Value-copy registry
// ============================================================
// HttpsCallableReference is a cheap SDK value object with no stable address
// of its own (same shape as StorageReference/DatabaseReference), so it goes
// through the module-registry-map convention documented in
// GMFirebase_common.h rather than validate_fb_ref_ptr.

extern std::map<uint32_t, firebase::functions::HttpsCallableReference> g_functions_callable_map;
extern uint32_t g_functions_callable_index;

uint64_t registerFunctionsCallable(const firebase::functions::HttpsCallableReference& ref);
