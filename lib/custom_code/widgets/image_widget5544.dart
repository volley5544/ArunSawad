// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../flutter_flow/flutter_flow_expanded_image_view.dart';

class ImageWidget5544 extends StatefulWidget {
  const ImageWidget5544({
    super.key,
    this.width,
    this.height,
    this.imageFilePath1,
  });

  final double? width;
  final double? height;
  final String? imageFilePath1;

  @override
  State<ImageWidget5544> createState() => _ImageWidget5544State();
}

class _ImageWidget5544State extends State<ImageWidget5544> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: FlutterFlowExpandedImageView(
                image: Image.file(
                  File(imageFilePath1!),
                  fit: BoxFit.contain,
                ),
                allowRotation: false,
                tag: Image.file(File(imageFilePath1!)),
                useHeroAnimation: true,
              ),
            ),
          );
        },
        child: Hero(
          tag: Image.file(File(imageFilePath1!)),
          transitionOnUserGestures: true,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.file(
              File(imageFilePath1!),
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
