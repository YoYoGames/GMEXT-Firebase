@title Cloud Messaging Guides

<a id="top"></a>
<!-- Page HTML do not touch -->
<a /><p align="right">[Back To Top](#top)</p>

# Platform Setup

  Firebase Cloud Messaging implementation uses SDK dependencies and therefore is only available on **Android** and **iOS** targets. In this section we will cover the required setup necessary to start using the Cloud Messaging extension on your game.
  Select your target platform below and follow the simple steps to get your project up and running (you only need follow this setup once per project):

* ${page.Platform_Setup#Android_Setup}
* ${page.Platform_Setup#iOS_Setup}

## Additional steps for iOS

  On iOS you will need to retrieve a P8 certificate and upload it to your Firebase project to enable sending push notifications through APNs:

* Head to the [Apple Developer](https://developer.apple.com/account) site and select &quot; **Certificates, Identifiers &amp; Profiles** &quot;.<br>
      ![](assets/iOS_setup_1.png)

* Select &quot; **Keys** &quot; from the menu on the left, and create a new key by clicking on the plus sign.<br>
      ![](assets/iOS_setup_2.png)

* Enter a **name** for the key, enable **Apple Push Notifications service** (APNs) and click on **Continue** .<br>
      ![](assets/iOS_setup_3.png)

* On the next page, confirm the key details and click on **Register** .<br>
      ![](assets/iOS_setup_4.png)

* **Note** the information given here (key ID) and **download** the key as you will not be able to see this screen again.<br>
      ![](assets/iOS_setup_5.png)

* Go to the dashboard for your Firebase project and open the **Project Settings** . Here, open the **Cloud Messaging** tab.<br>
      ![](assets/iOS_setup_5B.png)

* Select your iOS application, and under &quot; **APNs Authentication Key** &quot;, press **Upload** to upload your key.<br>
      ![](assets/iOS_setup_6.png)

* Here, upload your P8 file and enter the other required details that you retrieved from the Apple Developer site.<br>
      ![](assets/iOS_setup_7.png)

  You can now send notifications to the iOS client game by going under **&quot;Engage&quot;** and selecting **&quot;Cloud Messaging&quot;** on your Firebase dashboard.<br>
  ![](assets/iOS_setup_8.png)


<br><br>

---