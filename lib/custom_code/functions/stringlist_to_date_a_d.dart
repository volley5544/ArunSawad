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

List<DateTime>? stringlistToDateAD(List<String>? bcDateStrings) {
  List<DateTime> adDateTimes = [];

  for (String bcDateString in bcDateStrings!) {
    // Extract the year, month, and day components from the B.E. date string
    List<String> components = bcDateString!.split('-');
    int year = int.parse(components[0]);
    int month = int.parse(components[1]);
    int day = int.parse(components[2]);

    // Convert from B.E. to A.D. by subtracting 543 years
    year = year - 543;
    // Create a DateTime object using the A.D. components
    DateTime adDateTime = DateTime(year, month, day);

    adDateTimes.add(adDateTime);
  }

  return adDateTimes;
}
