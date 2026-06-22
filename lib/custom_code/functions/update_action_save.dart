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

List<dynamic>? updateActionSave(
  List<dynamic>? jsonList,
  String? leadId,
  String? status,
  String? callStatus,
  String? statusCallOut,
) {
  if (jsonList == null ||
      jsonList.isEmpty ||
      leadId == null ||
      status == null ||
      callStatus == null ||
      statusCallOut == null) {
    return jsonList; // Return original list if any required parameter is null or empty
  }

  return jsonList.map((item) {
    if (item is Map<String, dynamic> && item["lead_id"] == leadId) {
      return {
        ...item,
        "actionCall": status,
        "call_status": callStatus,
        "statusCallOut": statusCallOut,
      };
    }
    return item;
  }).toList();
}
