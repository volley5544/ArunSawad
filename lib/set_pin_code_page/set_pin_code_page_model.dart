import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetPinCodePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Custom Action - a1] action in Button widget.
  bool? checkDeviceLocationBeforeSetPin;
  // Stores action output result for [Custom Action - a2] action in Button widget.
  bool? checkDeviceLocPerBeforeSetPin;
  // Stores action output result for [Custom Action - a8] action in Button widget.
  bool? checkLatLngBeforeSetPin;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserLogRecord? createdUserLogSetPin;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  void dispose() {
    pinCodeController?.dispose();
  }

  /// Additional helper methods are added here.

}
