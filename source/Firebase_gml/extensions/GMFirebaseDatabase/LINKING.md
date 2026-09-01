# Native linking for GMFirebaseDatabase

`GMFirebaseDatabase` requires `GMFirebaseCore` in the GameMaker project.

- Firebase C++ product library: `database`.
- **Only `GMFirebaseCore` links that library (and `firebase_app`).**
- This product extension is a thin ABI client and does not link the Firebase C++ SDK.
- The original `firebase_database_*` ExtGen-facing function names/signatures are preserved.
- Calls are resolved through `gmfirebase_core_resolve_product_proc()` and execute inside Core.
- Windows/Linux/Android/macOS resolve Core at runtime, so extension load order is not significant.
- iOS/tvOS resolve Core when the final GameMaker application links the static extension archives.

This avoids multiple Firebase C++ copies in separate DLLs/shared objects and therefore avoids duplicated Firebase internal registries.
