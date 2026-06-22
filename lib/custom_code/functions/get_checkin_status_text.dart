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

String getCheckinStatusText(
  String? checkinTime,
  String? checkoutTime,
  String? date,
  String? employeeLevel,
  List<String>? holidayList,
  int? index,
  bool? isThisMonth,
  List<String>? holidayNameList,
  bool? isLeaving,
  String? leaveType,
) {
  // Add your function code here!
  //DateFormat('EEEE').format(date!);
  //DateTime dt1 = DateTime.parse("2018-02-27 10:47:01");
  String statusText = 'Status';
  int holidayIndex = 0;

  DateTime formCheckinTime = DateTime.parse("$date 08:40");
  DateTime formCheckoutTime = DateTime.parse("$date 17:30");

  DateTime formCheckinTimeBranch = DateTime.parse("$date 08:40");
  DateTime formCheckoutTimeBranch = DateTime.parse("$date 16:30");

  DateTime formCheckinTimeBranchSat = DateTime.parse("$date 08:40");
  DateTime formCheckoutTimeBranchSat = DateTime.parse("$date 15:30");

  // for(int i = 0; i < holidayList!.length; i++){
  //       if(holidayList[i] == date){
  //         isHoliday = true;
  //         break;
  //       }
  //     }

  if (employeeLevel == 'HO') {
    if (DateFormat('EEEE').format(DateTime.parse(date!)) == 'Saturday' ||
        DateFormat('EEEE').format(DateTime.parse(date!)) == 'Sunday' ||
        holidayList!.contains(date) ||
        isLeaving!) {
      statusText = 'วันหยุด';
      if (holidayList!.contains(date)) {
        holidayIndex = holidayList.indexOf(date);
        statusText = holidayNameList![holidayIndex];
      } else if (isLeaving!) {
        statusText = leaveType!;
      }
    } else {
      if (index == 0 &&
          checkinTime != '-' &&
          checkoutTime != '-' &&
          isThisMonth!) {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 8) {
          statusText = 'เข้างานไม่ครบจำนวน';
        } else if (timeIn.compareTo(formCheckinTime) > 0) {
          statusText = 'สาย';
        } else if (timeOut.compareTo(formCheckoutTime) < 0) {
          statusText = 'ออกก่อนเวลา';
        } else if (timeIn.compareTo(formCheckinTime) <= 0 &&
            timeOut.compareTo(formCheckoutTime) >= 0) {
          statusText = 'ปกติ';
        } else {
          statusText = 'งง 2';
        }
      } else if (index == 0 && isThisMonth!) {
        statusText = 'รอลงเวลา';
      } else if (checkinTime == '-' && checkoutTime == '-') {
        statusText = 'ขาดงาน';
      } else if (checkoutTime == '-' && checkinTime != '-') {
        statusText = 'ลงเวลาไม่ครบ';
      } else if (checkinTime != '-' && checkoutTime != '-') {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 8) {
          statusText = 'เข้างานไม่ครบจำนวน';
        } else if (timeIn.compareTo(formCheckinTime) > 0) {
          statusText = 'สาย';
        } else if (timeOut.compareTo(formCheckoutTime) < 0) {
          statusText = 'ออกก่อนเวลา';
        } else if (timeIn.compareTo(formCheckinTime) <= 0 &&
            timeOut.compareTo(formCheckoutTime) >= 0) {
          statusText = 'ปกติ';
        } else {
          statusText = 'งง 2';
        }
      } else {
        statusText = 'งง';
      }
    }
  } else {
    if (DateFormat('EEEE').format(DateTime.parse(date!)) == 'Sunday' ||
        holidayList!.contains(date) ||
        isLeaving!) {
      statusText = 'วันหยุด';

      if (holidayList!.contains(date)) {
        holidayIndex = holidayList.indexOf(date);
        statusText = holidayNameList![holidayIndex];
      } else if (isLeaving!) {
        statusText = leaveType!;
      }
    } else if (DateFormat('EEEE').format(DateTime.parse(date!)) == 'Saturday') {
      if (index == 0 &&
          checkinTime != '-' &&
          checkoutTime != '-' &&
          isThisMonth!) {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 6) {
          statusText = 'เข้างานไม่ครบจำนวน';
        } else if (timeIn.compareTo(formCheckinTimeBranchSat) > 0) {
          statusText = 'สาย';
        } else if (timeOut.compareTo(formCheckoutTimeBranchSat) < 0) {
          statusText = 'ออกก่อนเวลา';
        } else if (timeIn.compareTo(formCheckinTimeBranchSat) <= 0 &&
            timeOut.compareTo(formCheckoutTimeBranchSat) >= 0) {
          statusText = 'ปกติ';
        } else {
          statusText = 'งง 2';
        }
      } else if (index == 0 && isThisMonth!) {
        statusText = 'รอลงเวลา';
      } else if (checkinTime == '-' && checkoutTime == '-') {
        statusText = 'ขาดงาน';
      } else if (checkoutTime == '-' && checkinTime != '-') {
        statusText = 'ลงเวลาไม่ครบ';
      } else if (checkinTime != '-' && checkoutTime != '-') {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 6) {
          statusText = 'เข้างานไม่ครบจำนวน';
        } else if (timeIn.compareTo(formCheckinTimeBranchSat) > 0) {
          statusText = 'สาย';
        } else if (timeOut.compareTo(formCheckoutTimeBranchSat) < 0) {
          statusText = 'ออกก่อนเวลา';
        } else if (timeIn.compareTo(formCheckinTimeBranchSat) <= 0 &&
            timeOut.compareTo(formCheckoutTimeBranchSat) >= 0) {
          statusText = 'ปกติ';
        } else {
          statusText = 'งง 2';
        }
      } else {
        statusText = 'งง';
      }
    } else {
      if (index == 0 &&
          checkinTime != '-' &&
          checkoutTime != '-' &&
          isThisMonth!) {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 7) {
          statusText = 'เข้างานไม่ครบจำนวน';
        } else if (timeIn.compareTo(formCheckinTimeBranch) > 0) {
          statusText = 'สาย';
        } else if (timeOut.compareTo(formCheckoutTimeBranch) < 0) {
          statusText = 'ออกก่อนเวลา';
        } else if (timeIn.compareTo(formCheckinTimeBranch) <= 0 &&
            timeOut.compareTo(formCheckoutTimeBranch) >= 0) {
          statusText = 'ปกติ';
        } else {
          statusText = 'งง 2';
        }
      } else if (index == 0 && isThisMonth!) {
        statusText = 'รอลงเวลา';
      } else if (checkinTime == '-' && checkoutTime == '-') {
        statusText = 'ขาดงาน';
      } else if (checkoutTime == '-' && checkinTime != '-') {
        statusText = 'ลงเวลาไม่ครบ';
      } else if (checkinTime != '-' && checkoutTime != '-') {
        DateTime timeIn = DateTime.parse("$date $checkinTime");
        DateTime timeOut = DateTime.parse("$date $checkoutTime");
        if (timeOut.difference(timeIn).inHours < 7) {
          statusText = 'เข้างานไม่ครบจำนวน';
        } else if (timeIn.compareTo(formCheckinTimeBranch) > 0) {
          statusText = 'สาย';
        } else if (timeOut.compareTo(formCheckoutTimeBranch) < 0) {
          statusText = 'ออกก่อนเวลา';
        } else if (timeIn.compareTo(formCheckinTimeBranch) <= 0 &&
            timeOut.compareTo(formCheckoutTimeBranch) >= 0) {
          statusText = 'ปกติ';
        } else {
          statusText = 'งง 2';
        }
      } else {
        statusText = 'งง';
      }
    }
  }

  return statusText;
}
