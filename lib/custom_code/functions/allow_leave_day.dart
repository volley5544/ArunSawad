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

bool? allowLeaveDay(
  String? leaveDayType,
  List<String>? quotaLeaveDay,
  double? leaveDayInput,
) {
  if (leaveDayType == null || quotaLeaveDay == null || leaveDayInput == null)
    return false;

  final leaveTypes = {
    'ลาป่วย': 0,
    'ลากิจ': 1,
    'ลาพักร้อน': 2,
    'ลาอุปสมบท': 3,
    'ลาเพื่อรับราชการทหาร': 4,
    'ลาคลอด': 5,
    'ลาทำหมัน': 6,
    'ลาโดยไม่รับค่าตอบแทน': 7,
  };

  final index = leaveTypes[leaveDayType];

  if (index == null) return false;

  try {
    final quota = double.parse(quotaLeaveDay[index]);

    switch (index) {
      case 2:
        return quota >= leaveDayInput && leaveDayInput <= 5;
      default:
        return quota >= leaveDayInput;
    }
  } catch (e) {
    return false;
  }
}
