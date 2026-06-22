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

int? getMaxPageNumber(int? reportItemNumber) {
  if (reportItemNumber! == 0) {
    return 1;
  }
  var maxPageNumber = reportItemNumber! / 10;
  int maxPage = 1;

  bool isInteger(num value) => value is int || value == value.roundToDouble();
  if (isInteger(maxPageNumber)) {
    // for (int i = 1; i <= maxPageNumber.toInt(); i++) {
    //   pageSelectionList.add('$i');
    // }
    maxPage = maxPageNumber.toInt();
  } else {
    // for (int i = 1; i <= (maxPageNumber.toInt() + 1); i++) {
    //   pageSelectionList.add('$i');
    // }
    maxPage = maxPageNumber.toInt() + 1;
  }

  return maxPage;
}
