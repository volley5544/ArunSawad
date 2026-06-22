// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/app_events/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<int> checkTotalFileSize(List<FFUploadedFile>? uploadedFiles) async {
  // Maximum allowed size in bytes (50 MB)
  const int maxSizeInBytes = 50 * 1024 * 1024;

  // If uploadedFiles is null or empty, return 0 (no size to check)
  if (uploadedFiles == null || uploadedFiles.isEmpty) {
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
  int totalSizeInMB = (totalSize / (1024 * 1024)).floor();

  // Print the result
  if (totalSize > maxSizeInBytes) {
    print("Total size exceeds limit: $totalSizeInMB MB");
  } else {
    print("Total size within limit: $totalSizeInMB MB");
  }

  return totalSizeInMB; // Return size in MB
}
