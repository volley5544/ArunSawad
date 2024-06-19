import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginPageWidget(),
          routes: [
            FFRoute(
              name: 'LoginPage',
              path: 'loginPage',
              builder: (context, params) => LoginPageWidget(
                apiURL: params.getParam(
                  'apiURL',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['Key_Storage'],
                ),
                token: params.getParam(
                  'token',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'SetPinCodePage',
              path: 'setPinCodePage',
              builder: (context, params) => SetPinCodePageWidget(),
            ),
            FFRoute(
              name: 'PinCodePage',
              path: 'pinCodePage',
              builder: (context, params) => PinCodePageWidget(),
            ),
            FFRoute(
              name: 'Dashboard',
              path: 'dashboard',
              builder: (context, params) => DashboardWidget(
                jwtToken: params.getParam(
                  'jwtToken',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'CheckInPage',
              path: 'checkInPage',
              builder: (context, params) => CheckInPageWidget(
                recordId: params.getParam(
                  'recordId',
                  ParamType.String,
                ),
                coordinate: params.getParam(
                  'coordinate',
                  ParamType.String,
                ),
                remark: params.getParam(
                  'remark',
                  ParamType.String,
                ),
                clockIn: params.getParam(
                  'clockIn',
                  ParamType.DateTime,
                ),
              ),
            ),
            FFRoute(
              name: 'SurveyPage',
              path: 'surveyPage',
              builder: (context, params) => SurveyPageWidget(
                recordId: params.getParam(
                  'recordId',
                  ParamType.String,
                ),
                coordinate: params.getParam(
                  'coordinate',
                  ParamType.String,
                ),
                description: params.getParam(
                  'description',
                  ParamType.String,
                ),
                idCardNumber: params.getParam(
                  'idCardNumber',
                  ParamType.String,
                ),
                customerName: params.getParam(
                  'customerName',
                  ParamType.String,
                ),
                landmark: params.getParam(
                  'landmark',
                  ParamType.String,
                ),
                remark: params.getParam(
                  'remark',
                  ParamType.String,
                ),
                clockIn: params.getParam(
                  'clockIn',
                  ParamType.DateTime,
                ),
              ),
            ),
            FFRoute(
              name: 'SuperAppPage',
              path: 'superAppPage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'SuperAppPage')
                  : SuperAppPageWidget(
                      dailyText: params.getParam(
                        'dailyText',
                        ParamType.String,
                      ),
                    ),
            ),
            FFRoute(
              name: 'NotificationDetailPage',
              path: 'notificationDetailPage',
              builder: (context, params) => NotificationDetailPageWidget(),
            ),
            FFRoute(
              name: 'MyProfilePage',
              path: 'myProfilePage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'MyProfilePage')
                  : MyProfilePageWidget(),
            ),
            FFRoute(
              name: 'LeadNotiPage',
              path: 'leadNotiPage',
              builder: (context, params) => LeadNotiPageWidget(
                color: params.getParam<Color>(
                  'color',
                  ParamType.Color,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'CollectionPage',
              path: 'collectionPage',
              builder: (context, params) => CollectionPageWidget(
                coordinate: params.getParam(
                  'coordinate',
                  ParamType.String,
                ),
                idCardNumber: params.getParam(
                  'idCardNumber',
                  ParamType.String,
                ),
                contNo: params.getParam(
                  'contNo',
                  ParamType.String,
                ),
                customerName: params.getParam(
                  'customerName',
                  ParamType.String,
                ),
                remark: params.getParam(
                  'remark',
                  ParamType.String,
                ),
                recordId: params.getParam(
                  'recordId',
                  ParamType.String,
                ),
                clockIn: params.getParam(
                  'clockIn',
                  ParamType.DateTime,
                ),
              ),
            ),
            FFRoute(
              name: 'MarketingPage',
              path: 'marketingPage',
              builder: (context, params) => MarketingPageWidget(
                coordinate: params.getParam(
                  'coordinate',
                  ParamType.String,
                ),
                branchCode: params.getParam(
                  'branchCode',
                  ParamType.String,
                ),
                area: params.getParam(
                  'area',
                  ParamType.String,
                ),
                detail: params.getParam(
                  'detail',
                  ParamType.String,
                ),
                remark: params.getParam(
                  'remark',
                  ParamType.String,
                ),
                recordId: params.getParam(
                  'recordId',
                  ParamType.String,
                ),
                clockIn: params.getParam(
                  'clockIn',
                  ParamType.DateTime,
                ),
              ),
            ),
            FFRoute(
              name: 'OPSpage',
              path: 'oPSpage',
              builder: (context, params) => OPSpageWidget(
                recordId: params.getParam(
                  'recordId',
                  ParamType.String,
                ),
                coordinate: params.getParam(
                  'coordinate',
                  ParamType.String,
                ),
                branchCode: params.getParam(
                  'branchCode',
                  ParamType.String,
                ),
                asset: params.getParam(
                  'asset',
                  ParamType.String,
                ),
                assetType: params.getParam(
                  'assetType',
                  ParamType.String,
                ),
                carPlateNo: params.getParam(
                  'carPlateNo',
                  ParamType.String,
                ),
                signboardStatus: params.getParam(
                  'signboardStatus',
                  ParamType.String,
                ),
                remark: params.getParam(
                  'remark',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'CheckerPage',
              path: 'checkerPage',
              builder: (context, params) => CheckerPageWidget(
                recordId: params.getParam(
                  'recordId',
                  ParamType.String,
                ),
                coordinate: params.getParam(
                  'coordinate',
                  ParamType.String,
                ),
                idCardNumber: params.getParam(
                  'idCardNumber',
                  ParamType.String,
                ),
                contNo: params.getParam(
                  'contNo',
                  ParamType.String,
                ),
                customerName: params.getParam(
                  'customerName',
                  ParamType.String,
                ),
                remark: params.getParam(
                  'remark',
                  ParamType.String,
                ),
                clockIn: params.getParam(
                  'clockIn',
                  ParamType.DateTime,
                ),
              ),
            ),
            FFRoute(
              name: 'NPApage',
              path: 'nPApage',
              builder: (context, params) => NPApageWidget(
                recordId: params.getParam(
                  'recordId',
                  ParamType.String,
                ),
                coordinate: params.getParam(
                  'coordinate',
                  ParamType.String,
                ),
                assetId: params.getParam(
                  'assetId',
                  ParamType.String,
                ),
                remark: params.getParam(
                  'remark',
                  ParamType.String,
                ),
                clockIn: params.getParam(
                  'clockIn',
                  ParamType.DateTime,
                ),
              ),
            ),
            FFRoute(
              name: 'TimeSheetPage',
              path: 'timeSheetPage',
              builder: (context, params) => TimeSheetPageWidget(),
            ),
            FFRoute(
              name: 'ForgotPasswordPage',
              path: 'forgotPasswordPage',
              builder: (context, params) => ForgotPasswordPageWidget(),
            ),
            FFRoute(
              name: 'SuccessPage',
              path: 'successPage',
              builder: (context, params) => SuccessPageWidget(),
            ),
            FFRoute(
              name: 'FormServicePage',
              path: 'formServicePage',
              builder: (context, params) => FormServicePageWidget(
                formServiceName: params.getParam(
                  'formServiceName',
                  ParamType.String,
                ),
                formServiceUrl: params.getParam(
                  'formServiceUrl',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'GenQRPage',
              path: 'genQRPage',
              builder: (context, params) => GenQRPageWidget(),
            ),
            FFRoute(
              name: 'LeadSurveyRegisPage',
              path: 'leadSurveyRegisPage',
              builder: (context, params) => LeadSurveyRegisPageWidget(),
            ),
            FFRoute(
              name: 'SaleskitPage',
              path: 'saleskitPage',
              builder: (context, params) => SaleskitPageWidget(),
            ),
            FFRoute(
              name: 'ITSupportPage',
              path: 'iTSupportPage',
              builder: (context, params) => ITSupportPageWidget(),
            ),
            FFRoute(
              name: 'ActionLogPage',
              path: 'actionLogPage',
              builder: (context, params) => ActionLogPageWidget(),
            ),
            FFRoute(
              name: 'IntrodutionPage',
              path: 'introdutionPage',
              builder: (context, params) => IntrodutionPageWidget(),
            ),
            FFRoute(
              name: 'ReportITSupport',
              path: 'reportITSupport',
              builder: (context, params) => ReportITSupportWidget(
                recordId: params.getParam(
                  'recordId',
                  ParamType.String,
                ),
                coordinate: params.getParam(
                  'coordinate',
                  ParamType.String,
                ),
                description: params.getParam(
                  'description',
                  ParamType.String,
                ),
                idCardNumber: params.getParam(
                  'idCardNumber',
                  ParamType.String,
                ),
                customerName: params.getParam(
                  'customerName',
                  ParamType.String,
                ),
                landmark: params.getParam(
                  'landmark',
                  ParamType.String,
                ),
                remark: params.getParam(
                  'remark',
                  ParamType.String,
                ),
                clockIn: params.getParam(
                  'clockIn',
                  ParamType.DateTime,
                ),
              ),
            ),
            FFRoute(
              name: 'LeavePage',
              path: 'leavePage',
              builder: (context, params) => LeavePageWidget(),
            ),
            FFRoute(
              name: 'SuccessCheckinPage',
              path: 'successCheckinPage',
              builder: (context, params) => SuccessCheckinPageWidget(
                checkinPhoto: params.getParam(
                  'checkinPhoto',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'EmpolyeeCheckIn',
              path: 'empolyeeCheckIn',
              builder: (context, params) => EmpolyeeCheckInWidget(
                recordId: params.getParam(
                  'recordId',
                  ParamType.String,
                ),
                coordinate: params.getParam(
                  'coordinate',
                  ParamType.String,
                ),
                remark: params.getParam(
                  'remark',
                  ParamType.String,
                ),
                clockIn: params.getParam(
                  'clockIn',
                  ParamType.DateTime,
                ),
              ),
            ),
            FFRoute(
              name: 'LeaveShowPage',
              path: 'leaveShowPage',
              builder: (context, params) => LeaveShowPageWidget(),
            ),
            FFRoute(
              name: 'AddLeavePage',
              path: 'addLeavePage',
              builder: (context, params) => AddLeavePageWidget(
                leaveType: params.getParam(
                  'leaveType',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'CancelPage',
              path: 'cancelPage',
              builder: (context, params) => CancelPageWidget(
                leaveId: params.getParam(
                  'leaveId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'ApprovedLeavePage',
              path: 'approvedLeavePage',
              builder: (context, params) => ApprovedLeavePageWidget(),
            ),
            FFRoute(
              name: 'CheckInsurancePage',
              path: 'checkInsurancePage',
              builder: (context, params) => CheckInsurancePageWidget(),
            ),
            FFRoute(
              name: 'Check_1InsurancePage',
              path: 'check1InsurancePage',
              builder: (context, params) => Check1InsurancePageWidget(
                brandCode: params.getParam(
                  'brandCode',
                  ParamType.String,
                ),
                modelCode: params.getParam(
                  'modelCode',
                  ParamType.String,
                ),
                year: params.getParam(
                  'year',
                  ParamType.String,
                ),
                province: params.getParam(
                  'province',
                  ParamType.String,
                ),
                driver: params.getParam(
                  'driver',
                  ParamType.String,
                ),
                vehicleUsage: params.getParam(
                  'vehicleUsage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'ConfirmEmailPage',
              path: 'confirmEmailPage',
              builder: (context, params) => ConfirmEmailPageWidget(),
            ),
            FFRoute(
              name: 'InfoCheckin',
              path: 'infoCheckin',
              builder: (context, params) => InfoCheckinWidget(
                checkinLocation: params.getParam(
                  'checkinLocation',
                  ParamType.LatLng,
                ),
                date: params.getParam(
                  'date',
                  ParamType.String,
                ),
                checkinTime: params.getParam(
                  'checkinTime',
                  ParamType.String,
                ),
                checkoutTime: params.getParam(
                  'checkoutTime',
                  ParamType.String,
                ),
                status: params.getParam(
                  'status',
                  ParamType.String,
                ),
                colorStatus: params.getParam(
                  'colorStatus',
                  ParamType.Color,
                ),
                checkinLatitude: params.getParam(
                  'checkinLatitude',
                  ParamType.String,
                ),
                checkinLongitude: params.getParam(
                  'checkinLongitude',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'ListInsurancPage',
              path: 'listInsurancPage',
              builder: (context, params) => ListInsurancPageWidget(),
            ),
            FFRoute(
              name: 'FindPlacePage',
              path: 'findPlacePage',
              builder: (context, params) => FindPlacePageWidget(),
            ),
            FFRoute(
              name: 'DetailInsurancePage',
              path: 'detailInsurancePage',
              builder: (context, params) => DetailInsurancePageWidget(
                fullName: params.getParam(
                  'fullName',
                  ParamType.String,
                ),
                coverType: params.getParam(
                  'coverType',
                  ParamType.String,
                ),
                garageType: params.getParam(
                  'garageType',
                  ParamType.String,
                ),
                grossTotal: params.getParam(
                  'grossTotal',
                  ParamType.String,
                ),
                sumInsured: params.getParam(
                  'sumInsured',
                  ParamType.String,
                ),
                tppd: params.getParam(
                  'tppd',
                  ParamType.String,
                ),
                pa: params.getParam(
                  'pa',
                  ParamType.String,
                ),
                actAmount: params.getParam(
                  'actAmount',
                  ParamType.String,
                ),
                expiryDate: params.getParam(
                  'expiryDate',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'DashboardITSupport',
              path: 'dashboardITSupport',
              builder: (context, params) => DashboardITSupportWidget(
                jwtToken: params.getParam(
                  'jwtToken',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'CheckInStatusPage',
              path: 'checkInStatusPage',
              builder: (context, params) => CheckInStatusPageWidget(
                checkinImage: params.getParam(
                  'checkinImage',
                  ParamType.String,
                ),
                date: params.getParam<String>(
                  'date',
                  ParamType.String,
                  isList: true,
                ),
                checkinTimeIn: params.getParam<String>(
                  'checkinTimeIn',
                  ParamType.String,
                  isList: true,
                ),
                checkinTimeOut: params.getParam<String>(
                  'checkinTimeOut',
                  ParamType.String,
                  isList: true,
                ),
                checkinLastMonthDate: params.getParam<String>(
                  'checkinLastMonthDate',
                  ParamType.String,
                  isList: true,
                ),
                checkinLastMonthTimeIn: params.getParam<String>(
                  'checkinLastMonthTimeIn',
                  ParamType.String,
                  isList: true,
                ),
                checkinLastMonthTimeOut: params.getParam<String>(
                  'checkinLastMonthTimeOut',
                  ParamType.String,
                  isList: true,
                ),
                holidayDate: params.getParam<String>(
                  'holidayDate',
                  ParamType.String,
                  isList: true,
                ),
                holidayName: params.getParam<String>(
                  'holidayName',
                  ParamType.String,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'CategorySupport',
              path: 'categorySupport',
              builder: (context, params) => CategorySupportWidget(
                jwtToken: params.getParam(
                  'jwtToken',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'ReportList',
              path: 'reportList',
              builder: (context, params) => ReportListWidget(),
            ),
            FFRoute(
              name: 'InfoReport',
              path: 'infoReport',
              builder: (context, params) => InfoReportWidget(),
            ),
            FFRoute(
              name: 'CheckInStatusPageCopy',
              path: 'checkInStatusPageCopy',
              builder: (context, params) => CheckInStatusPageCopyWidget(
                checkinImage: params.getParam(
                  'checkinImage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'DashboardCheckin',
              path: 'dashboardCheckin',
              builder: (context, params) => DashboardCheckinWidget(
                jwtToken: params.getParam(
                  'jwtToken',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'PromotionPage',
              path: 'promotionPage',
              builder: (context, params) => PromotionPageWidget(),
            ),
            FFRoute(
              name: 'EmployeeKPIPage',
              path: 'employeeKPIPage',
              builder: (context, params) => EmployeeKPIPageWidget(),
            ),
            FFRoute(
              name: 'GuideBookPage',
              path: 'guideBookPage',
              builder: (context, params) => GuideBookPageWidget(),
            ),
            FFRoute(
              name: 'AddResignPage',
              path: 'addResignPage',
              builder: (context, params) => AddResignPageWidget(
                isFromDashboard: params.getParam(
                  'isFromDashboard',
                  ParamType.bool,
                ),
                endDate: params.getParam(
                  'endDate',
                  ParamType.String,
                ),
                resignReason: params.getParam(
                  'resignReason',
                  ParamType.String,
                ),
                resignReasonEtc: params.getParam(
                  'resignReasonEtc',
                  ParamType.String,
                ),
                leaveReason: params.getParam(
                  'leaveReason',
                  ParamType.String,
                ),
                privince: params.getParam(
                  'privince',
                  ParamType.String,
                ),
                district: params.getParam(
                  'district',
                  ParamType.String,
                ),
                postCode: params.getParam(
                  'postCode',
                  ParamType.String,
                ),
                batchRoad: params.getParam(
                  'batchRoad',
                  ParamType.String,
                ),
                phone: params.getParam(
                  'phone',
                  ParamType.String,
                ),
                willComeBack: params.getParam(
                  'willComeBack',
                  ParamType.String,
                ),
                asset: params.getParam(
                  'asset',
                  ParamType.String,
                ),
                assetEtc: params.getParam(
                  'assetEtc',
                  ParamType.String,
                ),
                subdistrict: params.getParam(
                  'subdistrict',
                  ParamType.String,
                ),
                leaveListId: params.getParam(
                  'leaveListId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'DashboardLeavePage',
              path: 'dashboardLeavePage',
              builder: (context, params) => DashboardLeavePageWidget(
                jwtToken: params.getParam(
                  'jwtToken',
                  ParamType.String,
                ),
                param1: params.getParam(
                  'param1',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'ApproveShowPage',
              path: 'approveShowPage',
              builder: (context, params) => ApproveShowPageWidget(),
            ),
            FFRoute(
              name: 'AddResignPageCopy',
              path: 'addResignPageCopy',
              builder: (context, params) => AddResignPageCopyWidget(),
            ),
            FFRoute(
              name: 'EditLeavePage',
              path: 'editLeavePage',
              builder: (context, params) => EditLeavePageWidget(
                leaveType: params.getParam(
                  'leaveType',
                  ParamType.String,
                ),
                leavePeriod: params.getParam(
                  'leavePeriod',
                  ParamType.String,
                ),
                leaveDay: params.getParam(
                  'leaveDay',
                  ParamType.String,
                ),
                leaveReason: params.getParam(
                  'leaveReason',
                  ParamType.String,
                ),
                leaveListID: params.getParam(
                  'leaveListID',
                  ParamType.String,
                ),
                leaveDate: params.getParam(
                  'leaveDate',
                  ParamType.String,
                ),
                userPhoneNumber: params.getParam(
                  'userPhoneNumber',
                  ParamType.String,
                ),
                leaveDocumentOld: params.getParam<String>(
                  'leaveDocumentOld',
                  ParamType.String,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'FormItSupport',
              path: 'formItSupport',
              builder: (context, params) => FormItSupportWidget(
                fixType: params.getParam(
                  'fixType',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'SumPointPage',
              path: 'sumPointPage',
              builder: (context, params) => SumPointPageWidget(),
            ),
            FFRoute(
              name: 'QuotaPointPage',
              path: 'quotaPointPage',
              builder: (context, params) => QuotaPointPageWidget(),
            ),
            FFRoute(
              name: 'WelfareKPIPage',
              path: 'welfareKPIPage',
              builder: (context, params) => WelfareKPIPageWidget(),
            ),
            FFRoute(
              name: 'GivePointPage',
              path: 'givePointPage',
              builder: (context, params) => GivePointPageWidget(),
            ),
            FFRoute(
              name: 'InsurancePlan',
              path: 'insurancePlan',
              builder: (context, params) => InsurancePlanWidget(
                planInsurance: params.getParam(
                  'planInsurance',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'QuestionnaireSurvey',
              path: 'questionnaireSurvey',
              builder: (context, params) => QuestionnaireSurveyWidget(),
            ),
            FFRoute(
              name: 'PhoneNumberInfo',
              path: 'phoneNumberInfo',
              builder: (context, params) => PhoneNumberInfoWidget(),
            ),
            FFRoute(
              name: 'E-learning',
              path: 'eLearning',
              builder: (context, params) => ELearningWidget(),
            ),
            FFRoute(
              name: 'supportTemplate',
              path: 'supportTemplate',
              builder: (context, params) => SupportTemplateWidget(),
            ),
            FFRoute(
              name: 'htmlPage',
              path: 'htmlPage',
              builder: (context, params) => HtmlPageWidget(
                contentHtml: params.getParam(
                  'contentHtml',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'EmployeeKpiCEOPage',
              path: 'employeeKpiCEOPage',
              builder: (context, params) => EmployeeKpiCEOPageWidget(),
            ),
            FFRoute(
              name: 'WelfareKPICEOPage',
              path: 'welfareKPICEOPage',
              builder: (context, params) => WelfareKPICEOPageWidget(),
            ),
            FFRoute(
              name: 'ertert',
              path: 'ertert',
              builder: (context, params) => ErtertWidget(),
            ),
            FFRoute(
              name: 'InspocPage',
              path: 'inspocPage',
              builder: (context, params) => InspocPageWidget(),
            ),
            FFRoute(
              name: 'ChangeLatLngPage',
              path: 'changeLatLngPage',
              builder: (context, params) => ChangeLatLngPageWidget(),
            ),
            FFRoute(
              name: 'ClassroomPage',
              path: 'classroomPage',
              builder: (context, params) => ClassroomPageWidget(),
            ),
            FFRoute(
              name: 'testCircleMap',
              path: 'testCircleMap',
              builder: (context, params) => TestCircleMapWidget(),
            ),
            FFRoute(
              name: 'redeemPointPage',
              path: 'redeemPointPage',
              builder: (context, params) => RedeemPointPageWidget(
                jwtToken: params.getParam(
                  'jwtToken',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'PlanningSelfKPI',
              path: 'planningSelfKPI',
              builder: (context, params) => PlanningSelfKPIWidget(),
            ),
            FFRoute(
              name: 'ThaipaiboonPage',
              path: 'thaipaiboonPage',
              builder: (context, params) => ThaipaiboonPageWidget(),
            ),
            FFRoute(
              name: 'LeaveShowPageCopy',
              path: 'leaveShowPageCopy',
              builder: (context, params) => LeaveShowPageCopyWidget(),
            ),
            FFRoute(
              name: 'LifeInsuranceLicenseCardPage',
              path: 'lifeInsuranceLicenseCardPage',
              builder: (context, params) => LifeInsuranceLicenseCardPageWidget(
                index: params.getParam(
                  'index',
                  ParamType.int,
                ),
                insuranceName: params.getParam(
                  'insuranceName',
                  ParamType.String,
                ),
                insuranceType: params.getParam(
                  'insuranceType',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'ChangeLatLngPageWeb',
              path: 'changeLatLngPageWeb',
              builder: (context, params) => ChangeLatLngPageWebWidget(
                token: params.getParam(
                  'token',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'ChatSearchPage',
              path: 'chatSearchPage',
              builder: (context, params) => ChatSearchPageWidget(),
            ),
            FFRoute(
              name: 'ChatHomePage',
              path: 'chatHomePage',
              builder: (context, params) => ChatHomePageWidget(),
            ),
            FFRoute(
              name: 'ChattingPage',
              path: 'chattingPage',
              builder: (context, params) => ChattingPageWidget(
                userBProfileImage: params.getParam(
                  'userBProfileImage',
                  ParamType.String,
                ),
                userBDocRef: params.getParam(
                  'userBDocRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['user_custom'],
                ),
                userBName: params.getParam(
                  'userBName',
                  ParamType.String,
                ),
                userBNickname: params.getParam(
                  'userBNickname',
                  ParamType.String,
                ),
                userBEmployeeId: params.getParam(
                  'userBEmployeeId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'InsuranceRequestInsurerPage',
              path: 'InsuranceRequestPageCopy',
              builder: (context, params) => InsuranceRequestInsurerPageWidget(),
            ),
            FFRoute(
              name: 'InsuranceRequestImagePage',
              path: 'InsuranceRequestImagePage',
              builder: (context, params) => InsuranceRequestImagePageWidget(),
            ),
            FFRoute(
              name: 'InsuranceRequestBasicPage',
              path: 'InsuranceRequestBasicPage',
              builder: (context, params) => InsuranceRequestBasicPageWidget(),
            ),
            FFRoute(
              name: 'InsuranceRequestListPage',
              path: 'InsuranceRequestListPage',
              builder: (context, params) => InsuranceRequestListPageWidget(),
            ),
            FFRoute(
              name: 'InsuranceRequestDashboardPage',
              path: 'insuranceRequestDashboardPage',
              builder: (context, params) => InsuranceRequestDashboardPageWidget(
                jwtToken: params.getParam(
                  'jwtToken',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'InsuranceRequestEditPage',
              path: 'InsuranceRequestEditPage',
              builder: (context, params) => InsuranceRequestEditPageWidget(
                leadId: params.getParam(
                  'leadId',
                  ParamType.String,
                ),
                leadNo: params.getParam(
                  'leadNo',
                  ParamType.String,
                ),
                idCardNumber: params.getParam(
                  'idCardNumber',
                  ParamType.String,
                ),
                firstname: params.getParam(
                  'firstname',
                  ParamType.String,
                ),
                lastname: params.getParam(
                  'lastname',
                  ParamType.String,
                ),
                phoneNumber: params.getParam(
                  'phoneNumber',
                  ParamType.String,
                ),
                carType: params.getParam(
                  'carType',
                  ParamType.String,
                ),
                brandName: params.getParam(
                  'brandName',
                  ParamType.String,
                ),
                modelName: params.getParam(
                  'modelName',
                  ParamType.String,
                ),
                provinceName: params.getParam(
                  'provinceName',
                  ParamType.String,
                ),
                plateNo: params.getParam(
                  'plateNo',
                  ParamType.String,
                ),
                year: params.getParam(
                  'year',
                  ParamType.String,
                ),
                vehicleTypeCode: params.getParam(
                  'vehicleTypeCode',
                  ParamType.String,
                ),
                flagRenew: params.getParam(
                  'flagRenew',
                  ParamType.String,
                ),
                oldVmiPolicyNumber: params.getParam(
                  'oldVmiPolicyNumber',
                  ParamType.String,
                ),
                flagDecoration: params.getParam(
                  'flagDecoration',
                  ParamType.String,
                ),
                decorationDetail: params.getParam(
                  'decorationDetail',
                  ParamType.String,
                ),
                flagCarrier: params.getParam(
                  'flagCarrier',
                  ParamType.String,
                ),
                flagCoop: params.getParam(
                  'flagCoop',
                  ParamType.String,
                ),
                carrierType: params.getParam(
                  'carrierType',
                  ParamType.String,
                ),
                carrierPrice: params.getParam(
                  'carrierPrice',
                  ParamType.String,
                ),
                customerType: params.getParam(
                  'customerType',
                  ParamType.String,
                ),
                truckPart: params.getParam(
                  'truckPart',
                  ParamType.String,
                ),
                customerMemberchip: params.getParam(
                  'customerMemberchip',
                  ParamType.String,
                ),
                trailerPlateNo: params.getParam(
                  'trailerPlateNo',
                  ParamType.String,
                ),
                carrierPropose: params.getParam(
                  'carrierPropose',
                  ParamType.String,
                ),
                remark: params.getParam(
                  'remark',
                  ParamType.String,
                ),
                trailerSumInsured: params.getParam(
                  'trailerSumInsured',
                  ParamType.String,
                ),
                flagAct: params.getParam(
                  'flagAct',
                  ParamType.String,
                ),
                truckCurrentPrice: params.getParam(
                  'truckCurrentPrice',
                  ParamType.String,
                ),
                sumInsured: params.getParam(
                  'sumInsured',
                  ParamType.String,
                ),
                insurerShortNameList: params.getParam<String>(
                  'insurerShortNameList',
                  ParamType.String,
                  isList: true,
                ),
                insurerNameList: params.getParam<String>(
                  'insurerNameList',
                  ParamType.String,
                  isList: true,
                ),
                coverTypeNameList: params.getParam(
                  'coverTypeNameList',
                  ParamType.String,
                ),
                garageTypeName: params.getParam(
                  'garageTypeName',
                  ParamType.String,
                ),
                imageFront: params.getParam<String>(
                  'imageFront',
                  ParamType.String,
                  isList: true,
                ),
                imageRear: params.getParam<String>(
                  'imageRear',
                  ParamType.String,
                  isList: true,
                ),
                imageLeft: params.getParam<String>(
                  'imageLeft',
                  ParamType.String,
                  isList: true,
                ),
                imageRight: params.getParam<String>(
                  'imageRight',
                  ParamType.String,
                  isList: true,
                ),
                imageRightFront: params.getParam<String>(
                  'imageRightFront',
                  ParamType.String,
                  isList: true,
                ),
                imageRightRear: params.getParam<String>(
                  'imageRightRear',
                  ParamType.String,
                  isList: true,
                ),
                imageLeftFront: params.getParam<String>(
                  'imageLeftFront',
                  ParamType.String,
                  isList: true,
                ),
                imageLeftRear: params.getParam<String>(
                  'imageLeftRear',
                  ParamType.String,
                  isList: true,
                ),
                imageRoof: params.getParam<String>(
                  'imageRoof',
                  ParamType.String,
                  isList: true,
                ),
                imageFrontTrailer: params.getParam<String>(
                  'imageFrontTrailer',
                  ParamType.String,
                  isList: true,
                ),
                imageRearTrailer: params.getParam<String>(
                  'imageRearTrailer',
                  ParamType.String,
                  isList: true,
                ),
                imageLeftTrailer: params.getParam<String>(
                  'imageLeftTrailer',
                  ParamType.String,
                  isList: true,
                ),
                imageRightTrailer: params.getParam<String>(
                  'imageRightTrailer',
                  ParamType.String,
                  isList: true,
                ),
                imageRightFrontTrailer: params.getParam<String>(
                  'imageRightFrontTrailer',
                  ParamType.String,
                  isList: true,
                ),
                imageRightRearTrailer: params.getParam<String>(
                  'imageRightRearTrailer',
                  ParamType.String,
                  isList: true,
                ),
                imageLeftFrontTrailer: params.getParam<String>(
                  'imageLeftFrontTrailer',
                  ParamType.String,
                  isList: true,
                ),
                imageLeftRearTrailer: params.getParam<String>(
                  'imageLeftRearTrailer',
                  ParamType.String,
                  isList: true,
                ),
                imageBlueBook: params.getParam<String>(
                  'imageBlueBook',
                  ParamType.String,
                  isList: true,
                ),
                imageIdCard: params.getParam<String>(
                  'imageIdCard',
                  ParamType.String,
                  isList: true,
                ),
                imageOther: params.getParam<dynamic>(
                  'imageOther',
                  ParamType.JSON,
                  isList: true,
                ),
                imageOtherName: params.getParam<String>(
                  'imageOtherName',
                  ParamType.String,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'inboxEmail',
              path: 'inboxEmail',
              builder: (context, params) => InboxEmailWidget(),
            ),
            FFRoute(
              name: 'SearchInsurancePage',
              path: 'searchInsurancePage',
              builder: (context, params) => SearchInsurancePageWidget(
                recordId: params.getParam(
                  'recordId',
                  ParamType.String,
                ),
                coordinate: params.getParam(
                  'coordinate',
                  ParamType.String,
                ),
                description: params.getParam(
                  'description',
                  ParamType.String,
                ),
                idCardNumber: params.getParam(
                  'idCardNumber',
                  ParamType.String,
                ),
                customerName: params.getParam(
                  'customerName',
                  ParamType.String,
                ),
                landmark: params.getParam(
                  'landmark',
                  ParamType.String,
                ),
                remark: params.getParam(
                  'remark',
                  ParamType.String,
                ),
                clockIn: params.getParam(
                  'clockIn',
                  ParamType.DateTime,
                ),
              ),
            ),
            FFRoute(
              name: 'AboutUsPage',
              path: 'aboutUsPage',
              builder: (context, params) => AboutUsPageWidget(
                recordId: params.getParam(
                  'recordId',
                  ParamType.String,
                ),
                coordinate: params.getParam(
                  'coordinate',
                  ParamType.String,
                ),
                description: params.getParam(
                  'description',
                  ParamType.String,
                ),
                idCardNumber: params.getParam(
                  'idCardNumber',
                  ParamType.String,
                ),
                customerName: params.getParam(
                  'customerName',
                  ParamType.String,
                ),
                landmark: params.getParam(
                  'landmark',
                  ParamType.String,
                ),
                remark: params.getParam(
                  'remark',
                  ParamType.String,
                ),
                clockIn: params.getParam(
                  'clockIn',
                  ParamType.DateTime,
                ),
              ),
            ),
            FFRoute(
              name: 'ContactUsPage',
              path: 'contactUsPage',
              builder: (context, params) => ContactUsPageWidget(
                recordId: params.getParam(
                  'recordId',
                  ParamType.String,
                ),
                coordinate: params.getParam(
                  'coordinate',
                  ParamType.String,
                ),
                description: params.getParam(
                  'description',
                  ParamType.String,
                ),
                idCardNumber: params.getParam(
                  'idCardNumber',
                  ParamType.String,
                ),
                customerName: params.getParam(
                  'customerName',
                  ParamType.String,
                ),
                landmark: params.getParam(
                  'landmark',
                  ParamType.String,
                ),
                remark: params.getParam(
                  'remark',
                  ParamType.String,
                ),
                clockIn: params.getParam(
                  'clockIn',
                  ParamType.DateTime,
                ),
              ),
            ),
            FFRoute(
              name: 'IBSReport',
              path: 'iBSReport',
              builder: (context, params) => IBSReportWidget(
                employeeId: params.getParam(
                  'employeeId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'KPIAllCEOPage',
              path: 'kPIAllCEOPage',
              builder: (context, params) => KPIAllCEOPageWidget(),
            ),
            FFRoute(
              name: 'BsiReportPage',
              path: 'bsiReportPage',
              builder: (context, params) => BsiReportPageWidget(),
            ),
            FFRoute(
              name: 'listNameTabFollowUpDebt',
              path: 'listNameTabFollowUpDebt',
              builder: (context, params) => ListNameTabFollowUpDebtWidget(
                followUpDebtTab: params.getParam(
                  'followUpDebtTab',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: 'RecordVideoWebviewPage',
              path: 'RecordVideoWebviewPage',
              builder: (context, params) => RecordVideoWebviewPageWidget(
                webUrl: params.getParam(
                  'webUrl',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'detailListFollowUpDebt',
              path: 'detailListFollowUpDebt',
              builder: (context, params) => DetailListFollowUpDebtWidget(
                cusCod: params.getParam(
                  'cusCod',
                  ParamType.String,
                ),
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
                lastName: params.getParam(
                  'lastName',
                  ParamType.String,
                ),
                followupDebtTab: params.getParam(
                  'followupDebtTab',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: 'saveOnSiteFollowUpDebt',
              path: 'saveOnSiteFollowUpDebt',
              builder: (context, params) => SaveOnSiteFollowUpDebtWidget(
                firstname: params.getParam(
                  'firstname',
                  ParamType.String,
                ),
                lastname: params.getParam(
                  'lastname',
                  ParamType.String,
                ),
                contNo: params.getParam(
                  'contNo',
                  ParamType.String,
                ),
                dateOfExp: params.getParam(
                  'dateOfExp',
                  ParamType.String,
                ),
                tragetStat: params.getParam(
                  'tragetStat',
                  ParamType.String,
                ),
                contStat: params.getParam(
                  'contStat',
                  ParamType.String,
                ),
                expAmt: params.getParam(
                  'expAmt',
                  ParamType.String,
                ),
                cusCode: params.getParam(
                  'cusCode',
                  ParamType.String,
                ),
                database: params.getParam(
                  'database',
                  ParamType.String,
                ),
                expFrm: params.getParam(
                  'expFrm',
                  ParamType.String,
                ),
                dateOfDue: params.getParam(
                  'dateOfDue',
                  ParamType.String,
                ),
                followupDebtTab: params.getParam(
                  'followupDebtTab',
                  ParamType.int,
                ),
                dateOfData: params.getParam(
                  'dateOfData',
                  ParamType.String,
                ),
                sumCurrentDueAmt: params.getParam(
                  'sumCurrentDueAmt',
                  ParamType.String,
                ),
                lastPayDate: params.getParam(
                  'lastPayDate',
                  ParamType.String,
                ),
                historyCount: params.getParam(
                  'historyCount',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'saveCallFollowUpDebt',
              path: 'saveCallFollowUpDebt',
              builder: (context, params) => SaveCallFollowUpDebtWidget(
                name1: params.getParam(
                  'name1',
                  ParamType.String,
                ),
                name2: params.getParam(
                  'name2',
                  ParamType.String,
                ),
                countNo: params.getParam<String>(
                  'countNo',
                  ParamType.String,
                  isList: true,
                ),
                dateOfExp: params.getParam<String>(
                  'dateOfExp',
                  ParamType.String,
                  isList: true,
                ),
                targetStat: params.getParam<String>(
                  'targetStat',
                  ParamType.String,
                  isList: true,
                ),
                contStat: params.getParam<String>(
                  'contStat',
                  ParamType.String,
                  isList: true,
                ),
                expAmt: params.getParam<String>(
                  'expAmt',
                  ParamType.String,
                  isList: true,
                ),
                id: params.getParam<String>(
                  'id',
                  ParamType.String,
                  isList: true,
                ),
                expFrm: params.getParam<String>(
                  'expFrm',
                  ParamType.String,
                  isList: true,
                ),
                dateOfDue: params.getParam<String>(
                  'dateOfDue',
                  ParamType.String,
                  isList: true,
                ),
                followupDebtTab: params.getParam(
                  'followupDebtTab',
                  ParamType.int,
                ),
                dateOfData: params.getParam<String>(
                  'dateOfData',
                  ParamType.String,
                  isList: true,
                ),
                sumCurrentDueAmt: params.getParam<String>(
                  'sumCurrentDueAmt',
                  ParamType.String,
                  isList: true,
                ),
                lastPayDate: params.getParam<String>(
                  'lastPayDate',
                  ParamType.String,
                  isList: true,
                ),
                historyCount: params.getParam<String>(
                  'historyCount',
                  ParamType.String,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'recordFollowUpDebt',
              path: 'recordFollowUpDebt',
              builder: (context, params) => RecordFollowUpDebtWidget(
                contNo: params.getParam(
                  'contNo',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'successPageCollecction',
              path: 'successPageCollecction',
              builder: (context, params) => SuccessPageCollecctionWidget(),
            ),
            FFRoute(
              name: 'tabCollection',
              path: 'tabCollection',
              builder: (context, params) => TabCollectionWidget(),
            ),
            FFRoute(
              name: 'SearchCollectionPage',
              path: 'SearchCollectionPage',
              builder: (context, params) => SearchCollectionPageWidget(
                followUpDebtTab: params.getParam(
                  'followUpDebtTab',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: 'SearchCollectionPP',
              path: 'SearchCollectionPP',
              builder: (context, params) => SearchCollectionPPWidget(
                followUpDebtTab: params.getParam(
                  'followUpDebtTab',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: 'register',
              path: 'register',
              builder: (context, params) => RegisterWidget(),
            ),
            FFRoute(
              name: 'InterestPage',
              path: 'InterestPage',
              builder: (context, params) => InterestPageWidget(
                contno: params.getParam(
                  'contno',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'QRCode',
              path: 'QRCode',
              builder: (context, params) => QRCodeWidget(
                followUpDebtTab: params.getParam(
                  'followUpDebtTab',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: 'RecordVideoPage',
              path: 'recordVideoPage',
              builder: (context, params) => RecordVideoPageWidget(),
            ),
            FFRoute(
              name: 'RecordVideoCustomer',
              path: 'recordVideoCustomer',
              builder: (context, params) => RecordVideoCustomerWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/SplashLoadingApp.png',
                    fit: BoxFit.cover,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
