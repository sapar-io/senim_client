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
    apiKey: 'AIzaSyBOAzDOzR92922h_Sio7sfMzxDGgSv0j3k',
    appId: '1:1006899885328:web:46df85fc257d32f752a195',
    messagingSenderId: '1006899885328',
    projectId: 'senim-79c06',
    authDomain: 'senim-79c06.firebaseapp.com',
    storageBucket: 'senim-79c06.appspot.com',
    measurementId: 'G-Q432N8GZJF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAFVQPASYgut6o-hKRadpsH_0NvMxWXWYg',
    appId: '1:1006899885328:android:e0b59570e0e6f47752a195',
    messagingSenderId: '1006899885328',
    projectId: 'senim-79c06',
    storageBucket: 'senim-79c06.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB5dcLyLOnr8O_6AT59_eNw8Iv8TH_5E8c',
    appId: '1:1006899885328:ios:8d40ee3525aa60d752a195',
    messagingSenderId: '1006899885328',
    projectId: 'senim-79c06',
    storageBucket: 'senim-79c06.appspot.com',
    androidClientId: '1006899885328-r4je32lv8djpnrsbd32o8cl9lbdsodjp.apps.googleusercontent.com',
    iosClientId: '1006899885328-5au7b245idbams8a9ab3i4bj5kbhl1fe.apps.googleusercontent.com',
    iosBundleId: 'me.senim.client',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB5dcLyLOnr8O_6AT59_eNw8Iv8TH_5E8c',
    appId: '1:1006899885328:ios:8d40ee3525aa60d752a195',
    messagingSenderId: '1006899885328',
    projectId: 'senim-79c06',
    storageBucket: 'senim-79c06.appspot.com',
    androidClientId: '1006899885328-r4je32lv8djpnrsbd32o8cl9lbdsodjp.apps.googleusercontent.com',
    iosClientId: '1006899885328-5au7b245idbams8a9ab3i4bj5kbhl1fe.apps.googleusercontent.com',
    iosBundleId: 'me.senim.client',
  );
}