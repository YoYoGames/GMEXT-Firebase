#pragma once

#include "native/GMFirebaseInternal_native.h"
#include "GMFirebase_common.h"
#include "firebase/ump/consent_info.h"
#include "firebase/ump/types.h"

// ConsentInfo is a singleton-per-App like Storage/Functions/RemoteConfig
// above, so it is a ptr-identified GM_FB_TYPE_UMP_CONSENT_INFO ref (see
// GMFirebase_common.h), not a value-copy registry entry.
//
// FormParent handling: firebase::ump::FormParent is a platform-conditional
// typedef (jobject on Android, id on iOS/tvOS, void* everywhere else - all
// pointer-sized). The DSL has no concept of a platform-conditional type, so
// it is represented uniformly here as an opaque uint64 handle and
// reinterpret_cast between uint64_t <-> FormParent at the two call sites
// below (ump_show_consent_form/ump_load_and_show_consent_form_if_required/
// ump_show_privacy_options_form). On desktop, the SDK's own FormParent is a
// stub type it never dereferences (see ump/types.h) - GML should simply
// pass 0 there - so this wrapper is fully wired up for API completeness and
// mobile builds get a working FormParent bridge for free, even though
// desktop never actually uses the handle for anything.
