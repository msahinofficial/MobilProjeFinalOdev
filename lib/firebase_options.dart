// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC4OjtTn0tc3wYP575nAwnO9a8v4tqAoJY',
    appId: '1:526978173600:web:5718f81176fe48f0af17c5',
    messagingSenderId: '526978173600',
    projectId: 'project-5b0e2',
    authDomain: 'project-5b0e2.firebaseapp.com',
    storageBucket: 'project-5b0e2.appspot.com',
    measurementId: 'G-TPF25YDM74',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDajYhU4rFyYPgPMT7VM1jBL-vde2HGyfw',
    appId: '1:526978173600:android:52f37ea58de407b6af17c5',
    messagingSenderId: '526978173600',
    projectId: 'project-5b0e2',
    storageBucket: 'project-5b0e2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHl3THFDWyrmbXzpZH9lp5tbWV3ote3-Q',
    appId: '1:526978173600:ios:3df90fa70602878caf17c5',
    messagingSenderId: '526978173600',
    projectId: 'project-5b0e2',
    storageBucket: 'project-5b0e2.appspot.com',
    iosClientId: '526978173600-1go8h33bv06p6vd8ih6r91kgrrqjlnvc.apps.googleusercontent.com',
    iosBundleId: 'com.example.dosya',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBHl3THFDWyrmbXzpZH9lp5tbWV3ote3-Q',
    appId: '1:526978173600:ios:3df90fa70602878caf17c5',
    messagingSenderId: '526978173600',
    projectId: 'project-5b0e2',
    storageBucket: 'project-5b0e2.appspot.com',
    iosClientId: '526978173600-1go8h33bv06p6vd8ih6r91kgrrqjlnvc.apps.googleusercontent.com',
    iosBundleId: 'com.example.dosya',
  );
}
