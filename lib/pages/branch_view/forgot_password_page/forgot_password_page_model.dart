import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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
  TextEditingController? usernameInputController;
  String? Function(BuildContext, String?)? usernameInputControllerValidator;
  // State field(s) for id4DigitInput widget.
  FocusNode? id4DigitInputFocusNode;
  TextEditingController? id4DigitInputController;
  String? Function(BuildContext, String?)? id4DigitInputControllerValidator;
  // State field(s) for newPasswordInput widget.
  FocusNode? newPasswordInputFocusNode;
  TextEditingController? newPasswordInputController;
  String? Function(BuildContext, String?)? newPasswordInputControllerValidator;
  // State field(s) for confirmPasswordInput widget.
  FocusNode? confirmPasswordInputFocusNode;
  TextEditingController? confirmPasswordInputController;
  String? Function(BuildContext, String?)?
      confirmPasswordInputControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    usernameInputFocusNode?.dispose();
    usernameInputController?.dispose();

    id4DigitInputFocusNode?.dispose();
    id4DigitInputController?.dispose();

    newPasswordInputFocusNode?.dispose();
    newPasswordInputController?.dispose();

    confirmPasswordInputFocusNode?.dispose();
    confirmPasswordInputController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
