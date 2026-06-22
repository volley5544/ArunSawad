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

String getVehicleUsage(String? useType) {
  // Add your function code here!
  String vehicleUsage = '';

  if (useType! == '110รถยนต์นั่ง') {
    vehicleUsage = '110';
  }
  if (useType == '210รถยนต์โดยสาร') {
    vehicleUsage = '210';
  }
  if (useType == '320รถยนต์บรรทุก') {
    vehicleUsage = '320';
  }

  return vehicleUsage;
}
