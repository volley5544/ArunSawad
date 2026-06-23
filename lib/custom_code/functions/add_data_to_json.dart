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

List<dynamic>? addDataToJson(List<dynamic>? jsonList) {
  if (jsonList == null || jsonList.isEmpty) {
    return []; // Return an empty list if input is null or empty
  }

  try {
    // Ensure all items in the list are Map<String, dynamic> before modifying
    return jsonList.map((item) {
      if (item is Map<String, dynamic>) {
        return {...item, "actionCall": "N", "saveCallStatus": "-"};
      } else {
        throw Exception("Invalid item in list: Expected Map<String, dynamic>");
      }
    }).toList(); // Return updated list
  } catch (e) {
    print("Error processing JSON: $e");
    return null; // Return null if an error occurs
  }
}
