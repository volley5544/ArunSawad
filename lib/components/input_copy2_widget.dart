import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'input_copy2_model.dart';
export 'input_copy2_model.dart';

class InputCopy2Widget extends StatefulWidget {
  const InputCopy2Widget({
    Key? key,
    this.leaveID,
    this.employeeID,
    this.leaveName,
    this.isFromApprovePage,
  }) : super(key: key);

  final String? leaveID;
  final String? employeeID;
  final String? leaveName;
  final bool? isFromApprovePage;

  @override
  _InputCopy2WidgetState createState() => _InputCopy2WidgetState();
}

class _InputCopy2WidgetState extends State<InputCopy2Widget> {
  late InputCopy2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputCopy2Model());

    _model.reasonCancelController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FutureBuilder<List<UserCustomRecord>>(
          future: queryUserCustomRecordOnce(
            queryBuilder: (userCustomRecord) => userCustomRecord.where(
                'employee_id',
                isEqualTo: widget.employeeID != '' ? widget.employeeID : null),
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
            List<UserCustomRecord> containerUserCustomRecordList =
                snapshot.data!;
            final containerUserCustomRecord =
                containerUserCustomRecordList.isNotEmpty
                    ? containerUserCustomRecordList.first
                    : null;
            return Container(
              width: double.infinity,
              height: 270.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 10.0),
                child: FutureBuilder<List<FCMTokenRecord>>(
                  future: queryFCMTokenRecordOnce(
                    queryBuilder: (fCMTokenRecord) => fCMTokenRecord
                        .where('employee_id',
                            isEqualTo: widget.employeeID != ''
                                ? widget.employeeID
                                : null)
                        .orderBy('created_at', descending: true),
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
                    List<FCMTokenRecord> columnPlusFCMTokenRecordList =
                        snapshot.data!;
                    final columnPlusFCMTokenRecord =
                        columnPlusFCMTokenRecordList.isNotEmpty
                            ? columnPlusFCMTokenRecordList.first
                            : null;
                    return SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SelectionArea(
                                    child: Text(
                                  'ยืนยันยกเลิกการลา',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: TextFormField(
                                      controller: _model.reasonCancelController,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'ระบุเหตุผล...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 40.0, 24.0, 0.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      maxLines: 4,
                                      validator: _model
                                          .reasonCancelControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                      text: 'ยกเลิก',
                                      options: FFButtonOptions(
                                        width: 130.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFFB32A33),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        var _shouldSetState = false;
                                        if (!(_model.reasonCancelController
                                                    .text !=
                                                null &&
                                            _model.reasonCancelController
                                                    .text !=
                                                '')) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content: Text(
                                                    'กรุณากรอกเหตุผลที่ยกเลิก'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'คุณต้องการยกเลิกวันลาใช่หรือไม่'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text('ไม่'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child: Text('ใช่'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          _model.leaveListCancelAPIOutput =
                                              await LeaveListCancelAPICall.call(
                                            apiUrl:
                                                FFAppState().apiURLLocalState,
                                            token: FFAppState().accessToken,
                                            leaveId: widget.leaveID,
                                            reasonCancel:
                                                valueOrDefault<String>(
                                              _model
                                                  .reasonCancelController.text,
                                              '[cancel_reason]',
                                            ),
                                          );
                                          _shouldSetState = true;
                                          if ((_model.leaveListCancelAPIOutput
                                                      ?.statusCode ??
                                                  200) ==
                                              200) {
                                            if (LeaveListCancelAPICall
                                                    .infoStatus(
                                                  (_model.leaveListCancelAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                ) ==
                                                201) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        LeaveListCancelAPICall
                                                            .infoDetail(
                                                      (_model.leaveListCancelAPIOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ).toString()),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        LeaveListCancelAPICall
                                                            .infoDetail(
                                                      (_model.leaveListCancelAPIOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ).toString()),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }

                                            if (widget.isFromApprovePage!) {
                                              if (containerUserCustomRecord !=
                                                  null) {
                                                _model.fcmSendNotificationCancelApprove =
                                                    await SendFCMNotificationAPICall
                                                        .call(
                                                  to: columnPlusFCMTokenRecord!
                                                      .fcmToken,
                                                  notificationJson:
                                                      getJsonField(
                                                    functions.createNotificationBody(
                                                        'คำขอ \"${widget.leaveName}\" ของคุณ ถูกยกเลิกแล้ว',
                                                        'คำขออนุมัติการลา',
                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/test-flow-l46o23/assets/xqqgm3jn0hu4/leaveimg2.png'),
                                                    r'''$''',
                                                  ),
                                                  dataJson: functions
                                                      .createNotificationDataBody(
                                                          'Leave_Request'),
                                                );
                                                _shouldSetState = true;
                                                if ((_model.fcmSendNotificationCancelApprove
                                                            ?.statusCode ??
                                                        200) !=
                                                    200) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'พบข้อผิดพลาดNotification (${(_model.fcmSendNotificationCancelApprove?.statusCode ?? 200).toString()})',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 3000),
                                                      backgroundColor:
                                                          Color(0xB2000000),
                                                    ),
                                                  );
                                                }

                                                final notificationCreateData =
                                                    createNotificationRecordData(
                                                  notiTime: getCurrentTimestamp,
                                                  notiTitle: 'คำขออนุมัติการลา',
                                                  notiBody:
                                                      'คำขอ \"${widget.leaveName}\" ของคุณ ถูกยกเลิกแล้ว',
                                                  notiIsRead: false,
                                                  thisNotiIsRead: false,
                                                  notiType: 'Leave_Request',
                                                );
                                                var notificationRecordReference =
                                                    NotificationRecord.createDoc(
                                                        containerUserCustomRecord!
                                                            .reference);
                                                await notificationRecordReference
                                                    .set(
                                                        notificationCreateData);
                                                _model.createCancelApproveNotification =
                                                    NotificationRecord
                                                        .getDocumentFromData(
                                                            notificationCreateData,
                                                            notificationRecordReference);
                                                _shouldSetState = true;
                                              }
                                            }
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(
                                                      'พบข้อผิดพลาด (${(_model.leaveListCancelAPIOutput?.statusCode ?? 200).toString()})'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }

                                          Navigator.pop(context);
                                        } else {
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }

                                        if (_shouldSetState) setState(() {});
                                      },
                                      text: 'ตกลง',
                                      options: FFButtonOptions(
                                        width: 130.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF00968A),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
