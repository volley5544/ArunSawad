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

Color leadChannelAmountCardColor(
  String? leadChannelName,
  List<Color>? firebaseColor,
) {
  // Add your function code here!
  Color cardChannelColor;

  if (leadChannelName == 'Lead Survey') {
    cardChannelColor = firebaseColor![0];
  } else if (leadChannelName == 'Lead Telesale') {
    cardChannelColor = firebaseColor![1];
  } else if (leadChannelName == 'Lead Agent') {
    cardChannelColor = firebaseColor![2];
  } else if (leadChannelName == 'Lead GSB') {
    cardChannelColor = firebaseColor![3];
  } else {
    cardChannelColor = firebaseColor![4];
  }

  return cardChannelColor;
}
