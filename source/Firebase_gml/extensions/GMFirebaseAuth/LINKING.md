# Native linking for GMFirebaseAuth

This product module requires `GMFirebaseCore` in the GameMaker project.

- Firebase product library: none. GMFirebaseAuth no longer links `firebase_auth`
  (or any other Firebase product library) - every `firebase::auth::*` SDK call
  now happens inside `GMFirebaseCore`, the only DLL that statically links the
  Firebase C++ SDK. This avoids a cross-DLL crash where Firebase's own
  file-static registries (e.g. `CleanupNotifier`) are duplicated per-DLL: an
  `App*`/`Auth*` created through Core was never visible to an independent SDK
  copy statically linked into a product DLL.
- Auth state is reached through the generic proc resolver -
  `gmfirebase_core_resolve_product_proc("auth", symbol)` via
  `GMFirebase_core_product_client.cpp/.h` - which returns an untyped function
  pointer that each forwarder casts to its exact signature
  (`gmfirebaseGetCoreProductProcAs<Proc>(...)`); App state is still reached
  separately through `gmfirebase_core_get_api()` via the existing common
  client shim.
- This module never calls `firebase::App::Create()`, `Auth::GetAuth()`, or any
  other Firebase Auth SDK entry point directly - every `GMFirebase_auth*.cpp`
  file is a thin forwarder resolved through Core's generic auth proc table.
- `firebase_app` is still linked (see `third_party/CMakeLists.txt`), but only
  for the generic `firebase::Variant` conversion helpers in
  `GMFirebase_common_client.cpp` (shared boilerplate vendored into every
  product extension, used by products that pass `Variant` values - e.g.
  Database/RemoteConfig/Functions - not by Auth itself). Those are real
  compiled SDK calls (`variant.cc`), not header-only, so the library must stay
  linked even though Auth has no `firebase::auth::*` calls of its own. This is
  safe: `firebase::App*` is only ever handled here as an opaque, never-
  dereferenced pointer, and `firebase::Variant` never touches
  `CleanupNotifier`/per-App static state, so this does not reintroduce the
  cross-DLL crash described above.
- On Windows/Linux/Android/macOS the Core ABI is resolved at runtime, so build
  order does not matter.
- On iOS/tvOS the split extensions are static archives and the final Xcode
  link resolves the Core ABI symbols.
