import '/auth/firebase_auth/auth_util.dart';
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
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_people_page_widget.dart' show AddPeoplePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddPeoplePageModel extends FlutterFlowModel<AddPeoplePageWidget> {
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

  List<String> usersDisplayImage = [];
  void addToUsersDisplayImage(String item) => usersDisplayImage.add(item);
  void removeFromUsersDisplayImage(String item) =>
      usersDisplayImage.remove(item);
  void removeAtIndexFromUsersDisplayImage(int index) =>
      usersDisplayImage.removeAt(index);
  void insertAtIndexInUsersDisplayImage(int index, String item) =>
      usersDisplayImage.insert(index, item);
  void updateUsersDisplayImageAtIndex(int index, Function(String) updateFn) =>
      usersDisplayImage[index] = updateFn(usersDisplayImage[index]);

  List<String> usersDisplayImageBlurHash = [];
  void addToUsersDisplayImageBlurHash(String item) =>
      usersDisplayImageBlurHash.add(item);
  void removeFromUsersDisplayImageBlurHash(String item) =>
      usersDisplayImageBlurHash.remove(item);
  void removeAtIndexFromUsersDisplayImageBlurHash(int index) =>
      usersDisplayImageBlurHash.removeAt(index);
  void insertAtIndexInUsersDisplayImageBlurHash(int index, String item) =>
      usersDisplayImageBlurHash.insert(index, item);
  void updateUsersDisplayImageBlurHashAtIndex(
          int index, Function(String) updateFn) =>
      usersDisplayImageBlurHash[index] =
          updateFn(usersDisplayImageBlurHash[index]);

  List<String> usersEmplayeeId = [];
  void addToUsersEmplayeeId(String item) => usersEmplayeeId.add(item);
  void removeFromUsersEmplayeeId(String item) => usersEmplayeeId.remove(item);
  void removeAtIndexFromUsersEmplayeeId(int index) =>
      usersEmplayeeId.removeAt(index);
  void insertAtIndexInUsersEmplayeeId(int index, String item) =>
      usersEmplayeeId.insert(index, item);
  void updateUsersEmplayeeIdAtIndex(int index, Function(String) updateFn) =>
      usersEmplayeeId[index] = updateFn(usersEmplayeeId[index]);

  List<String> usersName = [];
  void addToUsersName(String item) => usersName.add(item);
  void removeFromUsersName(String item) => usersName.remove(item);
  void removeAtIndexFromUsersName(int index) => usersName.removeAt(index);
  void insertAtIndexInUsersName(int index, String item) =>
      usersName.insert(index, item);
  void updateUsersNameAtIndex(int index, Function(String) updateFn) =>
      usersName[index] = updateFn(usersName[index]);

  List<DocumentReference> usersRef = [];
  void addToUsersRef(DocumentReference item) => usersRef.add(item);
  void removeFromUsersRef(DocumentReference item) => usersRef.remove(item);
  void removeAtIndexFromUsersRef(int index) => usersRef.removeAt(index);
  void insertAtIndexInUsersRef(int index, DocumentReference item) =>
      usersRef.insert(index, item);
  void updateUsersRefAtIndex(int index, Function(DocumentReference) updateFn) =>
      usersRef[index] = updateFn(usersRef[index]);

  String? combineUsersName = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchBox widget.
  FocusNode? searchBoxFocusNode;
  TextEditingController? searchBoxTextController;
  String? Function(BuildContext, String?)? searchBoxTextControllerValidator;
  // Stores action output result for [Backend Call - API (getAllEmployeeAPI)] action in IconButton widget.
  ApiCallResponse? getEmployee;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  SawadChatRoomRecord? queryChatRoomDoc;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatMessagesRecord? createAddPeopleMessageAction;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBoxFocusNode?.dispose();
    searchBoxTextController?.dispose();
  }
}
