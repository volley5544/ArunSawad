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

String generateBranchViewMapLink(String? recordID) {
  // http://27.254.207.150:90/vloan_remark.html?id=7E72LN4914M3
  // https://pt.swpfin.com/bv/branchview_route.html?start=${branchLocation!}&?end=${coordinate!}&?branch=${branch!}&?id=${recordID}

  // return '<a target="_blank" href="http://27.254.207.150:90/vloan_remark.html?id=${recordID!}" title="${remark!}">คลิกที่นี่</a>';

  // String url = '';
  // int imgAmount = imgUrl!.length;
  // if (imgUrl!.length > 0) {
  //   for (int i = 0; i < imgUrl!.length; i++) {
  //     if (i == imgUrl!.length - 1) {
  //       url = url + imgUrl![i];
  //     } else {
  //       url = url + imgUrl![i] + ',';
  //     }
  //   }
  // } else {
  //   url = 'no_img';
  // }

  // String result = url.replaceAll("&", "volley5544");
  //start=${branchLocation!}&end=${coordinate!}&branch=${branch!}&
  //title="${remark!}"

  return '<a target="_blank" href="https://pt.swpfin.com/bv/branchview_route.php?id=${recordID!}">คลิกที่นี่</a>';
}
