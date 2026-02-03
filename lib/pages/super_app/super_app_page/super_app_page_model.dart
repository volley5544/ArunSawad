import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/employee_input_for_c_e_o_component/employee_input_for_c_e_o_component_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/components/p_d_f_viewer/p_d_f_viewer_widget.dart';
import '/components/search_employee_component/search_employee_component_widget.dart';
import '/components/search_profile_level_component/search_profile_level_component_widget.dart';
import '/components/splash_page/splash_page_widget.dart';
import '/components/splash_page_holiday/splash_page_holiday_widget.dart';
import '/components/tiktok_splash_page/tiktok_splash_page_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'super_app_page_widget.dart' show SuperAppPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SuperAppPageModel extends FlutterFlowModel<SuperAppPageWidget> {
  ///  Local state fields for this page.

  List<UrlLinkStorageRecord> urlLinkStorage = [];
  void addToUrlLinkStorage(UrlLinkStorageRecord item) =>
      urlLinkStorage.add(item);
  void removeFromUrlLinkStorage(UrlLinkStorageRecord item) =>
      urlLinkStorage.remove(item);
  void removeAtIndexFromUrlLinkStorage(int index) =>
      urlLinkStorage.removeAt(index);
  void insertAtIndexInUrlLinkStorage(int index, UrlLinkStorageRecord item) =>
      urlLinkStorage.insert(index, item);
  void updateUrlLinkStorageAtIndex(
          int index, Function(UrlLinkStorageRecord) updateFn) =>
      urlLinkStorage[index] = updateFn(urlLinkStorage[index]);

  List<String> serviceMenuName = [];
  void addToServiceMenuName(String item) => serviceMenuName.add(item);
  void removeFromServiceMenuName(String item) => serviceMenuName.remove(item);
  void removeAtIndexFromServiceMenuName(int index) =>
      serviceMenuName.removeAt(index);
  void insertAtIndexInServiceMenuName(int index, String item) =>
      serviceMenuName.insert(index, item);
  void updateServiceMenuNameAtIndex(int index, Function(String) updateFn) =>
      serviceMenuName[index] = updateFn(serviceMenuName[index]);

  List<String> serviceMenuIconUrl = [];
  void addToServiceMenuIconUrl(String item) => serviceMenuIconUrl.add(item);
  void removeFromServiceMenuIconUrl(String item) =>
      serviceMenuIconUrl.remove(item);
  void removeAtIndexFromServiceMenuIconUrl(int index) =>
      serviceMenuIconUrl.removeAt(index);
  void insertAtIndexInServiceMenuIconUrl(int index, String item) =>
      serviceMenuIconUrl.insert(index, item);
  void updateServiceMenuIconUrlAtIndex(int index, Function(String) updateFn) =>
      serviceMenuIconUrl[index] = updateFn(serviceMenuIconUrl[index]);

  List<String> serviceMenuOrder = [];
  void addToServiceMenuOrder(String item) => serviceMenuOrder.add(item);
  void removeFromServiceMenuOrder(String item) => serviceMenuOrder.remove(item);
  void removeAtIndexFromServiceMenuOrder(int index) =>
      serviceMenuOrder.removeAt(index);
  void insertAtIndexInServiceMenuOrder(int index, String item) =>
      serviceMenuOrder.insert(index, item);
  void updateServiceMenuOrderAtIndex(int index, Function(String) updateFn) =>
      serviceMenuOrder[index] = updateFn(serviceMenuOrder[index]);

  List<String> serviceMenuIconBlurHash = [];
  void addToServiceMenuIconBlurHash(String item) =>
      serviceMenuIconBlurHash.add(item);
  void removeFromServiceMenuIconBlurHash(String item) =>
      serviceMenuIconBlurHash.remove(item);
  void removeAtIndexFromServiceMenuIconBlurHash(int index) =>
      serviceMenuIconBlurHash.removeAt(index);
  void insertAtIndexInServiceMenuIconBlurHash(int index, String item) =>
      serviceMenuIconBlurHash.insert(index, item);
  void updateServiceMenuIconBlurHashAtIndex(
          int index, Function(String) updateFn) =>
      serviceMenuIconBlurHash[index] = updateFn(serviceMenuIconBlurHash[index]);

  String? branchCodeLandAndHouse;

  String? levelLandAndHouse;

  bool isShowVideoPlayer = false;

  double? xAxis = 0.9;

  double? yAxis = 0.95;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in SuperAppPage widget.
  HideInAppContentRecord? getHideContentTableauDoc;
  // Stores action output result for [Custom Action - getBuildVersion] action in SuperAppPage widget.
  String? getDeviceVersion;
  // Stores action output result for [Custom Action - a14] action in SuperAppPage widget.
  String? leadNotiOutput;
  // Stores action output result for [Custom Action - getDataFromCollection] action in SuperAppPage widget.
  dynamic? getDataRoleMenu;
  // Stores action output result for [Firestore Query - Query a collection] action in SuperAppPage widget.
  List<SawadAnnouncementRecord>? queryAnnouncement;
  // Stores action output result for [Backend Call - Read Document] action in SuperAppPage widget.
  HideInAppContentRecord? queryBlockMockedLocationDoc;
  // Stores action output result for [Custom Action - checkDeveloperMode] action in SuperAppPage widget.
  bool? checkDeveloperMode;
  // Stores action output result for [Custom Action - a17] action in SuperAppPage widget.
  bool? checkDoNotShowIsEmpty;
  // Stores action output result for [Custom Action - a18] action in SuperAppPage widget.
  bool? checkDoNotShowHoliday;
  // Stores action output result for [Custom Action - a18] action in SuperAppPage widget.
  bool? checkDoNotShow;
  // Stores action output result for [Backend Call - API (getDateTimeAPI)] action in SuperAppPage widget.
  ApiCallResponse? datetimeAPIOutput;
  // State field(s) for PageViewBanner widget.
  PageController? pageViewBannerController;

  int get pageViewBannerCurrentIndex => pageViewBannerController != null &&
          pageViewBannerController!.hasClients &&
          pageViewBannerController!.page != null
      ? pageViewBannerController!.page!.round()
      : 0;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UrlLinkStorageRecord? queryOpenMorningthUrl;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UrlLinkStorageRecord? queryOpenSrisawadMobileUrl;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginLeavePage;
  // Stores action output result for [Backend Call - API (GetBossAPI)] action in Container widget.
  ApiCallResponse? bossCheckOutput;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginBranchView;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginTeamM;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginImpoundCar;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginCheckLead;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginQrPayment;
  // Stores action output result for [Bottom Sheet - searchProfileLevelComponent] action in Container widget.
  dynamic? groceryAssignSearchProfileLevelOutput;
  // Stores action output result for [Bottom Sheet - EmployeeInputForCEOComponent] action in Container widget.
  String? groceryAssignEmployeeInputOutput5544;
  // Stores action output result for [Backend Call - API (getTokenEmployee)] action in Container widget.
  ApiCallResponse? groceryAssignGetEmployeeTokenOutput;
  // Stores action output result for [Backend Call - API (getUserProfileAPI)] action in Container widget.
  ApiCallResponse? groceryAssignGetRegionProfile;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UrlLinkStorageRecord? queryGroceryAssignUrlTester;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UrlLinkStorageRecord? queryGroceryAssignUrl;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UrlLinkStorageRecord? queryLandAndHouseArunsawadUrl;
  // Stores action output result for [Bottom Sheet - searchProfileLevelComponent] action in Container widget.
  dynamic? searchProfileLevelOutput;
  // Stores action output result for [Bottom Sheet - EmployeeInputForCEOComponent] action in Container widget.
  String? employeeInputOutput5544;
  // Stores action output result for [Backend Call - API (getTokenEmployee)] action in Container widget.
  ApiCallResponse? getEmployeeTokenOutput;
  // Stores action output result for [Backend Call - API (getUserProfileAPI)] action in Container widget.
  ApiCallResponse? getRegionProfile;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UrlLinkStorageRecord? queryLandAndHouseUrlTester;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UrlLinkStorageRecord? queryLandAndHouseUrl;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ReportStorageRecord? reportStoragePIPKPIQueryKpi;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ReportStorageRecord? reportStoragePIPKPIQueryPip;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UrlLinkStorageRecord? queryAuctionAppointmentUrl;
  // Stores action output result for [Custom Action - scanQrCode] action in Container widget.
  String? scanQrCode;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ReportStorageRecord? reportStorageTypeMQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  UrlLinkStorageRecord? queryVloanApiUrl;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  HideInAppContentRecord? queryRecordVideoIsOnWebview;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  UrlLinkStorageRecord? getWebRecodeVideoUrl;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ReportStorageRecord? reportStorageDsiQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ReportStorageRecord? reportStorageDsiHoQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ReportStorageRecord? reportStorageGenEpaQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ReportStorageRecord? reportStorageImpoundCarQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ReportStorageRecord? reportStorageZUVQuery;
  // Stores action output result for [Backend Call - API (teleGetBrandAPI)] action in Container widget.
  ApiCallResponse? gerBrand;
  // Stores action output result for [Backend Call - API (teleGetModelAPI )] action in Container widget.
  ApiCallResponse? getModel;
  // Stores action output result for [Backend Call - API (teleGetProvinceAPI)] action in Container widget.
  ApiCallResponse? getProvince;
  // Stores action output result for [Backend Call - API (insuranceRequestGetVehicleAPI)] action in Container widget.
  ApiCallResponse? getVehicle;
  // Stores action output result for [Backend Call - API (insuranceRequestGetInsurerAPI)] action in Container widget.
  ApiCallResponse? getInsurer;
  // Stores action output result for [Backend Call - API (teleGetCoverTypeAPI)] action in Container widget.
  ApiCallResponse? getCoverType;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  TextContentRecord? textGoldCupConsent;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UrlLinkStorageRecord? getTableauBaseUrl;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ReportStorageRecord? getIbsUrl;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginKPI;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in ContainerWelfare widget.
  ApiCallResponse? checkLoginKPIWelfare;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginThaiPaiboon;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginPercentSuccess;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginInsurance;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginQR;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginSaleskit;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginFormLead;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginPromotion;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginCoach;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  UserLogRecord? createdUserLogCoach;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginClassroom;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginITSupport;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UrlLinkStorageRecord? queryMarketingUrl1;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UrlLinkStorageRecord? queryMarketingUrl2;
  // Stores action output result for [Backend Call - API (teleGetBrandAPI)] action in Container widget.
  ApiCallResponse? gerBrandService;
  // Stores action output result for [Backend Call - API (teleGetModelAPI )] action in Container widget.
  ApiCallResponse? getModelService;
  // Stores action output result for [Backend Call - API (teleGetProvinceAPI)] action in Container widget.
  ApiCallResponse? getProvinceService;
  // Stores action output result for [Backend Call - API (insuranceRequestGetVehicleAPI)] action in Container widget.
  ApiCallResponse? getVehicleService;
  // Stores action output result for [Backend Call - API (insuranceRequestGetInsurerAPI)] action in Container widget.
  ApiCallResponse? getInsurerService;
  // Stores action output result for [Backend Call - API (teleGetCoverTypeAPI)] action in Container widget.
  ApiCallResponse? getCoverTypeService;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginLeavePagetab;
  // Stores action output result for [Backend Call - API (GetBossAPI)] action in Container widget.
  ApiCallResponse? bossCheckOutputPad;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLogImpoundCarTab;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UrlLinkStorageRecord? queryLandAndHouseArunsawadUrlTab;
  // Stores action output result for [Bottom Sheet - searchProfileLevelComponent] action in Container widget.
  dynamic? searchProfileLevelOutputTab;
  // Stores action output result for [Bottom Sheet - EmployeeInputForCEOComponent] action in Container widget.
  String? employeeInputOutput5544Tab;
  // Stores action output result for [Backend Call - API (getTokenEmployee)] action in Container widget.
  ApiCallResponse? getEmployeeTokenOutputTab;
  // Stores action output result for [Backend Call - API (getUserProfileAPI)] action in Container widget.
  ApiCallResponse? getRegionProfileTab;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UrlLinkStorageRecord? queryLandAndHouseUrlTesterTab;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UrlLinkStorageRecord? queryLandAndHouseUrlTab;
  // Stores action output result for [Custom Action - scanQrCode] action in Container widget.
  String? scanQRTablet;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginLeadMTab;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ReportStorageRecord? reportStorageTypeMQueryTab;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  UrlLinkStorageRecord? queryVloanApiUrlTab;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  HideInAppContentRecord? queryRecordVideoIsOnWebviewTab;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  UrlLinkStorageRecord? getWebRecodeVideoUrlTab;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ReportStorageRecord? reportStorageDsiQueryTab;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ReportStorageRecord? reportStorageDsiHoQueryTab;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ReportStorageRecord? reportStorageGenEpaQueryTab;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ReportStorageRecord? reportStorageImpoundCarTab;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ReportStorageRecord? reportStorageZUVQueryTab;
  // Stores action output result for [Backend Call - API (teleGetBrandAPI)] action in Container widget.
  ApiCallResponse? gerBrandTab;
  // Stores action output result for [Backend Call - API (teleGetModelAPI )] action in Container widget.
  ApiCallResponse? getModelTab;
  // Stores action output result for [Backend Call - API (teleGetProvinceAPI)] action in Container widget.
  ApiCallResponse? getProvinceTab;
  // Stores action output result for [Backend Call - API (insuranceRequestGetVehicleAPI)] action in Container widget.
  ApiCallResponse? getVehicleTab;
  // Stores action output result for [Backend Call - API (insuranceRequestGetInsurerAPI)] action in Container widget.
  ApiCallResponse? getInsurerTab;
  // Stores action output result for [Backend Call - API (teleGetCoverTypeAPI)] action in Container widget.
  ApiCallResponse? getCoverTypeTab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginKPItab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in ContainerWelfareTab widget.
  ApiCallResponse? checkLoginKPIWelfaretab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in thaipaiboonPad widget.
  ApiCallResponse? checkLoginThaiPaiboonPad;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginCheckLeadtab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginPercentSuccessTab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginInsurancetab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginBranchViewtab;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  UserLogRecord? createUserLogBranchViewtab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginQRtab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginSaleskittab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginFormLeadtab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginPromotiontab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginCoachtab;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  UserLogRecord? createdUserLogCoachtab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginClassroomtab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginITSupporttab;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UrlLinkStorageRecord? queryMarketingUrl2Copy;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UrlLinkStorageRecord? queryMarketingUrl1Copy;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginFormService;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  UserLogRecord? createdUserLogFormService;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginFormServicetab;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  UserLogRecord? createdUserLogFormServicetab;
  // Stores action output result for [Backend Call - API (getTokenEmployee)] action in ListTile widget.
  ApiCallResponse? apiResultTokenEmp;
  // Stores action output result for [Custom Action - a1] action in ListTile widget.
  bool? checkDeviceLocSerLogout;
  // Stores action output result for [Custom Action - a2] action in ListTile widget.
  bool? checkDeviceLocPerLogout;
  // Stores action output result for [Custom Action - a8] action in ListTile widget.
  bool? checkLatLngLogout;
  // Stores action output result for [Backend Call - Create Document] action in ListTile widget.
  UserLogRecord? createdUserLogLogout;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
