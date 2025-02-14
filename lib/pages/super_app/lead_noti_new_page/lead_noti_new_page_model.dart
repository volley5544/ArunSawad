import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/call_history/call_history_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/components/saved_lead_called_status/saved_lead_called_status_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'lead_noti_new_page_widget.dart' show LeadNotiNewPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LeadNotiNewPageModel extends FlutterFlowModel<LeadNotiNewPageWidget> {
  ///  Local state fields for this page.

  List<dynamic> leadSurveyDataJson = [];
  void addToLeadSurveyDataJson(dynamic item) => leadSurveyDataJson.add(item);
  void removeFromLeadSurveyDataJson(dynamic item) =>
      leadSurveyDataJson.remove(item);
  void removeAtIndexFromLeadSurveyDataJson(int index) =>
      leadSurveyDataJson.removeAt(index);
  void insertAtIndexInLeadSurveyDataJson(int index, dynamic item) =>
      leadSurveyDataJson.insert(index, item);
  void updateLeadSurveyDataJsonAtIndex(int index, Function(dynamic) updateFn) =>
      leadSurveyDataJson[index] = updateFn(leadSurveyDataJson[index]);

  List<dynamic> leadTeleDataJson = [];
  void addToLeadTeleDataJson(dynamic item) => leadTeleDataJson.add(item);
  void removeFromLeadTeleDataJson(dynamic item) =>
      leadTeleDataJson.remove(item);
  void removeAtIndexFromLeadTeleDataJson(int index) =>
      leadTeleDataJson.removeAt(index);
  void insertAtIndexInLeadTeleDataJson(int index, dynamic item) =>
      leadTeleDataJson.insert(index, item);
  void updateLeadTeleDataJsonAtIndex(int index, Function(dynamic) updateFn) =>
      leadTeleDataJson[index] = updateFn(leadTeleDataJson[index]);

  List<dynamic> leadAgentDataJson = [];
  void addToLeadAgentDataJson(dynamic item) => leadAgentDataJson.add(item);
  void removeFromLeadAgentDataJson(dynamic item) =>
      leadAgentDataJson.remove(item);
  void removeAtIndexFromLeadAgentDataJson(int index) =>
      leadAgentDataJson.removeAt(index);
  void insertAtIndexInLeadAgentDataJson(int index, dynamic item) =>
      leadAgentDataJson.insert(index, item);
  void updateLeadAgentDataJsonAtIndex(int index, Function(dynamic) updateFn) =>
      leadAgentDataJson[index] = updateFn(leadAgentDataJson[index]);

  List<dynamic> leadTruckDataJson = [];
  void addToLeadTruckDataJson(dynamic item) => leadTruckDataJson.add(item);
  void removeFromLeadTruckDataJson(dynamic item) =>
      leadTruckDataJson.remove(item);
  void removeAtIndexFromLeadTruckDataJson(int index) =>
      leadTruckDataJson.removeAt(index);
  void insertAtIndexInLeadTruckDataJson(int index, dynamic item) =>
      leadTruckDataJson.insert(index, item);
  void updateLeadTruckDataJsonAtIndex(int index, Function(dynamic) updateFn) =>
      leadTruckDataJson[index] = updateFn(leadTruckDataJson[index]);

  List<dynamic> leadOwnerDataJson = [];
  void addToLeadOwnerDataJson(dynamic item) => leadOwnerDataJson.add(item);
  void removeFromLeadOwnerDataJson(dynamic item) =>
      leadOwnerDataJson.remove(item);
  void removeAtIndexFromLeadOwnerDataJson(int index) =>
      leadOwnerDataJson.removeAt(index);
  void insertAtIndexInLeadOwnerDataJson(int index, dynamic item) =>
      leadOwnerDataJson.insert(index, item);
  void updateLeadOwnerDataJsonAtIndex(int index, Function(dynamic) updateFn) =>
      leadOwnerDataJson[index] = updateFn(leadOwnerDataJson[index]);

  List<dynamic> currentShowingDataJson = [];
  void addToCurrentShowingDataJson(dynamic item) =>
      currentShowingDataJson.add(item);
  void removeFromCurrentShowingDataJson(dynamic item) =>
      currentShowingDataJson.remove(item);
  void removeAtIndexFromCurrentShowingDataJson(int index) =>
      currentShowingDataJson.removeAt(index);
  void insertAtIndexInCurrentShowingDataJson(int index, dynamic item) =>
      currentShowingDataJson.insert(index, item);
  void updateCurrentShowingDataJsonAtIndex(
          int index, Function(dynamic) updateFn) =>
      currentShowingDataJson[index] = updateFn(currentShowingDataJson[index]);

  dynamic leadDataByCategory;

  String selectedTab = 'All';

  List<dynamic> allLeadDataJson = [];
  void addToAllLeadDataJson(dynamic item) => allLeadDataJson.add(item);
  void removeFromAllLeadDataJson(dynamic item) => allLeadDataJson.remove(item);
  void removeAtIndexFromAllLeadDataJson(int index) =>
      allLeadDataJson.removeAt(index);
  void insertAtIndexInAllLeadDataJson(int index, dynamic item) =>
      allLeadDataJson.insert(index, item);
  void updateAllLeadDataJsonAtIndex(int index, Function(dynamic) updateFn) =>
      allLeadDataJson[index] = updateFn(allLeadDataJson[index]);

  List<dynamic> leadSearchDataJson = [];
  void addToLeadSearchDataJson(dynamic item) => leadSearchDataJson.add(item);
  void removeFromLeadSearchDataJson(dynamic item) =>
      leadSearchDataJson.remove(item);
  void removeAtIndexFromLeadSearchDataJson(int index) =>
      leadSearchDataJson.removeAt(index);
  void insertAtIndexInLeadSearchDataJson(int index, dynamic item) =>
      leadSearchDataJson.insert(index, item);
  void updateLeadSearchDataJsonAtIndex(int index, Function(dynamic) updateFn) =>
      leadSearchDataJson[index] = updateFn(leadSearchDataJson[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getLeadDetailAPI)] action in LeadNotiNewPage widget.
  ApiCallResponse? getLeadDetail;
  // State field(s) for TextFieldSearch widget.
  FocusNode? textFieldSearchFocusNode;
  TextEditingController? textFieldSearchTextController;
  String? Function(BuildContext, String?)?
      textFieldSearchTextControllerValidator;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Stores action output result for [Backend Call - API (addPhoneCalledLeadAPI)] action in Image widget.
  ApiCallResponse? addCalledLead;
  // Stores action output result for [Backend Call - API (getLeadCalledStatusDropdownAPI)] action in Button widget.
  ApiCallResponse? getCalledStatusCode;
  // Stores action output result for [Backend Call - API (getLeadCalledHistoryAPI)] action in Button widget.
  ApiCallResponse? getCallHistory;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    textFieldSearchFocusNode?.dispose();
    textFieldSearchTextController?.dispose();

    listViewController?.dispose();
  }
}
