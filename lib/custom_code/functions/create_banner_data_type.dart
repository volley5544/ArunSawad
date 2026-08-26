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

List<SawadBannerDataModelStruct>? createBannerDataType(
    ArunSawadImgBannerRecord? bannerDoc) {
  List<SawadBannerDataModelStruct> outputList = [];
  for (int i = 0; i < bannerDoc!.imgUrl.length; i++) {
    SawadBannerDataModelStruct bannerData = SawadBannerDataModelStruct(
        blurHash: bannerDoc.blurHash[i] ?? 'L8PQHWt700j@*0V[%2of00j?00WB',
        imgUrl: bannerDoc.imgUrl[i] ??
            'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/No_image_available.png?alt=media&token=3adb9366-1983-4d88-93f9-d0bd031005fc',
        includeSlash: bannerDoc.includeSlash[i] ?? false,
        index: bannerDoc.index[i] ?? i + 1,
        isHaveLink: bannerDoc.isHaveLink[i] ?? false,
        linkUrl: bannerDoc.linkUrl[i] ?? 'Hello World',
        openType: bannerDoc.openType[i] ?? 'launch_url',
        paramType: bannerDoc.paramType[i] ?? 'no',
        showingAll: bannerDoc.showingAll[i] ?? false,
        bannerCode: bannerDoc.bannerCode[i] ?? '000000001');

    outputList.add(bannerData);
  }

  outputList.sort((a, b) => a.index.compareTo(b.index));
  return outputList;
}
