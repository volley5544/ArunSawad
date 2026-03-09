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
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

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
      navigatorKey: appNavigatorKey,
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
              name: LoginPageWidget.routeName,
              path: LoginPageWidget.routePath,
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
              name: SetPinCodePageWidget.routeName,
              path: SetPinCodePageWidget.routePath,
              builder: (context, params) => SetPinCodePageWidget(),
            ),
            FFRoute(
              name: PinCodePageWidget.routeName,
              path: PinCodePageWidget.routePath,
              builder: (context, params) => PinCodePageWidget(),
            ),
            FFRoute(
              name: DashboardWidget.routeName,
              path: DashboardWidget.routePath,
              builder: (context, params) => DashboardWidget(
                jwtToken: params.getParam(
                  'jwtToken',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CheckInPageWidget.routeName,
              path: CheckInPageWidget.routePath,
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
              name: SurveyPageWidget.routeName,
              path: SurveyPageWidget.routePath,
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
              name: SuperAppPageWidget.routeName,
              path: SuperAppPageWidget.routePath,
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
              name: NotificationDetailPageWidget.routeName,
              path: NotificationDetailPageWidget.routePath,
              builder: (context, params) => NotificationDetailPageWidget(),
            ),
            FFRoute(
              name: MyProfilePageWidget.routeName,
              path: MyProfilePageWidget.routePath,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'MyProfilePage')
                  : MyProfilePageWidget(),
            ),
            FFRoute(
              name: LeadNotiPageWidget.routeName,
              path: LeadNotiPageWidget.routePath,
              builder: (context, params) => LeadNotiPageWidget(
                color: params.getParam<Color>(
                  'color',
                  ParamType.Color,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: CollectionPageWidget.routeName,
              path: CollectionPageWidget.routePath,
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
              name: MarketingPageWidget.routeName,
              path: MarketingPageWidget.routePath,
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
              name: OPSpageWidget.routeName,
              path: OPSpageWidget.routePath,
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
              name: CheckerPageWidget.routeName,
              path: CheckerPageWidget.routePath,
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
              name: NPApageWidget.routeName,
              path: NPApageWidget.routePath,
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
              name: TimeSheetPageWidget.routeName,
              path: TimeSheetPageWidget.routePath,
              builder: (context, params) => TimeSheetPageWidget(),
            ),
            FFRoute(
              name: ForgotPasswordPageWidget.routeName,
              path: ForgotPasswordPageWidget.routePath,
              builder: (context, params) => ForgotPasswordPageWidget(),
            ),
            FFRoute(
              name: SuccessPageWidget.routeName,
              path: SuccessPageWidget.routePath,
              builder: (context, params) => SuccessPageWidget(
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: FormServicePageWidget.routeName,
              path: FormServicePageWidget.routePath,
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
              name: GenQRPageWidget.routeName,
              path: GenQRPageWidget.routePath,
              builder: (context, params) => GenQRPageWidget(),
            ),
            FFRoute(
              name: LeadSurveyRegisPageWidget.routeName,
              path: LeadSurveyRegisPageWidget.routePath,
              builder: (context, params) => LeadSurveyRegisPageWidget(),
            ),
            FFRoute(
              name: SaleskitPageWidget.routeName,
              path: SaleskitPageWidget.routePath,
              builder: (context, params) => SaleskitPageWidget(),
            ),
            FFRoute(
              name: ITSupportPageWidget.routeName,
              path: ITSupportPageWidget.routePath,
              builder: (context, params) => ITSupportPageWidget(),
            ),
            FFRoute(
              name: ActionLogPageWidget.routeName,
              path: ActionLogPageWidget.routePath,
              builder: (context, params) => ActionLogPageWidget(),
            ),
            FFRoute(
              name: IntrodutionPageWidget.routeName,
              path: IntrodutionPageWidget.routePath,
              builder: (context, params) => IntrodutionPageWidget(),
            ),
            FFRoute(
              name: ReportITSupportWidget.routeName,
              path: ReportITSupportWidget.routePath,
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
              name: LeavePageWidget.routeName,
              path: LeavePageWidget.routePath,
              builder: (context, params) => LeavePageWidget(),
            ),
            FFRoute(
              name: SuccessCheckinPageWidget.routeName,
              path: SuccessCheckinPageWidget.routePath,
              builder: (context, params) => SuccessCheckinPageWidget(
                checkinPhoto: params.getParam(
                  'checkinPhoto',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: EmpolyeeCheckInWidget.routeName,
              path: EmpolyeeCheckInWidget.routePath,
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
              name: LeaveShowPageWidget.routeName,
              path: LeaveShowPageWidget.routePath,
              builder: (context, params) => LeaveShowPageWidget(),
            ),
            FFRoute(
              name: AddLeavePageWidget.routeName,
              path: AddLeavePageWidget.routePath,
              builder: (context, params) => AddLeavePageWidget(
                leaveType: params.getParam(
                  'leaveType',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CancelPageWidget.routeName,
              path: CancelPageWidget.routePath,
              builder: (context, params) => CancelPageWidget(
                leaveId: params.getParam(
                  'leaveId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ApprovedLeavePageWidget.routeName,
              path: ApprovedLeavePageWidget.routePath,
              builder: (context, params) => ApprovedLeavePageWidget(),
            ),
            FFRoute(
              name: CheckInsurancePageWidget.routeName,
              path: CheckInsurancePageWidget.routePath,
              builder: (context, params) => CheckInsurancePageWidget(),
            ),
            FFRoute(
              name: Check1InsurancePageWidget.routeName,
              path: Check1InsurancePageWidget.routePath,
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
              name: ConfirmEmailPageWidget.routeName,
              path: ConfirmEmailPageWidget.routePath,
              builder: (context, params) => ConfirmEmailPageWidget(),
            ),
            FFRoute(
              name: InfoCheckinWidget.routeName,
              path: InfoCheckinWidget.routePath,
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
              name: ListInsurancPageWidget.routeName,
              path: ListInsurancPageWidget.routePath,
              builder: (context, params) => ListInsurancPageWidget(),
            ),
            FFRoute(
              name: FindPlacePageWidget.routeName,
              path: FindPlacePageWidget.routePath,
              builder: (context, params) => FindPlacePageWidget(),
            ),
            FFRoute(
              name: DetailInsurancePageWidget.routeName,
              path: DetailInsurancePageWidget.routePath,
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
              name: DashboardITSupportWidget.routeName,
              path: DashboardITSupportWidget.routePath,
              builder: (context, params) => DashboardITSupportWidget(
                jwtToken: params.getParam(
                  'jwtToken',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CheckInStatusPageWidget.routeName,
              path: CheckInStatusPageWidget.routePath,
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
              name: CategorySupportWidget.routeName,
              path: CategorySupportWidget.routePath,
              builder: (context, params) => CategorySupportWidget(
                jwtToken: params.getParam(
                  'jwtToken',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ReportListWidget.routeName,
              path: ReportListWidget.routePath,
              builder: (context, params) => ReportListWidget(),
            ),
            FFRoute(
              name: InfoReportWidget.routeName,
              path: InfoReportWidget.routePath,
              builder: (context, params) => InfoReportWidget(),
            ),
            FFRoute(
              name: CheckInStatusPageCopyWidget.routeName,
              path: CheckInStatusPageCopyWidget.routePath,
              builder: (context, params) => CheckInStatusPageCopyWidget(
                checkinImage: params.getParam(
                  'checkinImage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: DashboardCheckinWidget.routeName,
              path: DashboardCheckinWidget.routePath,
              builder: (context, params) => DashboardCheckinWidget(
                jwtToken: params.getParam(
                  'jwtToken',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: PromotionPageWidget.routeName,
              path: PromotionPageWidget.routePath,
              builder: (context, params) => PromotionPageWidget(),
            ),
            FFRoute(
              name: EmployeeKPIPageWidget.routeName,
              path: EmployeeKPIPageWidget.routePath,
              builder: (context, params) => EmployeeKPIPageWidget(
                annoucementUrl: params.getParam(
                  'annoucementUrl',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: GuideBookPageWidget.routeName,
              path: GuideBookPageWidget.routePath,
              builder: (context, params) => GuideBookPageWidget(),
            ),
            FFRoute(
              name: AddResignPageWidget.routeName,
              path: AddResignPageWidget.routePath,
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
              name: DashboardLeavePageWidget.routeName,
              path: DashboardLeavePageWidget.routePath,
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
              name: ApproveShowPageWidget.routeName,
              path: ApproveShowPageWidget.routePath,
              builder: (context, params) => ApproveShowPageWidget(),
            ),
            FFRoute(
              name: AddResignPageCopyWidget.routeName,
              path: AddResignPageCopyWidget.routePath,
              builder: (context, params) => AddResignPageCopyWidget(),
            ),
            FFRoute(
              name: EditLeavePageWidget.routeName,
              path: EditLeavePageWidget.routePath,
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
              name: FormItSupportWidget.routeName,
              path: FormItSupportWidget.routePath,
              builder: (context, params) => FormItSupportWidget(
                fixType: params.getParam(
                  'fixType',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SumPointPageWidget.routeName,
              path: SumPointPageWidget.routePath,
              builder: (context, params) => SumPointPageWidget(),
            ),
            FFRoute(
              name: QuotaPointPageWidget.routeName,
              path: QuotaPointPageWidget.routePath,
              builder: (context, params) => QuotaPointPageWidget(),
            ),
            FFRoute(
              name: WelfareKPIPageWidget.routeName,
              path: WelfareKPIPageWidget.routePath,
              builder: (context, params) => WelfareKPIPageWidget(),
            ),
            FFRoute(
              name: GivePointPageWidget.routeName,
              path: GivePointPageWidget.routePath,
              builder: (context, params) => GivePointPageWidget(),
            ),
            FFRoute(
              name: InsurancePlanWidget.routeName,
              path: InsurancePlanWidget.routePath,
              builder: (context, params) => InsurancePlanWidget(
                planInsurance: params.getParam(
                  'planInsurance',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: QuestionnaireSurveyWidget.routeName,
              path: QuestionnaireSurveyWidget.routePath,
              builder: (context, params) => QuestionnaireSurveyWidget(),
            ),
            FFRoute(
              name: PhoneNumberInfoWidget.routeName,
              path: PhoneNumberInfoWidget.routePath,
              builder: (context, params) => PhoneNumberInfoWidget(),
            ),
            FFRoute(
              name: ELearningWidget.routeName,
              path: ELearningWidget.routePath,
              builder: (context, params) => ELearningWidget(),
            ),
            FFRoute(
              name: SupportTemplateWidget.routeName,
              path: SupportTemplateWidget.routePath,
              builder: (context, params) => SupportTemplateWidget(),
            ),
            FFRoute(
              name: HtmlPageWidget.routeName,
              path: HtmlPageWidget.routePath,
              builder: (context, params) => HtmlPageWidget(
                contentHtml: params.getParam(
                  'contentHtml',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: EmployeeKpiCEOPageWidget.routeName,
              path: EmployeeKpiCEOPageWidget.routePath,
              builder: (context, params) => EmployeeKpiCEOPageWidget(),
            ),
            FFRoute(
              name: WelfareKPICEOPageWidget.routeName,
              path: WelfareKPICEOPageWidget.routePath,
              builder: (context, params) => WelfareKPICEOPageWidget(),
            ),
            FFRoute(
              name: ErtertWidget.routeName,
              path: ErtertWidget.routePath,
              builder: (context, params) => ErtertWidget(),
            ),
            FFRoute(
              name: InspocPageWidget.routeName,
              path: InspocPageWidget.routePath,
              builder: (context, params) => InspocPageWidget(),
            ),
            FFRoute(
              name: ChangeLatLngPageWidget.routeName,
              path: ChangeLatLngPageWidget.routePath,
              builder: (context, params) => ChangeLatLngPageWidget(),
            ),
            FFRoute(
              name: ClassroomPageWidget.routeName,
              path: ClassroomPageWidget.routePath,
              builder: (context, params) => ClassroomPageWidget(),
            ),
            FFRoute(
              name: TestCircleMapWidget.routeName,
              path: TestCircleMapWidget.routePath,
              builder: (context, params) => TestCircleMapWidget(),
            ),
            FFRoute(
              name: RedeemPointPageWidget.routeName,
              path: RedeemPointPageWidget.routePath,
              builder: (context, params) => RedeemPointPageWidget(
                jwtToken: params.getParam(
                  'jwtToken',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: PlanningSelfKPIWidget.routeName,
              path: PlanningSelfKPIWidget.routePath,
              builder: (context, params) => PlanningSelfKPIWidget(),
            ),
            FFRoute(
              name: ThaipaiboonPageWidget.routeName,
              path: ThaipaiboonPageWidget.routePath,
              builder: (context, params) => ThaipaiboonPageWidget(),
            ),
            FFRoute(
              name: LeaveShowPageCopyWidget.routeName,
              path: LeaveShowPageCopyWidget.routePath,
              builder: (context, params) => LeaveShowPageCopyWidget(),
            ),
            FFRoute(
              name: LifeInsuranceLicenseCardPageWidget.routeName,
              path: LifeInsuranceLicenseCardPageWidget.routePath,
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
              name: ChangeLatLngPageWebWidget.routeName,
              path: ChangeLatLngPageWebWidget.routePath,
              builder: (context, params) => ChangeLatLngPageWebWidget(
                token: params.getParam(
                  'token',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ChatSearchPageWidget.routeName,
              path: ChatSearchPageWidget.routePath,
              builder: (context, params) => ChatSearchPageWidget(),
            ),
            FFRoute(
              name: ChatHomePageWidget.routeName,
              path: ChatHomePageWidget.routePath,
              builder: (context, params) => ChatHomePageWidget(),
            ),
            FFRoute(
              name: ChattingPageWidget.routeName,
              path: ChattingPageWidget.routePath,
              builder: (context, params) => ChattingPageWidget(
                chatRoomDocRef: params.getParam(
                  'chatRoomDocRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['SawadChatRoom'],
                ),
                myDisplayImageUrl: params.getParam(
                  'myDisplayImageUrl',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: InsuranceRequestInsurerPageWidget.routeName,
              path: InsuranceRequestInsurerPageWidget.routePath,
              builder: (context, params) => InsuranceRequestInsurerPageWidget(),
            ),
            FFRoute(
              name: InsuranceRequestImagePageWidget.routeName,
              path: InsuranceRequestImagePageWidget.routePath,
              builder: (context, params) => InsuranceRequestImagePageWidget(),
            ),
            FFRoute(
              name: InsuranceRequestBasicPageWidget.routeName,
              path: InsuranceRequestBasicPageWidget.routePath,
              builder: (context, params) => InsuranceRequestBasicPageWidget(),
            ),
            FFRoute(
              name: InsuranceRequestListPageWidget.routeName,
              path: InsuranceRequestListPageWidget.routePath,
              builder: (context, params) => InsuranceRequestListPageWidget(),
            ),
            FFRoute(
              name: InsuranceRequestDashboardPageWidget.routeName,
              path: InsuranceRequestDashboardPageWidget.routePath,
              builder: (context, params) => InsuranceRequestDashboardPageWidget(
                jwtToken: params.getParam(
                  'jwtToken',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: InsuranceRequestEditPageWidget.routeName,
              path: InsuranceRequestEditPageWidget.routePath,
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
              name: InboxEmailWidget.routeName,
              path: InboxEmailWidget.routePath,
              builder: (context, params) => InboxEmailWidget(),
            ),
            FFRoute(
              name: SearchInsurancePageWidget.routeName,
              path: SearchInsurancePageWidget.routePath,
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
              name: AboutUsPageWidget.routeName,
              path: AboutUsPageWidget.routePath,
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
              name: ContactUsPageWidget.routeName,
              path: ContactUsPageWidget.routePath,
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
              name: IBSReportWidget.routeName,
              path: IBSReportWidget.routePath,
              builder: (context, params) => IBSReportWidget(
                employeeId: params.getParam(
                  'employeeId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: KPIAllCEOPageWidget.routeName,
              path: KPIAllCEOPageWidget.routePath,
              builder: (context, params) => KPIAllCEOPageWidget(),
            ),
            FFRoute(
              name: BsiReportPageWidget.routeName,
              path: BsiReportPageWidget.routePath,
              builder: (context, params) => BsiReportPageWidget(),
            ),
            FFRoute(
              name: ListNameTabFollowUpDebtWidget.routeName,
              path: ListNameTabFollowUpDebtWidget.routePath,
              builder: (context, params) => ListNameTabFollowUpDebtWidget(
                followUpDebtTab: params.getParam(
                  'followUpDebtTab',
                  ParamType.int,
                ),
                branchM: params.getParam(
                  'branchM',
                  ParamType.String,
                ),
                policeName: params.getParam(
                  'policeName',
                  ParamType.String,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RecordVideoWebviewPageWidget.routeName,
              path: RecordVideoWebviewPageWidget.routePath,
              builder: (context, params) => RecordVideoWebviewPageWidget(
                webUrl: params.getParam(
                  'webUrl',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: DetailListFollowUpDebtWidget.routeName,
              path: DetailListFollowUpDebtWidget.routePath,
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
                fromIconCall: params.getParam(
                  'fromIconCall',
                  ParamType.bool,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SaveOnSiteFollowUpDebtWidget.routeName,
              path: SaveOnSiteFollowUpDebtWidget.routePath,
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
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SaveCallFollowUpDebtWidget.routeName,
              path: SaveCallFollowUpDebtWidget.routePath,
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
                arnow: params.getParam<String>(
                  'arnow',
                  ParamType.String,
                  isList: true,
                ),
                dbName: params.getParam<String>(
                  'dbName',
                  ParamType.String,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: RecordFollowUpDebtWidget.routeName,
              path: RecordFollowUpDebtWidget.routePath,
              builder: (context, params) => RecordFollowUpDebtWidget(
                contNo: params.getParam(
                  'contNo',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SuccessPageCollecctionWidget.routeName,
              path: SuccessPageCollecctionWidget.routePath,
              builder: (context, params) => SuccessPageCollecctionWidget(),
            ),
            FFRoute(
              name: TabCollectionWidget.routeName,
              path: TabCollectionWidget.routePath,
              builder: (context, params) => TabCollectionWidget(
                branchCode: params.getParam(
                  'branchCode',
                  ParamType.String,
                ),
                profileLevel: params.getParam(
                  'profileLevel',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SearchCollectionPageWidget.routeName,
              path: SearchCollectionPageWidget.routePath,
              builder: (context, params) => SearchCollectionPageWidget(
                followUpDebtTab: params.getParam(
                  'followUpDebtTab',
                  ParamType.int,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SearchCollectionPPWidget.routeName,
              path: SearchCollectionPPWidget.routePath,
              builder: (context, params) => SearchCollectionPPWidget(
                followUpDebtTab: params.getParam(
                  'followUpDebtTab',
                  ParamType.int,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RegisterWidget.routeName,
              path: RegisterWidget.routePath,
              builder: (context, params) => RegisterWidget(),
            ),
            FFRoute(
              name: InterestPageWidget.routeName,
              path: InterestPageWidget.routePath,
              builder: (context, params) => InterestPageWidget(
                contno: params.getParam(
                  'contno',
                  ParamType.String,
                ),
                dbName: params.getParam(
                  'dbName',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: QRCodeWidget.routeName,
              path: QRCodeWidget.routePath,
              builder: (context, params) => QRCodeWidget(
                followUpDebtTab: params.getParam(
                  'followUpDebtTab',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: RecordVideoPageWidget.routeName,
              path: RecordVideoPageWidget.routePath,
              builder: (context, params) => RecordVideoPageWidget(),
            ),
            FFRoute(
              name: RecordVideoCustomerWidget.routeName,
              path: RecordVideoCustomerWidget.routePath,
              builder: (context, params) => RecordVideoCustomerWidget(
                vloanApiUrl: params.getParam(
                  'vloanApiUrl',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RecordVideoCustomer2Widget.routeName,
              path: RecordVideoCustomer2Widget.routePath,
              builder: (context, params) => RecordVideoCustomer2Widget(
                contNo: params.getParam(
                  'contNo',
                  ParamType.String,
                ),
                checkApp: params.getParam(
                  'checkApp',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RecordVideoCustomer3Widget.routeName,
              path: RecordVideoCustomer3Widget.routePath,
              builder: (context, params) => RecordVideoCustomer3Widget(
                contNo: params.getParam(
                  'contNo',
                  ParamType.String,
                ),
                checkType: params.getParam(
                  'checkType',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SuperAppNewPageWidget.routeName,
              path: SuperAppNewPageWidget.routePath,
              builder: (context, params) => SuperAppNewPageWidget(
                dailyText: params.getParam(
                  'dailyText',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: WebviewPageWidget.routeName,
              path: WebviewPageWidget.routePath,
              builder: (context, params) => WebviewPageWidget(
                titleName: params.getParam(
                  'titleName',
                  ParamType.String,
                ),
                webUrl: params.getParam(
                  'webUrl',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RoadmapinsuranceWidget.routeName,
              path: RoadmapinsuranceWidget.routePath,
              builder: (context, params) => RoadmapinsuranceWidget(),
            ),
            FFRoute(
              name: CarSeizedPageStep1Widget.routeName,
              path: CarSeizedPageStep1Widget.routePath,
              builder: (context, params) => CarSeizedPageStep1Widget(),
            ),
            FFRoute(
              name: CarSeizedDashboardPageWidget.routeName,
              path: CarSeizedDashboardPageWidget.routePath,
              builder: (context, params) => CarSeizedDashboardPageWidget(
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
                readAccessRoleData: params.getParam(
                  'readAccessRoleData',
                  ParamType.JSON,
                ),
                saveAccessRoleData: params.getParam(
                  'saveAccessRoleData',
                  ParamType.JSON,
                ),
                userRoleRead: params.getParam(
                  'userRoleRead',
                  ParamType.String,
                ),
                userRoleSave: params.getParam(
                  'userRoleSave',
                  ParamType.String,
                ),
                carConfig: params.getParam<String>(
                  'carConfig',
                  ParamType.String,
                  isList: true,
                ),
                motocycleConfig: params.getParam<String>(
                  'motocycleConfig',
                  ParamType.String,
                  isList: true,
                ),
                editAccessRoleData: params.getParam(
                  'editAccessRoleData',
                  ParamType.JSON,
                ),
                userRoleEdit: params.getParam(
                  'userRoleEdit',
                  ParamType.String,
                ),
                priceAccessRoleData: params.getParam(
                  'priceAccessRoleData',
                  ParamType.JSON,
                ),
                userRolePrice: params.getParam(
                  'userRolePrice',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CustomerCarDeailsStep1Widget.routeName,
              path: CustomerCarDeailsStep1Widget.routePath,
              builder: (context, params) => CustomerCarDeailsStep1Widget(
                step: params.getParam(
                  'step',
                  ParamType.String,
                ),
                readAccessRoleData: params.getParam(
                  'readAccessRoleData',
                  ParamType.JSON,
                ),
                saveAccessRoleData: params.getParam(
                  'saveAccessRoleData',
                  ParamType.JSON,
                ),
                userRoleRead: params.getParam(
                  'userRoleRead',
                  ParamType.String,
                ),
                userRoleSave: params.getParam(
                  'userRoleSave',
                  ParamType.String,
                ),
                impoundCarParamSet: params.getParam(
                  'impoundCarParamSet',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: ImpoundCarParamSetStruct.fromSerializableMap,
                ),
                impoundCarLocateParamSet: params.getParam(
                  'impoundCarLocateParamSet',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder:
                      ImpoundCarLocateParamSetStruct.fromSerializableMap,
                ),
                carConfig: params.getParam<String>(
                  'carConfig',
                  ParamType.String,
                  isList: true,
                ),
                motocycleConfig: params.getParam<String>(
                  'motocycleConfig',
                  ParamType.String,
                  isList: true,
                ),
                editAccessRoleData: params.getParam(
                  'editAccessRoleData',
                  ParamType.JSON,
                ),
                userRoleEdit: params.getParam(
                  'userRoleEdit',
                  ParamType.String,
                ),
                regionList: params.getParam<String>(
                  'regionList',
                  ParamType.String,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: SampleCarImageStep1Widget.routeName,
              path: SampleCarImageStep1Widget.routePath,
              builder: (context, params) => SampleCarImageStep1Widget(
                imageName: params.getParam(
                  'imageName',
                  ParamType.String,
                ),
                contNoType: params.getParam(
                  'contNoType',
                  ParamType.String,
                ),
                numberOfImage: params.getParam(
                  'numberOfImage',
                  ParamType.String,
                ),
                carConfig: params.getParam<String>(
                  'carConfig',
                  ParamType.String,
                  isList: true,
                ),
                motocycleConfig: params.getParam<String>(
                  'motocycleConfig',
                  ParamType.String,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: CustomerCarDeailsStep4Widget.routeName,
              path: CustomerCarDeailsStep4Widget.routePath,
              builder: (context, params) => CustomerCarDeailsStep4Widget(
                step: params.getParam(
                  'step',
                  ParamType.String,
                ),
                readAccessRoleData: params.getParam(
                  'readAccessRoleData',
                  ParamType.JSON,
                ),
                saveAccessRoleData: params.getParam(
                  'saveAccessRoleData',
                  ParamType.JSON,
                ),
                userRoleRead: params.getParam(
                  'userRoleRead',
                  ParamType.String,
                ),
                userRoleSave: params.getParam(
                  'userRoleSave',
                  ParamType.String,
                ),
                impoundCarParamSet: params.getParam(
                  'impoundCarParamSet',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: ImpoundCarParamSetStruct.fromSerializableMap,
                ),
                impoundCarLocateParamSet: params.getParam(
                  'impoundCarLocateParamSet',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder:
                      ImpoundCarLocateParamSetStruct.fromSerializableMap,
                ),
                carConfig: params.getParam<String>(
                  'carConfig',
                  ParamType.String,
                  isList: true,
                ),
                motocycleConfig: params.getParam<String>(
                  'motocycleConfig',
                  ParamType.String,
                  isList: true,
                ),
                editAccessRoleData: params.getParam(
                  'editAccessRoleData',
                  ParamType.JSON,
                ),
                userRoleEdit: params.getParam(
                  'userRoleEdit',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: TypePicStep1Widget.routeName,
              path: TypePicStep1Widget.routePath,
              builder: (context, params) => TypePicStep1Widget(),
            ),
            FFRoute(
              name: CustomerBikeDetailsStep1Widget.routeName,
              path: CustomerBikeDetailsStep1Widget.routePath,
              builder: (context, params) => CustomerBikeDetailsStep1Widget(),
            ),
            FFRoute(
              name: CustomerBikeDeailsStep4Widget.routeName,
              path: CustomerBikeDeailsStep4Widget.routePath,
              builder: (context, params) => CustomerBikeDeailsStep4Widget(),
            ),
            FFRoute(
              name: CarSeizedSelectDashboardWidget.routeName,
              path: CarSeizedSelectDashboardWidget.routePath,
              builder: (context, params) => CarSeizedSelectDashboardWidget(
                isFromNotiPage: params.getParam(
                  'isFromNotiPage',
                  ParamType.String,
                ),
                contNoNoti: params.getParam(
                  'contNoNoti',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SearchCustomersGDWidget.routeName,
              path: SearchCustomersGDWidget.routePath,
              builder: (context, params) => SearchCustomersGDWidget(
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
                step: params.getParam(
                  'step',
                  ParamType.String,
                ),
                textShow: params.getParam(
                  'textShow',
                  ParamType.String,
                ),
                readAccessRoleData: params.getParam(
                  'readAccessRoleData',
                  ParamType.JSON,
                ),
                saveAccessRoleData: params.getParam(
                  'saveAccessRoleData',
                  ParamType.JSON,
                ),
                userRoleRead: params.getParam(
                  'userRoleRead',
                  ParamType.String,
                ),
                userRoleSave: params.getParam(
                  'userRoleSave',
                  ParamType.String,
                ),
                carConfig: params.getParam<String>(
                  'carConfig',
                  ParamType.String,
                  isList: true,
                ),
                motocycleConfig: params.getParam<String>(
                  'motocycleConfig',
                  ParamType.String,
                  isList: true,
                ),
                editAccessRoleData: params.getParam(
                  'editAccessRoleData',
                  ParamType.JSON,
                ),
                userRoleEdit: params.getParam(
                  'userRoleEdit',
                  ParamType.String,
                ),
                contractNumber: params.getParam(
                  'contractNumber',
                  ParamType.String,
                ),
                priceAccessRoleData: params.getParam(
                  'priceAccessRoleData',
                  ParamType.JSON,
                ),
                userRolePrice: params.getParam(
                  'userRolePrice',
                  ParamType.String,
                ),
                contNoFromNoti: params.getParam(
                  'contNoFromNoti',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CustomerCarDeailsPictureStep1Widget.routeName,
              path: CustomerCarDeailsPictureStep1Widget.routePath,
              builder: (context, params) => CustomerCarDeailsPictureStep1Widget(
                step: params.getParam(
                  'step',
                  ParamType.String,
                ),
                readAccessRoleData: params.getParam(
                  'readAccessRoleData',
                  ParamType.JSON,
                ),
                saveAccessRoleData: params.getParam(
                  'saveAccessRoleData',
                  ParamType.JSON,
                ),
                userRoleRead: params.getParam(
                  'userRoleRead',
                  ParamType.String,
                ),
                userRoleSave: params.getParam(
                  'userRoleSave',
                  ParamType.String,
                ),
                impoundCarParamSet: params.getParam(
                  'impoundCarParamSet',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: ImpoundCarParamSetStruct.fromSerializableMap,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
                impoundCarLocateParamSet: params.getParam(
                  'impoundCarLocateParamSet',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder:
                      ImpoundCarLocateParamSetStruct.fromSerializableMap,
                ),
                impoundCarStatusName: params.getParam(
                  'impoundCarStatusName',
                  ParamType.String,
                ),
                carConfig: params.getParam<String>(
                  'carConfig',
                  ParamType.String,
                  isList: true,
                ),
                motocycleConfig: params.getParam<String>(
                  'motocycleConfig',
                  ParamType.String,
                  isList: true,
                ),
                editAccessRoleData: params.getParam(
                  'editAccessRoleData',
                  ParamType.JSON,
                ),
                userRoleEdit: params.getParam(
                  'userRoleEdit',
                  ParamType.String,
                ),
                fromPage2: params.getParam(
                  'fromPage2',
                  ParamType.String,
                ),
                regionCodeList: params.getParam<String>(
                  'regionCodeList',
                  ParamType.String,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: CustomerCarDeailsPictureStep12Widget.routeName,
              path: CustomerCarDeailsPictureStep12Widget.routePath,
              builder: (context, params) =>
                  CustomerCarDeailsPictureStep12Widget(),
            ),
            FFRoute(
              name: ChangeCarLocationPageWidget.routeName,
              path: ChangeCarLocationPageWidget.routePath,
              builder: (context, params) => ChangeCarLocationPageWidget(
                step: params.getParam(
                  'step',
                  ParamType.String,
                ),
                readAccessRoleData: params.getParam(
                  'readAccessRoleData',
                  ParamType.JSON,
                ),
                saveAccessRoleData: params.getParam(
                  'saveAccessRoleData',
                  ParamType.JSON,
                ),
                userRoleRead: params.getParam(
                  'userRoleRead',
                  ParamType.String,
                ),
                userRoleSave: params.getParam(
                  'userRoleSave',
                  ParamType.String,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
                impoundCarParamSet: params.getParam(
                  'impoundCarParamSet',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: ImpoundCarParamSetStruct.fromSerializableMap,
                ),
                impoundCarStatusId: params.getParam(
                  'impoundCarStatusId',
                  ParamType.String,
                ),
                impoundCarStatusCode: params.getParam(
                  'impoundCarStatusCode',
                  ParamType.String,
                ),
                impoundCarStatusName: params.getParam(
                  'impoundCarStatusName',
                  ParamType.String,
                ),
                carConfig: params.getParam<String>(
                  'carConfig',
                  ParamType.String,
                  isList: true,
                ),
                motocycleConfig: params.getParam<String>(
                  'motocycleConfig',
                  ParamType.String,
                  isList: true,
                ),
                impoundCarLocateParamSet: params.getParam(
                  'impoundCarLocateParamSet',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder:
                      ImpoundCarLocateParamSetStruct.fromSerializableMap,
                ),
                editAccessRoleData: params.getParam(
                  'editAccessRoleData',
                  ParamType.JSON,
                ),
                userRoleEdit: params.getParam(
                  'userRoleEdit',
                  ParamType.String,
                ),
                regionCodeList: params.getParam<String>(
                  'regionCodeList',
                  ParamType.String,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: CalendarPageWidget.routeName,
              path: CalendarPageWidget.routePath,
              builder: (context, params) => CalendarPageWidget(),
            ),
            FFRoute(
              name: TestPageWidget.routeName,
              path: TestPageWidget.routePath,
              builder: (context, params) => TestPageWidget(
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ScanQRWidget.routeName,
              path: ScanQRWidget.routePath,
              builder: (context, params) => ScanQRWidget(),
            ),
            FFRoute(
              name: BranchSelectedPageWidget.routeName,
              path: BranchSelectedPageWidget.routePath,
              builder: (context, params) => BranchSelectedPageWidget(),
            ),
            FFRoute(
              name: WebviewNewPageWidget.routeName,
              path: WebviewNewPageWidget.routePath,
              builder: (context, params) => WebviewNewPageWidget(
                webUrl: params.getParam(
                  'webUrl',
                  ParamType.String,
                ),
                branchCodeSearch: params.getParam(
                  'branchCodeSearch',
                  ParamType.String,
                ),
                levelSearch: params.getParam(
                  'levelSearch',
                  ParamType.String,
                ),
                regionAccessToken: params.getParam(
                  'regionAccessToken',
                  ParamType.String,
                ),
                regionEmployeeId: params.getParam(
                  'regionEmployeeId',
                  ParamType.String,
                ),
                product: params.getParam(
                  'product',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: TrackingEmpPageWidget.routeName,
              path: TrackingEmpPageWidget.routePath,
              builder: (context, params) => TrackingEmpPageWidget(
                employeeId: params.getParam(
                  'employeeId',
                  ParamType.String,
                ),
                employeeName: params.getParam(
                  'employeeName',
                  ParamType.String,
                ),
                employeeBranchCode: params.getParam(
                  'employeeBranchCode',
                  ParamType.String,
                ),
                employeePositionName: params.getParam(
                  'employeePositionName',
                  ParamType.String,
                ),
                selectedDate: params.getParam(
                  'selectedDate',
                  ParamType.String,
                ),
                data: params.getParam<TrackingEmployeeDateModelStruct>(
                  'data',
                  ParamType.DataStruct,
                  isList: true,
                  structBuilder:
                      TrackingEmployeeDateModelStruct.fromSerializableMap,
                ),
                index: params.getParam(
                  'index',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: SearchEmployeePageWidget.routeName,
              path: SearchEmployeePageWidget.routePath,
              builder: (context, params) => SearchEmployeePageWidget(),
            ),
            FFRoute(
              name: SearchEmployeePage2Widget.routeName,
              path: SearchEmployeePage2Widget.routePath,
              builder: (context, params) => SearchEmployeePage2Widget(),
            ),
            FFRoute(
              name: SearchableempWidget.routeName,
              path: SearchableempWidget.routePath,
              builder: (context, params) => SearchableempWidget(
                listData: params.getParam<EmpDataLocationStruct>(
                  'listData',
                  ParamType.DataStruct,
                  isList: true,
                  structBuilder: EmpDataLocationStruct.fromSerializableMap,
                ),
              ),
            ),
            FFRoute(
              name: RemarkTypeDPageWidget.routeName,
              path: RemarkTypeDPageWidget.routePath,
              builder: (context, params) => RemarkTypeDPageWidget(
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
                contNo: params.getParam(
                  'contNo',
                  ParamType.String,
                ),
                remarkTypeDName: params.getParam(
                  'remarkTypeDName',
                  ParamType.String,
                ),
                cusName: params.getParam(
                  'cusName',
                  ParamType.String,
                ),
                filesCount: params.getParam(
                  'filesCount',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: LeadNotiNewPageWidget.routeName,
              path: LeadNotiNewPageWidget.routePath,
              builder: (context, params) => LeadNotiNewPageWidget(
                color: params.getParam<Color>(
                  'color',
                  ParamType.Color,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: WebviewNewPageCopyWidget.routeName,
              path: WebviewNewPageCopyWidget.routePath,
              builder: (context, params) => WebviewNewPageCopyWidget(
                webUrl: params.getParam(
                  'webUrl',
                  ParamType.String,
                ),
                branchCodeSearch: params.getParam(
                  'branchCodeSearch',
                  ParamType.String,
                ),
                levelSearch: params.getParam(
                  'levelSearch',
                  ParamType.String,
                ),
                regionAccessToken: params.getParam(
                  'regionAccessToken',
                  ParamType.String,
                ),
                regionEmployeeId: params.getParam(
                  'regionEmployeeId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SearchQRCustomerPageWidget.routeName,
              path: SearchQRCustomerPageWidget.routePath,
              builder: (context, params) => SearchQRCustomerPageWidget(
                followUpDebtTab: params.getParam(
                  'followUpDebtTab',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: DetailQRCustomerPageWidget.routeName,
              path: DetailQRCustomerPageWidget.routePath,
              builder: (context, params) => DetailQRCustomerPageWidget(
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
                fromIconCall: params.getParam(
                  'fromIconCall',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: PaymentQRcodeWidget.routeName,
              path: PaymentQRcodeWidget.routePath,
              builder: (context, params) => PaymentQRcodeWidget(
                firstName: params.getParam(
                  'firstName',
                  ParamType.String,
                ),
                lastName: params.getParam(
                  'lastName',
                  ParamType.String,
                ),
                dataPayment: params.getParam(
                  'dataPayment',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: DataPaymentQrCodeStruct.fromSerializableMap,
                ),
              ),
            ),
            FFRoute(
              name: GroupChatAddPageWidget.routeName,
              path: GroupChatAddPageWidget.routePath,
              builder: (context, params) => GroupChatAddPageWidget(
                userProfileData: params.getParam(
                  'userProfileData',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder:
                      EmployeeSearchDataModelStruct.fromSerializableMap,
                ),
              ),
            ),
            FFRoute(
              name: ChatRoomSettingPageWidget.routeName,
              path: ChatRoomSettingPageWidget.routePath,
              builder: (context, params) => ChatRoomSettingPageWidget(
                chatRoomDocRef: params.getParam(
                  'chatRoomDocRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['SawadChatRoom'],
                ),
              ),
            ),
            FFRoute(
              name: SelfieMaskPageWidget.routeName,
              path: SelfieMaskPageWidget.routePath,
              builder: (context, params) => SelfieMaskPageWidget(),
            ),
            FFRoute(
              name: CustomerCarDeailsDocumentStep1Widget.routeName,
              path: CustomerCarDeailsDocumentStep1Widget.routePath,
              builder: (context, params) =>
                  CustomerCarDeailsDocumentStep1Widget(
                step: params.getParam(
                  'step',
                  ParamType.String,
                ),
                readAccessRoleData: params.getParam(
                  'readAccessRoleData',
                  ParamType.JSON,
                ),
                saveAccessRoleData: params.getParam(
                  'saveAccessRoleData',
                  ParamType.JSON,
                ),
                userRoleRead: params.getParam(
                  'userRoleRead',
                  ParamType.String,
                ),
                userRoleSave: params.getParam(
                  'userRoleSave',
                  ParamType.String,
                ),
                impoundCarParamSet: params.getParam(
                  'impoundCarParamSet',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder: ImpoundCarParamSetStruct.fromSerializableMap,
                ),
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
                impoundCarLocateParamSet: params.getParam(
                  'impoundCarLocateParamSet',
                  ParamType.DataStruct,
                  isList: false,
                  structBuilder:
                      ImpoundCarLocateParamSetStruct.fromSerializableMap,
                ),
                impoundCarStatusName: params.getParam(
                  'impoundCarStatusName',
                  ParamType.String,
                ),
                carConfig: params.getParam<String>(
                  'carConfig',
                  ParamType.String,
                  isList: true,
                ),
                motocycleConfig: params.getParam<String>(
                  'motocycleConfig',
                  ParamType.String,
                  isList: true,
                ),
                editAccessRoleData: params.getParam(
                  'editAccessRoleData',
                  ParamType.JSON,
                ),
                userRoleEdit: params.getParam(
                  'userRoleEdit',
                  ParamType.String,
                ),
                fromPage2: params.getParam(
                  'fromPage2',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: AddPeoplePageWidget.routeName,
              path: AddPeoplePageWidget.routePath,
              builder: (context, params) => AddPeoplePageWidget(
                chatRoomDocRef: params.getParam(
                  'chatRoomDocRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['SawadChatRoom'],
                ),
              ),
            ),
            FFRoute(
              name: RP72CheckListPageWidget.routeName,
              path: RP72CheckListPageWidget.routePath,
              builder: (context, params) => RP72CheckListPageWidget(
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
                inputCheckListDataList:
                    params.getParam<RP72CheckListDataModelStruct>(
                  'inputCheckListDataList',
                  ParamType.DataStruct,
                  isList: true,
                  structBuilder:
                      RP72CheckListDataModelStruct.fromSerializableMap,
                ),
                remarkTypeName: params.getParam(
                  'remarkTypeName',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: Ew9tf0uewitfWidget.routeName,
              path: Ew9tf0uewitfWidget.routePath,
              builder: (context, params) => Ew9tf0uewitfWidget(),
            ),
            FFRoute(
              name: QRComplainWidget.routeName,
              path: QRComplainWidget.routePath,
              builder: (context, params) => QRComplainWidget(),
            ),
            FFRoute(
              name: BotChattingPageWidget.routeName,
              path: BotChattingPageWidget.routePath,
              builder: (context, params) => BotChattingPageWidget(),
            ),
            FFRoute(
              name: LeadNotiNewPageDupWidget.routeName,
              path: LeadNotiNewPageDupWidget.routePath,
              builder: (context, params) => LeadNotiNewPageDupWidget(
                color: params.getParam<Color>(
                  'color',
                  ParamType.Color,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: LeadDashboardPageDraftWidget.routeName,
              path: LeadDashboardPageDraftWidget.routePath,
              builder: (context, params) => LeadDashboardPageDraftWidget(),
            ),
            FFRoute(
              name: LeadDashboardPageCopyWidget.routeName,
              path: LeadDashboardPageCopyWidget.routePath,
              builder: (context, params) => LeadDashboardPageCopyWidget(),
            ),
            FFRoute(
              name: LeadDashboardPageCopyCopyWidget.routeName,
              path: LeadDashboardPageCopyCopyWidget.routePath,
              builder: (context, params) => LeadDashboardPageCopyCopyWidget(),
            ),
            FFRoute(
              name: LeadDashboardPageWidget.routeName,
              path: LeadDashboardPageWidget.routePath,
              builder: (context, params) => LeadDashboardPageWidget(),
            ),
            FFRoute(
              name: ImagesMPageWidget.routeName,
              path: ImagesMPageWidget.routePath,
              builder: (context, params) => ImagesMPageWidget(),
            ),
            FFRoute(
              name: TabCollectionExtraMWidget.routeName,
              path: TabCollectionExtraMWidget.routePath,
              builder: (context, params) => TabCollectionExtraMWidget(),
            ),
            FFRoute(
              name: TabCollectionTeamMPageWidget.routeName,
              path: TabCollectionTeamMPageWidget.routePath,
              builder: (context, params) => TabCollectionTeamMPageWidget(
                branchCode: params.getParam(
                  'branchCode',
                  ParamType.String,
                ),
                profileLevel: params.getParam(
                  'profileLevel',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ChangePinCodePageWidget.routeName,
              path: ChangePinCodePageWidget.routePath,
              builder: (context, params) => ChangePinCodePageWidget(),
            ),
            FFRoute(
              name: SettingAppPageWidget.routeName,
              path: SettingAppPageWidget.routePath,
              builder: (context, params) => SettingAppPageWidget(
                fromPage: params.getParam(
                  'fromPage',
                  ParamType.String,
                ),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
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
                  name: state.name,
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
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
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
