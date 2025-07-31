import '/backend/ai_agents/ai_agent.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_chat_component/empty_chat_component_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'bot_chatting_page_widget.dart' show BotChattingPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BotChattingPageModel extends FlutterFlowModel<BotChattingPageWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? imageUploadTemp;

  List<ChatBotDataModelStruct> chatData = [];
  void addToChatData(ChatBotDataModelStruct item) => chatData.add(item);
  void removeFromChatData(ChatBotDataModelStruct item) => chatData.remove(item);
  void removeAtIndexFromChatData(int index) => chatData.removeAt(index);
  void insertAtIndexInChatData(int index, ChatBotDataModelStruct item) =>
      chatData.insert(index, item);
  void updateChatDataAtIndex(
          int index, Function(ChatBotDataModelStruct) updateFn) =>
      chatData[index] = updateFn(chatData[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [AI Agent - Send Message to InsuranceConsultantAgent] action in SendIcon widget.
  String? chatBotMessageOutput;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    listViewController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
