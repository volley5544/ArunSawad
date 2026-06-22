import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String>? returnValueSaveCallCollection(
  List<String>? list1,
  List<String>? list2,
  String? dropdown1Input,
) {
  List<String> listString = [];

  // Check if dropdown1Input is not null before using it in the loop
  if (dropdown1Input != null) {
    for (int i = 0; i < list1!.length; i++) {
      // Use == to compare the values, not the lists themselves
      if (list1[i] == dropdown1Input) {
        listString.add('${list2![i]}');
        // Perform your desired action here
      }
    }
  }

  return listString; // Join the list elements into a single string
}
