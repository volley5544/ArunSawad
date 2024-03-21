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

import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:typed_data';

Future capScene(
  BuildContext context,
  String? splashImgPath,
  String? splashDailyText,
) async {
  // Add your function code here!

  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  screenshotController
      .captureFromWidget(
          Container(
            height: 1920,
            width: 1270,
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
                //border: Border.all(color: Colors.blueAccent, width: 5.0),
                //color: Colors.redAccent,
                image: DecorationImage(
              image: NetworkImage(splashImgPath!),
              fit: BoxFit.fitWidth,
            )),
            child: Container(
              height: 150,
              width: 1000,
              padding: const EdgeInsets.only(top: 180, left: 5, right: 5),
              child: Center(
                child: Text(
                  splashDailyText!,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'FC Home Italic',
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ),
          ),
          delay: const Duration(seconds: 2))
      .then((capturedImage) {
    //return true;
    screenshotController
        .captureFromWidget(
            Container(
              height: 1920,
              width: 1270,
              padding: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                  //border: Border.all(color: Colors.blueAccent, width: 5.0),
                  //color: Colors.redAccent,
                  image: DecorationImage(
                image: NetworkImage(splashImgPath!),
                fit: BoxFit.fitWidth,
              )),
              child: Container(
                height: 150,
                width: 1000,
                padding: const EdgeInsets.only(top: 180, left: 5, right: 5),
                child: Center(
                  child: Text(
                    splashDailyText!,
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'FC Home Italic',
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
            ),
            delay: const Duration(seconds: 4))
        .then((capturedImage1) {
      final result1 = ImageGallerySaver.saveImage(
          Uint8List.fromList(capturedImage1),
          quality: 100,
          name: "ArunSawad Screenshot");
      print(result1);
      return true;
    });
  });
}
