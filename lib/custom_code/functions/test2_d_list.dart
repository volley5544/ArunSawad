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

List<dynamic>? test2DList() {
  List<String> listText = ['1', '2', '3'];
  List<String> listText1 = ['4', '5', '6'];
  List<String> listText2 = ['11', '22', '33'];
  List<dynamic> finalList = [listText1, listText2, listText];

  // List<String> insurerId = ['1','2','7];
  // List<String> insurerCode = ['111','222','777];
  // List<String> insurerName = ['ชับบ์','ทิพย์','ซัมติง']
  // List<dynamic> coverTypeId = [['1','2','3'],['2','3','5'],['1','2','3','4','5']];
  // List<dynamic> coverTypeName = [['ชั้น 1','ชั้น 2','ชั้น 2+'],['ชั้น 2','ชั้น 2+','ชั้น 3+'],['ชั้น 1','ชั้น 2','ชั้น 2+','ชั้น 3','ชั้น 3+']];

  return finalList;
}
