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
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
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

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'LoginPage': (data) async => LoginPageWidget(
        apiURL: getParameter(data, 'apiURL'),
      ),
  'PinCodePage': (data) async => PinCodePageWidget(),
  'SetPinCodePage': (data) async => SetPinCodePageWidget(),
  'Dashboard': (data) async => DashboardWidget(
        jwtToken: getParameter(data, 'jwtToken'),
      ),
  'CheckInPage': (data) async => CheckInPageWidget(
        location1: await getDocumentParameter(
            data, 'location1', CityRecord.serializer),
        recordId: getParameter(data, 'recordId'),
        coordinate: getParameter(data, 'coordinate'),
        remark: getParameter(data, 'remark'),
        clockIn: getParameter(data, 'clockIn'),
      ),
  'SurveyPage': (data) async => SurveyPageWidget(
        location1: await getDocumentParameter(
            data, 'location1', CityRecord.serializer),
        recordId: getParameter(data, 'recordId'),
        coordinate: getParameter(data, 'coordinate'),
        description: getParameter(data, 'description'),
        idCardNumber: getParameter(data, 'idCardNumber'),
        customerName: getParameter(data, 'customerName'),
        landmark: getParameter(data, 'landmark'),
        remark: getParameter(data, 'remark'),
        clockIn: getParameter(data, 'clockIn'),
      ),
  'MyProfilePage': (data) async => NavBarPage(initialPage: 'MyProfilePage'),
  'LeadNotiPage': (data) async => LeadNotiPageWidget(
        color: [],
      ),
  'CollectionPage': (data) async => CollectionPageWidget(
        location1: await getDocumentParameter(
            data, 'location1', CityRecord.serializer),
        coordinate: getParameter(data, 'coordinate'),
        idCardNumber: getParameter(data, 'idCardNumber'),
        contNo: getParameter(data, 'contNo'),
        customerName: getParameter(data, 'customerName'),
        remark: getParameter(data, 'remark'),
        recordId: getParameter(data, 'recordId'),
        clockIn: getParameter(data, 'clockIn'),
      ),
  'MarketingPage': (data) async => MarketingPageWidget(
        location1: await getDocumentParameter(
            data, 'location1', CityRecord.serializer),
        coordinate: getParameter(data, 'coordinate'),
        branchCode: getParameter(data, 'branchCode'),
        area: getParameter(data, 'area'),
        detail: getParameter(data, 'detail'),
        remark: getParameter(data, 'remark'),
        recordId: getParameter(data, 'recordId'),
        clockIn: getParameter(data, 'clockIn'),
      ),
  'OPSpage': (data) async => OPSpageWidget(
        location1: await getDocumentParameter(
            data, 'location1', CityRecord.serializer),
        recordId: getParameter(data, 'recordId'),
        coordinate: getParameter(data, 'coordinate'),
        branchCode: getParameter(data, 'branchCode'),
        asset: getParameter(data, 'asset'),
        assetType: getParameter(data, 'assetType'),
        carPlateNo: getParameter(data, 'carPlateNo'),
        signboardStatus: getParameter(data, 'signboardStatus'),
        remark: getParameter(data, 'remark'),
      ),
  'NPApage': (data) async => NPApageWidget(
        location1: await getDocumentParameter(
            data, 'location1', CityRecord.serializer),
        recordId: getParameter(data, 'recordId'),
        coordinate: getParameter(data, 'coordinate'),
        assetId: getParameter(data, 'assetId'),
        remark: getParameter(data, 'remark'),
        clockIn: getParameter(data, 'clockIn'),
      ),
  'CheckerPage': (data) async => CheckerPageWidget(
        location1: await getDocumentParameter(
            data, 'location1', CityRecord.serializer),
        recordId: getParameter(data, 'recordId'),
        coordinate: getParameter(data, 'coordinate'),
        idCardNumber: getParameter(data, 'idCardNumber'),
        contNo: getParameter(data, 'contNo'),
        customerName: getParameter(data, 'customerName'),
        remark: getParameter(data, 'remark'),
        clockIn: getParameter(data, 'clockIn'),
      ),
  'TimeSheetPage': (data) async => TimeSheetPageWidget(),
  'ForgotPasswordPage': (data) async => ForgotPasswordPageWidget(),
  'SuccessPage': (data) async => SuccessPageWidget(),
  'CheckInPageCopy': (data) async => CheckInPageCopyWidget(
        location1: await getDocumentParameter(
            data, 'location1', CityRecord.serializer),
      ),
  'MarketingPageCopy': (data) async => MarketingPageCopyWidget(
        location1: await getDocumentParameter(
            data, 'location1', CityRecord.serializer),
        materialID: await getDocumentParameter(
            data, 'materialID', MaterialRecord.serializer),
      ),
  'NPApageCopy': (data) async => NPApageCopyWidget(
        location1: await getDocumentParameter(
            data, 'location1', CityRecord.serializer),
      ),
  'OPSpageCopy': (data) async => OPSpageCopyWidget(
        location1: await getDocumentParameter(
            data, 'location1', CityRecord.serializer),
      ),
  'FormServicePage': (data) async => FormServicePageWidget(
        formServiceName: getParameter(data, 'formServiceName'),
        formServiceUrl: getParameter(data, 'formServiceUrl'),
      ),
  'GenQRPage': (data) async => GenQRPageWidget(),
  'LeadSurveyRegisPage': (data) async => LeadSurveyRegisPageWidget(),
  'SaleskitPage': (data) async => SaleskitPageWidget(),
  'ClassroomPage': (data) async => ClassroomPageWidget(),
  'ITSupportPage': (data) async => ITSupportPageWidget(),
  'ActionLogPage': (data) async => ActionLogPageWidget(),
  'IntrodutionPage': (data) async => IntrodutionPageWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

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
