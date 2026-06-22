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

String endLeaveDayCalString(
  DateTime? startLeaveDay,
  int? dayLeaveNumber,
  String? leaveTime,
) {
  String result = '';
  if (leaveTime == 'ลาเต็มวัน') {
    DateTime endLeaveDay =
        startLeaveDay!.add(Duration(days: dayLeaveNumber! - 1));
    // Add your function code here!
    result = DateFormat('yyyy-MM-dd').format(endLeaveDay);
  } else {
    // Add your function code here!
    result = DateFormat('yyyy-MM-dd').format(startLeaveDay!);
  }
  return result;
}
