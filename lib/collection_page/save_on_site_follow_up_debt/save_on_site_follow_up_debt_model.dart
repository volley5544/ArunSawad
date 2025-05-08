import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/collection_page/appbar_follow_up_debt/appbar_follow_up_debt_widget.dart';
import '/components/camera_button_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
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
  ///  Local state fields for this page.

  List<RP72CheckListDataModelStruct> rp72CheckListData = [];
  void addToRp72CheckListData(RP72CheckListDataModelStruct item) =>
      rp72CheckListData.add(item);
  void removeFromRp72CheckListData(RP72CheckListDataModelStruct item) =>
      rp72CheckListData.remove(item);
  void removeAtIndexFromRp72CheckListData(int index) =>
      rp72CheckListData.removeAt(index);
  void insertAtIndexInRp72CheckListData(
          int index, RP72CheckListDataModelStruct item) =>
      rp72CheckListData.insert(index, item);
  void updateRp72CheckListDataAtIndex(
          int index, Function(RP72CheckListDataModelStruct) updateFn) =>
      rp72CheckListData[index] = updateFn(rp72CheckListData[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - a8] action in saveOnSiteFollowUpDebt widget.
  bool? checkLatLngBVCollection;
  // Stores action output result for [Backend Call - Create Document] action in saveOnSiteFollowUpDebt widget.
  UserLogRecord? createdUserLogBVCollection;
  // Model for appbarFollowUpDebt component.
  late AppbarFollowUpDebtModel appbarFollowUpDebtModel;
  // Model for cameraButton component.
  late CameraButtonModel cameraButtonModel;
  // State field(s) for DropDownFollowup widget.
  String? dropDownFollowupValue;
  FormFieldController<String>? dropDownFollowupValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for RemarkTextField widget.
  FocusNode? remarkTextFieldFocusNode;
  TextEditingController? remarkTextFieldTextController;
  String? Function(BuildContext, String?)?
      remarkTextFieldTextControllerValidator;
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

  @override
  void initState(BuildContext context) {
    appbarFollowUpDebtModel =
        createModel(context, () => AppbarFollowUpDebtModel());
    cameraButtonModel = createModel(context, () => CameraButtonModel());
  }

  @override
  void dispose() {
    appbarFollowUpDebtModel.dispose();
    cameraButtonModel.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    remarkTextFieldFocusNode?.dispose();
    remarkTextFieldTextController?.dispose();
  }
}
