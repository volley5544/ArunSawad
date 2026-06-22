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

String leadCalledStatusText(
  String? leadCardColorForStatus,
  String? leadCalledStatus,
  String? leadCalledStatusReason,
) {
  // Add your function code here!
  String statusText = 'งง';
  if (leadCardColorForStatus! == 'WHITE') {
    statusText = 'ยังไม่ได้โทร';
  } else if (leadCardColorForStatus! == 'ORANGE') {
    //statusText = 'โทรและมีการบันทึกแล้ว';
    statusText = '${leadCalledStatus!} ${leadCalledStatusReason!}';
  } else if (leadCardColorForStatus! == 'YELLOW') {
    statusText = 'โทรแต่ยังไม่บันทึกระบบลีด';
  }

  return statusText;
}
