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

List<SLSImagesDataModelStruct>? reorderSlsImageList(
  List<SLSImagesDataModelStruct>? inputList,
  int? index,
) {
  List<SLSImagesDataModelStruct> outputList = inputList!;
  final item = inputList!.removeAt(index!); // remove and return item
  outputList.insert(0, item);
  return outputList;
}
