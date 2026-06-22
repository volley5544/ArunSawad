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

String dailySplashPageText(
  List<String>? splashPageTextList,
  String? day,
) {
  // Add your function code here!
  int dayNumber = 0;

  if (day! == 'Tuesday') {
    dayNumber = 1;
  } else if (day! == 'Wednesday') {
    dayNumber = 2;
  } else if (day! == 'Thursday') {
    dayNumber = 3;
  } else if (day! == 'Friday') {
    dayNumber = 4;
  } else if (day! == 'Saturday') {
    dayNumber = 5;
  } else if (day! == 'Sunday') {
    dayNumber = 6;
  }

  return splashPageTextList![dayNumber];
}
