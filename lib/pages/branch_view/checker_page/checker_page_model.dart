import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'checker_page_widget.dart' show CheckerPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CheckerPageModel extends FlutterFlowModel<CheckerPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - a8] action in CheckerPage widget.
  bool? checkLatLngBVChecker;
  // Stores action output result for [Backend Call - Create Document] action in CheckerPage widget.
  UserLogRecord? createdUserLogBVChecker;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for coordinateInput widget.
  FocusNode? coordinateInputFocusNode1;
  TextEditingController? coordinateInputController1;
  String? Function(BuildContext, String?)? coordinateInputController1Validator;
  // State field(s) for idInput widget.
  FocusNode? idInputFocusNode1;
  TextEditingController? idInputController1;
  String? Function(BuildContext, String?)? idInputController1Validator;
  // State field(s) for contnoInput widget.
  FocusNode? contnoInputFocusNode;
  TextEditingController? contnoInputController;
  String? Function(BuildContext, String?)? contnoInputControllerValidator;
  // State field(s) for nameInput widget.
  FocusNode? nameInputFocusNode1;
  TextEditingController? nameInputController1;
  String? Function(BuildContext, String?)? nameInputController1Validator;
  // State field(s) for remarkInput widget.
  FocusNode? remarkInputFocusNode;
  TextEditingController? remarkInputController;
  String? Function(BuildContext, String?)? remarkInputControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for coordinateInput widget.
  FocusNode? coordinateInputFocusNode2;
  TextEditingController? coordinateInputController2;
  String? Function(BuildContext, String?)? coordinateInputController2Validator;
  // State field(s) for idInput widget.
  FocusNode? idInputFocusNode2;
  TextEditingController? idInputController2;
  String? Function(BuildContext, String?)? idInputController2Validator;
  // Stores action output result for [Backend Call - API (getVloanContractAPI)] action in Button widget.
  ApiCallResponse? getVloanContract;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController11;
  String? Function(BuildContext, String?)? textController11Validator;
  // State field(s) for ContNoDropDown widget.
  String? contNoDropDownValue;
  FormFieldController<String>? contNoDropDownValueController;
  // State field(s) for nameInput widget.
  FocusNode? nameInputFocusNode2;
  TextEditingController? nameInputController2;
  String? Function(BuildContext, String?)? nameInputController2Validator;
  // State field(s) for remarkInput33 widget.
  FocusNode? remarkInput33FocusNode;
  TextEditingController? remarkInput33Controller;
  String? Function(BuildContext, String?)? remarkInput33ControllerValidator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController14;
  String? Function(BuildContext, String?)? textController14Validator;
  // Stores action output result for [Custom Action - a8] action in Button widget.
  bool? checkGPSBeforeSave;
  // Stores action output result for [Backend Call - API (ChangeLocationAPI)] action in Button widget.
  ApiCallResponse? getUserBranchLocation;
  // Stores action output result for [Backend Call - API (CheckerAPI )] action in Button widget.
  ApiCallResponse? checkerAPISubmit;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FileUploadRecord? saveImgToFirebase;
  // Stores action output result for [Backend Call - API (remarkVLoneAPI)] action in Button widget.
  ApiCallResponse? remarkVLoneOutput;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    coordinateInputFocusNode1?.dispose();
    coordinateInputController1?.dispose();

    idInputFocusNode1?.dispose();
    idInputController1?.dispose();

    contnoInputFocusNode?.dispose();
    contnoInputController?.dispose();

    nameInputFocusNode1?.dispose();
    nameInputController1?.dispose();

    remarkInputFocusNode?.dispose();
    remarkInputController?.dispose();

    textFieldFocusNode3?.dispose();
    textController8?.dispose();

    coordinateInputFocusNode2?.dispose();
    coordinateInputController2?.dispose();

    idInputFocusNode2?.dispose();
    idInputController2?.dispose();

    textFieldFocusNode4?.dispose();
    textController11?.dispose();

    nameInputFocusNode2?.dispose();
    nameInputController2?.dispose();

    remarkInput33FocusNode?.dispose();
    remarkInput33Controller?.dispose();

    textFieldFocusNode5?.dispose();
    textController14?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
