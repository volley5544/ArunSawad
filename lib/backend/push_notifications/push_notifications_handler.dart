import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

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

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
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
        allParams: {},
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
  'SuccessPage': ParameterData.none(),
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
  'EmployeeKPIPage': ParameterData.none(),
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
          'userBProfileImage': getParameter<String>(data, 'userBProfileImage'),
          'userBDocRef': getParameter<DocumentReference>(data, 'userBDocRef'),
          'userBName': getParameter<String>(data, 'userBName'),
          'userBNickname': getParameter<String>(data, 'userBNickname'),
          'userBEmployeeId': getParameter<String>(data, 'userBEmployeeId'),
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
        },
      ),
  'List10OrderHistory': ParameterData.none(),
  'detailListFollowUpDebt': (data) async => ParameterData(
        allParams: {
          'cusCod': getParameter<String>(data, 'cusCod'),
          'name': getParameter<String>(data, 'name'),
          'lastName': getParameter<String>(data, 'lastName'),
          'followupDebtTab': getParameter<int>(data, 'followupDebtTab'),
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
  'tabCollection': ParameterData.none(),
  'SearchCollectionPage': (data) async => ParameterData(
        allParams: {
          'followUpDebtTab': getParameter<int>(data, 'followUpDebtTab'),
        },
      ),
  'SearchCollectionPP': (data) async => ParameterData(
        allParams: {
          'followUpDebtTab': getParameter<int>(data, 'followUpDebtTab'),
        },
      ),
  'register': ParameterData.none(),
  'InterestPage': (data) async => ParameterData(
        allParams: {
          'contno': getParameter<String>(data, 'contno'),
        },
      ),
  'QRCode': (data) async => ParameterData(
        allParams: {
          'followUpDebtTab': getParameter<int>(data, 'followUpDebtTab'),
        },
      ),
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
