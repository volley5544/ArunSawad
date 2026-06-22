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

String? getKpiWelfareStatusText(
  String? percentKpiWelfare,
  String? percentTarget,
) {
  String statusText = 'status';

  if (double.parse(percentKpiWelfare!) >= double.parse(percentTarget!)) {
    statusText = 'ผ่าน';
    // } else if (double.parse(percentKpiWelfare!) >= 100.0) {
    //   statusText = 'ผ่าน';
    // } else if (double.parse(percentKpiWelfare!) >= 90.0) {
    //   statusText = 'ผ่าน';
    // } else if (double.parse(percentKpiWelfare!) >= 80.0) {
    //   statusText = 'ไม่ผ่าน';
  } else {
    statusText = 'ไม่ผ่าน';
  }

  return statusText;
}
