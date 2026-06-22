import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'lead_dashboard_page_widget.dart' show LeadDashboardPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LeadDashboardPageModel extends FlutterFlowModel<LeadDashboardPageWidget> {
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

  List<bool> selectedLeadChannel = [true, false, false, false, false];
  void addToSelectedLeadChannel(bool item) => selectedLeadChannel.add(item);
  void removeFromSelectedLeadChannel(bool item) =>
      selectedLeadChannel.remove(item);
  void removeAtIndexFromSelectedLeadChannel(int index) =>
      selectedLeadChannel.removeAt(index);
  void insertAtIndexInSelectedLeadChannel(int index, bool item) =>
      selectedLeadChannel.insert(index, item);
  void updateSelectedLeadChannelAtIndex(int index, Function(bool) updateFn) =>
      selectedLeadChannel[index] = updateFn(selectedLeadChannel[index]);

  List<bool> selectedCallStatus = [true, false, false, false, false];
  void addToSelectedCallStatus(bool item) => selectedCallStatus.add(item);
  void removeFromSelectedCallStatus(bool item) =>
      selectedCallStatus.remove(item);
  void removeAtIndexFromSelectedCallStatus(int index) =>
      selectedCallStatus.removeAt(index);
  void insertAtIndexInSelectedCallStatus(int index, bool item) =>
      selectedCallStatus.insert(index, item);
  void updateSelectedCallStatusAtIndex(int index, Function(bool) updateFn) =>
      selectedCallStatus[index] = updateFn(selectedCallStatus[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  List<UrlLinkStorageRecord>? queryLink;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
