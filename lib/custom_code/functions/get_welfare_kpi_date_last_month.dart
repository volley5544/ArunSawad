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

String? getWelfareKpiDateLastMonth(String? date) {
  String text = 'text';

  if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'January') {
    text =
        'ธันวาคม ${int.parse(DateFormat('yyyy').format(DateTime.parse(date))) - 1}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'February') {
    text = 'มกราคม ${DateFormat('yyyy').format(DateTime.parse(date))}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'March') {
    text = 'กุมภาพันธ์ ${DateFormat('yyyy').format(DateTime.parse(date))}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'April') {
    text = 'มีนาคม ${DateFormat('yyyy').format(DateTime.parse(date))}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'May') {
    text = 'เมษายน ${DateFormat('yyyy').format(DateTime.parse(date))}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'June') {
    text = 'พฤษภาคม ${DateFormat('yyyy').format(DateTime.parse(date))}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'July') {
    text = 'มิถุนายน ${DateFormat('yyyy').format(DateTime.parse(date))}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'August') {
    text = 'กรกฎาคม ${DateFormat('yyyy').format(DateTime.parse(date))}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'September') {
    text = 'สิงหาคม ${DateFormat('yyyy').format(DateTime.parse(date))}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'October') {
    text = 'กันยายน ${DateFormat('yyyy').format(DateTime.parse(date))}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'November') {
    text = 'ตุลาคม ${DateFormat('yyyy').format(DateTime.parse(date))}';
  } else if (DateFormat('MMMM').format(DateTime.parse(date!)) == 'December') {
    text = 'พฤศจิกายน ${DateFormat('yyyy').format(DateTime.parse(date))}';
  }

  return text;
}
