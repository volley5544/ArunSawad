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

List<DateTime>? generateLast30DateTimeList(String? selectedDate) {
  final currentDate = DateTime.parse(selectedDate!);

  // Generate a list of the last 30 days
  final last30Days = List.generate(
    30,
    (index) => currentDate.subtract(Duration(days: index)),
  );
  //print(last30Days);
  return last30Days;
}
