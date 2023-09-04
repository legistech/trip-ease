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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAOREJoncoLiWqi2NVdQghAZ-h_ziiyC8Q',
    appId: '1:109940541196:web:f7ce52287972fb3da76b29',
    messagingSenderId: '109940541196',
    projectId: 'tripease-18e46',
    authDomain: 'tripease-18e46.firebaseapp.com',
    storageBucket: 'tripease-18e46.appspot.com',
    measurementId: 'G-E6CMJFD6C9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB5eQq_U4OFmzQNVpkA2fk8BdFx1I5n-MQ',
    appId: '1:109940541196:android:24cc0250b6ebd0bca76b29',
    messagingSenderId: '109940541196',
    projectId: 'tripease-18e46',
    storageBucket: 'tripease-18e46.appspot.com',
  );
}