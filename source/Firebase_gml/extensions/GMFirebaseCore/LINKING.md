# Native linking for GMFirebaseCore

This is the required runtime extension. It owns:

- the one logical `firebase::App*` used by GMFirebase APIs,
- App handle registration/resolution,
- the shared pointer-backed handle registry,
- shared last-error state,
- Android JavaVM/Activity Firebase App bootstrap,
- the exported `gmfirebase_core_get_api()` C ABI.

Its CMake integration links `firebase_app`.
