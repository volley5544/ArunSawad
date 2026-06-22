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

String? checkLeaveCheckinType(
  List<String>? leaveStartDate,
  List<String>? leaveEndDate,
  String? currentDate,
  List<String>? leaveType,
  List<String>? subLeaveType,
) {
  if (leaveStartDate!.length == 0) {
    return 'ไม่มีวันหยุด';
  } else {
    for (int i = 0; i < leaveStartDate!.length; i++) {
      if (DateTime.parse(leaveStartDate![i])
              .isBefore(DateTime.parse(currentDate!)) &&
          DateTime.parse(leaveEndDate![i])
              .isAfter(DateTime.parse(currentDate!))) {
        return '${leaveType![i]}${subLeaveType![i]}';
      } else if (DateTime.parse(leaveStartDate![i]) ==
              DateTime.parse(currentDate!) ||
          DateTime.parse(leaveEndDate![i]) == DateTime.parse(currentDate!)) {
        return '${leaveType![i]}${subLeaveType![i]}';
      }
    }
    return 'ไม่มีวันหยุด';
  }
}
