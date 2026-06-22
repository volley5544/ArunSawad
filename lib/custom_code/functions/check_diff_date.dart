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

int checkDiffDate(
  DateTime? doNotShowDate,
  DateTime? currentDate,
) {
  // Add your function code here!
  //final now = DateTime.now();
  //final today = DateTime(now.year, now.month, now.day);
  //final yesterday = DateTime(now.year, now.month, now.day - 1);
  //final tomorrow = DateTime(now.year, now.month, now.day + 1);

  return DateTime(doNotShowDate!.year, doNotShowDate!.month, doNotShowDate!.day)
      .difference(
          DateTime(currentDate!.year, currentDate!.month, currentDate!.day))
      .inDays;
}
