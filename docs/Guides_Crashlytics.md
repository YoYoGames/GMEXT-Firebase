<a id="top"></a>
<!-- Page HTML do not touch -->
<a /><p align="right">[Back To Top](#top)</p>

# <a name="Building_on_iOS">Building on iOS

  Building your project on iOS requires some Xcode project changes:

1. Build your project from GMS2 first (using the iOS target) so it creates an Xcode project that we will edit in the steps below.
2. Before building your project further from Xcode, go to **Build Phases** and drag the **Run Script** item to the bottom:<br>
      ![](https://github.com/YoYoGames/GMEXT-Firebase/blob/main/docs/assets/crashlyticsRunScriptBefore.png)

3. The result should look like this (with **Run Script** at the bottom of the list):<br>
      ![](https://github.com/YoYoGames/GMEXT-Firebase/blob/main/docs/assets/crashlyticsRunScriptAfter.png)

4. You can now continue with the building process and the application will work as expected.


<br><br>

---

<!-- Page HTML do not touch -->
<a /><p align="right">[Back To Top](#top)</p>

# <a name="Crashlytics Setup">Crashlytics Setup

  Firebase Crashlytics implementation uses SDK dependencies and therefore is only available on **Android** and **iOS** targets. In this section we will cover the steps necessary to start using the Firebase Crashlytics extension in your game.
  Select your target platform below and follow the simple steps to get your project up and running (you only need follow this setup once per project):

* [Android Setup](Platform-Setup#Android_Setup)
* [iOS Setup](Platform-Setup#iOS Setup)

## Enabling Crashlytics

1. On your Firebase console, select **Crashlytics** under &quot;Release &amp; Monitor&quot;; then **select your Android** / **iOS** project **and click on Enable Crashlytics** .<br>
          ![](https://github.com/YoYoGames/GMEXT-Firebase/blob/main/docs/assets/crashlyticsEnable.png)

2. On this screen, the Firebase console will wait for a test crash from your app. To skip this screen you need to build a project (see [Building on iOS](#Building_on_iOS) if you are building for the iOS target), unplug your device and run a call to the included [FirebaseCrashlytics_Crash](Functions_Crashlytics#FirebaseCrashlytics_Crash) function.<br>
      ![](https://github.com/YoYoGames/GMEXT-Firebase/blob/main/docs/assets/crashlyticsWaiting.png)

3. You are now all set to monitor your game crash logs.


<br><br>

---