import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'welfare_k_p_i_c_e_o_page_widget.dart' show WelfareKPICEOPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class WelfareKPICEOPageModel extends FlutterFlowModel<WelfareKPICEOPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in WelfareKPICEOPage widget.
  UserLogRecord? createdUserLogWelfareKPI;
  // Stores action output result for [Backend Call - API (getDateTimeAPI)] action in WelfareKPICEOPage widget.
  ApiCallResponse? getServerDateTime;
  // Stores action output result for [Backend Call - API (getRegionAreaAPI)] action in WelfareKPICEOPage widget.
  ApiCallResponse? getArea;
  // Stores action output result for [Backend Call - API (getRegionAreaAPI)] action in WelfareKPICEOPage widget.
  ApiCallResponse? getRegion;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for branchInput widget.
  final branchInputKey = GlobalKey();
  FocusNode? branchInputFocusNode;
  TextEditingController? branchInputController;
  String? branchInputSelectedOption;
  String? Function(BuildContext, String?)? branchInputControllerValidator;
  // Stores action output result for [Backend Call - API (getBranchAPI)] action in IconButton widget.
  ApiCallResponse? getBranchSearched;
  // Stores action output result for [Backend Call - API (getWelfareKpiCEOAPI)] action in IconButton widget.
  ApiCallResponse? getWelfareRegionArea;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Backend Call - API (getWelfareKpiCEOAPI)] action in DropDown widget.
  ApiCallResponse? getBranchWelfare;
  // State field(s) for ChoiceChipsMonth widget.
  FormFieldController<List<String>>? choiceChipsMonthValueController;
  String? get choiceChipsMonthValue =>
      choiceChipsMonthValueController?.value?.firstOrNull;
  set choiceChipsMonthValue(String? val) =>
      choiceChipsMonthValueController?.value = val != null ? [val] : [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    branchInputFocusNode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
