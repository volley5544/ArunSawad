// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future<String> a13(String? username) async {
  // Add your function code here!
  bool thisFirebaseAccountIsCreated = true;
  String authType = 'Login';

  try {
    UserCredential userCredential1 = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: username!, password: "a123456*");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      thisFirebaseAccountIsCreated = false;
    }

    //else if (e.code == 'wrong-password') {
    //print('Wrong password provided for that user.');
    //}

  }

  if (thisFirebaseAccountIsCreated == false) {
    authType = 'Create';
    try {
      UserCredential userCredentia2 = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: username!, password: "a123456*");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        thisFirebaseAccountIsCreated = true;
      }
    } catch (e) {
      print(e);
    }
  }
  return authType;
}
//try {
//UserCredential userCredential3 = await //FirebaseAuth.instance.signInWithEmailAndPassword(
//email: username!,
//password: "a123456*"
//);
//} //on FirebaseAuthException catch (e) {
//if (e.code == 'user-not-found') {
//thisFirebaseAccountIsCreated = false;
//}

//else if (e.code == 'wrong-password') {
//print('Wrong password provided for that user.');
//}

//}

//}
