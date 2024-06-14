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
import 'package:webviewx_plus/webviewx_plus.dart';
import 'set_pin_code_page_model.dart';
export 'set_pin_code_page_model.dart';

class SetPinCodePageWidget extends StatefulWidget {
  const SetPinCodePageWidget({super.key});

  @override
  State<SetPinCodePageWidget> createState() => _SetPinCodePageWidgetState();
}

class _SetPinCodePageWidgetState extends State<SetPinCodePageWidget> {
  late SetPinCodePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetPinCodePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SetPinCodePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isLoadedInsuranceData = false;
      FFAppState().update(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

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
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).tertiary,
                  ),
                ),
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
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
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
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        letterSpacing: 0.0,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 0.0,
              ),
              body: SafeArea(
                top: true,
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
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                44.0, 8.0, 44.0, 0.0),
                            child: Text(
                              'รหัสพินนี้จะใช้ในการเข้าสู่ระบบในครั้งถัดไป',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
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
                                    letterSpacing: 0.0,
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
                              keyboardType: TextInputType.number,
                              pinTheme: PinTheme(
                                fieldHeight: 55.0,
                                fieldWidth: 50.0,
                                borderWidth: 2.0,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
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
                                FFAppState().DateHoliday =
                                    setPinCodePageSplashPageHolidayImgRecord
                                        ?.date;
                                FFAppState().DateExpHoliday =
                                    setPinCodePageSplashPageHolidayImgRecord
                                        ?.dateExp;
                                FFAppState().update(() {});
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
                      child: AuthUserStreamWidget(
                        builder: (context) =>
                            FutureBuilder<List<UserCustomRecord>>(
                          future: queryUserCustomRecordOnce(
                            queryBuilder: (userCustomRecord) =>
                                userCustomRecord.where(
                              'employee_id',
                              isEqualTo: valueOrDefault(
                                          currentUserDocument?.employeeId, 0) >=
                                      100000
                                  ? valueOrDefault(
                                          currentUserDocument?.employeeId, 0)
                                      .toString()
                                  : FFAppState().employeeID != ''
                                      ? valueOrDefault(
                                                  currentUserDocument
                                                      ?.employeeId,
                                                  0) >=
                                              100000
                                          ? valueOrDefault(
                                                  currentUserDocument
                                                      ?.employeeId,
                                                  0)
                                              .toString()
                                          : FFAppState().employeeID
                                      : null,
                            ),
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
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).tertiary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<UserCustomRecord> buttonUserCustomRecordList =
                                snapshot.data!;
                            final buttonUserCustomRecord =
                                buttonUserCustomRecordList.isNotEmpty
                                    ? buttonUserCustomRecordList.first
                                    : null;
                            return FFButtonWidget(
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
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              'กรุณาใส่รหัสพิน6หลัก (ตัวเลข)'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ),
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
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content:
                                              Text('กรุณาเปิดGPS ก่อนทำรายการ'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ),
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
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              'กรุณาอณุญาตให้อรุณสวัสดิ์เข้าถึงGPSของคุณ'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                                _model.checkLatLngBeforeSetPin =
                                    await actions.a8(
                                  currentUserLocationValue,
                                );
                                _shouldSetState = true;
                                if (!_model.checkLatLngBeforeSetPin!) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              'กรุณาเปิดGPSและทำรายการอีกครั้ง'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                                FFAppState().pinCodeAuthen =
                                    _model.pinCodeController!.text;
                                FFAppState().isFromSetPinPage = true;
                                FFAppState().update(() {});
                                FFAppState().userRef =
                                    buttonUserCustomRecord?.reference;
                                FFAppState().profileImage =
                                    buttonUserCustomRecord!.imgProfile;
                                setState(() {});

                                var userLogRecordReference =
                                    UserLogRecord.collection.doc();
                                await userLogRecordReference
                                    .set(createUserLogRecordData(
                                  employeeId: valueOrDefault(
                                              currentUserDocument?.employeeId,
                                              0) >=
                                          100000
                                      ? valueOrDefault(
                                              currentUserDocument?.employeeId,
                                              0)
                                          .toString()
                                      : FFAppState().employeeID,
                                  action: 'Set_Pin_Code',
                                  actionTime: getCurrentTimestamp,
                                  userLocation: currentUserLocationValue,
                                ));
                                _model.createdUserLogSetPin =
                                    UserLogRecord.getDocumentFromData(
                                        createUserLogRecordData(
                                          employeeId: valueOrDefault(
                                                      currentUserDocument
                                                          ?.employeeId,
                                                      0) >=
                                                  100000
                                              ? valueOrDefault(
                                                      currentUserDocument
                                                          ?.employeeId,
                                                      0)
                                                  .toString()
                                              : FFAppState().employeeID,
                                          action: 'Set_Pin_Code',
                                          actionTime: getCurrentTimestamp,
                                          userLocation:
                                              currentUserLocationValue,
                                        ),
                                        userLogRecordReference);
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
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            );
                          },
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
