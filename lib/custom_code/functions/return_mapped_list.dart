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

List<String>? returnMappedList(
  List<String>? somethingList1,
  List<String>? somethingList2,
  List<String>? searchedList,
) {
  List<String> output = [];

  for (int i = 0; i < searchedList!.length; i++) {
    output.add(somethingList1![somethingList2!.indexOf(searchedList![i])]);
  }

  return output;
}
