#pragma once
#include "GMFirebase_core_api.h"

// Returns Core's ABI table or nullptr when GMFirebaseCore is not installed or
// has an incompatible ABI. The loader retries on later calls, so module load
// order is not significant on shared-library platforms.
const GMFirebaseCoreAPI* gmfirebaseGetCoreAPI();
bool gmfirebaseCoreAvailable();
