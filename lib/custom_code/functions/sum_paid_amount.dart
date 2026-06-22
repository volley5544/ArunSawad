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

String? sumPaidAmount(
  String? overDue,
  String? remain624,
  String? remain401,
) {
  double overDueDouble = double.parse(overDue!); // Convert string to double
  double remain624Double = double.parse(remain624!);
  double remain401Double = double.parse(remain401!);

  double sum =
      overDueDouble + remain624Double + remain401Double; // Add the doubles

  String result = sum.toString(); // Convert the result back to string

  return result;
}
