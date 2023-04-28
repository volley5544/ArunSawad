import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'check_insurance_page_model.dart';
export 'check_insurance_page_model.dart';

class CheckInsurancePageWidget extends StatefulWidget {
  const CheckInsurancePageWidget({Key? key}) : super(key: key);

  @override
  _CheckInsurancePageWidgetState createState() =>
      _CheckInsurancePageWidgetState();
}

class _CheckInsurancePageWidgetState extends State<CheckInsurancePageWidget> {
  late CheckInsurancePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckInsurancePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CheckInsurancePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));

      final userLogCreateData = createUserLogRecordData(
        employeeId: FFAppState().employeeID,
        action: 'Insurance',
        actionTime: getCurrentTimestamp,
        userLocation: currentUserLocationValue,
      );
      var userLogRecordReference = UserLogRecord.collection.doc();
      await userLogRecordReference.set(userLogCreateData);
      _model.createdUserLogInsurance = UserLogRecord.getDocumentFromData(
          userLogCreateData, userLogRecordReference);
      if (FFAppState().isLoadedInsuranceData) {
        return;
      }
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Color(0x00000000),
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

      _model.gerBrand = await TeleGetBrandAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
      );
      if ((_model.gerBrand?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text(
                  'พบข้อผิดพลาด (${(_model.gerBrand?.statusCode ?? 200).toString()})'),
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
      if (TeleGetBrandAPICall.statusLevel1(
            (_model.gerBrand?.jsonBody ?? ''),
          ) !=
          200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text('พบข้อผิดพลาด (${TeleGetBrandAPICall.statusLevel1(
                (_model.gerBrand?.jsonBody ?? ''),
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
      FFAppState().update(() {
        FFAppState().teleBrandID = (TeleGetBrandAPICall.brandID(
          (_model.gerBrand?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList();
        FFAppState().teleBrandName = (TeleGetBrandAPICall.brandName(
          (_model.gerBrand?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList();
      });
      FFAppState().update(() {
        FFAppState().teleBrandType = (TeleGetBrandAPICall.brandType(
          (_model.gerBrand?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList();
      });
      _model.getModel = await TeleGetModelAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
      );
      if ((_model.getModel?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text(
                  'พบข้อผิดพลาด (${(_model.getModel?.statusCode ?? 200).toString()})'),
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
      if (TeleGetModelAPICall.statusLevel1(
            (_model.getModel?.jsonBody ?? ''),
          ) !=
          200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text('พบข้อผิดพลาด (${TeleGetModelAPICall.statusLevel1(
                (_model.getModel?.jsonBody ?? ''),
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
      FFAppState().update(() {
        FFAppState().modelName = (TeleGetModelAPICall.modelName(
          (_model.getModel?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList();
        FFAppState().teleModelBrandID = (TeleGetModelAPICall.brandID(
          (_model.getModel?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList();
      });
      FFAppState().update(() {
        FFAppState().teleModelCode = (TeleGetModelAPICall.modelCode(
          (_model.getModel?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList();
      });
      _model.getProvince = await TeleGetProvinceAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
      );
      if ((_model.getProvince?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text(
                  'พบข้อผิดพลาด (${(_model.getProvince?.statusCode ?? 200).toString()})'),
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
      if (TeleGetProvinceAPICall.statusLevel1(
            (_model.getProvince?.jsonBody ?? ''),
          ) !=
          200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content:
                  Text('พบข้อผิดพลาด (${TeleGetProvinceAPICall.statusLevel1(
                (_model.getProvince?.jsonBody ?? ''),
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
      FFAppState().update(() {
        FFAppState().teleGetProvince = (TeleGetProvinceAPICall.provinceNameTH(
          (_model.getProvince?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList();
        FFAppState().isLoadedInsuranceData = true;
      });
      Navigator.pop(context);
    });

    _model.nameInputController ??= TextEditingController();
    _model.lastnameInputController ??= TextEditingController();
    _model.idInputController ??= TextEditingController();
    _model.phoneInputController ??= TextEditingController();
    _model.plateInputController ??= TextEditingController();
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
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: Color(0xFFFF6500),
            automaticallyImplyLeading: false,
            leading: InkWell(
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
            title: Text(
              'เช็คเบี้ยประกัน',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 10.0,
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                      alignment:
                                          AlignmentDirectional(-0.35, -0.09),
                                      child: SelectionArea(
                                          child: Text(
                                        'ยี่ห้อรถ  : *',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 15.0,
                                            ),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 15.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .brandDropDownValueController ??=
                                            FormFieldController<String>(null),
                                        options:
                                            FFAppState().teleBrandName.toList(),
                                        onChanged: (val) async {
                                          setState(() =>
                                              _model.brandDropDownValue = val);
                                          HapticFeedback.mediumImpact();
                                          FFAppState().update(() {
                                            FFAppState().teleModelName = functions
                                                .teleSearchCarModel(
                                                    functions.getTeleBrandID(
                                                        _model
                                                            .brandDropDownValue,
                                                        FFAppState()
                                                            .teleBrandID
                                                            .toList(),
                                                        FFAppState()
                                                            .teleBrandName
                                                            .toList()),
                                                    FFAppState()
                                                        .teleModelBrandID
                                                        .toList(),
                                                    FFAppState()
                                                        .modelName
                                                        .toList())
                                                .toList();
                                            FFAppState().teleSearchModelState =
                                                true;
                                          });
                                        },
                                        width: 180.0,
                                        height: 60.0,
                                        searchHintTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintText: 'กรุณาเลือก',
                                        searchHintText: 'ยี่ห้อรถ...',
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor: Color(0xFFBDBDBD),
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 12.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (FFAppState().teleSearchModelState)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 10.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.35, -0.09),
                                        child: SelectionArea(
                                            child: Text(
                                          'รุ่นรถ  : *',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 15.0,
                                              ),
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                              if (FFAppState().teleSearchModelState)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 15.0, 5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // บังคับให้เลือก
                                      Expanded(
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .modelDropDownValueController ??=
                                              FormFieldController<String>(null),
                                          options: FFAppState()
                                              .teleModelName
                                              .toList(),
                                          onChanged: (val) => setState(() =>
                                              _model.modelDropDownValue = val),
                                          width: 90.0,
                                          height: 60.0,
                                          searchHintTextStyle:
                                              GoogleFonts.getFont(
                                            'Roboto',
                                          ),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.black,
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintText: 'กรุณาเลือก...',
                                          searchHintText: 'รุ่นรถ...',
                                          fillColor: Colors.white,
                                          elevation: 2.0,
                                          borderColor: Color(0xFFBDBDBD),
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 20.0, 20.0),
                                          hidesUnderline: true,
                                          isSearchable: true,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.35, -0.09),
                                      child: SelectionArea(
                                          child: Text(
                                        'ปีจดทะเบียน (พ.ศ.)  : *',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 15.0,
                                            ),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 15.0, 5.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  constraints: BoxConstraints(
                                    maxWidth: double.infinity,
                                    maxHeight: double.infinity,
                                  ),
                                  decoration: BoxDecoration(),
                                  child:
                                      // บังคับให้เลือก
                                      FlutterFlowDropDown<String>(
                                    controller:
                                        _model.yearDropDownValueController ??=
                                            FormFieldController<String>(
                                      _model.yearDropDownValue ??= '',
                                    ),
                                    options: FFAppState()
                                        .teleADYearDropdown
                                        .toList(),
                                    optionLabels: FFAppState()
                                        .teleYearDropdownOption
                                        .toList(),
                                    onChanged: (val) => setState(
                                        () => _model.yearDropDownValue = val),
                                    width: 90.0,
                                    height: double.infinity,
                                    searchHintTextStyle: GoogleFonts.getFont(
                                      'Roboto',
                                    ),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintText: 'กรุณาเลือก...',
                                    searchHintText: 'พ.ศ.',
                                    fillColor: Colors.white,
                                    elevation: 2.0,
                                    borderColor: Color(0xFFBDBDBD),
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 20.0, 20.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                  ),
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
                                      alignment:
                                          AlignmentDirectional(-0.35, -0.09),
                                      child: SelectionArea(
                                          child: Text(
                                        'จังหวัดจดทะเบียน  :*',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 15.0,
                                            ),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 15.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // บังคับให้เลือก
                                    Expanded(
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .provinceDropDownValueController ??=
                                            FormFieldController<String>(null),
                                        options: FFAppState()
                                            .teleGetProvince
                                            .toList(),
                                        onChanged: (val) => setState(() =>
                                            _model.provinceDropDownValue = val),
                                        width: 90.0,
                                        height: 60.0,
                                        searchHintTextStyle:
                                            GoogleFonts.getFont(
                                          'Roboto',
                                        ),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        hintText: 'กรุณาเลือก...',
                                        searchHintText: 'จังหวัด...',
                                        fillColor: Colors.white,
                                        elevation: 2.0,
                                        borderColor: Color(0xFFBDBDBD),
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        hidesUnderline: true,
                                        isSearchable: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 10.0, 10.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.35, -0.09),
                                      child: SelectionArea(
                                          child: Text(
                                        'ลักษณะการใช้รถ  : *',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 15.0,
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    // บังคับให้เลือก
                                    // - 110รถยนต์นั่ง
                                    // - 210รถยนต์โดยสาร
                                    // - 320รถยนต์บรรทุก
                                    //
                                    Expanded(
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .useTypeDropDownValueController ??=
                                            FormFieldController<String>(null),
                                        options: [
                                          '110รถยนต์นั่ง',
                                          '210รถยนต์โดยสาร',
                                          '320รถยนต์บรรทุก'
                                        ],
                                        onChanged: (val) => setState(() =>
                                            _model.useTypeDropDownValue = val),
                                        width: 90.0,
                                        height: 60.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        hintText: 'กรุณาเลือก...',
                                        fillColor: Colors.white,
                                        elevation: 2.0,
                                        borderColor: Color(0xFFBDBDBD),
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 20.0, 20.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
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
                                      alignment:
                                          AlignmentDirectional(-0.35, -0.09),
                                      child: SelectionArea(
                                          child: Text(
                                        'ชื่อ  : *',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 15.0,
                                            ),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: TextFormField(
                                          controller:
                                              _model.nameInputController,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.nameInputController',
                                            Duration(milliseconds: 2000),
                                            () => setState(() {}),
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'กรุณากรอก...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
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
                                            fillColor: Color(0xFFF5F5F5),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 24.0, 24.0, 24.0),
                                            suffixIcon: _model
                                                    .nameInputController!
                                                    .text
                                                    .isNotEmpty
                                                ? InkWell(
                                                    onTap: () async {
                                                      _model.nameInputController
                                                          ?.clear();
                                                      setState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.clear,
                                                      color: Color(0xFF757575),
                                                      size: 22.0,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 15.0,
                                                lineHeight: 1.0,
                                              ),
                                          validator: _model
                                              .nameInputControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 10.0, 10.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.35, -0.09),
                                      child: SelectionArea(
                                          child: Text(
                                        'นามสกุล  : *',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 15.0,
                                            ),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 15.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: TextFormField(
                                          controller:
                                              _model.lastnameInputController,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.lastnameInputController',
                                            Duration(milliseconds: 2000),
                                            () => setState(() {}),
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'กรุณากรอก...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
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
                                            fillColor: Color(0xFFF5F5F5),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 24.0, 24.0, 24.0),
                                            suffixIcon: _model
                                                    .lastnameInputController!
                                                    .text
                                                    .isNotEmpty
                                                ? InkWell(
                                                    onTap: () async {
                                                      _model
                                                          .lastnameInputController
                                                          ?.clear();
                                                      setState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.clear,
                                                      color: Color(0xFF757575),
                                                      size: 22.0,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF0A0A0A),
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          validator: _model
                                              .lastnameInputControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 10.0, 10.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.35, -0.09),
                                      child: SelectionArea(
                                          child: Text(
                                        'บัตรประชาชน :',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 15.0,
                                            ),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 15.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: TextFormField(
                                          controller: _model.idInputController,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.idInputController',
                                            Duration(milliseconds: 2000),
                                            () => setState(() {}),
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'กรุณากรอก...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
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
                                            fillColor: Color(0xFFF5F5F5),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 24.0, 24.0, 24.0),
                                            suffixIcon: _model
                                                    .idInputController!
                                                    .text
                                                    .isNotEmpty
                                                ? InkWell(
                                                    onTap: () async {
                                                      _model.idInputController
                                                          ?.clear();
                                                      setState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.clear,
                                                      color: Color(0xFF757575),
                                                      size: 22.0,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF0A0A0A),
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          keyboardType: TextInputType.phone,
                                          validator: _model
                                              .idInputControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 10.0, 10.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.35, -0.09),
                                      child: SelectionArea(
                                          child: Text(
                                        'เบอร์โทรศัพท์มือถือ : *',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 15.0,
                                            ),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 15.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: TextFormField(
                                          controller:
                                              _model.phoneInputController,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.phoneInputController',
                                            Duration(milliseconds: 2000),
                                            () => setState(() {}),
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'กรุณากรอก...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
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
                                            fillColor: Color(0xFFF5F5F5),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 24.0, 24.0, 24.0),
                                            suffixIcon: _model
                                                    .phoneInputController!
                                                    .text
                                                    .isNotEmpty
                                                ? InkWell(
                                                    onTap: () async {
                                                      _model
                                                          .phoneInputController
                                                          ?.clear();
                                                      setState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.clear,
                                                      color: Color(0xFF757575),
                                                      size: 22.0,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF0A0A0A),
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          keyboardType: TextInputType.phone,
                                          validator: _model
                                              .phoneInputControllerValidator
                                              .asValidator(context),
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
                                      alignment:
                                          AlignmentDirectional(-0.35, -0.09),
                                      child: SelectionArea(
                                          child: Text(
                                        'ทะเบียนรถ  : *',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 15.0,
                                            ),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 15.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    // บังคับให้เลือก
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: TextFormField(
                                          controller:
                                              _model.plateInputController,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.plateInputController',
                                            Duration(milliseconds: 2000),
                                            () => setState(() {}),
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'กรุณากรอก...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
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
                                            fillColor: Color(0xFFF5F5F5),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 24.0, 24.0, 24.0),
                                            suffixIcon: _model
                                                    .plateInputController!
                                                    .text
                                                    .isNotEmpty
                                                ? InkWell(
                                                    onTap: () async {
                                                      _model
                                                          .plateInputController
                                                          ?.clear();
                                                      setState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.clear,
                                                      color: Color(0xFF757575),
                                                      size: 22.0,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF0A0A0A),
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          validator: _model
                                              .plateInputControllerValidator
                                              .asValidator(context),
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
                                      alignment:
                                          AlignmentDirectional(-0.35, -0.09),
                                      child: SelectionArea(
                                          child: Text(
                                        'รายละเอียดผู้ขับขี่  : *',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 15.0,
                                            ),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 15.0, 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // บังคับให้เลือก
                                    // - ระบุผู้ขับขี่
                                    // - ไม่ระบุผู้ขับขี่
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 30.0),
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .driverDropDownValueController ??=
                                              FormFieldController<String>(
                                            _model.driverDropDownValue ??= '',
                                          ),
                                          options: ['on', 'off'],
                                          optionLabels: [
                                            'ระบุผู้ขับขี่',
                                            'ไม่ระบุผู้ขับขี่'
                                          ],
                                          onChanged: (val) => setState(() =>
                                              _model.driverDropDownValue = val),
                                          width: 90.0,
                                          height: 60.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.black,
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintText: 'กรุณาเลือก...',
                                          fillColor: Colors.white,
                                          elevation: 2.0,
                                          borderColor: Color(0xFFBDBDBD),
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 20.0, 20.0),
                                          hidesUnderline: true,
                                          isSearchable: false,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 60.0,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 0.0, 15.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (!(_model.brandDropDownValue != null &&
                                        _model.brandDropDownValue != '')) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'กรุณากรอกยี่ห้อรถ',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xB2000000),
                                        ),
                                      );
                                      return;
                                    }
                                    if (!FFAppState().teleSearchModelState) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'กรุณากดค้นหารุ่นรถ',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xB2000000),
                                        ),
                                      );
                                      return;
                                    }
                                    if (!(_model.modelDropDownValue != null &&
                                        _model.modelDropDownValue != '')) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'กรุณาเลือกรุ่นรถ',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xB2000000),
                                        ),
                                      );
                                      return;
                                    }
                                    if (!(_model.yearDropDownValue != null &&
                                        _model.yearDropDownValue != '')) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'กรุณาเลือกปีจดทะเบียน',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xB2000000),
                                        ),
                                      );
                                      return;
                                    }
                                    if (!(_model.provinceDropDownValue !=
                                            null &&
                                        _model.provinceDropDownValue != '')) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'กรุณาเลือกจังหวัดจดทะเบียน',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xB2000000),
                                        ),
                                      );
                                      return;
                                    }
                                    if (!(_model.useTypeDropDownValue != null &&
                                        _model.useTypeDropDownValue != '')) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'กรุณาเลือกลักษณะการใช้รถ',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xB2000000),
                                        ),
                                      );
                                      return;
                                    }
                                    if (!(_model.nameInputController.text !=
                                            null &&
                                        _model.nameInputController.text !=
                                            '')) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'กรุณากรอกชื่อ',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xB2000000),
                                        ),
                                      );
                                      return;
                                    }
                                    if (!(_model.lastnameInputController.text !=
                                            null &&
                                        _model.lastnameInputController.text !=
                                            '')) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'กรุณากรอกนามสกุล',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xB2000000),
                                        ),
                                      );
                                      return;
                                    }
                                    if (!(_model.phoneInputController.text !=
                                            null &&
                                        _model.phoneInputController.text !=
                                            '')) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'กรุณากรอกเบอร์โทรศัพท์',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xB2000000),
                                        ),
                                      );
                                      return;
                                    }
                                    if (!(_model.plateInputController.text !=
                                            null &&
                                        _model.plateInputController.text !=
                                            '')) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'กรุณากรอกทะเบียนรถ',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xB2000000),
                                        ),
                                      );
                                      return;
                                    }
                                    if (!(_model.driverDropDownValue != null &&
                                        _model.driverDropDownValue != '')) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'กรุณาเลือกประเภทผู้ขับขี่',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xB2000000),
                                        ),
                                      );
                                      return;
                                    }

                                    context.pushNamed(
                                      'Check_1InsurancePage',
                                      queryParams: {
                                        'brandCode': serializeParam(
                                          functions.getTeleBrandID(
                                              _model.brandDropDownValue,
                                              FFAppState().teleBrandID.toList(),
                                              FFAppState()
                                                  .teleBrandName
                                                  .toList()),
                                          ParamType.String,
                                        ),
                                        'year': serializeParam(
                                          _model.yearDropDownValue,
                                          ParamType.String,
                                        ),
                                        'province': serializeParam(
                                          _model.provinceDropDownValue,
                                          ParamType.String,
                                        ),
                                        'driver': serializeParam(
                                          _model.driverDropDownValue,
                                          ParamType.String,
                                        ),
                                        'modelCode': serializeParam(
                                          functions.getModelCode(
                                              functions.getTeleBrandID(
                                                  _model.brandDropDownValue,
                                                  FFAppState()
                                                      .teleBrandID
                                                      .toList(),
                                                  FFAppState()
                                                      .teleBrandName
                                                      .toList()),
                                              FFAppState().modelName.toList(),
                                              FFAppState()
                                                  .teleModelBrandID
                                                  .toList(),
                                              _model.modelDropDownValue,
                                              FFAppState()
                                                  .teleModelCode
                                                  .toList()),
                                          ParamType.String,
                                        ),
                                        'vehicleUsage': serializeParam(
                                          functions.getVehicleUsage(
                                              _model.useTypeDropDownValue),
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: 'Next',
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    size: 18.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 60.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFF0066FF),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 18.0,
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
