import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDSwSwIhH_V546OQmm9PQGVyzCkHBRycL0",
            authDomain: "app-8110.firebaseapp.com",
            projectId: "app-8110",
            storageBucket: "app-8110.appspot.com",
            messagingSenderId: "666818562351",
            appId: "1:666818562351:web:6bf44a1538da524cd339da"));
  } else {
    await Firebase.initializeApp();
  }
}
