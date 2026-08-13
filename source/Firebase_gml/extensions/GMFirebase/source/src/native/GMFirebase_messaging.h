#pragma once

#include "native/GMFirebaseInternal_native.h"
#include "GMFirebase_common.h"
#include "firebase/messaging.h"

// ============================================================
// Cloud Messaging - poll-buffer module
// ============================================================
//
// Messaging's surface is entirely global functions - there is no per-
// instance handle to mint a GM_FB_TYPE_* ref for, unlike every other module
// in this extension.
//
// This is also the one place in the whole GMFirebase port that legitimately
// needs a small buffered-poll pattern (as opposed to calling a GMFunction
// callback directly from wherever the SDK happens to fire it): Messaging's
// delivery model is inherently async/OS-driven (a message or token can
// arrive on a platform notification thread at any time, including before
// GML has had a chance to register any callback at all), and the SDK
// ships a ready-made firebase::messaging::PollableListener exactly for
// this - PollMessage()/PollRegistrationToken() drain a small internal
// queue the SDK itself buffers. We keep one static PollableListener alive
// for the process lifetime and expose its poll methods plus per-field
// getters over the most recently polled message/token, which GML is
// expected to call once per step from its own event loop.
//
// No other module in this extension needs this - GMFunction::call() is
// itself thread-safe and every other Future<T>/Listener-based callback is
// simply invoked directly from whatever thread the SDK fires it on.

firebase::messaging::PollableListener& getMessagingListener();
