import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/collection_page/appbar_follow_up_debt/appbar_follow_up_debt_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'save_on_site_follow_up_debt_widget.dart'
    show SaveOnSiteFollowUpDebtWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SaveOnSiteFollowUpDebtModel
    extends FlutterFlowModel<SaveOnSiteFollowUpDebtWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - a8] action in saveOnSiteFollowUpDebt widget.
  bool? checkLatLngBVCollection;
  // Stores action output result for [Backend Call - Create Document] action in saveOnSiteFollowUpDebt widget.
  UserLogRecord? createdUserLogBVCollection;
  // Model for appbarFollowUpDebt component.
  late AppbarFollowUpDebtModel appbarFollowUpDebtModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for DropDownFollowup widget.
  String? dropDownFollowupValue;
  FormFieldController<String>? dropDownFollowupValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for RemarkTextField widget.
  FocusNode? remarkTextFieldFocusNode;
  TextEditingController? remarkTextFieldController;
  String? Function(BuildContext, String?)? remarkTextFieldControllerValidator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Custom Action - a8] action in Button widget.
  bool? checkGPSBeforeSave;
  // Stores action output result for [Backend Call - API (ChangeLocationAPI)] action in Button widget.
  ApiCallResponse? getUserBranchLocation;
  // Stores action output result for [Backend Call - API (CollectionAPI)] action in Button widget.
  ApiCallResponse? collectionAPISubmit;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FileUploadRecord? saveImgToFirebase;
  // Stores action output result for [Backend Call - API (remarkVLoneAPI)] action in Button widget.
  ApiCallResponse? remarkVLoneOutput;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    appbarFollowUpDebtModel =
        createModel(context, () => AppbarFollowUpDebtModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appbarFollowUpDebtModel.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    remarkTextFieldFocusNode?.dispose();
    remarkTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
