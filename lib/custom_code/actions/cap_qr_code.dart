// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/app_events/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'dart:typed_data';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:barcode_widget/barcode_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:permission_handler/permission_handler.dart';

Future capQrCode(
  BuildContext context,
  String? suffix,
  String? ref1,
  String? ref2,
  String? amount,
  String? taxId,
  String? contno,
) async {
  // Add your function code here!
  try {
    ScreenshotController screenshotController = ScreenshotController();

    await screenshotController
        .captureFromWidget(
      Container(
        width: 300,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Contract number above QR
            Text(
              contno ?? '',
              style: const TextStyle(
                fontFamily: 'Noto Sans Thai',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            // QR Code
            BarcodeWidget(
              data: functions.genQRCodePayment(
                  suffix!, ref1!, ref2!, amount!, taxId!)!,
              barcode: Barcode.qrCode(),
              width: 260,
              height: 260,
              color: Colors.black,
              backgroundColor: Colors.white,
              errorBuilder: (_context, _error) => const SizedBox(
                width: 260,
                height: 260,
              ),
              drawText: false,
            ),
            const SizedBox(height: 16),
            // Label below QR
            Text(
              '|${taxId} ${ref1} ${ref2} 0',
              style: const TextStyle(
                fontFamily: 'Noto Sans Thai',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      delay: const Duration(seconds: 1),
    )
        .then((capImage) async {
      final DateTime currentDateTime = DateTime.now();
      await ImageGallerySaverPlus.saveImage(
        Uint8List.fromList(capImage),
        quality: 100,
        name: '$currentDateTime',
      );
    });

    return 'บันทึกภาพ QR Code ลง Gallery สำเร็จ';
  } catch (e) {
    return e.toString();
  }
}
