import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCbsXdO3VXSmIvZKBX4DyWsgcrCKHn33Ss",
            authDomain: "flut-flow-test.firebaseapp.com",
            projectId: "flut-flow-test",
            storageBucket: "flut-flow-test.appspot.com",
            messagingSenderId: "379132035355",
            appId: "1:379132035355:web:026a6a9c1cf279992153be"));
  } else {
    await Firebase.initializeApp();
  }
}
