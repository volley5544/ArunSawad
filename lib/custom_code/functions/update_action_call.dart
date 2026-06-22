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

List<dynamic>? updateActionCall(
  List<dynamic>? jsonList,
  String? leadId,
  String? status,
) {
  if (jsonList == null ||
      jsonList.isEmpty ||
      leadId == null ||
      status == null) {
    return jsonList; // Return original list if any required parameter is null or empty
  }

  return jsonList.map((item) {
    if (item is Map<String, dynamic> && item["lead_id"] == leadId) {
      // Convert countCall to int, increment by 1, then convert back to string
      int newCount = int.tryParse(item["countCall"] ?? "0") ?? 0;
      newCount += 1;

      return {
        ...item,
        "actionCall": status,
        "countCall": newCount.toString(), // Convert back to string
      };
    }
    return item;
  }).toList();
}
