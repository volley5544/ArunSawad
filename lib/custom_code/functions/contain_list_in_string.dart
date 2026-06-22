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

bool? containListInString(
  List<String>? listString,
  String? input,
) {
  if (listString == null || input == null) {
    return false; // Return null if either is null
  }
  // Use any() to check if at least one element in the list is found in the input string
  bool containsAny = listString.any((element) => input.contains(element));

  return containsAny;
}
