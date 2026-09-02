# Native linking for GMFirebaseCore

`GMFirebaseCore` is the single native owner of the Firebase C++ SDK for the split extension suite.

## Windows project-selected runtime

On Windows, `pre_build_step.bat` reads the active GameMaker `.yyp` and generates:

`GMFirebaseCore/source/third_party/GMFirebaseEnabledModules.cmake`

Only Firebase products whose GameMaker extensions are present are compiled into Core and linked from the prebuilt Firebase C++ SDK. `firebase_app.lib` is always linked exactly once, last.

Examples:

- `GMFirebaseAuth` -> `firebase_auth.lib`
- `GMFirebaseDatabase` -> `firebase_database.lib`
- `GMFirebaseFirestore` -> `firebase_firestore.lib` plus `firebase_auth.lib` as the SDK dependency
- `GMFirebaseStorage` -> `firebase_storage.lib`

Removing a product extension from the GameMaker IDE and building Windows again regenerates the manifest and incrementally relinks `GMFirebaseCore.dll`, so that product backend and product `.lib` disappear from the next runtime.

Product DLLs/shared objects do not statically link Firebase C++ libraries. Auth/Firestore use their typed Core ABI tables; the other products use `gmfirebase_core_resolve_product_proc()`.

No Firebase source checkout, BoringSSL build, OpenSSL setup, custom REST shim, `/WHOLEARCHIVE`, or Firebase internal symbol export list is used by the Windows path.

## Standalone Core builds

Without a generated GameMaker manifest, Core falls back to all supported products. A developer can explicitly select products with:

`-DGMFIREBASE_PRODUCT_MODULES_OVERRIDE="auth;firestore"`

## Excluded modules

`GMFirebasePerformance`, `GMFirebaseInAppMessaging`, and `GMFirebaseCrashlytics` remain outside this migration by design.
