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

List<String>? checkLeadPhoneNumber(List<String>? leadPhoneList) {
  List<String> phoneList = [];

  for (int i = 0; i < leadPhoneList!.length; i++) {
    if (leadPhoneList![i].length >= 10) {
      phoneList.add(leadPhoneList![i].substring(0, 10));
    } else {
      phoneList.add('(เบอร์โทรไม่ถูก)');
    }
  }

  return phoneList!;
}
