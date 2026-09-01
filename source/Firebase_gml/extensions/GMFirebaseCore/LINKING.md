# Native linking for GMFirebaseCore

`GMFirebaseCore` is the single native owner of the Firebase C++ SDK for the split extension suite.

It links `firebase_app` plus these supported products:

- analytics
- app_check
- auth
- database
- firestore
- functions
- installations
- messaging
- remote_config
- storage
- ump

`GMFirebaseAuth` and `GMFirebaseFirestore` use their existing typed Core ABI tables. The other product extensions use the generic `gmfirebase_core_resolve_product_proc()` dispatch ABI. Product DLLs/shared objects no longer statically link Firebase C++ libraries.

Excluded from this migration, by design: `GMFirebasePerformance`, `GMFirebaseInAppMessaging`, and `GMFirebaseCrashlytics`.
