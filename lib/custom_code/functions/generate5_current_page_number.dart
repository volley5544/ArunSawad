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

List<String>? generate5CurrentPageNumber(
  String? currentPageNumber,
  int? maxPage,
) {
  List<String> pageSelectionList = [];
  int currentPage = int.parse(currentPageNumber!);

  if (currentPage == maxPage! || (currentPage + 1) == maxPage!) {
    for (int i = maxPage! - 4; i <= maxPage!; i++) {
      pageSelectionList.add('$i');
    }
  } else if (currentPage == 1 || currentPage == 2) {
    for (int i = 1; i <= 5!; i++) {
      pageSelectionList.add('$i');
    }
  } else {
    for (int i = currentPage - 2;
        i <= (currentPage + 2) && i <= maxPage!;
        i++) {
      pageSelectionList.add('$i');
    }
  }

  return pageSelectionList;
}
