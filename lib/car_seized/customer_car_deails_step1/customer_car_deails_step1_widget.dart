import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/capture_camera_widget_widget.dart';
import '/components/loading_scene_insurance/loading_scene_insurance_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'customer_car_deails_step1_model.dart';
export 'customer_car_deails_step1_model.dart';

class CustomerCarDeailsStep1Widget extends StatefulWidget {
  const CustomerCarDeailsStep1Widget({
    super.key,
    required this.step,
    required this.readAccessRoleData,
    required this.saveAccessRoleData,
    required this.userRoleRead,
    required this.userRoleSave,
    required this.impoundCarParamSet,
    required this.impoundCarLocateParamSet,
    required this.carConfig,
    required this.motocycleConfig,
    required this.editAccessRoleData,
    required this.userRoleEdit,
  });

  final String? step;
  final dynamic readAccessRoleData;
  final dynamic saveAccessRoleData;
  final String? userRoleRead;
  final String? userRoleSave;
  final ImpoundCarParamSetStruct? impoundCarParamSet;
  final ImpoundCarLocateParamSetStruct? impoundCarLocateParamSet;
  final List<String>? carConfig;
  final List<String>? motocycleConfig;
  final dynamic editAccessRoleData;
  final String? userRoleEdit;

  static String routeName = 'CustomerCarDeailsStep1';
  static String routePath = 'customerCarDeailsStep1';

  @override
  State<CustomerCarDeailsStep1Widget> createState() =>
      _CustomerCarDeailsStep1WidgetState();
}

