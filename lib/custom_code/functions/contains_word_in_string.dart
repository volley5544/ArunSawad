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

List<String>? containsWordInString(List<String>? campaignGroup) {
  List<String>? result = [];
  for (var i = 0; i < campaignGroup!.length; i++) {
    if (campaignGroup![i].contains("ครอบครัวสุขใจ X2")) {
      result!.add("ครอบครัวสุขใจ X2");
    } else if (campaignGroup![i].contains("พี่วินคุ้มชัวร์")) {
      result!.add("พี่วินคุ้มชัวร์");
    } else if (campaignGroup![i].contains("อุ่นใจสบายกระเป๋า")) {
      result!.add("อุ่นใจสบายกระเป๋า");
    } else {
      result!.add("อื่นๆ");
    }
  }
  return result;
}
