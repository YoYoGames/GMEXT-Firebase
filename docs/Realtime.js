/**
 * @module realtime
 * @title Realtime Database
 * @desc
 * 
 * ![](assets/realtimeBanner.png)
 * 
 * The Firebase Realtime Database is a cloud-hosted database. Data in the Realtime Database is stored as JSON and synchronized in real time to every connected client. When you build cross-platform apps with the iOS, Android, and JavaScript SDKs, all of your clients share one Realtime Database instance and automatically receive updates with the newest data.
 * Check the [official page](https://firebase.google.com/docs/database) for more information.
 * 
 * @section Setup
 * @desc Before starting to use any Firebase extensions, you are required to follow some initial configuration steps.
 * 
 * [[Note: The **SDK** version is only available for the Android, iOS and Web targets; if you're targeting other devices, please follow the steps for **REST API**.]]
 * 
 * * ${page.guides_analytics#Create_Project} (skip this if you already have a project)
 * * ${page.guides_realtime#Firebase_Console} (enabling Firebase Realtime Database)
 * * ${page.guides_realtime#platform_setup} (configuring SDKs or REST API)
 * 
 * @section_end
 * 
 * @section_func Functions
 * @desc The Firebase Realtime Database extension was implemented using a fluent-API (method chaining) approach and the entry point for interacting with the database is using the function ${function.FirebaseRealTime}, which will return a ${struct.dbEntryRef} of the database.
 * The following functions are given for working with Firebase Firestore extension:
 * 
 * @ref FirebaseRealTime
 * @ref dbEntryRef::Child
 * @ref dbEntryRef::Delete
 * @ref dbEntryRef::Exists
 * @ref dbEntryRef::Listener
 * @ref dbEntryRef::ListenerRemove
 * @ref dbEntryRef::ListenerRemoveAll
 * @ref dbEntryRef::Parent
 * @ref dbEntryRef::Path
 * @ref dbEntryRef::Push
 * @ref dbEntryRef::Set
 * @ref dbEntryRef::Read
 * 
 * @section_end
 * 
 * @section_func Filter Functions
 * @desc The functions given below should only be used for filtering data when reading from the database using the `Read()` function given above.
 * @ref dbEntryRef::EndAt
 * @ref dbEntryRef::EqualTo
 * @ref dbEntryRef::LimitToFirst
 * @ref dbEntryRef::LimitToLast
 * @ref dbEntryRef::OrderByChild
 * @ref dbEntryRef::OrderByKey
 * @ref dbEntryRef::OrderByValue
 * @ref dbEntryRef::StartAt
 * @section_end
 * 
 * @section_struct
 * @desc 
 * @ref dbEntryRef
 * @section_end
 *
 * @module_end
 */
