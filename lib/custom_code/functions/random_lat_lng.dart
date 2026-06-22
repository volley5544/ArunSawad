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

LatLng? randomLatLng(
  double? latitude,
  double? longitude,
  String? platfrom,
) {
  double radius = 30;
  // Calculate latitude range
  double latitudeRange = radius / 111000;

  // Calculate longitude range
  double longitudeRange =
      radius / (111000 * math.cos(latitude! * math.pi / 180));

  // Generate random latitude
  double randomLatitude = latitude! +
      math.Random().nextDouble() * 2 * latitudeRange -
      latitudeRange;

  // Generate random longitude
  double randomLongitude = longitude! +
      math.Random().nextDouble() * 2 * longitudeRange -
      longitudeRange;

  if (platfrom == 'Android') {
    return LatLng(double.parse(randomLatitude.toStringAsFixed(6)),
        double.parse(randomLongitude.toStringAsFixed(6)));
  } else {
    return LatLng(double.parse(randomLatitude.toStringAsFixed(15)),
        double.parse(randomLongitude.toStringAsFixed(15)));
  }
}
