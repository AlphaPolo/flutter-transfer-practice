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
    apiKey: 'AIzaSyApd1eYTd7izCSkqca6YrzT2-oqibnSH6k',
    appId: '1:521088007957:web:90c78043927ded57c1f31c',
    messagingSenderId: '521088007957',
    projectId: 'subtitlevideo',
    authDomain: 'subtitlevideo.firebaseapp.com',
    databaseURL: 'https://subtitlevideo-default-rtdb.firebaseio.com',
    storageBucket: 'subtitlevideo.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAlusk6u7XwXxZ9-3h-sfgyESug6_EZGx8',
    appId: '1:521088007957:android:62fda2a8f37eed4ac1f31c',
    messagingSenderId: '521088007957',
    projectId: 'subtitlevideo',
    databaseURL: 'https://subtitlevideo-default-rtdb.firebaseio.com',
    storageBucket: 'subtitlevideo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAbXJyCQ4KfAcpmy63-it59wvnVCkHWn7Y',
    appId: '1:521088007957:ios:c261df4c203c9549c1f31c',
    messagingSenderId: '521088007957',
    projectId: 'subtitlevideo',
    databaseURL: 'https://subtitlevideo-default-rtdb.firebaseio.com',
    storageBucket: 'subtitlevideo.appspot.com',
    iosClientId: '521088007957-ch23cksr0l6druksl7c8jq483f6l725a.apps.googleusercontent.com',
    iosBundleId: 'com.example.subtitleTransfer',
  );
}
