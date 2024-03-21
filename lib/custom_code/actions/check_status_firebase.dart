// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future<bool?> checkStatusFirebase(String? username) async {
  // Add your function code here!
  bool thisFirebaseAccountIsCreated = true;
  String authType = 'Login';
  String emailUser = '$username@srisawadstaff.com';
  String password = 'a123456*';
  try {
    UserCredential userCredential1 = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailUser!, password: password!);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      thisFirebaseAccountIsCreated = false;
    }

    //else if (e.code == 'wrong-password') {
    //print('Wrong password provided for that user.');
    //}
  }
  return thisFirebaseAccountIsCreated;
}
