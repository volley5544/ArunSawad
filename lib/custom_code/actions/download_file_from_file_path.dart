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
    if (Platform.isAndroid) {
      print('Running on Android');
      String savedFileFolderPath = p.dirname(res!);
      //final result = await OpenFile.open(savedFileFolderPath);
      //print(result.message);

      final uri = Uri.parse("file://$savedFileFolderPath");

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        print("Could not open the Downloads folder");
      }
    } else if (Platform.isIOS) {
      print('Running on iOS');
      await Share.shareXFiles([XFile(res!)], text: 'ไฟล์ดาวน์โหลดของคุณ');
    }
  }

  return '${res}';
}
