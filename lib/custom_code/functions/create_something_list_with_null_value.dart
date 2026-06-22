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

List<String>? createSomethingListWithNullValue(
  List<int>? statusCodeList,
  List<String>? inputList,
) {
  //List<int> inputStatusCode = List<int>.from(statusCodeList!);

  List<String> outputList = [];
  int indexOfInput = 0;

  for (int i = 0; i < statusCodeList!.length; i++) {
    if (statusCodeList![i] == 200) {
      outputList.add(inputList![indexOfInput]);
      indexOfInput++;
    } else {
      outputList.add('9999-01-01');
    }
  }

  return outputList;
}
