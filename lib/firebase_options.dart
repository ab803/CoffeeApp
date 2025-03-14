// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBdzaToDCpg7OR6SoBE8Q-xu0jWaKFWH6s',
    appId: '1:383342330660:web:3d7b07674c7af80eed69b1',
    messagingSenderId: '383342330660',
    projectId: 'coffee-app-4b70c',
    authDomain: 'coffee-app-4b70c.firebaseapp.com',
    storageBucket: 'coffee-app-4b70c.firebasestorage.app',
    measurementId: 'G-ERL420R22E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRJ2L-9UgeUjLsClQTDvLEnv2KAZWEvVk',
    appId: '1:383342330660:android:e3942c2235662692ed69b1',
    messagingSenderId: '383342330660',
    projectId: 'coffee-app-4b70c',
    storageBucket: 'coffee-app-4b70c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCY24jgYH3b1Nx19E0pJhKAu90kPCmXis4',
    appId: '1:383342330660:ios:52a337d90aca5e12ed69b1',
    messagingSenderId: '383342330660',
    projectId: 'coffee-app-4b70c',
    storageBucket: 'coffee-app-4b70c.firebasestorage.app',
    iosBundleId: 'com.example.task2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCY24jgYH3b1Nx19E0pJhKAu90kPCmXis4',
    appId: '1:383342330660:ios:52a337d90aca5e12ed69b1',
    messagingSenderId: '383342330660',
    projectId: 'coffee-app-4b70c',
    storageBucket: 'coffee-app-4b70c.firebasestorage.app',
    iosBundleId: 'com.example.task2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBdzaToDCpg7OR6SoBE8Q-xu0jWaKFWH6s',
    appId: '1:383342330660:web:3cf29a390bb88f7eed69b1',
    messagingSenderId: '383342330660',
    projectId: 'coffee-app-4b70c',
    authDomain: 'coffee-app-4b70c.firebaseapp.com',
    storageBucket: 'coffee-app-4b70c.firebasestorage.app',
    measurementId: 'G-0MVNQ0802S',
  );
}
