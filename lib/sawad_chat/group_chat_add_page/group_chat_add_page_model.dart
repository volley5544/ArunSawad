import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:convert';
import 'dart:ui';
import '/index.dart';
import 'group_chat_add_page_widget.dart' show GroupChatAddPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
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

  String defaultGroupDisplayImage =
      'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/UsersProfileImage%2Fgroup-chat.png?alt=media&token=ec0e798c-11e6-4bc9-8b0a-7253e3960af0';

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_selectGroupChatImage = false;
  FFUploadedFile uploadedLocalFile_selectGroupChatImage =
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
  bool isDataUploading_uploadGroupChatImage = false;
  FFUploadedFile uploadedLocalFile_uploadGroupChatImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadGroupChatImage = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SawadChatRoomRecord? createNewGroupChatRoom;

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
