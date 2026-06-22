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

String? genQRCodePayment(
  String? suffix,
  String? ref1,
  String? ref2,
  String? amount,
  String? taxId,
) {
  double originalValue = double.parse(amount!);

  // Step 2: Perform the Multiplication
  double multipliedValue = originalValue * 100;

  // Step 3: Format the Result with 2 decimal places
  String amount100 = multipliedValue.toString();
  String data = '''
|$taxId$suffix
$ref1
$ref2
$amount100
''';
  return data;
}
