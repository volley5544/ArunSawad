import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'change_car_location_page_widget.dart' show ChangeCarLocationPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ChangeCarLocationPageModel
    extends FlutterFlowModel<ChangeCarLocationPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (improundCarGetBranch)] action in DropDown widget.
  ApiCallResponse? getBranchOutput;
  // State field(s) for SearchTextfield widget.
  FocusNode? searchTextfieldFocusNode;
  TextEditingController? searchTextfieldTextController;
  String? Function(BuildContext, String?)?
      searchTextfieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (updateImproundCar)] action in Button widget.
  ApiCallResponse? updateCarLocationOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchTextfieldFocusNode?.dispose();
    searchTextfieldTextController?.dispose();
  }
}
