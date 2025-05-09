import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/collection_page/appbar_follow_up_debt/appbar_follow_up_debt_widget.dart';
import '/collection_page/input_field_component/input_field_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'r_p72_check_list_page_widget.dart' show RP72CheckListPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class RP72CheckListPageModel extends FlutterFlowModel<RP72CheckListPageWidget> {
  ///  Local state fields for this page.

  List<RP72CheckListDataModelStruct> currentCheckListChecked = [];
  void addToCurrentCheckListChecked(RP72CheckListDataModelStruct item) =>
      currentCheckListChecked.add(item);
  void removeFromCurrentCheckListChecked(RP72CheckListDataModelStruct item) =>
      currentCheckListChecked.remove(item);
  void removeAtIndexFromCurrentCheckListChecked(int index) =>
      currentCheckListChecked.removeAt(index);
  void insertAtIndexInCurrentCheckListChecked(
          int index, RP72CheckListDataModelStruct item) =>
      currentCheckListChecked.insert(index, item);
  void updateCurrentCheckListCheckedAtIndex(
          int index, Function(RP72CheckListDataModelStruct) updateFn) =>
      currentCheckListChecked[index] = updateFn(currentCheckListChecked[index]);

  int? loopCountTemp = 0;

  bool isLoopFinished = true;

  String? textCombinedTemp;

  String? textCombinedTemp2;

  ///  State fields for stateful widgets in this page.

  // Model for appbarFollowUpDebt component.
  late AppbarFollowUpDebtModel appbarFollowUpDebtModel;
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
