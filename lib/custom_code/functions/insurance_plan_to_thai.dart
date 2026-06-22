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

String? insurancePlanToThai(String? numberPlan) {
  String planThai = '';
  if (numberPlan == '01') {
    planThai = 'แผน 1';
  } else if (numberPlan == '02') {
    planThai = 'แผน 2';
  } else if (numberPlan == '04') {
    planThai = 'แผน 4';
  } else if (numberPlan == '05') {
    planThai = 'แผน 5';
  } else if (numberPlan == '06') {
    planThai = 'แผน 6';
  } else if (numberPlan == '07') {
    planThai = 'แผน 7';
  } else if (numberPlan == '03') {
    planThai = 'แผน 3';
  } else {
    planThai = '-';
  }
  return planThai;
}
