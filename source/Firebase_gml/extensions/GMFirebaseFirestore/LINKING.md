# Native linking for GMFirebaseFirestore

This product module requires `GMFirebaseCore` in the GameMaker project.

- Firebase product library: none. GMFirebaseFirestore no longer links
  `firebase_firestore` (or any other Firebase product library) - every
  `firebase::firestore::*` SDK call now happens inside `GMFirebaseCore`, the
  only DLL that statically links the Firebase C++ SDK. This avoids a
  cross-DLL crash where Firebase's own file-static registries (e.g.
  `CleanupNotifier`) are duplicated per-DLL: an `App*`/`Firestore*` created
  through Core was never visible to an independent SDK copy statically
  linked into a product DLL.
- Firestore state is reached through `gmfirebase_core_get_firestore_api()`
  (returning a `GMFirebaseCoreFirestoreAPI*`) via
  `GMFirebase_core_firestore_client.cpp/.h`; App state is still reached
  separately through `gmfirebase_core_get_api()` via the existing common
  client shim.
- This module never calls `firebase::App::Create()`,
  `firebase::firestore::Firestore::GetInstance()`, or any other Firebase
  Firestore SDK entry point directly - every `GMFirebase_firestore*.cpp` file
  is a thin forwarder over `GMFirebaseCoreFirestoreAPI`.
- `firebase_app` is still linked (see `third_party/CMakeLists.txt`), but only
  for the generic `firebase::Variant` conversion helpers in
  `GMFirebase_common_client.cpp` (shared boilerplate vendored into every
  product extension, used by products that pass `Variant` values - e.g.
  Database/RemoteConfig/Functions - not by Firestore itself). Those are real
  compiled SDK calls (`variant.cc`), not header-only, so the library must stay
  linked even though Firestore has no `firebase::firestore::*` calls of its
  own. This is safe: `firebase::App*` is only ever handled here as an opaque,
  never-dereferenced pointer, and `firebase::Variant` never touches
  `CleanupNotifier`/per-App static state, so this does not reintroduce the
  cross-DLL crash described above.
- On Windows/Linux/Android/macOS the Core ABI is resolved at runtime, so build
  order does not matter.
- On iOS/tvOS the split extensions are static archives and the final Xcode
  link resolves the Core ABI symbols.
