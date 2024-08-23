/**
 * @module firestore
 * @title Firestore
 * @desc 
 * 
 * ![](assets/firestoreBanner.png)
 * 
 * Cloud Firestore is a flexible, scalable database for mobile, web, and server development from Firebase and Google Cloud. Like Firebase Realtime Database, it keeps your data in sync across client apps through real-time listeners and offers offline support for mobile and web so you can build responsive apps that work regardless of network latency or Internet connectivity. Cloud Firestore also offers seamless integration with other Firebase and Google Cloud products, including Cloud Functions.
 * Check the [official page](https://firebase.google.com/docs/firestore) for more information.
 * 
 * @section Setup
 * @desc  Before starting to use any Firebase extensions, you are required to follow some initial configuration steps.
 * 
 * [[Note: The **SDK** version is only available for the Android, iOS and Web targets; if you're targeting other devices please follow the steps for **REST API**.]]
 * 
 * * ${page.guides_analytics#Create_Project} (skip this if you already have a project)
 * * ${page.guides_firestore#Firebase_Console} (enabling Firebase Firestore)
 * * ${page.guides_firestore#platform_setup} (configuring SDKs or REST API)
 * 
 * @section_end
 * 
 * 
 * @section_func Functions
 * @desc The Firestore extension was implemented using a fluent-API (method chaining) approach and the entry point for interacting with the database is using the function ${function.FirebaseFirestore}, which will return a ${struct.dbReference}, that can be either a *&lt;dbCollection&gt;* or a *&lt;dbDocument&gt;*.
 * The following functions are given for working with the Firebase Firestore extension:
 * 
 * @ref FirebaseFirestore
 * @ref dbReference::Child
 * @ref dbReference::Delete
 * @ref dbReference::Listener
 * @ref dbReference::ListenerRemove
 * @ref dbReference::ListenerRemoveAll
 * @ref dbReference::Parent
 * @ref dbReference::Read
 * @ref dbReference::Set
 * @ref dbReference::Update
 * @ref dbReference::Query
 * @section_end
 * 
 * @section_func Filter Functions
 * @desc The functions given below should only be used for filtering data when querying the database using the ${function.dbReference::Query} function given above.
 * @ref dbReference::EndAt
 * @ref dbReference::Limit
 * @ref dbReference::OrderBy
 * @ref dbReference::StartAt
 * @ref dbReference::Where
 * @ref dbReference::WhereEqual
 * @ref dbReference::WhereGreaterThan
 * @ref dbReference::WhereGreaterThanOrEqual
 * @ref dbReference::WhereLessThan
 * @ref dbReference::WhereLessThanOrEqual
 * @ref dbReference::WhereNotEqual
 * @section_end
 * 
 * @section_struct Structs
 * @desc 
 * @ref dbReference
 * @section_end
 * 
 * @module_end
 */
