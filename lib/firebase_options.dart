// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAjB6lSA9rCj6fqPUFkgWANMA86_3ZR8GI',
    appId: '1:60640502916:web:b0b101cfecbcf1c8b2ced1',
    messagingSenderId: '60640502916',
    projectId: 'sugars-d79ce',
    authDomain: 'sugars-d79ce.firebaseapp.com',
    storageBucket: 'sugars-d79ce.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCPbjhnBbWYgK-Z9HSzyZQMHAgJJPC-_RU',
    appId: '1:60640502916:android:2275c6d4c9ab3feab2ced1',
    messagingSenderId: '60640502916',
    projectId: 'sugars-d79ce',
    storageBucket: 'sugars-d79ce.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCzc4afnA3O74vV3Dtgy1WNEVvds4w7B-E',
    appId: '1:60640502916:ios:a3f804266e3aca8eb2ced1',
    messagingSenderId: '60640502916',
    projectId: 'sugars-d79ce',
    storageBucket: 'sugars-d79ce.appspot.com',
    iosClientId: '60640502916-l1cp841cjfmdq2clk1vkilab3ul14m0f.apps.googleusercontent.com',
    iosBundleId: 'com.example.app',
  );
}
