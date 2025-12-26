import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'chat_room_setting_page_widget.dart' show ChatRoomSettingPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ChatRoomSettingPageModel
    extends FlutterFlowModel<ChatRoomSettingPageWidget> {
  ///  Local state fields for this page.

  bool isEditState = false;

  int? myUserIndex;

  List<String> usersEmployeeList = [];
  void addToUsersEmployeeList(String item) => usersEmployeeList.add(item);
  void removeFromUsersEmployeeList(String item) =>
      usersEmployeeList.remove(item);
  void removeAtIndexFromUsersEmployeeList(int index) =>
      usersEmployeeList.removeAt(index);
  void insertAtIndexInUsersEmployeeList(int index, String item) =>
      usersEmployeeList.insert(index, item);
  void updateUsersEmployeeListAtIndex(int index, Function(String) updateFn) =>
      usersEmployeeList[index] = updateFn(usersEmployeeList[index]);

  List<DocumentReference> usersRefList = [];
  void addToUsersRefList(DocumentReference item) => usersRefList.add(item);
  void removeFromUsersRefList(DocumentReference item) =>
      usersRefList.remove(item);
  void removeAtIndexFromUsersRefList(int index) => usersRefList.removeAt(index);
  void insertAtIndexInUsersRefList(int index, DocumentReference item) =>
      usersRefList.insert(index, item);
  void updateUsersRefListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      usersRefList[index] = updateFn(usersRefList[index]);

  List<String> usersNameList = [];
  void addToUsersNameList(String item) => usersNameList.add(item);
  void removeFromUsersNameList(String item) => usersNameList.remove(item);
  void removeAtIndexFromUsersNameList(int index) =>
      usersNameList.removeAt(index);
  void insertAtIndexInUsersNameList(int index, String item) =>
      usersNameList.insert(index, item);
  void updateUsersNameListAtIndex(int index, Function(String) updateFn) =>
      usersNameList[index] = updateFn(usersNameList[index]);

  List<String> usersDisplayImgList = [];
  void addToUsersDisplayImgList(String item) => usersDisplayImgList.add(item);
  void removeFromUsersDisplayImgList(String item) =>
      usersDisplayImgList.remove(item);
  void removeAtIndexFromUsersDisplayImgList(int index) =>
      usersDisplayImgList.removeAt(index);
  void insertAtIndexInUsersDisplayImgList(int index, String item) =>
      usersDisplayImgList.insert(index, item);
  void updateUsersDisplayImgListAtIndex(int index, Function(String) updateFn) =>
      usersDisplayImgList[index] = updateFn(usersDisplayImgList[index]);

  List<String> usersDisplayImgBlurHashList = [];
  void addToUsersDisplayImgBlurHashList(String item) =>
      usersDisplayImgBlurHashList.add(item);
  void removeFromUsersDisplayImgBlurHashList(String item) =>
      usersDisplayImgBlurHashList.remove(item);
  void removeAtIndexFromUsersDisplayImgBlurHashList(int index) =>
      usersDisplayImgBlurHashList.removeAt(index);
  void insertAtIndexInUsersDisplayImgBlurHashList(int index, String item) =>
      usersDisplayImgBlurHashList.insert(index, item);
  void updateUsersDisplayImgBlurHashListAtIndex(
          int index, Function(String) updateFn) =>
      usersDisplayImgBlurHashList[index] =
          updateFn(usersDisplayImgBlurHashList[index]);

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_selectGroupChatImageEdit = false;
  FFUploadedFile uploadedLocalFile_selectGroupChatImageEdit =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? uploadStorageDisplayAction;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatMessagesRecord? createSettingMessageDoc1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatMessagesRecord? createSettingMessageDoc2;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatMessagesRecord? createLeaveGroupMessageDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
