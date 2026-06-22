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

List<String> filterSumInsured(
  double? sumInsured,
  List<String>? filterlist,
  List<String>? searchlist,
) {
  List<int> index = [];
  List<String> filterlast = [];

  for (int i = 0; i < filterlist!.length; i++) {
    if (sumInsured! >= double.parse(filterlist[i])) {
      index.add(i);
    }
  }
  for (int i = 0; i < index.length; i++) {
    filterlast.add(searchlist![index[i]]);
  }
  return filterlast;
  // Add your function code here!
}
