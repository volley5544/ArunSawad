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

Color? getKpiWelfareStatusTextColor(
  String? percentKpiWelfare,
  List<Color>? gaugeColorList,
  String? maxWelfareTarget,
) {
  Color statusColor = Colors.transparent;

  if (double.parse(percentKpiWelfare!) >=
      double.parse(maxWelfareTarget!) * 0.67) {
    //statusText = 'ซุปเปอร์ไซย่า!';
    statusColor = gaugeColorList![4];
  } else if (double.parse(percentKpiWelfare!) >=
      double.parse(maxWelfareTarget!) * 0.556) {
    //statusText = 'แข็งแกร่ง!';
    statusColor = gaugeColorList![3];
  } else if (double.parse(percentKpiWelfare!) >=
      double.parse(maxWelfareTarget!) * 0.5) {
    //statusText = 'ผ่าน';
    statusColor = gaugeColorList![2];
  } else if (double.parse(percentKpiWelfare!) >=
      double.parse(maxWelfareTarget!) * 0.45) {
    //statusText = 'เกือบผ่าน';
    statusColor = gaugeColorList![1];
  } else {
    //statusText = 'ไม่ผ่าน';
    statusColor = gaugeColorList![0];
  }

  return statusColor;
}
