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
    apiKey: 'AIzaSyDfWhSVUProgW6VJpmmlehzCkX1AhclS7s',
    appId: '1:776814938300:android:b931d068e05f4feb2aa8b9',
    messagingSenderId: '776814938300',
    projectId: 'dap-dyner',
    authDomain: 'dap-dyner.firebaseapp.com',
    storageBucket: 'dap-dyner.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDfWhSVUProgW6VJpmmlehzCkX1AhclS7s',
    appId: '1:776814938300:android:b931d068e05f4feb2aa8b9',
    messagingSenderId: '776814938300',
    projectId: 'dap-dyner',
    storageBucket: 'dap-dyner.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDfWhSVUProgW6VJpmmlehzCkX1AhclS7s',
    appId: '1:776814938300:android:b931d068e05f4feb2aa8b9',
    messagingSenderId: '776814938300',
    projectId: 'dap-dyner',
    storageBucket: 'dap-dyner.appspot.com',
    iosBundleId: 'com.example.listas',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDfWhSVUProgW6VJpmmlehzCkX1AhclS7s',
    appId: '1:776814938300:android:b931d068e05f4feb2aa8b9',
    messagingSenderId: '776814938300',
    projectId: 'dap-dyner',
    storageBucket: 'dap-dyner.appspot.com',
    iosBundleId: 'com.example.listas',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDfWhSVUProgW6VJpmmlehzCkX1AhclS7s',
    appId: '1:776814938300:android:b931d068e05f4feb2aa8b9',
    messagingSenderId: '776814938300',
    projectId: 'dap-dyner',
    authDomain: 'dap-dyner.firebaseapp.com',
    storageBucket: 'dap-dyner.appspot.com',
  );
}
