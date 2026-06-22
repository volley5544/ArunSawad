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

List<String>? createLeadCustomerList(
  List<String>? leadChannelList,
  List<String>? leadTeleCustomerList,
  List<String>? leadSystemList,
  List<String>? leadManagementCustomerList,
) {
  List<String> outputList = [];
  int leadTeleListIndex = 0;
  int leadManagementListIndex = 0;

  for (int i = 0; i < leadChannelList!.length; i++) {
    if (leadChannelList![i] == 'Lead Telesale') {
      if (leadSystemList![i] == 'Lead_Telesale') {
        outputList.add(leadTeleCustomerList![leadTeleListIndex]);
        leadTeleListIndex++;
      } else {
        outputList.add(leadManagementCustomerList![leadManagementListIndex]);
        leadManagementListIndex++;
      }
    } else {
      outputList.add('-');
    }
  }

  return outputList;
}
