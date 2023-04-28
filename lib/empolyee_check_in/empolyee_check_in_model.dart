import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class EmpolyeeCheckInModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getDateTimeAPI)] action in EmpolyeeCheckIn widget.
  ApiCallResponse? getDateTimeAPIOutput;
  // Stores action output result for [Backend Call - API (checkinoutThisMonthAPI)] action in EmpolyeeCheckIn widget.
  ApiCallResponse? checkinoutMonthAPIOutput;
  // Stores action output result for [Backend Call - API (GetlocationAPI)] action in EmpolyeeCheckIn widget.
  ApiCallResponse? getLocationOutput;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for branchDropDown widget.
  String? branchDropDownValue;
  FormFieldController<String>? branchDropDownValueController;
  // Stores action output result for [Backend Call - API (GetlocationAPI)] action in IconButton widget.
  ApiCallResponse? getLocationOutput2;
  // State field(s) for branchField widget.
  final branchFieldKey = GlobalKey();
  TextEditingController? branchFieldController;
  String? branchFieldSelectedOption;
  String? Function(BuildContext, String?)? branchFieldControllerValidator;
  // Stores action output result for [Backend Call - API (GetlocationAPI)] action in findLocation widget.
  ApiCallResponse? findLocationOutput;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - locationCal] action in Button widget.
  bool? inCurrentLocation;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Custom Action - locationCal] action in Button widget.
  bool? inCurrentLocation2;
  // Stores action output result for [Custom Action - a8] action in Button widget.
  bool? checkGPSBeforeSave;
  // Stores action output result for [Backend Call - API (CheckinAPI)] action in Button widget.
  ApiCallResponse? checkinAPIOutput;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
