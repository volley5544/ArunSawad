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

List<String>? returnInsuranceBasicInsurerList(
  List<String>? originalList1,
  List<String>? originalList2,
  List<String>? selectedList,
) {
  // find index of originalList1
  List<String> outputList = [];
  for (int i = 0; i < selectedList!.length; i++) {
    outputList.add(originalList1![originalList2!.indexOf(selectedList![i])]);
  }

  return outputList;
}
