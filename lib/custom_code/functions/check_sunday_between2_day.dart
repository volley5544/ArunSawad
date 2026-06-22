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

int? checkSundayBetween2Day(
  DateTime? startDate,
  DateTime? endDate,
) {
  int numSundays = 0;
  endDate = endDate!.add(Duration(days: 1));
  // Loop through each day between the start and end dates
  for (DateTime date = startDate!;
      date.isBefore(endDate);
      date = date.add(Duration(days: 1))) {
    // Check if the current day is a Sunday
    if (date.weekday == 7) {
      numSundays++;
    }
  }

  return numSundays;
}
