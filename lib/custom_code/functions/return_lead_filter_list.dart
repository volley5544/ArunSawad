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

dynamic returnLeadFilterList(List<dynamic>? leadJsonList) {
  dynamic output = {
    'AssetTypeFilter': ['ทั้งหมด'],
    'SubChannelFilter': ['ทั้งหมด']
  };
  //Map<String, dynamic> mapInputData = leadJsonList![0];
  // print(mapInputData);
//   Map<String, dynamic> mapInputData = leadJsonList![0];
//   print(mapInputData['channel']);
//   print(output['${mapInputData['channel']}']);

  //return output;

  for (int i = 0; i < leadJsonList!.length; i++) {
    Map<String, dynamic> mapInputData = leadJsonList![i];
    if (!(output['SubChannelFilter']
        .contains('${mapInputData['sub_channel']}'))) {
      output['SubChannelFilter'].add('${mapInputData['sub_channel']}');
    }
    if (!(output['AssetTypeFilter']
        .contains('${mapInputData['car_vehicle_name']}'))) {
      output['AssetTypeFilter'].add('${mapInputData['car_vehicle_name']}');
    }
  }

  return output;
}
