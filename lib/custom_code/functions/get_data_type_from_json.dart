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

List<AdminRoleGroupStruct>? getDataTypeFromJson(
  dynamic jsonData,
  String? listName,
) {
  if (jsonData == null || listName == null) {
    print('Invalid input: jsonData or listName is null.');
    return null;
  }

  try {
    // Check if jsonData is already a Map
    Map<String, dynamic> jsonMap;
    if (jsonData is String) {
      jsonMap = jsonDecode(jsonData);
    } else if (jsonData is Map<String, dynamic>) {
      jsonMap = jsonData;
    } else {
      print('Invalid jsonData type.');
      return null;
    }

    // Check if the listName exists in the map and is a List
    if (jsonMap.containsKey(listName) && jsonMap[listName] is List) {
      List<dynamic> rawData = jsonMap[listName] as List<dynamic>;

      // Convert List<dynamic> to List<AdminRoleGroupStruct>
      List<AdminRoleGroupStruct> data = rawData.map((item) {
        if (item is Map<String, dynamic>) {
          return AdminRoleGroupStruct.fromMap(item);
        } else {
          throw Exception('Invalid item type in the list.');
        }
      }).toList();

      print('dataFromJson: $data');
      return data;
    } else {
      print('List name not found or not a list.');
      return null;
    }
  } catch (e) {
    print('Error decoding JSON: $e');
    return null;
  }
}
