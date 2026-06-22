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

int leaveTypeToCanLeaveSince(
  String? leaveTypeDropdown,
  List<String>? leaveListAllowDay,
  List<int>? leaveListAllowInt,
) {
  // Add your function code here!
  int index = leaveListAllowDay!.indexOf('$leaveTypeDropdown');
  int result = leaveListAllowInt![index];
  // if (leaveTypeDropdown == 'ลาป่วย') {
  //   result = -7;
  // }
  // if (leaveTypeDropdown == 'ลากิจ') {
  //   result = 1;
  // }
  // if (leaveTypeDropdown == 'ลาพักร้อน') {
  //   result = 7;
  // }
  // if (leaveTypeDropdown == 'ลาคลอด') {
  //   result = 14;
  // }
  // if (leaveTypeDropdown == 'ลาอุปสมบท') {
  //   result = 14;
  // }
  // if (leaveTypeDropdown == 'ลาไม่โดยรับค่าตอบแทน') {
  //   result = 14;
  // }
  // if (leaveTypeDropdown == 'ลาทำหมัน') {
  //   result = 14;
  // }
  // if (leaveTypeDropdown == 'ลาเพื่อรับราชการทหาร') {
  //   result = 14;
  // }

  return result;
}
