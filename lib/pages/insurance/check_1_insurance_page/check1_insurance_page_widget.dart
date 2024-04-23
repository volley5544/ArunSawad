import '/backend/api_requests/api_calls.dart';
import '/components/input_copy/input_copy_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'check1_insurance_page_model.dart';
export 'check1_insurance_page_model.dart';

class Check1InsurancePageWidget extends StatefulWidget {
  const Check1InsurancePageWidget({
    super.key,
    this.brandCode,
    this.modelCode,
    this.year,
    this.province,
    this.driver,
    this.vehicleUsage,
  });

  final String? brandCode;
  final String? modelCode;
  final String? year;
  final String? province;
  final String? driver;
  final String? vehicleUsage;

  @override
  State<Check1InsurancePageWidget> createState() =>
      _Check1InsurancePageWidgetState();
}

class _Check1InsurancePageWidgetState extends State<Check1InsurancePageWidget> {
  late Check1InsurancePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Check1InsurancePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Check_1InsurancePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Color(0x00000000),
        context: context,
        builder: (context) {
          return WebViewAware(
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: LoadingSceneWidget(),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      _model.coverTypeAPIOutput = await TeleGetCoverTypeAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
      );
      if ((_model.coverTypeAPIOutput?.statusCode ?? 200) == 200) {
        FFAppState().update(() {
          FFAppState().coverTypeName = TeleGetCoverTypeAPICall.coverTypeName(
            (_model.coverTypeAPIOutput?.jsonBody ?? ''),
          )!
              .toList()
              .cast<String>();
          FFAppState().coverTypeCode = TeleGetCoverTypeAPICall.coverTypeCode(
            (_model.coverTypeAPIOutput?.jsonBody ?? ''),
          )!
              .toList()
              .cast<String>();
        });
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (${(_model.coverTypeAPIOutput?.statusCode ?? 200).toString()})'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
        return;
      }

      _model.getInsurersAPIOutput = await TeleGetInsurersAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
      );
      if ((_model.getInsurersAPIOutput?.statusCode ?? 200) == 200) {
        FFAppState().update(() {
          FFAppState().insurerFullNameList =
              TeleGetInsurersAPICall.companyFullName(
            (_model.getInsurersAPIOutput?.jsonBody ?? ''),
          )!
                  .toList()
                  .cast<String>();
          FFAppState().companyId = TeleGetInsurersAPICall.companyID(
            (_model.getInsurersAPIOutput?.jsonBody ?? ''),
          )!
              .toList()
              .cast<String>();
        });
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (${(_model.getInsurersAPIOutput?.statusCode ?? 200).toString()})'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
        return;
      }

