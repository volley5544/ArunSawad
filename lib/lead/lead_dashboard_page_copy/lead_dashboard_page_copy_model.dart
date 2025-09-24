import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'lead_dashboard_page_copy_widget.dart' show LeadDashboardPageCopyWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LeadDashboardPageCopyModel
    extends FlutterFlowModel<LeadDashboardPageCopyWidget> {
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

  List<dynamic> leadNotiModifyJson = [];
  void addToLeadNotiModifyJson(dynamic item) => leadNotiModifyJson.add(item);
  void removeFromLeadNotiModifyJson(dynamic item) =>
      leadNotiModifyJson.remove(item);
  void removeAtIndexFromLeadNotiModifyJson(int index) =>
      leadNotiModifyJson.removeAt(index);
  void insertAtIndexInLeadNotiModifyJson(int index, dynamic item) =>
      leadNotiModifyJson.insert(index, item);
  void updateLeadNotiModifyJsonAtIndex(int index, Function(dynamic) updateFn) =>
      leadNotiModifyJson[index] = updateFn(leadNotiModifyJson[index]);

  String filterAssetType = 'ทั้งหมด';

  String filterSubChennel = 'ทั้งหมด';

  List<String> assetTypeFilterList = [];
  void addToAssetTypeFilterList(String item) => assetTypeFilterList.add(item);
  void removeFromAssetTypeFilterList(String item) =>
      assetTypeFilterList.remove(item);
  void removeAtIndexFromAssetTypeFilterList(int index) =>
      assetTypeFilterList.removeAt(index);
  void insertAtIndexInAssetTypeFilterList(int index, String item) =>
      assetTypeFilterList.insert(index, item);
  void updateAssetTypeFilterListAtIndex(int index, Function(String) updateFn) =>
      assetTypeFilterList[index] = updateFn(assetTypeFilterList[index]);

  List<String> subChannelFilterList = [];
  void addToSubChannelFilterList(String item) => subChannelFilterList.add(item);
  void removeFromSubChannelFilterList(String item) =>
      subChannelFilterList.remove(item);
  void removeAtIndexFromSubChannelFilterList(int index) =>
      subChannelFilterList.removeAt(index);
  void insertAtIndexInSubChannelFilterList(int index, String item) =>
      subChannelFilterList.insert(index, item);
  void updateSubChannelFilterListAtIndex(
          int index, Function(String) updateFn) =>
      subChannelFilterList[index] = updateFn(subChannelFilterList[index]);

  dynamic filterList;

  List<dynamic> leadHPDataJson = [];
  void addToLeadHPDataJson(dynamic item) => leadHPDataJson.add(item);
  void removeFromLeadHPDataJson(dynamic item) => leadHPDataJson.remove(item);
  void removeAtIndexFromLeadHPDataJson(int index) =>
      leadHPDataJson.removeAt(index);
  void insertAtIndexInLeadHPDataJson(int index, dynamic item) =>
      leadHPDataJson.insert(index, item);
  void updateLeadHPDataJsonAtIndex(int index, Function(dynamic) updateFn) =>
      leadHPDataJson[index] = updateFn(leadHPDataJson[index]);

  List<dynamic> leadTopupDataJson = [];
  void addToLeadTopupDataJson(dynamic item) => leadTopupDataJson.add(item);
  void removeFromLeadTopupDataJson(dynamic item) =>
      leadTopupDataJson.remove(item);
  void removeAtIndexFromLeadTopupDataJson(int index) =>
      leadTopupDataJson.removeAt(index);
  void insertAtIndexInLeadTopupDataJson(int index, dynamic item) =>
      leadTopupDataJson.insert(index, item);
  void updateLeadTopupDataJsonAtIndex(int index, Function(dynamic) updateFn) =>
      leadTopupDataJson[index] = updateFn(leadTopupDataJson[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController1;
  int carouselCurrentIndex1 = 0;

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController2;
  int carouselCurrentIndex2 = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
