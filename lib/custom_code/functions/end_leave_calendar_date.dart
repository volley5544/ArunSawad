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

DateTime endLeaveCalendarDate(
  DateTime? startDate,
  int? leaveCount,
) {
  // Add your function code here!
  if (leaveCount == 0) {
    DateTime endDateCalendar1 = startDate!;
    return endDateCalendar1;
  } else {
    DateTime endDateCalendar2 = startDate!.add(Duration(days: leaveCount! - 1));
    return endDateCalendar2;
  }
}
