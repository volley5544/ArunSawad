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
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:mime/mime.dart';

Future<String?> convertBase64ToFFFiles(
    String? imageBase64, String? index, bool? isByFileType) async {
  // Add your function code here!
  String base64Output = imageBase64!.split(',')[1];

  if (isByFileType!) {
    Uint8List imageBytes = await compute(base64Decode, base64Output);

    final mimeType = lookupMimeType('', headerBytes: imageBytes);
    final fileExtension = extensionFromMime(mimeType!);

    print('MIME type: $mimeType');
    print('File extension: $fileExtension');

    if (imageBase64!.split(',')[0].contains('image')) {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/image${index!}.png';

      final file = File(filePath);
      await file.writeAsBytes(imageBytes);

      return filePath;
    } else if (imageBase64!.split(',')[0].contains('pdf')) {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/pdf${index!}.pdf';

      final file = File(filePath);
      await file.writeAsBytes(imageBytes);

      return filePath;
    } else {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/file${index!}.${fileExtension}';

      final file = File(filePath);
      await file.writeAsBytes(imageBytes);

      return filePath;
    }

    // Save the image file
  } else {
    Uint8List imageBytes = await compute(base64Decode, base64Output);

    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/image${index!}.png';

    // Save the image file
    final file = File(filePath);
    await file.writeAsBytes(imageBytes);

    return filePath;
  }
}
