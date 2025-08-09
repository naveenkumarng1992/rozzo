import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA1f7KuiuZQyjfg6nCuCaAcWZaZ1DhPYy4",
            authDomain: "med-max-ezfe7d.firebaseapp.com",
            projectId: "med-max-ezfe7d",
            storageBucket: "med-max-ezfe7d.appspot.com",
            messagingSenderId: "477111800015",
            appId: "1:477111800015:web:21b45cf0904a89cbe2e7ba"));
  } else {
    await Firebase.initializeApp();
  }
}
