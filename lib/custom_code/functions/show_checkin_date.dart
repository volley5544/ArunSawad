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

String showCheckinDate(String? date) {
  // Add your function code here!
  //DateFormat('EEEE').format(date!)
  String weekday = 'week_day';
  String month = 'month';

  if (DateFormat('EEEE').format(DateTime.parse(date!)) == 'Monday') {
    weekday = 'จ.';
  } else if (DateFormat('EEEE').format(DateTime.parse(date)) == 'Tuesday') {
    weekday = 'อ.';
  } else if (DateFormat('EEEE').format(DateTime.parse(date)) == 'Wednesday') {
    weekday = 'พ.';
  } else if (DateFormat('EEEE').format(DateTime.parse(date)) == 'Thursday') {
    weekday = 'พฤ.';
  } else if (DateFormat('EEEE').format(DateTime.parse(date)) == 'Friday') {
    weekday = 'ศ.';
  } else if (DateFormat('EEEE').format(DateTime.parse(date)) == 'Saturday') {
    weekday = 'ส.';
  } else if (DateFormat('EEEE').format(DateTime.parse(date)) == 'Sunday') {
    weekday = 'อา.';
  } else {
    weekday = 'week_day?';
  }

  if (DateFormat('MMMM').format(DateTime.parse(date)) == 'January') {
    month = 'ม.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'February') {
    month = 'ก.พ.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'March') {
    month = 'มี.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'April') {
    month = 'เม.ย.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'May') {
    month = 'พ.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'June') {
    month = 'มิ.ย.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'July') {
    month = 'ก.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'August') {
    month = 'ส.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'September') {
    month = 'ก.ย.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'October') {
    month = 'ต.ค.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'November') {
    month = 'พ.ย.';
  } else if (DateFormat('MMMM').format(DateTime.parse(date)) == 'December') {
    month = 'ธ.ค.';
  }

  return DateFormat(
    '$weekday dd $month yy',
  ).format(DateTime.parse(date));
}
