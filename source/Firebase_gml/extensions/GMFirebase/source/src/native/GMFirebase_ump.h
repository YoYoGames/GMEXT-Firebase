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
// it is represented uniformly here as an opaque uint64 handle. GML passes 0
// and the three form functions (ump_show_consent_form/
// ump_load_and_show_consent_form_if_required/ump_show_privacy_options_form)
// supply the game's own parent themselves - the Activity the firebase::App
// was created with on Android, the runner's root view controller on iOS, and
// nullptr on desktop, where the SDK's FormParent is a stub it never
// dereferences (see ump/types.h). A non-zero value is treated as a
// caller-supplied jobject/id for anyone bridging their own, and is
// reinterpret_cast straight through.
