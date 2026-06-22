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

String? getDateFormatAPIFromThaiFormat(String? thaiDate) {
  List<String> listStr = thaiDate!.split(' ').toList();
  //print(listStr);

  String dayThai = listStr[0].replaceAll(RegExp('[^A-Za-z0-9.ก-ฮะ-เ]'), '');
  String monthThai = listStr[1].replaceAll(RegExp('[^A-Za-z0-9.ก-ฮะ-เ]'), '');
  String yearThai = listStr[2].replaceAll(RegExp('[^A-Za-z0-9.ก-ฮะ-เ]'), '');

  //String? monthTH = monthThai;
  Map<String, String> monthNames = {
    'ม.ค.': '01',
    'ก.พ.': '02',
    'มี.ค.': '03',
    'เม.ย.': '04',
    'พ.ค.': '05',
    'มิ.ย.': '06',
    'ก.ค.': '07',
    'ส.ค.': '08',
    'ก.ย.': '09',
    'ต.ค.': '10',
    'พ.ย.': '11',
    'ธ.ค.': '12',
  };

  String? month = monthNames[monthThai];
  //print(month);

  String day = '';

  if (dayThai == '1') {
    day = '01';
  } else if (dayThai == '2') {
    day = '02';
  } else if (dayThai == '3') {
    day = '03';
  } else if (dayThai == '4') {
    day = '04';
  } else if (dayThai == '5') {
    day = '05';
  } else if (dayThai == '6') {
    day = '06';
  } else if (dayThai == '7') {
    day = '07';
  } else if (dayThai == '8') {
    day = '08';
  } else if (dayThai == '9') {
    day = '09';
  } else {
    day = dayThai;
  }

  int year = int.parse(yearThai) - 543;

  //print('$year-$month-$day');
  return '$year-$month-$day';
}
