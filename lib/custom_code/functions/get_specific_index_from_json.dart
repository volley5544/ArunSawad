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

bool? getSpecificIndexFromJson(
  dynamic jsonData,
  String? menuName,
  String? profileLevel,
) {
  if (jsonData == null) {
    print('Invalid input: jsonData ');
    return false;
  }

  try {
    // Check if jsonData is already a Map
    Map<String, dynamic> jsonMap;
    if (jsonData is String) {
      // If jsonData is a string, decode it to a Map
      jsonMap = jsonDecode(jsonData);
    } else if (jsonData is Map<String, dynamic>) {
      // If jsonData is already a Map, use it directly
      jsonMap = jsonData;
    } else {
      print('Invalid jsonData type.');
      return false;
    }
    String? listMenuVisible = '';
    String? listMenuName = 'menuName';
    switch (profileLevel) {
      case 'HO':
        listMenuVisible = 'menuVisible';
        break;
      case 'สาขา':
        listMenuVisible = 'menuVisibleBranch';
        break;
      case 'เขต':
        listMenuVisible = 'menuVisibleArea';
        break;
      case 'ภาค':
        listMenuVisible = 'menuZone';
        break;
      default:
        listMenuVisible = 'menuVisible'; // Optional: Handle unexpected values
    }

    // Check if the listMenuVisible exists in the map and is a List
    if (jsonMap.containsKey(listMenuVisible) &&
        jsonMap[listMenuVisible] is List) {
      List<dynamic> rawData = jsonMap[listMenuVisible] as List<dynamic>;

      // Check if the listMenuName exists in the map and is a List
      if (listMenuName != null &&
          jsonMap.containsKey(listMenuName) &&
          jsonMap[listMenuName] is List) {
        List<dynamic> rawData2 = jsonMap[listMenuName] as List<dynamic>;

        // Convert List<dynamic> to List<bool>
        List<bool> data = rawData.map((item) => item == true).toList();
        //print('dataFromJson: $data');

        // Check for valid index and that menuName is present in rawData2
        if (rawData2.contains(menuName)) {
          int menuIndex = rawData2.indexOf(menuName);

          // Return the boolean value at the calculated index
          if (menuIndex >= 0 && menuIndex < data.length) {
            return data[menuIndex];
          } else {
            print('menuName index is out of range.');
            return false;
          }
        } else {
          print('Index or menuName is invalid.');
          return false;
        }
      } else {
        print('listMenuName not found or not a list.');
        return false;
      }
    } else {
      print('listMenuVisible not found or not a list.');
      return false;
    }
  } catch (e) {
    // Print error if JSON decoding fails
    print('Error decoding JSON: $e');
    return false;
  }
}
