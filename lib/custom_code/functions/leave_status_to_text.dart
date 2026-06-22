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

String? leaveStatusToText(String? leaveStatus) {
  if (leaveStatus == '1') {
    return 'รอการอนุมัติ';
  } else if (leaveStatus == '2') {
    return 'รอการอนุมัติ';
  } else if (leaveStatus == '3') {
    return 'อนุมัติการลาเรียบร้อย';
  } else if (leaveStatus == '4') {
    return 'ไม่อนุมัติการลา';
  } else if (leaveStatus == '0') {
    return 'ยกเลิกการลา';
  }
}
