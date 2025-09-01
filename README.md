Swift-Firebase-Todo-App
A simple and elegant to-do list application for iOS, built with Swift and powered by Firebase Firestore for real-time data synchronization. This app allows users to create, manage, and delete tasks, with all changes instantly reflected across devices.

Features
Real-time Synchronization: Tasks are stored in Firebase Firestore, providing instant updates across all logged-in user devices.

User Authentication: Secure user authentication using Firebase Authentication, allowing each user to have their own private to-do list.

Task Management: Easily add, edit, mark as complete, and delete to-do items.

Clean UI: A modern and intuitive user interface designed for a seamless user experience.

Prerequisites
Before you begin, ensure you have the following installed:

Xcode: Version 12 or newer.

CocoaPods: A dependency manager for Cocoa projects. If you don't have it, install it using sudo gem install cocoapods.

A Firebase Account: You will need a Google account to create a Firebase project.

Getting Started
Follow these steps to get the app up and running on your local machine.

1. Clone the repository
git clone [https://github.com/your-username/swift-firebase-todo-app.git](https://github.com/your-username/swift-firebase-todo-app.git)
cd swift-firebase-todo-app

2. Firebase Project Setup
Create a Firebase Project:

Go to the Firebase Console.

Click "Add project" and follow the on-screen instructions to create a new project.

Add an iOS App:

In your new Firebase project, click the iOS icon to add a new iOS app.

Register your app by providing the Bundle ID. You can find this in Xcode under your project's General tab (e.g., com.yourcompany.Swift-Firebase-Todo-App).

Download the GoogleService-Info.plist file.

Add the GoogleService-Info.plist file to your project:

Open the Swift-Firebase-Todo-App.xcworkspace file in Xcode.

Drag the downloaded GoogleService-Info.plist file into the root of your Xcode project navigator (make sure it's added to the correct target).

Enable Firestore and Authentication:

In the Firebase Console, go to the Authentication section and enable the "Email/Password" sign-in method.

Go to the Firestore Database section and create a new database. Choose "Start in production mode" and set a location.

IMPORTANT: After creating the database, set up your security rules. For development, you can use the following rules to allow authenticated users to read and write:

rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}

(Note: This is not production-level security. For a production app, you should tighten these rules.)

3. Install Dependencies
In the terminal, from the project's root directory, run the following command to install the necessary Firebase SDKs and other dependencies:

pod install

4. Run the App
Open the Swift-Firebase-Todo-App.xcworkspace file in Xcode and run the app on a simulator or a physical device.

Usage
Sign Up/Log In: When the app first launches, you will be prompted to sign up or log in.

Add a Task: Tap the "+" button to add a new to-do item.

Edit a Task: Swipe a task to the left and tap the "Edit" button to modify it.

Mark as Complete: Tap on a task to mark it as complete. The task will be visually indicated as completed.

Delete a Task: Swipe a task to the left and tap the "Delete" button.

Screenshots
Contributing
Feel free to fork this repository and submit pull requests. For major changes, please open an issue first to discuss what you would like to change.

License
This project is licensed under the MIT License - see the LICENSE.md file for details.
