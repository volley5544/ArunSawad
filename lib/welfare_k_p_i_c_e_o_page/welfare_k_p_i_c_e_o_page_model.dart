import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WelfareKPICEOPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

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
  String? choiceChipsMonthValue;
  FormFieldController<List<String>>? choiceChipsMonthValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
