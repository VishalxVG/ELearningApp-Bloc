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
    apiKey: 'AIzaSyCwiKgvSBWWO-3uXNY6N-ysmY-CXTlmNZ8',
    appId: '1:322406418195:web:2493f25e94601077ebfce6',
    messagingSenderId: '322406418195',
    projectId: 'elearningapp-8f12c',
    authDomain: 'elearningapp-8f12c.firebaseapp.com',
    storageBucket: 'elearningapp-8f12c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBk4vYHKnZGM_HiTtyLHECqGWl2VNivlro',
    appId: '1:322406418195:android:8fa486ff409ee41aebfce6',
    messagingSenderId: '322406418195',
    projectId: 'elearningapp-8f12c',
    storageBucket: 'elearningapp-8f12c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-eimXh_ZkYxi4m_qP0ov7KXOwZRqrSUw',
    appId: '1:322406418195:ios:8e448a0d81d727a7ebfce6',
    messagingSenderId: '322406418195',
    projectId: 'elearningapp-8f12c',
    storageBucket: 'elearningapp-8f12c.appspot.com',
    iosBundleId: 'com.example.ecommerceapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-eimXh_ZkYxi4m_qP0ov7KXOwZRqrSUw',
    appId: '1:322406418195:ios:b6e224a4974f16d7ebfce6',
    messagingSenderId: '322406418195',
    projectId: 'elearningapp-8f12c',
    storageBucket: 'elearningapp-8f12c.appspot.com',
    iosBundleId: 'com.example.ecommerceapp.RunnerTests',
  );
}
