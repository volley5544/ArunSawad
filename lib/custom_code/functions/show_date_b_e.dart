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

String? showDateBE(String? inputDateStr) {
  DateTime inputDate = DateTime.parse(inputDateStr!);
  DateTime newDate =
      DateTime(inputDate!.year + 543, inputDate!.month, inputDate!.day);

  // Create a DateFormat instance with the Thai locale and B.E. era
//   final thaiDateFormat = DateFormat.yMd('th').add_y();
  final thaiDateFormat = DateFormat('dd/MM/y');

  // Format the date in Thai style with B.E. era
  String formattedDate = thaiDateFormat.format(newDate);

  print(formattedDate); // Output: "13 กุมภาพันธ์ 2539"
  return formattedDate;
}
