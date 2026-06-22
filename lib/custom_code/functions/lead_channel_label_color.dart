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

Color leadChannelLabelColor(
  List<String>? leadChannelList,
  List<Color>? labelColorFirebase,
  int? index,
) {
  // Add your function code here!
  Color labelColor;

  if (leadChannelList![index!] == 'Lead Survey') {
    labelColor = labelColorFirebase![0];
  } else if (leadChannelList![index!] == 'Lead Telesale') {
    labelColor = labelColorFirebase![1];
  } else if (leadChannelList![index!] == 'Lead Agent') {
    labelColor = labelColorFirebase![2];
  } else if (leadChannelList![index!] == 'Lead GSB') {
    labelColor = labelColorFirebase![3];
  } else if (leadChannelList![index!] == 'Lead Vloan') {
    labelColor = labelColorFirebase![4];
  } else {
    labelColor = labelColorFirebase![5];
  }

  return labelColor;
}
