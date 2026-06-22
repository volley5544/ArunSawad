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

List<int>? setReportItemIndexList(String? pageNumber) {
  int page = int.parse(pageNumber!);
  //int firstIndex = (int.parse(pageNumber!)-1);
  int firstIndex = 0;
  int lastIndex = 9;
  List<int> indexList = [firstIndex, lastIndex];
  if (page == 1) {
    return indexList;
  } else {
    firstIndex = (((page - 1) * 10) + 1) - 1;
    lastIndex = (page * 10) - 1;
    indexList = [firstIndex, lastIndex];
    return indexList;
  }
}
