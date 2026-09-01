# Native linking for GMFirebaseMessaging

This product module requires `GMFirebaseCore` in the GameMaker project.

- Firebase product library: `messaging`
- Core state is reached through `gmfirebase_core_get_api()` via the supplied client shim.
- This module never calls `firebase::App::Create()`.
- The Firebase C++ product target still links `firebase_app` because Firebase's supported native link contract requires each product target to link its App library; the actual `firebase::App*` used by this wrapper is always obtained from Core.
- On Windows/Linux/Android/macOS the Core ABI is resolved at runtime, so build order does not matter.
- On iOS/tvOS the split extensions are static archives and the final Xcode link resolves the Core ABI symbol.
