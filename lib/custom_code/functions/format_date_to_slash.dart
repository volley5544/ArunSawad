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

String? formatDateToSlash(String? inputDate) {
  if (inputDate == null || inputDate.isEmpty || inputDate == '-') {
    return '-';
  }

  // Parse the original date string to a DateTime object
  DateTime? dateTime;
  try {
    dateTime = DateTime.parse(inputDate);
  } catch (e) {
    // If parsing fails, return '-'
    return '-';
  }

  // Format the DateTime object to the desired format
  String formattedDateString = DateFormat('dd/MM/yyyy').format(dateTime!);

  // Return the formatted date string
  return formattedDateString;
}
