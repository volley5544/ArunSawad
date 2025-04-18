import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'chat_search_page_widget.dart' show ChatSearchPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ChatSearchPageModel extends FlutterFlowModel<ChatSearchPageWidget> {
  ///  Local state fields for this page.

  int? loopCountTemp = 0;

  List<dynamic> chatRoomDocData = [];
  void addToChatRoomDocData(dynamic item) => chatRoomDocData.add(item);
  void removeFromChatRoomDocData(dynamic item) => chatRoomDocData.remove(item);
  void removeAtIndexFromChatRoomDocData(int index) =>
      chatRoomDocData.removeAt(index);
  void insertAtIndexInChatRoomDocData(int index, dynamic item) =>
      chatRoomDocData.insert(index, item);
  void updateChatRoomDocDataAtIndex(int index, Function(dynamic) updateFn) =>
      chatRoomDocData[index] = updateFn(chatRoomDocData[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchBox widget.
  FocusNode? searchBoxFocusNode;
  TextEditingController? searchBoxTextController;
  String? Function(BuildContext, String?)? searchBoxTextControllerValidator;
  // Stores action output result for [Backend Call - API (getAllEmployeeAPI)] action in IconButton widget.
  ApiCallResponse? getEmployee;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<SawadChatRoomRecord>? queryMyChatRoom;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  SawadChatRoomRecord? createNewChatRoom;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBoxFocusNode?.dispose();
    searchBoxTextController?.dispose();
  }
}
