@echo off
setlocal EnableExtensions

set Utils="%~dp0\scriptUtils.bat"
call %Utils% scriptInit
if errorlevel 1 exit /b %errorlevel%

:: Mobile/web platforms use their normal Firebase platform configuration.
if /I "%YYPLATFORM_name%"=="Android" exit /b 0
if /I "%YYPLATFORM_name%"=="iOS" exit /b 0
if /I "%YYPLATFORM_name%"=="tvOS" exit /b 0
if /I "%YYPLATFORM_name%"=="HTML5" exit /b 0

call %Utils% logInformation "Copying desktop Firebase JSON beside the built executable."

call %Utils% optionGetValue "jsonFile" CREDENTIAL_FILE
if not defined CREDENTIAL_FILE call %Utils% logError "Extension option 'jsonFile' is empty."

call %Utils% pathResolveExisting "%YYprojectDir%" "%CREDENTIAL_FILE%" FIREBASE_JSON_SOURCE
if errorlevel 1 exit /b 1

if not defined YYoutputFolder call %Utils% logError "GameMaker variable 'YYoutputFolder' is empty."
if not exist "%YYoutputFolder%" call %Utils% logError "GameMaker output folder does not exist: '%YYoutputFolder%'."

:: For Linux exports, inject the Firebase JSON into the GameMaker package ZIP.
:: Firebase C++ desktop searches the process current working directory, so the
:: primary copy must be at ZIP root beside the Linux executable. An assets copy
:: is kept as a fallback/debug convenience.
if /I "%YYPLATFORM_name%"=="Linux" call :packageLinuxFirebaseJson
if errorlevel 1 exit /b %errorlevel%
if /I "%YYPLATFORM_name%"=="Ubuntu" call :packageLinuxFirebaseJson
if errorlevel 1 exit /b %errorlevel%

:: For macOS VM exports, inject the Firebase JSON into the package ZIP the asset
:: compiler wrote (game.zip, or <project>.zip for a run), under assets/ where an
:: Included File goes. The YYC export is handled below: at this point it is an
:: Xcode project, not an .app.
set "GMF_MAC_ZIPPED="
set "GMF_IS_MAC="
for %%P in (macOS Mac MacOS OSX) do if /I "%YYPLATFORM_name%"=="%%P" set "GMF_IS_MAC=1"
if defined GMF_IS_MAC call :packageMacFirebaseJson
if errorlevel 1 exit /b %errorlevel%

:: Windows: the Firebase C++ SDK loads Google Analytics from a google_analytics.dll
:: beside the executable (hash-checked against the list compiled into the pinned
:: library) and runs Analytics as a stub without it. The SDK zip does not carry the
:: DLL; the README says where to download it. It lives at libs\windows\ under the
:: SDK root and is copied wherever the desktop JSON goes. Absent is not an error.
set "GMF_ANALYTICS_DLL="
if /I "%YYPLATFORM_name%"=="Windows" call :resolveWindowsAnalyticsDll

set "GMF_SOURCE=%FIREBASE_JSON_SOURCE%"
set "GMF_OUTPUT=%YYoutputFolder%"
set "GMF_PROJECT=%YYprojectName%"
set "GMF_PLATFORM=%YYPLATFORM_name%"

