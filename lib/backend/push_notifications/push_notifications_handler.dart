import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/SplashLoadingApp.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'LoginPage': (data) async => ParameterData(
        allParams: {
          'apiURL': getParameter<DocumentReference>(data, 'apiURL'),
          'token': getParameter<String>(data, 'token'),
        },
      ),
  'SetPinCodePage': ParameterData.none(),
  'PinCodePage': ParameterData.none(),
  'Dashboard': (data) async => ParameterData(
        allParams: {
          'jwtToken': getParameter<String>(data, 'jwtToken'),
        },
      ),
  'CheckInPage': (data) async => ParameterData(
        allParams: {
          'recordId': getParameter<String>(data, 'recordId'),
          'coordinate': getParameter<String>(data, 'coordinate'),
          'remark': getParameter<String>(data, 'remark'),
          'clockIn': getParameter<DateTime>(data, 'clockIn'),
        },
      ),
  'SurveyPage': (data) async => ParameterData(
        allParams: {
          'recordId': getParameter<String>(data, 'recordId'),
          'coordinate': getParameter<String>(data, 'coordinate'),
          'description': getParameter<String>(data, 'description'),
          'idCardNumber': getParameter<String>(data, 'idCardNumber'),
          'customerName': getParameter<String>(data, 'customerName'),
          'landmark': getParameter<String>(data, 'landmark'),
          'remark': getParameter<String>(data, 'remark'),
          'clockIn': getParameter<DateTime>(data, 'clockIn'),
        },
      ),
  'SuperAppPage': (data) async => ParameterData(
        allParams: {
          'dailyText': getParameter<String>(data, 'dailyText'),
        },
      ),
  'NotificationDetailPage': ParameterData.none(),
  'MyProfilePage': ParameterData.none(),
  'LeadNotiPage': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'CollectionPage': (data) async => ParameterData(
        allParams: {
          'coordinate': getParameter<String>(data, 'coordinate'),
          'idCardNumber': getParameter<String>(data, 'idCardNumber'),
          'contNo': getParameter<String>(data, 'contNo'),
          'customerName': getParameter<String>(data, 'customerName'),
          'remark': getParameter<String>(data, 'remark'),
          'recordId': getParameter<String>(data, 'recordId'),
          'clockIn': getParameter<DateTime>(data, 'clockIn'),
        },
      ),
  'MarketingPage': (data) async => ParameterData(
        allParams: {
          'coordinate': getParameter<String>(data, 'coordinate'),
          'branchCode': getParameter<String>(data, 'branchCode'),
          'area': getParameter<String>(data, 'area'),
          'detail': getParameter<String>(data, 'detail'),
          'remark': getParameter<String>(data, 'remark'),
          'recordId': getParameter<String>(data, 'recordId'),
          'clockIn': getParameter<DateTime>(data, 'clockIn'),
        },
      ),
  'OPSpage': (data) async => ParameterData(
        allParams: {
          'recordId': getParameter<String>(data, 'recordId'),
          'coordinate': getParameter<String>(data, 'coordinate'),
          'branchCode': getParameter<String>(data, 'branchCode'),
          'asset': getParameter<String>(data, 'asset'),
          'assetType': getParameter<String>(data, 'assetType'),
          'carPlateNo': getParameter<String>(data, 'carPlateNo'),
          'signboardStatus': getParameter<String>(data, 'signboardStatus'),
          'remark': getParameter<String>(data, 'remark'),
        },
      ),
  'CheckerPage': (data) async => ParameterData(
        allParams: {
          'recordId': getParameter<String>(data, 'recordId'),
          'coordinate': getParameter<String>(data, 'coordinate'),
          'idCardNumber': getParameter<String>(data, 'idCardNumber'),
          'contNo': getParameter<String>(data, 'contNo'),
          'customerName': getParameter<String>(data, 'customerName'),
          'remark': getParameter<String>(data, 'remark'),
          'clockIn': getParameter<DateTime>(data, 'clockIn'),
        },
      ),
  'NPApage': (data) async => ParameterData(
        allParams: {
          'recordId': getParameter<String>(data, 'recordId'),
          'coordinate': getParameter<String>(data, 'coordinate'),
          'assetId': getParameter<String>(data, 'assetId'),
          'remark': getParameter<String>(data, 'remark'),
          'clockIn': getParameter<DateTime>(data, 'clockIn'),
        },
      ),
  'TimeSheetPage': ParameterData.none(),
  'ForgotPasswordPage': ParameterData.none(),
  'SuccessPage': (data) async => ParameterData(
        allParams: {
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'FormServicePage': (data) async => ParameterData(
        allParams: {
          'formServiceName': getParameter<String>(data, 'formServiceName'),
          'formServiceUrl': getParameter<String>(data, 'formServiceUrl'),
        },
      ),
  'GenQRPage': ParameterData.none(),
  'LeadSurveyRegisPage': ParameterData.none(),
  'SaleskitPage': ParameterData.none(),
  'ITSupportPage': ParameterData.none(),
  'ActionLogPage': ParameterData.none(),
  'IntrodutionPage': ParameterData.none(),
  'ReportITSupport': (data) async => ParameterData(
        allParams: {
          'recordId': getParameter<String>(data, 'recordId'),
          'coordinate': getParameter<String>(data, 'coordinate'),
          'description': getParameter<String>(data, 'description'),
          'idCardNumber': getParameter<String>(data, 'idCardNumber'),
          'customerName': getParameter<String>(data, 'customerName'),
          'landmark': getParameter<String>(data, 'landmark'),
          'remark': getParameter<String>(data, 'remark'),
          'clockIn': getParameter<DateTime>(data, 'clockIn'),
        },
      ),
  'LeavePage': ParameterData.none(),
  'SuccessCheckinPage': (data) async => ParameterData(
        allParams: {
          'checkinPhoto': getParameter<String>(data, 'checkinPhoto'),
        },
      ),
  'EmpolyeeCheckIn': (data) async => ParameterData(
        allParams: {
          'recordId': getParameter<String>(data, 'recordId'),
          'coordinate': getParameter<String>(data, 'coordinate'),
          'remark': getParameter<String>(data, 'remark'),
          'clockIn': getParameter<DateTime>(data, 'clockIn'),
        },
      ),
  'LeaveShowPage': ParameterData.none(),
  'AddLeavePage': (data) async => ParameterData(
        allParams: {
          'leaveType': getParameter<String>(data, 'leaveType'),
        },
      ),
  'CancelPage': (data) async => ParameterData(
        allParams: {
          'leaveId': getParameter<String>(data, 'leaveId'),
        },
      ),
  'ApprovedLeavePage': ParameterData.none(),
  'CheckInsurancePage': ParameterData.none(),
  'Check_1InsurancePage': (data) async => ParameterData(
        allParams: {
          'brandCode': getParameter<String>(data, 'brandCode'),
          'modelCode': getParameter<String>(data, 'modelCode'),
          'year': getParameter<String>(data, 'year'),
          'province': getParameter<String>(data, 'province'),
          'driver': getParameter<String>(data, 'driver'),
          'vehicleUsage': getParameter<String>(data, 'vehicleUsage'),
        },
      ),
  'ConfirmEmailPage': ParameterData.none(),
  'InfoCheckin': (data) async => ParameterData(
        allParams: {
          'checkinLocation': getParameter<LatLng>(data, 'checkinLocation'),
          'date': getParameter<String>(data, 'date'),
          'checkinTime': getParameter<String>(data, 'checkinTime'),
          'checkoutTime': getParameter<String>(data, 'checkoutTime'),
          'status': getParameter<String>(data, 'status'),
          'colorStatus': getParameter<Color>(data, 'colorStatus'),
          'checkinLatitude': getParameter<String>(data, 'checkinLatitude'),
          'checkinLongitude': getParameter<String>(data, 'checkinLongitude'),
        },
      ),
  'ListInsurancPage': ParameterData.none(),
  'FindPlacePage': ParameterData.none(),
  'DetailInsurancePage': (data) async => ParameterData(
        allParams: {
          'fullName': getParameter<String>(data, 'fullName'),
          'coverType': getParameter<String>(data, 'coverType'),
          'garageType': getParameter<String>(data, 'garageType'),
          'grossTotal': getParameter<String>(data, 'grossTotal'),
          'sumInsured': getParameter<String>(data, 'sumInsured'),
          'tppd': getParameter<String>(data, 'tppd'),
          'pa': getParameter<String>(data, 'pa'),
          'actAmount': getParameter<String>(data, 'actAmount'),
          'expiryDate': getParameter<String>(data, 'expiryDate'),
        },
      ),
  'DashboardITSupport': (data) async => ParameterData(
        allParams: {
          'jwtToken': getParameter<String>(data, 'jwtToken'),
        },
      ),
  'CheckInStatusPage': (data) async => ParameterData(
        allParams: {
          'checkinImage': getParameter<String>(data, 'checkinImage'),
        },
      ),
  'CategorySupport': (data) async => ParameterData(
        allParams: {
          'jwtToken': getParameter<String>(data, 'jwtToken'),
        },
      ),
  'ReportList': ParameterData.none(),
  'InfoReport': ParameterData.none(),
  'CheckInStatusPageCopy': (data) async => ParameterData(
        allParams: {
          'checkinImage': getParameter<String>(data, 'checkinImage'),
        },
      ),
  'DashboardCheckin': (data) async => ParameterData(
        allParams: {
          'jwtToken': getParameter<String>(data, 'jwtToken'),
        },
      ),
  'PromotionPage': ParameterData.none(),
  'EmployeeKPIPage': (data) async => ParameterData(
        allParams: {
          'annoucementUrl': getParameter<String>(data, 'annoucementUrl'),
        },
      ),
  'GuideBookPage': ParameterData.none(),
  'AddResignPage': (data) async => ParameterData(
        allParams: {
          'isFromDashboard': getParameter<bool>(data, 'isFromDashboard'),
          'endDate': getParameter<String>(data, 'endDate'),
          'resignReason': getParameter<String>(data, 'resignReason'),
          'resignReasonEtc': getParameter<String>(data, 'resignReasonEtc'),
          'leaveReason': getParameter<String>(data, 'leaveReason'),
          'privince': getParameter<String>(data, 'privince'),
          'district': getParameter<String>(data, 'district'),
          'postCode': getParameter<String>(data, 'postCode'),
          'batchRoad': getParameter<String>(data, 'batchRoad'),
          'phone': getParameter<String>(data, 'phone'),
          'willComeBack': getParameter<String>(data, 'willComeBack'),
          'asset': getParameter<String>(data, 'asset'),
          'assetEtc': getParameter<String>(data, 'assetEtc'),
          'subdistrict': getParameter<String>(data, 'subdistrict'),
          'leaveListId': getParameter<String>(data, 'leaveListId'),
        },
      ),
  'DashboardLeavePage': (data) async => ParameterData(
        allParams: {
          'jwtToken': getParameter<String>(data, 'jwtToken'),
          'param1': getParameter<String>(data, 'param1'),
        },
      ),
  'ApproveShowPage': ParameterData.none(),
  'AddResignPageCopy': ParameterData.none(),
  'EditLeavePage': (data) async => ParameterData(
        allParams: {
          'leaveType': getParameter<String>(data, 'leaveType'),
          'leavePeriod': getParameter<String>(data, 'leavePeriod'),
          'leaveDay': getParameter<String>(data, 'leaveDay'),
          'leaveReason': getParameter<String>(data, 'leaveReason'),
          'leaveListID': getParameter<String>(data, 'leaveListID'),
          'leaveDate': getParameter<String>(data, 'leaveDate'),
          'userPhoneNumber': getParameter<String>(data, 'userPhoneNumber'),
        },
      ),
  'FormItSupport': (data) async => ParameterData(
        allParams: {
          'fixType': getParameter<String>(data, 'fixType'),
        },
      ),
  'SumPointPage': ParameterData.none(),
  'QuotaPointPage': ParameterData.none(),
  'WelfareKPIPage': ParameterData.none(),
  'GivePointPage': ParameterData.none(),
  'InsurancePlan': (data) async => ParameterData(
        allParams: {
          'planInsurance': getParameter<String>(data, 'planInsurance'),
        },
      ),
  'QuestionnaireSurvey': ParameterData.none(),
  'PhoneNumberInfo': ParameterData.none(),
  'E-learning': ParameterData.none(),
  'supportTemplate': ParameterData.none(),
  'htmlPage': (data) async => ParameterData(
        allParams: {
          'contentHtml': getParameter<String>(data, 'contentHtml'),
        },
      ),
  'EmployeeKpiCEOPage': ParameterData.none(),
  'WelfareKPICEOPage': ParameterData.none(),
  'ertert': ParameterData.none(),
  'InspocPage': ParameterData.none(),
  'ChangeLatLngPage': ParameterData.none(),
  'ClassroomPage': ParameterData.none(),
  'testCircleMap': ParameterData.none(),
  'redeemPointPage': (data) async => ParameterData(
        allParams: {
          'jwtToken': getParameter<String>(data, 'jwtToken'),
        },
      ),
  'PlanningSelfKPI': ParameterData.none(),
  'ThaipaiboonPage': ParameterData.none(),
  'LeaveShowPageCopy': ParameterData.none(),
  'LifeInsuranceLicenseCardPage': (data) async => ParameterData(
        allParams: {
          'index': getParameter<int>(data, 'index'),
          'insuranceName': getParameter<String>(data, 'insuranceName'),
          'insuranceType': getParameter<String>(data, 'insuranceType'),
        },
      ),
  'ChangeLatLngPageWeb': (data) async => ParameterData(
        allParams: {
          'token': getParameter<String>(data, 'token'),
        },
      ),
  'ChatSearchPage': ParameterData.none(),
  'ChatHomePage': ParameterData.none(),
  'ChattingPage': (data) async => ParameterData(
        allParams: {
          'chatRoomDocRef':
              getParameter<DocumentReference>(data, 'chatRoomDocRef'),
          'myDisplayImageUrl': getParameter<String>(data, 'myDisplayImageUrl'),
        },
      ),
  'InsuranceRequestInsurerPage': ParameterData.none(),
  'InsuranceRequestImagePage': ParameterData.none(),
  'InsuranceRequestBasicPage': ParameterData.none(),
  'InsuranceRequestListPage': ParameterData.none(),
  'InsuranceRequestDashboardPage': (data) async => ParameterData(
        allParams: {
          'jwtToken': getParameter<String>(data, 'jwtToken'),
        },
      ),
  'InsuranceRequestEditPage': (data) async => ParameterData(
        allParams: {
          'leadId': getParameter<String>(data, 'leadId'),
          'leadNo': getParameter<String>(data, 'leadNo'),
          'idCardNumber': getParameter<String>(data, 'idCardNumber'),
          'firstname': getParameter<String>(data, 'firstname'),
          'lastname': getParameter<String>(data, 'lastname'),
          'phoneNumber': getParameter<String>(data, 'phoneNumber'),
          'carType': getParameter<String>(data, 'carType'),
          'brandName': getParameter<String>(data, 'brandName'),
          'modelName': getParameter<String>(data, 'modelName'),
          'provinceName': getParameter<String>(data, 'provinceName'),
          'plateNo': getParameter<String>(data, 'plateNo'),
          'year': getParameter<String>(data, 'year'),
          'vehicleTypeCode': getParameter<String>(data, 'vehicleTypeCode'),
          'flagRenew': getParameter<String>(data, 'flagRenew'),
          'oldVmiPolicyNumber':
              getParameter<String>(data, 'oldVmiPolicyNumber'),
          'flagDecoration': getParameter<String>(data, 'flagDecoration'),
          'decorationDetail': getParameter<String>(data, 'decorationDetail'),
          'flagCarrier': getParameter<String>(data, 'flagCarrier'),
          'flagCoop': getParameter<String>(data, 'flagCoop'),
          'carrierType': getParameter<String>(data, 'carrierType'),
          'carrierPrice': getParameter<String>(data, 'carrierPrice'),
          'customerType': getParameter<String>(data, 'customerType'),
          'truckPart': getParameter<String>(data, 'truckPart'),
          'customerMemberchip':
              getParameter<String>(data, 'customerMemberchip'),
          'trailerPlateNo': getParameter<String>(data, 'trailerPlateNo'),
          'carrierPropose': getParameter<String>(data, 'carrierPropose'),
          'remark': getParameter<String>(data, 'remark'),
          'trailerSumInsured': getParameter<String>(data, 'trailerSumInsured'),
          'flagAct': getParameter<String>(data, 'flagAct'),
          'truckCurrentPrice': getParameter<String>(data, 'truckCurrentPrice'),
          'sumInsured': getParameter<String>(data, 'sumInsured'),
          'coverTypeNameList': getParameter<String>(data, 'coverTypeNameList'),
          'garageTypeName': getParameter<String>(data, 'garageTypeName'),
        },
      ),
  'inboxEmail': ParameterData.none(),
  'SearchInsurancePage': (data) async => ParameterData(
        allParams: {
          'recordId': getParameter<String>(data, 'recordId'),
          'coordinate': getParameter<String>(data, 'coordinate'),
          'description': getParameter<String>(data, 'description'),
          'idCardNumber': getParameter<String>(data, 'idCardNumber'),
          'customerName': getParameter<String>(data, 'customerName'),
          'landmark': getParameter<String>(data, 'landmark'),
          'remark': getParameter<String>(data, 'remark'),
          'clockIn': getParameter<DateTime>(data, 'clockIn'),
        },
      ),
  'AboutUsPage': (data) async => ParameterData(
        allParams: {
          'recordId': getParameter<String>(data, 'recordId'),
          'coordinate': getParameter<String>(data, 'coordinate'),
          'description': getParameter<String>(data, 'description'),
          'idCardNumber': getParameter<String>(data, 'idCardNumber'),
          'customerName': getParameter<String>(data, 'customerName'),
          'landmark': getParameter<String>(data, 'landmark'),
          'remark': getParameter<String>(data, 'remark'),
          'clockIn': getParameter<DateTime>(data, 'clockIn'),
        },
      ),
  'ContactUsPage': (data) async => ParameterData(
        allParams: {
          'recordId': getParameter<String>(data, 'recordId'),
          'coordinate': getParameter<String>(data, 'coordinate'),
          'description': getParameter<String>(data, 'description'),
          'idCardNumber': getParameter<String>(data, 'idCardNumber'),
          'customerName': getParameter<String>(data, 'customerName'),
          'landmark': getParameter<String>(data, 'landmark'),
          'remark': getParameter<String>(data, 'remark'),
          'clockIn': getParameter<DateTime>(data, 'clockIn'),
        },
      ),
  'IBSReport': (data) async => ParameterData(
        allParams: {
          'employeeId': getParameter<String>(data, 'employeeId'),
        },
      ),
  'KPIAllCEOPage': ParameterData.none(),
  'BsiReportPage': ParameterData.none(),
  'listNameTabFollowUpDebt': (data) async => ParameterData(
        allParams: {
          'followUpDebtTab': getParameter<int>(data, 'followUpDebtTab'),
          'branchM': getParameter<String>(data, 'branchM'),
          'policeName': getParameter<String>(data, 'policeName'),
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'RecordVideoWebviewPage': (data) async => ParameterData(
        allParams: {
          'webUrl': getParameter<String>(data, 'webUrl'),
        },
      ),
  'detailListFollowUpDebt': (data) async => ParameterData(
        allParams: {
          'cusCod': getParameter<String>(data, 'cusCod'),
          'name': getParameter<String>(data, 'name'),
          'lastName': getParameter<String>(data, 'lastName'),
          'followupDebtTab': getParameter<int>(data, 'followupDebtTab'),
          'fromIconCall': getParameter<bool>(data, 'fromIconCall'),
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'saveOnSiteFollowUpDebt': (data) async => ParameterData(
        allParams: {
          'firstname': getParameter<String>(data, 'firstname'),
          'lastname': getParameter<String>(data, 'lastname'),
          'contNo': getParameter<String>(data, 'contNo'),
          'dateOfExp': getParameter<String>(data, 'dateOfExp'),
          'tragetStat': getParameter<String>(data, 'tragetStat'),
          'contStat': getParameter<String>(data, 'contStat'),
          'expAmt': getParameter<String>(data, 'expAmt'),
          'cusCode': getParameter<String>(data, 'cusCode'),
          'database': getParameter<String>(data, 'database'),
          'expFrm': getParameter<String>(data, 'expFrm'),
          'dateOfDue': getParameter<String>(data, 'dateOfDue'),
          'followupDebtTab': getParameter<int>(data, 'followupDebtTab'),
          'dateOfData': getParameter<String>(data, 'dateOfData'),
          'sumCurrentDueAmt': getParameter<String>(data, 'sumCurrentDueAmt'),
          'lastPayDate': getParameter<String>(data, 'lastPayDate'),
          'historyCount': getParameter<String>(data, 'historyCount'),
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'saveCallFollowUpDebt': (data) async => ParameterData(
        allParams: {
          'name1': getParameter<String>(data, 'name1'),
          'name2': getParameter<String>(data, 'name2'),
          'followupDebtTab': getParameter<int>(data, 'followupDebtTab'),
        },
      ),
  'recordFollowUpDebt': (data) async => ParameterData(
        allParams: {
          'contNo': getParameter<String>(data, 'contNo'),
        },
      ),
  'successPageCollecction': ParameterData.none(),
  'tabCollection': (data) async => ParameterData(
        allParams: {
          'branchCode': getParameter<String>(data, 'branchCode'),
          'profileLevel': getParameter<String>(data, 'profileLevel'),
        },
      ),
  'SearchCollectionPage': (data) async => ParameterData(
        allParams: {
          'followUpDebtTab': getParameter<int>(data, 'followUpDebtTab'),
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'SearchCollectionPP': (data) async => ParameterData(
        allParams: {
          'followUpDebtTab': getParameter<int>(data, 'followUpDebtTab'),
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'register': ParameterData.none(),
  'InterestPage': (data) async => ParameterData(
        allParams: {
          'contno': getParameter<String>(data, 'contno'),
          'dbName': getParameter<String>(data, 'dbName'),
        },
      ),
  'QRCode': (data) async => ParameterData(
        allParams: {
          'followUpDebtTab': getParameter<int>(data, 'followUpDebtTab'),
        },
      ),
  'RecordVideoPage': ParameterData.none(),
  'RecordVideoCustomer': (data) async => ParameterData(
        allParams: {
          'vloanApiUrl': getParameter<String>(data, 'vloanApiUrl'),
        },
      ),
  'RecordVideoCustomer2': (data) async => ParameterData(
        allParams: {
          'contNo': getParameter<String>(data, 'contNo'),
          'checkApp': getParameter<String>(data, 'checkApp'),
        },
      ),
  'RecordVideoCustomer3': (data) async => ParameterData(
        allParams: {
          'contNo': getParameter<String>(data, 'contNo'),
          'checkType': getParameter<String>(data, 'checkType'),
        },
      ),
  'SuperAppNewPage': (data) async => ParameterData(
        allParams: {
          'dailyText': getParameter<String>(data, 'dailyText'),
        },
      ),
  'WebviewPage': (data) async => ParameterData(
        allParams: {
          'titleName': getParameter<String>(data, 'titleName'),
          'webUrl': getParameter<String>(data, 'webUrl'),
        },
      ),
  'Roadmapinsurance': ParameterData.none(),
  'CarSeizedPageStep1': ParameterData.none(),
  'CarSeizedDashboardPage': (data) async => ParameterData(
        allParams: {
          'fromPage': getParameter<String>(data, 'fromPage'),
          'userRoleRead': getParameter<String>(data, 'userRoleRead'),
          'userRoleSave': getParameter<String>(data, 'userRoleSave'),
          'userRoleEdit': getParameter<String>(data, 'userRoleEdit'),
          'userRolePrice': getParameter<String>(data, 'userRolePrice'),
        },
      ),
  'CustomerCarDeailsStep1': (data) async => ParameterData(
        allParams: {
          'step': getParameter<String>(data, 'step'),
          'userRoleRead': getParameter<String>(data, 'userRoleRead'),
          'userRoleSave': getParameter<String>(data, 'userRoleSave'),
          'userRoleEdit': getParameter<String>(data, 'userRoleEdit'),
        },
      ),
  'SampleCarImageStep1': (data) async => ParameterData(
        allParams: {
          'imageName': getParameter<String>(data, 'imageName'),
          'contNoType': getParameter<String>(data, 'contNoType'),
          'numberOfImage': getParameter<String>(data, 'numberOfImage'),
        },
      ),
  'CustomerCarDeailsStep4': (data) async => ParameterData(
        allParams: {
          'step': getParameter<String>(data, 'step'),
          'userRoleRead': getParameter<String>(data, 'userRoleRead'),
          'userRoleSave': getParameter<String>(data, 'userRoleSave'),
          'userRoleEdit': getParameter<String>(data, 'userRoleEdit'),
        },
      ),
  'TypePicStep1': ParameterData.none(),
  'CustomerBikeDetailsStep1': ParameterData.none(),
  'CustomerBikeDeailsStep4': ParameterData.none(),
  'CarSeizedSelectDashboard': (data) async => ParameterData(
        allParams: {
          'isFromNotiPage': getParameter<String>(data, 'isFromNotiPage'),
          'contNoNoti': getParameter<String>(data, 'contNoNoti'),
        },
      ),
  'searchCustomersGD': (data) async => ParameterData(
        allParams: {
          'fromPage': getParameter<String>(data, 'fromPage'),
          'step': getParameter<String>(data, 'step'),
          'textShow': getParameter<String>(data, 'textShow'),
          'userRoleRead': getParameter<String>(data, 'userRoleRead'),
          'userRoleSave': getParameter<String>(data, 'userRoleSave'),
          'userRoleEdit': getParameter<String>(data, 'userRoleEdit'),
          'contractNumber': getParameter<String>(data, 'contractNumber'),
          'userRolePrice': getParameter<String>(data, 'userRolePrice'),
          'contNoFromNoti': getParameter<String>(data, 'contNoFromNoti'),
        },
      ),
  'customerCarDeailsPictureStep1': (data) async => ParameterData(
        allParams: {
          'step': getParameter<String>(data, 'step'),
          'userRoleRead': getParameter<String>(data, 'userRoleRead'),
          'userRoleSave': getParameter<String>(data, 'userRoleSave'),
          'fromPage': getParameter<String>(data, 'fromPage'),
          'impoundCarStatusName':
              getParameter<String>(data, 'impoundCarStatusName'),
          'userRoleEdit': getParameter<String>(data, 'userRoleEdit'),
          'fromPage2': getParameter<String>(data, 'fromPage2'),
        },
      ),
  'customerCarDeailsPictureStep12': ParameterData.none(),
  'ChangeCarLocationPage': (data) async => ParameterData(
        allParams: {
          'step': getParameter<String>(data, 'step'),
          'userRoleRead': getParameter<String>(data, 'userRoleRead'),
          'userRoleSave': getParameter<String>(data, 'userRoleSave'),
          'fromPage': getParameter<String>(data, 'fromPage'),
          'impoundCarStatusId':
              getParameter<String>(data, 'impoundCarStatusId'),
          'impoundCarStatusCode':
              getParameter<String>(data, 'impoundCarStatusCode'),
          'impoundCarStatusName':
              getParameter<String>(data, 'impoundCarStatusName'),
          'userRoleEdit': getParameter<String>(data, 'userRoleEdit'),
        },
      ),
  'calendarPage': ParameterData.none(),
  'TestPage': (data) async => ParameterData(
        allParams: {
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'ScanQR': ParameterData.none(),
  'BranchSelectedPage': ParameterData.none(),
  'WebviewNewPage': (data) async => ParameterData(
        allParams: {
          'webUrl': getParameter<String>(data, 'webUrl'),
          'branchCodeSearch': getParameter<String>(data, 'branchCodeSearch'),
          'levelSearch': getParameter<String>(data, 'levelSearch'),
          'regionAccessToken': getParameter<String>(data, 'regionAccessToken'),
          'regionEmployeeId': getParameter<String>(data, 'regionEmployeeId'),
        },
      ),
  'trackingEmpPage': (data) async => ParameterData(
        allParams: {
          'employeeId': getParameter<String>(data, 'employeeId'),
          'employeeName': getParameter<String>(data, 'employeeName'),
          'employeeBranchCode':
              getParameter<String>(data, 'employeeBranchCode'),
          'employeePositionName':
              getParameter<String>(data, 'employeePositionName'),
          'selectedDate': getParameter<String>(data, 'selectedDate'),
          'index': getParameter<int>(data, 'index'),
        },
      ),
  'SearchEmployeePage': ParameterData.none(),
  'SearchEmployeePage2': ParameterData.none(),
  'searchableemp': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'RemarkTypeDPage': (data) async => ParameterData(
        allParams: {
          'recordId': getParameter<String>(data, 'recordId'),
          'coordinate': getParameter<String>(data, 'coordinate'),
          'remark': getParameter<String>(data, 'remark'),
          'clockIn': getParameter<DateTime>(data, 'clockIn'),
          'contNo': getParameter<String>(data, 'contNo'),
          'remarkTypeDName': getParameter<String>(data, 'remarkTypeDName'),
          'cusName': getParameter<String>(data, 'cusName'),
          'filesCount': getParameter<int>(data, 'filesCount'),
        },
      ),
  'LeadNotiNewPage': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'WebviewNewPageCopy': (data) async => ParameterData(
        allParams: {
          'webUrl': getParameter<String>(data, 'webUrl'),
          'branchCodeSearch': getParameter<String>(data, 'branchCodeSearch'),
          'levelSearch': getParameter<String>(data, 'levelSearch'),
          'regionAccessToken': getParameter<String>(data, 'regionAccessToken'),
          'regionEmployeeId': getParameter<String>(data, 'regionEmployeeId'),
        },
      ),
  'searchQRCustomerPage': (data) async => ParameterData(
        allParams: {
          'followUpDebtTab': getParameter<int>(data, 'followUpDebtTab'),
        },
      ),
  'detailQRCustomerPage': (data) async => ParameterData(
        allParams: {
          'cusCod': getParameter<String>(data, 'cusCod'),
          'name': getParameter<String>(data, 'name'),
          'lastName': getParameter<String>(data, 'lastName'),
          'followupDebtTab': getParameter<int>(data, 'followupDebtTab'),
          'fromIconCall': getParameter<bool>(data, 'fromIconCall'),
        },
      ),
  'paymentQRcode': (data) async => ParameterData(
        allParams: {
          'firstName': getParameter<String>(data, 'firstName'),
          'lastName': getParameter<String>(data, 'lastName'),
        },
      ),
  'GroupChatAddPage': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'ChatRoomSettingPage': (data) async => ParameterData(
        allParams: {
          'chatRoomDocRef':
              getParameter<DocumentReference>(data, 'chatRoomDocRef'),
        },
      ),
  'SelfieMaskPage': ParameterData.none(),
  'customerCarDeailsDocumentStep1': (data) async => ParameterData(
        allParams: {
          'step': getParameter<String>(data, 'step'),
          'userRoleRead': getParameter<String>(data, 'userRoleRead'),
          'userRoleSave': getParameter<String>(data, 'userRoleSave'),
          'fromPage': getParameter<String>(data, 'fromPage'),
          'impoundCarStatusName':
              getParameter<String>(data, 'impoundCarStatusName'),
          'userRoleEdit': getParameter<String>(data, 'userRoleEdit'),
          'fromPage2': getParameter<String>(data, 'fromPage2'),
        },
      ),
  'AddPeoplePage': (data) async => ParameterData(
        allParams: {
          'chatRoomDocRef':
              getParameter<DocumentReference>(data, 'chatRoomDocRef'),
        },
      ),
  'RP72CheckListPage': (data) async => ParameterData(
        allParams: {
          'firstname': getParameter<String>(data, 'firstname'),
          'lastname': getParameter<String>(data, 'lastname'),
          'contNo': getParameter<String>(data, 'contNo'),
          'remarkTypeName': getParameter<String>(data, 'remarkTypeName'),
        },
      ),
  'ew9tf0uewitf': ParameterData.none(),
  'QRComplain': ParameterData.none(),
  'BotChattingPage': ParameterData.none(),
  'LeadNotiNewPageDup': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'LeadDashboardPageDraft': ParameterData.none(),
  'LeadDashboardPageCopy': ParameterData.none(),
  'LeadDashboardPageCopyCopy': ParameterData.none(),
  'LeadDashboardPage': ParameterData.none(),
  'imagesMPage': ParameterData.none(),
  'tabCollectionExtraM': ParameterData.none(),
  'tabCollectionTeamMPage': (data) async => ParameterData(
        allParams: {
          'branchCode': getParameter<String>(data, 'branchCode'),
          'profileLevel': getParameter<String>(data, 'profileLevel'),
        },
      ),
  'SettingAppPage': (data) async => ParameterData(
        allParams: {
          'fromPage': getParameter<String>(data, 'fromPage'),
        },
      ),
  'ChangePinCodePage': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
