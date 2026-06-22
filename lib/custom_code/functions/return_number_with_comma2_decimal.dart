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

String? returnNumberWithComma2Decimal(String? number) {
  if ('${number}' == 'null' ||
      '${number}' == '' ||
      number == null ||
      double.tryParse(number.replaceAll('-', '')) == null) {
    return '0.00';
  }

  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';

  String result = '${double.parse(number!).toStringAsFixed(2)}'
      .replaceAllMapped(reg, mathFunc);

  return result!;
}
