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

List<String> leaveWorkCheck(
  List<String>? leaveWorkIdList,
  List<String>? leaveWorkDayList,
) {
  /*  List<String>? lWL = [];
   List<String>? lWD = [];
  for(int i =0;i<leaveWorkIdList!.length;i++){
    if(leaveWorkIdList[i] == '1'){
      lWD.add(leaveWorkIdList[i]);
      lWL.add(leaveWorkDayList![i]);
    }
  }*/
  List<String> result = [];
  int n = 1;
  for (int i = 0; i < leaveWorkIdList!.length; i++) {
    if (int.parse(leaveWorkIdList[i]) == i + n) {
      result.add(leaveWorkDayList![i]);
    } else {
      result.add('0.0');
      i--;
      n++;
    }
  }
  return result;
  // Add your function code here!
}
