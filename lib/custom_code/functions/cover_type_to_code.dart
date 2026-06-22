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

List<String> coverTypeToCode(List<String>? coverTypeChosen) {
  List<String> result = [];
  for (var i = 0; i < coverTypeChosen!.length; i++) {
    if (coverTypeChosen[i] == 'ชั้น 1') {
      result.add('VMI1');
    } else if (coverTypeChosen[i] == 'ชั้น 2') {
      result.add('VMI2');
    } else if (coverTypeChosen[i] == 'ชั้น 2+') {
      result.add('VMI2+');
    } else if (coverTypeChosen[i] == 'ชั้น 3') {
      result.add('VMI3');
    } else if (coverTypeChosen[i] == 'ชั้น 3+') {
      result.add('VMI3+');
    }
  }
  return result;
}
