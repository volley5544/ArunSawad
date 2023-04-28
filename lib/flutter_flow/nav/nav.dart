import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';

import '../../auth/base_auth_user_provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
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
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
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
      errorBuilder: (context, _) =>
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
                apiURL: params.getParam('apiURL', ParamType.DocumentReference,
                    false, ['Key_Storage']),
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
                jwtToken: params.getParam('jwtToken', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'SuperAppPage',
              path: 'superAppPage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'SuperAppPage')
                  : SuperAppPageWidget(
                      dailyText: params.getParam('dailyText', ParamType.String),
                    ),
            ),
            FFRoute(
              name: 'CheckInPage',
              path: 'checkInPage',
              asyncParams: {
                'location1': getDoc(['city'], CityRecord.serializer),
              },
              builder: (context, params) => CheckInPageWidget(
                location1: params.getParam('location1', ParamType.Document),
                recordId: params.getParam('recordId', ParamType.String),
                coordinate: params.getParam('coordinate', ParamType.String),
                remark: params.getParam('remark', ParamType.String),
                clockIn: params.getParam('clockIn', ParamType.DateTime),
              ),
            ),
            FFRoute(
              name: 'SurveyPage',
              path: 'surveyPage',
              asyncParams: {
                'location1': getDoc(['city'], CityRecord.serializer),
              },
              builder: (context, params) => SurveyPageWidget(
                location1: params.getParam('location1', ParamType.Document),
                recordId: params.getParam('recordId', ParamType.String),
                coordinate: params.getParam('coordinate', ParamType.String),
                description: params.getParam('description', ParamType.String),
                idCardNumber: params.getParam('idCardNumber', ParamType.String),
                customerName: params.getParam('customerName', ParamType.String),
                landmark: params.getParam('landmark', ParamType.String),
                remark: params.getParam('remark', ParamType.String),
                clockIn: params.getParam('clockIn', ParamType.DateTime),
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
                color: params.getParam<Color>('color', ParamType.Color, true),
              ),
            ),
            FFRoute(
              name: 'CollectionPage',
              path: 'collectionPage',
              asyncParams: {
                'location1': getDoc(['city'], CityRecord.serializer),
              },
              builder: (context, params) => CollectionPageWidget(
                location1: params.getParam('location1', ParamType.Document),
                coordinate: params.getParam('coordinate', ParamType.String),
                idCardNumber: params.getParam('idCardNumber', ParamType.String),
                contNo: params.getParam('contNo', ParamType.String),
                customerName: params.getParam('customerName', ParamType.String),
                remark: params.getParam('remark', ParamType.String),
                recordId: params.getParam('recordId', ParamType.String),
                clockIn: params.getParam('clockIn', ParamType.DateTime),
              ),
            ),
            FFRoute(
              name: 'MarketingPage',
              path: 'marketingPage',
              asyncParams: {
                'location1': getDoc(['city'], CityRecord.serializer),
              },
              builder: (context, params) => MarketingPageWidget(
                location1: params.getParam('location1', ParamType.Document),
                coordinate: params.getParam('coordinate', ParamType.String),
                branchCode: params.getParam('branchCode', ParamType.String),
                area: params.getParam('area', ParamType.String),
                detail: params.getParam('detail', ParamType.String),
                remark: params.getParam('remark', ParamType.String),
                recordId: params.getParam('recordId', ParamType.String),
                clockIn: params.getParam('clockIn', ParamType.DateTime),
              ),
            ),
            FFRoute(
              name: 'OPSpage',
              path: 'oPSpage',
              asyncParams: {
                'location1': getDoc(['city'], CityRecord.serializer),
              },
              builder: (context, params) => OPSpageWidget(
                location1: params.getParam('location1', ParamType.Document),
                recordId: params.getParam('recordId', ParamType.String),
                coordinate: params.getParam('coordinate', ParamType.String),
                branchCode: params.getParam('branchCode', ParamType.String),
                asset: params.getParam('asset', ParamType.String),
                assetType: params.getParam('assetType', ParamType.String),
                carPlateNo: params.getParam('carPlateNo', ParamType.String),
                signboardStatus:
                    params.getParam('signboardStatus', ParamType.String),
                remark: params.getParam('remark', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'CheckerPage',
              path: 'checkerPage',
              asyncParams: {
                'location1': getDoc(['city'], CityRecord.serializer),
              },
              builder: (context, params) => CheckerPageWidget(
                location1: params.getParam('location1', ParamType.Document),
                recordId: params.getParam('recordId', ParamType.String),
                coordinate: params.getParam('coordinate', ParamType.String),
                idCardNumber: params.getParam('idCardNumber', ParamType.String),
                contNo: params.getParam('contNo', ParamType.String),
                customerName: params.getParam('customerName', ParamType.String),
                remark: params.getParam('remark', ParamType.String),
                clockIn: params.getParam('clockIn', ParamType.DateTime),
              ),
            ),
            FFRoute(
              name: 'NPApage',
              path: 'nPApage',
              asyncParams: {
                'location1': getDoc(['city'], CityRecord.serializer),
              },
              builder: (context, params) => NPApageWidget(
                location1: params.getParam('location1', ParamType.Document),
                recordId: params.getParam('recordId', ParamType.String),
                coordinate: params.getParam('coordinate', ParamType.String),
                assetId: params.getParam('assetId', ParamType.String),
                remark: params.getParam('remark', ParamType.String),
                clockIn: params.getParam('clockIn', ParamType.DateTime),
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
              name: 'MarketingPageCopy',
              path: 'marketingPageCopy',
              asyncParams: {
                'location1': getDoc(['city'], CityRecord.serializer),
                'materialID': getDoc(['material'], MaterialRecord.serializer),
              },
              builder: (context, params) => MarketingPageCopyWidget(
                location1: params.getParam('location1', ParamType.Document),
                materialID: params.getParam('materialID', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'CheckInPageCopy',
              path: 'checkInPageCopy',
              asyncParams: {
                'location1': getDoc(['city'], CityRecord.serializer),
              },
              builder: (context, params) => CheckInPageCopyWidget(
                location1: params.getParam('location1', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'NPApageCopy',
              path: 'nPApageCopy',
              asyncParams: {
                'location1': getDoc(['city'], CityRecord.serializer),
              },
              builder: (context, params) => NPApageCopyWidget(
                location1: params.getParam('location1', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'OPSpageCopy',
              path: 'oPSpageCopy',
              asyncParams: {
                'location1': getDoc(['city'], CityRecord.serializer),
              },
              builder: (context, params) => OPSpageCopyWidget(
                location1: params.getParam('location1', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'FormServicePage',
              path: 'formServicePage',
              builder: (context, params) => FormServicePageWidget(
                formServiceName:
                    params.getParam('formServiceName', ParamType.String),
                formServiceUrl:
                    params.getParam('formServiceUrl', ParamType.String),
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
              asyncParams: {
                'location1': getDoc(['city'], CityRecord.serializer),
              },
              builder: (context, params) => ReportITSupportWidget(
                location1: params.getParam('location1', ParamType.Document),
                recordId: params.getParam('recordId', ParamType.String),
                coordinate: params.getParam('coordinate', ParamType.String),
                description: params.getParam('description', ParamType.String),
                idCardNumber: params.getParam('idCardNumber', ParamType.String),
                customerName: params.getParam('customerName', ParamType.String),
                landmark: params.getParam('landmark', ParamType.String),
                remark: params.getParam('remark', ParamType.String),
                clockIn: params.getParam('clockIn', ParamType.DateTime),
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
                checkinPhoto: params.getParam('checkinPhoto', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'EmpolyeeCheckIn',
              path: 'empolyeeCheckIn',
              asyncParams: {
                'location1': getDoc(['city'], CityRecord.serializer),
              },
              builder: (context, params) => EmpolyeeCheckInWidget(
                location1: params.getParam('location1', ParamType.Document),
                recordId: params.getParam('recordId', ParamType.String),
                coordinate: params.getParam('coordinate', ParamType.String),
                remark: params.getParam('remark', ParamType.String),
                clockIn: params.getParam('clockIn', ParamType.DateTime),
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
                leaveType: params.getParam('leaveType', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'CancelPage',
              path: 'cancelPage',
              builder: (context, params) => CancelPageWidget(
                leaveId: params.getParam('leaveId', ParamType.String),
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
                brandCode: params.getParam('brandCode', ParamType.String),
                modelCode: params.getParam('modelCode', ParamType.String),
                year: params.getParam('year', ParamType.String),
                province: params.getParam('province', ParamType.String),
                driver: params.getParam('driver', ParamType.String),
                vehicleUsage: params.getParam('vehicleUsage', ParamType.String),
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
                checkinLocation:
                    params.getParam('checkinLocation', ParamType.LatLng),
                date: params.getParam('date', ParamType.String),
                checkinTime: params.getParam('checkinTime', ParamType.String),
                checkoutTime: params.getParam('checkoutTime', ParamType.String),
                status: params.getParam('status', ParamType.String),
                colorStatus: params.getParam('colorStatus', ParamType.Color),
                checkinLatitude:
                    params.getParam('checkinLatitude', ParamType.String),
                checkinLongitude:
                    params.getParam('checkinLongitude', ParamType.String),
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
                fullName: params.getParam('fullName', ParamType.String),
                coverType: params.getParam('coverType', ParamType.String),
                garageType: params.getParam('garageType', ParamType.String),
                grossTotal: params.getParam('grossTotal', ParamType.String),
                sumInsured: params.getParam('sumInsured', ParamType.String),
                tppd: params.getParam('tppd', ParamType.String),
                pa: params.getParam('pa', ParamType.String),
                actAmount: params.getParam('actAmount', ParamType.String),
                expiryDate: params.getParam('expiryDate', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'DashboardITSupport',
              path: 'dashboardITSupport',
              builder: (context, params) => DashboardITSupportWidget(
                jwtToken: params.getParam('jwtToken', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'CheckInStatusPage',
              path: 'checkInStatusPage',
              builder: (context, params) => CheckInStatusPageWidget(
                checkinImage: params.getParam('checkinImage', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'CategorySupport',
              path: 'categorySupport',
              builder: (context, params) => CategorySupportWidget(
                jwtToken: params.getParam('jwtToken', ParamType.String),
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
              asyncParams: {
                'location1': getDoc(['city'], CityRecord.serializer),
              },
              builder: (context, params) => InfoReportWidget(
                location1: params.getParam('location1', ParamType.Document),
                recordId: params.getParam('recordId', ParamType.String),
                coordinate: params.getParam('coordinate', ParamType.String),
                remark: params.getParam('remark', ParamType.String),
                clockIn: params.getParam('clockIn', ParamType.DateTime),
              ),
            ),
            FFRoute(
              name: 'CheckInStatusPageCopy',
              path: 'checkInStatusPageCopy',
              builder: (context, params) => CheckInStatusPageCopyWidget(
                checkinImage: params.getParam('checkinImage', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'DashboardCheckin',
              path: 'dashboardCheckin',
              builder: (context, params) => DashboardCheckinWidget(
                jwtToken: params.getParam('jwtToken', ParamType.String),
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
                isFromDashboard:
                    params.getParam('isFromDashboard', ParamType.bool),
                endDate: params.getParam('endDate', ParamType.String),
                resignReason: params.getParam('resignReason', ParamType.String),
                resignReasonEtc:
                    params.getParam('resignReasonEtc', ParamType.String),
                leaveReason: params.getParam('leaveReason', ParamType.String),
                privince: params.getParam('privince', ParamType.String),
                district: params.getParam('district', ParamType.String),
                postCode: params.getParam('postCode', ParamType.String),
                batchRoad: params.getParam('batchRoad', ParamType.String),
                phone: params.getParam('phone', ParamType.String),
                willComeBack: params.getParam('willComeBack', ParamType.String),
                asset: params.getParam('asset', ParamType.String),
                assetEtc: params.getParam('assetEtc', ParamType.String),
                subdistrict: params.getParam('subdistrict', ParamType.String),
                leaveListId: params.getParam('leaveListId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'DashboardLeavePage',
              path: 'dashboardLeavePage',
              builder: (context, params) => DashboardLeavePageWidget(
                jwtToken: params.getParam('jwtToken', ParamType.String),
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
                leaveType: params.getParam('leaveType', ParamType.String),
                leavePeriod: params.getParam('leavePeriod', ParamType.String),
                leaveDay: params.getParam('leaveDay', ParamType.String),
                leaveReason: params.getParam('leaveReason', ParamType.String),
                leaveListID: params.getParam('leaveListID', ParamType.String),
                leaveDate: params.getParam('leaveDate', ParamType.String),
                userPhoneNumber:
                    params.getParam('userPhoneNumber', ParamType.String),
                leaveDocumentOld: params.getParam<String>(
                    'leaveDocumentOld', ParamType.String, true),
              ),
            ),
            FFRoute(
              name: 'FormItSupport',
              path: 'formItSupport',
              builder: (context, params) => FormItSupportWidget(
                fixType: params.getParam('fixType', ParamType.String),
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
                planInsurance:
                    params.getParam('planInsurance', ParamType.String),
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
              name: 'SaleskitPageCopy',
              path: 'saleskitPageCopy',
              builder: (context, params) => SaleskitPageCopyWidget(),
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
              asyncParams: {
                'location1': getDoc(['city'], CityRecord.serializer),
              },
              builder: (context, params) => ChangeLatLngPageWidget(
                location1: params.getParam('location1', ParamType.Document),
                recordId: params.getParam('recordId', ParamType.String),
                coordinate: params.getParam('coordinate', ParamType.String),
                remark: params.getParam('remark', ParamType.String),
                clockIn: params.getParam('clockIn', ParamType.DateTime),
              ),
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
                jwtToken: params.getParam('jwtToken', ParamType.String),
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
              builder: (context, params) =>
                  LifeInsuranceLicenseCardPageWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      urlPathStrategy: UrlPathStrategy.path,
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
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (GoRouter.of(this).routerDelegate.matches.length <= 1) {
      go('/');
    } else {
      pop();
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
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
      (state.extraMap.length == 1 &&
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
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
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
    return deserializeParam<T>(param, type, isList, collectionNamePath);
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
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
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
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
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
