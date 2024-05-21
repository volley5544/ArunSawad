import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'forgot_password_page_widget.dart' show ForgotPasswordPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ForgotPasswordPageModel
    extends FlutterFlowModel<ForgotPasswordPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for usernameInput widget.
  FocusNode? usernameInputFocusNode;
  TextEditingController? usernameInputTextController;
  String? Function(BuildContext, String?)? usernameInputTextControllerValidator;
  // State field(s) for id4DigitInput widget.
  FocusNode? id4DigitInputFocusNode;
  TextEditingController? id4DigitInputTextController;
  String? Function(BuildContext, String?)? id4DigitInputTextControllerValidator;
  // State field(s) for newPasswordInput widget.
  FocusNode? newPasswordInputFocusNode;
  TextEditingController? newPasswordInputTextController;
  String? Function(BuildContext, String?)?
      newPasswordInputTextControllerValidator;
  // State field(s) for confirmPasswordInput widget.
  FocusNode? confirmPasswordInputFocusNode;
  TextEditingController? confirmPasswordInputTextController;
  String? Function(BuildContext, String?)?
      confirmPasswordInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    usernameInputFocusNode?.dispose();
    usernameInputTextController?.dispose();

    id4DigitInputFocusNode?.dispose();
    id4DigitInputTextController?.dispose();

    newPasswordInputFocusNode?.dispose();
    newPasswordInputTextController?.dispose();

    confirmPasswordInputFocusNode?.dispose();
    confirmPasswordInputTextController?.dispose();
  }
}
