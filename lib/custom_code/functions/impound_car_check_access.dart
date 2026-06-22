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

bool? impoundCarCheckAccess(
  String? profileLevel,
  String? pageName,
  List<String>? roleAccess,
  String? menuName,
  String? step,
  String? actionName,
) {
  if (pageName! == 'select action') {
    if (profileLevel! == 'สาขา' ||
        profileLevel! == 'เขต' ||
        profileLevel! == 'ภาค') {
      return true;
    } else if (roleAccess!.contains(menuName!)) {
      return true;
    }
  } else {
    if (step! == 'step1') {
      if (profileLevel! == 'สาขา') {
        return true;
      } else {
        return false;
      }
    } else if (step! == 'step2') {
      if (profileLevel! == 'สาขา') {
        return true;
      } else if (false) {
      } else {
        return false;
      }
    } else if (step! == 'step3') {
      if (profileLevel! == 'เขต' || profileLevel! == 'ภาค') {
        return true;
      } else {
        return false;
      }
    } else if (step! == 'step4') {
    } else {
      return false;
    }
  }
}
