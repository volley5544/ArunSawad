import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'group_chat_add_page_widget.dart' show GroupChatAddPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class GroupChatAddPageModel extends FlutterFlowModel<GroupChatAddPageWidget> {
  ///  Local state fields for this page.

  int? loopCountTemp = 0;

  List<EmployeeSearchDataModelStruct> selectedEmployeeList = [];
  void addToSelectedEmployeeList(EmployeeSearchDataModelStruct item) =>
      selectedEmployeeList.add(item);
  void removeFromSelectedEmployeeList(EmployeeSearchDataModelStruct item) =>
      selectedEmployeeList.remove(item);
  void removeAtIndexFromSelectedEmployeeList(int index) =>
      selectedEmployeeList.removeAt(index);
  void insertAtIndexInSelectedEmployeeList(
          int index, EmployeeSearchDataModelStruct item) =>
      selectedEmployeeList.insert(index, item);
  void updateSelectedEmployeeListAtIndex(
          int index, Function(EmployeeSearchDataModelStruct) updateFn) =>
      selectedEmployeeList[index] = updateFn(selectedEmployeeList[index]);

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for SearchBox widget.
  FocusNode? searchBoxFocusNode;
  TextEditingController? searchBoxTextController;
  String? Function(BuildContext, String?)? searchBoxTextControllerValidator;
  // Stores action output result for [Backend Call - API (getAllEmployeeAPI)] action in IconButton widget.
  ApiCallResponse? getEmployee;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    searchBoxFocusNode?.dispose();
    searchBoxTextController?.dispose();
  }
}