:: Windows/Linux: beside the executable when one is in the output, else the
:: output root. macOS YYC: there is no .app yet, this step runs before
:: xcodebuild; the Xcode project's <Proj>/<Proj>/Supporting Files is what becomes
:: <Game>.app/Contents/Resources, the directory getConfigSearchDir() reads.
:: PowerShell copies and says nothing: it writes one report line per event
:: (COPIED <path>, DLL <path>, NOEXE, NOMAC) to a temp file, and the loop below
:: turns each into a scriptUtils log call, so the label and logLevel are the
:: extension's own. The exit code is read before the report so a PowerShell
:: that died half-way still fails the build after logging what it did copy.
:: A missing executable is information, not a warning: a Windows Run has none
:: in the output (the runner is the runtime's), and a Linux export from this
:: host has its executable inside the package ZIP, already staged above.
set "GMF_REPORT=%TEMP%\GMFirebase_post_build_%RANDOM%.txt"
powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ErrorActionPreference='Stop';" ^
  "$src=$env:GMF_SOURCE;" ^
  "$dll=$env:GMF_ANALYTICS_DLL;" ^
  "$out=$env:GMF_OUTPUT;" ^
  "$project=$env:GMF_PROJECT;" ^
  "$platform=$env:GMF_PLATFORM;" ^
  "$copied=($env:GMF_MAC_ZIPPED -eq '1');" ^
  "function Copy-GMFirebaseJson([string]$dir) {" ^
  "  if ([string]::IsNullOrWhiteSpace($dir)) { return };" ^
  "  New-Item -ItemType Directory -Path $dir -Force | Out-Null;" ^
  "  $dst=Join-Path $dir 'google-services.json';" ^
  "  Copy-Item -LiteralPath $src -Destination $dst -Force;" ^
  "  Write-Output ('COPIED ' + $dst);" ^
  "  if (-not [string]::IsNullOrWhiteSpace($dll)) {" ^
  "    $dlldst=Join-Path $dir 'google_analytics.dll';" ^
  "    Copy-Item -LiteralPath $dll -Destination $dlldst -Force;" ^
  "    Write-Output ('DLL ' + $dlldst);" ^
  "  }" ^
  "};" ^
  "if ($platform -match '^(macOS|Mac|MacOS|OSX)$') {" ^
  "  Get-ChildItem -LiteralPath $out -Directory -Recurse -Depth 2 -Filter 'Supporting Files' -ErrorAction SilentlyContinue | ForEach-Object {" ^
  "    Copy-GMFirebaseJson $_.FullName; $copied=$true" ^
  "  };" ^
  "  if (-not $copied) { Write-Output 'NOMAC' }" ^
  "} else {" ^
  "  if (-not [string]::IsNullOrWhiteSpace($project)) {" ^
  "    Get-ChildItem -LiteralPath $out -File -Recurse -Filter ($project + '.exe') -ErrorAction SilentlyContinue | ForEach-Object {" ^
  "      Copy-GMFirebaseJson $_.DirectoryName; $copied=$true" ^
  "    }" ^
  "  };" ^
  "  if (-not $copied) {" ^
  "    $exe=Get-ChildItem -LiteralPath $out -File -Recurse -Filter '*.exe' -ErrorAction SilentlyContinue | Select-Object -First 1;" ^
  "    if ($null -ne $exe) { Copy-GMFirebaseJson $exe.DirectoryName; $copied=$true }" ^
  "  }" ^
  "};" ^
  "if (-not $copied) { Write-Output 'NOEXE' };" ^
  "Copy-GMFirebaseJson $out;" > "%GMF_REPORT%"
set "GMF_PS_RESULT=%errorlevel%"

for /f "usebackq tokens=1,* delims= " %%A in ("%GMF_REPORT%") do (
    if "%%A"=="COPIED" call %Utils% logInformation "Desktop Firebase config copied: '%%B'."
    if "%%A"=="DLL" call %Utils% logInformation "Windows Analytics DLL copied: '%%B'."
    if "%%A"=="NOEXE" call %Utils% logInformation "Exact desktop executable was not found; using YYoutputFolder."
    if "%%A"=="NOMAC" call %Utils% logWarning "No Xcode project (<Proj>/<Proj>/Supporting Files) or package ZIP (game.zip, <project>.zip) under YYoutputFolder; the Firebase config was not staged into the macOS bundle."
)
del /F /Q "%GMF_REPORT%" 2>nul
set "GMF_REPORT="

if not "%GMF_PS_RESULT%"=="0" call %Utils% logError "Failed to copy desktop Firebase config to the build output."
set "GMF_PS_RESULT="

set "GMF_SOURCE="
set "GMF_ANALYTICS_DLL="
set "GMF_OUTPUT="
set "GMF_PROJECT="
set "GMF_PLATFORM="

exit /b 0

:: ----------------------------------------------------------------------------------------------------
:: Sets GMF_ANALYTICS_DLL to <sdkPath>\libs\windows\google_analytics.dll when
:: that file exists, and leaves it empty otherwise. pathResolve rather than
:: pathResolveExisting on purpose: a missing SDK root or DLL is a note here, not a
:: failed build - Analytics simply runs as the SDK's stub.
:resolveWindowsAnalyticsDll
    call %Utils% optionGetValue "sdkPath" GMF_SDK_OPTION
    if not defined GMF_SDK_OPTION (
        call %Utils% logWarning "Extension option 'sdkPath' is empty; google_analytics.dll not staged, Analytics runs as the stub on Windows."
        exit /b 0
    )

    call %Utils% pathResolve "%YYprojectDir%" "%GMF_SDK_OPTION%" GMF_SDK_ROOT
    set "GMF_SDK_OPTION="

    set "GMF_DLL_CANDIDATE=%GMF_SDK_ROOT%\libs\windows\google_analytics.dll"
    set "GMF_SDK_ROOT="
    if not exist "%GMF_DLL_CANDIDATE%" (
        call %Utils% logWarning "google_analytics.dll not found at '%GMF_DLL_CANDIDATE%'; Analytics runs as the stub on Windows (see README)."
        set "GMF_DLL_CANDIDATE="
        exit /b 0
    )

    set "GMF_ANALYTICS_DLL=%GMF_DLL_CANDIDATE%"
    set "GMF_DLL_CANDIDATE="
    call %Utils% logInformation "Windows Analytics DLL resolved: '%GMF_ANALYTICS_DLL%'."
exit /b 0

:: ----------------------------------------------------------------------------------------------------
:packageLinuxFirebaseJson
setlocal EnableDelayedExpansion

set "GMF_LINUX_PROJECT=%YYprojectName%"
if not defined GMF_LINUX_PROJECT (
    if defined YYprojectPath (
        for %%A in ("%YYprojectPath%") do set "GMF_LINUX_PROJECT=%%~nA"
    )
)

if not defined GMF_LINUX_PROJECT call %Utils% logError "Unable to determine the GameMaker project name for Linux asset ZIP staging."

set "GMF_LINUX_ZIP=%YYoutputFolder%\!GMF_LINUX_PROJECT!.zip"
if not exist "!GMF_LINUX_ZIP!" call %Utils% logError "GameMaker Linux asset ZIP does not exist: '!GMF_LINUX_ZIP!'."

set "GMF_LINUX_TEMP=%YYoutputFolder%\!GMF_LINUX_PROJECT!___firebase_temp___"
if exist "!GMF_LINUX_TEMP!" rmdir /S /Q "!GMF_LINUX_TEMP!"
mkdir "!GMF_LINUX_TEMP!\assets"
if errorlevel 1 call %Utils% logError "Failed to create the temporary Linux package directory '!GMF_LINUX_TEMP!'."

:: logError leaves the script, so the temp folder is removed before the call.
copy /Y "%FIREBASE_JSON_SOURCE%" "!GMF_LINUX_TEMP!\google-services.json" >nul
if errorlevel 1 (
    rmdir /S /Q "!GMF_LINUX_TEMP!" 2>nul
    call %Utils% logError "Failed to stage the root google-services.json for the Linux package ZIP."
)

copy /Y "%FIREBASE_JSON_SOURCE%" "!GMF_LINUX_TEMP!\assets\google-services.json" >nul
if errorlevel 1 (
    rmdir /S /Q "!GMF_LINUX_TEMP!" 2>nul
    call %Utils% logError "Failed to stage the fallback assets/google-services.json for the Linux package ZIP."
)

pushd "%YYoutputFolder%" >nul
call %Utils% zipUpdate "!GMF_LINUX_PROJECT!___firebase_temp___" "!GMF_LINUX_PROJECT!.zip"
set "GMF_ZIP_RESULT=!errorlevel!"
popd >nul

rmdir /S /Q "!GMF_LINUX_TEMP!" 2>nul

if not "!GMF_ZIP_RESULT!"=="0" call %Utils% logError "Failed to add the Firebase JSON to the Linux asset ZIP '!GMF_LINUX_ZIP!' (zipUpdate exit !GMF_ZIP_RESULT!)."

call %Utils% logInformation "Linux Firebase config added to GameMaker package ZIP '!GMF_LINUX_ZIP!': google-services.json at the root, assets/google-services.json as the fallback."

endlocal & exit /b 0

:: ----------------------------------------------------------------------------------------------------
:packageMacFirebaseJson
setlocal EnableDelayedExpansion

set "GMF_MAC_PROJECT=%YYprojectName%"
if not defined GMF_MAC_PROJECT (
    if defined YYprojectPath (
        for %%A in ("%YYprojectPath%") do set "GMF_MAC_PROJECT=%%~nA"
    )
)

set "GMF_MAC_ZIPS=game"
if defined GMF_MAC_PROJECT if /I not "!GMF_MAC_PROJECT!"=="game" set "GMF_MAC_ZIPS=game;!GMF_MAC_PROJECT!"

set "GMF_MAC_FOUND="
for %%Z in ("!GMF_MAC_ZIPS:;=" "!") do (
    if exist "%YYoutputFolder%\%%~Z.zip" (
        call :addMacFirebaseJsonToZip "%%~Z"
        if errorlevel 1 (endlocal & exit /b 1)
        set "GMF_MAC_FOUND=1"
    )
)

:: Tell the copy step below whether a package ZIP was staged, so the YYC-only
:: warning stays quiet on a VM export.
if defined GMF_MAC_FOUND (endlocal & set "GMF_MAC_ZIPPED=1") else endlocal
exit /b 0

:: Injects the Firebase JSON into <YYoutputFolder>\<name>.zip under assets/.
:addMacFirebaseJsonToZip
set "GMF_MAC_ZIP=%YYoutputFolder%\%~1.zip"
set "GMF_MAC_TEMP=%YYoutputFolder%\%~1___firebase_temp___"
if exist "%GMF_MAC_TEMP%" rmdir /S /Q "%GMF_MAC_TEMP%"
mkdir "%GMF_MAC_TEMP%\assets"
if errorlevel 1 call %Utils% logError "Failed to create the temporary macOS package directory '%GMF_MAC_TEMP%'."

:: logError leaves the script, so the temp folder is removed before the call.
copy /Y "%FIREBASE_JSON_SOURCE%" "%GMF_MAC_TEMP%\assets\google-services.json" >nul
if errorlevel 1 (
    rmdir /S /Q "%GMF_MAC_TEMP%" 2>nul
    call %Utils% logError "Failed to stage assets/google-services.json for the macOS package ZIP."
)

pushd "%YYoutputFolder%" >nul
call %Utils% zipUpdate "%~1___firebase_temp___" "%~1.zip"
set "GMF_MAC_ZIP_RESULT=%errorlevel%"
popd >nul

rmdir /S /Q "%GMF_MAC_TEMP%" 2>nul

if not "%GMF_MAC_ZIP_RESULT%"=="0" call %Utils% logError "Failed to add the Firebase JSON to the macOS package ZIP '%GMF_MAC_ZIP%' (zipUpdate exit %GMF_MAC_ZIP_RESULT%)."

call %Utils% logInformation "Desktop Firebase config added to package ZIP '%GMF_MAC_ZIP%': assets/google-services.json."
exit /b 0