      Navigator.pop(context);
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFFF6500),
          automaticallyImplyLeading: true,
          title: Text(
            'เช็คเบี้ยประกัน',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 10.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.78,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'ประเภทประกันภัย  :',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                    ),
                              )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            40.0, 0.0, 200.0, 0.0),
                        child: FlutterFlowCheckboxGroup(
                          options: FFAppState().coverTypeName.toList(),
                          onChanged: (val) => setState(
                              () => _model.coverTypeNameChooseValues = val),
                          controller:
                              _model.coverTypeNameChooseValueController ??=
                                  FormFieldController<List<String>>(
                            [],
                          ),
                          activeColor: Color(0xFF0066FF),
                          checkColor: Colors.white,
                          checkboxBorderColor: Color(0xFF95A1AC),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          initialized: _model.coverTypeNameChooseValues != null,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'ประเภทการซ่อม  : *',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                    ),
                              )),
                            ),
                          ],
                        ),
                      ),

                      // - ซ่อมห้าง
                      // - ซ่อมอู่
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 15.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // บังคับให้เลือก
                            // - 110รถยนต์นั่ง
                            // - 210รถยนต์โดยสาร
                            // - 320รถยนต์บรรทุก
                            //
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 5.0),
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.garageChooseValueController ??=
                                          FormFieldController<String>(null),
                                  options: ['ซ่อมห้าง', 'ซ่อมอู่'],
                                  onChanged: (val) async {
                                    setState(
                                        () => _model.garageChooseValue = val);
                                    FFAppState().update(() {
                                      FFAppState().garageTypeEng =
                                          functions.garageTypeToEng(
                                              _model.garageChooseValue);
                                    });
                                  },
                                  width: 90.0,
                                  height: 60.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  hintText: 'กรุณาเลือก...',
                                  fillColor: Colors.white,
                                  elevation: 2.0,
                                  borderColor: Color(0xFFBDBDBD),
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsets.all(20.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'ทุนประกัน :',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                    ),
                              )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 10.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Slider(
                              activeColor: Color(0xFF0066FF),
                              inactiveColor: Color(0xFF9E9E9E),
                              min: 0.0,
                              max: 2000000.0,
                              value: _model.sumInsuredValue ??=
                                  FFAppState().sumInsuredChoosenDouble,
                              label: _model.sumInsuredValue?.toString(),
                              divisions: 200,
                              onChanged: (newValue) {
                                setState(
                                    () => _model.sumInsuredValue = newValue);
                              },
                              onChangeEnd: (newValue) async {
                                setState(
                                    () => _model.sumInsuredValue = newValue);
                                FFAppState().update(() {
                                  FFAppState().sumInsuredChoosenDouble =
                                      _model.sumInsuredValue!;
                                });
                              },
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Color(0xB3FFF40A),
                                  barrierColor: Color(0x00000000),
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.3,
                                            child: InputCopyWidget(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Container(
                                width: 150.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0xB3E0E3E7),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                        .sumInsuredChoosenDouble
                                        .toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'ชื่อบริษัทประกัน :',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                    ),
                              )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            40.0, 0.0, 200.0, 0.0),
                        child: FlutterFlowCheckboxGroup(
                          options: FFAppState().insurerFullNameList.toList(),
                          onChanged: (val) => setState(
                              () => _model.insurerNameChooseValues = val),
                          controller:
                              _model.insurerNameChooseValueController ??=
                                  FormFieldController<List<String>>(
                            [],
                          ),
                          activeColor: Color(0xFF0066FF),
                          checkColor: Colors.white,
                          checkboxBorderColor: Color(0xFF95A1AC),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          initialized: _model.insurerNameChooseValues != null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              var _shouldSetState = false;
                              FFAppState().update(() {
                                FFAppState().coverTypeNameChosen = functions
                                    .coverTypeToCode(_model
                                        .coverTypeNameChooseValues
                                        ?.toList())
                                    .toList()
                                    .cast<String>();
                                FFAppState().insurerNameChosen = functions
                                    .companyNameToID(
                                        FFAppState().companyId.toList(),
                                        FFAppState()
                                            .insurerFullNameList
                                            .toList(),
                                        _model.insurerNameChooseValues
                                            ?.toList())
                                    .toList()
                                    .cast<String>();
                              });
                              _model.packageSearchAPIOutput =
                                  await TelePackageSearchAPICall.call(
                                brandCode: widget.brandCode,
                                modelCode: widget.modelCode,
                                year: widget.year,
                                province: widget.province,
                                carRegistration: '0000',
                                driver: widget.driver,
                                vehicleUsage: widget.vehicleUsage,
                                companyIdList: FFAppState().insurerNameChosen,
                                coverTypeList: FFAppState().coverTypeNameChosen,
                                apiUrl: FFAppState().apiURLLocalState,
                              );
                              _shouldSetState = true;
                              if ((_model.packageSearchAPIOutput?.statusCode ??
                                      200) ==
                                  200) {
                                if (TelePackageSearchAPICall.statusLayer1(
                                      (_model.packageSearchAPIOutput
                                              ?.jsonBody ??
                                          ''),
                                    ) !=
                                    200) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              'พบข้อผิดพลาด (${TelePackageSearchAPICall.statusLayer1(
                                            (_model.packageSearchAPIOutput
                                                    ?.jsonBody ??
                                                ''),
                                          )?.toString()})message (${TelePackageSearchAPICall.statusLayer1Message(
                                            (_model.packageSearchAPIOutput
                                                    ?.jsonBody ??
                                                ''),
                                          )})'),
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
                                if (TelePackageSearchAPICall.dataList(
                                      (_model.packageSearchAPIOutput
                                              ?.jsonBody ??
                                          ''),
                                    )?.length ==
                                    0) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text('ไม่พบข้อมูลประกัน'),
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
                                FFAppState().update(() {
                                  FFAppState().searchFullName =
                                      TelePackageSearchAPICall.fullName(
                                    (_model.packageSearchAPIOutput?.jsonBody ??
                                        ''),
                                  )!
                                          .toList()
                                          .cast<String>();
                                  FFAppState().searchCoverType =
                                      TelePackageSearchAPICall.coverType(
                                    (_model.packageSearchAPIOutput?.jsonBody ??
                                        ''),
                                  )!
                                          .toList()
                                          .cast<String>();
                                });
                                FFAppState().update(() {
                                  FFAppState().searchGarageType =
                                      TelePackageSearchAPICall.garageType(
                                    (_model.packageSearchAPIOutput?.jsonBody ??
                                        ''),
                                  )!
                                          .toList()
                                          .cast<String>();
                                  FFAppState().searchGrossTotal =
                                      TelePackageSearchAPICall.grossTotal(
                                    (_model.packageSearchAPIOutput?.jsonBody ??
                                        ''),
                                  )!
                                          .toList()
                                          .cast<String>();
                                });
                                FFAppState().update(() {
                                  FFAppState().searchSumInsured =
                                      TelePackageSearchAPICall.sumInsured(
                                    (_model.packageSearchAPIOutput?.jsonBody ??
                                        ''),
                                  )!
                                          .toList()
                                          .cast<String>();
                                  FFAppState().searchTppd =
                                      TelePackageSearchAPICall.tppd(
                                    (_model.packageSearchAPIOutput?.jsonBody ??
                                        ''),
                                  )!
                                          .toList()
                                          .cast<String>();
                                });
                                FFAppState().update(() {
                                  FFAppState().searchPa =
                                      TelePackageSearchAPICall.pa(
                                    (_model.packageSearchAPIOutput?.jsonBody ??
                                        ''),
                                  )!
                                          .toList()
                                          .cast<String>();
                                  FFAppState().searchExpDate =
                                      TelePackageSearchAPICall.expiryDate(
                                    (_model.packageSearchAPIOutput?.jsonBody ??
                                        ''),
                                  )!
                                          .toList()
                                          .cast<String>();
                                });
                                FFAppState().update(() {
                                  FFAppState().searchActAmount =
                                      TelePackageSearchAPICall.actAmount(
                                    (_model.packageSearchAPIOutput?.jsonBody ??
                                        ''),
                                  )!
                                          .toList()
                                          .cast<String>();
                                  FFAppState().searchSerialName =
                                      TelePackageSearchAPICall.serialName(
                                    (_model.packageSearchAPIOutput?.jsonBody ??
                                        ''),
                                  )!
                                          .toList()
                                          .cast<String>();
                                });
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            'พบข้อผิดพลาด (${(_model.packageSearchAPIOutput?.statusCode ?? 200).toString()})'),
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

                              FFAppState().update(() {
                                FFAppState().searchFullName = functions
                                    .filterInsurer(
                                        FFAppState().garageTypeEng,
                                        FFAppState().searchGarageType.toList(),
                                        FFAppState().searchFullName.toList())
                                    .toList()
                                    .cast<String>();
                                FFAppState().searchCoverType = functions
                                    .filterInsurer(
                                        FFAppState().garageTypeEng,
                                        FFAppState().searchGarageType.toList(),
                                        FFAppState().searchCoverType.toList())
                                    .toList()
                                    .cast<String>();
                              });
                              FFAppState().update(() {
                                FFAppState().searchGarageType = functions
                                    .filterInsurer(
                                        FFAppState().garageTypeEng,
                                        FFAppState().searchGarageType.toList(),
                                        FFAppState().searchGarageType.toList())
                                    .toList()
                                    .cast<String>();
                                FFAppState().searchGrossTotal = functions
                                    .filterInsurer(
                                        FFAppState().garageTypeEng,
                                        FFAppState().searchGarageType.toList(),
                                        FFAppState().searchGrossTotal.toList())
                                    .toList()
                                    .cast<String>();
                              });
                              FFAppState().update(() {
                                FFAppState().searchSumInsured = functions
                                    .filterInsurer(
                                        FFAppState().garageTypeEng,
                                        FFAppState().searchGarageType.toList(),
                                        FFAppState().searchSumInsured.toList())
                                    .toList()
                                    .cast<String>();
                                FFAppState().searchTppd = functions
                                    .filterInsurer(
                                        FFAppState().garageTypeEng,
                                        FFAppState().searchGarageType.toList(),
                                        FFAppState().searchTppd.toList())
                                    .toList()
                                    .cast<String>();
                              });
                              FFAppState().update(() {
                                FFAppState().searchPa = functions
                                    .filterInsurer(
                                        FFAppState().garageTypeEng,
                                        FFAppState().searchGarageType.toList(),
                                        FFAppState().searchPa.toList())
                                    .toList()
                                    .cast<String>();
                                FFAppState().searchExpDate = functions
                                    .filterInsurer(
                                        FFAppState().garageTypeEng,
                                        FFAppState().searchGarageType.toList(),
                                        FFAppState().searchExpDate.toList())
                                    .toList()
                                    .cast<String>();
                              });
                              FFAppState().update(() {
                                FFAppState().searchActAmount = functions
                                    .filterInsurer(
                                        FFAppState().garageTypeEng,
                                        FFAppState().searchGarageType.toList(),
                                        FFAppState().searchActAmount.toList())
                                    .toList()
                                    .cast<String>();
                                FFAppState().searchSerialName = functions
                                    .filterInsurer(
                                        FFAppState().garageTypeEng,
                                        FFAppState().searchGarageType.toList(),
                                        FFAppState().searchSerialName.toList())
                                    .toList()
                                    .cast<String>();
                              });
                              FFAppState().update(() {
                                FFAppState().searchFullName = functions
                                    .filterSumInsured(
                                        FFAppState().sumInsuredChoosenDouble,
                                        FFAppState().searchSumInsured.toList(),
                                        FFAppState().searchFullName.toList())
                                    .toList()
                                    .cast<String>();
                                FFAppState().searchCoverType = functions
                                    .filterSumInsured(
                                        FFAppState().sumInsuredChoosenDouble,
                                        FFAppState().searchSumInsured.toList(),
                                        FFAppState().searchCoverType.toList())
                                    .toList()
                                    .cast<String>();
                              });
                              FFAppState().update(() {
                                FFAppState().searchGarageType = functions
                                    .filterSumInsured(
                                        FFAppState().sumInsuredChoosenDouble,
                                        FFAppState().searchSumInsured.toList(),
                                        FFAppState().searchGarageType.toList())
                                    .toList()
                                    .cast<String>();
                                FFAppState().searchGrossTotal = functions
                                    .filterSumInsured(
                                        FFAppState().sumInsuredChoosenDouble,
                                        FFAppState().searchSumInsured.toList(),
                                        FFAppState().searchGrossTotal.toList())
                                    .toList()
                                    .cast<String>();
                              });
                              FFAppState().update(() {
                                FFAppState().searchSumInsured = functions
                                    .filterSumInsured(
                                        FFAppState().sumInsuredChoosenDouble,
                                        FFAppState().searchSumInsured.toList(),
                                        FFAppState().searchSumInsured.toList())
                                    .toList()
                                    .cast<String>();
                                FFAppState().searchTppd = functions
                                    .filterSumInsured(
                                        FFAppState().sumInsuredChoosenDouble,
                                        FFAppState().searchSumInsured.toList(),
                                        FFAppState().searchTppd.toList())
                                    .toList()
                                    .cast<String>();
                              });
                              FFAppState().update(() {
                                FFAppState().searchPa = functions
                                    .filterSumInsured(
                                        FFAppState().sumInsuredChoosenDouble,
                                        FFAppState().searchSumInsured.toList(),
                                        FFAppState().searchPa.toList())
                                    .toList()
                                    .cast<String>();
                                FFAppState().searchExpDate = functions
                                    .filterSumInsured(
                                        FFAppState().sumInsuredChoosenDouble,
                                        FFAppState().searchSumInsured.toList(),
                                        FFAppState().searchExpDate.toList())
                                    .toList()
                                    .cast<String>();
                              });
                              FFAppState().update(() {
                                FFAppState().searchActAmount = functions
                                    .filterSumInsured(
                                        FFAppState().sumInsuredChoosenDouble,
                                        FFAppState().searchSumInsured.toList(),
                                        FFAppState().searchActAmount.toList())
                                    .toList()
                                    .cast<String>();
                                FFAppState().searchSerialName = functions
                                    .filterSumInsured(
                                        FFAppState().sumInsuredChoosenDouble,
                                        FFAppState().searchSumInsured.toList(),
                                        FFAppState().searchSerialName.toList())
                                    .toList()
                                    .cast<String>();
                              });
                              if (FFAppState().searchFullName.length == 0) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text('ไม่พบข้อมูลประกัน'),
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

                              context.pushNamed('ListInsurancPage');

                              if (_shouldSetState) setState(() {});
                            },
                            text: 'ค้นหา',
                            icon: Icon(
                              Icons.search,
                              size: 18.0,
                            ),
                            options: FFButtonOptions(
                              width: 90.0,
                              height: 60.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsets.all(0.0),
                              color: Color(0xFF0066FF),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
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
