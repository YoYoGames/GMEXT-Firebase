#pragma once

#include "native/GMFirebaseInternal_native.h"
#include "GMFirebase_common.h"
#include "firebase/messaging.h"

// ============================================================
// Cloud Messaging - callback module
// ============================================================
//
// Messaging's surface is entirely global functions - there is no per-
// instance handle to mint a GM_FB_TYPE_* ref for, unlike every other module
// in this extension; the one registry here holds a message's binary payload
// (GM_FB_TYPE_MESSAGING_RAW_DATA) until the game copies it out.
//
// The SDK delivers through one firebase::messaging::Listener with a method
// per event (OnMessage, OnRegistrationReceived, OnUnregistrationReceived),
// and each is a GML callback set with firebase_messaging_set_*_callback().
// The callback slots are module state rather than listener state: the SDK's
// SetListener() replays a pending registration id into the new listener
// from inside Initialize(), so the slots have to exist before the listener
// does, and the setters work before initialize as well as after. An event
// delivered while its slot is empty is held - messages in order up to a
// cap, the latest id of each kind - and handed over when the slot is set,
// which is what the SDK itself does one level down (Android parks messages
// in a storage file until a listener exists; SetListener replays the id).
//
// The module owns one heap-allocated Listener between
// firebase_messaging_initialize() and firebase_messaging_terminate();
// GMFunction::call() is thread-safe, so each event is forwarded from
// whatever thread the SDK fires it on, the callback copied out under the
// module mutex and called outside it.
