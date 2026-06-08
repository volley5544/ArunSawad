import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/collection_page/appbar_follow_up_debt/appbar_follow_up_debt_widget.dart';
import '/components/data_not_found_component_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'tab_collection_widget.dart' show TabCollectionWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TabCollectionModel extends FlutterFlowModel<TabCollectionWidget> {
  ///  Local state fields for this page.

  int? cathayTabState = 1;

  String? cathayProvince;

  String? cathayDistrict;

  String? cathaySubDistrict;

  List<String> choiceChipData = ['รายชื่อลูกค้า', 'ตามที่อยู่', 'ลูกค้า SCAP'];
  void addToChoiceChipData(String item) => choiceChipData.add(item);
  void removeFromChoiceChipData(String item) => choiceChipData.remove(item);
  void removeAtIndexFromChoiceChipData(int index) =>
      choiceChipData.removeAt(index);
  void insertAtIndexInChoiceChipData(int index, String item) =>
      choiceChipData.insert(index, item);
  void updateChoiceChipDataAtIndex(int index, Function(String) updateFn) =>
      choiceChipData[index] = updateFn(choiceChipData[index]);

  List<SLSCollectionDataModelStruct> slsDataPageState = [];
  void addToSlsDataPageState(SLSCollectionDataModelStruct item) =>
      slsDataPageState.add(item);
  void removeFromSlsDataPageState(SLSCollectionDataModelStruct item) =>
      slsDataPageState.remove(item);
  void removeAtIndexFromSlsDataPageState(int index) =>
      slsDataPageState.removeAt(index);
  void insertAtIndexInSlsDataPageState(
          int index, SLSCollectionDataModelStruct item) =>
      slsDataPageState.insert(index, item);
  void updateSlsDataPageStateAtIndex(
          int index, Function(SLSCollectionDataModelStruct) updateFn) =>
      slsDataPageState[index] = updateFn(slsDataPageState[index]);

  int? provinceIndex;

  int? districtIndex;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in tabCollection widget.
  UrlLinkStorageRecord? queryBranchViewApiUrlUat;
  // Stores action output result for [Backend Call - API (collectionApiGetDataCount)] action in tabCollection widget.
  ApiCallResponse? collectionApiGetdataCount;
  // Stores action output result for [Backend Call - API (collectionApiGetDataCountPP)] action in tabCollection widget.
  ApiCallResponse? apiOutputCountPP;
  // Stores action output result for [Backend Call - API (collectionFollowupDebtSLS)] action in tabCollection widget.
  ApiCallResponse? sLSAPIOutput;
  // Model for appbarFollowUpDebt component.
  late AppbarFollowUpDebtModel appbarFollowUpDebtModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {
    appbarFollowUpDebtModel =
        createModel(context, () => AppbarFollowUpDebtModel());
  }

  @override
  void dispose() {
    appbarFollowUpDebtModel.dispose();
  }
}
