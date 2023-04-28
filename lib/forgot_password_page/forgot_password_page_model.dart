import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for usernameInput widget.
  TextEditingController? usernameInputController;
  String? Function(BuildContext, String?)? usernameInputControllerValidator;
  // State field(s) for id4DigitInput widget.
  TextEditingController? id4DigitInputController;
  String? Function(BuildContext, String?)? id4DigitInputControllerValidator;
  // State field(s) for newPasswordInput widget.
  TextEditingController? newPasswordInputController;
  String? Function(BuildContext, String?)? newPasswordInputControllerValidator;
  // State field(s) for confirmPasswordInput widget.
  TextEditingController? confirmPasswordInputController;
  String? Function(BuildContext, String?)?
      confirmPasswordInputControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController1?.dispose();
    usernameInputController?.dispose();
    id4DigitInputController?.dispose();
    newPasswordInputController?.dispose();
    confirmPasswordInputController?.dispose();
  }

  /// Additional helper methods are added here.

}
