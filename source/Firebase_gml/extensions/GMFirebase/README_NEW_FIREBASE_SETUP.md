# GMFirebase Firebase configuration staging

The extension pre/post build scripts stage the platform Firebase configuration files needed by GameMaker exports.

## Linux desktop

Firebase C++ desktop searches the process current working directory for `google-services-desktop.json`, then `google-services.json`. GameMaker's Linux package places the executable at the root of `<project>.zip`, while normal runner assets live under `assets/`.

The post-build script therefore injects the configured desktop JSON in both locations:

```text
<Project>.zip
├── <Project>
├── google-services.json          # primary: beside executable / working directory
└── assets/
    └── google-services.json      # fallback/debug copy
```

The root copy is the one Firebase C++ desktop needs.
