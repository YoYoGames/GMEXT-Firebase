#pragma once
#include "GMFirebase_core_auth_api.h"

// Returns Core's Auth ABI table or nullptr when GMFirebaseCore is not
// installed, does not have the auth module linked, or has an incompatible
// ABI. The loader retries on later calls, so module load order is not
// significant on shared-library platforms. Mirrors GMFirebase_core_client.h's
// pattern for the base GMFirebaseCoreAPI.
const GMFirebaseCoreAuthAPI* gmfirebaseGetCoreAuthAPI();
bool gmfirebaseCoreAuthAvailable();
