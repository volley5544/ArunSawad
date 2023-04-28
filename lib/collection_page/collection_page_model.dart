import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/loading_scene_widget.dart';
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CollectionPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - a8] action in CollectionPage widget.
  bool? checkLatLngBVCollection;
  // Stores action output result for [Backend Call - Create Document] action in CollectionPage widget.
  UserLogRecord? createdUserLogBVCollection;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for coordinateInput widget.
  TextEditingController? coordinateInputController;
  String? Function(BuildContext, String?)? coordinateInputControllerValidator;
  // State field(s) for idInput widget.
  TextEditingController? idInputController;
  String? Function(BuildContext, String?)? idInputControllerValidator;
  // Stores action output result for [Backend Call - API (getVloanContractAPI)] action in Button widget.
  ApiCallResponse? getVloanContract;
  // State field(s) for TextField widget.
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for ContNoDropDown widget.
  String? contNoDropDownValue;
  FormFieldController<String>? contNoDropDownValueController;
  // State field(s) for nameInput widget.
  TextEditingController? nameInputController;
  String? Function(BuildContext, String?)? nameInputControllerValidator;
  // State field(s) for remarkInput widget.
  TextEditingController? remarkInputController;
  String? Function(BuildContext, String?)? remarkInputControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for coordinateTimesheet widget.
  TextEditingController? coordinateTimesheetController;
  String? Function(BuildContext, String?)?
      coordinateTimesheetControllerValidator;
  // State field(s) for idTimesheet widget.
  TextEditingController? idTimesheetController;
  String? Function(BuildContext, String?)? idTimesheetControllerValidator;
  // State field(s) for contnoTimesheet widget.
  TextEditingController? contnoTimesheetController;
  String? Function(BuildContext, String?)? contnoTimesheetControllerValidator;
  // State field(s) for nameTimesheet widget.
  TextEditingController? nameTimesheetController;
  String? Function(BuildContext, String?)? nameTimesheetControllerValidator;
  // State field(s) for remarkTimesheet widget.
  TextEditingController? remarkTimesheetController;
  String? Function(BuildContext, String?)? remarkTimesheetControllerValidator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for TextField widget.
  TextEditingController? textController14;
  String? Function(BuildContext, String?)? textController14Validator;
  // Stores action output result for [Custom Action - a8] action in Button widget.
  bool? checkGPSBeforeSave;
  // Stores action output result for [Backend Call - API (CollectionAPI)] action in Button widget.
  ApiCallResponse? collectionAPISubmit;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FileUploadRecord? saveImgToFirebase;
  // Stores action output result for [Backend Call - API (remarkVLoneAPI)] action in Button widget.
  ApiCallResponse? remarkVLoneOutput;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    coordinateInputController?.dispose();
    idInputController?.dispose();
    textController5?.dispose();
    nameInputController?.dispose();
    remarkInputController?.dispose();
    textController8?.dispose();
    coordinateTimesheetController?.dispose();
    idTimesheetController?.dispose();
    contnoTimesheetController?.dispose();
    nameTimesheetController?.dispose();
    remarkTimesheetController?.dispose();
    textController14?.dispose();
  }

  /// Additional helper methods are added here.

}
