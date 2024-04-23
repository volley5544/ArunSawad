import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/camera_button_widget.dart';
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
  // Model for cameraButton component.
  late CameraButtonModel cameraButtonModel;
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
  TextEditingController? coordinateInputTextController1;
  String? Function(BuildContext, String?)?
      coordinateInputTextController1Validator;
  // State field(s) for idInput widget.
  FocusNode? idInputFocusNode1;
  TextEditingController? idInputTextController1;
  String? Function(BuildContext, String?)? idInputTextController1Validator;
  // State field(s) for contnoInput widget.
  FocusNode? contnoInputFocusNode;
  TextEditingController? contnoInputTextController;
  String? Function(BuildContext, String?)? contnoInputTextControllerValidator;
  // State field(s) for nameInput widget.
  FocusNode? nameInputFocusNode1;
  TextEditingController? nameInputTextController1;
  String? Function(BuildContext, String?)? nameInputTextController1Validator;
  // State field(s) for remarkInput widget.
  FocusNode? remarkInputFocusNode;
  TextEditingController? remarkInputTextController;
  String? Function(BuildContext, String?)? remarkInputTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for coordinateInput widget.
  FocusNode? coordinateInputFocusNode2;
  TextEditingController? coordinateInputTextController2;
  String? Function(BuildContext, String?)?
      coordinateInputTextController2Validator;
  // State field(s) for idInput widget.
  FocusNode? idInputFocusNode2;
  TextEditingController? idInputTextController2;
  String? Function(BuildContext, String?)? idInputTextController2Validator;
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
  TextEditingController? nameInputTextController2;
  String? Function(BuildContext, String?)? nameInputTextController2Validator;
  // State field(s) for remarkInput33 widget.
  FocusNode? remarkInput33FocusNode;
  TextEditingController? remarkInput33TextController;
  String? Function(BuildContext, String?)? remarkInput33TextControllerValidator;
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

  @override
  void initState(BuildContext context) {
    cameraButtonModel = createModel(context, () => CameraButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cameraButtonModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    coordinateInputFocusNode1?.dispose();
    coordinateInputTextController1?.dispose();

    idInputFocusNode1?.dispose();
    idInputTextController1?.dispose();

    contnoInputFocusNode?.dispose();
    contnoInputTextController?.dispose();

    nameInputFocusNode1?.dispose();
    nameInputTextController1?.dispose();

    remarkInputFocusNode?.dispose();
    remarkInputTextController?.dispose();

    textFieldFocusNode3?.dispose();
    textController8?.dispose();

    coordinateInputFocusNode2?.dispose();
    coordinateInputTextController2?.dispose();

    idInputFocusNode2?.dispose();
    idInputTextController2?.dispose();

    textFieldFocusNode4?.dispose();
    textController11?.dispose();

    nameInputFocusNode2?.dispose();
    nameInputTextController2?.dispose();

    remarkInput33FocusNode?.dispose();
    remarkInput33TextController?.dispose();

    textFieldFocusNode5?.dispose();
    textController14?.dispose();
  }
}
