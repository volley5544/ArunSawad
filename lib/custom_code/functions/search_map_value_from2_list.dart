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

String searchMapValueFrom2List(
  List<String>? somethingList1,
  List<String>? somethingList2,
  String? searchValue,
) {
  // ใส่valueของ list2 เพื่อหาค่าที่mapกันของlist1

  Map<String, String> mappedList =
      Map.fromIterables(somethingList1!, somethingList2!);

  List<String> keysWithSearchValue = mappedList.entries
      .where((entry) => entry.value == searchValue!)
      .map((entry) => entry.key)
      .toList();

  if (keysWithSearchValue.length > 0) {
    return keysWithSearchValue[0];
  } else {
    return '';
  }
}
