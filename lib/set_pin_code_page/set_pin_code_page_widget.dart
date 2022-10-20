import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SetPinCodePageWidget extends StatefulWidget {
  const SetPinCodePageWidget({Key? key}) : super(key: key);

  @override
  _SetPinCodePageWidgetState createState() => _SetPinCodePageWidgetState();
}

class _SetPinCodePageWidgetState extends State<SetPinCodePageWidget> {
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController? pinCodeController;
  UserLogRecord? createdUserLogSetPin;
  bool? checkDeviceLocPerBeforeSetPin;
  bool? checkDeviceLocationBeforeSetPin;
  bool? checkLatLngBeforeSetPin;

  @override
  void initState() {
    super.initState();
    pinCodeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'กรุณาใส่รหัสพิน',
          style: FlutterFlowTheme.of(context).bodyText1,
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'ตั้งพินของคุณ',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(44, 8, 44, 0),
                      child: Text(
                        'รหัสพินนี้จะใช้ในการเข้าสู่ระบบในครั้งถัดไป',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 32, 12, 0),
                      child: PinCodeTextField(
                        appContext: context,
                        length: 6,
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle2
                            .override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        enableActiveFill: false,
                        autoFocus: true,
                        showCursor: false,
                        cursorColor: FlutterFlowTheme.of(context).primaryColor,
                        obscureText: false,
                        hintCharacter: '-',
                        pinTheme: PinTheme(
                          fieldHeight: 55,
                          fieldWidth: 50,
                          borderWidth: 2,
                          borderRadius: BorderRadius.circular(12),
                          shape: PinCodeFieldShape.box,
                          activeColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          inactiveColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          selectedColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          activeFillColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          inactiveFillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          selectedFillColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                        controller: pinCodeController,
                        onChanged: (_) => {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 44),
                child: FFButtonWidget(
                  onPressed: () async {
                    currentUserLocationValue = await getCurrentUserLocation(
                        defaultLocation: LatLng(0.0, 0.0));
                    var _shouldSetState = false;
                    HapticFeedback.mediumImpact();
                    if (!(pinCodeController!.text != null &&
                        pinCodeController!.text != '')) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'กรุณาใส่พิน',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          duration: Duration(milliseconds: 3000),
                          backgroundColor: Color(0xCC000000),
                        ),
                      );
                      if (_shouldSetState) setState(() {});
                      return;
                    }
                    if (!functions.checkPinCodeInput(pinCodeController!.text)) {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('ระบบ'),
                            content: Text('กรุณาใส่รหัสพิน6หลัก (ตัวเลข)'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                      if (_shouldSetState) setState(() {});
                      return;
                    }
                    checkDeviceLocationBeforeSetPin = await actions.a1();
                    _shouldSetState = true;
                    if (!checkDeviceLocationBeforeSetPin!) {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('ระบบ'),
                            content: Text('กรุณาเปิดGPS ก่อนทำรายการ'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                      if (_shouldSetState) setState(() {});
                      return;
                    }
                    checkDeviceLocPerBeforeSetPin = await actions.a2();
                    _shouldSetState = true;
                    if (!checkDeviceLocPerBeforeSetPin!) {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('ระบบ'),
                            content: Text(
                                'กรุณาอณุญาตให้อรุณสวัสดิ์เข้าถึงGPSของคุณ'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                      if (_shouldSetState) setState(() {});
                      return;
                    }
                    checkLatLngBeforeSetPin = await actions.a8(
                      currentUserLocationValue,
                    );
                    _shouldSetState = true;
                    if (!checkLatLngBeforeSetPin!) {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('ระบบ'),
                            content: Text('กรุณาเปิดGPSและทำรายการอีกครั้ง'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                      if (_shouldSetState) setState(() {});
                      return;
                    }
                    setState(() =>
                        FFAppState().pinCodeAuthen = pinCodeController!.text);
                    setState(() => FFAppState().isFromSetPinPage = true);

                    final userLogCreateData = createUserLogRecordData(
                      employeeId: FFAppState().employeeID,
                      action: 'Set_Pin_Code',
                      actionTime: getCurrentTimestamp,
                      userLocation: currentUserLocationValue,
                    );
                    var userLogRecordReference = UserLogRecord.collection.doc();
                    await userLogRecordReference.set(userLogCreateData);
                    createdUserLogSetPin = UserLogRecord.getDocumentFromData(
                        userLogCreateData, userLogRecordReference);
                    _shouldSetState = true;

                    context.goNamed('SuperAppPage');

                    if (_shouldSetState) setState(() {});
                  },
                  text: 'ยืนยัน',
                  options: FFButtonOptions(
                    width: 270,
                    height: 50,
                    color: FlutterFlowTheme.of(context).primaryText,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                    elevation: 2,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
