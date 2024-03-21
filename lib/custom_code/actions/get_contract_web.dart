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

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getContractWeb() async {
  // Add your function code here!
  final response = await http.get(Uri.parse(
      'https://ld.swpfin.com/ssw_partner/add-lead-partner/thailand-post/po33511'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    final String contract = data['contract'];
    return contract;
  } else {
    throw Exception('Failed to load contract');
  }
}
