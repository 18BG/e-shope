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
    apiKey: 'AIzaSyC8V9SbL6vTUCBMu2pBGpeqWamtYFW2SIE',
    appId: '1:1088747327129:web:cadf34426c5adc7c21f208',
    messagingSenderId: '1088747327129',
    projectId: 'e-shop-6e0b3',
    authDomain: 'e-shop-6e0b3.firebaseapp.com',
    storageBucket: 'e-shop-6e0b3.appspot.com',
    measurementId: 'G-LJHHED42EP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB2aLPgD4g7B8hX1Rggd7kFlDoFEIA6Bb4',
    appId: '1:1088747327129:android:fe2e94bb919f294321f208',
    messagingSenderId: '1088747327129',
    projectId: 'e-shop-6e0b3',
    storageBucket: 'e-shop-6e0b3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBGw5jqqXeAdJyosSyqY0hVHrJkCvTaeAo',
    appId: '1:1088747327129:ios:69fc633a9a8968b721f208',
    messagingSenderId: '1088747327129',
    projectId: 'e-shop-6e0b3',
    storageBucket: 'e-shop-6e0b3.appspot.com',
    iosClientId: '1088747327129-63cn72bdnetaq552dgbq26m9r6h5h5lb.apps.googleusercontent.com',
    iosBundleId: 'com.example.eShope',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBGw5jqqXeAdJyosSyqY0hVHrJkCvTaeAo',
    appId: '1:1088747327129:ios:26925ad848dc2ea721f208',
    messagingSenderId: '1088747327129',
    projectId: 'e-shop-6e0b3',
    storageBucket: 'e-shop-6e0b3.appspot.com',
    iosClientId: '1088747327129-45qkgig0srmtsqahqsrbj8aojl8v0hra.apps.googleusercontent.com',
    iosBundleId: 'com.example.eShope.RunnerTests',
  );
}
