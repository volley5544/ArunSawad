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

List<String>? insurancePlan(String? planInsurance) {
  List<String>? PlanList = [];
  if (planInsurance == 'แผน 1') {
    PlanList = [
      '200,000',
      '200,000',
      '200,000',
      '20,000',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-'
    ];
  } else if (planInsurance == 'แผน 2') {
    PlanList = [
      '300,000',
      '300,000',
      '300,000',
      '30,000',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-',
      '-'
    ];
  } else if (planInsurance == 'แผน 3') {
    PlanList = [
      '950,000',
      '950,000',
      '950,000',
      '50,000',
      '3,000',
      '6,000',
      '60,000',
      '3,000',
      '60,000',
      '2,500',
      '9,000',
      '9,000',
      '30,000',
      '2,000',
      '5,000'
    ];
  } else if (planInsurance == 'แผน 4') {
    PlanList = [
      '950,000',
      '950,000',
      '950,000',
      '50,000',
      '10,000',
      '20,000',
      '100,000',
      '10,000',
      '100,000',
      '3,000',
      '15,000',
      '10,000',
      '100,000',
      '5,000',
      '5,000'
    ];
  } else if (planInsurance == 'แผน 5') {
    PlanList = [
      '4,000,000',
      '4,000,000',
      '4,000,000',
      '50,000',
      '10,000',
      '20,000',
      '100,000',
      '10,000',
      '100,000',
      '3,000',
      '15,000',
      '10,000',
      '100,000',
      '5,000',
      '5,000'
    ];
  } else if (planInsurance == 'แผน 6') {
    PlanList = [
      '8,000,000',
      '8,000,000',
      '8,000,000',
      '50,000',
      '10,000',
      '20,000',
      '100,000',
      '10,000',
      '100,000',
      '3,000',
      '15,000',
      '10,000',
      '100,000',
      '5,000',
      '5,000'
    ];
  } else if (planInsurance == 'แผน 7') {
    PlanList = [
      '15,000,000',
      '15,000,000',
      '15,000,000',
      '50,000',
      '10,000',
      '20,000',
      '200,000',
      '10,000',
      '200,000',
      '3,500',
      '20,000',
      '12,000',
      '100,000',
      '6,500',
      '8,000'
    ];
  }
  return PlanList;
}
