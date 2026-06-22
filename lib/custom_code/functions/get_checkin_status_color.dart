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

Color getCheckinStatusColor(
  String? checkinTime,
  String? checkoutTime,
  String? date,
  String? employeeLevel,
  List<Color>? colorList,
  List<String>? holidayList,
  int? index,
  bool? isThisMonth,
  bool? isLeaving,
) {
  // Add your function code here!
  //DateFormat('EEEE').format(date!);
  //DateTime dt1 = DateTime.parse("2018-02-27 10:47:01");
  Color statusColor = Colors.transparent;

  DateTime formCheckinTime = DateTime.parse("$date 08:40");
  DateTime formCheckoutTime = DateTime.parse("$date 17:30");

  DateTime formCheckinTimeBranch = DateTime.parse("$date 08:40");
  DateTime formCheckoutTimeBranch = DateTime.parse("$date 16:30");

  DateTime formCheckinTimeBranchSat = DateTime.parse("$date 08:40");
  DateTime formCheckoutTimeBranchSat = DateTime.parse("$date 15:30");

  if (employeeLevel == 'HO') {
    if (DateFormat('EEEE').format(DateTime.parse(date!)) == 'Saturday' ||
        DateFormat('EEEE').format(DateTime.parse(date!)) == 'Sunday' ||
        holidayList!.contains(date) ||
        isLeaving!) {
      statusColor = colorList![0];
    } else {
      if (index == 0 &&
          checkinTime != '-' &&
          checkoutTime != '-' &&
          isThisMonth!) {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 8) {
          statusColor = colorList![3];
        } else if (timeIn.compareTo(formCheckinTime) > 0) {
          statusColor = colorList![4];
        } else if (timeOut.compareTo(formCheckoutTime) < 0) {
          statusColor = colorList![5];
        } else if (timeIn.compareTo(formCheckinTime) <= 0 &&
            timeOut.compareTo(formCheckoutTime) >= 0) {
          statusColor = colorList![6];
        } else {
          statusColor = colorList![2];
        }
      } else if (index == 0 && isThisMonth!) {
        statusColor = Colors.transparent;
      } else if (checkinTime == '-' && checkoutTime == '-') {
        statusColor = colorList![1];
      } else if (checkoutTime == '-' && checkinTime != '-') {
        statusColor = colorList![2];
      } else if (checkinTime != '-' && checkoutTime != '-') {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 8) {
          statusColor = colorList![3];
        } else if (timeIn.compareTo(formCheckinTime) > 0) {
          statusColor = colorList![4];
        } else if (timeOut.compareTo(formCheckoutTime) < 0) {
          statusColor = colorList![5];
        } else if (timeIn.compareTo(formCheckinTime) <= 0 &&
            timeOut.compareTo(formCheckoutTime) >= 0) {
          statusColor = colorList![6];
        } else {
          statusColor = colorList![2];
        }
      } else {
        statusColor = colorList![2];
      }
    }
  } else {
    if (DateFormat('EEEE').format(DateTime.parse(date!)) == 'Sunday' ||
        holidayList!.contains(date) ||
        isLeaving!) {
      statusColor = colorList![0];
    } else if (DateFormat('EEEE').format(DateTime.parse(date!)) == 'Saturday') {
      if (index == 0 &&
          checkinTime != '-' &&
          checkoutTime != '-' &&
          isThisMonth!) {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 6) {
          statusColor = colorList![3];
        } else if (timeIn.compareTo(formCheckinTimeBranchSat) > 0) {
          statusColor = colorList![4];
        } else if (timeOut.compareTo(formCheckoutTimeBranchSat) < 0) {
          statusColor = colorList![5];
        } else if (timeIn.compareTo(formCheckinTimeBranchSat) <= 0 &&
            timeOut.compareTo(formCheckoutTimeBranchSat) >= 0) {
          statusColor = colorList![6];
        } else {
          statusColor = colorList![2];
        }
      } else if (index == 0 && isThisMonth!) {
        statusColor = Colors.transparent;
      } else if (checkinTime == '-' && checkoutTime == '-') {
        statusColor = colorList![1];
      } else if (checkoutTime == '-' && checkinTime != '-') {
        statusColor = colorList![2];
      } else if (checkinTime != '-' && checkoutTime != '-') {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 6) {
          statusColor = colorList![3];
        } else if (timeIn.compareTo(formCheckinTimeBranchSat) > 0) {
          statusColor = colorList![4];
        } else if (timeOut.compareTo(formCheckoutTimeBranchSat) < 0) {
          statusColor = colorList![5];
        } else if (timeIn.compareTo(formCheckinTimeBranchSat) <= 0 &&
            timeOut.compareTo(formCheckoutTimeBranchSat) >= 0) {
          statusColor = colorList![6];
        } else {
          statusColor = colorList![2];
        }
      } else {
        statusColor = colorList![2];
      }
    } else {
      if (index == 0 &&
          checkinTime != '-' &&
          checkoutTime != '-' &&
          isThisMonth!) {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 7) {
          statusColor = colorList![3];
        } else if (timeIn.compareTo(formCheckinTimeBranch) > 0) {
          statusColor = colorList![4];
        } else if (timeOut.compareTo(formCheckoutTimeBranch) < 0) {
          statusColor = colorList![5];
        } else if (timeIn.compareTo(formCheckinTimeBranch) <= 0 &&
            timeOut.compareTo(formCheckoutTimeBranch) >= 0) {
          statusColor = colorList![6];
        } else {
          statusColor = colorList![2];
        }
      } else if (index == 0 && isThisMonth!) {
        statusColor = Colors.transparent;
      } else if (checkinTime == '-' && checkoutTime == '-') {
        statusColor = colorList![1];
      } else if (checkoutTime == '-' && checkinTime != '-') {
        statusColor = colorList![2];
      } else if (checkinTime != '-' && checkoutTime != '-') {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 7) {
          statusColor = colorList![3];
        } else if (timeIn.compareTo(formCheckinTimeBranch) > 0) {
          statusColor = colorList![4];
        } else if (timeOut.compareTo(formCheckoutTimeBranch) < 0) {
          statusColor = colorList![5];
        } else if (timeIn.compareTo(formCheckinTimeBranch) <= 0 &&
            timeOut.compareTo(formCheckoutTimeBranch) >= 0) {
          statusColor = colorList![6];
        } else {
          statusColor = colorList![2];
        }
      } else {
        statusColor = colorList![2];
      }
    }
  }

  return statusColor;
}
