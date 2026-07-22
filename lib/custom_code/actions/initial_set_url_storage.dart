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

Future initialSetUrlStorage() async {
  // Add your function code here!
  List<UrlLinkStorageRecord?> queryUrl;

  queryUrl = await queryUrlLinkStorageRecordOnce();

  FFAppState().updateUrlStorageDataStruct(
    (e) => e
      ..urlLink = queryUrl!.map((e) => e!.urlLink).toList()
      ..urlName = queryUrl!.map((e) => e!.urlName).toList()
      ..urlToken = queryUrl!.map((e) => e!.urlToken).toList()
      ..urlLinkUat = queryUrl!.map((e) => e!.urlLinkUat).toList()
      ..urlTokenUat = queryUrl!.map((e) => e!.urlTokenUat).toList(),
  );
}
