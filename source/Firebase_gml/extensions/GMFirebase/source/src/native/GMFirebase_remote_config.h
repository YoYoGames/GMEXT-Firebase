#pragma once

#include "native/GMFirebaseInternal_native.h"
#include "GMFirebase_common.h"
#include "firebase/remote_config.h"

// RemoteConfig is a singleton-per-App like Storage/Functions above, so it is
// a ptr-identified GM_FB_TYPE_REMOTE_CONFIG ref (see GMFirebase_common.h),
// not a value-copy registry entry.

// ConfigUpdateListenerRegistration is a lightweight refcounted-handle-like
// SDK type (see config_update_listener_registration.h), safe to heap-box:
// remote_config_add_config_update_listener() `new`s one, packs its address
// as a GM_FB_TYPE_RC_LISTENER_REG ref, and
// remote_config_remove_config_update_listener() calls Remove() then
// `delete`s it - mirroring GMFirebase_firestore.*'s ListenerRegistration
// handling.
