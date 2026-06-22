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

String? openGoogleMapWithRoute(List<LatLng>? locations) {
  if (locations == null || locations.isEmpty) return null;

  if (locations.length == 1) {
    // Handle single location case
    LatLng singleLocation = locations.first;
    String url =
        'https://www.google.com/maps/search/?api=1&query=${singleLocation.latitude},${singleLocation.longitude}';

    // Print the URL for debugging
    print('Google Maps URL (Single Location): $url');

    return url;
  }

  // Extract origin, destination, and waypoints for multiple locations
  LatLng origin = locations.first;
  LatLng destination = locations.last;
  String waypoints = locations
      .sublist(1, locations.length - 1)
      .map((loc) => '${loc.latitude},${loc.longitude}')
      .join('|');

  // Construct the Google Maps URL
  String url =
      'https://www.google.com/maps/dir/?api=1&origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&waypoints=$waypoints&travelmode=driving';

  // Print the URL for debugging
  print('Google Maps URL (Route): $url');

  return url;
}
