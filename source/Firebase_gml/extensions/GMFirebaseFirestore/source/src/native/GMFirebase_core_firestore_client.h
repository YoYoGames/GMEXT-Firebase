#pragma once
#include "GMFirebase_core_firestore_api.h"

// Returns Core's Firestore ABI table or nullptr when GMFirebaseCore is not
// installed, does not have the firestore module linked, or has an
// incompatible ABI. The loader retries on later calls, so module load order
// is not significant on shared-library platforms. Mirrors
// GMFirebase_core_client.h's pattern for the base GMFirebaseCoreAPI.
const GMFirebaseCoreFirestoreAPI* gmfirebaseGetCoreFirestoreAPI();
bool gmfirebaseCoreFirestoreAvailable();
