# FirebaseSetup — Firebase C++ 13.11.0

This version is driven entirely by GameMaker extension options.

- Android: `jsonFile` + `firebaseCppSdkPath`
- iOS: `plistFile`
- Windows/macOS/Linux: `desktopJsonFile`

Desktop builds stage the selected JSON into the GameMaker project's `datafiles` directory as `google-services.json`, then clean it after Run/Package.
