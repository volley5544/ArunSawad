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
import 'tab_collection_team_m_page_widget.dart'
    show TabCollectionTeamMPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TabCollectionTeamMPageModel
    extends FlutterFlowModel<TabCollectionTeamMPageWidget> {
  ///  Local state fields for this page.

  List<CollectionTabMDataModelStruct> dataTabM = [];
  void addToDataTabM(CollectionTabMDataModelStruct item) => dataTabM.add(item);
  void removeFromDataTabM(CollectionTabMDataModelStruct item) =>
      dataTabM.remove(item);
  void removeAtIndexFromDataTabM(int index) => dataTabM.removeAt(index);
  void insertAtIndexInDataTabM(int index, CollectionTabMDataModelStruct item) =>
      dataTabM.insert(index, item);
  void updateDataTabMAtIndex(
          int index, Function(CollectionTabMDataModelStruct) updateFn) =>
      dataTabM[index] = updateFn(dataTabM[index]);

  List<String> choicechipsData = [];
  void addToChoicechipsData(String item) => choicechipsData.add(item);
  void removeFromChoicechipsData(String item) => choicechipsData.remove(item);
  void removeAtIndexFromChoicechipsData(int index) =>
      choicechipsData.removeAt(index);
  void insertAtIndexInChoicechipsData(int index, String item) =>
      choicechipsData.insert(index, item);
  void updateChoicechipsDataAtIndex(int index, Function(String) updateFn) =>
      choicechipsData[index] = updateFn(choicechipsData[index]);

  List<CollectionTabMDataModelStruct> showingData = [];
  void addToShowingData(CollectionTabMDataModelStruct item) =>
      showingData.add(item);
  void removeFromShowingData(CollectionTabMDataModelStruct item) =>
      showingData.remove(item);
  void removeAtIndexFromShowingData(int index) => showingData.removeAt(index);
  void insertAtIndexInShowingData(
          int index, CollectionTabMDataModelStruct item) =>
      showingData.insert(index, item);
  void updateShowingDataAtIndex(
          int index, Function(CollectionTabMDataModelStruct) updateFn) =>
      showingData[index] = updateFn(showingData[index]);

  int? cathayTabState = 1;

  String? cathayProvince;

  String? cathayDistrict;

  String? cathaySubDistrict;

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

  int? cathayProvinceIndex;

  int? cathayDistrictIndex;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in tabCollectionTeamMPage widget.
  UrlLinkStorageRecord? getCollectionApiUrl;
  // Stores action output result for [Backend Call - Read Document] action in tabCollectionTeamMPage widget.
  UrlLinkStorageRecord? queryBranchViewApiUrlUat;
  // Stores action output result for [Backend Call - API (collectionApiGetDataCount)] action in tabCollectionTeamMPage widget.
  ApiCallResponse? collectionApiGetdataCount;
  // Stores action output result for [Backend Call - API (collectionApiGetDataCountPP)] action in tabCollectionTeamMPage widget.
  ApiCallResponse? apiOutputCountPP;
  // Stores action output result for [Backend Call - API (collectionApiGetDataCount ExtraM)] action in tabCollectionTeamMPage widget.
  ApiCallResponse? collectionApiGetdataCountM;
  // Stores action output result for [Backend Call - API (collectionFollowupDebtSLS)] action in tabCollectionTeamMPage widget.
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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    appbarFollowUpDebtModel =
        createModel(context, () => AppbarFollowUpDebtModel());
  }

  @override
  void dispose() {
    appbarFollowUpDebtModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
