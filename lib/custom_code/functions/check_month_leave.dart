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

bool? checkMonthLeave(
  String? monthName,
  String? leaveDate,
) {
  if (monthName == null || leaveDate == null) return null;

  // Use a map to store the month names and their abbreviations
  var monthAbbreviations = {
    'มกราคม': 'ม.ค',
    'กุมภาพันธ์': 'ก.พ',
    'มีนาคม': 'มี.ค.',
    'เมษายน': 'เม.ย.',
    'พฤษภาคม': 'พ.ค.',
    'มิถุนายน': 'มิ.ย.',
    'กรกฎาคม': 'ก.ค.',
    'สิงหาคม': 'ส.ค.',
    'กันยายน': 'ก.ย.',
    'ตุลาคม': 'ต.ค.',
    'พฤศจิกายน': 'พ.ย.',
    'ธันวาคม': 'ธ.ค.'
  };

  // Get the abbreviation for the given month name
  String? monthShortName = monthAbbreviations[monthName];
  if (monthShortName == null) return null;

  // Check if the leave date contains the month abbreviation
  return leaveDate.contains(monthShortName);
}
