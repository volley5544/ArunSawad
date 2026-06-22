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

bool? checkContainsChatRoom(
  List<SawadChatRoomRecord>? inputChatRoomDocList,
  List<String>? employeeIdList,
  List<String>? employeeIdReverseList,
) {
  List<dynamic> usersEmployeeIdList = [];

  for (int i = 0; i < inputChatRoomDocList!.length; i++) {
    usersEmployeeIdList.add(inputChatRoomDocList![i].usersEmplayeeId);
  }

  final listEquality = const ListEquality();

  bool containsList2 = usersEmployeeIdList
      .any((element) => listEquality.equals(element, employeeIdList!));
  bool containsList3 = usersEmployeeIdList
      .any((element) => listEquality.equals(element, employeeIdReverseList!));

  if (containsList2 || containsList3) {
    return true;
  } else {
    return false;
  }
}
