import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/collection_page/appbar_follow_up_debt/appbar_follow_up_debt_widget.dart';
import '/components/input_field_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'r_p72_check_list_page_widget.dart' show RP72CheckListPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class RP72CheckListPageModel extends FlutterFlowModel<RP72CheckListPageWidget> {
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

  // Stores action output result for [Custom Action - a8] action in RP72CheckListPage widget.
  bool? checkLatLngBVCollection;
  // Stores action output result for [Backend Call - Create Document] action in RP72CheckListPage widget.
  UserLogRecord? createdUserLogBVCollection;
  // Model for appbarFollowUpDebt component.
  late AppbarFollowUpDebtModel appbarFollowUpDebtModel;
  // State field(s) for Checkbox widget.
  Map<RP72CheckListDataModelStruct, bool> checkboxValueMap = {};
  List<RP72CheckListDataModelStruct> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Models for InputFieldComponent dynamic component.
  late FlutterFlowDynamicModels<InputFieldComponentModel>
      inputFieldComponentModels;

  @override
  void initState(BuildContext context) {
    appbarFollowUpDebtModel =
        createModel(context, () => AppbarFollowUpDebtModel());
    inputFieldComponentModels =
        FlutterFlowDynamicModels(() => InputFieldComponentModel());
  }

  @override
  void dispose() {
    appbarFollowUpDebtModel.dispose();
    inputFieldComponentModels.dispose();
  }
}
