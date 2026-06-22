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

double? checkTotalFileSizeMB(List<FFUploadedFile>? uploadedFiles) {
  const int maxSizeInBytes = 50 * 1024 * 1024;

  // If uploadedFiles is null or empty, return 0 (no size to check)
  if (uploadedFiles == null) {
    print("No files provided.");
    return 0; // Return 0 MB
  }

  int totalSize = 0;

  // Iterate through the list and calculate the total size
  for (FFUploadedFile file in uploadedFiles) {
    if (file.bytes != null) {
      totalSize += file.bytes!.length; // Add file size to the total
    }
  }

  // Convert total size to MB
  double totalSizeInMB = totalSize / (1024 * 1024); // Get size in MB
  double formattedSize = double.parse(totalSizeInMB.toStringAsFixed(2));

  // Print the result
  if (totalSize > maxSizeInBytes) {
    print("Total size exceeds limit: $totalSizeInMB MB");
  } else {
    print("Total size within limit: $totalSizeInMB MB");
  }

  return formattedSize; // Return size in MB
}
