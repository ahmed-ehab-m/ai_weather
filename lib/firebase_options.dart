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
    apiKey: 'AIzaSyCLDJnjmKiC45NBAKeFN0auCdmkhgLtO5M',
    appId: '1:1048119945520:web:922ee0851f10fed75100f5',
    messagingSenderId: '1048119945520',
    projectId: 'ai-weather-438a3',
    authDomain: 'ai-weather-438a3.firebaseapp.com',
    storageBucket: 'ai-weather-438a3.firebasestorage.app',
    measurementId: 'G-DETWTC8CFD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_HWrITS3I-O-4YyQGjB86ItqOOJl3hhI',
    appId: '1:1048119945520:android:4eeaef43b6e077fc5100f5',
    messagingSenderId: '1048119945520',
    projectId: 'ai-weather-438a3',
    storageBucket: 'ai-weather-438a3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBn0JwZ_akCqP8Oxm5s_R1Bb8taDs3GP1A',
    appId: '1:1048119945520:ios:bb908e31eef6a4d25100f5',
    messagingSenderId: '1048119945520',
    projectId: 'ai-weather-438a3',
    storageBucket: 'ai-weather-438a3.firebasestorage.app',
    iosBundleId: 'com.example.aiWeather',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBn0JwZ_akCqP8Oxm5s_R1Bb8taDs3GP1A',
    appId: '1:1048119945520:ios:bb908e31eef6a4d25100f5',
    messagingSenderId: '1048119945520',
    projectId: 'ai-weather-438a3',
    storageBucket: 'ai-weather-438a3.firebasestorage.app',
    iosBundleId: 'com.example.aiWeather',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCLDJnjmKiC45NBAKeFN0auCdmkhgLtO5M',
    appId: '1:1048119945520:web:cc5f0d8cf30207c55100f5',
    messagingSenderId: '1048119945520',
    projectId: 'ai-weather-438a3',
    authDomain: 'ai-weather-438a3.firebaseapp.com',
    storageBucket: 'ai-weather-438a3.firebasestorage.app',
    measurementId: 'G-XFKK3RR1WG',
  );
}
