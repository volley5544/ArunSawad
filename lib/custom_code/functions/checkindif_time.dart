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

String checkindifTime(
  DateTime? checkinTime,
  DateTime? checkoutTime,
  int? difTime,
) {
  // Add your function code here!
  //leadCreatedTime = DateTime.parse("2022-09-20 10:00:00");
  int? h, m, s;
  int difTime = checkinTime!.difference(checkoutTime!).inSeconds;
  difTime = difTime - 3600;
  h = difTime ~/ 3600;

  m = ((difTime - h * 3600)) ~/ 60;

  s = difTime - (h * 3600) - (m * 60);
  String result = "$h:$m:$s";
  return result;
}
