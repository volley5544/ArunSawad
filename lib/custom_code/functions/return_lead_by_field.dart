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

dynamic returnLeadByField(
  List<dynamic>? leadJsonInput,
  String? filter1Value,
  String? filter2Value,
) {
  dynamic output = [];

  for (int i = 0; i < leadJsonInput!.length; i++) {
    Map<String, dynamic> mapInputData = leadJsonInput![i];

    if (('${filter1Value}' == 'ทั้งหมด'
            ? true
            : '${filter1Value}' == '${mapInputData['sub_channel']}') &&
        ('${filter2Value}' == 'ทั้งหมด'
            ? true
            : '${filter2Value}' == '${mapInputData['car_vehicle_name']}')) {
      output.add(mapInputData);
    }
  }
  return output;
}