class _CustomerCarDeailsStep1WidgetState
    extends State<CustomerCarDeailsStep1Widget> {
  late CustomerCarDeailsStep1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomerCarDeailsStep1Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CustomerCarDeailsStep1'});
    _model.priceTextFieldTextController ??= TextEditingController();
    _model.priceTextFieldFocusNode ??= FocusNode();
    _model.priceTextFieldFocusNode!.addListener(
      () async {
        if ((_model.priceTextFieldFocusNode?.hasFocus ?? false)) {
          safeSetState(() {
            _model.priceTextFieldTextController?.text =
                functions.removeCommaFromNumText(
                    _model.priceTextFieldTextController.text);
            _model.priceTextFieldFocusNode?.requestFocus();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _model.priceTextFieldTextController?.selection =
                  TextSelection.collapsed(
                offset: _model.priceTextFieldTextController!.text.length,
              );
            });
          });
        } else {
          safeSetState(() {
            _model.priceTextFieldTextController?.text =
                functions.returnNumberWithComma2Decimal(
                    _model.priceTextFieldTextController.text)!;
          });
        }
      },
    );
    _model.remarkTextFieldTextController ??= TextEditingController();
    _model.remarkTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFFDB771A),
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            () {
              if (widget!.step == 'step1') {
                return 'ถ่ายรูปส่งเปลี่ยนเป้ารถยึด';
              } else if (widget!.step == 'step2') {
                return 'ถ่ายรูปส่งมอบรถ';
              } else if (widget!.step == 'step3') {
                return 'ถ่ายรูปตั้งราคา';
              } else {
                return 'Title';
              }
            }(),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Color(0xFF003063),
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFFAFAFA),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 3.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'ประเภทรถ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF404040),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                ':',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF404040),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget!
                                    .impoundCarParamSet?.improundCONTNOTYPENAME,
                                '-',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF404040),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 3.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'เลขทะเบียน',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF404040),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                ':',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF404040),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget!.impoundCarParamSet?.improundREGNO,
                                '-',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF404040),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'ถ่ายรูปรถยึด',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF404040),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              widget!.carConfig!.contains(widget!
                                      .impoundCarParamSet?.improundCONTNOTYPE)
                                  ? 'บังคับถ่ายรูปให้ครบ 10 รูป'
                                  : 'บังคับถ่ายรูปให้ครบ 9 รูป',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFFF0000),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 12.0),
                    child: Container(
                      height: 25.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 20.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  '1.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 14,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    SampleCarImageStep1Widget.routeName,
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        'หน้าตรง',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.impoundCarParamSet
                                            ?.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '1',
                                        ParamType.String,
                                      ),
                                      'carConfig': serializeParam(
                                        widget!.carConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                      'motocycleConfig': serializeParam(
                                        widget!.motocycleConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  height: 25.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: 23.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child: FaIcon(
                                            FontAwesomeIcons.image,
                                            color: Color(0xFF404040),
                                            size: 16.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 10,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                'หน้าตรง',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFAFAFA),
                                                ),
                                                child: Text(
                                                  '(บังคับถ่าย)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFFFF0000),
                                                        fontSize: 11.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
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
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: 35.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  'สถานะ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              width: 10.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                              ),
                              child: Text(
                                ':',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                width: 37.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  _model.uploadedLocalFile_carUploaded01 !=
                                              null &&
                                          (_model.uploadedLocalFile_carUploaded01
                                                  .bytes?.isNotEmpty ??
                                              false)
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (_model.uploadedLocalFile_carUploaded01 !=
                                          null &&
                                      (_model.uploadedLocalFile_carUploaded01
                                              .bytes?.isNotEmpty ??
                                          false)) {
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Container(
                                              width: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Icon(
                                                Icons.check_circle_rounded,
                                                color: Color(0xFF24BF03),
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Container(
                                        width: 20.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFAFAFA),
                                        ),
                                        child: Icon(
                                          Icons.cancel_rounded,
                                          color: Color(0xFFE21C3D),
                                          size: 20.0,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Builder(
                        builder: (context) {
                          if (_model.uploadedLocalFile_carUploaded01 != null &&
                              (_model.uploadedLocalFile_carUploaded01.bytes
                                      ?.isNotEmpty ??
                                  false)) {
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 12.0),
                              child: Container(
                                width: 200.0,
                                height: 200.0,
                                decoration: BoxDecoration(),
                                child: Stack(
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: Image.memory(
                                                _model.uploadedLocalFile_carUploaded01
                                                        .bytes ??
                                                    Uint8List.fromList([]),
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: false,
                                              tag: 'imageTag1',
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: 'imageTag1',
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.memory(
                                            _model.uploadedLocalFile_carUploaded01
                                                    .bytes ??
                                                Uint8List.fromList([]),
                                            width: 200.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 4.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.black,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 35.0,
                                          fillColor: Colors.white,
                                          icon: Icon(
                                            Icons.close_rounded,
                                            color: Color(0xFFFF0000),
                                            size: 18.0,
                                          ),
                                          onPressed: () async {
                                            safeSetState(() {
                                              _model.isDataUploading_carUploaded01 =
                                                  false;
                                              _model.uploadedLocalFile_carUploaded01 =
                                                  FFUploadedFile(
                                                      bytes: Uint8List.fromList(
                                                          []),
                                                      originalFilename: '');
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 12.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'คุณต้องการจะถ่ายรูป หน้าตรง หรือไม่?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('ยกเลิก'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('ถ่ายรูป'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (!confirmDialogResponse) {
                                    return;
                                  }
                                  final selectedMedia = await selectMedia(
                                    imageQuality: 30,
                                    multiImage: false,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    safeSetState(() => _model
                                        .isDataUploading_carUploaded01 = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                                originalFilename:
                                                    m.originalFilename,
                                              ))
                                          .toList();
                                    } finally {
                                      _model.isDataUploading_carUploaded01 =
                                          false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                        selectedMedia.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFile_carUploaded01 =
                                            selectedUploadedFiles.first;
                                      });
                                    } else {
                                      safeSetState(() {});
                                      return;
                                    }
                                  }

                                  if (_model.uploadedLocalFile_carUploaded01 !=
                                          null &&
                                      (_model.uploadedLocalFile_carUploaded01
                                              .bytes?.isNotEmpty ??
                                          false)) {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'ถ่ายรูปสำเร็จ!',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Colors.black,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'ถ่ายรูปล้มเหลว กรุณาถ่ายรูปอีกครั้ง',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Colors.black,
                                      ),
                                    );
                                    return;
                                  }
                                },
                                child: wrapWithModel(
                                  model: _model.captureCameraWidgetModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CaptureCameraWidgetWidget(),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).accent4,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Container(
                      height: 25.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 20.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  '2.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 14,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    SampleCarImageStep1Widget.routeName,
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        'หน้าซ้าย 45 องศา',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.impoundCarParamSet
                                            ?.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '2',
                                        ParamType.String,
                                      ),
                                      'carConfig': serializeParam(
                                        widget!.carConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                      'motocycleConfig': serializeParam(
                                        widget!.motocycleConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  height: 25.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: 23.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child: FaIcon(
                                            FontAwesomeIcons.image,
                                            color: Color(0xFF404040),
                                            size: 16.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 10,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                'หน้าซ้าย 45 องศา',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFAFAFA),
                                                ),
                                                child: Text(
                                                  '(บังคับถ่าย)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFFFF0000),
                                                        fontSize: 11.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
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
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: 35.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  'สถานะ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              width: 10.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                              ),
                              child: Text(
                                ':',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                width: 37.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  _model.uploadedLocalFile_carUploaded02 !=
                                              null &&
                                          (_model.uploadedLocalFile_carUploaded02
                                                  .bytes?.isNotEmpty ??
                                              false)
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (_model.uploadedLocalFile_carUploaded02 !=
                                          null &&
                                      (_model.uploadedLocalFile_carUploaded02
                                              .bytes?.isNotEmpty ??
                                          false)) {
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Container(
                                              width: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Icon(
                                                Icons.check_circle_rounded,
                                                color: Color(0xFF24BF03),
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Container(
                                        width: 20.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFAFAFA),
                                        ),
                                        child: Icon(
                                          Icons.cancel_rounded,
                                          color: Color(0xFFE21C3D),
                                          size: 20.0,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (_model.uploadedLocalFile_carUploaded02 != null &&
                          (_model.uploadedLocalFile_carUploaded02.bytes
                                  ?.isNotEmpty ??
                              false)) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: Container(
                            width: 200.0,
                            height: 200.0,
                            decoration: BoxDecoration(),
                            child: Stack(
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.memory(
                                            _model.uploadedLocalFile_carUploaded02
                                                    .bytes ??
                                                Uint8List.fromList([]),
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: 'imageTag2',
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: 'imageTag2',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.memory(
                                        _model.uploadedLocalFile_carUploaded02
                                                .bytes ??
                                            Uint8List.fromList([]),
                                        width: 200.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 4.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.black,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 35.0,
                                      fillColor: Colors.white,
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: Color(0xFFFF0000),
                                        size: 18.0,
                                      ),
                                      onPressed: () async {
                                        safeSetState(() {
                                          _model.isDataUploading_carUploaded02 =
                                              false;
                                          _model.uploadedLocalFile_carUploaded02 =
                                              FFUploadedFile(
                                                  bytes: Uint8List.fromList([]),
                                                  originalFilename: '');
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'คุณต้องการจะถ่ายรูป หน้าซ้าย 45 องศา หรือไม่?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('ยกเลิก'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('ถ่ายรูป'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ) ??
                                      false;
                              if (!confirmDialogResponse) {
                                return;
                              }
                              final selectedMedia = await selectMedia(
                                imageQuality: 30,
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(() => _model
                                    .isDataUploading_carUploaded02 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                            originalFilename:
                                                m.originalFilename,
                                          ))
                                      .toList();
                                } finally {
                                  _model.isDataUploading_carUploaded02 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                    selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_carUploaded02 =
                                        selectedUploadedFiles.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              if (_model.uploadedLocalFile_carUploaded02 !=
                                      null &&
                                  (_model.uploadedLocalFile_carUploaded02.bytes
                                          ?.isNotEmpty ??
                                      false)) {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'ถ่ายรูปสำเร็จ!',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 3000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'ถ่ายรูปล้มเหลว กรุณาถ่ายรูปอีกครั้ง',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 3000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                                return;
                              }
                            },
                            child: wrapWithModel(
                              model: _model.captureCameraWidgetModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: CaptureCameraWidgetWidget(),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Container(
                      height: 25.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 20.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  '3.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 14,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    SampleCarImageStep1Widget.routeName,
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        'หลังซ้าย 45 องศา',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.impoundCarParamSet
                                            ?.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '3',
                                        ParamType.String,
                                      ),
                                      'carConfig': serializeParam(
                                        widget!.carConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                      'motocycleConfig': serializeParam(
                                        widget!.motocycleConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  height: 25.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: 23.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child: FaIcon(
                                            FontAwesomeIcons.image,
                                            color: Color(0xFF404040),
                                            size: 16.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 10,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                'หลังซ้าย 45 องศา',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFAFAFA),
                                                ),
                                                child: Text(
                                                  '(บังคับถ่าย)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFFFF0000),
                                                        fontSize: 11.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
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
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: 35.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  'สถานะ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              width: 10.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                              ),
                              child: Text(
                                ':',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                width: 37.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  _model.uploadedLocalFile_carUploaded03 !=
                                              null &&
                                          (_model.uploadedLocalFile_carUploaded03
                                                  .bytes?.isNotEmpty ??
                                              false)
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (_model.uploadedLocalFile_carUploaded03 !=
                                          null &&
                                      (_model.uploadedLocalFile_carUploaded03
                                              .bytes?.isNotEmpty ??
                                          false)) {
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Container(
                                              width: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Icon(
                                                Icons.check_circle_rounded,
                                                color: Color(0xFF24BF03),
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Container(
                                        width: 20.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFAFAFA),
                                        ),
                                        child: Icon(
                                          Icons.cancel_rounded,
                                          color: Color(0xFFE21C3D),
                                          size: 20.0,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (_model.uploadedLocalFile_carUploaded03 != null &&
                          (_model.uploadedLocalFile_carUploaded03.bytes
                                  ?.isNotEmpty ??
                              false)) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: Container(
                            width: 200.0,
                            height: 200.0,
                            decoration: BoxDecoration(),
                            child: Stack(
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.memory(
                                            _model.uploadedLocalFile_carUploaded03
                                                    .bytes ??
                                                Uint8List.fromList([]),
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: 'imageTag3',
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: 'imageTag3',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.memory(
                                        _model.uploadedLocalFile_carUploaded03
                                                .bytes ??
                                            Uint8List.fromList([]),
                                        width: 200.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 4.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.black,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 35.0,
                                      fillColor: Colors.white,
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: Color(0xFFFF0000),
                                        size: 18.0,
                                      ),
                                      onPressed: () async {
                                        safeSetState(() {
                                          _model.isDataUploading_carUploaded03 =
                                              false;
                                          _model.uploadedLocalFile_carUploaded03 =
                                              FFUploadedFile(
                                                  bytes: Uint8List.fromList([]),
                                                  originalFilename: '');
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'คุณต้องการจะถ่ายรูป หลังซ้าย 45 องศา หรือไม่?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('ยกเลิก'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('ถ่ายรูป'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ) ??
                                      false;
                              if (!confirmDialogResponse) {
                                return;
                              }
                              final selectedMedia = await selectMedia(
                                imageQuality: 30,
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(() => _model
                                    .isDataUploading_carUploaded03 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                            originalFilename:
                                                m.originalFilename,
                                          ))
                                      .toList();
                                } finally {
                                  _model.isDataUploading_carUploaded03 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                    selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_carUploaded03 =
                                        selectedUploadedFiles.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              if (_model.uploadedLocalFile_carUploaded03 !=
                                      null &&
                                  (_model.uploadedLocalFile_carUploaded03.bytes
                                          ?.isNotEmpty ??
                                      false)) {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'ถ่ายรูปสำเร็จ!',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 3000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'ถ่ายรูปล้มเหลว กรุณาถ่ายรูปอีกครั้ง',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 3000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                                return;
                              }
                            },
                            child: wrapWithModel(
                              model: _model.captureCameraWidgetModel3,
                              updateCallback: () => safeSetState(() {}),
                              child: CaptureCameraWidgetWidget(),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Container(
                      height: 25.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 20.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  '4.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 12,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    SampleCarImageStep1Widget.routeName,
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        'หลังตรง',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.impoundCarParamSet
                                            ?.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '4',
                                        ParamType.String,
                                      ),
                                      'carConfig': serializeParam(
                                        widget!.carConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                      'motocycleConfig': serializeParam(
                                        widget!.motocycleConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  height: 25.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: 23.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child: FaIcon(
                                            FontAwesomeIcons.image,
                                            color: Color(0xFF404040),
                                            size: 16.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 10,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                'หลังตรง',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFAFAFA),
                                                ),
                                                child: Text(
                                                  '(บังคับถ่าย)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFFFF0000),
                                                        fontSize: 11.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
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
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: 35.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  'สถานะ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              width: 10.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                              ),
                              child: Text(
                                ':',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                width: 37.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  _model.uploadedLocalFile_carUploaded04 !=
                                              null &&
                                          (_model.uploadedLocalFile_carUploaded04
                                                  .bytes?.isNotEmpty ??
                                              false)
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (_model.uploadedLocalFile_carUploaded04 !=
                                          null &&
                                      (_model.uploadedLocalFile_carUploaded04
                                              .bytes?.isNotEmpty ??
                                          false)) {
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Container(
                                              width: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Icon(
                                                Icons.check_circle_rounded,
                                                color: Color(0xFF24BF03),
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Container(
                                        width: 20.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFAFAFA),
                                        ),
                                        child: Icon(
                                          Icons.cancel_rounded,
                                          color: Color(0xFFE21C3D),
                                          size: 20.0,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (_model.uploadedLocalFile_carUploaded04 != null &&
                          (_model.uploadedLocalFile_carUploaded04.bytes
                                  ?.isNotEmpty ??
                              false)) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: Container(
                            width: 200.0,
                            height: 200.0,
                            decoration: BoxDecoration(),
                            child: Stack(
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.memory(
                                            _model.uploadedLocalFile_carUploaded04
                                                    .bytes ??
                                                Uint8List.fromList([]),
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: 'imageTag4',
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: 'imageTag4',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.memory(
                                        _model.uploadedLocalFile_carUploaded04
                                                .bytes ??
                                            Uint8List.fromList([]),
                                        width: 200.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 4.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.black,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 35.0,
                                      fillColor: Colors.white,
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: Color(0xFFFF0000),
                                        size: 18.0,
                                      ),
                                      onPressed: () async {
                                        safeSetState(() {
                                          _model.isDataUploading_carUploaded04 =
                                              false;
                                          _model.uploadedLocalFile_carUploaded04 =
                                              FFUploadedFile(
                                                  bytes: Uint8List.fromList([]),
                                                  originalFilename: '');
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'คุณต้องการจะถ่ายรูป หลังตรง หรือไม่?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('ยกเลิก'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('ถ่ายรูป'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ) ??
                                      false;
                              if (!confirmDialogResponse) {
                                return;
                              }
                              final selectedMedia = await selectMedia(
                                imageQuality: 30,
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(() => _model
                                    .isDataUploading_carUploaded04 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                            originalFilename:
                                                m.originalFilename,
                                          ))
                                      .toList();
                                } finally {
                                  _model.isDataUploading_carUploaded04 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                    selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_carUploaded04 =
                                        selectedUploadedFiles.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              if (_model.uploadedLocalFile_carUploaded04 !=
                                      null &&
                                  (_model.uploadedLocalFile_carUploaded04.bytes
                                          ?.isNotEmpty ??
                                      false)) {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'ถ่ายรูปสำเร็จ!',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 3000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'ถ่ายรูปล้มเหลว กรุณาถ่ายรูปอีกครั้ง',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 3000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                                return;
                              }
                            },
                            child: wrapWithModel(
                              model: _model.captureCameraWidgetModel4,
                              updateCallback: () => safeSetState(() {}),
                              child: CaptureCameraWidgetWidget(),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Container(
                      height: 25.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 20.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  '5.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 14,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    SampleCarImageStep1Widget.routeName,
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        'หลังขวา 45 องศา',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.impoundCarParamSet
                                            ?.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '5',
                                        ParamType.String,
                                      ),
                                      'carConfig': serializeParam(
                                        widget!.carConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                      'motocycleConfig': serializeParam(
                                        widget!.motocycleConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  height: 25.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: 23.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child: FaIcon(
                                            FontAwesomeIcons.image,
                                            color: Color(0xFF404040),
                                            size: 16.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 10,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                'หลังขวา 45 องศา',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFAFAFA),
                                                ),
                                                child: Text(
                                                  '(บังคับถ่าย)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFFFF0000),
                                                        fontSize: 11.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
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
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: 35.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  'สถานะ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              width: 10.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                              ),
                              child: Text(
                                ':',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                width: 37.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  _model.uploadedLocalFile_carUploaded05 !=
                                              null &&
                                          (_model.uploadedLocalFile_carUploaded05
                                                  .bytes?.isNotEmpty ??
                                              false)
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (_model.uploadedLocalFile_carUploaded05 !=
                                          null &&
                                      (_model.uploadedLocalFile_carUploaded05
                                              .bytes?.isNotEmpty ??
                                          false)) {
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Container(
                                              width: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Icon(
                                                Icons.check_circle_rounded,
                                                color: Color(0xFF24BF03),
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Container(
                                        width: 20.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFAFAFA),
                                        ),
                                        child: Icon(
                                          Icons.cancel_rounded,
                                          color: Color(0xFFE21C3D),
                                          size: 20.0,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (_model.uploadedLocalFile_carUploaded05 != null &&
                          (_model.uploadedLocalFile_carUploaded05.bytes
                                  ?.isNotEmpty ??
                              false)) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: Container(
                            width: 200.0,
                            height: 200.0,
                            decoration: BoxDecoration(),
                            child: Stack(
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.memory(
                                            _model.uploadedLocalFile_carUploaded05
                                                    .bytes ??
                                                Uint8List.fromList([]),
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: 'imageTag5',
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: 'imageTag5',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.memory(
                                        _model.uploadedLocalFile_carUploaded05
                                                .bytes ??
                                            Uint8List.fromList([]),
                                        width: 200.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 4.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.black,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 35.0,
                                      fillColor: Colors.white,
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: Color(0xFFFF0000),
                                        size: 18.0,
                                      ),
                                      onPressed: () async {
                                        safeSetState(() {
                                          _model.isDataUploading_carUploaded05 =
                                              false;
                                          _model.uploadedLocalFile_carUploaded05 =
                                              FFUploadedFile(
                                                  bytes: Uint8List.fromList([]),
                                                  originalFilename: '');
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'คุณต้องการจะถ่ายรูป หลังขวา 45 องศา หรือไม่?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('ยกเลิก'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('ถ่ายรูป'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ) ??
                                      false;
                              if (!confirmDialogResponse) {
                                return;
                              }
                              final selectedMedia = await selectMedia(
                                imageQuality: 30,
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(() => _model
                                    .isDataUploading_carUploaded05 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                            originalFilename:
                                                m.originalFilename,
                                          ))
                                      .toList();
                                } finally {
                                  _model.isDataUploading_carUploaded05 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                    selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_carUploaded05 =
                                        selectedUploadedFiles.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              if (_model.uploadedLocalFile_carUploaded05 !=
                                      null &&
                                  (_model.uploadedLocalFile_carUploaded05.bytes
                                          ?.isNotEmpty ??
                                      false)) {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'ถ่ายรูปสำเร็จ!',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 3000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'ถ่ายรูปล้มเหลว กรุณาถ่ายรูปอีกครั้ง',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 3000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                                return;
                              }
                            },
                            child: wrapWithModel(
                              model: _model.captureCameraWidgetModel5,
                              updateCallback: () => safeSetState(() {}),
                              child: CaptureCameraWidgetWidget(),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Container(
                      height: 25.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 20.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  '6.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 14,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    SampleCarImageStep1Widget.routeName,
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        'หน้าขวา 45 องศา',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.impoundCarParamSet
                                            ?.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '6',
                                        ParamType.String,
                                      ),
                                      'carConfig': serializeParam(
                                        widget!.carConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                      'motocycleConfig': serializeParam(
                                        widget!.motocycleConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  height: 25.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: 23.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child: FaIcon(
                                            FontAwesomeIcons.image,
                                            color: Color(0xFF404040),
                                            size: 16.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 10,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                'หน้าขวา 45 องศา',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFAFAFA),
                                                ),
                                                child: Text(
                                                  '(บังคับถ่าย)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFFFF0000),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
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
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: 35.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  'สถานะ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              width: 10.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                              ),
                              child: Text(
                                ':',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                width: 37.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  _model.uploadedLocalFile_carUploaded06 !=
                                              null &&
                                          (_model.uploadedLocalFile_carUploaded06
                                                  .bytes?.isNotEmpty ??
                                              false)
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (_model.uploadedLocalFile_carUploaded06 !=
                                          null &&
                                      (_model.uploadedLocalFile_carUploaded06
                                              .bytes?.isNotEmpty ??
                                          false)) {
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Container(
                                              width: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Icon(
                                                Icons.check_circle_rounded,
                                                color: Color(0xFF24BF03),
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Container(
                                        width: 20.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFAFAFA),
                                        ),
                                        child: Icon(
                                          Icons.cancel_rounded,
                                          color: Color(0xFFE21C3D),
                                          size: 20.0,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (_model.uploadedLocalFile_carUploaded06 != null &&
                          (_model.uploadedLocalFile_carUploaded06.bytes
                                  ?.isNotEmpty ??
                              false)) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: Container(
                            width: 200.0,
                            height: 200.0,
                            decoration: BoxDecoration(),
                            child: Stack(
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.memory(
                                            _model.uploadedLocalFile_carUploaded06
                                                    .bytes ??
                                                Uint8List.fromList([]),
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: 'imageTag6',
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: 'imageTag6',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.memory(
                                        _model.uploadedLocalFile_carUploaded06
                                                .bytes ??
                                            Uint8List.fromList([]),
                                        width: 200.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 4.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.black,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 35.0,
                                      fillColor: Colors.white,
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: Color(0xFFFF0000),
                                        size: 18.0,
                                      ),
                                      onPressed: () async {
                                        safeSetState(() {
                                          _model.isDataUploading_carUploaded06 =
                                              false;
                                          _model.uploadedLocalFile_carUploaded06 =
                                              FFUploadedFile(
                                                  bytes: Uint8List.fromList([]),
                                                  originalFilename: '');
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'คุณต้องการจะถ่ายรูป หน้าขวา 45 องศา หรือไม่?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('ยกเลิก'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('ถ่ายรูป'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ) ??
                                      false;
                              if (!confirmDialogResponse) {
                                return;
                              }
                              final selectedMedia = await selectMedia(
                                imageQuality: 30,
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(() => _model
                                    .isDataUploading_carUploaded06 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                            originalFilename:
                                                m.originalFilename,
                                          ))
                                      .toList();
                                } finally {
                                  _model.isDataUploading_carUploaded06 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                    selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_carUploaded06 =
                                        selectedUploadedFiles.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              if (_model.uploadedLocalFile_carUploaded06 !=
                                      null &&
                                  (_model.uploadedLocalFile_carUploaded06.bytes
                                          ?.isNotEmpty ??
                                      false)) {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'ถ่ายรูปสำเร็จ!',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 3000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'ถ่ายรูปล้มเหลว กรุณาถ่ายรูปอีกครั้ง',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 3000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                                return;
                              }
                            },
                            child: wrapWithModel(
                              model: _model.captureCameraWidgetModel6,
                              updateCallback: () => safeSetState(() {}),
                              child: CaptureCameraWidgetWidget(),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Container(
                      height: 25.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 20.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  '7.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 14,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    SampleCarImageStep1Widget.routeName,
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        widget!.impoundCarParamSet
                                                    ?.improundCONTNOTYPE ==
                                                'C'
                                            ? 'เลขไมล์'
                                            : 'เลขตัวถังรถ',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.impoundCarParamSet
                                            ?.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '7',
                                        ParamType.String,
                                      ),
                                      'carConfig': serializeParam(
                                        widget!.carConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                      'motocycleConfig': serializeParam(
                                        widget!.motocycleConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  height: 25.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: 23.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child: FaIcon(
                                            FontAwesomeIcons.image,
                                            color: Color(0xFF404040),
                                            size: 16.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 10,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                widget!.carConfig!.contains(
                                                        widget!
                                                            .impoundCarParamSet
                                                            ?.improundCONTNOTYPE)
                                                    ? 'เลขไมล์'
                                                    : 'เลขตัวถังรถ',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFAFAFA),
                                                ),
                                                child: Text(
                                                  '(บังคับถ่าย)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFFFF0000),
                                                        fontSize: 11.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
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
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: 35.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  'สถานะ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              width: 10.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                              ),
                              child: Text(
                                ':',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                width: 37.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  _model.uploadedLocalFile_carUploaded07 !=
                                              null &&
                                          (_model.uploadedLocalFile_carUploaded07
                                                  .bytes?.isNotEmpty ??
                                              false)
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (_model.uploadedLocalFile_carUploaded07 !=
                                          null &&
                                      (_model.uploadedLocalFile_carUploaded07
                                              .bytes?.isNotEmpty ??
                                          false)) {
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Container(
                                              width: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Icon(
                                                Icons.check_circle_rounded,
                                                color: Color(0xFF24BF03),
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Container(
                                        width: 20.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFAFAFA),
                                        ),
                                        child: Icon(
                                          Icons.cancel_rounded,
                                          color: Color(0xFFE21C3D),
                                          size: 20.0,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (_model.uploadedLocalFile_carUploaded07 != null &&
                          (_model.uploadedLocalFile_carUploaded07.bytes
                                  ?.isNotEmpty ??
                              false)) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: Container(
                            width: 200.0,
                            height: 200.0,
                            decoration: BoxDecoration(),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: Image.memory(
                                              _model.uploadedLocalFile_carUploaded07
                                                      .bytes ??
                                                  Uint8List.fromList([]),
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            tag: 'imageTag7',
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: 'imageTag7',
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.memory(
                                          _model.uploadedLocalFile_carUploaded07
                                                  .bytes ??
                                              Uint8List.fromList([]),
                                          width: 200.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 4.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.black,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 35.0,
                                      fillColor: Colors.white,
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: Color(0xFFFF0000),
                                        size: 18.0,
                                      ),
                                      onPressed: () async {
                                        safeSetState(() {
                                          _model.isDataUploading_carUploaded07 =
                                              false;
                                          _model.uploadedLocalFile_carUploaded07 =
                                              FFUploadedFile(
                                                  bytes: Uint8List.fromList([]),
                                                  originalFilename: '');
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(widget!.carConfig!
                                                      .contains(widget!
                                                          .impoundCarParamSet
                                                          ?.improundCONTNOTYPE)
                                                  ? 'คุณต้องการจะถ่ายรูป เลขไมค์ หรือไม่?'
                                                  : 'คุณต้องการจะถ่ายรูป เลขตัวถัง หรือไม่?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('ยกเลิก'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('ถ่ายรูป'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ) ??
                                      false;
                              if (!confirmDialogResponse) {
                                return;
                              }
                              final selectedMedia = await selectMedia(
                                imageQuality: 30,
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(() => _model
                                    .isDataUploading_carUploaded07 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                            originalFilename:
                                                m.originalFilename,
                                          ))
                                      .toList();
                                } finally {
                                  _model.isDataUploading_carUploaded07 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                    selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_carUploaded07 =
                                        selectedUploadedFiles.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              if (_model.uploadedLocalFile_carUploaded07 !=
                                      null &&
                                  (_model.uploadedLocalFile_carUploaded07.bytes
                                          ?.isNotEmpty ??
                                      false)) {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'ถ่ายรูปสำเร็จ!',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 3000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'ถ่ายรูปล้มเหลว กรุณาถ่ายรูปอีกครั้ง',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 3000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                                return;
                              }
                            },
                            child: wrapWithModel(
                              model: _model.captureCameraWidgetModel7,
                              updateCallback: () => safeSetState(() {}),
                              child: CaptureCameraWidgetWidget(),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Container(
                      height: 25.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 20.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  '8.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 14,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    SampleCarImageStep1Widget.routeName,
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        widget!.impoundCarParamSet
                                                    ?.improundCONTNOTYPE ==
                                                'C'
                                            ? 'คอนโซลหน้า'
                                            : 'เครื่องยนต์',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.impoundCarParamSet
                                            ?.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '8',
                                        ParamType.String,
                                      ),
                                      'carConfig': serializeParam(
                                        widget!.carConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                      'motocycleConfig': serializeParam(
                                        widget!.motocycleConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  height: 25.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: 23.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child: FaIcon(
                                            FontAwesomeIcons.image,
                                            color: Color(0xFF404040),
                                            size: 16.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 10,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                widget!.carConfig!.contains(
                                                        widget!
                                                            .impoundCarParamSet
                                                            ?.improundCONTNOTYPE)
                                                    ? 'คอนโซลหน้า'
                                                    : 'รูปเครื่องยนต์',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            if (false)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFAFAFA),
                                                ),
                                                child: Text(
                                                  '(ถ้ามี)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF404040),
                                                        fontSize: 11.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFAFAFA),
                                                ),
                                                child: Text(
                                                  '(บังคับถ่าย)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFFFF0000),
                                                        fontSize: 11.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
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
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: 35.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  'สถานะ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              width: 10.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                              ),
                              child: Text(
                                ':',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                width: 37.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  _model.uploadedLocalFile_carUploaded08 !=
                                              null &&
                                          (_model.uploadedLocalFile_carUploaded08
                                                  .bytes?.isNotEmpty ??
                                              false)
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (_model.uploadedLocalFile_carUploaded08 !=
                                          null &&
                                      (_model.uploadedLocalFile_carUploaded08
                                              .bytes?.isNotEmpty ??
                                          false)) {
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Container(
                                              width: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Icon(
                                                Icons.check_circle_rounded,
                                                color: Color(0xFF24BF03),
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Container(
                                        width: 20.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFAFAFA),
                                        ),
                                        child: Icon(
                                          Icons.cancel_rounded,
                                          color: Color(0xFFE21C3D),
                                          size: 20.0,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (_model.uploadedLocalFile_carUploaded08 != null &&
                          (_model.uploadedLocalFile_carUploaded08.bytes
                                  ?.isNotEmpty ??
                              false)) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: Container(
                            width: 200.0,
                            height: 200.0,
                            decoration: BoxDecoration(),
                            child: Stack(
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.memory(
                                            _model.uploadedLocalFile_carUploaded08
                                                    .bytes ??
                                                Uint8List.fromList([]),
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: 'imageTag8',
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: 'imageTag8',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.memory(
                                        _model.uploadedLocalFile_carUploaded08
                                                .bytes ??
                                            Uint8List.fromList([]),
                                        width: 200.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 4.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.black,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 35.0,
                                      fillColor: Colors.white,
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: Color(0xFFFF0000),
                                        size: 18.0,
                                      ),
                                      onPressed: () async {
                                        safeSetState(() {
                                          _model.isDataUploading_carUploaded08 =
                                              false;
                                          _model.uploadedLocalFile_carUploaded08 =
                                              FFUploadedFile(
                                                  bytes: Uint8List.fromList([]),
                                                  originalFilename: '');
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(widget!.carConfig!
                                                      .contains(widget!
                                                          .impoundCarParamSet
                                                          ?.improundCONTNOTYPE)
                                                  ? 'คุณต้องการจะถ่ายรูป คอนโซลหน้า หรือไม่?'
                                                  : 'คุณต้องการจะถ่ายรูป เลขเครื่องยนต์ หรือไม่?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('ยกเลิก'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('ถ่ายรูป'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ) ??
                                      false;
                              if (!confirmDialogResponse) {
                                return;
                              }
                              final selectedMedia = await selectMedia(
                                imageQuality: 30,
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(() => _model
                                    .isDataUploading_carUploaded08 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                            originalFilename:
                                                m.originalFilename,
                                          ))
                                      .toList();
                                } finally {
                                  _model.isDataUploading_carUploaded08 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                    selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_carUploaded08 =
                                        selectedUploadedFiles.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              if (_model.uploadedLocalFile_carUploaded08 !=
                                      null &&
                                  (_model.uploadedLocalFile_carUploaded08.bytes
                                          ?.isNotEmpty ??
                                      false)) {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'ถ่ายรูปสำเร็จ!',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 3000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'ถ่ายรูปล้มเหลว กรุณาถ่ายรูปอีกครั้ง',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 3000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                                return;
                              }
                            },
                            child: wrapWithModel(
                              model: _model.captureCameraWidgetModel8,
                              updateCallback: () => safeSetState(() {}),
                              child: CaptureCameraWidgetWidget(),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Container(
                      height: 25.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 20.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  '9.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 14,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    SampleCarImageStep1Widget.routeName,
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        widget!.impoundCarParamSet
                                                    ?.improundCONTNOTYPE ==
                                                'C'
                                            ? 'เบาะหลัง'
                                            : 'เลขไมล์',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.impoundCarParamSet
                                            ?.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '9',
                                        ParamType.String,
                                      ),
                                      'carConfig': serializeParam(
                                        widget!.carConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                      'motocycleConfig': serializeParam(
                                        widget!.motocycleConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  height: 25.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: 23.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child: FaIcon(
                                            FontAwesomeIcons.image,
                                            color: Color(0xFF404040),
                                            size: 16.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 10,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                widget!.carConfig!.contains(
                                                        widget!
                                                            .impoundCarParamSet
                                                            ?.improundCONTNOTYPE)
                                                    ? 'เบาะหลัง'
                                                    : 'เลขไมล์',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            if (widget!.carConfig?.contains(
                                                    widget!.impoundCarParamSet
                                                        ?.improundCONTNOTYPE) ??
                                                true)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFAFAFA),
                                                ),
                                                child: Text(
                                                  '(ถ้ามี)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF404040),
                                                        fontSize: 11.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            if (widget!.motocycleConfig
                                                    ?.contains(widget!
                                                        .impoundCarParamSet
                                                        ?.improundCONTNOTYPE) ??
                                                true)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFAFAFA),
                                                  ),
                                                  child: Text(
                                                    '(บังคับถ่าย)',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFFFF0000),
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
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
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: 35.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  'สถานะ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              width: 10.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                              ),
                              child: Text(
                                ':',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                width: 37.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  _model.uploadedLocalFile_carUploaded09 !=
                                              null &&
                                          (_model.uploadedLocalFile_carUploaded09
                                                  .bytes?.isNotEmpty ??
                                              false)
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (_model.uploadedLocalFile_carUploaded09 !=
                                          null &&
                                      (_model.uploadedLocalFile_carUploaded09
                                              .bytes?.isNotEmpty ??
                                          false)) {
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Container(
                                              width: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Icon(
                                                Icons.check_circle_rounded,
                                                color: Color(0xFF24BF03),
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Container(
                                        width: 20.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFAFAFA),
                                        ),
                                        child: Icon(
                                          Icons.cancel_rounded,
                                          color: Color(0xFFE21C3D),
                                          size: 20.0,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (_model.uploadedLocalFile_carUploaded09 != null &&
                          (_model.uploadedLocalFile_carUploaded09.bytes
                                  ?.isNotEmpty ??
                              false)) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: Container(
                            width: 200.0,
                            height: 200.0,
                            decoration: BoxDecoration(),
                            child: Stack(
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.memory(
                                            _model.uploadedLocalFile_carUploaded09
                                                    .bytes ??
                                                Uint8List.fromList([]),
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: 'imageTag9',
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: 'imageTag9',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.memory(
                                        _model.uploadedLocalFile_carUploaded09
                                                .bytes ??
                                            Uint8List.fromList([]),
                                        width: 200.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 4.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.black,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 35.0,
                                      fillColor: Colors.white,
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: Color(0xFFFF0000),
                                        size: 18.0,
                                      ),
                                      onPressed: () async {
                                        safeSetState(() {
                                          _model.isDataUploading_carUploaded09 =
                                              false;
                                          _model.uploadedLocalFile_carUploaded09 =
                                              FFUploadedFile(
                                                  bytes: Uint8List.fromList([]),
                                                  originalFilename: '');
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(widget!.carConfig!
                                                      .contains(widget!
                                                          .impoundCarParamSet
                                                          ?.improundCONTNOTYPE)
                                                  ? 'คุณต้องการจะถ่ายรูป เบาะหลัง หรือไม่?'
                                                  : 'คุณต้องการจะถ่ายรูป เลขไมล์ หรือไม่?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('ยกเลิก'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('ถ่ายรูป'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ) ??
                                      false;
                              if (!confirmDialogResponse) {
                                return;
                              }
                              final selectedMedia = await selectMedia(
                                imageQuality: 30,
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(() => _model
                                    .isDataUploading_carUploaded09 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                            originalFilename:
                                                m.originalFilename,
                                          ))
                                      .toList();
                                } finally {
                                  _model.isDataUploading_carUploaded09 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                    selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_carUploaded09 =
                                        selectedUploadedFiles.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              if (_model.uploadedLocalFile_carUploaded09 !=
                                      null &&
                                  (_model.uploadedLocalFile_carUploaded09.bytes
                                          ?.isNotEmpty ??
                                      false)) {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'ถ่ายรูปสำเร็จ!',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 3000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'ถ่ายรูปล้มเหลว กรุณาถ่ายรูปอีกครั้ง',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 3000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                                return;
                              }
                            },
                            child: wrapWithModel(
                              model: _model.captureCameraWidgetModel9,
                              updateCallback: () => safeSetState(() {}),
                              child: CaptureCameraWidgetWidget(),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Container(
                      height: 25.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 20.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  '10.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 14,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (!widget!.carConfig!.contains(widget!
                                      .impoundCarParamSet
                                      ?.improundCONTNOTYPE)) {
                                    return;
                                  }

                                  context.pushNamed(
                                    SampleCarImageStep1Widget.routeName,
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        'เครื่องยนต์',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.impoundCarParamSet
                                            ?.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '10',
                                        ParamType.String,
                                      ),
                                      'carConfig': serializeParam(
                                        widget!.carConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                      'motocycleConfig': serializeParam(
                                        widget!.motocycleConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  height: 25.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: 23.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child: FaIcon(
                                            FontAwesomeIcons.image,
                                            color: Color(0xFF404040),
                                            size: 16.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 10,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                widget!.carConfig!.contains(
                                                        widget!
                                                            .impoundCarParamSet
                                                            ?.improundCONTNOTYPE)
                                                    ? 'รูปเครื่องยนต์'
                                                    : 'อื่นๆ',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            if (widget!.motocycleConfig
                                                    ?.contains(widget!
                                                        .impoundCarParamSet
                                                        ?.improundCONTNOTYPE) ??
                                                true)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFAFAFA),
                                                ),
                                                child: Text(
                                                  '(ถ้ามี)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF404040),
                                                        fontSize: 11.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            if (widget!.carConfig?.contains(
                                                    widget!.impoundCarParamSet
                                                        ?.improundCONTNOTYPE) ??
                                                true)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFAFAFA),
                                                  ),
                                                  child: Text(
                                                    '(บังคับถ่าย)',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFFFF0000),
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
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
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: 35.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  'สถานะ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              width: 10.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                              ),
                              child: Text(
                                ':',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                width: 37.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  _model.uploadedLocalFile_carUploaded10 !=
                                              null &&
                                          (_model.uploadedLocalFile_carUploaded10
                                                  .bytes?.isNotEmpty ??
                                              false)
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (_model.uploadedLocalFile_carUploaded10 !=
                                          null &&
                                      (_model.uploadedLocalFile_carUploaded10
                                              .bytes?.isNotEmpty ??
                                          false)) {
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Container(
                                              width: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Icon(
                                                Icons.check_circle_rounded,
                                                color: Color(0xFF24BF03),
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Container(
                                        width: 20.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFAFAFA),
                                        ),
                                        child: Icon(
                                          Icons.cancel_rounded,
                                          color: Color(0xFFE21C3D),
                                          size: 20.0,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (_model.uploadedLocalFile_carUploaded10 != null &&
                          (_model.uploadedLocalFile_carUploaded10.bytes
                                  ?.isNotEmpty ??
                              false)) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: Container(
                            width: 200.0,
                            height: 200.0,
                            decoration: BoxDecoration(),
                            child: Stack(
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.memory(
                                            _model.uploadedLocalFile_carUploaded10
                                                    .bytes ??
                                                Uint8List.fromList([]),
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: 'imageTag10',
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: 'imageTag10',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.memory(
                                        _model.uploadedLocalFile_carUploaded10
                                                .bytes ??
                                            Uint8List.fromList([]),
                                        width: 200.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 4.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.black,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 35.0,
                                      fillColor: Colors.white,
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: Color(0xFFFF0000),
                                        size: 18.0,
                                      ),
                                      onPressed: () async {
                                        safeSetState(() {
                                          _model.isDataUploading_carUploaded10 =
                                              false;
                                          _model.uploadedLocalFile_carUploaded10 =
                                              FFUploadedFile(
                                                  bytes: Uint8List.fromList([]),
                                                  originalFilename: '');
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(widget!.carConfig!
                                                      .contains(widget!
                                                          .impoundCarParamSet
                                                          ?.improundCONTNOTYPE)
                                                  ? 'คุณต้องการจะถ่ายรูป เครื่องยนต์ หรือไม่?'
                                                  : 'คุณต้องการจะถ่ายรูป อื่นๆ หรือไม่?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('ยกเลิก'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('ถ่ายรูป'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ) ??
                                      false;
                              if (!confirmDialogResponse) {
                                return;
                              }
                              final selectedMedia = await selectMedia(
                                imageQuality: 30,
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(() => _model
                                    .isDataUploading_carUploaded10 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                            originalFilename:
                                                m.originalFilename,
                                          ))
                                      .toList();
                                } finally {
                                  _model.isDataUploading_carUploaded10 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                    selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_carUploaded10 =
                                        selectedUploadedFiles.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              if (_model.uploadedLocalFile_carUploaded10 !=
                                      null &&
                                  (_model.uploadedLocalFile_carUploaded10.bytes
                                          ?.isNotEmpty ??
                                      false)) {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'ถ่ายรูปสำเร็จ!',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 3000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'ถ่ายรูปล้มเหลว กรุณาถ่ายรูปอีกครั้ง',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 3000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                                return;
                              }
                            },
                            child: wrapWithModel(
                              model: _model.captureCameraWidgetModel10,
                              updateCallback: () => safeSetState(() {}),
                              child: CaptureCameraWidgetWidget(),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Container(
                      height: 25.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 20.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  '11.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 14,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (!widget!.carConfig!.contains(widget!
                                      .impoundCarParamSet
                                      ?.improundCONTNOTYPE)) {
                                    return;
                                  }

                                  context.pushNamed(
                                    SampleCarImageStep1Widget.routeName,
                                    queryParameters: {
                                      'imageName': serializeParam(
                                        'เลขตัวถังรถ',
                                        ParamType.String,
                                      ),
                                      'contNoType': serializeParam(
                                        widget!.impoundCarParamSet
                                            ?.improundCONTNOTYPE,
                                        ParamType.String,
                                      ),
                                      'numberOfImage': serializeParam(
                                        '11',
                                        ParamType.String,
                                      ),
                                      'carConfig': serializeParam(
                                        widget!.carConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                      'motocycleConfig': serializeParam(
                                        widget!.motocycleConfig,
                                        ParamType.String,
                                        isList: true,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  height: 25.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: 23.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAFAFA),
                                          ),
                                          child: FaIcon(
                                            FontAwesomeIcons.image,
                                            color: Color(0xFF404040),
                                            size: 16.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 10,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                widget!.carConfig!.contains(
                                                        widget!
                                                            .impoundCarParamSet
                                                            ?.improundCONTNOTYPE)
                                                    ? 'เลขตัวถังรถ'
                                                    : 'อื่นๆ',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            if (widget!.motocycleConfig
                                                    ?.contains(widget!
                                                        .impoundCarParamSet
                                                        ?.improundCONTNOTYPE) ??
                                                true)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFAFAFA),
                                                ),
                                                child: Text(
                                                  '(ถ้ามี)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF404040),
                                                        fontSize: 11.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            if (widget!.carConfig?.contains(
                                                    widget!.impoundCarParamSet
                                                        ?.improundCONTNOTYPE) ??
                                                true)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFAFAFA),
                                                  ),
                                                  child: Text(
                                                    '(บังคับถ่าย)',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFFFF0000),
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
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
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: 35.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  'สถานะ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              width: 10.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                              ),
                              child: Text(
                                ':',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF404040),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                width: 37.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Text(
                                  _model.uploadedLocalFile_carUploaded11 !=
                                              null &&
                                          (_model.uploadedLocalFile_carUploaded11
                                                  .bytes?.isNotEmpty ??
                                              false)
                                      ? 'อัพโหลดสำเร็จ'
                                      : 'ยังไม่อัพโหลด',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF404040),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Builder(
                                builder: (context) {
                                  if (_model.uploadedLocalFile_carUploaded11 !=
                                          null &&
                                      (_model.uploadedLocalFile_carUploaded11
                                              .bytes?.isNotEmpty ??
                                          false)) {
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Container(
                                              width: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Icon(
                                                Icons.check_circle_rounded,
                                                color: Color(0xFF24BF03),
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Container(
                                        width: 20.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFAFAFA),
                                        ),
                                        child: Icon(
                                          Icons.cancel_rounded,
                                          color: Color(0xFFE21C3D),
                                          size: 20.0,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (_model.uploadedLocalFile_carUploaded11 != null &&
                          (_model.uploadedLocalFile_carUploaded11.bytes
                                  ?.isNotEmpty ??
                              false)) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: Container(
                            width: 200.0,
                            height: 200.0,
                            decoration: BoxDecoration(),
                            child: Stack(
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.memory(
                                            _model.uploadedLocalFile_carUploaded11
                                                    .bytes ??
                                                Uint8List.fromList([]),
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: 'imageTag11',
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: 'imageTag11',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.memory(
                                        _model.uploadedLocalFile_carUploaded11
                                                .bytes ??
                                            Uint8List.fromList([]),
                                        width: 200.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 4.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.black,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 35.0,
                                      fillColor: Colors.white,
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: Color(0xFFFF0000),
                                        size: 18.0,
                                      ),
                                      onPressed: () async {
                                        safeSetState(() {
                                          _model.isDataUploading_carUploaded11 =
                                              false;
                                          _model.uploadedLocalFile_carUploaded11 =
                                              FFUploadedFile(
                                                  bytes: Uint8List.fromList([]),
                                                  originalFilename: '');
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(widget!.carConfig!
                                                      .contains(widget!
                                                          .impoundCarParamSet
                                                          ?.improundCONTNOTYPE)
                                                  ? 'คุณต้องการจะถ่ายรูป เลขตัวถังรถ หรือไม่?'
                                                  : 'คุณต้องการจะถ่ายรูป อื่นๆ หรือไม่?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('ยกเลิก'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('ถ่ายรูป'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ) ??
                                      false;
                              if (!confirmDialogResponse) {
                                return;
                              }
                              final selectedMedia = await selectMedia(
                                imageQuality: 30,
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(() => _model
                                    .isDataUploading_carUploaded11 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                            originalFilename:
                                                m.originalFilename,
                                          ))
                                      .toList();
                                } finally {
                                  _model.isDataUploading_carUploaded11 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                    selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile_carUploaded11 =
                                        selectedUploadedFiles.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }

                              if (_model.uploadedLocalFile_carUploaded11 !=
                                      null &&
                                  (_model.uploadedLocalFile_carUploaded11.bytes
                                          ?.isNotEmpty ??
                                      false)) {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'ถ่ายรูปสำเร็จ!',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 3000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'ถ่ายรูปล้มเหลว กรุณาถ่ายรูปอีกครั้ง',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 3000),
                                    backgroundColor: Colors.black,
                                  ),
                                );
                                return;
                              }
                            },
                            child: wrapWithModel(
                              model: _model.captureCameraWidgetModel11,
                              updateCallback: () => safeSetState(() {}),
                              child: CaptureCameraWidgetWidget(),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Container(
                          height: 25.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 20.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFAFAFA),
                                    ),
                                    child: Text(
                                      '12.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF404040),
                                            fontSize: 11.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 14,
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (!widget!.carConfig!.contains(widget!
                                          .impoundCarParamSet
                                          ?.improundCONTNOTYPE)) {
                                        return;
                                      }

                                      context.pushNamed(
                                        SampleCarImageStep1Widget.routeName,
                                        queryParameters: {
                                          'imageName': serializeParam(
                                            'แผ่นเพลทรถ',
                                            ParamType.String,
                                          ),
                                          'contNoType': serializeParam(
                                            widget!.impoundCarParamSet
                                                ?.improundCONTNOTYPE,
                                            ParamType.String,
                                          ),
                                          'numberOfImage': serializeParam(
                                            '12',
                                            ParamType.String,
                                          ),
                                          'carConfig': serializeParam(
                                            widget!.carConfig,
                                            ParamType.String,
                                            isList: true,
                                          ),
                                          'motocycleConfig': serializeParam(
                                            widget!.motocycleConfig,
                                            ParamType.String,
                                            isList: true,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      height: 25.0,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              width: 23.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: FaIcon(
                                                FontAwesomeIcons.image,
                                                color: Color(0xFF404040),
                                                size: 16.0,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 10,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFAFAFA),
                                                  ),
                                                  child: Text(
                                                    widget!.carConfig!.contains(widget!
                                                            .impoundCarParamSet
                                                            ?.improundCONTNOTYPE)
                                                        ? 'แผ่นเพลทรถ'
                                                        : 'อื่นๆ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF404040),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFAFAFA),
                                                  ),
                                                  child: Text(
                                                    '(ถ้ามี)',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF404040),
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
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
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    width: 35.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFAFAFA),
                                    ),
                                    child: Text(
                                      'สถานะ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF404040),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 10.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                  ),
                                  child: Text(
                                    ':',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF404040),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    width: 37.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFAFAFA),
                                    ),
                                    child: Text(
                                      _model.uploadedLocalFile_carUploaded12 !=
                                                  null &&
                                              (_model.uploadedLocalFile_carUploaded12
                                                      .bytes?.isNotEmpty ??
                                                  false)
                                          ? 'อัพโหลดสำเร็จ'
                                          : 'ยังไม่อัพโหลด',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF404040),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Builder(
                                    builder: (context) {
                                      if (_model.uploadedLocalFile_carUploaded12 !=
                                              null &&
                                          (_model.uploadedLocalFile_carUploaded12
                                                  .bytes?.isNotEmpty ??
                                              false)) {
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Container(
                                                  width: 20.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFAFAFA),
                                                  ),
                                                  child: Icon(
                                                    Icons.check_circle_rounded,
                                                    color: Color(0xFF24BF03),
                                                    size: 20.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Container(
                                            width: 20.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFAFAFA),
                                            ),
                                            child: Icon(
                                              Icons.cancel_rounded,
                                              color: Color(0xFFE21C3D),
                                              size: 20.0,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          if (_model.uploadedLocalFile_carUploaded12 != null &&
                              (_model.uploadedLocalFile_carUploaded12.bytes
                                      ?.isNotEmpty ??
                                  false)) {
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 12.0),
                              child: Container(
                                width: 200.0,
                                height: 200.0,
                                decoration: BoxDecoration(),
                                child: Stack(
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: Image.memory(
                                                _model.uploadedLocalFile_carUploaded12
                                                        .bytes ??
                                                    Uint8List.fromList([]),
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: false,
                                              tag: 'imageTag12',
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: 'imageTag12',
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.memory(
                                            _model.uploadedLocalFile_carUploaded12
                                                    .bytes ??
                                                Uint8List.fromList([]),
                                            width: 200.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 4.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.black,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 35.0,
                                          fillColor: Colors.white,
                                          icon: Icon(
                                            Icons.close_rounded,
                                            color: Color(0xFFFF0000),
                                            size: 18.0,
                                          ),
                                          onPressed: () async {
                                            safeSetState(() {
                                              _model.isDataUploading_carUploaded12 =
                                                  false;
                                              _model.uploadedLocalFile_carUploaded12 =
                                                  FFUploadedFile(
                                                      bytes: Uint8List.fromList(
                                                          []),
                                                      originalFilename: '');
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 12.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(widget!
                                                          .carConfig!
                                                          .contains(widget!
                                                              .impoundCarParamSet
                                                              ?.improundCONTNOTYPE)
                                                      ? 'คุณต้องการจะถ่ายรูป แผ่นเพลทรถ หรือไม่?'
                                                      : 'คุณต้องการจะถ่ายรูป อื่นๆหรือไม่?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('ยกเลิก'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('ถ่ายรูป'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (!confirmDialogResponse) {
                                    return;
                                  }
                                  final selectedMedia = await selectMedia(
                                    imageQuality: 30,
                                    multiImage: false,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    safeSetState(() => _model
                                        .isDataUploading_carUploaded12 = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                                originalFilename:
                                                    m.originalFilename,
                                              ))
                                          .toList();
                                    } finally {
                                      _model.isDataUploading_carUploaded12 =
                                          false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                        selectedMedia.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFile_carUploaded12 =
                                            selectedUploadedFiles.first;
                                      });
                                    } else {
                                      safeSetState(() {});
                                      return;
                                    }
                                  }

                                  if (_model.uploadedLocalFile_carUploaded12 !=
                                          null &&
                                      (_model.uploadedLocalFile_carUploaded12
                                              .bytes?.isNotEmpty ??
                                          false)) {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'ถ่ายรูปสำเร็จ!',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Colors.black,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'ถ่ายรูปล้มเหลว กรุณาถ่ายรูปอีกครั้ง',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Colors.black,
                                      ),
                                    );
                                    return;
                                  }
                                },
                                child: wrapWithModel(
                                  model: _model.captureCameraWidgetModel12,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CaptureCameraWidgetWidget(),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).accent4,
                      ),
                    ],
                  ),
                  if (functions.getBoolValueInJson(functions.getDataFromMapJson(
                          functions.getDataFromMapJson(
                              widget!.saveAccessRoleData, widget!.step),
                          'deliver_image_required')) ??
                      true)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: Container(
                            height: 25.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: 20.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFAFAFA),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          '13.',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF404040),
                                                fontSize: 11.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 14,
                                    child: Container(
                                      height: 25.0,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFAFAFA),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                'พนักงานรับรถคู่กับรถ',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  '(บังคับถ่าย)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFFFF0000),
                                                        fontSize: 11.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      width: 35.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFAFAFA),
                                      ),
                                      child: Text(
                                        'สถานะ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF404040),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 10.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFAFAFA),
                                    ),
                                    child: Text(
                                      ':',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF404040),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      width: 37.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFAFAFA),
                                      ),
                                      child: Text(
                                        _model.uploadedLocalFile_carUploaded13 !=
                                                    null &&
                                                (_model.uploadedLocalFile_carUploaded13
                                                        .bytes?.isNotEmpty ??
                                                    false)
                                            ? 'อัพโหลดสำเร็จ'
                                            : 'ยังไม่อัพโหลด',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF404040),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Builder(
                                      builder: (context) {
                                        if (_model.uploadedLocalFile_carUploaded13 !=
                                                null &&
                                            (_model.uploadedLocalFile_carUploaded13
                                                    .bytes?.isNotEmpty ??
                                                false)) {
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Container(
                                                    width: 20.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFAFAFA),
                                                    ),
                                                    child: Icon(
                                                      Icons
                                                          .check_circle_rounded,
                                                      color: Color(0xFF24BF03),
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          return Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Container(
                                              width: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Icon(
                                                Icons.cancel_rounded,
                                                color: Color(0xFFE21C3D),
                                                size: 20.0,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            if (_model.uploadedLocalFile_carUploaded13 !=
                                    null &&
                                (_model.uploadedLocalFile_carUploaded13.bytes
                                        ?.isNotEmpty ??
                                    false)) {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 12.0),
                                child: Container(
                                  width: 200.0,
                                  height: 200.0,
                                  decoration: BoxDecoration(),
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              child:
                                                  FlutterFlowExpandedImageView(
                                                image: Image.memory(
                                                  _model.uploadedLocalFile_carUploaded13
                                                          .bytes ??
                                                      Uint8List.fromList([]),
                                                  fit: BoxFit.contain,
                                                ),
                                                allowRotation: false,
                                                tag: 'imageTag13',
                                                useHeroAnimation: true,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Hero(
                                          tag: 'imageTag13',
                                          transitionOnUserGestures: true,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.memory(
                                              _model.uploadedLocalFile_carUploaded13
                                                      .bytes ??
                                                  Uint8List.fromList([]),
                                              width: 200.0,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 4.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.black,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 35.0,
                                            fillColor: Colors.white,
                                            icon: Icon(
                                              Icons.close_rounded,
                                              color: Color(0xFFFF0000),
                                              size: 18.0,
                                            ),
                                            onPressed: () async {
                                              safeSetState(() {
                                                _model.isDataUploading_carUploaded12 =
                                                    false;
                                                _model.uploadedLocalFile_carUploaded12 =
                                                    FFUploadedFile(
                                                        bytes:
                                                            Uint8List.fromList(
                                                                []),
                                                        originalFilename: '');
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 12.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(widget!
                                                            .carConfig!
                                                            .contains(widget!
                                                                .impoundCarParamSet
                                                                ?.improundCONTNOTYPE)
                                                        ? 'คุณต้องการจะถ่ายรูป แผ่นเพลทรถ หรือไม่?'
                                                        : 'คุณต้องการจะถ่ายรูป อื่นๆหรือไม่?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: Text('ยกเลิก'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child: Text('ถ่ายรูป'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (!confirmDialogResponse) {
                                      return;
                                    }
                                    final selectedMedia = await selectMedia(
                                      imageQuality: 30,
                                      multiImage: false,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      safeSetState(() =>
                                          _model.isDataUploading_carUploaded13 =
                                              true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                  originalFilename:
                                                      m.originalFilename,
                                                ))
                                            .toList();
                                      } finally {
                                        _model.isDataUploading_carUploaded13 =
                                            false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                          selectedMedia.length) {
                                        safeSetState(() {
                                          _model.uploadedLocalFile_carUploaded13 =
                                              selectedUploadedFiles.first;
                                        });
                                      } else {
                                        safeSetState(() {});
                                        return;
                                      }
                                    }

                                    if (_model.uploadedLocalFile_carUploaded13 !=
                                            null &&
                                        (_model.uploadedLocalFile_carUploaded13
                                                .bytes?.isNotEmpty ??
                                            false)) {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'ถ่ายรูปสำเร็จ!',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Colors.black,
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'ถ่ายรูปล้มเหลว กรุณาถ่ายรูปอีกครั้ง',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Colors.black,
                                        ),
                                      );
                                      return;
                                    }
                                  },
                                  child: wrapWithModel(
                                    model: _model.captureCameraWidgetModel13,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CaptureCameraWidgetWidget(),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        Divider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).accent4,
                        ),
                      ],
                    ),
                  if (functions.getBoolValueInJson(functions.getDataFromMapJson(
                          functions.getDataFromMapJson(
                              widget!.saveAccessRoleData, widget!.step),
                          'allow_16_pic')) ??
                      true)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                if (functions.getBoolValueInJson(
                                        functions.getDataFromMapJson(
                                            functions.getDataFromMapJson(
                                                widget!.saveAccessRoleData,
                                                widget!.step),
                                            'deliver_image_required')) ??
                                    false) {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Container(
                                      height: 25.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                '14.',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                'อื่นๆ (ถ้ามี)',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Container(
                                      height: 25.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                '13.',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                'อื่นๆ (ถ้ามี)',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 12.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 45.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 20,
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.74,
                                          height: 100.0,
                                          decoration: BoxDecoration(),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  final selectedMedia =
                                                      await selectMedia(
                                                    imageQuality: 30,
                                                    multiImage: false,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() => _model
                                                            .isDataUploading_car44Uploaded13 =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                    originalFilename:
                                                                        m.originalFilename,
                                                                  ))
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading_car44Uploaded13 =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile_car44Uploaded13 =
                                                            selectedUploadedFiles
                                                                .first;
                                                      });
                                                    } else {
                                                      safeSetState(() {});
                                                      return;
                                                    }
                                                  }

                                                  if (_model.uploadedLocalFile_car44Uploaded13 !=
                                                          null &&
                                                      (_model
                                                              .uploadedLocalFile_car44Uploaded13
                                                              .bytes
                                                              ?.isNotEmpty ??
                                                          false)) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'อัพโหลดรูปสำเร็จ!',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 3000),
                                                        backgroundColor:
                                                            Colors.black,
                                                      ),
                                                    );
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'อัพโหลดรูปล้มเหลว กรุณาอัพโหลดรูปอีกครั้ง',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 3000),
                                                        backgroundColor:
                                                            Colors.black,
                                                      ),
                                                    );
                                                    return;
                                                  }
                                                },
                                                text: 'อัพโหลดรูป',
                                                options: FFButtonOptions(
                                                  width: 125.0,
                                                  height: 45.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFFE6400),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        7.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'สถานะ :',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  _model.uploadedLocalFile_car44Uploaded13 !=
                                                              null &&
                                                          (_model
                                                                  .uploadedLocalFile_car44Uploaded13
                                                                  .bytes
                                                                  ?.isNotEmpty ??
                                                              false)
                                                      ? 'อัพโหลดสำเร็จ'
                                                      : 'ยังไม่อัพโหลด',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.uploadedLocalFile_car44Uploaded13 !=
                                                    null &&
                                                (_model.uploadedLocalFile_car44Uploaded13
                                                        .bytes?.isNotEmpty ??
                                                    false)) {
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Container(
                                                        width: 20.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFFAFAFA),
                                                        ),
                                                        child: Icon(
                                                          Icons
                                                              .check_circle_rounded,
                                                          color:
                                                              Color(0xFF24BF03),
                                                          size: 20.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Container(
                                                  width: 20.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFAFAFA),
                                                  ),
                                                  child: Icon(
                                                    Icons.cancel_rounded,
                                                    color: Color(0xFFE21C3D),
                                                    size: 20.0,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                if (_model.uploadedLocalFile_car44Uploaded13 !=
                                        null &&
                                    (_model.uploadedLocalFile_car44Uploaded13
                                            .bytes?.isNotEmpty ??
                                        false)) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: Container(
                                          width: 200.0,
                                          height: 200.0,
                                          decoration: BoxDecoration(),
                                          child: Stack(
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          FlutterFlowExpandedImageView(
                                                        image: Image.memory(
                                                          _model.uploadedLocalFile_car44Uploaded13
                                                                  .bytes ??
                                                              Uint8List
                                                                  .fromList([]),
                                                          fit: BoxFit.contain,
                                                        ),
                                                        allowRotation: false,
                                                        tag: 'imageTag14',
                                                        useHeroAnimation: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Hero(
                                                  tag: 'imageTag14',
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.memory(
                                                      _model.uploadedLocalFile_car44Uploaded13
                                                              .bytes ??
                                                          Uint8List.fromList(
                                                              []),
                                                      width: 200.0,
                                                      height: 200.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 4.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor: Colors.black,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 35.0,
                                                    fillColor: Colors.white,
                                                    icon: Icon(
                                                      Icons.close_rounded,
                                                      color: Color(0xFFFF0000),
                                                      size: 18.0,
                                                    ),
                                                    onPressed: () async {
                                                      safeSetState(() {
                                                        _model.isDataUploading_car44Uploaded13 =
                                                            false;
                                                        _model.uploadedLocalFile_car44Uploaded13 =
                                                            FFUploadedFile(
                                                                bytes: Uint8List
                                                                    .fromList(
                                                                        []),
                                                                originalFilename:
                                                                    '');
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
                                      ),
                                    ],
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                if (functions.getBoolValueInJson(
                                        functions.getDataFromMapJson(
                                            functions.getDataFromMapJson(
                                                widget!.saveAccessRoleData,
                                                widget!.step),
                                            'deliver_image_required')) ??
                                    false) {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Container(
                                      height: 25.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                '15.',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                'อื่นๆ (ถ้ามี)',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Container(
                                      height: 25.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                '14.',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                'อื่นๆ (ถ้ามี)',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 12.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 45.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 20,
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.74,
                                          height: 100.0,
                                          decoration: BoxDecoration(),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  final selectedMedia =
                                                      await selectMedia(
                                                    imageQuality: 30,
                                                    multiImage: false,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() => _model
                                                            .isDataUploading_car4Uploaded14 =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                    originalFilename:
                                                                        m.originalFilename,
                                                                  ))
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading_car4Uploaded14 =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile_car4Uploaded14 =
                                                            selectedUploadedFiles
                                                                .first;
                                                      });
                                                    } else {
                                                      safeSetState(() {});
                                                      return;
                                                    }
                                                  }

                                                  if (_model.uploadedLocalFile_car4Uploaded14 !=
                                                          null &&
                                                      (_model
                                                              .uploadedLocalFile_car4Uploaded14
                                                              .bytes
                                                              ?.isNotEmpty ??
                                                          false)) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'อัพโหลดรูปสำเร็จ!',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 3000),
                                                        backgroundColor:
                                                            Colors.black,
                                                      ),
                                                    );
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'อัพโหลดรูปล้มเหลว กรุณาอัพโหลดรูปอีกครั้ง',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 3000),
                                                        backgroundColor:
                                                            Colors.black,
                                                      ),
                                                    );
                                                    return;
                                                  }
                                                },
                                                text: 'อัพโหลดรูป',
                                                options: FFButtonOptions(
                                                  width: 125.0,
                                                  height: 45.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFFE6400),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        7.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'สถานะ :',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  _model.uploadedLocalFile_car4Uploaded14 !=
                                                              null &&
                                                          (_model
                                                                  .uploadedLocalFile_car4Uploaded14
                                                                  .bytes
                                                                  ?.isNotEmpty ??
                                                              false)
                                                      ? 'อัพโหลดสำเร็จ'
                                                      : 'ยังไม่อัพโหลด',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.uploadedLocalFile_car4Uploaded14 !=
                                                    null &&
                                                (_model.uploadedLocalFile_car4Uploaded14
                                                        .bytes?.isNotEmpty ??
                                                    false)) {
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Container(
                                                        width: 20.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFFAFAFA),
                                                        ),
                                                        child: Icon(
                                                          Icons
                                                              .check_circle_rounded,
                                                          color:
                                                              Color(0xFF24BF03),
                                                          size: 20.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Container(
                                                  width: 20.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFAFAFA),
                                                  ),
                                                  child: Icon(
                                                    Icons.cancel_rounded,
                                                    color: Color(0xFFE21C3D),
                                                    size: 20.0,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                if (_model.uploadedLocalFile_car4Uploaded14 !=
                                        null &&
                                    (_model.uploadedLocalFile_car4Uploaded14
                                            .bytes?.isNotEmpty ??
                                        false)) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: Container(
                                          width: 200.0,
                                          height: 200.0,
                                          decoration: BoxDecoration(),
                                          child: Stack(
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          FlutterFlowExpandedImageView(
                                                        image: Image.memory(
                                                          _model.uploadedLocalFile_car4Uploaded14
                                                                  .bytes ??
                                                              Uint8List
                                                                  .fromList([]),
                                                          fit: BoxFit.contain,
                                                        ),
                                                        allowRotation: false,
                                                        tag: 'imageTag15',
                                                        useHeroAnimation: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Hero(
                                                  tag: 'imageTag15',
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.memory(
                                                      _model.uploadedLocalFile_car4Uploaded14
                                                              .bytes ??
                                                          Uint8List.fromList(
                                                              []),
                                                      width: 200.0,
                                                      height: 200.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 4.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor: Colors.black,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 35.0,
                                                    fillColor: Colors.white,
                                                    icon: Icon(
                                                      Icons.close_rounded,
                                                      color: Color(0xFFFF0000),
                                                      size: 18.0,
                                                    ),
                                                    onPressed: () async {
                                                      safeSetState(() {
                                                        _model.isDataUploading_car4Uploaded14 =
                                                            false;
                                                        _model.uploadedLocalFile_car4Uploaded14 =
                                                            FFUploadedFile(
                                                                bytes: Uint8List
                                                                    .fromList(
                                                                        []),
                                                                originalFilename:
                                                                    '');
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
                                      ),
                                    ],
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                if (functions.getBoolValueInJson(
                                        functions.getDataFromMapJson(
                                            functions.getDataFromMapJson(
                                                widget!.saveAccessRoleData,
                                                widget!.step),
                                            'deliver_image_required')) ??
                                    false) {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Container(
                                      height: 25.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                '16.',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                'อื่นๆ (ถ้ามี)',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Container(
                                      height: 25.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                '15.',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                'อื่นๆ (ถ้ามี)',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 12.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 45.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 20,
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.74,
                                          height: 100.0,
                                          decoration: BoxDecoration(),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  final selectedMedia =
                                                      await selectMedia(
                                                    imageQuality: 30,
                                                    multiImage: false,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() => _model
                                                            .isDataUploading_car44Uploaded15 =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                    originalFilename:
                                                                        m.originalFilename,
                                                                  ))
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading_car44Uploaded15 =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile_car44Uploaded15 =
                                                            selectedUploadedFiles
                                                                .first;
                                                      });
                                                    } else {
                                                      safeSetState(() {});
                                                      return;
                                                    }
                                                  }

                                                  if (_model.uploadedLocalFile_car44Uploaded15 !=
                                                          null &&
                                                      (_model
                                                              .uploadedLocalFile_car44Uploaded15
                                                              .bytes
                                                              ?.isNotEmpty ??
                                                          false)) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'อัพโหลดรูปสำเร็จ!',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 3000),
                                                        backgroundColor:
                                                            Colors.black,
                                                      ),
                                                    );
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'อัพโหลดรูปล้มเหลว กรุณาอัพโหลดรูปอีกครั้ง',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 3000),
                                                        backgroundColor:
                                                            Colors.black,
                                                      ),
                                                    );
                                                    return;
                                                  }
                                                },
                                                text: 'อัพโหลดรูป',
                                                options: FFButtonOptions(
                                                  width: 125.0,
                                                  height: 45.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFFE6400),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        7.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'สถานะ :',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  _model.uploadedLocalFile_car44Uploaded15 !=
                                                              null &&
                                                          (_model
                                                                  .uploadedLocalFile_car44Uploaded15
                                                                  .bytes
                                                                  ?.isNotEmpty ??
                                                              false)
                                                      ? 'อัพโหลดสำเร็จ'
                                                      : 'ยังไม่อัพโหลด',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.uploadedLocalFile_car44Uploaded15 !=
                                                    null &&
                                                (_model.uploadedLocalFile_car44Uploaded15
                                                        .bytes?.isNotEmpty ??
                                                    false)) {
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Container(
                                                        width: 20.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFFAFAFA),
                                                        ),
                                                        child: Icon(
                                                          Icons
                                                              .check_circle_rounded,
                                                          color:
                                                              Color(0xFF24BF03),
                                                          size: 20.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Container(
                                                  width: 20.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFAFAFA),
                                                  ),
                                                  child: Icon(
                                                    Icons.cancel_rounded,
                                                    color: Color(0xFFE21C3D),
                                                    size: 20.0,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                if (_model.uploadedLocalFile_car44Uploaded15 !=
                                        null &&
                                    (_model.uploadedLocalFile_car44Uploaded15
                                            .bytes?.isNotEmpty ??
                                        false)) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: Container(
                                          width: 200.0,
                                          height: 200.0,
                                          decoration: BoxDecoration(),
                                          child: Stack(
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          FlutterFlowExpandedImageView(
                                                        image: Image.memory(
                                                          _model.uploadedLocalFile_car44Uploaded15
                                                                  .bytes ??
                                                              Uint8List
                                                                  .fromList([]),
                                                          fit: BoxFit.contain,
                                                        ),
                                                        allowRotation: false,
                                                        tag: 'imageTag16',
                                                        useHeroAnimation: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Hero(
                                                  tag: 'imageTag16',
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.memory(
                                                      _model.uploadedLocalFile_car44Uploaded15
                                                              .bytes ??
                                                          Uint8List.fromList(
                                                              []),
                                                      width: 200.0,
                                                      height: 200.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 4.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor: Colors.black,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 35.0,
                                                    fillColor: Colors.white,
                                                    icon: Icon(
                                                      Icons.close_rounded,
                                                      color: Color(0xFFFF0000),
                                                      size: 18.0,
                                                    ),
                                                    onPressed: () async {
                                                      safeSetState(() {
                                                        _model.isDataUploading_car44Uploaded15 =
                                                            false;
                                                        _model.uploadedLocalFile_car44Uploaded15 =
                                                            FFUploadedFile(
                                                                bytes: Uint8List
                                                                    .fromList(
                                                                        []),
                                                                originalFilename:
                                                                    '');
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
                                      ),
                                    ],
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                if (functions.getBoolValueInJson(
                                        functions.getDataFromMapJson(
                                            functions.getDataFromMapJson(
                                                widget!.saveAccessRoleData,
                                                widget!.step),
                                            'deliver_image_required')) ??
                                    false) {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Container(
                                      height: 25.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                '17.',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                'อื่นๆ (ถ้ามี)',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Container(
                                      height: 25.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 20.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                '16.',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFAFAFA),
                                              ),
                                              child: Text(
                                                'อื่นๆ (ถ้ามี)',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF404040),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 12.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 45.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 20,
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.74,
                                          height: 100.0,
                                          decoration: BoxDecoration(),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  final selectedMedia =
                                                      await selectMedia(
                                                    imageQuality: 30,
                                                    multiImage: false,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() => _model
                                                            .isDataUploading_car4Uploaded16 =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                    originalFilename:
                                                                        m.originalFilename,
                                                                  ))
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading_car4Uploaded16 =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile_car4Uploaded16 =
                                                            selectedUploadedFiles
                                                                .first;
                                                      });
                                                    } else {
                                                      safeSetState(() {});
                                                      return;
                                                    }
                                                  }

                                                  if (_model.uploadedLocalFile_car4Uploaded16 !=
                                                          null &&
                                                      (_model
                                                              .uploadedLocalFile_car4Uploaded16
                                                              .bytes
                                                              ?.isNotEmpty ??
                                                          false)) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'อัพโหลดรูปสำเร็จ!',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 3000),
                                                        backgroundColor:
                                                            Colors.black,
                                                      ),
                                                    );
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .clearSnackBars();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'อัพโหลดรูปล้มเหลว กรุณาอัพโหลดรูปอีกครั้ง',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 3000),
                                                        backgroundColor:
                                                            Colors.black,
                                                      ),
                                                    );
                                                    return;
                                                  }
                                                },
                                                text: 'อัพโหลดรูป',
                                                options: FFButtonOptions(
                                                  width: 125.0,
                                                  height: 45.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFFE6400),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        7.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'สถานะ :',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  _model.uploadedLocalFile_car4Uploaded16 !=
                                                              null &&
                                                          (_model
                                                                  .uploadedLocalFile_car4Uploaded16
                                                                  .bytes
                                                                  ?.isNotEmpty ??
                                                              false)
                                                      ? 'อัพโหลดสำเร็จ'
                                                      : 'ยังไม่อัพโหลด',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.uploadedLocalFile_car4Uploaded16 !=
                                                    null &&
                                                (_model.uploadedLocalFile_car4Uploaded16
                                                        .bytes?.isNotEmpty ??
                                                    false)) {
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Container(
                                                        width: 20.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFFAFAFA),
                                                        ),
                                                        child: Icon(
                                                          Icons
                                                              .check_circle_rounded,
                                                          color:
                                                              Color(0xFF24BF03),
                                                          size: 20.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Container(
                                                  width: 20.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFAFAFA),
                                                  ),
                                                  child: Icon(
                                                    Icons.cancel_rounded,
                                                    color: Color(0xFFE21C3D),
                                                    size: 20.0,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                if (_model.uploadedLocalFile_car4Uploaded16 !=
                                        null &&
                                    (_model.uploadedLocalFile_car4Uploaded16
                                            .bytes?.isNotEmpty ??
                                        false)) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: Container(
                                          width: 200.0,
                                          height: 200.0,
                                          decoration: BoxDecoration(),
                                          child: Stack(
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          FlutterFlowExpandedImageView(
                                                        image: Image.memory(
                                                          _model.uploadedLocalFile_car4Uploaded16
                                                                  .bytes ??
                                                              Uint8List
                                                                  .fromList([]),
                                                          fit: BoxFit.contain,
                                                        ),
                                                        allowRotation: false,
                                                        tag: 'imageTag17',
                                                        useHeroAnimation: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Hero(
                                                  tag: 'imageTag17',
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.memory(
                                                      _model.uploadedLocalFile_car4Uploaded16
                                                              .bytes ??
                                                          Uint8List.fromList(
                                                              []),
                                                      width: 200.0,
                                                      height: 200.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 4.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor: Colors.black,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 35.0,
                                                    fillColor: Colors.white,
                                                    icon: Icon(
                                                      Icons.close_rounded,
                                                      color: Color(0xFFFF0000),
                                                      size: 18.0,
                                                    ),
                                                    onPressed: () async {
                                                      safeSetState(() {
                                                        _model.isDataUploading_car4Uploaded16 =
                                                            false;
                                                        _model.uploadedLocalFile_car4Uploaded16 =
                                                            FFUploadedFile(
                                                                bytes: Uint8List
                                                                    .fromList(
                                                                        []),
                                                                originalFilename:
                                                                    '');
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
                                      ),
                                    ],
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (((FFAppState().profileLevel == 'สาขา') ||
                                  (FFAppState().profileLevel == 'เขต') ||
                                  (FFAppState().profileLevel == 'ภาค')
                              ? (functions.containsValueInJsonList(
                                      functions.getDataFromMapJson(
                                          functions.getDataFromMapJson(
                                              widget!.saveAccessRoleData,
                                              widget!.step),
                                          'price_edit_level'),
                                      FFAppState().profileLevel)! &&
                                  (functions.getListStringFromJson(functions.getDataFromMapJson(functions.getDataFromMapJson(widget!.saveAccessRoleData, widget!.step), 'position_name')) != null && (functions.getListStringFromJson(functions.getDataFromMapJson(functions.getDataFromMapJson(widget!.saveAccessRoleData, widget!.step), 'position_name')))!.isNotEmpty
                                      ? functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.saveAccessRoleData,
                                                  widget!.step),
                                              'position_name'),
                                          FFAppState().profilePositionName)!
                                      : true))
                              : functions.containsValueInJsonList(
                                  functions.getDataFromMapJson(functions.getDataFromMapJson(widget!.saveAccessRoleData, widget!.step), 'price_edit_role'),
                                  widget!.userRoleSave)) ??
                          true)
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 20.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'ราคา',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF404040),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (functions.getBoolValueInJson(
                                              functions.getDataFromMapJson(
                                                  functions.getDataFromMapJson(
                                                      widget!
                                                          .saveAccessRoleData,
                                                      widget!.step),
                                                  'price_is_required')) ??
                                          false) {
                                        return Text(
                                          '(บังคับกรอก)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFFFF0000),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        );
                                      } else {
                                        return Text(
                                          '(ถ้ามี)',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF404040),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 8.0, 15.0, 0.0),
                                    child: Container(
                                      width: 100.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: Color(0xFF404040),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: TextFormField(
                                          controller: _model
                                              .priceTextFieldTextController,
                                          focusNode:
                                              _model.priceTextFieldFocusNode,
                                          autofocus: false,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                            hintText: 'กรอกราคา...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          maxLines: null,
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          validator: _model
                                              .priceTextFieldTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 20.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'เหตุผล',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF404040),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              '(ถ้ามี)',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF404040),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 8.0, 15.0, 0.0),
                              child: Container(
                                width: 100.0,
                                height: 137.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0xFF404040),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller:
                                        _model.remarkTextFieldTextController,
                                    focusNode: _model.remarkTextFieldFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      hintText: 'กรอกหมายเหตุ...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    maxLines: null,
                                    validator: _model
                                        .remarkTextFieldTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 24.0, 12.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              var _shouldSetState = false;
                              if (_model.uploadedLocalFile_carUploaded01 == null ||
                                  (_model.uploadedLocalFile_carUploaded01.bytes
                                          ?.isEmpty ??
                                      true)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content:
                                            Text('กรุณาถ่ายรูปตำแหน่ง หน้าตรง'),
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
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else if (_model.uploadedLocalFile_carUploaded02 == null ||
                                  (_model.uploadedLocalFile_carUploaded02.bytes
                                          ?.isEmpty ??
                                      true)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            'กรุณาถ่ายรูปตำแหน่ง หน้าซ้าย 45 องศา'),
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
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else if (_model.uploadedLocalFile_carUploaded03 == null ||
                                  (_model.uploadedLocalFile_carUploaded03.bytes
                                          ?.isEmpty ??
                                      true)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            'กรุณาถ่ายรูปตำแหน่ง หลังซ้าย 45 องศา'),
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
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else if (_model.uploadedLocalFile_carUploaded04 == null ||
                                  (_model.uploadedLocalFile_carUploaded04.bytes
                                          ?.isEmpty ??
                                      true)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content:
                                            Text('กรุณาถ่ายรูปตำแหน่ง หลังตรง'),
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
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else if (_model.uploadedLocalFile_carUploaded05 == null ||
                                  (_model.uploadedLocalFile_carUploaded05.bytes
                                          ?.isEmpty ??
                                      true)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            'กรุณาถ่ายรูปตำแหน่ง หลังขวา 45 องศา'),
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
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else if (_model.uploadedLocalFile_carUploaded06 == null ||
                                  (_model.uploadedLocalFile_carUploaded06.bytes
                                          ?.isEmpty ??
                                      true)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            'กรุณาถ่ายรูปตำแหน่ง หน้าขวา 45 องศา'),
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
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else if (_model.uploadedLocalFile_carUploaded07 == null ||
                                  (_model.uploadedLocalFile_carUploaded07.bytes
                                          ?.isEmpty ??
                                      true)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(widget!.impoundCarParamSet
                                                    ?.improundCONTNOTYPE ==
                                                'C'
                                            ? 'กรุณาถ่ายรูปตำแหน่ง เลขไมล์'
                                            : 'กรุณาถ่ายรูปตำแหน่ง เลขตัวถังรถ'),
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
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else if (_model.uploadedLocalFile_carUploaded08 ==
                                      null ||
                                  (_model.uploadedLocalFile_carUploaded08.bytes
                                          ?.isEmpty ??
                                      true)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(widget!.carConfig!
                                                .contains(widget!
                                                    .impoundCarParamSet
                                                    ?.improundCONTNOTYPE)
                                            ? 'กรุณาถ่ายรูปตำแหน่ง คอนโซลหน้า'
                                            : 'กรุณาถ่ายรูปตำแหน่ง รูปเครื่องยนต์'),
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
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }

                              if (_model.uploadedLocalFile_carUploaded09 ==
                                      null ||
                                  (_model.uploadedLocalFile_carUploaded09.bytes
                                          ?.isEmpty ??
                                      true)) {
                                if (!widget!.carConfig!.contains(widget!
                                    .impoundCarParamSet?.improundCONTNOTYPE)) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              'กรุณาถ่ายรูปตำแหน่ง เลขไมล์'),
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
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }
                              if (_model.uploadedLocalFile_carUploaded10 ==
                                      null ||
                                  (_model.uploadedLocalFile_carUploaded10.bytes
                                          ?.isEmpty ??
                                      true)) {
                                if (widget!.carConfig!.contains(widget!
                                    .impoundCarParamSet?.improundCONTNOTYPE)) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              'กรุณาถ่ายรูปตำแหน่ง เครื่องยนต์'),
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
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }
                              if (_model.uploadedLocalFile_carUploaded11 ==
                                      null ||
                                  (_model.uploadedLocalFile_carUploaded11.bytes
                                          ?.isEmpty ??
                                      true)) {
                                if (widget!.carConfig!.contains(widget!
                                    .impoundCarParamSet?.improundCONTNOTYPE)) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              'กรุณาถ่ายรูปตำแหน่ง เลขตัวถังรถ'),
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
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }
                              if (functions.getBoolValueInJson(
                                  functions.getDataFromMapJson(
                                      functions.getDataFromMapJson(
                                          widget!.saveAccessRoleData,
                                          widget!.step),
                                      'deliver_image_required'))!) {
                                if (!(_model.uploadedLocalFile_carUploaded13 !=
                                        null &&
                                    (_model.uploadedLocalFile_carUploaded13
                                            .bytes?.isNotEmpty ??
                                        false))) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              'กรุณาถ่ายรูป  พนักงานรับรถคู่กับรถ'),
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
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }
                              if (functions.getBoolValueInJson(
                                  functions.getDataFromMapJson(
                                      functions.getDataFromMapJson(
                                          widget!.saveAccessRoleData,
                                          widget!.step),
                                      'price_is_required'))!) {
                                if ((FFAppState().profileLevel == 'สาขา') ||
                                        (FFAppState().profileLevel == 'เขต') ||
                                        (FFAppState().profileLevel == 'ภาค')
                                    ? (functions.containsValueInJsonList(
                                            functions.getDataFromMapJson(
                                                functions.getDataFromMapJson(
                                                    widget!.saveAccessRoleData,
                                                    widget!.step),
                                                'price_edit_level'),
                                            FFAppState().profileLevel)! &&
                                        (functions.getDataFromMapJson(functions.getDataFromMapJson(widget!.saveAccessRoleData, widget!.step), 'position_name') != null
                                            ? functions.containsValueInJsonList(
                                                functions.getDataFromMapJson(
                                                    functions.getDataFromMapJson(
                                                        widget!
                                                            .saveAccessRoleData,
                                                        widget!.step),
                                                    'position_name'),
                                                FFAppState()
                                                    .profilePositionName)!
                                            : true))
                                    : functions.containsValueInJsonList(
                                        functions.getDataFromMapJson(
                                            functions.getDataFromMapJson(widget!.saveAccessRoleData, widget!.step),
                                            'price_edit_role'),
                                        widget!.userRoleSave)!) {
                                  if (!((_model.priceTextFieldTextController
                                              .text !=
                                          '') &&
                                      functions.validatePriceImpound(functions
                                          .removeCommaFromNumText(_model
                                              .priceTextFieldTextController
                                              .text))!)) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'กรุณากรอกราคาประมูลและกรุณากรอกราคาไม่เกิน 8 หลัก'),
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
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                  if (!(double.parse(functions
                                          .removeCommaFromNumText(_model
                                              .priceTextFieldTextController
                                              .text)) >
                                      0.0)) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'กรุณากรอกราคาประมูลมากกว่า 0 บาท'),
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
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                }
                              } else {
                                if ((_model.priceTextFieldTextController.text !=
                                        '') &&
                                    true) {
                                  if (!(double.parse(functions
                                          .removeCommaFromNumText(_model
                                              .priceTextFieldTextController
                                              .text)) >
                                      0.0)) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'หากกรอกราคา กรุณากรอกราคามากกว่า 0 บาท'),
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
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                  if (!functions.validatePriceImpound(
                                      functions.removeCommaFromNumText(_model
                                          .priceTextFieldTextController
                                          .text))!) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'กรุณากรอกราคาไม่เกิน 8 หลัก'),
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
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                }
                              }

                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'คุณต้องการจะบันทึกข้อมูลหรือไม่?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('ยกเลิก'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('บันทึก'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ) ??
                                      false;
                              if (!confirmDialogResponse) {
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: double.infinity,
                                          child: LoadingSceneInsuranceWidget(),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              _model.tempImpoundCarParamSet =
                                  widget!.impoundCarParamSet;
                              safeSetState(() {});
                              if ((FFAppState().profileLevel == 'สาขา') ||
                                      (FFAppState().profileLevel == 'เขต') ||
                                      (FFAppState().profileLevel == 'ภาค')
                                  ? functions.containsValueInJsonList(
                                      functions.getDataFromMapJson(
                                          functions.getDataFromMapJson(
                                              widget!.saveAccessRoleData,
                                              widget!.step),
                                          'price_edit_level'),
                                      FFAppState().profileLevel)!
                                  : functions.containsValueInJsonList(
                                      functions.getDataFromMapJson(
                                          functions.getDataFromMapJson(
                                              widget!.saveAccessRoleData,
                                              widget!.step),
                                          'price_edit_role'),
                                      widget!.userRoleSave)!) {
                                _model.updateTempImpoundCarParamSetStruct(
                                  (e) => e
                                    ..impoundPrice = ((FFAppState().profileLevel == 'สาขา') ||
                                                (FFAppState().profileLevel ==
                                                    'เขต') ||
                                                (FFAppState().profileLevel ==
                                                    'ภาค')
                                            ? functions.containsValueInJsonList(
                                                functions.getDataFromMapJson(
                                                    functions.getDataFromMapJson(
                                                        widget!
                                                            .saveAccessRoleData,
                                                        widget!.step),
                                                    'price_edit_level'),
                                                FFAppState().profileLevel)!
                                            : functions.containsValueInJsonList(
                                                functions.getDataFromMapJson(
                                                    functions.getDataFromMapJson(
                                                        widget!
                                                            .saveAccessRoleData,
                                                        widget!.step),
                                                    'price_edit_role'),
                                                widget!.userRoleSave)!)
                                        ? (_model.priceTextFieldTextController.text != ''
                                            ? functions.removeCommaFromNumText(_model.priceTextFieldTextController.text)
                                            : '0.00')
                                        : '0.00',
                                );
                                safeSetState(() {});
                              }
                              _model.uploadGoogleDriveApiOutput =
                                  await UploadImagesGoogleDriveGroup
                                      .uploadGoogleDriveAPICall
                                      .call(
                                projectName: !FFAppState().isProductionNew
                                    ? 'impound_car_dev_test'
                                    : 'impound_car',
                                contractNumber:
                                    '${widget!.impoundCarParamSet?.improundCONTNO}',
                                step: widget!.step,
                                titleCust:
                                    '${widget!.impoundCarParamSet?.improundTITLE}',
                                firstnameCust:
                                    '${widget!.impoundCarParamSet?.improundFNAME}',
                                lastnameCust:
                                    '${widget!.impoundCarParamSet?.improundSNAME}',
                                typeContract:
                                    '${widget!.impoundCarParamSet?.improundCONTNOTYPE}',
                                branchCode: FFAppState().profileBranch,
                                branchName: FFAppState().profileUnitCodeName,
                                nameTh: FFAppState().profileFullName,
                                productName:
                                    '${widget!.impoundCarParamSet?.improundGDESC}',
                                productCode:
                                    '${widget!.impoundCarParamSet?.improundGCODE}',
                                numBody:
                                    '${widget!.impoundCarParamSet?.improundNumbody}',
                                registrationCar:
                                    '${widget!.impoundCarParamSet?.improundREGNO}',
                                registrationProve:
                                    '${widget!.impoundCarParamSet?.improundREGPROV}',
                                contnoTypeName:
                                    '${widget!.impoundCarParamSet?.improundCONTNOTYPENAME}',
                                userid: FFAppState().employeeID,
                                locat:
                                    '${widget!.impoundCarParamSet?.improundLOCAT}',
                                remark: functions.replaceEnterInStringText((_model
                                                    .remarkTextFieldTextController
                                                    .text !=
                                                null &&
                                            _model.remarkTextFieldTextController
                                                    .text !=
                                                '') &&
                                        (_model.remarkTextFieldTextController
                                                .text !=
                                            '')
                                    ? '${_model.remarkTextFieldTextController.text}'
                                    : ''),
                                images1: _model.uploadedLocalFile_carUploaded01,
                                images2: _model.uploadedLocalFile_carUploaded02,
                                images3: _model.uploadedLocalFile_carUploaded03,
                                images4: _model.uploadedLocalFile_carUploaded04,
                                images5: _model.uploadedLocalFile_carUploaded05,
                                images6: _model.uploadedLocalFile_carUploaded06,
                                images7: _model.uploadedLocalFile_carUploaded07,
                                images8: _model.uploadedLocalFile_carUploaded08,
                                images9: _model.uploadedLocalFile_carUploaded09,
                                images10:
                                    _model.uploadedLocalFile_carUploaded10,
                                images11:
                                    _model.uploadedLocalFile_carUploaded11,
                                images12:
                                    _model.uploadedLocalFile_carUploaded12,
                                cuscod:
                                    widget!.impoundCarParamSet?.improundCUSCOD,
                                url: FFAppState().improundUrl,
                                statusCode: (widget!.step != 'step1') &&
                                        (widget!.step != 'document')
                                    ? '11'
                                    : '',
                                statusName: (widget!.step != 'step1') &&
                                        (widget!.step != 'document')
                                    ? 'เปลี่ยนเป็นเป้า W'
                                    : '',
                                originYear:
                                    widget!.impoundCarParamSet?.improundMANUYR,
                                convertYear: widget!
                                    .impoundCarParamSet?.improundMANUYRCONVERT,
                                improundcarLocatId: widget!
                                    .impoundCarLocateParamSet
                                    ?.improundcarLocatId,
                                locatCode:
                                    widget!.impoundCarLocateParamSet?.locatCode,
                                locatName:
                                    widget!.impoundCarLocateParamSet?.locatName,
                                improundcarSubLocatId: widget!
                                    .impoundCarLocateParamSet
                                    ?.improundcarSubLocatId,
                                branchNameLocat: widget!
                                    .impoundCarLocateParamSet?.branchNameLocat,
                                improundcarStatusId: '',
                                arnow:
                                    widget!.impoundCarParamSet?.improundARNOW,
                                constat: widget!
                                    .impoundCarParamSet?.improundCONTSTAT,
                                typecod:
                                    widget!.impoundCarParamSet?.improundTYPECOD,
                                modelcod: widget!
                                    .impoundCarParamSet?.improundMODELCOD,
                                colorcod:
                                    widget!.impoundCarParamSet?.improudCOLORCOD,
                                address:
                                    widget!.impoundCarLocateParamSet?.address,
                                subDistrict: widget!
                                    .impoundCarLocateParamSet?.subDistrict,
                                district:
                                    widget!.impoundCarLocateParamSet?.district,
                                province:
                                    widget!.impoundCarLocateParamSet?.province,
                                postcode:
                                    widget!.impoundCarLocateParamSet?.postcode,
                                phoneNumber: widget!
                                    .impoundCarLocateParamSet?.phoneNumber,
                                latitude:
                                    widget!.impoundCarLocateParamSet?.latitude,
                                longitude:
                                    widget!.impoundCarLocateParamSet?.longitude,
                                branchCodeLocat: widget!
                                    .impoundCarLocateParamSet?.branchCodeLocat,
                                areaCode:
                                    widget!.impoundCarLocateParamSet?.areaCode,
                                areaName:
                                    widget!.impoundCarLocateParamSet?.areaName,
                                regionCode: widget!
                                    .impoundCarLocateParamSet?.regionCode,
                                regionName: widget!
                                    .impoundCarLocateParamSet?.regionName,
                                keyincshprc: widget!
                                    .impoundCarParamSet?.improundKEYINCSHPRC,
                                engno:
                                    widget!.impoundCarParamSet?.improundENGNO,
                                impoundEmp: '',
                                impoundDate: '',
                                impoundNameth: '',
                                impoundcarPrice: ((FFAppState().profileLevel ==
                                                'สาขา') ||
                                            (FFAppState().profileLevel ==
                                                'เขต') ||
                                            (FFAppState().profileLevel == 'ภาค')
                                        ? functions.containsValueInJsonList(
                                            functions.getDataFromMapJson(
                                                functions.getDataFromMapJson(
                                                    widget!.saveAccessRoleData,
                                                    widget!.step),
                                                'price_edit_level'),
                                            FFAppState().profileLevel)!
                                        : functions.containsValueInJsonList(
                                            functions.getDataFromMapJson(
                                                functions.getDataFromMapJson(
                                                    widget!.saveAccessRoleData,
                                                    widget!.step),
                                                'price_edit_role'),
                                            widget!.userRoleSave)!)
                                    ? (_model.priceTextFieldTextController
                                                .text !=
                                            ''
                                        ? functions.removeCommaFromNumText(
                                            _model.priceTextFieldTextController
                                                .text)
                                        : '0.00')
                                    : '0.00',
                                dbCode:
                                    widget!.impoundCarParamSet?.impoundDbCode,
                                dbName:
                                    widget!.impoundCarParamSet?.impoundDbName,
                                images13:
                                    _model.uploadedLocalFile_car44Uploaded13,
                                images14:
                                    _model.uploadedLocalFile_car4Uploaded14,
                                images15:
                                    _model.uploadedLocalFile_car44Uploaded15,
                                images16:
                                    _model.uploadedLocalFile_car4Uploaded16,
                                locatDelivercar: ((FFAppState().profileLevel ==
                                                'สาขา') ||
                                            (FFAppState().profileLevel ==
                                                'เขต') ||
                                            (FFAppState().profileLevel == 'ภาค')
                                        ? functions.containsValueInJsonList(
                                            functions.getDataFromMapJson(
                                                functions.getDataFromMapJson(
                                                    widget!.saveAccessRoleData,
                                                    widget!.step),
                                                'include_deliver_data_level'),
                                            FFAppState().profileLevel)!
                                        : functions.containsValueInJsonList(
                                            functions.getDataFromMapJson(
                                                functions.getDataFromMapJson(
                                                    widget!.saveAccessRoleData,
                                                    widget!.step),
                                                'include_deliver_data_role'),
                                            widget!.userRoleSave)!)
                                    ? widget!.impoundCarLocateParamSet
                                        ?.deliverLocateCode
                                    : '',
                                locatNameDelivercar: ((FFAppState().profileLevel ==
                                                'สาขา') ||
                                            (FFAppState().profileLevel ==
                                                'เขต') ||
                                            (FFAppState().profileLevel == 'ภาค')
                                        ? functions.containsValueInJsonList(
                                            functions.getDataFromMapJson(
                                                functions.getDataFromMapJson(
                                                    widget!.saveAccessRoleData,
                                                    widget!.step),
                                                'include_deliver_data_level'),
                                            FFAppState().profileLevel)!
                                        : functions.containsValueInJsonList(
                                            functions.getDataFromMapJson(
                                                functions.getDataFromMapJson(
                                                    widget!.saveAccessRoleData,
                                                    widget!.step),
                                                'include_deliver_data_role'),
                                            widget!.userRoleSave)!)
                                    ? widget!.impoundCarLocateParamSet
                                        ?.deliverLocateName
                                    : '',
                                logisticsComany: ((FFAppState().profileLevel ==
                                                'สาขา') ||
                                            (FFAppState().profileLevel ==
                                                'เขต') ||
                                            (FFAppState().profileLevel == 'ภาค')
                                        ? functions.containsValueInJsonList(
                                            functions.getDataFromMapJson(
                                                functions.getDataFromMapJson(
                                                    widget!.saveAccessRoleData,
                                                    widget!.step),
                                                'include_deliver_data_level'),
                                            FFAppState().profileLevel)!
                                        : functions.containsValueInJsonList(
                                            functions.getDataFromMapJson(
                                                functions.getDataFromMapJson(
                                                    widget!.saveAccessRoleData,
                                                    widget!.step),
                                                'include_deliver_data_role'),
                                            widget!.userRoleSave)!)
                                    ? widget!.impoundCarLocateParamSet
                                        ?.logisticsCompany
                                    : '',
                                receiver: ((FFAppState().profileLevel == 'สาขา') ||
                                            (FFAppState().profileLevel ==
                                                'เขต') ||
                                            (FFAppState().profileLevel == 'ภาค')
                                        ? functions.containsValueInJsonList(
                                            functions.getDataFromMapJson(
                                                functions.getDataFromMapJson(
                                                    widget!.saveAccessRoleData,
                                                    widget!.step),
                                                'include_deliver_data_level'),
                                            FFAppState().profileLevel)!
                                        : functions.containsValueInJsonList(
                                            functions.getDataFromMapJson(
                                                functions.getDataFromMapJson(
                                                    widget!.saveAccessRoleData,
                                                    widget!.step),
                                                'include_deliver_data_role'),
                                            widget!.userRoleSave)!)
                                    ? widget!.impoundCarLocateParamSet?.receiver
                                    : '',
                                images17:
                                    _model.uploadedLocalFile_carUploaded13,
                              );

                              _shouldSetState = true;
                              if ((_model.uploadGoogleDriveApiOutput
                                          ?.statusCode ??
                                      200) !=
                                  200) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            'พบข้อผิดพลาด Connection(${(_model.uploadGoogleDriveApiOutput?.statusCode ?? 200).toString()})'),
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
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }
                              if ('${getJsonField(
                                    (_model.uploadGoogleDriveApiOutput
                                            ?.jsonBody ??
                                        ''),
                                    r'''$.statuscode''',
                                  ).toString()}' !=
                                  '200') {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text('${getJsonField(
                                          (_model.uploadGoogleDriveApiOutput
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.message''',
                                        ).toString()}'),
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
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }
                              Navigator.pop(context);

                              context.goNamed(
                                CustomerCarDeailsPictureStep1Widget.routeName,
                                queryParameters: {
                                  'step': serializeParam(
                                    widget!.step,
                                    ParamType.String,
                                  ),
                                  'readAccessRoleData': serializeParam(
                                    widget!.readAccessRoleData,
                                    ParamType.JSON,
                                  ),
                                  'saveAccessRoleData': serializeParam(
                                    widget!.saveAccessRoleData,
                                    ParamType.JSON,
                                  ),
                                  'userRoleRead': serializeParam(
                                    widget!.userRoleRead,
                                    ParamType.String,
                                  ),
                                  'userRoleSave': serializeParam(
                                    widget!.userRoleSave,
                                    ParamType.String,
                                  ),
                                  'impoundCarParamSet': serializeParam(
                                    _model.tempImpoundCarParamSet,
                                    ParamType.DataStruct,
                                  ),
                                  'fromPage': serializeParam(
                                    'seeImages',
                                    ParamType.String,
                                  ),
                                  'impoundCarLocateParamSet': serializeParam(
                                    widget!.impoundCarLocateParamSet,
                                    ParamType.DataStruct,
                                  ),
                                  'impoundCarStatusName': serializeParam(
                                    '',
                                    ParamType.String,
                                  ),
                                  'carConfig': serializeParam(
                                    widget!.carConfig,
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'motocycleConfig': serializeParam(
                                    widget!.motocycleConfig,
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'editAccessRoleData': serializeParam(
                                    widget!.editAccessRoleData,
                                    ParamType.JSON,
                                  ),
                                  'userRoleEdit': serializeParam(
                                    widget!.userRoleEdit,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );

                              _model.tempImpoundCarParamSet = null;
                              safeSetState(() {});
                              if (_shouldSetState) safeSetState(() {});
                            },
                            text: 'บันทึก',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.45,
                              height: 60.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFD9761A),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].addToEnd(SizedBox(height: 50.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
