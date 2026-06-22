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

List<String> createLeadPhone2List(
  List<String>? leadChannelList,
  List<String>? leadTelePhone2List,
) {
  List<String> phone2List = [];
  int leadTeleListIndex = 0;

  for (int i = 0; i < leadChannelList!.length; i++) {
    if (leadChannelList![i] == 'Lead Telesale') {
      phone2List.add(leadTelePhone2List![leadTeleListIndex]);
      leadTeleListIndex++;
    } else {
      phone2List.add('-');
    }
  }

  return phone2List;
}
