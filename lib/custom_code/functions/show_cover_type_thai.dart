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

String showCoverTypeThai(String? coverTypeEng) {
  // Add your function code here!
  String result = "";

  if (coverTypeEng == 'VMI1') {
    result = 'ชั้น 1';
  } else if (coverTypeEng == 'VMI1') {
    result = 'ชั้น 2';
  } else if (coverTypeEng == 'VMI2+') {
    result = 'ชั้น 2+';
  } else if (coverTypeEng == 'VMI3') {
    result = 'ชั้น 3';
  } else if (coverTypeEng == 'VMI3+') {
    result = 'ชั้น 3+';
  }
  return result;
}
