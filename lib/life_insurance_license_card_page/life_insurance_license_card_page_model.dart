import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

class LifeInsuranceLicenseCardPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Signature widget.
  late SignatureController signatureController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    signatureController = SignatureController(
      penStrokeWidth: 2.0,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
    );
  }

  void dispose() {
    signatureController.dispose();
  }

  /// Additional helper methods are added here.

}
