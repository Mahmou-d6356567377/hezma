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
    apiKey: 'AIzaSyBX5Hqo8aZlLR0CyI99b3QWEh_caK6znes',
    appId: '1:622924217359:web:6ea3269f84b07a63fa777a',
    messagingSenderId: '622924217359',
    projectId: 'hezma-f842d',
    authDomain: 'hezma-f842d.firebaseapp.com',
    storageBucket: 'hezma-f842d.appspot.com',
    measurementId: 'G-QFVERT2XCE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBu5F1TSE-AhPTICHY9ke0idG30A7hdNRI',
    appId: '1:622924217359:android:1970ce6931fe176ffa777a',
    messagingSenderId: '622924217359',
    projectId: 'hezma-f842d',
    storageBucket: 'hezma-f842d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDBHiarJm1fnmLMIiIeLRREejuGRjk2TAg',
    appId: '1:622924217359:ios:03a04b31b07342bbfa777a',
    messagingSenderId: '622924217359',
    projectId: 'hezma-f842d',
    storageBucket: 'hezma-f842d.appspot.com',
    iosBundleId: 'com.mahmoud.hezma',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDBHiarJm1fnmLMIiIeLRREejuGRjk2TAg',
    appId: '1:622924217359:ios:cc54adb51dcb12dbfa777a',
    messagingSenderId: '622924217359',
    projectId: 'hezma-f842d',
    storageBucket: 'hezma-f842d.appspot.com',
    iosBundleId: 'com.example.hezma',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBX5Hqo8aZlLR0CyI99b3QWEh_caK6znes',
    appId: '1:622924217359:web:e111e79d53f9a59dfa777a',
    messagingSenderId: '622924217359',
    projectId: 'hezma-f842d',
    authDomain: 'hezma-f842d.firebaseapp.com',
    storageBucket: 'hezma-f842d.appspot.com',
    measurementId: 'G-Q7YKM01XQF',
  );
}