// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:string_similarity/string_similarity.dart';

Future<String> findMostSimilarString(
  String? input,
  List<String>? dataList,
) async {
  // Ensure input and dataList are not null
  if (input == null || dataList == null || dataList.isEmpty) {
    return ''; // or throw an exception, based on your needs
  }

  // Create an instance of StringSimilarity and find the best match
  var bestMatch = StringSimilarity.findBestMatch(input, dataList);

  // Check if there is a best match and return the target string
  return bestMatch.bestMatch.target ?? ''; // Return empty string if null
}
