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

import 'dart:io';
import 'dart:typed_data';
import 'package:file_saver/file_saver.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as p;
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

Future<String> downloadFileFromFilePath(String? filePath) async {
  // Add your function code here!

  // final file = File(filePath!);
  // final Uint8List bytes5544 = await file.readAsBytes();
  final String name = filePath!.split('/').last.split('.')[0];
  final String extension5544 = filePath!.split('/').last.split('.')[1];
  MimeType mimeTyp = MimeType.text;
  print(extension5544);
  if (extension5544 == 'docx' || extension5544 == 'doc') {
    mimeTyp = MimeType.microsoftWord;
  } else if (extension5544 == 'xlsx' || extension5544 == 'xls') {
    mimeTyp = MimeType.microsoftExcel;
  }

  print('file NaMe : ${name}');
  final res = await FileSaver.instance.saveAs(
    filePath: filePath!,
    name: name,
    ext: extension5544,
    mimeType: mimeTyp,
  );

  print('fileSaverOutput L ${res}');
  if ('${res}' != 'null') {
    String savedFileFolderPath = p.dirname(res!);
    final params = ShareParams(
      text: 'ไฟล์ดาวน์โหลดของคุณ',
      files: [XFile('${filePath!}')],
    );

    final result = await SharePlus.instance.share(params);

    if (result.status == ShareResultStatus.success) {
      print('Thank you for sharing the picture!');
    }
  }

  return '${res}';
}
