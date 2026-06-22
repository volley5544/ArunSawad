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

String showNumberWithCommaWithDot(String? number) {
  // Add your function code here!
  List<String> numberSplit = number!.split('.');
  // Check if the input is null or empty

  double? parsedNumber = 0.00;
  if (number.contains('.')) {
    if (numberSplit[1].length > 1) {
      parsedNumber = double.tryParse(
          '${numberSplit[0]}.${numberSplit[1][0]}${numberSplit[1][1]}');
    } else {
      parsedNumber = double.tryParse('${numberSplit[0]}.${numberSplit[1]}0');
    }
  } else {
    parsedNumber = double.tryParse(number + '.00');
  }

  // Parse the input string to a double

  // Check if parsing was successful

  // Format the double as a string with two decimal places
  if (parsedNumber != null) {
    // Format the number with two decimal places
    String formattedNumber = parsedNumber.toStringAsFixed(2);

    // Use regular expression to add commas
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]},';

    // Format the number with commas and print
    String result = formattedNumber.replaceAllMapped(reg, mathFunc);
    return (result!);
  } else {
    return ("0.00");
  }
}
