import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'set_pin_code_page_model.dart';
export 'set_pin_code_page_model.dart';

class SetPinCodePageWidget extends StatefulWidget {
  const SetPinCodePageWidget({Key? key}) : super(key: key);

  @override
  _SetPinCodePageWidgetState createState() => _SetPinCodePageWidgetState();
}

class _SetPinCodePageWidgetState extends State<SetPinCodePageWidget> {
  late SetPinCodePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetPinCodePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SetPinCodePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().isLoadedInsuranceData = false;
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<SplashPageHolidayImgRecord>>(
      stream: querySplashPageHolidayImgRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        List<SplashPageHolidayImgRecord>
            setPinCodePageSplashPageHolidayImgRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final setPinCodePageSplashPageHolidayImgRecord =
            setPinCodePageSplashPageHolidayImgRecordList.isNotEmpty
                ? setPinCodePageSplashPageHolidayImgRecordList.first
                : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              appBar: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                title: Text(
                  'กรุณาใส่รหัสพินตัวเลข',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                actions: [],
                centerTitle: true,
                elevation: 0.0,
              ),
              body: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'ตั้งพินของคุณ',
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                44.0, 8.0, 44.0, 0.0),
                            child: Text(
                              'รหัสพินนี้จะใช้ในการเข้าสู่ระบบในครั้งถัดไป',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 32.0, 12.0, 0.0),
                            child: PinCodeTextField(
                              autoDisposeControllers: false,
                              appContext: context,
                              length: 6,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              enableActiveFill: false,
                              autoFocus: true,
                              enablePinAutofill: true,
                              errorTextSpace: 16.0,
                              showCursor: false,
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              obscureText: false,
                              hintCharacter: '-',
                              pinTheme: PinTheme(
                                fieldHeight: 55.0,
                                fieldWidth: 50.0,
                                borderWidth: 2.0,
                                borderRadius: BorderRadius.circular(12.0),
                                shape: PinCodeFieldShape.box,
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                selectedColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                activeFillColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveFillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                selectedFillColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                              controller: _model.pinCodeController,
                              onChanged: (_) {},
                              onCompleted: (_) async {
                                FFAppState().update(() {
                                  FFAppState().DateHoliday =
                                      setPinCodePageSplashPageHolidayImgRecord!
                                          .date;
                                  FFAppState().DateExpHoliday =
                                      setPinCodePageSplashPageHolidayImgRecord!
                                          .dateExp;
                                });
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: _model.pinCodeControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 44.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          currentUserLocationValue =
                              await getCurrentUserLocation(
                                  defaultLocation: LatLng(0.0, 0.0));
                          var _shouldSetState = false;
                          HapticFeedback.mediumImpact();
                          if (!(_model.pinCodeController!.text != null &&
                              _model.pinCodeController!.text != '')) {
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
                          if (!functions.checkPinCodeInput(
                              _model.pinCodeController!.text)) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  content:
                                      Text('กรุณาใส่รหัสพิน6หลัก (ตัวเลข)'),
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
                          _model.checkDeviceLocationBeforeSetPin =
                              await actions.a1();
                          _shouldSetState = true;
                          if (!_model.checkDeviceLocationBeforeSetPin!) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
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
                          _model.checkDeviceLocPerBeforeSetPin =
                              await actions.a2();
                          _shouldSetState = true;
                          if (!_model.checkDeviceLocPerBeforeSetPin!) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
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
                          _model.checkLatLngBeforeSetPin = await actions.a8(
                            currentUserLocationValue,
                          );
                          _shouldSetState = true;
                          if (!_model.checkLatLngBeforeSetPin!) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  content:
                                      Text('กรุณาเปิดGPSและทำรายการอีกครั้ง'),
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
                          FFAppState().update(() {
                            FFAppState().pinCodeAuthen =
                                _model.pinCodeController!.text;
                            FFAppState().isFromSetPinPage = true;
                          });

                          final userLogCreateData = createUserLogRecordData(
                            employeeId: FFAppState().employeeID,
                            action: 'Set_Pin_Code',
                            actionTime: getCurrentTimestamp,
                            userLocation: currentUserLocationValue,
                          );
                          var userLogRecordReference =
                              UserLogRecord.collection.doc();
                          await userLogRecordReference.set(userLogCreateData);
                          _model.createdUserLogSetPin =
                              UserLogRecord.getDocumentFromData(
                                  userLogCreateData, userLogRecordReference);
                          _shouldSetState = true;

                          context.goNamed('SuperAppPage');

                          if (_shouldSetState) setState(() {});
                        },
                        text: 'ยืนยัน',
                        options: FFButtonOptions(
                          width: 270.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryText,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
