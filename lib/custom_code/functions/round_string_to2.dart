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

String? roundStringTo2(String? originalString) {
// Parse the string as a double
  double originalNumber = double.parse(originalString!);

// Round the number to two decimal places
  String roundedNumber = '${double.parse(originalNumber.toStringAsFixed(2))}';

  return roundedNumber; // This will print 1.38 as a double
}
