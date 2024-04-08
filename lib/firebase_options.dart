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
    apiKey: 'AIzaSyBiTKs3sBno4A3MpvT2cmtg_4_OcyzGXAc',
    appId: '1:309603675404:web:69909963a0574dd6e5ed29',
    messagingSenderId: '309603675404',
    projectId: 'chatappnew-406f3',
    authDomain: 'chatappnew-406f3.firebaseapp.com',
    storageBucket: 'chatappnew-406f3.appspot.com',
    measurementId: 'G-GWWGD8D9D3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABL1nvaSr1fUK0Xzwm9faIobJyxUqRi6Y',
    appId: '1:309603675404:android:86035f88f434454ae5ed29',
    messagingSenderId: '309603675404',
    projectId: 'chatappnew-406f3',
    storageBucket: 'chatappnew-406f3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhTFgEYCy-MrlcKdLmz1T4BUZ0PM1dLXs',
    appId: '1:309603675404:ios:931ecbe5a0cd83fae5ed29',
    messagingSenderId: '309603675404',
    projectId: 'chatappnew-406f3',
    storageBucket: 'chatappnew-406f3.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAhTFgEYCy-MrlcKdLmz1T4BUZ0PM1dLXs',
    appId: '1:309603675404:ios:a8f8720f8f658489e5ed29',
    messagingSenderId: '309603675404',
    projectId: 'chatappnew-406f3',
    storageBucket: 'chatappnew-406f3.appspot.com',
    iosBundleId: 'com.example.chatapp.RunnerTests',
  );
}
