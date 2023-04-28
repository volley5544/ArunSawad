import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene_widget.dart';
import '/components/p_d_f_viewer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'employee_k_p_i_page_model.dart';
export 'employee_k_p_i_page_model.dart';

class EmployeeKPIPageWidget extends StatefulWidget {
  const EmployeeKPIPageWidget({Key? key}) : super(key: key);

  @override
  _EmployeeKPIPageWidgetState createState() => _EmployeeKPIPageWidgetState();
}

class _EmployeeKPIPageWidgetState extends State<EmployeeKPIPageWidget> {
  late EmployeeKPIPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmployeeKPIPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EmployeeKPIPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Color(0x00000000),
        enableDrag: false,
        context: context,
        builder: (bottomSheetContext) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Padding(
              padding: MediaQuery.of(bottomSheetContext).viewInsets,
              child: Container(
                height: double.infinity,
                child: LoadingSceneWidget(),
              ),
            ),
          );
        },
      ).then((value) => setState(() {}));

      if (isAndroid) {
        await actions.allowScreenRecordAndroid();
      } else {
        await actions.allowScreenRecordIOS();
      }

      final userLogCreateData = createUserLogRecordData(
        employeeId: FFAppState().employeeID,
        action: 'KPI',
        actionTime: getCurrentTimestamp,
        userLocation: currentUserLocationValue,
      );
      var userLogRecordReference = UserLogRecord.collection.doc();
      await userLogRecordReference.set(userLogCreateData);
      _model.createdUserLogKPI = UserLogRecord.getDocumentFromData(
          userLogCreateData, userLogRecordReference);
      _model.getTargetContractKPI = await GetTargetContractKPIAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );
      if ((_model.getTargetContractKPI?.statusCode ?? 200) != 200) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text(
                  'พบข้อผิดพลาดContract (${(_model.getTargetContractKPI?.statusCode ?? 200).toString()})'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        return;
      }
      if (GetTargetContractKPIAPICall.statusLayer2(
            (_model.getTargetContractKPI?.jsonBody ?? ''),
          ) !=
          200) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text(
                  'พบข้อผิดพลาดLayer2 (${GetTargetContractKPIAPICall.statusLayer2(
                (_model.getTargetContractKPI?.jsonBody ?? ''),
              ).toString().toString()})'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        return;
      }
      if (GetTargetContractKPIAPICall.statusLayer3TM(
            (_model.getTargetContractKPI?.jsonBody ?? ''),
          ) ==
          200) {
        FFAppState().update(() {
          FFAppState().kpiProductType =
              (GetTargetContractKPIAPICall.productType(
            (_model.getTargetContractKPI?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList();
          FFAppState().kpiTargetQuantity =
              (GetTargetContractKPIAPICall.targetQuantity(
            (_model.getTargetContractKPI?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList();
        });
        FFAppState().update(() {
          FFAppState().kpiActual = (GetTargetContractKPIAPICall.actual(
            (_model.getTargetContractKPI?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()!
              .toList();
          FFAppState().kpiYearMonth = (GetTargetContractKPIAPICall.month(
            (_model.getTargetContractKPI?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()!
              .toList();
        });
        FFAppState().update(() {
          FFAppState().kpiEmployeePosition =
              (GetTargetContractKPIAPICall.position(
            (_model.getTargetContractKPI?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList();
        });
        FFAppState().update(() {
          FFAppState().areaResponsKPI = functions.showMatNameInList(
              (GetTargetContractKPIAPICall.areaRespons(
                (_model.getTargetContractKPI?.jsonBody ?? ''),
              ) as List)
                  .map<String>((s) => s.toString())
                  .toList()
                  ?.toList(),
              0)!;
        });
      } else {
        if (GetTargetContractKPIAPICall.statusLayer3TM(
              (_model.getTargetContractKPI?.jsonBody ?? ''),
            ) !=
            404) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                content: Text(
                    'พบข้อผิดพลาดContract Current Month (${GetTargetContractKPIAPICall.statusLayer3TM(
                  (_model.getTargetContractKPI?.jsonBody ?? ''),
                ).toString().toString()})'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
        }
      }

      if (GetTargetContractKPIAPICall.statusLayer3LM(
            (_model.getTargetContractKPI?.jsonBody ?? ''),
          ) ==
          200) {
        FFAppState().update(() {
          FFAppState().kpiProductTypeLM =
              (GetTargetContractKPIAPICall.productTypeLM(
            (_model.getTargetContractKPI?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList();
          FFAppState().kpiEmployeePositionLM =
              (GetTargetContractKPIAPICall.positionLM(
            (_model.getTargetContractKPI?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList();
          FFAppState().kpiActualLM = (GetTargetContractKPIAPICall.actualLM(
            (_model.getTargetContractKPI?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()!
              .toList();
          FFAppState().kpiTargetQuantityLM =
              (GetTargetContractKPIAPICall.targetQuantityLM(
            (_model.getTargetContractKPI?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()!
                  .toList();
          FFAppState().kpiYearMonthLM = (GetTargetContractKPIAPICall.monthLM(
            (_model.getTargetContractKPI?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()!
              .toList();
          FFAppState().kpiAreaResponsLM = functions.showMatNameInList(
              (GetTargetContractKPIAPICall.areaResponsLM(
                (_model.getTargetContractKPI?.jsonBody ?? ''),
              ) as List)
                  .map<String>((s) => s.toString())
                  .toList()
                  ?.toList(),
              0)!;
        });
      } else {
        if (GetTargetContractKPIAPICall.statusLayer3LM(
              (_model.getTargetContractKPI?.jsonBody ?? ''),
            ) !=
            404) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                content: Text(
                    'พบข้อผิดพลาดContract Last Month (${GetTargetContractKPIAPICall.statusLayer3LM(
                  (_model.getTargetContractKPI?.jsonBody ?? ''),
                ).toString().toString()})'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
        }
      }

      _model.getTargetBudget = await GetTargetBudgetKPIAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );
      if ((_model.getTargetBudget?.statusCode ?? 200) != 200) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text(
                  'พบข้อผิดพลาดBudget (${(_model.getTargetBudget?.statusCode ?? 200).toString()})'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        return;
      }
      if (GetTargetBudgetKPIAPICall.statusLayer2(
            (_model.getTargetBudget?.jsonBody ?? ''),
          ) !=
          200) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text(
                  'พบข้อผิดพลาดLayer2 (${GetTargetBudgetKPIAPICall.statusLayer2(
                (_model.getTargetBudget?.jsonBody ?? ''),
              ).toString().toString()})'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        return;
      }
      if (GetTargetBudgetKPIAPICall.statusLayer3TM(
            (_model.getTargetBudget?.jsonBody ?? ''),
          ) ==
          200) {
        FFAppState().update(() {
          FFAppState().kpiTargetBudget = valueOrDefault<String>(
            GetTargetBudgetKPIAPICall.targetBudget(
              (_model.getTargetBudget?.jsonBody ?? ''),
            ).toString(),
            '100.0',
          );
          FFAppState().kpiActualBudget = valueOrDefault<String>(
            GetTargetBudgetKPIAPICall.actual(
              (_model.getTargetBudget?.jsonBody ?? ''),
            ).toString(),
            '0.0',
          );
        });
        FFAppState().update(() {
          FFAppState().areaResponsKPI = valueOrDefault<String>(
            GetTargetBudgetKPIAPICall.areaRespons(
              (_model.getTargetBudget?.jsonBody ?? ''),
            ).toString(),
            '[area]',
          );
        });
      } else {
        if (GetTargetBudgetKPIAPICall.statusLayer3TM(
              (_model.getTargetBudget?.jsonBody ?? ''),
            ) !=
            404) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                content: Text(
                    'พบข้อผิดพลาดBudget Current Month (${GetTargetBudgetKPIAPICall.statusLayer3TM(
                  (_model.getTargetBudget?.jsonBody ?? ''),
                ).toString().toString()})'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
        }
      }

      if (GetTargetBudgetKPIAPICall.statusLayer3LM(
            (_model.getTargetBudget?.jsonBody ?? ''),
          ) ==
          200) {
        FFAppState().update(() {
          FFAppState().kpiTargetBudgetLM =
              GetTargetBudgetKPIAPICall.targetBudgetLM(
            (_model.getTargetBudget?.jsonBody ?? ''),
          ).toString();
          FFAppState().kpiActualBudgetLM =
              GetTargetBudgetKPIAPICall.actualBudgetLM(
            (_model.getTargetBudget?.jsonBody ?? ''),
          ).toString();
          FFAppState().kpiAreaResponsLM =
              GetTargetBudgetKPIAPICall.areaResponsLM(
            (_model.getTargetBudget?.jsonBody ?? ''),
          ).toString();
        });
      } else {
        if (GetTargetBudgetKPIAPICall.statusLayer3LM(
              (_model.getTargetBudget?.jsonBody ?? ''),
            ) !=
            404) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                content: Text(
                    'พบข้อผิดพลาดBudget Last Month (${GetTargetBudgetKPIAPICall.statusLayer3LM(
                  (_model.getTargetBudget?.jsonBody ?? ''),
                ).toString().toString()})'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
        }
      }

      _model.getServerDateTime = await GetDateTimeAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );
      Navigator.pop(context);
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: Color(0xFFFF6500),
            automaticallyImplyLeading: false,
            leading: Visibility(
              visible: !FFAppState().isFromTimesheetPage,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.goNamed('SuperAppPage');
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Color(0xFBFFFFFF),
                  size: 30.0,
                ),
              ),
            ),
            title: Text(
              'KPI พนักงาน',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 10.0,
          ),
          body: SafeArea(
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(0.0, 0),
                    child: TabBar(
                      labelColor: FlutterFlowTheme.of(context).primary,
                      labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                      indicatorColor: FlutterFlowTheme.of(context).secondary,
                      tabs: [
                        Tab(
                          text: 'เดือนปัจจุบัน',
                        ),
                        Tab(
                          text: 'เดือนที่แล้ว',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 4.0, 24.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        functions.showMonthYearWelfareKpiPage(
                                            GetDateTimeAPICall.currentDateYMD(
                                          (_model.getServerDateTime?.jsonBody ??
                                              ''),
                                        ).toString()),
                                        '[Month_Year]',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall,
                                    ),
                                    Text(
                                      '[${GetDateTimeAPICall.currentDate(
                                        (_model.getServerDateTime?.jsonBody ??
                                            ''),
                                      ).toString()}]',
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              if (((_model.getTargetBudget?.statusCode ??
                                          200) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer2(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer3TM(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200))
                                Container(
                                  width: double.infinity,
                                  height: 300.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: custom_widgets.RadialGauge(
                                      width: double.infinity,
                                      height: double.infinity,
                                      maxValue: FFAppState().kpiTargetBudget,
                                      value: FFAppState().kpiActualBudget,
                                      labelOffset: 15.0,
                                      axisLabelSize: 10.0,
                                      totalValueLabelSize: 18.0,
                                      valueUnitLabelSize: 14.0,
                                      valueUnitLabelText: 'จำนวนเงิน',
                                      totalValueUnitLabelText: 'บาท',
                                      endValue1: 0.5,
                                      startValue2: 0.5,
                                      endValue2: 0.8,
                                      startValue3: 0.8,
                                      color1: Color(0xFFEE4F22),
                                      color2: Color(0xFFEEC122),
                                      color3: Color(0xFF7BC722),
                                      startWidth1: 0.265,
                                      endWidth1: 0.265,
                                      startWidth2: 0.265,
                                      endWidth2: 0.265,
                                      startWidth3: 0.265,
                                      endWidth3: 0.265,
                                      isShowTick: true,
                                      startWidth4: 0.265,
                                      endWidth4: 0.265,
                                      startWidth5: 0.265,
                                      endWidth5: 0.265,
                                      color4: Colors.black,
                                      color5: Colors.black,
                                      startValue4: 1.0,
                                      endValue4: 1.0,
                                      startValue5: 1.0,
                                      endValue5: 1.0,
                                      endValue3: 1.0,
                                    ),
                                  ),
                                ),
                              if (((_model.getTargetBudget?.statusCode ??
                                          200) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer2(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer3TM(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'รหัสพนักงาน : ${GetTargetBudgetKPIAPICall.employeeID(
                                            (_model.getTargetBudget?.jsonBody ??
                                                ''),
                                          ).toString()} (${GetTargetBudgetKPIAPICall.branchCodeTM(
                                            (_model.getTargetBudget?.jsonBody ??
                                                ''),
                                          ).toString()})',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (((_model.getTargetBudget?.statusCode ??
                                          200) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer2(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer3TM(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        GetTargetBudgetKPIAPICall
                                            .ageOfPositionTM(
                                          (_model.getTargetBudget?.jsonBody ??
                                              ''),
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (((_model.getTargetBudget?.statusCode ??
                                          200) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer2(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer3TM(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          'พื้นที่ : ${GetTargetBudgetKPIAPICall.areaTypeTM(
                                            (_model.getTargetBudget?.jsonBody ??
                                                ''),
                                          ).toString()}',
                                          'พื้นที่ : ...',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (((_model.getTargetBudget?.statusCode ??
                                          200) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer2(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer3TM(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          'เกรดพื้นที่ (เป้ารายบุคคล) : ${GetTargetBudgetKPIAPICall.areaGradeTM(
                                            (_model.getTargetBudget?.jsonBody ??
                                                ''),
                                          ).toString()}',
                                          'เกรดพื้นที่ (เป้ารายบุคคล) : ...',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontSize: 16.0,
                                            ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.black,
                                            barrierColor: Color(0x00000000),
                                            context: context,
                                            builder: (bottomSheetContext) {
                                              return GestureDetector(
                                                onTap: () => FocusScope.of(
                                                        context)
                                                    .requestFocus(_unfocusNode),
                                                child: Padding(
                                                  padding: MediaQuery.of(
                                                          bottomSheetContext)
                                                      .viewInsets,
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.7,
                                                    child: PDFViewerWidget(
                                                      pdfUrl:
                                                          'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/AnnouncementPDF%2F%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%81%E0%B8%B2%E0%B8%A8%E0%B9%80%E0%B8%9B%E0%B9%89%E0%B8%B2%E0%B8%AB%E0%B8%A1%E0%B8%B2%E0%B8%A2%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%82%E0%B8%B2%E0%B8%A2%E0%B8%A3%E0%B8%B2%E0%B8%A2%E0%B8%9A%E0%B8%B8%E0%B8%84%E0%B8%84%E0%B8%A5%E0%B8%AA%E0%B8%B3%E0%B8%AB%E0%B8%A3%E0%B8%B1%E0%B8%9A%E0%B8%9E%E0%B8%99%E0%B8%B1%E0%B8%81%E0%B8%87.pdf?alt=media&token=e33d2bd1-485f-4ddd-a1c5-10f1b836d9b3',
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        text: 'ดูประกาศ',
                                        options: FFButtonOptions(
                                          width: 85.0,
                                          height: 28.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFFF0000),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                    fontSize: 14.0,
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
                              if (((_model.getTargetBudget?.statusCode ??
                                          200) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer2(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer3TM(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'ทำได้',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ),
                                          Text(
                                            FFAppState().kpiActualBudget,
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 22.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'เป้า',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ),
                                          Text(
                                            FFAppState().kpiTargetBudget,
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 22.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'สถานะ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ),
                                          Text(
                                            functions.checkMeanBudgetKPI(
                                                functions
                                                    .removeCommaFromNumText(
                                                        FFAppState()
                                                            .kpiActualBudget),
                                                functions
                                                    .removeCommaFromNumText(
                                                        FFAppState()
                                                            .kpiTargetBudget)),
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 22.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              Divider(
                                thickness: 1.0,
                                color: Color(0x8095A1AC),
                              ),
                              if (((_model.getTargetContractKPI?.statusCode ??
                                          200) ==
                                      200) &&
                                  (GetTargetContractKPIAPICall.statusLayer2(
                                        (_model.getTargetContractKPI
                                                ?.jsonBody ??
                                            ''),
                                      ) ==
                                      200) &&
                                  (GetTargetContractKPIAPICall.statusLayer3TM(
                                        (_model.getTargetContractKPI
                                                ?.jsonBody ??
                                            ''),
                                      ) ==
                                      200))
                                Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.9,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      final kpiProductList =
                                          FFAppState().kpiProductType.toList();
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children:
                                            List.generate(kpiProductList.length,
                                                (kpiProductListIndex) {
                                          final kpiProductListItem =
                                              kpiProductList[
                                                  kpiProductListIndex];
                                          return Container(
                                            width: double.infinity,
                                            height: 200.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.9,
                                                  height: 80.0,
                                                  child: custom_widgets
                                                      .LinearGauge(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    height: 80.0,
                                                    maxValue: functions
                                                        .getDoubleFromStringList(
                                                            FFAppState()
                                                                .kpiTargetQuantity
                                                                .toList(),
                                                            kpiProductListIndex),
                                                    value: functions
                                                        .getDoubleFromStringList(
                                                            FFAppState()
                                                                .kpiActual
                                                                .toList(),
                                                            kpiProductListIndex),
                                                    interval: 1.0,
                                                    trackThickness: 24.0,
                                                    rangeColor: functions
                                                        .getLinearGaugeColor(
                                                            FFAppState()
                                                                .kpiGaugeColorListMain
                                                                .toList(),
                                                            kpiProductListIndex),
                                                    gaugeAnimationMillisec:
                                                        2000,
                                                    markerAnimationMillisec:
                                                        1500,
                                                    widgetPointerWidth: 40.0,
                                                    widgetPointerHeight: 40.0,
                                                    widgetPointerColor: functions
                                                        .getLinearGaugeColor(
                                                            FFAppState()
                                                                .kpiGaugeColorListMain
                                                                .toList(),
                                                            kpiProductListIndex),
                                                    widgetPointerShadowColor:
                                                        valueOrDefault<Color>(
                                                      functions.getLinearGaugeColor(
                                                          FFAppState()
                                                              .kpiGaugeColorList2
                                                              .toList(),
                                                          kpiProductListIndex),
                                                      Color(0xFF93FF41),
                                                    ),
                                                    widgetPointerTextColor:
                                                        Colors.white,
                                                    widgetPointerText: functions
                                                        .showMatNameInList(
                                                            FFAppState()
                                                                .kpiProductType
                                                                .toList(),
                                                            kpiProductListIndex),
                                                    isHorizontal: true,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'ทำได้',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall,
                                                            ),
                                                          ),
                                                          Text(
                                                            functions
                                                                .stringDoubleToStringInt(
                                                                    valueOrDefault<
                                                                        String>(
                                                              functions.showMatNameInList(
                                                                  FFAppState()
                                                                      .kpiActual
                                                                      .toList(),
                                                                  kpiProductListIndex),
                                                              '[actual]',
                                                            )),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall,
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'เป้า',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall,
                                                            ),
                                                          ),
                                                          Text(
                                                            functions
                                                                .stringDoubleToStringInt(
                                                                    valueOrDefault<
                                                                        String>(
                                                              functions.showMatNameInList(
                                                                  FFAppState()
                                                                      .kpiTargetQuantity
                                                                      .toList(),
                                                                  kpiProductListIndex),
                                                              '[target_quantity]',
                                                            )),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall,
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'สถานะ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall,
                                                            ),
                                                          ),
                                                          Text(
                                                            functions.checkMeanBudgetKPI(
                                                                functions.showMatNameInList(
                                                                    FFAppState()
                                                                        .kpiActual
                                                                        .toList(),
                                                                    kpiProductListIndex),
                                                                functions.showMatNameInList(
                                                                    FFAppState()
                                                                        .kpiTargetQuantity
                                                                        .toList(),
                                                                    kpiProductListIndex)),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 1.0,
                                                  color: Color(0x8095A1AC),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 4.0, 24.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        functions.getWelfareKpiDateLastMonth(
                                            GetDateTimeAPICall.currentDateYMD(
                                          (_model.getServerDateTime?.jsonBody ??
                                              ''),
                                        ).toString()),
                                        '[MMYY_Last_Month]',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall,
                                    ),
                                    Text(
                                      '[${GetDateTimeAPICall.currentDate(
                                        (_model.getServerDateTime?.jsonBody ??
                                            ''),
                                      ).toString()}]',
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              if (((_model.getTargetBudget?.statusCode ??
                                          200) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer2(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer3LM(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200))
                                Container(
                                  width: double.infinity,
                                  height: 300.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: custom_widgets.RadialGauge(
                                      width: double.infinity,
                                      height: double.infinity,
                                      maxValue: FFAppState().kpiTargetBudgetLM,
                                      value: FFAppState().kpiActualBudgetLM,
                                      labelOffset: 15.0,
                                      axisLabelSize: 10.0,
                                      totalValueLabelSize: 18.0,
                                      valueUnitLabelSize: 14.0,
                                      valueUnitLabelText: 'จำนวนเงิน',
                                      totalValueUnitLabelText: 'บาท',
                                      endValue1: 0.5,
                                      startValue2: 0.5,
                                      endValue2: 0.8,
                                      startValue3: 0.8,
                                      color1: Color(0xFFEE4F22),
                                      color2: Color(0xFFEEC122),
                                      color3: Color(0xFF7BC722),
                                      startWidth1: 0.265,
                                      endWidth1: 0.265,
                                      startWidth2: 0.265,
                                      endWidth2: 0.265,
                                      startWidth3: 0.265,
                                      endWidth3: 0.265,
                                      isShowTick: true,
                                      startWidth4: 0.265,
                                      endWidth4: 0.265,
                                      startWidth5: 0.265,
                                      endWidth5: 0.265,
                                      color4:
                                          FlutterFlowTheme.of(context).black600,
                                      color5:
                                          FlutterFlowTheme.of(context).black600,
                                      startValue4: 1.0,
                                      endValue4: 1.0,
                                      startValue5: 1.0,
                                      endValue5: 1.0,
                                      endValue3: 1.0,
                                    ),
                                  ),
                                ),
                              if (((_model.getTargetBudget?.statusCode ??
                                          200) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer2(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer3LM(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'รหัสพนักงาน : ${GetTargetBudgetKPIAPICall.employeeIDLM(
                                            (_model.getTargetBudget?.jsonBody ??
                                                ''),
                                          ).toString()} (${GetTargetBudgetKPIAPICall.branchCodeLM(
                                            (_model.getTargetBudget?.jsonBody ??
                                                ''),
                                          ).toString()})',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (((_model.getTargetBudget?.statusCode ??
                                          200) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer2(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer3LM(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        GetTargetBudgetKPIAPICall
                                            .ageOfPositionLM(
                                          (_model.getTargetBudget?.jsonBody ??
                                              ''),
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (((_model.getTargetBudget?.statusCode ??
                                          200) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer2(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer3LM(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          'พื้นที่ : ${GetTargetBudgetKPIAPICall.areaTypeLM(
                                            (_model.getTargetBudget?.jsonBody ??
                                                ''),
                                          ).toString()}',
                                          'พื้นที่ : ...',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (((_model.getTargetBudget?.statusCode ??
                                          200) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer2(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer3LM(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          'เกรดพื้นที่ (เป้ารายบุคคล) : ${GetTargetBudgetKPIAPICall.areaGradeLM(
                                            (_model.getTargetBudget?.jsonBody ??
                                                ''),
                                          ).toString()}',
                                          'เกรดพื้นที่ (เป้ารายบุคคล) : ...',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontSize: 16.0,
                                            ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.black,
                                            barrierColor: Color(0x00000000),
                                            context: context,
                                            builder: (bottomSheetContext) {
                                              return GestureDetector(
                                                onTap: () => FocusScope.of(
                                                        context)
                                                    .requestFocus(_unfocusNode),
                                                child: Padding(
                                                  padding: MediaQuery.of(
                                                          bottomSheetContext)
                                                      .viewInsets,
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.7,
                                                    child: PDFViewerWidget(
                                                      pdfUrl:
                                                          'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/AnnouncementPDF%2F%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%81%E0%B8%B2%E0%B8%A8%E0%B9%80%E0%B8%9B%E0%B9%89%E0%B8%B2%E0%B8%AB%E0%B8%A1%E0%B8%B2%E0%B8%A2%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%82%E0%B8%B2%E0%B8%A2%E0%B8%A3%E0%B8%B2%E0%B8%A2%E0%B8%9A%E0%B8%B8%E0%B8%84%E0%B8%84%E0%B8%A5%E0%B8%AA%E0%B8%B3%E0%B8%AB%E0%B8%A3%E0%B8%B1%E0%B8%9A%E0%B8%9E%E0%B8%99%E0%B8%B1%E0%B8%81%E0%B8%87.pdf?alt=media&token=e33d2bd1-485f-4ddd-a1c5-10f1b836d9b3',
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        text: 'ดูประกาศ',
                                        options: FFButtonOptions(
                                          width: 85.0,
                                          height: 28.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFFF0000),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                    fontSize: 14.0,
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
                              if (((_model.getTargetBudget?.statusCode ??
                                          200) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer2(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200) &&
                                  (GetTargetBudgetKPIAPICall.statusLayer3LM(
                                        (_model.getTargetBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      200))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'ทำได้',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ),
                                          Text(
                                            FFAppState().kpiActualBudgetLM,
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 22.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'เป้า',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ),
                                          Text(
                                            FFAppState().kpiTargetBudgetLM,
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 22.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'สถานะ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ),
                                          Text(
                                            functions.checkMeanBudgetKPI(
                                                functions
                                                    .removeCommaFromNumText(
                                                        FFAppState()
                                                            .kpiActualBudgetLM),
                                                functions.removeCommaFromNumText(
                                                    FFAppState()
                                                        .kpiTargetBudgetLM)),
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 22.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              Divider(
                                thickness: 1.0,
                                color: Color(0x8095A1AC),
                              ),
                              if (((_model.getTargetContractKPI?.statusCode ??
                                          200) ==
                                      200) &&
                                  (GetTargetContractKPIAPICall.statusLayer2(
                                        (_model.getTargetContractKPI
                                                ?.jsonBody ??
                                            ''),
                                      ) ==
                                      200) &&
                                  (GetTargetContractKPIAPICall.statusLayer3LM(
                                        (_model.getTargetContractKPI
                                                ?.jsonBody ??
                                            ''),
                                      ) ==
                                      200))
                                Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.9,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      final kpiProductLMList = FFAppState()
                                          .kpiProductTypeLM
                                          .toList();
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            kpiProductLMList.length,
                                            (kpiProductLMListIndex) {
                                          final kpiProductLMListItem =
                                              kpiProductLMList[
                                                  kpiProductLMListIndex];
                                          return Container(
                                            width: double.infinity,
                                            height: 200.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.9,
                                                  height: 80.0,
                                                  child: custom_widgets
                                                      .LinearGauge(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    height: 80.0,
                                                    maxValue: functions
                                                        .getDoubleFromStringList(
                                                            FFAppState()
                                                                .kpiTargetQuantityLM
                                                                .toList(),
                                                            kpiProductLMListIndex),
                                                    value: functions
                                                        .getDoubleFromStringList(
                                                            FFAppState()
                                                                .kpiActualLM
                                                                .toList(),
                                                            kpiProductLMListIndex),
                                                    interval: 1.0,
                                                    trackThickness: 24.0,
                                                    rangeColor:
                                                        valueOrDefault<Color>(
                                                      functions.getLinearGaugeColor(
                                                          FFAppState()
                                                              .kpiGaugeColorListMain
                                                              .toList(),
                                                          kpiProductLMListIndex),
                                                      Color(0xFF932424),
                                                    ),
                                                    gaugeAnimationMillisec:
                                                        2000,
                                                    markerAnimationMillisec:
                                                        1500,
                                                    widgetPointerWidth: 40.0,
                                                    widgetPointerHeight: 40.0,
                                                    widgetPointerColor:
                                                        valueOrDefault<Color>(
                                                      functions.getLinearGaugeColor(
                                                          FFAppState()
                                                              .kpiGaugeColorListMain
                                                              .toList(),
                                                          kpiProductLMListIndex),
                                                      Color(0xFF932424),
                                                    ),
                                                    widgetPointerShadowColor:
                                                        valueOrDefault<Color>(
                                                      functions.getLinearGaugeColor(
                                                          FFAppState()
                                                              .kpiGaugeColorList2
                                                              .toList(),
                                                          kpiProductLMListIndex),
                                                      Color(0xFFFF2929),
                                                    ),
                                                    widgetPointerTextColor:
                                                        Colors.white,
                                                    widgetPointerText: functions
                                                        .showMatNameInList(
                                                            FFAppState()
                                                                .kpiProductType
                                                                .toList(),
                                                            kpiProductLMListIndex),
                                                    isHorizontal: true,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'ทำได้',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall,
                                                            ),
                                                          ),
                                                          Text(
                                                            functions
                                                                .stringDoubleToStringInt(
                                                                    valueOrDefault<
                                                                        String>(
                                                              functions.showMatNameInList(
                                                                  FFAppState()
                                                                      .kpiActualLM
                                                                      .toList(),
                                                                  kpiProductLMListIndex),
                                                              '[actual]',
                                                            )),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall,
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'เป้า',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall,
                                                            ),
                                                          ),
                                                          Text(
                                                            functions
                                                                .stringDoubleToStringInt(
                                                                    valueOrDefault<
                                                                        String>(
                                                              functions.showMatNameInList(
                                                                  FFAppState()
                                                                      .kpiTargetQuantityLM
                                                                      .toList(),
                                                                  kpiProductLMListIndex),
                                                              '[target_quantity]',
                                                            )),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall,
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'สถานะ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall,
                                                            ),
                                                          ),
                                                          Text(
                                                            functions.checkMeanBudgetKPI(
                                                                functions.showMatNameInList(
                                                                    FFAppState()
                                                                        .kpiActualLM
                                                                        .toList(),
                                                                    kpiProductLMListIndex),
                                                                functions.showMatNameInList(
                                                                    FFAppState()
                                                                        .kpiTargetQuantityLM
                                                                        .toList(),
                                                                    kpiProductLMListIndex)),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 1.0,
                                                  color: Color(0x8095A1AC),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
