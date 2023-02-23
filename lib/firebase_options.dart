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
    apiKey: 'AIzaSyCI5ckm5uxu5ALA1itkQBByqJU5loxGwBY',
    appId: '1:172503708175:web:57d8e6c01e3c0895c8e97a',
    messagingSenderId: '172503708175',
    projectId: 'baseballboy-ver2',
    authDomain: 'baseballboy-ver2.firebaseapp.com',
    storageBucket: 'baseballboy-ver2.appspot.com',
    measurementId: 'G-6HW1DS5TD9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyByrsWPXZDWXKU75QfsdJZsyxd_eBn6zl0',
    appId: '1:172503708175:android:c68f578f7ace963cc8e97a',
    messagingSenderId: '172503708175',
    projectId: 'baseballboy-ver2',
    storageBucket: 'baseballboy-ver2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD28633aLUu3xYf2oGqh-3fcaGqDIl7XIA',
    appId: '1:172503708175:ios:143a7ca35e5fe6d0c8e97a',
    messagingSenderId: '172503708175',
    projectId: 'baseballboy-ver2',
    storageBucket: 'baseballboy-ver2.appspot.com',
    iosClientId: '172503708175-jidq6ukojq19lc56hotgsahgdt4m86ip.apps.googleusercontent.com',
    iosBundleId: 'com.example.baseballboyVer2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD28633aLUu3xYf2oGqh-3fcaGqDIl7XIA',
    appId: '1:172503708175:ios:143a7ca35e5fe6d0c8e97a',
    messagingSenderId: '172503708175',
    projectId: 'baseballboy-ver2',
    storageBucket: 'baseballboy-ver2.appspot.com',
    iosClientId: '172503708175-jidq6ukojq19lc56hotgsahgdt4m86ip.apps.googleusercontent.com',
    iosBundleId: 'com.example.baseballboyVer2',
  );
}
